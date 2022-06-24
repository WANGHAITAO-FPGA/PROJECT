package Test

import SDAC_2.SdacRxSimpleBus
import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.misc.Timer
import spinal.lib.{Fragment, Stream, StreamFifo, master, slave}

case class Test_TxSimpleBus(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int) extends Component{
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


case class Gssl_Test() extends Component{
  val io = new Bundle{
    val intput = slave(Stream(Fragment(Bits(32 bits))))
    val output = master(Stream(Fragment(Bits(32 bits))))

  }
  noIoPrefix()

  val tx_simplebus = new Test_TxSimpleBus(8,32,6250,0,34)
  io.output << tx_simplebus.io.output
  tx_simplebus.io.timer_tick := True

  val rx_simplebus = new SdacRxSimpleBus(8,32)
  rx_simplebus.io.input << io.intput

  val test_regif = new Test_Regif(8,32)
  test_regif.io.simplebus.WADDR := rx_simplebus.io.waddr
  test_regif.io.simplebus.WDATA := rx_simplebus.io.wdata
  test_regif.io.simplebus.WENABLE := rx_simplebus.io.wenable
  test_regif.io.simplebus.RADDR := tx_simplebus.io.RADDR
  test_regif.io.simplebus.RENABLE := tx_simplebus.io.RENABLE
  tx_simplebus.io.RDATA := test_regif.io.simplebus.RDATA
}

//object Gssl_Test{
//  import spinal.core.sim._
//  def main(args: Array[String]): Unit = {
//    SimConfig.withWave.doSim(new Gssl_Test){dut=>
//      dut.clockDomain.forkStimulus(10)
//      dut.io.output.ready #= false
//      dut.clockDomain.waitSampling(100)
//      dut.io.output.ready #= true
//      dut.clockDomain.waitSampling(50000)
//    }
//  }
//}

object Gssl_Test extends App{
  SpinalVerilog(new Gssl_Test)
}
