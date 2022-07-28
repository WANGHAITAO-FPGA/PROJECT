package VME

import PHPA82.ila_test.ila
import spinal.core._
import spinal.core.internals.Operator
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config}
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.Apb3BusInterface
import spinal.lib.io.{InOutWrapper, TriState}

case class VmeInterface() extends Bundle with IMasterSlave{
  val addr = Bits(24 bits)
  val data = TriState(Bits(32 bits))
  val am = Bits(6 bits)
  val as = Bool()
  val ds0 = Bool()
  val ds1 = Bool()
  val write = Bool()
  val lword = Bool()
  val iack = Bool()
  val dtack = Bool()
  val beer = Bool()
  val retry = Bool()
  val irq = Bits(7 bits)
  val iackin = Bool()
  val iackout = Bool()
  override def asMaster(): Unit = {
    in(addr,am,as,ds0,ds1,write,lword,iack,iackin)
    out(dtack,beer,retry,irq,iackout)
    master(data)
  }
}

case class DFF() extends Component{
  val io = new Bundle{
    val d = in Bool()
    val q = out Bool()
    val clrn = in Bool()
    val clk = in Bool()
  }
  noIoPrefix()
  val dff_clkdomain = ClockDomain(io.clk)

  val dff_area = new ClockingArea(dff_clkdomain){
    val buffer = Reg(Bool())  addTag(crossClockDomain)
    when(!io.clrn){
      buffer := False
    }otherwise{
      buffer := io.d
    }
  }
  //io.q := Mux(!io.clrn,False,dff_area.buffer)
  io.q := dff_area.buffer
}

case class oneshot_count() extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val shot_clk = in Bool()
    val count = in UInt(8 bits)
    val shot_out = out Bool()
  }
  noIoPrefix()
  val oneshot_negdomain = ClockDomain(io.clk,config = ClockDomainConfig(clockEdge = FALLING))
  val oneshot_negarea = new ClockingArea(oneshot_negdomain){
    val shot_clk_buf = RegNext(io.shot_clk)
  }
  val dff = new DFF
  dff.io.d := True
  dff.io.clk := oneshot_negarea.shot_clk_buf

  val oneshot_posdomain = ClockDomain(io.clk,config = ClockDomainConfig(clockEdge = RISING))
  val oneshot_posarea = new ClockingArea(oneshot_posdomain){
    val counter = Reg(UInt(8 bits))
    when(!dff.io.q){
      counter := 0
    }otherwise{
      counter := counter + 1
    }
  }
  dff.io.clrn := (oneshot_posarea.counter < io.count)
  io.shot_out := dff.io.q
}

object oneshot_count extends App{
  SpinalVerilog(new oneshot_count)
}

object oneshot_countsim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new oneshot_count){dut=>
      dut.oneshot_negdomain.forkStimulus(10)
      dut.io.shot_clk #= false
      dut.io.count #= 5
      dut.oneshot_negdomain.waitSampling(10)
      dut.io.shot_clk #= true
      dut.oneshot_negdomain.waitSampling(10)
      dut.io.shot_clk #= false
      dut.oneshot_negdomain.waitSampling(1000)
    }
  }

}

case class Vme(datawidth : Int) extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val vme = master(VmeInterface())
    val gap = in Bits(4 bits)
    val sw = in Bits(4 bits)
    val gap4 = in Bool()

    val lwr = out Bool()
    val lrd = out Bool()
    val laddr = out Bits(15 bits)
    //val data = master(TriState(Bits(32 bits)))
    val datadir = out Bool()
    val apb = master(Apb3(Apb3Config(addressWidth = 15,dataWidth = datawidth)))
  }
  noIoPrefix()

  val vme_area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val vme_realaddr = (io.vme.addr<<1).resized
    val sloterr = (io.gap === io.sw)
    //val addr_pass_data1 = (((io.vme.am === B"6'x3c")||(io.vme.am === B"6'x3f"))&&(!io.vme.lword)&&io.vme.iack)
    //val addr_pass_int1 = (((io.vme.am === B"6'x29")||(io.vme.am === B"6'x2D"))&&(!io.vme.lword)&&(!io.vme.iack))
    val addr_pass_data1 = (((io.vme.am === B"6'x3c"))&&(io.vme.iack))
    val addr_pass_int1 = (((io.vme.am === B"6'x29")||(io.vme.am === B"6'x2D"))&&(!io.vme.iack))
    val addr_pass_data = addr_pass_data1&& (!io.vme.as)&&(io.vme.addr(19 downto 16) === (((~io.gap)<<1).resize(4 bits)))&&(vme_realaddr(24) === ~io.gap4)
    val addr_pass_int = addr_pass_int1&& (!io.vme.as)

    io.laddr := Mux(addr_pass_data1&(!io.vme.as),vme_realaddr(14 downto 0),B"15'x7fff")

    val ds = io.vme.ds0 && io.vme.ds1
    io.lwr := Mux(addr_pass_data&&(!io.vme.write),ds,True)
    io.lrd := Mux(addr_pass_data&&io.vme.write,ds,True)

    val counter = Reg(UInt(4 bits)) init 0
    when(!(io.lwr&&io.lrd)){
      counter := counter + 1
    }otherwise{
      counter := 0
    }
    val dtack = Reg(Bool()) init True
    when((counter > 6)&&addr_pass_data){
      dtack := False
    }elsewhen(io.vme.ds0 && io.vme.ds1){
      dtack := True
    }otherwise{
      dtack := True
    }

    io.vme.dtack := dtack

    io.apb.PADDR := io.laddr.asUInt
    io.apb.PSEL := ((!io.lwr)|(!io.lrd)).asBits
    io.apb.PWRITE := !io.lwr
    io.apb.PENABLE := (!io.lwr)|(!io.lrd)
    io.vme.data.writeEnable := !io.lrd
    io.vme.data.write := io.apb.PRDATA
    io.apb.PWDATA := io.vme.data.read

    val ila_probe = ila("0",io.vme.addr,io.vme.data.read,io.vme.data.write,io.vme.data.writeEnable,io.vme.ds0,io.vme.ds1,io.vme.am,io.vme.as,io.vme.dtack,io.vme.write,io.vme.lword,
    io.gap,io.gap4,io.sw,io.vme.iack,io.vme.iackin,io.vme.iackout,io.datadir,io.lwr,io.lrd,counter)
  }
  io.datadir := Mux((vme_area.addr_pass_data||vme_area.addr_pass_int) & io.vme.write,True,False)

  io.vme.iackout := io.vme.iackin

  io.vme.beer := False
  io.vme.retry := False
  io.vme.irq := B"7'b1111111"
}

//case class VME_APB(datawidth : Int) extends Component{
//  val io = new Bundle{
//    val lwr = in Bool()
//    val lrd = in Bool()
//    val laddr = in Bits(15 bits)
//    val data = master(TriState(Bits(datawidth bits)))
//    val apb = master(Apb3(Apb3Config(addressWidth = 15,dataWidth = datawidth)))
//  }
//  noIoPrefix()
//  io.apb.PADDR := io.laddr.asUInt
//  io.apb.PSEL := ((!io.lwr)|(!io.lrd)).asBits
//  io.apb.PWRITE := !io.lwr
//  io.apb.PENABLE := (!io.lwr)|(!io.lrd)
//  io.data.writeEnable := !io.lrd
//  io.data.write := io.apb.PRDATA
//  io.apb.PWDATA := io.data.read
//}

case class VME_REG(datawidth : Int) extends Component{
  val io = new Bundle{
    val apb = slave(Apb3(Apb3Config(addressWidth = 15,dataWidth = datawidth)))
    val vme_data = out Vec(Bits(32 bits),6)
    val sensor_data = in Vec(Bits(32 bits),12)
  }
  noIoPrefix()
  val busslave = Apb3BusInterface(io.apb,(0x0000, 1000 Byte))
/*****************************VME REG ****************************************************/
  if(datawidth == 16){
    val My_Reg0 = busslave.newRegAt(0x0000,doc="My_Reg0")
    val VME_Reg0 = My_Reg0.field(16 bits,RW,0x0000,"VME_Reg0")
    val My_Reg1 = busslave.newRegAt(0x0002,doc="My_Reg1")
    val VME_Reg1 = My_Reg1.field(16 bits,RW,0x0000,"VME_Reg1")
    io.vme_data(0) := RegNextWhen(VME_Reg0##VME_Reg1,My_Reg1.hitDoWrite)
    val My_Reg2 = busslave.newRegAt(0x0004,doc="My_Reg2")
    val VME_Reg2 = My_Reg2.field(16 bits,RW,0x0000,"VME_Reg2")
    val My_Reg3 = busslave.newRegAt(0x0006,doc="My_Reg3")
    val VME_Reg3 = My_Reg3.field(16 bits,RW,0x0000,"VME_Reg3")
    io.vme_data(1) := RegNextWhen(VME_Reg2##VME_Reg3,My_Reg3.hitDoWrite)

    val My_Reg4 = busslave.newRegAt(0x0008,doc="My_Reg4")
    val VME_Reg4 = My_Reg4.field(16 bits,RW,0x0000,"VME_Reg4")
    val My_Reg5 = busslave.newRegAt(0x000a,doc="My_Reg5")
    val VME_Reg5 = My_Reg5.field(16 bits,RW,0x0000,"VME_Reg5")
    io.vme_data(2) := RegNextWhen(VME_Reg4##VME_Reg5,My_Reg5.hitDoWrite)

    val My_Reg6 = busslave.newRegAt(0x000c,doc="My_Reg6")
    val VME_Reg6 = My_Reg6.field(16 bits,RW,0x0000,"VME_Reg6")
    val My_Reg7 = busslave.newRegAt(0x000e,doc="My_Reg7")
    val VME_Reg7 = My_Reg7.field(16 bits,RW,0x0000,"VME_Reg7")
    io.vme_data(3) := RegNextWhen(VME_Reg6##VME_Reg7,My_Reg7.hitDoWrite)

    val My_Reg8 = busslave.newRegAt(0x0010,doc="My_Reg8")
    val VME_Reg8 = My_Reg8.field(16 bits,RW,0x0000,"VME_Reg8")
    val My_Reg9 = busslave.newRegAt(0x0012,doc="My_Reg9")
    val VME_Reg9 = My_Reg9.field(16 bits,RW,0x0000,"VME_Reg9")
    io.vme_data(4) := RegNextWhen(VME_Reg8##VME_Reg9,My_Reg9.hitDoWrite)

    val My_Reg10 = busslave.newRegAt(0x0014,doc="My_Reg10")
    val VME_Reg10 = My_Reg10.field(16 bits,RW,0x0000,"VME_Reg10")
    val My_Reg11 = busslave.newRegAt(0x0016,doc="My_Reg11")
    val VME_Reg11 = My_Reg11.field(16 bits,RW,0x0000,"VME_Reg11")
    io.vme_data(5) := RegNextWhen(VME_Reg10##VME_Reg11,My_Reg11.hitDoWrite)
    /*****************************SENSOR REG ****************************************************/
    val My_Reg12 = busslave.newRegAt(0x0018,doc="My_Reg12")
    val SENSOR_Reg0_H = My_Reg12.field(16 bits,RO,0x0000,"SENSOR_Reg0_H")
    SENSOR_Reg0_H := io.sensor_data(0)(31 downto 16)
    val My_Reg13 = busslave.newRegAt(0x001a,doc="My_Reg13")
    val SENSOR_Reg0_L = My_Reg13.field(16 bits,RO,0x0000,"SENSOR_Reg0_L")
    SENSOR_Reg0_L := io.sensor_data(0)(15 downto 0)

    val My_Reg14 = busslave.newRegAt(0x001c,doc="My_Reg14")
    val SENSOR_Reg1_H = My_Reg14.field(16 bits,RO,0x0000,"SENSOR_Reg1_H")
    SENSOR_Reg1_H := io.sensor_data(1)(31 downto 16)
    val My_Reg15 = busslave.newRegAt(0x001e,doc="My_Reg15")
    val SENSOR_Reg1_L = My_Reg15.field(16 bits,RO,0x0000,"SENSOR_Reg1_L")
    SENSOR_Reg1_L := io.sensor_data(1)(15 downto 0)

    val My_Reg16 = busslave.newRegAt(0x0020,doc="My_Reg16")
    val SENSOR_Reg2_H = My_Reg16.field(16 bits,RO,0x0000,"SENSOR_Reg2_H")
    SENSOR_Reg2_H := io.sensor_data(2)(31 downto 16)
    val My_Reg17 = busslave.newRegAt(0x0022,doc="My_Reg17")
    val SENSOR_Reg2_L = My_Reg17.field(16 bits,RO,0x0000,"SENSOR_Reg2_L")
    SENSOR_Reg2_L := io.sensor_data(2)(15 downto 0)

    val My_Reg18 = busslave.newRegAt(0x0024,doc="My_Reg18")
    val SENSOR_Reg3_H = My_Reg18.field(16 bits,RO,0x0000,"SENSOR_Reg3_H")
    SENSOR_Reg3_H := io.sensor_data(3)(31 downto 16)
    val My_Reg19 = busslave.newRegAt(0x0026,doc="My_Reg19")
    val SENSOR_Reg3_L = My_Reg19.field(16 bits,RO,0x0000,"SENSOR_Reg3_L")
    SENSOR_Reg3_L := io.sensor_data(3)(15 downto 0)

    val My_Reg20 = busslave.newRegAt(0x0028,doc="My_Reg20")
    val SENSOR_Reg4_H = My_Reg20.field(16 bits,RO,0x0000,"SENSOR_Reg4_H")
    SENSOR_Reg4_H := io.sensor_data(4)(31 downto 16)
    val My_Reg21 = busslave.newRegAt(0x002a,doc="My_Reg21")
    val SENSOR_Reg4_L = My_Reg21.field(16 bits,RO,0x0000,"SENSOR_Reg4_L")
    SENSOR_Reg4_L := io.sensor_data(4)(15 downto 0)
    /******************************************************************************************/
    val My_Reg22 = busslave.newRegAt(0x002c,doc="My_Reg22")
    val SENSOR_Reg5_H = My_Reg22.field(16 bits,RO,0x0000,"SENSOR_Reg5_H")
    SENSOR_Reg5_H := io.sensor_data(5)(31 downto 16)
    val My_Reg23 = busslave.newRegAt(0x002e,doc="My_Reg23")
    val SENSOR_Reg5_L = My_Reg23.field(16 bits,RO,0x0000,"SENSOR_Reg5_L")
    SENSOR_Reg5_L := io.sensor_data(5)(15 downto 0)

    val My_Reg24 = busslave.newRegAt(0x0030,doc="My_Reg24")
    val SENSOR_Reg6_H = My_Reg24.field(16 bits,RO,0x0000,"SENSOR_Reg6_H")
    SENSOR_Reg6_H := io.sensor_data(6)(31 downto 16)
    val My_Reg25 = busslave.newRegAt(0x0032,doc="My_Reg25")
    val SENSOR_Reg6_L = My_Reg25.field(16 bits,RO,0x0000,"SENSOR_Reg6_L")
    SENSOR_Reg6_L := io.sensor_data(6)(15 downto 0)

    val My_Reg26 = busslave.newRegAt(0x0034,doc="My_Reg26")
    val SENSOR_Reg7_H = My_Reg26.field(16 bits,RO,0x0000,"SENSOR_Reg7_H")
    SENSOR_Reg7_H := io.sensor_data(7)(31 downto 16)
    val My_Reg27 = busslave.newRegAt(0x0036,doc="My_Reg27")
    val SENSOR_Reg7_L = My_Reg27.field(16 bits,RO,0x0000,"SENSOR_Reg7_L")
    SENSOR_Reg7_L := io.sensor_data(7)(15 downto 0)
    /******************************************************************************************/
    val My_Reg28 = busslave.newRegAt(0x0038,doc="My_Reg28")
    val SENSOR_Reg8_H = My_Reg28.field(16 bits,RO,0x0000,"SENSOR_Reg8_H")
    SENSOR_Reg8_H := io.sensor_data(8)(31 downto 16)
    val My_Reg29 = busslave.newRegAt(0x003a,doc="My_Reg29")
    val SENSOR_Reg8_L = My_Reg29.field(16 bits,RO,0x0000,"SENSOR_Reg8_L")
    SENSOR_Reg8_L := io.sensor_data(8)(15 downto 0)

    val My_Reg30 = busslave.newRegAt(0x003c,doc="My_Reg30")
    val SENSOR_Reg9_H = My_Reg30.field(16 bits,RO,0x0000,"SENSOR_Reg9_H")
    SENSOR_Reg9_H := io.sensor_data(9)(31 downto 16)
    val My_Reg31 = busslave.newRegAt(0x003e,doc="My_Reg31")
    val SENSOR_Reg9_L = My_Reg31.field(16 bits,RO,0x0000,"SENSOR_Reg9_L")
    SENSOR_Reg9_L := io.sensor_data(9)(15 downto 0)

    val My_Reg32 = busslave.newRegAt(0x0040,doc="My_Reg32")
    val SENSOR_Reg10_H = My_Reg32.field(16 bits,RO,0x0000,"SENSOR_Reg10_H")
    SENSOR_Reg10_H := io.sensor_data(10)(31 downto 16)
    val My_Reg33 = busslave.newRegAt(0x0042,doc="My_Reg33")
    val SENSOR_Reg10_L = My_Reg33.field(16 bits,RO,0x0000,"SENSOR_Reg10_L")
    SENSOR_Reg10_L := io.sensor_data(10)(15 downto 0)

    val My_Reg34 = busslave.newRegAt(0x0044,doc="My_Reg34")
    val SENSOR_Reg11_H = My_Reg34.field(16 bits,RO,0x0000,"SENSOR_Reg11_H")
    SENSOR_Reg11_H := io.sensor_data(11)(31 downto 16)
    val My_Reg35 = busslave.newRegAt(0x0046,doc="My_Reg35")
    val SENSOR_Reg11_L = My_Reg35.field(16 bits,RO,0x0000,"SENSOR_Reg11_L")
    SENSOR_Reg11_L := io.sensor_data(11)(15 downto 0)
  }
  else if(datawidth == 32){
    val My_Reg0 = busslave.newRegAt(0x0000,doc="My_Reg0")
    val VME_Reg0 = My_Reg0.field(32 bits,RW,0x50A48601,"VME_Reg0")
    io.vme_data(0) := RegNextWhen(VME_Reg0,My_Reg0.hitDoWrite)


    val My_Reg1 = busslave.newRegAt(0x0004,doc="My_Reg1")
    val VME_Reg1 = My_Reg1.field(32 bits,RW,0x01020304,"VME_Reg1")
    io.vme_data(1) := RegNextWhen(VME_Reg1,My_Reg1.hitDoWrite)

    val My_Reg2 = busslave.newRegAt(0x0008,doc="My_Reg2")
    val VME_Reg2 = My_Reg2.field(32 bits,RW,0x01020304,"VME_Reg2")
    io.vme_data(2) := RegNextWhen(VME_Reg2,My_Reg2.hitDoWrite)

    val My_Reg3 = busslave.newRegAt(0x000c,doc="My_Reg3")
    val VME_Reg3 = My_Reg3.field(32 bits,RW,0x01020304,"VME_Reg3")
    io.vme_data(3) := RegNextWhen(VME_Reg3,My_Reg3.hitDoWrite)

    val My_Reg4 = busslave.newRegAt(0x0010,doc="My_Reg4")
    val VME_Reg4 = My_Reg4.field(32 bits,RW,0x01020304,"VME_Reg4")
    io.vme_data(4) := RegNextWhen(VME_Reg4,My_Reg4.hitDoWrite)

    val My_Reg5 = busslave.newRegAt(0x0014,doc="My_Reg5")
    val VME_Reg5 = My_Reg5.field(32 bits,RW,0x01020304,"VME_Reg5")
    io.vme_data(5) := RegNextWhen(VME_Reg5,My_Reg5.hitDoWrite)
    /*****************************SENSOR REG ****************************************************/
    val My_Reg6 = busslave.newRegAt(0x0018,doc="My_Reg6")
    val SENSOR_Reg0 = My_Reg6.field(32 bits,RO,0x01020304,"SENSOR_Reg0")
    SENSOR_Reg0 := io.sensor_data(0)

    val My_Reg7 = busslave.newRegAt(0x001c,doc="My_Reg7")
    val SENSOR_Reg1 = My_Reg7.field(32 bits,RO,0x01020304,"SENSOR_Reg1")
    SENSOR_Reg1 := io.sensor_data(1)

    val My_Reg8 = busslave.newRegAt(0x0020,doc="My_Reg8")
    val SENSOR_Reg2 = My_Reg8.field(32 bits,RO,0x01020304,"SENSOR_Reg2")
    SENSOR_Reg2 := io.sensor_data(2)

    val My_Reg9 = busslave.newRegAt(0x0024,doc="My_Reg9")
    val SENSOR_Reg3 = My_Reg9.field(32 bits,RO,0x01020304,"SENSOR_Reg3")
    SENSOR_Reg3 := io.sensor_data(3)

    val My_Reg10 = busslave.newRegAt(0x0028,doc="My_Reg10")
    val SENSOR_Reg4 = My_Reg10.field(32 bits,RO,0x01020304,"SENSOR_Reg4")
    SENSOR_Reg4 := io.sensor_data(4)
    /******************************************************************************************/
    val My_Reg11 = busslave.newRegAt(0x002c,doc="My_Reg11")
    val SENSOR_Reg5 = My_Reg11.field(32 bits,RO,0x01020304,"SENSOR_Reg5")
    SENSOR_Reg5 := io.sensor_data(5)

    val My_Reg12 = busslave.newRegAt(0x0030,doc="My_Reg12")
    val SENSOR_Reg6 = My_Reg12.field(32 bits,RO,0x01020304,"SENSOR_Reg6")
    SENSOR_Reg6 := io.sensor_data(6)

    val My_Reg13 = busslave.newRegAt(0x0034,doc="My_Reg13")
    val SENSOR_Reg7 = My_Reg13.field(32 bits,RO,0x01020304,"SENSOR_Reg7")
    SENSOR_Reg7 := io.sensor_data(7)
    /******************************************************************************************/
    val My_Reg14 = busslave.newRegAt(0x0038,doc="My_Reg14")
    val SENSOR_Reg8 = My_Reg14.field(32 bits,RO,0x01020304,"SENSOR_Reg8")
    SENSOR_Reg8 := io.sensor_data(8)

    val My_Reg15 = busslave.newRegAt(0x003c,doc="My_Reg15")
    val SENSOR_Reg9 = My_Reg15.field(32 bits,RO,0x01020304,"SENSOR_Reg9")
    SENSOR_Reg9 := io.sensor_data(9)

    val My_Reg16 = busslave.newRegAt(0x0040,doc="My_Reg16")
    val SENSOR_Reg10 = My_Reg16.field(32 bits,RO,0x01020304,"SENSOR_Reg10")
    SENSOR_Reg10 := io.sensor_data(10)

    val My_Reg17 = busslave.newRegAt(0x0044,doc="My_Reg17")
    val SENSOR_Reg11 = My_Reg17.field(32 bits,RO,0x01020304,"SENSOR_Reg11")
    SENSOR_Reg11 := io.sensor_data(11)
  }

}

case class VME_TOP(datawidth : Int) extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val vme = master(VmeInterface())
    //val data = master(TriState(Bits(datawidth bits)))
    val gap = in Bits(4 bits)
    val sw = in Bits(4 bits)
    val gap4 = in Bool()
    val datadir = out Bool()
    val vme_data = out Vec(Bits(32 bits),6)
    val sensor_data = in Vec(Bits(32 bits),12)
  }
  noIoPrefix()

  val vme_area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val vme_decode = new Vme(datawidth)
    vme_decode.io.clk := io.clk
    vme_decode.io.reset := io.reset
    vme_decode.io.vme <> io.vme
    vme_decode.io.gap := io.gap
    vme_decode.io.gap4 := io.gap4
    vme_decode.io.sw := io.sw
    io.datadir := vme_decode.io.datadir

//    val vme_apb = new VME_APB(datawidth)
//    vme_apb.io.lwr := vme_decode.io.lwr
//    vme_apb.io.lrd := vme_decode.io.lrd
//    vme_apb.io.laddr := vme_decode.io.laddr
//    io.data <> vme_apb.io.data

    val vme_reg = new VME_REG(datawidth)
    vme_reg.io.apb <> vme_decode.io.apb
    io.vme_data <> vme_reg.io.vme_data
    io.sensor_data <> vme_reg.io.sensor_data
  }
}

object VME_TOP extends App{
  SpinalVerilog(InOutWrapper(new VME_TOP(32)))
}


/*object VME_TOP{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new VME_TOP()) { dut =>
      dut.vme_area.clockDomain.forkStimulus(10)
      dut.io.vme.am #= 0
      dut.io.vme.lword #= false
      dut.io.vme.iack #= false
      dut.io.gap #= 15
      dut.io.sw #= 15
      dut.io.gap4 #= true
      dut.io.vme.write #= true
      dut.io.vme.as #= true
      dut.io.vme.ds0 #= true
      dut.io.vme.ds1 #= true
      dut.vme_area.clockDomain.waitSampling(10)
      dut.io.vme.am #= 57
      dut.io.vme.lword #= true
      dut.io.vme.iack #= true
      dut.io.vme.as #= false
      dut.io.vme.addr #= 0xc00000
      dut.vme_area.clockDomain.waitSampling()
      dut.io.vme.write #= false
      dut.vme_area.clockDomain.waitSamplingWhere(dut.io.vme.dtack.toBoolean)
      dut.io.vme.ds0 #= false
      dut.io.vme.ds1 #= false
      dut.io.data.read #= 0x1234
      dut.vme_area.clockDomain.waitSamplingWhere(!dut.io.vme.dtack.toBoolean)
      dut.io.vme.am #= 0
      dut.io.vme.lword #= false
      dut.io.vme.iack #= false
      dut.io.vme.write #= true
      dut.io.vme.as #= true
      dut.io.vme.ds0 #= true
      dut.io.vme.ds1 #= true
      dut.vme_area.clockDomain.waitSampling(500)
      dut.io.vme.am #= 57
      dut.io.vme.lword #= true
      dut.io.vme.iack #= true
      dut.io.vme.as #= false
      dut.io.vme.addr #= 0xc00004
      dut.vme_area.clockDomain.waitSampling()
      dut.io.vme.write #= false
      dut.vme_area.clockDomain.waitSamplingWhere(dut.io.vme.dtack.toBoolean)
      dut.io.vme.ds0 #= false
      dut.io.vme.ds1 #= false
      dut.io.data.read #= 0x3456
      dut.vme_area.clockDomain.waitSamplingWhere(!dut.io.vme.dtack.toBoolean)
      dut.io.vme.am #= 0
      dut.io.vme.lword #= false
      dut.io.vme.iack #= false
      dut.io.vme.write #= true
      dut.io.vme.as #= true
      dut.io.vme.ds0 #= true
      dut.io.vme.ds1 #= true
      dut.vme_area.clockDomain.waitSampling(500)
      dut.io.vme.am #= 57
      dut.io.vme.lword #= true
      dut.io.vme.iack #= true
      dut.io.vme.as #= false
      dut.io.vme.addr #= 0xc00000
      dut.vme_area.clockDomain.waitSampling()
      dut.io.vme.write #= true
      dut.vme_area.clockDomain.waitSamplingWhere(dut.io.vme.dtack.toBoolean)
      dut.io.vme.ds0 #= false
      dut.io.vme.ds1 #= false
      dut.vme_area.clockDomain.waitSamplingWhere(!dut.io.vme.dtack.toBoolean)
      dut.io.vme.am #= 0
      dut.io.vme.lword #= false
      dut.io.vme.iack #= false
      dut.io.vme.write #= true
      dut.io.vme.as #= true
      dut.io.vme.ds0 #= true
      dut.io.vme.ds1 #= true
      dut.vme_area.clockDomain.waitSampling(500)
    }
  }
}*/





