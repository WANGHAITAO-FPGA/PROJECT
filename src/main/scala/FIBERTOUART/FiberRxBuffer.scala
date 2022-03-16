package FIBERTOUART

import spinal.core._
import spinal.lib.{Fragment, Stream, StreamFifoCC, master, slave}

case class FiberRxBuffer(pushCd : ClockDomain,popCd : ClockDomain,pushWidth : Int,popWidth : Int,byteSize : Int) extends Component{
  assert(isPow2(byteSize))
  assert(isPow2(pushWidth / popWidth))
  assert(popWidth <= pushWidth)

  val io = new Bundle {
    val push = new Bundle{
      val stream = slave(Stream(Fragment(Bits(pushWidth bits))))
    }
    val pop = new Bundle{
      val stream = master(Stream(Fragment(Bits(popWidth bits))))
    }
  }
  noIoPrefix()

  val fifo = StreamFifoCC(Bits(pushWidth bits),byteSize * 8 / pushWidth,pushCd,popCd)

  val push = pushCd on new Area {
    fifo.io.push.payload := io.push.stream.payload.fragment
    fifo.io.push.valid := io.push.stream.valid
    io.push.stream.ready := fifo.io.push.ready
  }

  val pop = popCd on new Area {
    val State = new SpinalEnum{
      val START,WAIT, DATA = newElement()
    }
    val state = RegInit(State.START())
    val ratio = pushWidth/popWidth
    val spliter = Reg(UInt(log2Up(ratio) bits)) init (ratio-1)
    val fifo_pop_ready = Reg(Bool) init False
    io.pop.stream.valid := False
    io.pop.stream.last := False

    val fif_payload_temp = Reg(Bits(pushWidth bits))

    fifo.io.pop.ready := fifo_pop_ready
    switch(state){
      is(State.START){
        when(io.push.stream.payload.last){
          state := State.WAIT
        }
      }
      is(State.WAIT){
        when(!io.push.stream.payload.last){
          fifo_pop_ready := True
          fif_payload_temp := fifo.io.pop.payload
          state := State.DATA
        }
      }
      is(State.DATA){
        io.pop.stream.valid := True
        when(io.pop.stream.ready) {
          spliter := spliter - 1
          when(spliter === 0){
            fifo_pop_ready := True
            fif_payload_temp := fifo.io.pop.payload
          }otherwise{
            fifo_pop_ready := False
          }
          when(fifo.io.popOccupancy === 0 && spliter === 0) {
            state := State.START
            //fifo.io.pop.ready := True
            //fifo_pop_ready := True
            io.pop.stream.last := True
          }
        }
      }
    }
    io.pop.stream.payload.fragment := fif_payload_temp.subdivideIn(popWidth bits).read(spliter)
  }
}

object FiberRxBuffer{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new FiberRxBuffer(ClockDomain.external("pushclk"),ClockDomain.external("popclk"),32,8,64)){dut=>
      dut.pushCd.forkStimulus(10)
      dut.io.pop.stream.ready #= true
      dut.io.push.stream.valid #= false
      dut.io.push.stream.payload.last #= false
      dut.popCd.forkStimulus(10)
      dut.pushCd.waitSampling(10)
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x11223344
      dut.io.push.stream.payload.last #= false
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x01020304
      dut.io.push.stream.payload.last #= false
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x123456
      dut.io.push.stream.payload.last #= true
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= false
      dut.io.push.stream.payload.last #= false
      dut.pushCd.waitSampling(500)

    }
  }
}
