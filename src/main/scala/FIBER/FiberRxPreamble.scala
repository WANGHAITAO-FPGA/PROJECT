package FIBER

import CRCCORE.{CRC32, CRCCombinational, CRCCombinationalCmdMode, CRCCombinationalConfig}
import PHPA82.dac_ad5544
import PHPA82.regFileGen.genRegFileByMarkdown
import SimpleBus.{SimpleBus, SimpleBusConfig}
import spinal.core._
import spinal.lib._

import scala.util.Random

case class FiberRxPreamble(datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
  }
  noIoPrefix()

  val startDelimiter = B"x00F1F2F3"
  val startDelimiterWidth = datawidth
  val history = History(io.input, 0 until startDelimiterWidth/datawidth, when = io.input.fire)
  val historyDataCat = B(Cat(history.map(_.payload.fragment).reverse))
  val hit = history.map(_.valid).andR && historyDataCat === startDelimiter
  val inFrame = RegInit(False)

  io.output.valid := False
  io.output.payload  := io.input.payload
  io.input.ready := !inFrame || io.output.ready
  io.output.last := io.input.last

  when(!inFrame){
    when(hit){
      inFrame := True
    }
  } otherwise {
    when(io.input.valid) {
      io.output.valid := True
      when(io.output.ready && io.input.last){
        inFrame := False
      }
    }
  }
}


case class FiberRxChecker(datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    //val crc_error = out Bool()
    val output_enable = out Bool()
    val recieve_done = out Bool()
  }
  noIoPrefix()

  val crc32 = new CRCCombinational(CRCCombinationalConfig(CRC32.Standard,32 bits))
  val crc_error = Reg(Bool()) init False
  crc32.io.cmd.valid := io.input.valid
  crc32.io.cmd.data := io.input.payload.fragment
  crc32.io.cmd.mode := CRCCombinationalCmdMode.UPDATE

  val output_enable = Reg(Bool()) init False
  when(io.input.valid && io.input.last) {
    crc32.io.cmd.mode := CRCCombinationalCmdMode.INIT
    //crc_error := io.input.payload.fragment =/= crc32.io.crc
    output_enable := io.input.payload.fragment === crc32.io.crc
  }otherwise{
    output_enable := False
  }
  io.output.valid := io.input.valid
  io.output.last := io.input.last
  io.output.payload := io.input.payload
  io.input.ready := io.output.ready
  //io.crc_error := crc_error
  io.output_enable := output_enable
  io.recieve_done := RegNext(io.input.last)
}



case class FiberRxTest(addrwidth : Int, datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val clk = in Bool()
    val reset = in Bool()
    //val simplebus = master(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
  }
  noIoPrefix()

  val domain = new ClockDomain(io.clk,io.reset)

  val area = new ClockingArea(domain){
    val fiberrxpreamble = new FiberRxPreamble(datawidth)
    fiberrxpreamble.io.input << io.input
    val fiberrxchecker = new FiberRxChecker(datawidth)
    fiberrxchecker.io.input << fiberrxpreamble.io.output
    val fibersimplebus = new FiberRxSimpleBus(addrwidth,datawidth)
    fibersimplebus.io.input << fiberrxchecker.io.output
    //io.simplebus <> fibersimplebus.io.simplebus
    val fiberregif = new FiberRegif(addrwidth,datawidth)
    fiberregif.io.simplebus.WENABLE := fibersimplebus.io.wenable
    fiberregif.io.simplebus.WADDR := fibersimplebus.io.waddr
    fiberregif.io.simplebus.WDATA := fibersimplebus.io.wdata

    val fibertxsimplebus = new FiberTxSimpleBus(addrwidth,datawidth,500,0,3)
    fiberregif.io.simplebus.RADDR := fibertxsimplebus.io.RADDR
    fiberregif.io.simplebus.RENABLE := fibertxsimplebus.io.RENABLE
    fibertxsimplebus.io.RDATA := fiberregif.io.simplebus.RDATA

    fiberregif.io.output_enable := fiberrxchecker.io.output_enable
    fiberregif.io.receive_done := fiberrxchecker.io.recieve_done

    fibertxsimplebus.io.output <> io.output
    fibertxsimplebus.io.timer_tick := True

    /*val fibertxstream = new FiberTxStream(datawidth,10)
    fibertxstream.io.input << fibertxsimplebus.io.output
    io.output <> fibertxstream.io.output*/

    val ad5544_ctrl = new dac_ad5544
    ad5544_ctrl.io.AD5544_DATA_IN1 := fiberregif.AD5544_DATA_0.asUInt
    ad5544_ctrl.io.AD5544_DATA_IN2 := fiberregif.AD5544_DATA_1.asUInt
    ad5544_ctrl.io.AD5544_DATA_IN3 := fiberregif.AD5544_DATA_2.asUInt
    ad5544_ctrl.io.AD5544_DATA_IN4 := fiberregif.AD5544_DATA_3.asUInt
    ad5544_ctrl.io.ad5544_trig := fiberregif.AD5544_0_Triger
    ad5544_ctrl.io.clk <> io.clk
    ad5544_ctrl.io.reset <> io.reset
  }

  addPrePopTask(()=>genRegFileByMarkdown())
}

/*object FiberRxTest extends App{
  SpinalVerilog(new FiberRxTest(16,32))
}*/

object FiberRxTest{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new FiberRxTest(16,32)){dut=>
      dut.area.clockDomain.forkStimulus(10)
      dut.io.input.valid #= false
      dut.io.input.last #= false
      dut.io.output.ready #= true
      dut.area.clockDomain.waitSampling(10)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00F1F2F3
      dut.area.clockDomain.waitSampling()
      dut.io.input.payload.fragment #= 0x00000504
      dut.area.clockDomain.waitSampling()
      dut.io.input.payload.fragment #= 0x01020304
      dut.area.clockDomain.waitSampling()
      dut.io.input.payload.fragment #= 0x3DB31AF3
      dut.io.input.last #= true
      dut.area.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.last #= false
      val idx = 0
      for(idx <- 0 until 1000){
        //dut.io.output.ready #= Random.nextBoolean()
        dut.area.clockDomain.waitSampling()
      }
      dut.area.clockDomain.waitSampling(10000)
    }
  }
}








