package ENDAT

import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

import scala.util.Random
import scala.util.Random.nextBoolean

case class SsiInterface()  extends Bundle with IMasterSlave{
  val clk = Bool()
  val ss = Bool()
  val data = Bool()
  val en = Bool()
  override def asMaster(): Unit = {
    out(clk,ss)
    in(data,en)
  }
}

case class SSI(ssi_clkToogle : Int,datawidth : Int, Wait_Tcnt : Int) extends Component{
  val io = new Bundle{
    val ssi = master(SsiInterface())
    val sample = in Bool()
    val postion = out Bits(datawidth bits)
  }
  noIoPrefix()

  val timer = new Area{
    val counter = Reg(UInt(log2Up(ssi_clkToogle)+1 bits))
    val reset = False
    val ssi_clkToogleHit = counter === ssi_clkToogle
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }

  val ssi_clk = Reg(Bool()) init True
  val ss = Reg(Bool()) init True
  val buffer = Reg(Bits(datawidth bits)) init 0
  val postion = Reg(Bits(datawidth bits)) init 0

  val fsm = new StateMachine{
    val counter = Reg(UInt(log2Up(Wait_Tcnt)+1 bits)) init 0
    val Wait_Start: State = new State with EntryPoint {
      whenIsActive{
        when(io.sample){
          ssi_clk := True
          timer.reset := True
          counter := 0
          buffer := 0
          ss := False
          goto(Dummy_State)
        }otherwise{
          ss := True
        }
      }
    }
    val Dummy_State: State = new State{
      whenIsActive{
        when(timer.ssi_clkToogleHit){
          ssi_clk := ~ssi_clk
          timer.reset := True
          goto(Get_Data)
        }
      }
    }
    val Get_Data: State = new State{
      whenIsActive{
        when(timer.ssi_clkToogleHit){
          counter := counter + 1
          ssi_clk := ~ssi_clk
          timer.reset := True
          when(counter.lsb){
            buffer := (buffer##io.ssi.data).resized
          }
          when(counter === (2*datawidth-1)){
            counter := 0
            goto(Wait_State)
          }
        }
      }
    }
    val Wait_State: State = new State{
      whenIsActive{
        when(timer.ssi_clkToogleHit){
          ssi_clk := ~ssi_clk
          postion := buffer
          timer.reset := True
          goto(Wait_Time)
        }
      }
    }
    val Wait_Time: State = new State{
      whenIsActive{
        ssi_clk := True
        counter := counter + 1
        ss := True
        when(counter === Wait_Tcnt){
          counter := 0
          goto(Wait_Start)
        }
      }
    }
  }
  io.ssi.clk := ssi_clk
  io.postion := postion
  io.ssi.ss := ss
}

object SSI{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new SSI(4,32,500)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.sample #= false
      dut.clockDomain.waitSampling(10)
      dut.io.sample #= true
      dut.clockDomain.waitSampling()
      //var t = true
      for(idex <- 0 until 100){
        dut.clockDomain.waitSamplingWhere(dut.io.ssi.clk.toBoolean)
        dut.clockDomain.waitSamplingWhere(!dut.io.ssi.clk.toBoolean)
        //t = !t
        dut.io.ssi.data #= nextBoolean()
        //dut.clockDomain.waitSampling()
      }
      dut.clockDomain.waitSampling(1000)
    }
  }
}


