package FIBERTOUART

import spinal.core._
import spinal.lib._

case class FiberRxPreamble(datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val slave_id = in Bits(datawidth bits)
    val output = master(Stream(Fragment(Bits(datawidth bits))))
  }
  noIoPrefix()

  val startDelimiter = io.slave_id##B"x00F1F2F3"
  val startDelimiterWidth = datawidth*2
  val history = History(io.input, 0 until startDelimiterWidth/datawidth, when = io.input.fire)
  val historyDataCat = B(Cat(history.map(_.payload.fragment).reverse))
  val hit = history.map(_.valid).andR && historyDataCat === startDelimiter
  val inFrame = RegInit(False)

  io.output.valid := False
  io.output.payload  := io.input.payload
  io.input.ready := !inFrame || io.output.ready
  io.output.last := io.input.last

  when(!inFrame){
    when(hit){
      inFrame := True
    }
  } otherwise {
    when(io.input.valid) {
      io.output.valid := True
      when(io.output.ready && io.input.last){
        inFrame := False
      }
    }
  }
}
