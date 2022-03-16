package MDCB_2

import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

case class MdcbRxPreamble(datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
  }
  noIoPrefix()

  val startDelimiter = B"x0000000100F1F2F3"
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


case class MdcbRxSimpleBus(addrwidth : Int, datawidth : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val waddr = out UInt(addrwidth bits)
    val wdata = out Bits(datawidth bits)
    val wenable = out Bool()
  }
  noIoPrefix()

  val waddr   = Reg(UInt(addrwidth bits))
  val wdata   = Reg(Bits(datawidth bits))
  val wenable = Reg(Bool()) init False
  val flag    = Reg(Bool())
  val fsm =new StateMachine{
    val Get_Header: State = new State with EntryPoint {
      whenIsActive{
        when(io.input.valid){
          //waddr := io.input.payload.fragment(15 downto 8).asUInt.resized
          waddr := 67
          flag := False
          goto(Get_Data)
        }
      }
    }
    val Get_Data: State = new State{
      whenIsActive{
        when(io.input.valid && io.input.last){
          wenable := False
          goto(Get_Header)
        }elsewhen(io.input.valid){
          wenable := True
          wdata := io.input.payload.fragment
          when(!flag){
            flag := True
          }otherwise{
            waddr := waddr + 1
          }
        }otherwise{
          wenable := False
        }
      }
    }
  }
  io.waddr := (waddr<<2).resized
  io.wenable := wenable
  io.wdata := wdata
  io.input.ready := True
}