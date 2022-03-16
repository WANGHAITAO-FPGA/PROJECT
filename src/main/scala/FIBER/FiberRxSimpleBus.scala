package FIBER

import SimpleBus.{SimpleBus, SimpleBusConfig}
import spinal.core.{Bool, UInt, _}
import spinal.lib.{Fragment, Stream, master, slave}
import SimpleBus._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

case class FiberRxSimpleBus(addrwidth : Int, datawidth : Int) extends Component{
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
          waddr := io.input.payload.fragment(15 downto 8).asUInt.resized
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


