package AddTest

import spinal.core._
import spinal.lib._

import java.time.{LocalDate, LocalDateTime}

case class inPort(dataWidth : Int = 8) extends Bundle{
  val data1 = UInt(dataWidth bits)
  val data2 = UInt(dataWidth bits)
}

class add(dataWidth : Int) extends Component {
  val dataIn = slave Flow(inPort(dataWidth))
  val sum = master Flow(UInt(8 bits))
  val sumCal = new Area {
    //override type RefOwnerType = this.type
    sum.valid := RegNext(dataIn.valid,False)
    sum.payload := RegNextWhen(dataIn.data1+dataIn.data2,dataIn.valid)
  }
}

object add extends App{
  SpinalVerilog(new add(8))
}