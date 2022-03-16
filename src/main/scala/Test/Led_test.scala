package Test

import spinal.core._
import spinal.lib.CounterFreeRun
import xilinx.VivadoFlow

class Led_Test extends Component {
  val io = new Bundle{
    val led = out Bool()
    //val led2 = out Bool()
  }
  noIoPrefix()

  val ledtemp = Reg(Bool()) init False

  val counter1 =  CounterFreeRun(50000)
  when(counter1.willOverflow){
    counter1.clear()
    ledtemp := ~ledtemp;
  }
  io.led := ledtemp
}


object Led_Test {
  def main(args: Array[String]): Unit = {
    def VivadoSynth[T <: Component](gen: => T, name: String = "temp"): Unit = {
      val report = VivadoFlow(design = gen, name, s"E:/PHPA82/synthWorkspace/$name").doit()
      report.printArea()
      report.printFMax()
    }
    VivadoSynth(new Led_Test, name = "Led_Test")
  }
}