package YW_PROJ

import spinal.core._
import spinal.lib.blackbox.xilinx.s7.{BUFG, IBUF}

case class PLL() extends Component{
  val io = new Bundle{
    val GCLK25 = in Bool()
    val CLKOUT0  = out Bool()
  }
  noIoPrefix()

  val GCLK50_B = BUFG.on(io.GCLK25)

  val pll = new BlackBox{
    setDefinitionName("MMCME2_BASE") //MMCME2_BASE

    addGenerics(
      "CLKIN1_PERIOD" -> 40.0,
      "CLKFBOUT_MULT_F" -> 32,
      "CLKOUT0_DIVIDE_F" -> 8,
      "CLKOUT0_PHASE" -> 0,
      "CLKOUT1_DIVIDE" -> 1,
      "CLKOUT1_PHASE" -> 0,
      "CLKOUT2_DIVIDE" -> 1,
      "CLKOUT2_PHASE" -> 0,
      "CLKOUT3_DIVIDE" -> 1,
      "CLKOUT3_PHASE" -> 0,
      "CLKOUT4_DIVIDE" -> 1,
      "CLKOUT4_PHASE" -> 0,
      "CLKOUT5_DIVIDE" -> 1,
      "CLKOUT5_PHASE" -> 0,
      "CLKOUT6_DIVIDE" -> 1,
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


case class clk_wiz_0() extends BlackBox{
  val clk_in1 = in Bool()
  val reset = in Bool()
  val clk_out1 = out Bool()
  val locked = out Bool()
}
