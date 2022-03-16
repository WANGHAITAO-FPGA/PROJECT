package FIBERTOUART

import spinal.core._
import spinal.lib._

case class FiberTxHeader(dataWidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
  }

  val header = B"x00F1F2F300000001"
  val headerWords = 64/dataWidth
  val state = Reg(UInt(log2Up(headerWords + 1) bits)) init(0)
  io.output.valid := io.input.valid
  io.output.last := io.input.last
  io.input.ready := False
  when(state === headerWords){
    io.input.ready := io.output.ready
    io.output.payload := io.input.payload
  } otherwise {
    io.output.payload.fragment := header.subdivideIn(dataWidth bits).reverse.read(state.resized)
    /*io.output.payload.fragment := 0
    for(i <- 0 until dataWidth by 2) io.output.payload.fragment(i) := True
    when(state === headerWords-1) {io.output.payload.fragment.msb := True}*/
    when(io.output.fire) {
      state := state + 1
    }
  }
  when(io.input.lastFire){
    state := 0
  }
}
