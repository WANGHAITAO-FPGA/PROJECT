package MO

import spinal.core._

case class Xilinx_Bram() extends BlackBox{
  val io = new Bundle{
    val wr_clk = in Bool()
    val wr_en = in Bool()
    val wr_addr = in Bits(8 bits)
    val wr_data = in Bits(32 bits)
    val wr_rst = in Bool()
    val rd_clk = in Bool()
    val rd_en = in Bool()
    val rd_addr = in Bits(8 bits)
    val rd_data = out Bits(32 bits)
    val rd_rst = in Bool()
  }
  noIoPrefix()

  addRTLPath("D:/SCALA/SRIO/CYP1401/Xilinx_Bram.v")
}
