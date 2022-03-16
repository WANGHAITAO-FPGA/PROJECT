package ENDAT

import spinal.core.{Bits, _}
import spinal.core.sim._
import spinal.lib.com.eth.{Crc, CrcKind}
import spinal.lib.{Counter, IMasterSlave, Reverse, master}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.io.{InOutWrapper, TriState, TriStateArray}

case class EndatInterface()  extends Bundle with IMasterSlave{
  val clk = Bool()
  val data = TriState(Bool())
  val data_dir = Bool()
  override def asMaster(): Unit = {
    out(clk,data_dir)
    master(data)
  }
}

case class Endat(endat_clkToogle : Int, Mode_Bits : Int, Pos_Bits : Int, Wait_Tcnt : Int) extends Component{
  val io = new Bundle{
    //val endat_clk = out Bool()
    //val endat_data = master(TriState(Bool()))
    val endat = master(EndatInterface())
    val sample = in Bool()
    val endat_mode = in Bits(Mode_Bits bits)
    val currentState = out UInt(4 bits)
    val postion = out Bits(Pos_Bits bits)
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

  val endat_clk = Reg(Bool()) init True
  val mode_out = Reg(Bool())
  val write_enable = Reg(Bool()) init False
  val buffer = Reg(Bits(Pos_Bits bits)) init 0
  val postion = Reg(Bits(Pos_Bits bits)) init 0
  val crc = Reg(Bits(5 bits)) init 0

  val crc5_cal = new Crc(CrcKind.usb.crc5,1)
  crc5_cal.io.flush := False
  crc5_cal.io.input.valid := False
  crc5_cal.io.input.payload := 0

  val endat_rddata = io.endat.data.read

  val crc_caldata = Reg(Bits(5 bits))

  val data_dir = Reg(Bool()) init True

  val fsm = new StateMachine{
    val counter = Reg(UInt(log2Up(Wait_Tcnt)+1 bits)) init 0
    val Wait_Start: State = new State with EntryPoint {
      whenIsActive{
        when(io.sample){
          endat_clk := True
          write_enable := True
          mode_out := False
          timer.reset := True
          crc5_cal.io.flush := True
          data_dir := True
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
            goto(Wait_Mode)
          }
        }
        //mode_out := io.endat_mode(Mode_Bits - 1 - (counter >> 1).resized)
        mode_out := io.endat_mode((counter >> 1).resized)
      }
    }
    val Wait_Mode: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          data_dir := False
          mode_out := False
        }
        when(endat_rddata && endat_clk){
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
            goto(Read_postion)
          }
        }
      }
    }
    val Read_postion: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter.lsb){
            buffer := ((endat_rddata##buffer)>>1).resized
            crc5_cal.io.input.payload := endat_rddata.asBits
            crc5_cal.io.input.valid := True
          }
          when(counter === (2*Pos_Bits-1)){
            counter := 0
            goto(Read_Crc)
          }
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
            crc := ((endat_rddata##crc)>>1).resized
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
        when(!endat_rddata){
          goto(Wait_Start)
        }
      }
    }
  }
  io.endat.clk := endat_clk
  io.endat.data.write := mode_out
  io.endat.data.writeEnable := write_enable
  io.postion := postion
  crc_caldata := crc5_cal.io.result
  io.endat.data_dir := data_dir
  addPrePopTask(()=>io.currentState.assignFromBits(fsm.stateReg.asBits))
}

object Endat extends App{
  SpinalVerilog(InOutWrapper(new Endat(4,8,8,500)))
}

/*
object Endat{
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Endat(4,8,8,500)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.sample #= false
      dut.io.endat.data.read #= false
      dut.clockDomain.waitSampling(10)
      dut.io.sample #= true
      dut.io.endat_mode #= 0x55
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
}*/
