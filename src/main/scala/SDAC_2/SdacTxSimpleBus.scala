package SDAC_2

import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Fragment, Stream, StreamFifo, master}
import spinal.lib.misc.Timer

case class SdacTxSimpleBus(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int) extends Component{
  //assert(data_length % 32 == 0, "Currently support only data_length multiple of 32")
  assert(start_addr % 4 == 0, "Currently support only start_addr multiple of 4")

  val io = new Bundle{
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val RENABLE = out Bool()
    val RADDR = out UInt(addrwidth bits)
    val RDATA = in Bits(datawidth bits)
    val timer_tick = in Bool()
  }
  noIoPrefix()

  val RENABLE = Reg(Bool()) init False
  val RADDR = Reg(UInt(addrwidth bits)) init 0
  val RDATA = Reg(Bits(datawidth bits))
  val send_length = Reg(UInt(addrwidth bits)) init 0


  val timer = Timer(32)
  timer.io.tick := io.timer_tick
  timer.io.limit := timerl_imit
  when(timer.io.value >= timer.io.limit){
    timer.io.clear := True
  }otherwise{
    timer.io.clear := False
  }

  val streamfifo = new StreamFifo(Bits(datawidth bits),data_length)
  streamfifo.logic.ram.addAttribute("ram_style", "block")

  val fsm =new StateMachine{
    val Wait_Start: State = new State with EntryPoint {
      whenIsActive{
        when(timer.io.full){
          RADDR := start_addr
          RENABLE := True
          send_length := 0
          goto(Send_Data)
        }
      }
    }
    val Send_Data: State = new State{
      whenIsActive{
        RADDR := RADDR + 4
        send_length := send_length + 1
        when(send_length === data_length-1){
          RENABLE := False
          goto(End)
        }
      }
    }
    val End: State = new State{
      whenIsActive{
        send_length := 0
        RENABLE := False
        goto(Wait_Start)
      }
    }
  }
  io.RADDR := RADDR
  io.RENABLE := RENABLE

  streamfifo.io.push.payload := io.RDATA
  streamfifo.io.push.valid := RegNext(RENABLE)

  io.output.payload.fragment := streamfifo.io.pop.payload
  io.output.valid := streamfifo.io.pop.valid
  streamfifo.io.pop.ready := io.output.ready
  io.output.payload.last := (streamfifo.io.occupancy === 1) & io.output.fire
}
