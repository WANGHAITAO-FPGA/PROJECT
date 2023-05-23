package MLMC300

import PHPA82._
import PHPA82.ila_test.ila
import PHPA82.regFileGen.{genRegFileByMarkdown, regInsert}
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Decoder, Apb3Gpio, Apb3SlaveFactory}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.io.{InOutWrapper, TriStateArray}
import spinal.lib.{CounterFreeRun, master, slave}
import xilinx.VivadoFlow

import scala.collection.mutable.ArrayBuffer

object Mlmc_Gpio{
  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

case class Mlmc300_Gpio(moduleName:String,baseaddr:Long) extends Component {
  val io = new Bundle {
    val apb  = slave(Apb3(Mlmc_Gpio.getApb3Config()))
    val gpioA = out Bits(12 bits)
    val gpioB = out Bits(12 bits)
  }
  val ctrl = Apb3SlaveFactory(io.apb)
  ctrl.driveAndRead(io.gpioA, 0,bitOffset = 0,documentation = "gpioA输出数据")
  ctrl.driveAndRead(io.gpioB, 4,bitOffset = 0,documentation = "gpioB输出数据")
  ctrl.addDataModel(moduleName,baseaddr)
}

class MlmcTop(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val ad5544_A = master(Ad5544Interface())
    val ad5544_B = master(Ad5544Interface())
    val bissc_master = master(BissCInterface())
    val bissc_slave = Seq.fill(24)(slave (BissCInterface()))
    val gpioA = out Bits(12 bits)
    val gpioB = out Bits(12 bits)
    val clk = in Bool()
    val reset = in Bool()
    val led = out Bool()
    val currentState = out (Bits(3 bits))
    val postion = out (Bits(32 bits))
    val postion_all = out (Bits(41 bits))
    val postion_temp = out (Bits(41 bits))
  }
  noIoPrefix()

  val systemClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset,
    frequency = FixedFrequency(100 MHz)
  )

  val area = new ClockingArea(systemClockDomain){
    val emif_interface = new Emif_Apb(sramLayout)
    io.emif <> emif_interface.io.emif
//    io.emif.addAttribute("MARK_DEBUG","TRUE")
//    emif_interface.io.apb.addAttribute("MARK_DEBUG","TRUE")

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()
    val ad5544_triger = new AD5544_triger("AD5544_Triger",0x000000)
    io.clk <> ad5544_triger.io.clk
    io.reset <> ad5544_triger.io.reset
    apbMapping += ad5544_triger.io.apb -> (0x00000, 8 Bytes)

    val ad5544_1_Ctrl = new AD5544("AD5544_1",0x000100)
    io.ad5544_A <> ad5544_1_Ctrl.io.ad5544Interface
    io.clk <> ad5544_1_Ctrl.io.clk
    io.reset <> ad5544_1_Ctrl.io.reset
    //ad5544_A_Ctrl.io.ad5544_enable := ad5544_temp
    ad5544_1_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri
    apbMapping += ad5544_1_Ctrl.io.apb -> (0x000100, 256 Bytes)

    val ad5544_2_Ctrl = new AD5544("AD5544_2",0x000200)
    io.ad5544_B <> ad5544_2_Ctrl.io.ad5544Interface
    io.clk <> ad5544_2_Ctrl.io.clk
    io.reset <> ad5544_2_Ctrl.io.reset
    ad5544_2_Ctrl.io.ad5544_enable := ad5544_triger.io.ad5544_tri
    apbMapping += ad5544_2_Ctrl.io.apb -> (0x000200, 256 Bytes)

    val bissc_ctrl = new Biss_C("Biss_c",0x000400)
    io.bissc_master <> bissc_ctrl.io.bisscInterface
    io.clk <> bissc_ctrl.io.clk
    io.reset <> bissc_ctrl.io.reset
    apbMapping += bissc_ctrl.io.apb -> (0x000400, 256 Bytes)

    val apb_gpio = new Mlmc300_Gpio("GPIO",0x000500)
    io.gpioA <> apb_gpio.io.gpioA
    io.gpioB <> apb_gpio.io.gpioB
    apbMapping += apb_gpio.io.apb -> (0x000500, 256 Bytes)

    val apb_ram = new ApbRam("RAM",0x000600)
    apbMapping += apb_ram.io.apb -> (0x000600, 256 Bytes)

    val apbDecoder = Apb3Decoder(
      master = emif_interface.io.apb,
      slaves = apbMapping
    )

    val bissc_slave = Seq.fill(24)(new BissC_Slave(41,200))
    for(i <- 0 until 24){
      io.bissc_slave(i) <> bissc_slave(i).io.s_bissc
      bissc_slave(i).io.m_postion := ((bissc_ctrl.io.enc_position_all.asBits.resize(42 bits))<<1).resized
    }
    io.currentState := bissc_slave(0).io.currentState
    io.postion := bissc_ctrl.io.enc_position_all.asBits(40 downto 9)
    io.postion_all := bissc_ctrl.io.enc_position_all.asBits.resized
    io.postion_temp := bissc_slave(0).io.postion_temp.asBits.resized

    val ledtemp = Reg(Bool()) init False

    val counter =  CounterFreeRun(50000000)
    when(counter.willOverflow){
      counter.clear()
      ledtemp := ~ledtemp;
    }
    io.led := ledtemp

    val ila_probe=ila("1",io.emif.emif_cs,io.emif.emif_oe,io.emif.emif_we,io.emif.emif_data.write,io.emif.emif_data.read,io.emif.emif_data.writeEnable,io.emif.emif_addr)
  }
  addPrePopTask(()=>genRegFileByMarkdown())
}

object MLMC300 extends App{
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true

  ).generateVerilog(InOutWrapper(InOutWrapper(new MlmcTop(SramLayout(19,16)))))
}


object MLMC300_Top_Test {
  def main(args: Array[String]): Unit = {
    def VivadoSynth[T <: Component](gen: => T, name: String = "temp"): Unit = {
      val report = VivadoFlow(design = gen, name, s"E:/PHPA82/synthWorkspace/$name").doit()
      report.printArea()
      report.printFMax()
    }
    VivadoSynth(InOutWrapper(InOutWrapper(new MlmcTop(SramLayout(19,16)))), name = "MLMC300")
  }
}