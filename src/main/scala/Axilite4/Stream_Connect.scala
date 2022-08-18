package Axilite4

import FIBERTOUART.FiberTxPadder
import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.misc.Timer
import spinal.lib.{Counter, Fragment, Stream, StreamFifo, StreamFifoLowLatency, StreamMux, master, slave}

case class Stream_Tx(datawidth : Int, fifo_depth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Bits(datawidth bits)))
  }
  noIoPrefix()

  val stream_fifo = new StreamFifo(Bits(datawidth bits),fifo_depth)
  stream_fifo.io.push.payload := io.input.payload.fragment
  stream_fifo.io.push.valid := io.input.valid
  io.input.ready := stream_fifo.io.push.ready

  stream_fifo.io.pop.ready := io.output.ready

  val data_trigger = Reg(Bool()) init False
  when(io.input.payload.last){
    data_trigger := True
  }elsewhen(stream_fifo.io.occupancy === 0){
    data_trigger := False
  }otherwise{
    data_trigger := data_trigger
  }

  io.output.payload := Mux(data_trigger,stream_fifo.io.pop.payload,B"32'x0")
  io.output.valid := io.output.ready
}

case class Stream_Connect(datawidth : Int, portCount : Int, data_length : Int, fifo_depth : Int) extends Component{
  val io = new Bundle{
    val inputs = Vec(slave Stream(Fragment(Bits(datawidth bits))), portCount)
    val output = master Stream ((Bits(datawidth bits)))
    val tick = in Bool()
  }
  noIoPrefix()

  val stream = Seq.fill(portCount)(new Stream_Tx(datawidth,fifo_depth))
  for(i <- 0 until portCount){
    stream(i).io.input << io.inputs(i)
  }

  val ready = Reg(Bool()) init False
  val streammux = new StreamMux(Bits(datawidth bits),portCount)
  for(i <- 0 until portCount){
    streammux.io.inputs(i) << stream(i).io.output
  }
  val tick = Reg(Bool()) init False
  tick := io.tick
  val start = Reg(Bool()) init False
  val counter = new Counter(0,portCount * data_length)
  when(tick.rise()){
    start := True
    ready := True
  }

  when(start){
    counter.increment()
  }
  when(counter.value === portCount*data_length){
    counter.clear()
    start := False
  }elsewhen(counter.value === portCount*data_length-1){
    ready := False
  }

  val select = Reg(UInt (log2Up(portCount) bits)) init 0
  for(i <- 0 until portCount){
    when((counter.value >= data_length*i)&&(counter.value < data_length*(i+1))){
      select := i
    }
  }
  streammux.io.select := select

  io.output.payload := streammux.io.output.payload
  io.output.valid := streammux.io.output.valid
  streammux.io.output.ready := RegNext(ready)
}






//object Stream_Tx_Sim{
//  import spinal.core.sim._
//  def main(args: Array[String]): Unit = {
//    SimConfig.withWave.doSim(new Stream_Connect(32,3,4,16)){dut=>
//      dut.clockDomain.forkStimulus(10)
//      dut.io.inputs(0).valid #= false
//      dut.io.inputs(0).payload.last #= false
//      dut.io.inputs(1).valid #= false
//      dut.io.inputs(1).payload.last #= false
//      dut.io.inputs(2).valid #= false
//      dut.io.inputs(2).payload.last #= false
//      dut.io.output.ready #= true
//      dut.io.tick #= false
//      dut.clockDomain.waitSampling(10)
//      dut.io.inputs(0).valid #= true
//      dut.io.inputs(0).payload.fragment #= 1
//      dut.clockDomain.waitSampling()
//      dut.io.inputs(0).valid #= true
//      dut.io.inputs(0).payload.fragment #= 2
//      dut.clockDomain.waitSampling()
//      dut.io.inputs(0).valid #= true
//      dut.io.inputs(0).payload.fragment #= 3
//      dut.clockDomain.waitSampling()
//      dut.io.inputs(0).valid #= true
//      dut.io.inputs(0).payload.fragment #= 4
//      dut.io.inputs(0).payload.last #= true
//      dut.clockDomain.waitSampling()
//      dut.io.inputs(0).valid #= false
//      dut.io.inputs(0).payload.last #= false
//      dut.clockDomain.waitSampling(50)
//      dut.io.tick #= true
//      dut.clockDomain.waitSampling()
//      dut.io.tick #= false
//      dut.clockDomain.waitSampling(500)
//    }
//  }
//}




