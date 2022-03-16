package UART

import spinal.core._
import spinal.core.sim._
import spinal.lib.{Fragment, master, slave}

class UartTop(bitWidth : Int, txfifodepth: Int, rxfifodepth : Int, rx_waittime : Int) extends Component{
  val io = new Bundle{
    val input = slave Stream Fragment(Bits(bitWidth bit))
    val output = master Stream (Bits(bitWidth bit))
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val uartclkdomain = ClockDomain(io.clk,io.reset,frequency = FixedFrequency(100 MHz))

  val uartarea = new ClockingArea(uartclkdomain){
    val streamfragmentfork = new StreamFragmentFork(bitWidth,7)
    streamfragmentfork.io.input <> io.input

    val streamsequential = new StreamSequential(bitWidth,rxfifodepth)
    streamsequential.io.output <> io.output

    val uartctrlA_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlA_stream.io.stream_in << streamfragmentfork.io.output(0)
    streamsequential.io.input(0) << uartctrlA_stream.io.stream_out
    streamsequential.io.occupancy(0) := uartctrlA_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(0) := uartctrlA_stream.io.rxint
    uartctrlA_stream.io.rxfiforead := streamsequential.io.readfifo(0)

    val uartctrlB_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlB_stream.io.stream_in << streamfragmentfork.io.output(1)
    streamsequential.io.input(1) << uartctrlB_stream.io.stream_out
    streamsequential.io.occupancy(1) := uartctrlB_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(1) := uartctrlB_stream.io.rxint
    uartctrlB_stream.io.rxfiforead := streamsequential.io.readfifo(1)

    val uartctrlC_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlC_stream.io.stream_in << streamfragmentfork.io.output(2)
    streamsequential.io.input(2) << uartctrlC_stream.io.stream_out
    streamsequential.io.occupancy(2) := uartctrlC_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(2) := uartctrlC_stream.io.rxint
    uartctrlC_stream.io.rxfiforead := streamsequential.io.readfifo(2)

    val uartctrlD_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlD_stream.io.stream_in << streamfragmentfork.io.output(3)
    streamsequential.io.input(3) << uartctrlD_stream.io.stream_out
    streamsequential.io.occupancy(3) := uartctrlD_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(3) := uartctrlD_stream.io.rxint
    uartctrlD_stream.io.rxfiforead := streamsequential.io.readfifo(3)

    val uartctrlE_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlE_stream.io.stream_in << streamfragmentfork.io.output(4)
    streamsequential.io.input(4) << uartctrlE_stream.io.stream_out
    streamsequential.io.occupancy(4) := uartctrlE_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(4) := uartctrlE_stream.io.rxint
    uartctrlE_stream.io.rxfiforead := streamsequential.io.readfifo(4)

    val uartctrlF_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlF_stream.io.stream_in << streamfragmentfork.io.output(5)
    streamsequential.io.input(5) << uartctrlF_stream.io.stream_out
    streamsequential.io.occupancy(5) := uartctrlF_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(5) := uartctrlF_stream.io.rxint
    uartctrlF_stream.io.rxfiforead := streamsequential.io.readfifo(5)

    val uartctrlG_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    uartctrlG_stream.io.stream_in << streamfragmentfork.io.output(6)
    streamsequential.io.input(6) << uartctrlG_stream.io.stream_out
    streamsequential.io.occupancy(6) := uartctrlG_stream.io.rxfifooccupancy
    streamsequential.io.interrupt(6) := uartctrlG_stream.io.rxint
    uartctrlG_stream.io.rxfiforead := streamsequential.io.readfifo(6)

    uartctrlA_stream.io.uart.rxd := uartctrlA_stream.io.uart.txd
    uartctrlB_stream.io.uart.rxd := uartctrlB_stream.io.uart.txd
    uartctrlC_stream.io.uart.rxd := uartctrlC_stream.io.uart.txd
    uartctrlD_stream.io.uart.rxd := uartctrlD_stream.io.uart.txd
    uartctrlE_stream.io.uart.rxd := uartctrlE_stream.io.uart.txd
    uartctrlF_stream.io.uart.rxd := uartctrlF_stream.io.uart.txd
    uartctrlG_stream.io.uart.rxd := uartctrlG_stream.io.uart.txd
  }
}

object UartTop{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new UartTop(8,16,16,500)){dut=>
      dut.uartarea.clockDomain.forkStimulus(10)
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.uartarea.clockDomain.waitSampling(10)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0x02
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x02
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0x02
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.io.input.payload.last #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x05
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x03
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.io.input.payload.last #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x06
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x05
      dut.io.input.payload.last #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.uartarea.clockDomain.waitSampling(2000)
    }
  }
}