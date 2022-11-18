package MIX_STREAM

import spinal.core._
import spinal.lib.{Counter, Fragment, PulseCCByToggle, Stream, StreamFifo, StreamFifoCC, StreamFifoLowLatency, StreamMux, master, slave, traversableOncePimped}

import scala.util.Random

case class RxStream_Fifo(puscd : ClockDomain, popcd : ClockDomain, datawidth : Int, fifo_depth : Int) extends Component {
  val io = new Bundle {
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Bits(datawidth bits)))
    val tick = in Bool()
  }
  noIoPrefix()

  val push_area = new ClockingArea(puscd) {
    val stream_fifo = new StreamFifoCC(Bits(datawidth bits), fifo_depth, puscd, popcd)
    stream_fifo.io.push.payload := io.input.payload.fragment
    stream_fifo.io.push.valid := io.input.valid
    io.input.ready := stream_fifo.io.push.ready

    val pulse = new PulseCCByToggle(puscd,popcd)
    pulse.io.pulseIn := io.input.payload.last
  }

  val pop_area = new ClockingArea(popcd) {
    val data_trigger = Reg(Bool()) init False
    val trigger = Reg(Bool()) init False
    when(push_area.pulse.io.pulseOut){
      data_trigger := True
    }elsewhen(push_area.stream_fifo.io.popOccupancy === 0){
      data_trigger := False
    }otherwise{
      data_trigger := data_trigger
    }
    val tick = Reg(Bool()) init False
    tick := io.tick
    when(tick.rise){
      trigger := data_trigger
    }elsewhen(push_area.stream_fifo.io.popOccupancy === 0){
      trigger := False
    }otherwise{
      trigger := trigger
    }

    push_area.stream_fifo.io.pop.ready := io.output.ready && trigger
    io.output.payload := Mux(trigger, push_area.stream_fifo.io.pop.payload, B"64'x0")
    io.output.valid := io.output.ready
  }
}

case class RxStream_Mix(hssl1_cd : ClockDomain, hssl2_cd : ClockDomain, popcd : ClockDomain, datawidth : Int, data_length : Int, fifo_depth : Int) extends Component{
  val io = new Bundle{
    val hssl_inputs1 = slave Stream(Fragment(Bits(datawidth bits)))
    val hssl_inputs2 = slave Stream(Fragment(Bits(datawidth bits)))
    val hssl_inputs3 = slave Stream(Fragment(Bits(datawidth bits)))
    val hssl_inputs4 = slave Stream(Fragment(Bits(datawidth bits)))
    val output = master Stream (Fragment(Bits(datawidth bits)))
    val tick = in Bool()
    val header = in Bits(64 bits)
  }
  noIoPrefix()

  val hssl1_pusharea = new ClockingArea(hssl1_cd) {
    val hssl1_stream_fifo = RxStream_Fifo(hssl1_cd,popcd,datawidth,fifo_depth)
    hssl1_stream_fifo.io.input << io.hssl_inputs1
    hssl1_stream_fifo.io.tick := io.tick
  }

  val hssl2_pusharea = new ClockingArea(hssl2_cd) {
    val hssl2_stream_fifo = RxStream_Fifo(hssl2_cd,popcd,datawidth,fifo_depth)
    hssl2_stream_fifo.io.input << io.hssl_inputs2
    hssl2_stream_fifo.io.tick := io.tick
    val hssl3_stream_fifo = RxStream_Fifo(hssl2_cd,popcd,datawidth,fifo_depth)
    hssl3_stream_fifo.io.input << io.hssl_inputs3
    hssl3_stream_fifo.io.tick := io.tick
    val hssl4_stream_fifo = RxStream_Fifo(hssl2_cd,popcd,datawidth,fifo_depth)
    hssl4_stream_fifo.io.input << io.hssl_inputs4
    hssl4_stream_fifo.io.tick := io.tick
  }

  val poparea = new ClockingArea(popcd){
    val streammux = new StreamMux(Bits(datawidth bits),4)
    streammux.io.inputs(0) << hssl1_pusharea.hssl1_stream_fifo.io.output
    streammux.io.inputs(1) << hssl2_pusharea.hssl2_stream_fifo.io.output
    streammux.io.inputs(2) << hssl2_pusharea.hssl3_stream_fifo.io.output
    streammux.io.inputs(3) << hssl2_pusharea.hssl4_stream_fifo.io.output

    val ready = Reg(Bool()) init False
    val tick = Reg(Bool()) init False
    val last = Reg(Bool()) init False
    tick := io.tick
    val start = Reg(Bool()) init False
    val counter = new Counter(0,4 * data_length)
    last := False
    when(tick.rise()){
      start := True
      ready := True
    }
    when(start){
      counter.increment()
    }
    when(counter.value === 4*data_length){
      counter.clear()
      start := False
    }elsewhen(counter.value === 4*data_length-1){
      ready := False
      last := True
    }

    val select = Reg(UInt (log2Up(4) bits)) init 0
    for(i <- 0 until 4){
      when((counter.value >= data_length*i)&&(counter.value < data_length*(i+1))){
        select := i
      }
    }
    streammux.io.select := select

    val mix_stream = new StreamFifo(Bits(datawidth bits),fifo_depth*4)
    mix_stream.io.push.valid := streammux.io.output.valid
    mix_stream.io.push.payload := streammux.io.output.payload
    streammux.io.output.ready := RegNext(ready)

    val tx_header = new TxHeader(datawidth)
    tx_header.io.input.payload.fragment := mix_stream.io.pop.payload
    tx_header.io.input.valid := mix_stream.io.pop.valid
    mix_stream.io.pop.ready := tx_header.io.input.ready
    tx_header.io.input.last := (mix_stream.io.occupancy === 1) && tx_header.io.input.fire
    tx_header.io.header := io.header
    io.output << tx_header.io.output
  }
}



case class TxHeader(dataWidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
    val header = in Bits(64 bits)
  }

  val header = io.header
  val headerWords = 64/dataWidth
  val state = Reg(UInt(log2Up(headerWords + 1) bits)) init(0)
  io.output.valid := io.input.valid
  io.output.last := io.input.last
  io.input.ready := False
  when(state === headerWords){
    io.input.ready := io.output.ready
    io.output.payload := io.input.payload
  } otherwise {
    io.output.payload.fragment := header.subdivideIn(dataWidth bits).reverse.read(state.resized)
    when(io.output.fire) {
      state := state + 1
    }
  }
  when(io.input.lastFire){
    state := 0
  }
}


object RxStream_Mix{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new RxStream_Mix(ClockDomain.external("hssl1"),ClockDomain.external("hssl2"),ClockDomain.external("pop"),64,4,16)){
      dut=>
        dut.io.hssl_inputs1.valid #= false
        dut.io.hssl_inputs2.valid #= false
        dut.io.hssl_inputs3.valid #= false
        dut.io.hssl_inputs4.valid #= false
        dut.io.hssl_inputs1.payload.last #= false
        dut.io.hssl_inputs2.payload.last #= false
        dut.io.hssl_inputs3.payload.last #= false
        dut.io.hssl_inputs4.payload.last #= false
        dut.io.output.ready #= Random.nextBoolean()
        dut.io.tick #= false
        dut.io.header #= 0x11223344
        dut.poparea.clockDomain.forkStimulus(20)
        dut.hssl1_pusharea.clockDomain.forkStimulus(8)
        dut.hssl2_pusharea.clockDomain.forkStimulus(8)
        dut.hssl1_pusharea.clockDomain.waitSampling(100)
        for(i <- 0 until 10){
          dut.io.output.ready #= Random.nextBoolean()
          dut.io.hssl_inputs1.valid #= true
          dut.io.hssl_inputs1.payload.fragment #= 0x01020304
          dut.io.output.ready #= Random.nextBoolean()
          dut.hssl1_pusharea.clockDomain.waitSampling()
          dut.io.hssl_inputs1.valid #= true
          dut.io.hssl_inputs1.payload.fragment #= 0x02030405
          dut.io.hssl_inputs2.valid #= true
          dut.io.hssl_inputs2.payload.fragment #= 0x01
          dut.io.hssl_inputs3.valid #= true
          dut.io.hssl_inputs3.payload.fragment #= 0x01
          dut.io.hssl_inputs4.valid #= true
          dut.io.hssl_inputs4.payload.fragment #= 0x01
          dut.io.output.ready #= Random.nextBoolean()
          dut.hssl1_pusharea.clockDomain.waitSampling()
          dut.io.hssl_inputs1.valid #= true
          dut.io.hssl_inputs1.payload.fragment #= 0x03040506
          dut.io.hssl_inputs2.valid #= true
          dut.io.hssl_inputs2.payload.fragment #= 0x02
          dut.io.hssl_inputs3.valid #= true
          dut.io.hssl_inputs3.payload.fragment #= 0x02
          dut.io.hssl_inputs4.valid #= true
          dut.io.hssl_inputs4.payload.fragment #= 0x02
          dut.io.output.ready #= Random.nextBoolean()
          dut.hssl1_pusharea.clockDomain.waitSampling()
          dut.io.hssl_inputs1.valid #= true
          dut.io.hssl_inputs1.payload.last #= true
          dut.io.hssl_inputs1.payload.fragment #= 0x04050607
          dut.io.hssl_inputs2.valid #= true
          dut.io.hssl_inputs2.payload.fragment #= 0x03
          dut.io.hssl_inputs3.valid #= true
          dut.io.hssl_inputs3.payload.fragment #= 0x03
          dut.io.hssl_inputs4.valid #= true
          dut.io.hssl_inputs4.payload.fragment #= 0x03
          dut.io.tick #= true
          dut.io.output.ready #= Random.nextBoolean()
          dut.hssl1_pusharea.clockDomain.waitSampling()
          dut.io.hssl_inputs1.valid #= false
          dut.io.hssl_inputs1.payload.last #= false
          dut.io.hssl_inputs2.valid #= true
          dut.io.hssl_inputs2.payload.last #= true
          dut.io.hssl_inputs2.payload.fragment #= 0x04
          dut.io.hssl_inputs3.valid #= true
          dut.io.hssl_inputs3.payload.last #= true
          dut.io.hssl_inputs3.payload.fragment #= 0x04
          dut.io.hssl_inputs4.valid #= true
          dut.io.hssl_inputs4.payload.last #= true
          dut.io.hssl_inputs4.payload.fragment #= 0x04
          dut.io.output.ready #= Random.nextBoolean()
          dut.hssl1_pusharea.clockDomain.waitSampling()
          dut.io.hssl_inputs2.valid #= false
          dut.io.hssl_inputs2.payload.last #= false
          dut.io.hssl_inputs3.valid #= false
          dut.io.hssl_inputs3.payload.last #= false
          dut.io.hssl_inputs4.valid #= false
          dut.io.hssl_inputs4.payload.last #= false
          dut.io.tick #= false
          for(id <- 0 until 500){
            dut.poparea.clockDomain.waitSampling()
            dut.io.output.ready #= Random.nextBoolean()
          }


        }

    }
  }
}