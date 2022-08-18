package Axilite4

import FIBERTOUART.{FiberTxBuffer, FiberTxPadder}
import spinal.core._
import spinal.lib.com.uart.{Uart, UartCtrl, UartCtrlInitConfig, UartParityType, UartStopType}
import spinal.lib.{Counter, Fragment, Stream, StreamFifo, master, slave}

case class Uart_Stream(fifodepth : Int, cycles_number: Int) extends Component{
  val uartconfig = UartCtrlInitConfig(
    baudrate = 3000000,
    dataLength = 7,  // 8 bits
    parity = UartParityType.EVEN,
    stop = UartStopType.ONE
  )
  val io = new Bundle{
    val stream_in = slave(Stream(Bits(uartconfig.dataLength+1 bit)))
    val stream_out = master(Stream(Fragment(Bits(32 bits))))
    val uart  = master(Uart())
  }
  noIoPrefix()

  val uartCtrl = UartCtrl(config = uartconfig)
  uartCtrl.io.uart <> io.uart

  val txfifo = StreamFifo(Bits(uartconfig.dataLength+1 bit),fifodepth)
  txfifo.io.push << io.stream_in
  txfifo.io.pop >> uartCtrl.io.write

  val nodatareceive = Reg(Bool()) init True
  val counter = new Counter(0,(125000000/uartconfig.baudrate)*20)
  counter.increment()
  when(uartCtrl.io.read.valid.rise()){
    counter.clear()
    nodatareceive := False
  }
  when((!nodatareceive)&&(counter.willOverflow)){
    nodatareceive := True
  }

  val rxfifo = StreamFifo(Bits(uartconfig.dataLength+1 bit),fifodepth)
  rxfifo.io.push << uartCtrl.io.read

  val ready = Reg(Bool()) init False
  when(nodatareceive.rise()){
    ready := True
  }elsewhen(rxfifo.io.occupancy === 0){
    ready := False
  }otherwise{
    ready := ready
  }

  val padder = new FiberTxPadder(uartconfig.dataLength+1,cycles_number)
  padder.io.input.payload.fragment := rxfifo.io.pop.payload
  padder.io.input.payload.last := (rxfifo.io.occupancy === 1) && rxfifo.io.pop.valid
  padder.io.input.valid := rxfifo.io.pop.valid && ready
  rxfifo.io.pop.ready := ready

//  io.stream_out << padder.io.output

  val tx_buffer = FiberTxBuffer(this.clockDomain,this.clockDomain,uartconfig.dataLength+1,32,cycles_number,cycles_number/4)
  tx_buffer.io.push.stream << padder.io.output
  io.stream_out.payload.fragment := tx_buffer.io.pop.stream.payload
  io.stream_out.payload.last := tx_buffer.io.pop.last
  io.stream_out.valid := tx_buffer.io.pop.stream.valid
  tx_buffer.io.pop.stream.ready := io.stream_out.ready
}

//object Uart_Stream extends App{
//  SpinalConfig(defaultClockDomainFrequency = FixedFrequency(125 MHz)).generateVerilog(new Uart_Stream(16,true,16))
//}


//object Uart_Stream_Sim{
//  import spinal.core.sim._
//
//  def main(args: Array[String]): Unit = {
//    SimConfig.withConfig(SpinalConfig(defaultClockDomainFrequency = FixedFrequency(125 MHz))).withWave.doSim(new Uart_Stream(16,32)){dut=>
//      dut.clockDomain.forkStimulus(8)
//      dut.io.stream_in.valid #= false
//      dut.io.stream_out.ready #= true
//      dut.clockDomain.waitSampling(20)
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 11
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 22
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 33
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 44
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= false
//      dut.clockDomain.waitSampling(3000)
//      dut.clockDomain.waitSampling(20)
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 55
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 66
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 77
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= true
//      dut.io.stream_in.payload #= 88
//      dut.clockDomain.waitSampling()
//      dut.io.stream_in.valid #= false
//      dut.clockDomain.waitSampling(3000)
//    }
//  }
//}

