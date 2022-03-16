import spinal.core._
import spinal.lib.graphic.RgbConfig
import spinal.lib.graphic.vga.{Axi4VgaCtrl, Axi4VgaCtrlGenerics}

object Axi4Vga {
  def main(args: Array[String]) {
    SpinalVerilog({
      Axi4VgaCtrl(Axi4VgaCtrlGenerics(
        axiAddressWidth = 32,
        axiDataWidth = 32,
        burstLength = 8,
        frameSizeMax = 2048*1512,
        fifoSize = 512,
        rgbConfig = RgbConfig(5,6,5),
        vgaClock = ClockDomain.external("vga")
      ))
    }).printPruned()
  }
}