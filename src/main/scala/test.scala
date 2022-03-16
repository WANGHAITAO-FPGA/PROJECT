import spinal.core._
import spinal.lib.{Fragment, Stream, StreamFragmentWidthAdapter, StreamWidthAdapter, master, slave}

case class test2() extends Component {
  val io = new Bundle{
    val in = slave(Stream((Bits(32 bits))))
    val out = master(Stream((Bits(8 bits))))
  }
  noIoPrefix()
  StreamWidthAdapter(io.in,io.out)

  val b = Cat()
}

object test{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new test2){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.out.ready #= true
      dut.io.in.valid #= false
      dut.io.in.payload #= 10
      dut.clockDomain.waitSampling(10)
      /*dut.io.in.valid #= true
      dut.io.in.payload.fragment #= 0x01020304
      dut.io.in.payload.last #= false
      dut.clockDomain.waitSampling()*/
      dut.io.in.valid #= true
      dut.io.in.payload #= 0x05060708
      dut.clockDomain.waitSampling()
      dut.io.in.valid #= false
      dut.clockDomain.waitSampling(1000)
    }
  }
}
