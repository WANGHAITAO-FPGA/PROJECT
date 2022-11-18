package SRIO

import spinal.core._
import spinal.lib.master
import spinal.lib.misc.Timer

case class Srio_Test_Top() extends Component{
  val io = new Bundle{
    val srio_clk = in Bool()
    val reset = in Bool()
    val srio = master(Srio_Interface())
    val link = in Bool()
  }
  noIoPrefix()

  val srio_clkdomain = ClockDomain(io.srio_clk,io.reset)
  val srio_area = new ClockingArea(srio_clkdomain){
    val timer = Timer(32)
    timer.io.tick := io.link
    timer.io.limit := 6250
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }

    val srio_reg = new Srio_Regif(8)
    val target = new Target(8,0)
    target.io.target <> io.srio.target
    target.io.simplebus <> srio_reg.io.simplebus

    val intitaor = new Intitaor(64)
    intitaor.io.intiator <> io.srio.intiator
    intitaor.io.send_start := timer.io.full
    intitaor.io.usercmd.user_ftype := SrioFtype.DOORB
    intitaor.io.usercmd.user_ttype := SrioTtype.TNDATA
    intitaor.io.usercmd.user_tid := B"8'xFF"
    intitaor.io.usercmd.user_prio := 1
    intitaor.io.usercmd.user_addr := B"34'x0_0002_0000"
    intitaor.io.usercmd.user_data.valid := False
    intitaor.io.usercmd.user_data.payload := 0
    intitaor.io.usercmd.user_size := 0
  }
}

object Srio_Test_Top extends App{
  SpinalVerilog(new Srio_Test_Top)
}


