package Axilite4

import FIBERTOUART.{DecodeRxStream, FiberRxBuffer, FiberRxPreamble, FiberRxStream, FiberTxHeader}
import spinal.core._
import spinal.lib.com.uart.Uart
import spinal.lib.misc.Timer
import spinal.lib.{Fragment, Stream, StreamFifo, master, slave}

import scala.util.Random

case class Modus_StreamTop(fifodepth : Int,lookback : Boolean, cycles_number: Int) extends Component{
  val io = new Bundle{
    val input = slave Stream (Bits(8 bit))
    val output = master(Stream(Fragment(Bits(32 bits))))
    val slaveid = in Bits(8 bit)
    val uart  = if(!lookback) master(Uart()) else null
  }
  noIoPrefix()

  val decoderxstream = new DecodeRxStream()
  decoderxstream.io.input << io.input
  decoderxstream.io.slaveid := io.slaveid

  val uartctrl_stream = new Uart_Stream(fifodepth,cycles_number)
  if(!lookback) uartctrl_stream.io.uart <> io.uart
  else uartctrl_stream.io.uart.rxd := uartctrl_stream.io.uart.txd

  uartctrl_stream.io.stream_in << decoderxstream.io.output
  io.output << uartctrl_stream.io.stream_out
}

class Fiber_StreamTop(portcount : Int, datawidth : Int, fifodepth: Int, timerl_imit: Int,lookback : Boolean,cycles_number : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment((Bits(datawidth bits)))))
    val timer_tick = in Bool()
    val clk = in Bool()
    val reset = in Bool()
    val uart = if(!lookback) Seq.fill(portcount)(master(Uart())) else null
    val slave_id = in Bits(datawidth bits)
  }
  noIoPrefix()

  val fiberclkdomain = ClockDomain(io.clk,io.reset,frequency = FixedFrequency(125 MHz))

  val fiberarea = new ClockingArea(fiberclkdomain){
    val fiberrxpreamble = new FiberRxPreamble(32)
    fiberrxpreamble.io.input << io.input
    fiberrxpreamble.io.slave_id := io.slave_id

    val fiberrxbuffer = new FiberRxBuffer(fiberclkdomain,fiberclkdomain,datawidth,8,1024)
    fiberrxbuffer.io.push.stream << fiberrxpreamble.io.output
    fiberrxpreamble.io.output.addAttribute("MARK_DEBUG","TRUE")

    val fiberrxstream = new FiberRxStream(portcount,8,portcount*datawidth)
    fiberrxstream.io.input << fiberrxbuffer.io.pop.stream
    fiberrxstream.io.input.addAttribute("MARK_DEBUG","TRUE")

    val modbus = Seq.fill(portcount)(new Modus_StreamTop(fifodepth,lookback,cycles_number))

    val stream_connect = new Stream_Connect(datawidth,portcount,cycles_number/4,fifodepth)

    for(i <- 0 until portcount){
      if(!lookback) io.uart(i) <> modbus(i).io.uart
      modbus(i).io.input << fiberrxstream.io.output(i)
      modbus(i).io.slaveid := i + 1
      stream_connect.io.inputs(i) << modbus(i).io.output
    }

    val timer = Timer(32)
    timer.io.tick := io.timer_tick
    timer.io.limit := timerl_imit
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }
    stream_connect.io.tick := timer.io.full

    val streamfifo = new StreamFifo(Bits(datawidth bits),64)
    streamfifo.io.push << stream_connect.io.output

    val fibertxheader = new FiberTxHeader(32)
    fibertxheader.io.input.payload.fragment := streamfifo.io.pop.payload
    fibertxheader.io.input.payload.last := (streamfifo.io.occupancy === 1) && fibertxheader.io.input.fire
    fibertxheader.io.input.valid := streamfifo.io.pop.valid
    streamfifo.io.pop.ready := fibertxheader.io.input.ready

    fibertxheader.io.slave_id := io.slave_id
    io.output << fibertxheader.io.output
  }
}

case class FiberTest_() extends Fiber_StreamTop(7,32,16,5000,true,32){
  import spinal.core.sim._
  def init: Unit ={
    fiberarea.clockDomain.forkStimulus(10)
    io.input.payload.last #= false
    io.input.valid #= false
    io.output.ready #= true
    io.timer_tick #= true
    fiberarea.clockDomain.waitSampling(10)
  }
  def header: Unit ={
    io.input.payload.fragment #= 0x00F1F2F3
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0x00000002
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
  }
  def modbus_read(slaveid:Int, functioncode:Int, addr: Int, length: Int, crc: Int, last : Boolean): Unit ={
    io.input.payload.fragment #= (slaveid<<24)+(functioncode<<16)+addr
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= (length>>16)+crc
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    if(last)io.input.payload.last #= true else io.input.payload.last #= false
    fiberarea.clockDomain.waitSampling()
  }
  def modbus_write(slaveid:Int, functioncode:Int, addr: Int, length: Int, data: Int, crc: Int, last : Boolean): Unit ={
    io.input.payload.fragment #= (slaveid<<24)+(functioncode<<16)+addr
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0x00010200
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= ((data&0xff)<<24)+(crc<<8)
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    if(last)io.input.payload.last #= true else io.input.payload.last #= false
    fiberarea.clockDomain.waitSampling()
  }
  def reset : Unit ={
    io.input.valid #= false
    io.input.payload.last #= false
  }

  def waitcycle(count: Int): Unit ={
    for(i <- 0 until count){
      fiberarea.clockDomain.waitSampling()
    }
  }
}

object FiberTop{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(new FiberTest_())
    dut.doSim{dut=>
      dut.init
      dut.io.slave_id #= 2
      dut.header
      dut.modbus_write(1,16,300,1,85,340,false)
      dut.modbus_write(2,16,300,1,85,340,false)
      dut.modbus_write(3,16,300,1,85,340,false)
      dut.modbus_write(4,16,300,1,85,340,false)
      dut.modbus_write(5,16,300,1,85,340,false)
      dut.modbus_write(6,16,300,1,85,340,false)
      dut.modbus_write(7,16,300,1,85,340,true)
      dut.reset
      dut.fiberarea.clockDomain.waitSampling(10000)
      for(i <- 0 until 10000){
        dut.io.output.ready #= Random.nextBoolean()
        dut.fiberarea.clockDomain.waitSampling()
      }
    }
  }
}