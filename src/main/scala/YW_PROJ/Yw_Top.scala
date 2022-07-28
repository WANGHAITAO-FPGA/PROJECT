package YW_PROJ

import ENDAT.{Apb_Endat, Endat, EndatInterface}
import PHPA82.regFileGen.genRegFileByMarkdown
import PHPA82.{AD5544, AD5544_triger, AD7606, Ad5544Interface, Ad7606Interface, Emif_Apb, SramInterface, SramLayout}
import SRIO.{Srio_Interface, Target}
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Decoder}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.io.InOutWrapper
import spinal.lib.{CounterFreeRun, master}

import scala.collection.mutable.ArrayBuffer

case class Yw_Top(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val ad5544_A = master(Ad5544Interface())
//    val ad5544_B = master(Ad5544Interface())
//    val ad5544_C = master(Ad5544Interface())
    val ad7606 = master(Ad7606Interface())
//    val ENDAT = master(EndatInterface())
    val endat_clk = out Bool()
    val endat_read = in Bool()
    val endat_write = out Bool()
    val endat_writeEnable = out Bool()
    val srio = master(Srio_Interface())
    val clk = in Bool()
    val srio_clk = in Bool()
    val reset = in Bool()
    val led = out Bool()
    val srio_status = in Bits(16 bits)
  }
  noIoPrefix()

  val systemClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset,
    frequency = FixedFrequency(100 MHz)
  )

  val srio_clkdomain = ClockDomain(io.srio_clk,io.reset)

  val srio_area = new ClockingArea(srio_clkdomain){
    val endatpostion = Reg(Bits(38 bits)) init 0
    val srio_regif = new Yw_Regif(10)
    srio_regif.io.endatPostion := endatpostion

    val target_t = Target(10,0)
    io.srio.target <> target_t.io.target
    target_t.io.simplebus <> srio_regif.io.simplebus
  }

  val area = new ClockingArea(systemClockDomain){
    val emif_interface = new Emif_Apb(sramLayout)
    io.emif <> emif_interface.io.emif

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val ad5544_triger = new AD5544_triger("AD5544_Triger",0x000000)
    io.clk <> ad5544_triger.io.clk
    io.reset <> ad5544_triger.io.reset
    apbMapping += ad5544_triger.io.apb -> (0x00000, 8 Bytes)

    val ad5544_A_Ctrl = new AD5544("AD5544_1",0x000100)
    io.ad5544_A <> ad5544_A_Ctrl.io.ad5544Interface
    io.clk <> ad5544_A_Ctrl.io.clk
    io.reset <> ad5544_A_Ctrl.io.reset
    ad5544_A_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri
    apbMapping += ad5544_A_Ctrl.io.apb -> (0x000100, 256 Bytes)

//    val ad5544_B_Ctrl = new AD5544("AD5544_2",0x000200)
//    io.ad5544_B <> ad5544_B_Ctrl.io.ad5544Interface
//    io.clk <> ad5544_B_Ctrl.io.clk
//    io.reset <> ad5544_B_Ctrl.io.reset
//    ad5544_B_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri
//    apbMapping += ad5544_B_Ctrl.io.apb -> (0x000200, 256 Bytes)
//
//    val ad5544_C_Ctrl = new AD5544("AD5544_3",0x000300)
//    io.ad5544_C <> ad5544_C_Ctrl.io.ad5544Interface
//    io.clk <> ad5544_C_Ctrl.io.clk
//    io.reset <> ad5544_C_Ctrl.io.reset
//    ad5544_C_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri
//    apbMapping += ad5544_C_Ctrl.io.apb -> (0x000300, 256 Bytes)

    val endat_ctrl = new Apb_Endat("Endat",0x000400)
    //endat_ctrl.io.endat <> io.ENDAT
    io.endat_clk := endat_ctrl.io.endat.clk
    io.endat_write := endat_ctrl.io.endat.data.write
    io.endat_writeEnable := endat_ctrl.io.endat.data.writeEnable
    endat_ctrl.io.endat.data.read := io.endat_read
    endat_ctrl.io.clk <> io.clk
    endat_ctrl.io.reset <> io.reset
    srio_area.endatpostion := endat_ctrl.io.endat_postion
    apbMapping += endat_ctrl.io.apb -> (0x000400, 256 Bytes)

    val ad7606_ctrl = new AD7606("AD7606",0x000500)
    io.ad7606 <> ad7606_ctrl.io.ad7606Interface
    io.clk <> ad7606_ctrl.io.clk
    io.reset <> ad7606_ctrl.io.reset
    apbMapping += ad7606_ctrl.io.apb -> (0x000500, 256 Bytes)

    val srio_intitaor = new Apb_Intitaor(srio_clkdomain,64)
    io.srio.intiator <> srio_intitaor.io.intiator
    apbMapping += srio_intitaor.io.apb -> (0x000600, 256 Bytes)

    val apb_reg = new Apb_Reg("ApbReg",0x000700)
    apb_reg.io.srio_status := io.srio_status
    apb_reg.io.srio_postion := srio_area.srio_regif.io.postion addTag(crossClockDomain)
    apbMapping += apb_reg.io.apb -> (0x000700, 256 Bytes)

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
  }
  addPrePopTask(()=>genRegFileByMarkdown())

}

object Yw_Top extends App{
  SpinalConfig(headerWithDate = true,targetDirectory = "E:/YW/YW_PROJ/YWPROJ.srcs/sources_1/imports/new").generateVerilog(InOutWrapper(new Yw_Top(SramLayout(19, 16))))
}
