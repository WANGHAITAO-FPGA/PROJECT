package SDAC_2

import spinal.core._
import spinal.lib._

case class RxPreamble(datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val slave_id = in Bits(datawidth bits)
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val trigger = out Bool()
  }
  noIoPrefix()

  val startDelimiter = io.slave_id##B"x00F1F2F3"
  val trigerDelimiter = B"x00F3F2F1"##B"x00F1F2F3"
  val startDelimiterWidth = datawidth*2
  val history = History(io.input, 0 until startDelimiterWidth/datawidth, when = io.input.fire)
  val historyDataCat = B(Cat(history.map(_.payload.fragment).reverse))
  val hit = history.map(_.valid).andR && historyDataCat === startDelimiter
  val inFrame = RegInit(False)
  val trigger = history.map(_.valid).andR && historyDataCat === trigerDelimiter && io.input.payload.last

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

  io.trigger := RegNext(trigger)
}


object RxPreamble{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new RxPreamble(32)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.slave_id #= 10
      dut.io.output.ready #= true
      dut.clockDomain.waitSampling(10)
      dut.io.input.valid #= false
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(10)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00f1f2f3
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 10
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 1
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00f1f2f3
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00f3f2f1
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 2
      dut.io.input.payload.last #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(100)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00f1f2f3
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00f3f2f1
      dut.io.input.payload.last #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(100)
    }
  }
}