package Test

import spinal.core._
import spinal.lib.PulseCCByToggle
import spinal.lib.blackbox.xilinx.s7.{BUFG, IBUF}

case class Pll_Test() extends Component{
  val io = new Bundle{
    val GCLK50 = in Bool()
    val CLKOUT0  = out Bool()
  }
  noIoPrefix()

  val GCLK50_B = BUFG.on(io.GCLK50)

  val pll = new BlackBox{
    setDefinitionName("MMCME2_BASE") //MMCME2_BASE

    addGenerics(
      "CLKIN1_PERIOD" -> 20.0,
      "CLKFBOUT_MULT_F" -> 24,
      "CLKOUT0_DIVIDE_F" -> 12,
      "CLKOUT0_PHASE" -> 0,
      "CLKOUT1_DIVIDE" -> 8,
      "CLKOUT1_PHASE" -> 0,
      "CLKOUT2_DIVIDE" -> 8,
      "CLKOUT2_PHASE" -> 45,
      "CLKOUT3_DIVIDE" -> 4,
      "CLKOUT3_PHASE" -> 0,
      "CLKOUT4_DIVIDE" -> 4,
      "CLKOUT4_PHASE" -> 90,
      "CLKOUT5_DIVIDE" -> 24,
      "CLKOUT5_PHASE" -> 0,
      "CLKOUT6_DIVIDE" -> 25,
      "CLKOUT6_PHASE" -> 0
    )

    val CLKIN1   = in Bool()
    val CLKFBIN  = in Bool()
    val CLKFBOUT = out Bool()
    val CLKOUT0  = out Bool()
    val CLKOUT1  = out Bool()
    val CLKOUT2  = out Bool()
    val CLKOUT3  = out Bool()
    val CLKOUT4  = out Bool()
    val CLKOUT5  = out Bool()
    val CLKOUT6  = out Bool()

    Clock.syncDrive(CLKIN1, CLKOUT1)
    Clock.syncDrive(CLKIN1, CLKOUT2)
    Clock.syncDrive(CLKIN1, CLKOUT3)
    Clock.syncDrive(CLKIN1, CLKOUT4)
    Clock.syncDrive(CLKIN1, CLKOUT5)
  }

  pll.CLKFBIN := pll.CLKFBOUT
  pll.CLKIN1 := IBUF.on(GCLK50_B)
  io.CLKOUT0 := pll.CLKOUT0
}

object Pll_Test extends App{
  SpinalVerilog(new Pll_Test())
}

object Pulse extends App{
  SpinalVerilog(new PulseCCByToggle(ClockDomain.external("clk_in"),ClockDomain.external("clk_out")))
}