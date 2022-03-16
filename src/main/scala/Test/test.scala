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
