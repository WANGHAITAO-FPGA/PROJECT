package Test

import spinal.core._
import spinal.lib.misc.Timer

case class gpio_timer() extends Component{
  val io = new Bundle{
    val gpio_out = out Bool()
    val tick = in Bool()
  }
  noIoPrefix()

  val timer = Timer(32)
  timer.io.tick := io.tick
  timer.io.limit := 10000
  when(timer.io.value >= timer.io.limit){
    timer.io.clear := True
  }otherwise{
    timer.io.clear := False
  }
  io.gpio_out := timer.io.full
}

object timer extends App{
  SpinalVerilog(new gpio_timer())
}
