import spinal.core._
import spinal.lib.{BufferCC, History, traversableOnceBoolPimped}
import spinal.core.sim._
/*
case class IoFilter(samplingSize: Int) extends Component {
  val io = new Bundle{
    val io_in = in Bool()
    val io_out = out Bool()
  }
  noIoPrefix()

  val timer = new Area{
    val counter = Reg(UInt(1 bits)) init(0)
    val tick    = counter === 0

    counter := counter - 1
    when(tick){
      counter := 1
    }
  }

  val sampler = new Area {
    val ioSync = BufferCC(io.io_in, True)
    val ioSamples = History(that = ioSync, range = 0 until samplingSize, when = timer.tick, init = True)
  }

  val iosampleout = RegInit(True)

  when(timer.tick){
    when(sampler.ioSamples.map(_ =/= iosampleout).andR){
      iosampleout := sampler.ioSamples.last
    }
  }

  io.io_out := iosampleout
}
*/
/*object IoFilter extends App{
  SpinalVerilog(new IoFilter(4))
}*/
/*
object IoFilter{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new IoFilter(1)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.io_in #= true
      dut.clockDomain.waitSampling(10)
      dut.io.io_in #= false
      dut.clockDomain.waitSampling(5)
      dut.io.io_in #= true
      dut.clockDomain.waitSampling(1000)
      sleep(1000)
    }
  }
}
*/