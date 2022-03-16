package PHPA82

import EMIF.{Emif_Apb, SramInterface, SramLayout, Top}
import PHPA82.ila_test.ila
import PHPA82.regFileGen.genRegFileByMarkdown
import SRIO._
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Decoder}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.com.uart.Uart
import spinal.lib.io.{InOutWrapper, TriState, TriStateArray}

import scala.collection.mutable.ArrayBuffer
import xilinx._


case class SramLayout(addressWidth: Int, dataWidth : Int) {
  val capacity = BigInt(1) << (addressWidth + log2Up(dataWidth/8))
}

case class SramInterface(g : SramLayout) extends Bundle with IMasterSlave{
  val emif_addr = UInt((g.addressWidth) bits)
  val emif_data = TriState(Bits(g.dataWidth bits))
  val emif_cs  = Bool
  val emif_we  = Bool
  val emif_oe  = Bool

  override def asMaster(): Unit = {
    in(emif_addr,emif_cs,emif_we,emif_oe)
    master(emif_data)
  }
}

class Emif_Apb(sramLayout : SramLayout) extends Component {
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val apb = master(Apb3(Apb3Config(addressWidth = sramLayout.addressWidth,dataWidth = sramLayout.dataWidth)))
  }
  noIoPrefix()

  val penable = Reg(Bool()) init False

  penable := (!io.emif.emif_oe)|(!io.emif.emif_we)

  io.apb.PADDR := ((io.emif.emif_addr)<<1).resize(sramLayout.addressWidth)
  io.apb.PSEL := ~(io.emif.emif_cs.asBits)
  io.apb.PENABLE := Mux(penable.rise(),penable,False)
  io.apb.PWRITE := (!io.emif.emif_we)&io.emif.emif_oe

  val rd_data_temp = Reg(Bits(sramLayout.dataWidth bits))

  when(io.apb.PENABLE){
    rd_data_temp := io.apb.PRDATA
  }otherwise{
    rd_data_temp := rd_data_temp
  }
  rd_data_temp.addAttribute("MARK_DEBUG","TRUE")

  io.emif.emif_data.writeEnable := !io.emif.emif_oe
  //io.emif.emif_data.write := RegNextWhen(rd_data_temp,!io.emif.emif_oe)
  io.emif.emif_data.write := rd_data_temp

  io.apb.PWDATA := io.emif.emif_data.read
}


class Phpa_Top(sramLayout : SramLayout) extends Component {
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val ad5544_A = master(Ad5544Interface())
    val ad5544_B = master(Ad5544Interface())
    val ad5544_C = master(Ad5544Interface())
    val biss_c = master(BissCInterface())
    val ad7606 = master(Ad7606Interface())
    val clk = in Bool()
    val reset = in Bool()
    val led = out Bool()
    val gtxuser_clk = in Bool()
    val axiw = master(Stream(Fragment(Bits(32 bits))))
    val axir = slave (Stream(Fragment(Bits(32 bits))))
  }
  noIoPrefix()

  val systemClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset,
    frequency = FixedFrequency(100 MHz)
  )

  //io.ad5544_A.addAttribute("MARK_DEBUG","TRUE")
  val axiclkdomain = ClockDomain(io.gtxuser_clk,io.reset)

  val area = new ClockingArea(systemClockDomain){
    val emif_interface = new Emif_Apb(sramLayout)
    io.emif <> emif_interface.io.emif
    emif_interface.io.apb.addAttribute("MARK_DEBUG","TRUE")
    emif_interface.io.emif.addAttribute("MARK_DEBUG","TRUE")

    //val ad5544_temp = Reg(Bool()) init False

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val apbtimer = new ApbTimer("ApbTimer",0x000600)
    io.clk <> apbtimer.io.clk
    io.reset <> apbtimer.io.reset
    apbMapping += apbtimer.io.apb -> (0x000600, 256 Bytes)
    val interrupt_temp = Reg(Bool()) init False
    interrupt_temp := apbtimer.io.interrupt|Delay(apbtimer.io.interrupt,1)|Delay(apbtimer.io.interrupt,2)|Delay(apbtimer.io.interrupt,3)

    val ad5544_triger = new AD5544_triger("AD5544_Triger",0x000000)
    //ad5544_temp := ad5544_triger.io.ad5544_tri
    io.clk <> ad5544_triger.io.clk
    io.reset <> ad5544_triger.io.reset
    apbMapping += ad5544_triger.io.apb -> (0x00000, 8 Bytes)

    //ad5544_triger.io.ad5544_tri.addAttribute("MARK_DEBUG","TRUE")

    val ad5544_A_Ctrl = new AD5544("AD5544_1",0x000100)
    io.ad5544_A <> ad5544_A_Ctrl.io.ad5544Interface
    io.clk <> ad5544_A_Ctrl.io.clk
    io.reset <> ad5544_A_Ctrl.io.reset
    //ad5544_A_Ctrl.io.ad5544_enable := ad5544_temp
    ad5544_A_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri|interrupt_temp
    apbMapping += ad5544_A_Ctrl.io.apb -> (0x000100, 256 Bytes)

    val ad5544_B_Ctrl = new AD5544("AD5544_2",0x000200)
    io.ad5544_B <> ad5544_B_Ctrl.io.ad5544Interface
    io.clk <> ad5544_B_Ctrl.io.clk
    io.reset <> ad5544_B_Ctrl.io.reset
    //ad5544_B_Ctrl.io.ad5544_enable := ad5544_temp
    ad5544_B_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri|interrupt_temp
    apbMapping += ad5544_B_Ctrl.io.apb -> (0x000200, 256 Bytes)

    val ad5544_C_Ctrl = new AD5544("AD5544_3",0x000300)
    io.ad5544_C <> ad5544_C_Ctrl.io.ad5544Interface
    io.clk <> ad5544_C_Ctrl.io.clk
    io.reset <> ad5544_C_Ctrl.io.reset
    //ad5544_C_Ctrl.io.ad5544_enable := ad5544_temp
    ad5544_C_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri|interrupt_temp
    apbMapping += ad5544_C_Ctrl.io.apb -> (0x000300, 256 Bytes)

    val biss_c_ctrl = new Biss_C("Biss_c",0x000400)
    io.biss_c <> biss_c_ctrl.io.bisscInterface
    io.clk <> biss_c_ctrl.io.clk
    io.reset <> biss_c_ctrl.io.reset
    apbMapping += biss_c_ctrl.io.apb -> (0x000400, 256 Bytes)

    //biss_c_ctrl.io.bisscInterface.addAttribute("MARK_DEBUG","TRUE")
    //biss_c_ctrl.area.bissc_pos_reg.addAttribute("MARK_DEBUG","TRUE")

    val ad7606_ctrl = new AD7606("AD7606",0x000500)
    io.ad7606 <> ad7606_ctrl.io.ad7606Interface
    io.clk <> ad7606_ctrl.io.clk
    io.reset <> ad7606_ctrl.io.reset
    apbMapping += ad7606_ctrl.io.apb -> (0x000500, 256 Bytes)

    //ad7606_ctrl.io.ad7606Interface.addAttribute("MARK_DEBUG","TRUE")
    val gtx_ctrl = new Apb3_Gtx(axiclkdomain,256,256)
    gtx_ctrl.io.axiw <> io.axiw
    gtx_ctrl.io.axir <> io.axir
    /*gtx_ctrl.io.axir.payload.fragment := gtx_ctrl.io.axiw.payload.fragment
    gtx_ctrl.io.axir.valid := gtx_ctrl.io.axiw.valid
    gtx_ctrl.io.axir.payload.last := gtx_ctrl.io.axiw.payload.last
    gtx_ctrl.io.axiw.ready := True*/

    apbMapping += gtx_ctrl.io.apb -> (0x000700, 256 Bytes)
    //io.axiw.addAttribute("MARK_DEBUG","TRUE")
    //io.axir.addAttribute("MARK_DEBUG","TRUE")

    val apbDecoder = Apb3Decoder(
      master = emif_interface.io.apb,
      slaves = apbMapping
    )

    val ledtemp = Reg(Bool()) init False

    val counter =  CounterFreeRun(50000000)
    when(counter.willOverflow){
      counter.clear()
      ledtemp := ~ledtemp;
    }

    io.led := ledtemp
   //addPrePopTask(()=>genRegFileByMarkdown())
   /*val ila_probe=ila("0",io.emif.emif_cs,io.emif.emif_oe,io.emif.emif_we,io.emif.emif_data,io.emif.emif_addr,emif_interface.io.apb.PADDR,emif_interface.io.apb.PENABLE,
     emif_interface.io.apb.PREADY,emif_interface.io.apb.PSEL,emif_interface.io.apb.PWDATA,emif_interface.io.apb.PRDATA)*/
   }
}



/*
object Phpa_Top_Test extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true

  ).generateVerilog(InOutWrapper(new Phpa_Top(SramLayout(19,16))))
*/

/*
object Phpa_Top_Test {
  def main(args: Array[String]): Unit = {
    def VivadoSynth[T <: Component](gen: => T, name: String = "temp"): Unit = {
      val report = VivadoFlow(design = gen, name, s"E:/PHPA82/synthWorkspace/$name").doit()
      report.printArea()
      report.printFMax()
    }
    VivadoSynth(InOutWrapper(InOutWrapper(new Phpa_Top(SramLayout(19,16)))), name = "PHPA82V1")
  }
}*/
