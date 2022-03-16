package PHPA82

object ila_test extends App {

  import spinal.core._

  class ila(widths: List[Int], ilaname: String) extends BlackBox {
    val io = new Bundle {
      val clk = in Bool()
      val probe = widths.zipWithIndex.map { case (w, i) =>
        val ret = in Bits (w bits)
        ret.setName(s"probe${i}")
        ret
      }
    }
    mapCurrentClockDomain(io.clk)
    noIoPrefix()
    this.setDefinitionName("ila_" + ilaname)
    println("name:ila_" + ilaname + ",width:" + widths)
  }

  object ila {
    def apply[T <: Data](name : String, signals : T *) = {
      val signalWidths = signals.map(B(_).getWidth).toList
      val vividoIla = new ila(signalWidths, name)

      vividoIla.io.probe.zip(signals).foreach{case(probei, s) =>
        probei := (s.asBits).setName(s.getName() + "_b")
      }
      vividoIla
    }
  }
}