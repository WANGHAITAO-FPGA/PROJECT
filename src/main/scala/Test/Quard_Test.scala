package Test

import spinal.core._
import spinal.lib.misc.Timer

case class Quard_Test(timerl_imit : Int) extends Component{
  val io = new Bundle{
    val aphase = out Bool()
    val bphase = out Bool()
  }
  noIoPrefix()

  val timer = Timer(32)
  timer.io.tick := True
  timer.io.limit := timerl_imit
  when(timer.io.value >= timer.io.limit){
    timer.io.clear := True
  }otherwise{
    timer.io.clear := False
  }

  val aphase = Reg(Bool()) init False
  val bphase = Reg(Bool()) init False

  when(timer.io.full){
    aphase := !aphase
  }
  io.aphase := aphase

  when(timer.io.value === timer.io.limit/2){
    bphase := !bphase
  }
  io.bphase := bphase
}

object Quard_Test{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Quard_Test(100000)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10)
      dut.clockDomain.waitSampling(2000)

    }
  }
}
