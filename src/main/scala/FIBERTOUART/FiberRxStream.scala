package FIBERTOUART

import UART.StreamState.IDLE
import spinal.core.{Bits, _}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Fragment, Stream, StreamFifo, master, slave}

case class FiberRxStream(portcount : Int, datawidth : Int, datalength : Int) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = Vec(master Stream (Bits(8 bit)), portcount)
  }
  noIoPrefix()

  val rec_cnt = Reg(UInt(log2Up(datalength)+1 bits)) init 0

  val fsm = new StateMachine{
    val IDLE: State = new State with EntryPoint {
      whenIsActive{
        when(io.input.fire){
          rec_cnt := rec_cnt + 1
          goto(DATA_RECIEVE)
        }otherwise{
          rec_cnt := 0
        }
      }
    }
    val DATA_RECIEVE: State = new State{
      whenIsActive{
        when(io.input.fire){
          rec_cnt := rec_cnt + 1
          when(io.input.last){
            goto(IDLE)
          }
        }
      }
    }
  }
  for (i <- 0 until portcount) {
    io.output(i).valid := io.input.valid && (rec_cnt >= i*datalength/portcount) && (rec_cnt < (i+1)*datalength/portcount)
    io.output(i).payload := io.input.payload.fragment.resized
  }
  io.input.ready := True
}

case class DecodeRxStream() extends Component{
  val io = new Bundle{
    val input = slave Stream (Bits(8 bit))
    val output = master Stream (Bits(8 bit))
    val slaveid = in Bits(8 bit)
  }
  noIoPrefix()

  val rec_cnt = Reg(UInt(8 bits)) init 0
  val length = Reg(Bits(8 bits)) init 0

  val valid = Reg(Bool()) init False

  val functioncode = Reg(Bits(8 bit))


  val fsm = new StateMachine{
    val SlaveId: State = new State with EntryPoint {
      whenIsActive{
        when(io.input.valid && (io.input.payload === io.slaveid)){
          valid := True
          goto(FunctionCode)
        }otherwise{
          valid := False
          rec_cnt := 0
        }
      }
    }
    val FunctionCode: State = new State{
      whenIsActive{
        when(io.input.valid){
          when((io.input.payload === 0x03 || io.input.payload === 0x06 || io.input.payload === 0x10)){
            functioncode := io.input.payload
            goto(GetAddress)
          }otherwise{
            goto(SlaveId)
          }
        }
      }
    }
    val GetAddress: State = new State{
      whenIsActive{
        when(io.input.valid){
          rec_cnt := rec_cnt + 1
          when(rec_cnt >= 1){
            rec_cnt := 0
            when(functioncode === 0x03 || functioncode === 0x06){
              goto(ReadLength_WriteOneData)
            }otherwise{
              goto(GetDataLength)
            }
          }
        }
      }
    }
    val ReadLength_WriteOneData: State = new State{
      whenIsActive{
        when(io.input.valid){
          rec_cnt := rec_cnt + 1
          when(rec_cnt >= 1){
            rec_cnt := 0
            goto(GetCRC)
          }
        }
      }
    }
    val GetDataLength: State = new State{
      whenIsActive{
        when(io.input.valid){
          rec_cnt := rec_cnt + 1
          when(rec_cnt === 2){
            rec_cnt := 0
            length := io.input.payload
            goto(WriteMultiData)
          }
        }
      }
    }
    val WriteMultiData: State = new State{
      whenIsActive{
        when(io.input.valid){
          rec_cnt := rec_cnt + 1
          when(rec_cnt === length.asUInt - 1){
            rec_cnt := 0
            goto(GetCRC)
          }
        }
      }
    }
    val GetCRC: State = new State{
      whenIsActive{
        when(io.input.valid){
          rec_cnt := rec_cnt + 1
          when(rec_cnt >= 1){
            rec_cnt := 0
            goto(End)
          }
        }
      }
    }
    val End :State = new State{
      whenIsActive{
        valid := False
        goto(SlaveId)
      }
    }
  }
  io.input.ready := True
  io.output.valid := RegNext(io.input.valid) & valid & io.output.ready
  io.output.payload := RegNext(io.input.payload)
}


/*object DecodeRxStream{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new DecodeRxStream(1)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.input.valid #= false
      dut.io.output.ready #= true
      dut.clockDomain.waitSampling(10)
      dut.io.input.valid #= false
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x01
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x10
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x04
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x05
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x00
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x01
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0x02
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa1
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.clockDomain.waitSampling()

      dut.io.input.valid #= false
      dut.clockDomain.waitSampling(1000)
    }
  }
}*/
