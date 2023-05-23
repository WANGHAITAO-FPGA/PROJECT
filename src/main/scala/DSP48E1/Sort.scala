package DSP48E1

import spinal.core._
import spinal.core.sim.SimConfig
import spinal.lib.{Delay, master, slave}

import scala.annotation.tailrec
import scala.collection.mutable.ArrayBuffer

case class Bitonic[T <: Data](dataType: HardType[T], n: Int, comparator: Seq[T] => Seq[T], pattern1: Boolean = true) extends Component {
  require(isPow2(n), "or, you should pad it")

  val dataIn = slave Flow Vec(dataType, n)
  val dataOut = master Flow Vec(dataType, n)

  def cmp(dataIn: Seq[T], up: Boolean) = if (up && pattern1) comparator(dataIn) else comparator(dataIn).reverse

  def subBlock(dataIn: Seq[T], up: Boolean, red: Boolean) = {
    val n = dataIn.length
    val (half0, half1) = dataIn.splitAt(n / 2)

    val afterComp = if (red) half0.zip(half1).map { case (t, t1) => cmp(Seq(t, t1), up) }
    else half0.zip(half1.reverse).map { case (t, t1) => cmp(Seq(t, t1), up) }

    val ordered = Seq(0, 1).map(i => afterComp.map(_.apply(i)))

    if (red) (ordered(0), ordered(1)) else (ordered(0), ordered(1).reverse)
  }


  private def block(dataIn: Seq[T], up: Boolean, first: Boolean): Seq[T] = {
    val n = dataIn.length
    n match {
      case 2 => cmp(dataIn, up)
      case _ =>
        val compared = if (first) subBlock(dataIn, up, pattern1) else subBlock(dataIn, up, true)
        RegNext(Vec(block(compared._1, up, false) ++ block(compared._2, up, false)))
    }
  }

  val maxStep = n << 1

  @tailrec
  private def whole(dataIn: Seq[T], step: Int = 2): Seq[T] = {
    if (step == maxStep) dataIn
    else {
      val upAndDown = (0 until n / step).map(_ % 2 == 1)
      val ordered = dataIn.grouped(step).toSeq.zip(upAndDown).map { case (data, up) => block(data, up, true) }.flatten
      whole(RegNext(Vec(ordered)), step << 1)
    }
  }

  dataOut.payload := Vec(whole(dataIn.payload))
  val latency = (1 to log2Up(n)).sum
  dataOut.valid := Delay(dataIn.valid, latency, init = False)
}

object Bitonic extends App {
  import spinal.core.sim._
  def uintcomp(dataIn: Seq[UInt]) = {
    require(dataIn.size == 2)
    val a = dataIn.head
    val b = dataIn.last
    Mux(a > b, Vec(a, b), Vec(b, a))
  }

  SimConfig.withWave.compile(Bitonic(UInt(16 bits), 8, uintcomp, false)).doSim { dut =>
    dut.clockDomain.forkStimulus(10)
    dut.dataIn.valid #= false
    dut.clockDomain.waitSampling(10)
    dut.dataIn.valid #= true
    dut.dataIn.payload(0) #= 10
    dut.dataIn.payload(1) #= 9
    dut.dataIn.payload(2) #= 1
    dut.dataIn.payload(3) #= 8
    dut.dataIn.payload(4) #= 15
    dut.dataIn.payload(5) #= 30
    dut.dataIn.payload(6) #= 11
    dut.dataIn.payload(7) #= 10
    dut.clockDomain.waitSampling()
    dut.dataIn.valid #= false
    dut.clockDomain.waitSampling(1000)
  }


}