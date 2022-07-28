package Test

import spinal.core._
import spinal.core.sim._

import scala.collection.mutable.ArrayBuffer

class testtakeRight extends Component{
  val io = new Bundle{
    val datain = in Bits(128 bits)
    val dataout = out Bits(128 bits)
  }
  noIoPrefix()

  val Seq(x0, x1, x2, x3) = io.datain.subdivideIn(32 bits).reverse

  val dataAtEachRound: ArrayBuffer[Bits] = ArrayBuffer[Bits](x0, x1, x2, x3)

  io.dataout := dataAtEachRound.takeRight(4).reverse.reduce(_ ## _)
}

object testtakeRight{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.compile(new testtakeRight()).doSim{dut=>
      dut.io.datain #= 0x123456
      sleep(100)
    }
  }
}

class reset_wait() extends Component{
  val io = new Bundle{
    val reset_out = out Bool()
  }
  noIoPrefix()

  val reset_out = Reg(Bool()) init  True

  val ResetCounter = Reg(UInt(30 bits)) init(0)
  when(ResetCounter =/= U(ResetCounter.range -> true)){
    ResetCounter := ResetCounter + 1
    reset_out := True
  }otherwise{
    reset_out := False
  }
  io.reset_out := reset_out
}

object reset_wait{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new reset_wait){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10000)
    }
  }
}