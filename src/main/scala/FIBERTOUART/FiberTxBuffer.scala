package FIBERTOUART

import spinal.core._
import spinal.lib.com.eth.MacRxBuffer
import spinal.lib._

case class FiberTxBuffer(pushCd : ClockDomain,popCd : ClockDomain,pushWidth : Int,popWidth : Int,byteSize : Int) extends Component{
  assert(isPow2(byteSize))
  assert(isPow2(popWidth/pushWidth))
  assert(popWidth >= pushWidth)
  assert(popWidth >= 16)

  val io = new Bundle {
    val push = new Bundle{
      val stream = slave(Stream(Fragment(Bits(pushWidth bits))))
    }

    val pop = new Bundle{
      val stream = master(Stream(Bits(popWidth bits)))
      val last = out Bool()
    }
  }

  val ram = Mem(Bits(popWidth bits), byteSize*8/popWidth)
  val ptrWidth = ram.addressWidth + 1

  val popToPush = new StreamCCByToggle(UInt(ptrWidth bits), popCd, pushCd, withOutputBuffer = false)
  val pushToPop = new StreamCCByToggle(UInt(ptrWidth bits), pushCd, popCd, withOutputBuffer = false)

  popToPush.io.input.valid := True
  popToPush rework { popToPush.pushArea.data init(0) }

  pushToPop.io.input.valid := True
  pushToPop rework { pushToPop.pushArea.data init(0) }

  def isFull(a: UInt, b: UInt) = a.msb =/= b.msb && a(ptrWidth - 2 downto 0) === b(ptrWidth - 2 downto 0)
  def isEmpty(a: UInt, b: UInt) = a === b

  val lengthWidth = log2Up(byteSize*8)

  val push = pushCd on new Area{
    val currentPtr = Reg(UInt(ptrWidth bits)) init(0)
    val currentPtrPlusOne = currentPtr
    val popPtr  = popToPush.io.output.toFlow.toReg(0)
    val length =  Reg(UInt(ptrWidth bits)) init(0)  addTag(crossClockDomain)
    pushToPop.io.input.payload := currentPtr

    val ratio = popWidth/pushWidth
    val buffer = Reg(Bits(popWidth-pushWidth bits))
    val state = Reg(UInt(log2Up(ratio) bits)) init(0)

    val port = ram.writePort
    port.valid := False
    port.payload.assignDontCare()

    val drop = RegInit(False)

    val doWrite = False
    when(io.push.stream.fire){
      state := state + 1
      for(i <- 0 to ratio-2) when(state === i){
        buffer((ratio-2-i)*pushWidth, pushWidth bits) := io.push.stream.payload.fragment
      }
      when(state === ratio-1){
        doWrite := True
        length := length + 1
      }
    }

    val full = isFull(currentPtrPlusOne, popPtr)
    when(doWrite){
      when(full){
        drop := True
      } otherwise {
        port.valid := True
        port.address := currentPtrPlusOne.resized
        port.data := buffer##io.push.stream.payload.fragment
        currentPtr := currentPtrPlusOne + 1
      }
    }

    val cleanup =  RegNext(io.push.stream.lastFire) init(False)  addTag(crossClockDomain)
    val commit = RegNext(cleanup) init(False)
    io.push.stream.ready := !cleanup && !commit

    when(cleanup && state =/= 0){
      doWrite := True
      length := 0
      currentPtr := 0
      popPtr := 0
      state := 0
    }
  }

  val pop = popCd on new Area{
    val currentPtr = Reg(UInt(ptrWidth bits)) init(0)
    val pushPtr = pushToPop.io.output.toFlow.toReg(0)
    popToPush.io.input.payload := currentPtr

    val cmd = Stream(ram.addressType())

    val State = new SpinalEnum{
      val START,DATA = newElement()
    }
    val state = RegInit(State.START())
    val send_number = Reg(UInt(7 bits))
    switch(state){
      is(State.START){
        when(io.push.stream.lastFire){
          state := State.DATA
          send_number := 0
        }
      }
      is(State.DATA){
        when(cmd.fire){
          currentPtr := currentPtr + 1
          send_number := send_number + 1
        }
        when(send_number === 56){
          state := State.START
        }
      }
    }
    cmd.valid := !isEmpty(currentPtr, pushPtr) && (state === State.DATA)
    cmd.payload := currentPtr.resized
    io.pop.stream << ram.streamReadSync(cmd)
    io.pop.last := (send_number === 56)&&(state === State.DATA)
  }
}

object FiberTxBuffer{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new FiberTxBuffer(ClockDomain.external("pushclk"),ClockDomain.external("popclk"),8,32,256)){dut=>
      dut.pushCd.forkStimulus(10)
      dut.popCd.forkStimulus(10)
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.valid #= false
      dut.io.pop.stream.ready #= true
      dut.pushCd.waitSampling(20)
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x12
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x34
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x56
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x78
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x12
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x34
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x56
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x78
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x02
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x04
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.payload.fragment #= 0x06
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= true
      dut.io.push.stream.payload.fragment #= 0x08
      dut.pushCd.waitSampling()
      dut.io.push.stream.valid #= false
      dut.io.push.stream.payload.last #= false
      dut.pushCd.waitSampling(1000)
    }
  }
}