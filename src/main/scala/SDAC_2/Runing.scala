package SDAC_2

import Test.Led_Test
import spinal.core._
import spinal.lib.{Counter, CounterFreeRun}

case class Runing(tick_count : Int) extends Component{
  val io = new Bundle{
    val tick = in Bool()
    val led  = out Bool()
  }
  noIoPrefix()
  val ledtemp = Reg(Bool()) init False
  val counter =  Counter(0,50000)
  when(io.tick.rise()){
    counter.increment()
  }
  when(counter.value > tick_count){
    counter.clear()
    ledtemp := ~ledtemp;
  }
  io.led := ledtemp
}

object Runing{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Runing(10000)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.tick #= false
      dut.clockDomain.waitSampling(10)
      for(i <- 0 until 500){
        dut.clockDomain.waitSampling(2)
        dut.io.tick #= true
        dut.clockDomain.waitSampling()
        dut.io.tick #= false
      }
      dut.clockDomain.waitSampling(1000)


    }
  }
}


case class Error_Check(tick_count : Int) extends Component{
  val io = new Bundle{
    val tick = in Bool()
    val led  = out Bool()
  }
  noIoPrefix()

  val ledtemp = Reg(Bool()) init True

  val counter =  Counter(0,800000000)

  when(io.tick.rise()){
    counter.clear()
    ledtemp := True
  }

  when(counter.value > tick_count){
    ledtemp := False
  }otherwise{
    counter.increment()
  }
  io.led := ledtemp
}

object Error_Check extends App{
  SpinalVerilog(new Error_Check(625000000))
}