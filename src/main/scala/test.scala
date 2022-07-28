import spinal.core._
import spinal.lib.{Fragment, LITTLE, Stream, StreamFragmentWidthAdapter, StreamWidthAdapter, master, slave}

case class test2() extends Component {
  val io = new Bundle{
    val in = slave(Stream(Fragment((Bits(32 bits)))))
    val out = master(Stream((Fragment(Bits(8 bits)))))
  }
  noIoPrefix()
  StreamFragmentWidthAdapter(io.in,io.out)
}

object test2{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new test2){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.in.valid #= false
      dut.io.in.payload.last #= false
      dut.clockDomain.waitSampling(10)
      dut.io.in.payload.fragment #= 0x01020304
      dut.io.in.valid #= true
      dut.io.in.payload.last #= true
      dut.clockDomain.waitSampling()
      dut.io.in.valid #= false
      dut.io.in.payload.last #= false
      dut.clockDomain.waitSampling(1000)
    }
  }
}
