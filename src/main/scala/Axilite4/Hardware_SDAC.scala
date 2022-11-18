package Axilite4

import ENDAT.{Endat, ENDAT_Interface, Endat_Ctrl}
import MDCB_2.Mdcb_Ioin_Filter
import MDCB_COMMON.Mdcb_Io
import PHPA82.regFileGen.{genRegFileByMarkdown, regInsert}
import PHPA82.{AD7606_DATA, Ad7606Interface, BISS_Position, BissCInterface, EncoderInterface, Encoder_Top}
import spinal.core._
import spinal.lib.bus.amba3.apb.Apb3SlaveFactory
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SlaveFactory, Axi4SpecRenamer}
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.{master, slave}

case class Hardware_SDAC(addressWidth : Int) extends Component {
  val io = new Bundle{
    val s_axi = slave(Axi4(Axi4Config(addressWidth,32,12)))
    val clk_80M = in Bool()
    val clk_160M = in Bool()
    val reset = in Bool()
    val AD7606 = Seq.fill(3)(master(Ad7606Interface()))
    val ENCODER = Seq.fill(4)(master(EncoderInterface()))
    val BISSC = Seq.fill(4)(master(BissCInterface()))
    val ENDAT = Seq.fill(4)(master(ENDAT_Interface()))
    val GPIO = master(Mdcb_Io())
    Axi4SpecRenamer(s_axi)
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(io.clk_80M,io.reset)){

    val ctrl = Axi4SlaveFactory(io.s_axi)

    val ad7606 = Seq.fill(3)(new AD7606_DATA)
    val ad_data = Seq.fill(3)(Vec(Reg(Bits(16 bits)) init 0,8))
    for(i <- 0 until 3) {
      ad7606(i).io.clk := io.clk_80M
      ad7606(i).io.reset := io.reset
      io.AD7606(i).ad_cs := ad7606(i).io.ad_cs
      io.AD7606(i).ad_os := ad7606(i).io.ad_os
      io.AD7606(i).ad_rd := ad7606(i).io.ad_rd
      io.AD7606(i).ad_convsta := ad7606(i).io.ad_convsta
      io.AD7606(i).ad_convstb := ad7606(i).io.ad_convstb
      io.AD7606(i).ad_reset := ad7606(i).io.ad_reset
      io.AD7606(i).ad_range := ad7606(i).io.ad_range
      ad7606(i).io.ad_busy := io.AD7606(i).ad_busy
      ad7606(i).io.first_data := io.AD7606(i).first_data
      ad7606(i).io.ad_data := io.AD7606(i).ad_data
      ad7606(i).io.sample_en := True

      ad_data(i)(0) := ad7606(i).io.ad_ch1_o.asBits
      ad_data(i)(1) := ad7606(i).io.ad_ch2_o.asBits
      ad_data(i)(2) := ad7606(i).io.ad_ch3_o.asBits
      ad_data(i)(3) := ad7606(i).io.ad_ch4_o.asBits
      ad_data(i)(4) := ad7606(i).io.ad_ch5_o.asBits
      ad_data(i)(5) := ad7606(i).io.ad_ch6_o.asBits
      ad_data(i)(6) := ad7606(i).io.ad_ch7_o.asBits
      ad_data(i)(7) := ad7606(i).io.ad_ch8_o.asBits
    }

    val bissc = Seq.fill(4)(new BISS_Position)
    val bissc_data = Seq.fill(4)(Reg(Bits(32 bits)) init 0)
    for(i <- 0 until 4){
      bissc(i).clk := io.clk_80M
      bissc(i).reset := io.reset
      bissc(i).enc_data := io.BISSC(i).enc_data
      io.BISSC(i).enc_clk := bissc(i).enc_clk
      bissc(i).sample_en := True
      bissc_data(i) := bissc(i).enc_position_out.asBits
    }

    val encoder = Seq.fill(4)(new Encoder_Top(false))
    val encoder_data = Seq.fill(4)(Reg(Bits(32 bits)) init 0)
    val encoder_index = Seq.fill(4)(Reg(Bool()) init False)
//    val encoder_lock_data = Seq.fill(4)(Reg(Bits(32 bits))) init 0
    val encoder_clr = Seq.fill(4)(Reg(Bool()) init False)
    for(i <- 0 until 4){
      encoder(i).io.clk := io.clk_80M
      encoder(i).io.reset := io.reset
      encoder(i).io.clk_160M := io.clk_160M
      encoder(i).io.encoderinterface := io.ENCODER(i)

      encoder_data(i) := encoder(i).io.encoder_position_out
      encoder(i).io.encoder_clr_in := encoder_clr(i)
      encoder_index(i) := encoder(i).io.encoder_iphase_out
//      encoder_lock_data(i) := encoder(i).io.encoder_lock_pos
    }

    val endat = Seq.fill(4)((new Endat_Ctrl(20,6,38,250)))
    val endat_data = Seq.fill(4)(Reg(Bits(38 bits)) init 0)
    val endat_index = Seq.fill(4)(Reg(Bool()) init False)
    for(i <- 0 until 4){
      endat(i).io.endat <> io.ENDAT(i)
      endat_data(i) := endat(i).io.postion
      endat_index(i) := endat(i).io.index
    }

    val iofilter = new Mdcb_Ioin_Filter(40)
    val TTL_IN_REG = Reg(Bits(8 bits))
    val OPT_IN_REG = Reg(Bits(16 bits))
    val TTL_OUT_REG = Reg(Bits(8 bits))
    val OPT_OUT_REG = Reg(Bits(16 bits))
    iofilter.io.M_Fault_TTL := io.GPIO.TTL_IO_In
    iofilter.io.FPGA_DI := io.GPIO.OPT_IO_In
    TTL_IN_REG := iofilter.io.M_Fault_TTL_Filter
    OPT_IN_REG := iofilter.io.FPGA_DI_Filter

    io.GPIO.TTL_IO_Out := TTL_OUT_REG
    io.GPIO.OPT_IO_Out := OPT_OUT_REG

    for(i <- 0 until 3){
      for(k <- 0 until 8){
        ctrl.read(ad_data(i)(k).resized,address = 32*i + 4*k,bitOffset = 0,documentation =s"AD7606_$i 第$k 通道数据")
      }
    }

    for(i <- 0 until 4){
      ctrl.read(bissc_data(i).resized,address = 96 + 4*i,bitOffset = 0,documentation =s"BISSC_$i 通道数据")
    }

    for(i <- 0 until 4){
      ctrl.read(encoder_data(i).resized,address = 112 + 4*i,bitOffset = 0,documentation =s"ENCODER_$i 通道数据")
    }

    for(i <- 0 until 4){
      ctrl.read(encoder_index(i).resized,address = 128 + 4*i,bitOffset = 0,documentation =s"ENCODER_$i INDEX通道数据")
    }

    for(i <- 0 until 4){
      ctrl.driveAndRead(encoder_clr(i),address = 144 + 4*i,bitOffset = 0,documentation =s"ENCODER_$i CLR信号")
    }


    for(i <- 0 until 4){
      ctrl.read(endat_data(i).asBits(37 downto 32),address = 160 + 4*(2*i),bitOffset = 0,documentation =s"endat_data_$i 37:32数据")
      ctrl.read(endat_data(i).asBits(31 downto 0),address = 160 + 4*(2*i+1),bitOffset = 0,documentation =s"endat_data_$i 31:0数据")
    }

    for(i <- 0 until 4){
      ctrl.read(endat_index(i).resized,address = 192 + 4*i,bitOffset = 0,documentation =s"endat_index_$i INDEX信号")
    }

    ctrl.read(TTL_IN_REG.resized,address = 208,bitOffset = 0,documentation =s"TTL_IN 信号")

    ctrl.read(OPT_IN_REG.resized,address = 212,bitOffset = 0,documentation =s"OPT_IN 信号")

    ctrl.driveAndRead(TTL_OUT_REG,address = 216,bitOffset = 0,documentation =s"TTL_OUT CLR信号")

    ctrl.driveAndRead(OPT_OUT_REG,address = 220,bitOffset = 0,documentation =s"OPT_OUT CLR信号")

    ctrl.addDataModel("SDAC_BSP REG",0)

    addPrePopTask(()=>genRegFileByMarkdown())
  }
}

object SDAC_BSP extends App{
  SpinalConfig(anonymSignalPrefix = "temp",headerWithDate = true).generateVerilog(new Hardware_SDAC(16))
}