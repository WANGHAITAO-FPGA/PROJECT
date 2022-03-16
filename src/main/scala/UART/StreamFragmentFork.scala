package UART

import spinal.core._
import spinal.lib.{Fragment, master, slave}
import spinal.core.sim._

object StreamState extends SpinalEnum {
  val IDLE, WAIT = newElement()
}

case class StreamFragmentFork(bitWidth : Int, portCount: Int) extends Component{
  val io = new Bundle{
    val input = slave Stream Fragment(Bits(bitWidth bit))
    val output = Vec(master Stream (Bits(bitWidth bit)), portCount)
  }
  noIoPrefix()

  val linkEnable = Vec(RegInit(False),portCount)

  import StreamState._

  val stateMachine = new Area {
    val state = RegInit(IDLE)
    switch(state) {
      is(IDLE) {
        when(io.input.fire){
          for(i <- 0 until portCount){
            linkEnable(i) := io.input.payload.fragment === (i + 1)
          }
          state := WAIT
        }
      }
      is(WAIT){
        when(io.input.payload.last){
          for(i <- 0 until portCount){
            linkEnable(i) := False
          }
          state := IDLE
        }
      }
    }
  }

  io.input.ready := True
  for (i <- 0 until portCount) {
    when(!io.output(i).ready && linkEnable(i)) {
      io.input.ready := False
    }
  }

  for (i <- 0 until portCount) {
    io.output(i).valid := io.input.valid && linkEnable(i)
    io.output(i).payload := io.input.payload.fragment
  }
}

object StreamFragmentFork{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new StreamFragmentFork(8,3)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(10)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x01
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0x02
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x02
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0x02
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.io.input.payload.last #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x02
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x03
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.io.input.payload.last #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x03
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x04
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x05
      dut.io.input.payload.last #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.fragment #= 0
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(1000)
    }
  }
}