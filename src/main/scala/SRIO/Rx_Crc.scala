package SRIO

import spinal.core._
import spinal.lib._
import spinal.core.sim._
import spinal.lib.com.eth.{CrcKind, MacTxManagedStreamFifoCc}

case class Rx_Preamble(dataWidth : Int) extends Component{
  val io = new Bundle {
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
  }

  val startDelimiter = B"x000000120000ffbc"
  val startDelimiterWidth = 64
  val history = History(io.input, 0 until startDelimiterWidth/dataWidth, when = io.input.fire)
  val historyDataCat = B(Cat(history.map(_.payload.fragment).reverse))
  val hit = history.map(_.valid).andR && historyDataCat === startDelimiter
  val inFrame = RegInit(False)

  io.output.valid := False
  io.output.payload  := io.input.payload
  io.input.ready := !inFrame || io.output.ready
  //io.input.ready := True
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
}

case class Rx_Checker(dataWidth : Int) extends Component {
  val io = new Bundle {
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
    val error = out Bool()
  }

  val crc = Crc(CrcKind.Crc32, dataWidth)
  crc.io.input.valid := io.input.valid
  crc.io.input.payload := io.input.payload
  crc.io.flush := io.output.lastFire

  io.output.valid := io.input.valid
  io.output.last := io.input.last
  io.output.payload.fragment := io.input.payload.fragment
  io.input.ready := io.output.ready
  io.error := io.input.last && (crc.io.result =/= io.input.payload.fragment)
}


/*
case class Rx_Buffer(pushCd : ClockDomain,
                       popCd : ClockDomain,
                       Width : Int,
                       byteSize : Int) extends Component {
  assert(isPow2(byteSize))

  val io = new Bundle {
    val push = new Bundle{
      val stream = slave(Stream(Fragment(Bits(Width bits))))
      val drop = out Bool()
      val commit = out Bool()
      val error = out Bool()
      val error_in = in Bool()
    }

    val pop = new Bundle{
      val stream = master(Stream(Bits(Width bits)))
      val stats = new Bundle {
        val clear = in Bool()
        val drops, errors = out UInt (8 bits)
      }
    }
  }

  val ram = Mem(Bits(Width bits), byteSize*8/Width)
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
    val currentPtr, oldPtr = Reg(UInt(ptrWidth bits)) init(0)
    val currentPtrPlusOne = currentPtr + 1
    val popPtr  = popToPush.io.output.toFlow.toReg(0)
    pushToPop.io.input.payload := oldPtr

    val length = Reg(UInt(lengthWidth bits)) init(0)

    val port = ram.writePort
    port.valid := False
    port.payload.assignDontCare()

    val error = RegInit(False)
    val drop = RegInit(False)
    when(io.push.stream.fire && io.push.error_in){
      error := True
    }

    val doWrite = False
    when(io.push.stream.fire){
      length := length + Width
      doWrite := True
    }

    val full = isFull(currentPtrPlusOne, popPtr)
    when(doWrite){
      when(full){
        drop := True
      } otherwise {
        port.valid := True
        port.address := currentPtrPlusOne.resized
        port.data := io.push.stream.payload.fragment
        currentPtr := currentPtrPlusOne
      }
    }

    val cleanup =  RegNext(io.push.stream.lastFire) init(False)
    val commit = RegNext(cleanup) init(False)
    io.push.stream.ready := !cleanup && !commit

    when(cleanup){
      doWrite := False
    }

    when(commit){
      when(error || drop || full) {
        currentPtr := oldPtr
      } otherwise {
        oldPtr := currentPtrPlusOne
        currentPtr := currentPtrPlusOne
        port.valid := True
        port.address := oldPtr.resized
        port.data := B(length).resized
      }
      error := False
      drop := False
      length := 0
    }

    io.push.drop := drop || commit && full
    io.push.commit := commit
    io.push.error := error
  }

  val pop = popCd on new Area{
    val currentPtr = Reg(UInt(ptrWidth bits)) init(0)
    val pushPtr = pushToPop.io.output.toFlow.toReg(0)
    popToPush.io.input.payload := currentPtr

    val cmd = Stream(ram.addressType())
    cmd.valid := !isEmpty(currentPtr, pushPtr)
    cmd.payload := currentPtr.resized

    io.pop.stream << ram.streamReadSync(cmd)

    when(cmd.fire){
      currentPtr := currentPtr + 1
    }

    val stats = new Area{
      val drop = PulseCCByToggle(
        input = push.commit && push.drop,
        clockIn = pushCd,
        clockOut = popCd
      )
      val error = PulseCCByToggle(
        input = push.commit && push.error,
        clockIn = pushCd,
        clockOut = popCd
      )

      val drops, errors = Reg(UInt(8 bits)) init(0)
      drops := drops + U(drop && drops =/= drops.maxValue)
      errors := errors + U(error && errors =/= errors.maxValue)
      when(io.pop.stats.clear){
        drops := 0
        errors := 0
      }

      io.pop.stats.drops := drops
      io.pop.stats.errors := errors
    }
  }
}*/


case class Rx_Buffer_Adapt(pushCd : ClockDomain,
                       popCd : ClockDomain,
                       pushWidth : Int,
                       popWidth : Int,
                       byteSize : Int) extends Component {
  assert(isPow2(byteSize))
  assert(isPow2(pushWidth / popWidth))
  assert(popWidth <= pushWidth)

  val ptrWidth = log2Up(byteSize * 8 / pushWidth) + 1

  val io = new Bundle {
    val push = new Bundle {
      val stream = slave(Stream(Fragment(Bits(pushWidth bits))))
    }

    val pop = new Bundle {
      val stream = master(Stream(Bits(popWidth bits)))
    }
  }

  val fifo = MacTxManagedStreamFifoCc(
    payloadType = Bits(pushWidth bits),
    depth = byteSize * 8 / pushWidth,
    pushCd = pushCd,
    popCd = popCd
  )

  val wordCountWidth = log2Up(fifo.depth)
  val lengthWidth = log2Up(fifo.depth*pushWidth)

  val push = pushCd on new Area {
    fifo.io.push.stream.payload := io.push.stream.payload
    fifo.io.push.stream.valid := io.push.stream.valid
    io.push.stream.ready := fifo.io.push.stream.ready

    val commit = RegNext(False)
    fifo.io.push.commit := commit

    when(io.push.stream.last){
      commit := True
    }
  }

  val pop = popCd on new Area {
    val ratio = pushWidth / popWidth
    val spliter = Reg(UInt(log2Up(ratio) bits))

    fifo.io.pop.stream.ready := False

    fifo.io.pop.commit := False
    fifo.io.pop.redo := False

    io.pop.stream.valid := False
    io.pop.stream.payload := fifo.io.pop.stream.payload.subdivideIn(popWidth bits).read(spliter)

    spliter := 0

    when(fifo.io.pop.stream.valid){
      when(io.pop.stream.ready) {
        io.pop.stream.valid := True
        when(io.pop.stream.ready) {
          spliter := spliter + 1
          when(spliter === spliter.maxValue) {
            fifo.io.pop.stream.ready := True
          }
        }
      }
    }
  }
}

object Rx_Buffer_Adapt{
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Rx_Buffer_Adapt(ClockDomain.external("pushclk"),ClockDomain.external("popclk"),32,16,128)){dut=>
      dut.pushCd.forkStimulus(10)
      dut.popCd.forkStimulus(10)
      dut.io.push.stream.payload.fragment #= 0x00
      dut.io.push.stream.payload.last #= false
      dut.io.push.stream.valid #= false
      //dut.io.push.error_in #= false
      dut.io.pop.stream.ready #= true
      dut.popCd.waitSampling(10)
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x000000e0
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x02030405
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x03040506
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= false
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x04050607
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x05060708
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x06070809
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= false
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.fragment #= 0x07080910
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload.last #= true
      //dut.io.push.error_in #= true
      dut.io.push.stream.payload.fragment #= 0x08090a0b
      dut.popCd.waitSampling()
      dut.io.push.stream.valid #= false
      //dut.io.push.error_in #= false
      dut.io.push.stream.payload.last #= false
      dut.popCd.waitSampling()
      sleep(1000)
    }
  }
}
