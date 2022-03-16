package MLMC300

import PHPA82.BissCInterface
import spinal.core._
import spinal.core.{Bool, Bundle, in, out}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Delay, IMasterSlave, slave}

case class BissC_Slave(datawidth: Int,timecnt : Int) extends Component{
  val io = new Bundle{
    val s_bissc = slave(BissCInterface())
    val m_postion = in Bits(datawidth bits)
    val currentState = out (Bits(3 bits))
    val postion_temp = out (UInt(datawidth bits))
  }
  noIoPrefix()

  val bisscdata = Reg(Bool()) init True
  val clkrise_cnt = Reg(UInt(6 bits)) init 0
  val timeout_cnt = Reg(UInt(8 bits)) init 0
  val postion_reg = Reg(Bits(datawidth bits))

  io.postion_temp := postion_reg.asUInt

  val enc_clk = Reg(Bool()) init False
  enc_clk := io.s_bissc.enc_clk

  val fsm = new StateMachine{
    val Wait_Start:State = new State with EntryPoint{
      whenIsActive{
        //bisscdata := True
        when(enc_clk.fall()){
          bisscdata := True
          postion_reg := io.m_postion
          clkrise_cnt := 0
          timeout_cnt := 0
          goto(Slo)
        }
      }
    }
    val Slo:State = new State{
      whenIsActive{
        timeout_cnt := timeout_cnt+1
        when(enc_clk.rise()){
          timeout_cnt := 0
          bisscdata := False
          clkrise_cnt := clkrise_cnt + 1
          when(clkrise_cnt === 1){
            bisscdata := False
            clkrise_cnt := 0
            goto(Ack)
          }
        }
        when(timeout_cnt > 200){
          timeout_cnt := 0
          goto(Wait_Start)
        }
      }
    }
    val Ack:State = new State{
      whenIsActive{
        timeout_cnt := timeout_cnt + 1
        when(enc_clk.rise()){
          timeout_cnt := 0
          bisscdata := True
          goto(Start)
        }
        when(timeout_cnt > 200){
          timeout_cnt := 0
          goto(Wait_Start)
        }
      }
    }
    val Start:State = new State{
      whenIsActive{
        timeout_cnt := timeout_cnt + 1
        when(enc_clk.rise()){
          timeout_cnt := 0
          bisscdata := False
          goto(Zero)
        }
        when(timeout_cnt > 200){
          timeout_cnt := 0
          goto(Wait_Start)
        }
      }
    }
    val Zero:State = new State{
      whenIsActive{
        timeout_cnt := timeout_cnt + 1
        when(enc_clk.rise()){
          timeout_cnt := 0
          bisscdata := postion_reg((datawidth-clkrise_cnt-1).resized)
          clkrise_cnt := clkrise_cnt + 1
          goto(PostionOut)
        }
        when(timeout_cnt > 200){
          timeout_cnt := 0
          goto(Wait_Start)
        }
      }
    }
    val PostionOut:State = new State{
      whenIsActive{
        timeout_cnt := timeout_cnt + 1
        when(enc_clk.rise()){
          timeout_cnt := 0
          clkrise_cnt := clkrise_cnt + 1
          bisscdata := postion_reg((datawidth-clkrise_cnt-1).resized)
          when(clkrise_cnt === datawidth){
            bisscdata := False
            timeout_cnt := 0
            goto(TimeOut)
          }
        }
        when(timeout_cnt > 200){
          timeout_cnt := 0
          goto(Wait_Start)
        }
      }
    }
    val TimeOut:State = new State{
      whenIsActive{
        when((enc_clk.rise()||enc_clk.fall())){
          timeout_cnt := 0
        }otherwise{
          when(timeout_cnt > timecnt){
            timeout_cnt := 0
            bisscdata := True
            goto(Wait_Start)
          }otherwise{
            timeout_cnt := timeout_cnt+1
          }
        }
      }
    }
  }
  io.s_bissc.enc_data := bisscdata
  addPrePopTask(()=>io.currentState.assignFromBits(fsm.stateReg.asBits))
}

/*object BissC extends App{
  SpinalConfig(enumPrefixEnable = false).generateVerilog(new BissC(32,50))
}*/

object BissC{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new BissC_Slave(40,100)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.m_postion #= 0x55555555
      dut.io.s_bissc.enc_clk #= true
      dut.clockDomain.waitSampling(10)
      for(idx <- 0 until 47){
        for(i <- 0 until 10){
          dut.clockDomain.waitSampling()
          dut.io.s_bissc.enc_clk #= false
        }
        for(i <- 0 until 10){
          dut.clockDomain.waitSampling()
          dut.io.s_bissc.enc_clk #= true
        }
        if(idx == 10){
          dut.io.m_postion #= 0
        }
      }
      dut.clockDomain.waitSampling(100)
    }
  }
}