package MIX_STREAM

import FIBERTOUART.{FiberRxPreamble, FiberTxBuffer, FiberTxPadder}
import spinal.core._
import spinal.lib.misc.Timer
import spinal.lib.{Fragment, Stream, StreamFifo, StreamFragmentWidthAdapter, master, slave}

case class MO_RX(cycles_number: Int, timerl_imit : Int) extends Component{
  val io = new Bundle{
    val hssl1_clk = in Bool()
    val hssl2_clk = in Bool()
    val srio_clk = in Bool()
    val reset = in Bool()
    val hssl1_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl1_slaveid = in Bits(32 bits)
    val hssl2_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl2_slaveid = in Bits(32 bits)
    val hssl3_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl3_slaveid = in Bits(32 bits)
    val hssl4_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl4_slaveid = in Bits(32 bits)
    val srio_output = master(Stream(Fragment(Bits(64 bits))))
    val timer_tick = in Bool()
  }
  noIoPrefix()

  val hssl1_clkdomain = ClockDomain(io.hssl1_clk,io.reset)
  val hssl2_clkdomain = ClockDomain(io.hssl2_clk,io.reset)
  val srio_clkdomain = ClockDomain(io.srio_clk,io.reset)

  val hssl1_area = new ClockingArea(hssl1_clkdomain){
    val hssl1_rxpreamble = FiberRxPreamble(32)
    hssl1_rxpreamble.io.input << io.hssl1_input
    hssl1_rxpreamble.io.slave_id := io.hssl1_slaveid
    val hssl1_rxpadder = FiberTxPadder(32,cycles_number)
    hssl1_rxpadder.io.input << hssl1_rxpreamble.io.output

    val hssl1_stream = master(Stream(Fragment(Bits(64 bits))))
    StreamFragmentWidthAdapter(hssl1_rxpadder.io.output,hssl1_stream)
  }

  val hssl2_area = new ClockingArea(hssl2_clkdomain){
    val hssl2_rxpreamble = FiberRxPreamble(32)
    hssl2_rxpreamble.io.input << io.hssl2_input
    hssl2_rxpreamble.io.slave_id := io.hssl2_slaveid
    val hssl2_rxpadder = FiberTxPadder(32,cycles_number)
    hssl2_rxpadder.io.input << hssl2_rxpreamble.io.output
    val hssl2_stream = master(Stream(Fragment(Bits(64 bits))))
    StreamFragmentWidthAdapter(hssl2_rxpadder.io.output,hssl2_stream)

    val hssl3_rxpreamble = FiberRxPreamble(32)
    hssl3_rxpreamble.io.input << io.hssl3_input
    hssl3_rxpreamble.io.slave_id := io.hssl3_slaveid
    val hssl3_rxpadder = FiberTxPadder(32,cycles_number)
    hssl3_rxpadder.io.input << hssl3_rxpreamble.io.output
    val hssl3_stream = master(Stream(Fragment(Bits(64 bits))))
    StreamFragmentWidthAdapter(hssl3_rxpadder.io.output,hssl3_stream)

    val hssl4_rxpreamble = FiberRxPreamble(32)
    hssl4_rxpreamble.io.input << io.hssl4_input
    hssl4_rxpreamble.io.slave_id := io.hssl4_slaveid
    val hssl4_rxpadder = FiberTxPadder(32,cycles_number)
    hssl4_rxpadder.io.input << hssl4_rxpreamble.io.output
    val hssl4_stream = master(Stream(Fragment(Bits(64 bits))))
    StreamFragmentWidthAdapter(hssl4_rxpadder.io.output,hssl4_stream)
  }

  val srio_area = new ClockingArea(srio_clkdomain){
    val timer = Timer(32)
    timer.io.tick := io.timer_tick
    timer.io.limit := timerl_imit
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }

    val stream_mix = new RxStream_Mix(hssl1_clkdomain,hssl2_clkdomain,srio_clkdomain,64,cycles_number/2,cycles_number*2)
    stream_mix.io.hssl_inputs1 << hssl1_area.hssl1_stream
    stream_mix.io.hssl_inputs2 << hssl2_area.hssl2_stream
    stream_mix.io.hssl_inputs3 << hssl2_area.hssl3_stream
    stream_mix.io.hssl_inputs4 << hssl2_area.hssl4_stream
    stream_mix.io.tick := timer.io.full
    stream_mix.io.header := B"64x0600000000000000"
    io.srio_output << stream_mix.io.output
  }
}


