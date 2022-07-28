package ENDAT

import CRCCORE.{CRC5, CRCCombinational, CRCCombinationalCmdMode, CRCCombinationalConfig}
import spinal.core.{Bits, _}
import spinal.core.sim._
import spinal.lib.com.eth.{Crc, CrcKind}
import spinal.lib.{Counter, IMasterSlave, Reverse, master}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.io.{InOutWrapper, TriState, TriStateArray}
import spinal.lib.misc.Timer

case class EndatInterface()  extends Bundle with IMasterSlave{
  val clk = Bool()
  val data = TriState(Bool())
  override def asMaster(): Unit = {
    out(clk)
    master(data)
  }
}

case class Endat(endat_clkToogle : Int, Mode_Bits : Int, Pos_Bits : Int, Wait_Tcnt : Int) extends Component{
  val io = new Bundle{
    val endat = master(EndatInterface())
    val sample = in Bool()
    val endat_mode = in Bits(Mode_Bits bits)
    val currentState = out UInt(4 bits)
    val postion = out Bits(Pos_Bits bits) addTag(crossClockDomain)
    val crc = out Bits(5 bits)
    val crc_cal_result = out Bits(5 bits)
    val crc_check = out Bool()
  }
  noIoPrefix()

  val timer = new Area{
    val counter = Reg(UInt(log2Up(endat_clkToogle)+1 bits))
    val reset = False
    val endat_clkToogleHit = counter === endat_clkToogle
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }

  val init_timer_tick = Reg(Bool()) init False

  val init_timer_limit = Reg(UInt(32 bits)) init 0

  val init_timer = Timer(32)
  init_timer.io.tick := init_timer_tick
  init_timer.io.limit := init_timer_limit
  when(init_timer.io.value >= init_timer.io.limit){
    init_timer.io.clear := True
  }otherwise{
    init_timer.io.clear := False
  }

  val endat_clk = Reg(Bool()) init True
  val mode_out = Reg(Bool())
  val write_enable = Reg(Bool()) init False
  val buffer = Reg(Bits(Pos_Bits bits)) init 0
  val postion = Reg(Bits(Pos_Bits bits)) init 0
  val crc = Reg(Bits(5 bits)) init 0

  val endat_rddata = Reg(Bool()) init False

  endat_rddata := io.endat.data.read

  val crc_cal = new CRCCombinational(CRCCombinationalConfig(CRC5.ENDAT, 1 bits))
  val crc_valid = Reg(Bool()) init False
  val crc_payload = Reg(Bits(1 bits)) init 0
  val crc_mode = CRCCombinationalCmdMode
  crc_cal.io.cmd.valid := crc_valid
  crc_cal.io.cmd.data := crc_payload
  crc_cal.io.cmd.mode := crc_mode.INIT

  val crc_check = Reg(Bool()) init False

  val fsm = new StateMachine{
    val counter = Reg(UInt(log2Up(Wait_Tcnt)+1 bits)) init 0
    val Init_Start: State = new State with EntryPoint {
      whenIsActive{
        init_timer_tick := True
        init_timer_limit := 45000000
        endat_clk := True
        counter := 0
        when(init_timer.io.full){
          init_timer_tick := False
          endat_clk := False
          goto(Endat_Init)
        }
      }
    }
    val Endat_Init : State = new State{
      whenIsActive{
        counter := counter + 1
        when(counter > 10){
          endat_clk := True
          counter := 0
          init_timer_tick := True
          init_timer_limit := 200000000
          goto(Init_Done)
        }
      }
    }
    val Init_Done : State = new State{
      whenIsActive{
        when(init_timer.io.full){
          init_timer_tick := False
          goto(Wait_Start)
        }
      }
    }
    val Wait_Start: State = new State{
      whenIsActive{
        when(io.sample){
          endat_clk := True
          write_enable := False
          mode_out := False
          timer.reset := True
          crc_valid := False
          crc_check := False
          goto(Dummy_State)
        }
      }
    }
    val Dummy_State: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 4){
            write_enable := True
            counter := 0
            goto(Send_Mode)
          }
        }
      }
    }
    val Send_Mode: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          buffer := 0
          when(counter === (2*Mode_Bits-1)){
            counter := 0
            write_enable := False
            goto(Two_Cycle)
          }
        }
        mode_out := io.endat_mode(Mode_Bits - 1 - (counter >> 1).resized)
        //mode_out := io.endat_mode((counter >> 1).resized)
      }
    }
    val Two_Cycle: State = new State{
      whenIsActive{
        mode_out := False
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (3)){
            counter := 0
            write_enable := False
            goto(Wait_Mode)
          }
        }
      }
    }
    val Wait_Mode: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          mode_out := False
        }
        when(endat_rddata.rise(False) && endat_clk){
          counter := 0
          goto(Read_Start)
        }
      }
    }
    val Read_Start: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 1){
            counter := 0
            write_enable := False
            goto(Read_F1)
          }otherwise{
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_F1:  State = new State{
      whenIsActive{
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 1){
            counter := 0
            write_enable := False
            goto(Read_postion)
          }otherwise{
            crc_payload := endat_rddata.asBits
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_postion: State = new State{
      whenIsActive{
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(!counter.lsb){
            buffer := ((endat_rddata##buffer)>>1).resized
            crc_valid := True
            crc_payload := endat_rddata.asBits
          }
          when(counter === (2*Pos_Bits-1)){
            counter := 0
            crc := 0
            goto(Read_Crc)
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_Crc: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          postion := buffer
          when(counter.lsb){
            crc := (crc##endat_rddata).resized
          }
          when(counter === (2*5-1)){
            counter := 0
            goto(Wait_Reset)
          }
        }
      }
    }
    val Wait_Reset: State = new State{
      whenIsActive{
        crc_check := crc === crc_cal.io.crc
        counter := counter + 1
        when(counter > Wait_Tcnt) {
          counter := 0
          goto(Wait_Start)
        }
      }
    }
  }
  io.endat.clk := endat_clk
  io.endat.data.write := mode_out
  io.endat.data.writeEnable := write_enable
  io.postion := RegNextWhen(postion,crc_check)
  io.crc := crc
  io.crc_cal_result := crc_cal.io.crc
  io.crc_check := crc_check
  addPrePopTask(()=>io.currentState.assignFromBits(fsm.stateReg.asBits))
}

object Endat extends App{
  SpinalVerilog(new Endat(30,6,38,3000))
}


object Endat_Sim{
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Endat(4,6,8,500)){dut=>
      dut.clockDomain.forkStimulus(20)
      dut.io.sample #= false
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.clockDomain.waitSampling(60)
      dut.io.sample #= true
      dut.io.endat_mode #= 7
      dut.clockDomain.waitSampling()
      dut.io.sample #= false
      dut.clockDomain.waitSampling(200)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.endat.data.read #= true
      dut.clockDomain.waitSampling(5000)
    }
  }
}
