package DSP48E1

import spinal.core._
import spinal.lib.math.{MixedDivider, SignedDivider, UnsignedDivider}
import spinal.lib.{master, slave}

case class COS_SIN(datawidth : Int) extends Bundle{
  val sin = UInt(datawidth bits)
  val cos = UInt(datawidth bits)
}

case class Get_Tan(datawidth : Int, iteration: Int = 8, Peak: Int = 10) extends Component{
  val Resolution = iteration + 1
  val io = new Bundle{
    val data_in = slave Flow(COS_SIN(datawidth))
//    val data_out = master Flow(SFix(peak = datawidth-1 exp, resolution = -Resolution exp))
  }
  noIoPrefix()

  val quotient = Reg(UInt(datawidth bits))
  val remainder = Reg(UInt(datawidth bits))

  val divider = new UnsignedDivider(datawidth,datawidth,true)
  divider.io.flush := False
  divider.io.cmd.payload.numerator := io.data_in.sin
  divider.io.cmd.payload.denominator := io.data_in.cos
  divider.io.cmd.valid := io.data_in.valid

//  quotient := divider.io.rsp.payload.quotient
//  remainder := divider.io.rsp.payload.remainder
  divider.io.rsp.ready := True
//  io.data_out.payload := 0
//  io.data_out.valid := True
}

object Get_Tan{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Get_Tan(16)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.data_in.valid #= false
      dut.clockDomain.waitSampling(10)
      dut.io.data_in.valid #= true
      dut.io.data_in.sin #= 32000
      dut.io.data_in.cos #= 120
      dut.clockDomain.waitSampling(1000)
    }
  }
}


//case class Get_Theta()
