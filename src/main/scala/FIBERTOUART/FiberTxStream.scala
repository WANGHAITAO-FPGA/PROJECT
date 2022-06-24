package FIBERTOUART

import Memory.{Muli_Mem, XILINX_BRAM_PORT}
import Memory.RamPortType.READ
import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.misc.Timer
import spinal.lib.{Fragment, Stream, StreamFifo, StreamJoin, master, slave}

import scala.util.Random

case class FiberTxStream(pushCd : ClockDomain, popCd : ClockDomain, portcount : Int, datawidth : Int, datalength : Int, rxfifodepth : Int, timerl_imit: Int) extends Component{
  val io = new Bundle{
    val reads = Seq.fill(portcount)(master(XILINX_BRAM_PORT(8, log2Up(rxfifodepth), READ)))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val timer_tick = in Bool()
  }
  noIoPrefix()

  val push = pushCd on new Area{
    val timer = Timer(32)
    timer.io.tick := io.timer_tick
    timer.io.limit := timerl_imit
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }

    val send_length = Reg(UInt(8 bits)) init 0
    val rd_addr = Reg(UInt((log2Up(rxfifodepth)) bits)) init 0
    val portcnt = Reg(UInt((log2Up(portcount)) bits)) init 0
    val rd_data = Reg(Bits(8 bits))
    val valid = Reg(Bool()) init False
    val last = Reg(Bool()) init False

    val fsm =new StateMachine{
      val Wait_Start: State = new State with EntryPoint {
        whenIsActive{
          when(timer.io.full){
            valid := False
            last := False
            goto(Send_Data)
          }otherwise{
            valid := False
            last := False
            rd_addr := 0
            send_length := 0
            portcnt := 0
          }
        }
      }
      val Send_Data: State = new State{
        whenIsActive{
          send_length := send_length + 1
          rd_addr := rd_addr + 1
          valid := True
          when(send_length === datalength/portcount-2){
            goto(End)
          }
        }
      }
      val End: State = new State{
        whenIsActive{
          when(portcnt === portcount-1){
            portcnt := 0
            last := True
            goto(Wait_Start)
          }otherwise{
            portcnt := portcnt + 1
            send_length := 0
            rd_addr := 0
            goto(Send_Data)
          }
        }
      }
    }
    for(i <- 0 until portcount){
      io.reads(i).en := (portcnt === i)
      io.reads(i).addr := rd_addr
      when(io.reads(i).en){
        when(send_length === 0){
          rd_data := io.reads(portcnt-1).dataOut
        }otherwise{
          rd_data := io.reads(portcnt).dataOut
        }
      }
    }
    /*val streamfifo = new StreamFifo(Bits(8 bits),datalength)
    streamfifo.io.push.valid := RegNext(valid)
    streamfifo.io.push.payload := rd_data
    io.output.valid := streamfifo.io.pop.valid
    io.output.payload.fragment := streamfifo.io.pop.payload.resize(datawidth bits)
    streamfifo.io.pop.ready := io.output.ready
    io.output.payload.last := (streamfifo.io.occupancy === 1) & io.output.fire*/

    val fibertxbuffer = new FiberTxBuffer(pushCd,popCd,8,datawidth,1024)
    fibertxbuffer.io.push.stream.valid := RegNext(valid) init False
    fibertxbuffer.io.push.stream.payload.fragment := rd_data
    fibertxbuffer.io.push.stream.payload.last := RegNext(last) init False

    io.output.valid := fibertxbuffer.io.pop.stream.valid
    io.output.payload.fragment := fibertxbuffer.io.pop.stream.payload
    io.output.payload.last := fibertxbuffer.io.pop.last
    fibertxbuffer.io.pop.stream.ready := io.output.ready
  }
}

/*object FiberTxStream extends App{
  SpinalConfig(enumPrefixEnable = false)
    .generateSystemVerilog(new FiberTxStream(2,8,32,32,2000))
}*/


/*
case class FiberTxTest() extends Component{
  val io = new Bundle{
    val timer_tick = in Bool()
    val output = master(Stream(Fragment(Bits(8 bits))))
  }
  noIoPrefix()

  val fibertxstream = new FiberTxStream(3,8,32,32,2000)
  fibertxstream.io.timer_tick := io.timer_tick
  fibertxstream.io.output <> io.output
  val meminitvalue = for(i <- 0 until 32)yield{
    val initdata = i + 10
    BigInt(initdata)
  }
  val mem1 = Mem(Bits(8 bits), 32) initBigInt(meminitvalue)
  val mem2 = Mem(Bits(8 bits), 32) initBigInt(meminitvalue)
  val mem3 = Mem(Bits(8 bits), 32) initBigInt(meminitvalue)

  fibertxstream.io.reads(0).dataOut := mem1.readSync(fibertxstream.io.reads(0).addr,fibertxstream.io.reads(0).en)
  fibertxstream.io.reads(1).dataOut := mem1.readSync(fibertxstream.io.reads(1).addr,fibertxstream.io.reads(1).en)
  fibertxstream.io.reads(2).dataOut := mem1.readSync(fibertxstream.io.reads(2).addr,fibertxstream.io.reads(2).en)

}

object FiberTxTest{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new FiberTxTest()){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.timer_tick #= true
      dut.io.output.ready #= false
      dut.clockDomain.waitSampling(10)
      dut.clockDomain.waitSampling(2000)
      for(i <- 0 until 1000){
        dut.io.output.ready #= Random.nextBoolean()
          dut.clockDomain.waitSampling()
      }
      dut.clockDomain.waitSampling(1000)
    }
  }
}*/