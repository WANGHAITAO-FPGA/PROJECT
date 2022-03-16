package DSP48E1

import spinal.core._
import spinal.lib.experimental.math.Floating

case class Multiply(datawidth : Int) extends Component{
  val io = new Bundle{
    val a = in UInt(datawidth bits)
    val b = in UInt(datawidth bits)
    val c = out UInt(datawidth bits)
  }
  noIoPrefix()

  val temp = Reg(UInt(datawidth bits))
  temp.addAttribute("use_dsp","yes")
  temp := (io.a * io.b).resized
  io.c := temp
}

object Multiply extends App{
  SpinalVerilog(new Multiply(25))
}

case class Float_Test() extends Component{
  val io = new Bundle{
    val data_in = in Bits(32 bits)
    val data_out = out Bits(32 bits)
  }
  noIoPrefix()
  val temp = SFix(peak = 8 exp,resolution = -23 exp)
  temp.raw := io.data_in.asSInt

  val temp1 = Floating(8,24)
  temp1 := -11.0

  io.data_out := (temp1.asBits>>1).resized
}

object Float_Test extends App{
  SpinalVerilog(new Float_Test())
}