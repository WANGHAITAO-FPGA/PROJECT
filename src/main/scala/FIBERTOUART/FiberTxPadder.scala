package FIBERTOUART

import spinal.core._
import spinal.lib._

case class FiberTxPadder(dataWidth: Int, cycles_number: Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(dataWidth bits))))
    val output = master(Stream(Fragment(Bits(dataWidth bits))))
  }
  noIoPrefix()

  val cycles = cycles_number
  val counter = Reg(UInt(log2Up(cycles) bits)) init(0)
  val ok = counter === cycles-1
  val fill = counter =/= 0 && io.input.first

  when(!ok && io.output.fire){
    counter := counter + 1
  }
  when(io.output.lastFire){
    counter := 0
  }
  io.output << io.input.haltWhen(fill)
  when(!ok){
    io.output.last := False
  }
  when(fill){
    io.output.valid := True
    io.output.payload.fragment := 0
    io.output.payload.last := ok
  }
}
