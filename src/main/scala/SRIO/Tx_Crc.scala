package SRIO

import spinal.core._
import spinal.core.sim.SimConfig
import spinal.lib.com.eth.{CrcKind, MacTxManagedStreamFifoCc}
import spinal.lib.{Fragment, Stream, StreamFifoCC, StreamWidthAdapter, master, slave, traversableOncePimped}
import spinal.core.sim._

case class Tx_Buffer(pushCd : ClockDomain,
                       popCd : ClockDomain,
                       Width : Int,
                       byteSize : Int) extends Component {
  assert(isPow2(byteSize))

  val ptrWidth = log2Up(byteSize * 8 / Width) + 1

  val io = new Bundle {
    val push = new Bundle {
      val stream = slave(Stream(Bits(Width bits)))
      val availability = out UInt (ptrWidth bits)
    }

    val pop = new Bundle {
      val stream = master(Stream(Fragment(Bits(Width bits))))
      val redo = in Bool()
      val commit = in Bool()
    }
  }

  val fifo = MacTxManagedStreamFifoCc(
    payloadType = Bits(Width bits),
    depth = byteSize * 8 / Width,
    pushCd = pushCd,
    popCd = popCd
  )

  val wordCountWidth = log2Up(fifo.depth)
  val lengthWidth = log2Up(fifo.depth*Width)

  io.push.availability := fifo.io.push.availability

  val push = pushCd on new Area {
    fifo.io.push.stream << io.push.stream

    val commit = RegNext(False)
    fifo.io.push.commit := commit

    val State = new SpinalEnum{
      val LENGTH, DATA = newElement()
    }
    val state = RegInit(State.LENGTH)
    val length = Reg(UInt(lengthWidth bits))
    val wordCountMinusOne = length-1 >> log2Up(Width)
    val wordCounter = Reg(UInt(wordCountWidth bits))
    switch(state){
      is(State.LENGTH){
        wordCounter := 0
        when(fifo.io.push.stream.fire){
          state := State.DATA
          length := io.push.stream.payload.asUInt.resized
        }
      }
      is(State.DATA){
        when(io.push.stream.fire){
          wordCounter := wordCounter + 1
          when(wordCounter === wordCountMinusOne){
            commit := True
            state := State.LENGTH
          }
        }
      }
    }
  }

  val pop = popCd on new Area {
    val State = new SpinalEnum{
      val LENGTH, DATA, WAIT = newElement()
    }
    val state = RegInit(State.LENGTH())
    val length = Reg(UInt(lengthWidth bits))
    val lengthMinusOne = length-1
    val wordCounter = Reg(UInt(wordCountWidth bits))
    val wordCountEndAt = lengthMinusOne >> log2Up(Width)

    fifo.io.pop.commit := io.pop.commit
    fifo.io.pop.redo := io.pop.redo
    fifo.io.pop.stream.ready := False

    io.pop.stream.valid := False
    io.pop.stream.last := False
    io.pop.stream.fragment := fifo.io.pop.stream.payload

    switch(state){
      is(State.LENGTH){
        wordCounter := 0
        when(fifo.io.pop.stream.valid){
          state := State.DATA
          length := fifo.io.pop.stream.payload.asUInt.resized
          fifo.io.pop.stream.ready := True
        }
      }
      is(State.DATA) {
        io.pop.stream.valid := True
        when(io.pop.stream.ready) {
          when(wordCounter === wordCountEndAt) {
            state := State.WAIT
            io.pop.stream.last := True
          }
          wordCounter := wordCounter + 1
          fifo.io.pop.stream.ready := True
        }
      }
      is(State.WAIT){
        when(io.pop.commit){
          state := State.LENGTH
        }
      }
    }

    when(io.pop.redo){
      state := State.LENGTH
    }
  }
}


case class Crc(kind : CrcKind, dataWidth : Int) extends Component{
  val io = new Bundle {
    val flush = in Bool()
    val input = slave Flow(Bits(dataWidth bits))
    val result = out Bits(kind.polynomialWidth bits)
  }
  noIoPrefix()
  val crc_data = Reg(Bits(kind.polynomialWidth bits)) init(kind.initValue)

  when(io.input.fire){
    crc_data := Crc32.crc32(crc_data,io.input.payload)
  }
  when(io.flush){
    crc_data := kind.initValue
  }
  io.result := crc_data
}

case class Tx_Crc(dataWidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
  }
  noIoPrefix()
  val emitCrc = RegInit(False) setWhen(io.input.lastFire) clearWhen(io.output.lastFire)
  val crc = Crc(CrcKind.Crc32, dataWidth)
  crc.io.input << io.input.toFlowFire.translateWith(io.input.payload)
  crc.io.flush := io.output.lastFire

  io.output.last := False
  when(!emitCrc) {
    io.output.valid := io.input.valid
    io.output.fragment := io.input.fragment
    io.input.ready := io.output.ready
  } otherwise {
    io.input.ready := False
    io.output.valid := True
    io.output.fragment := crc.io.result
    io.output.last := True
    emitCrc := False
  }
}


case class Tx_Header(dataWidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
  }
  noIoPrefix()
  val header = B"x0000ffbc00000012"  //64bits
  val headerWordsNumber = 64/dataWidth
  val state = Reg(UInt(log2Up(headerWordsNumber+1) bits)) init(0)
  io.output.valid := io.input.valid
  io.output.last := False
  io.input.ready := False
  when(state === headerWordsNumber){
    io.input.ready := io.output.ready
    io.output.payload := io.input.payload
  } otherwise {
    io.output.fragment := header.subdivideIn(dataWidth bits).reverse.read(state.resized)
    when(io.output.fire) {
      state := state + 1
    }
  }
  when(io.input.lastFire){
    state := 0
  }
}




case class Tx_Buffer_Adapt(Cd : ClockDomain,
                           pushWidth : Int,
                           popWidth : Int,
                           byteSize : Int) extends Component {
  assert(isPow2(byteSize))
  assert(isPow2(popWidth / pushWidth))
  assert(pushWidth <= popWidth)

  val io = new Bundle {
    val push = new Bundle {
      val stream = slave(Stream(Bits(pushWidth bits)))
    }

    val pop = new Bundle {
      val stream = master(Stream(Bits(popWidth bits)))
    }
  }

  noIoPrefix()

  val area = new ClockingArea(Cd){
    val fifo = StreamFifoCC(
      dataType = Bits(popWidth bits),
      depth = byteSize * 8 / popWidth,
      pushClock = Cd,
      popClock = Cd
    )

    StreamWidthAdapter(io.push.stream,fifo.io.push)
    fifo.io.pop >> io.pop.stream
  }
}

object Tx_Buffer_Adapt {
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new Tx_Buffer_Adapt(ClockDomain.external("clk"),16,32,128)){dut=>
      dut.Cd.forkStimulus(10)
      dut.io.push.stream.valid #= false
      dut.io.push.stream.payload #= 0x0000
      dut.io.pop.stream.ready #= true
      dut.Cd.waitSampling(20)
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload #= 0x0000
      dut.Cd.waitSampling()
      dut.io.push.stream.valid #= true
      dut.io.push.stream.payload #= 0x0060
      dut.Cd.waitSampling()
      dut.io.push.stream.payload #= 0x0102
      dut.Cd.waitSampling()
      dut.io.push.stream.payload #= 0x0304
      dut.Cd.waitSampling()
      dut.io.push.stream.payload #= 0x0506
      dut.Cd.waitSampling()
      dut.io.push.stream.payload #= 0x0708
      dut.Cd.waitSampling()
      dut.io.push.stream.valid #= false
      dut.Cd.waitSampling()
      dut.Cd.waitSampling(1000)
      sleep(5000)

    }
  }
}

