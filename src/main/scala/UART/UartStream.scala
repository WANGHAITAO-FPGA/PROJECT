package UART

import spinal.core._
import spinal.core.sim.SimConfig
import spinal.lib.com.uart.{Uart, UartCtrl, UartCtrlGenerics, UartCtrlInitConfig, UartCtrlMemoryMappedConfig, UartParityType, UartStopType}
import spinal.lib.{Counter, CounterFreeRun, Stream, StreamFifo, master, slave}
import spinal.core.sim._
import spinal.lib.misc.Timer

case class uartctrl_stream(txfifodepth : Int,rxfifodepth :Int,rx_waittime : Int) extends Component{
  val uartconfig = UartCtrlInitConfig(
    baudrate = 921600,
    dataLength = 7,  // 8 bits
    parity = UartParityType.NONE,
    stop = UartStopType.ONE
  )
  val io = new Bundle{
    val stream_in = slave(Stream(Bits(uartconfig.dataLength+1 bit)))
    val stream_out = master(Stream(Bits(uartconfig.dataLength+1 bit)))
    val uart  = master(Uart())
    val rxint = out Bool()
    val rxfiforead = in Bool()
    val rxfifooccupancy = out UInt (log2Up(rxfifodepth + 1) bits)
  }
  noIoPrefix()

  val uartCtrl = UartCtrl(config = uartconfig)
  uartCtrl.io.uart <> io.uart

  val txfifo = StreamFifo(Bits(uartconfig.dataLength+1 bit),txfifodepth)
  txfifo.io.push << io.stream_in
  txfifo.io.pop >> uartCtrl.io.write

  val nodatareceive = Reg(Bool()) init True
  val counter = new Counter(0,rx_waittime)
  counter.increment()
  when(uartCtrl.io.read.valid.rise()){
    counter.clear()
    nodatareceive := False
  }
  when((!nodatareceive)&&(counter.willOverflow)){
    nodatareceive := True
  }

  val rxfifo = StreamFifo(Bits(uartconfig.dataLength+1 bit),rxfifodepth)
  rxfifo.io.push << uartCtrl.io.read

  val interrupt = RegInit(False)
  when(nodatareceive.rise()&&(rxfifo.io.occupancy > 0)){
    interrupt := True
  }elsewhen(rxfifo.io.occupancy === 0){
    interrupt := False
  }otherwise{
    interrupt := interrupt
  }
  io.rxint := interrupt

  //io.stream_out << rxfifo.io.pop.continueWhen(io.rxfiforead)
  io.stream_out.payload := rxfifo.io.pop.payload
  io.stream_out.valid := rxfifo.io.pop.valid & io.rxfiforead
  rxfifo.io.pop.ready := io.rxfiforead

  io.rxfifooccupancy := rxfifo.io.occupancy
}

/*class UartStream(txfifodepth : Int,rxfifodepth :Int,rx_waittime : Int) extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val stream_in = slave(Stream(Bits(8 bits)))
    val stream_out = master(Stream(Bits(8 bits)))
  }
  noIoPrefix()

  val uartclkdomain = ClockDomain(io.clk,io.reset,frequency = FixedFrequency(125 MHz))

  val uartarea = new ClockingArea(uartclkdomain){
    val uartctrl = uartctrl_stream(16,16,500)
    uartctrl.io.stream_in <> io.stream_in
    uartctrl.io.uart.rxd := uartctrl.io.uart.txd

    uartctrl.io.rxfiforead := False
    when(uartctrl.io.rxint){
      uartctrl.io.rxfiforead := True
    }

    io.stream_out <> uartctrl.io.stream_out
  }
}
*/
/*
object UartStream extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new UartStream())
}*/
/*
object UartStream{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new UartStream(16,16,800)){dut=>
      dut.uartarea.clockDomain.forkStimulus(10)
      dut.io.stream_in.valid #= false
      dut.io.stream_in.payload #= 0x00
      dut.uartarea.clockDomain.waitSampling(1000)
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x04
      dut.uartarea.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x05
      dut.uartarea.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x06
      dut.uartarea.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x07
      dut.uartarea.clockDomain.waitSampling()
      dut.io.stream_in.valid #= false
      dut.io.stream_in.payload #= 0x00
      dut.uartarea.clockDomain.waitSampling(10000)
    }
  }
}*/