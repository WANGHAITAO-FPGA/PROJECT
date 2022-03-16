package MDCB_2

import spinal.core._
import spinal.lib.Delay

case class Encoder_Clr() extends Component{
  val io = new Bundle{
    val encoder_clr_in = in Bool()
    val encoder_clr_out = out Bool()
  }
  noIoPrefix()
  val encoder_clr_out = Reg(Bool()) init False  addTag(crossClockDomain)

  val encoder_clr_in = io.encoder_clr_in addTag(crossClockDomain)

  when(encoder_clr_in.rise()){
    encoder_clr_out := True
  }otherwise{
    encoder_clr_out := False
  }
  io.encoder_clr_out := !(encoder_clr_out|Delay(encoder_clr_out,1)|Delay(encoder_clr_out,2))
}

/*case class Mdcb_Encoder_Clr(endcoder_num : Int) extends Component{
  val io = new Bundle{
    val encoder_clr_in = Seq.fill(endcoder_num)(in Bool())
    val encoder_clr_out = Seq.fill(endcoder_num)(out Bool())
  }
  noIoPrefix()

  val encoder_clr = Seq.fill(endcoder_num)(new Encoder_Clr)
  val encoder_clr_out = Seq.fill(endcoder_num)(Reg(Bool()) init True)
  for(i <- 0 until endcoder_num){
    encoder_clr(i).io.encoder_clr_in := io.encoder_clr_in(i)
    encoder_clr_out(i) := encoder_clr(i).io.encoder_clr_out
  }
  for(i <- 0 until endcoder_num){
    io.encoder_clr_out(i) := encoder_clr_out(i)
  }

}

object Mdcb_Encoder_Clr extends App{
  SpinalVerilog(new Mdcb_Encoder_Clr(4))
}*/