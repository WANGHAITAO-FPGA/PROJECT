package Test

import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{IMasterSlave, master}

case class Ad7606B_Interface() extends Bundle with IMasterSlave{
  val data = Bits(16 bits)
  val busy = Bool()
  val frstdata = Bool()
  val os = UInt(3 bits)
  val cs = Bool()
  val rd = Bool()
  val reset = Bool()
  val convst = Bool()
  val range = Bool()
  val wr = Bool()
  override def asMaster(): Unit = {
    out(os,cs,rd,reset,convst,range,wr)
    in(data,busy,frstdata)
  }
}

case class AD7606_B(clk_divide: Int,Wait_Tcnt: Int) extends Component{
  val io = new Bundle{
    val ad_port = master(Ad7606B_Interface())
    val sample_en = in Bool()
    val sample_data = out Vec(Bits(16 bits),8)
  }
  noIoPrefix()

  val sample_clk = Reg(Bool()) init False

  val timer = new Area{
    val counter = Reg(UInt(log2Up(clk_divide)+1 bits)) init 0
    val reset = False
    val sample_clkToogleHit = counter === clk_divide
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }

  when(timer.sample_clkToogleHit){
    sample_clk := !sample_clk
    timer.reset := True
  }

  val sample_area = new ClockingArea(ClockDomain(sample_clk,this.clockDomain.reset)){
    val cs = Reg(Bool()) init True
    val rd = Reg(Bool()) init True
    val convst = Reg(Bool()) init True
    val counter = Reg(UInt(log2Up(Wait_Tcnt)+1 bits)) init 0
    val data = Vec(Reg(Bits(16 bits)),8)
    val i = Reg(UInt(4 bits)) init 0

    val fsm = new StateMachine{
      val Wait_Start: State = new State with EntryPoint {
        whenIsActive{
          when(io.sample_en){
            counter := 0
            goto(Convst_State)
          }
        }
      }
      val Convst_State: State = new State{
        whenIsActive{
          counter := counter+1
          when(counter === 5){
            convst := False
          }elsewhen(counter === 7){
            convst := True
          }elsewhen(counter === 12){
            counter := 0
            goto(Wait_Busy)
          }
        }
      }
      val Wait_Busy: State = new State{
        whenIsActive{
          when(!io.ad_port.busy){
            goto(CsRd_State)
          }
        }
      }
      val CsRd_State: State = new State{
        whenIsActive{
          cs := False
          rd := False
          goto(Wait_Frstdata)
        }
      }
      val Wait_Frstdata: State = new State{
        whenIsActive{
          when(io.ad_port.frstdata){
            rd := True
            i := i + 1
            data(0) := io.ad_port.data
            goto(Rd_Data_Low)
          }
        }
      }
      val Rd_Data_Low: State = new State{
        whenIsActive{
          rd := False
          goto(Rd_Data_High)
        }
      }
      val Rd_Data_High: State = new State{
        whenIsActive{
          rd := True
          when(i < 8){
            data(i.resized) := io.ad_port.data
            i := i + 1
            goto(Rd_Data_Low)
          }otherwise{
            i := 0
            goto(Wait_Dummy)
          }
        }
      }
      val Wait_Dummy: State = new State{
        whenIsActive{
          cs := True
          counter := counter + 1
          when(counter >= Wait_Tcnt){
            counter := 0
            goto(Wait_Start)
          }
        }
      }
    }
    io.ad_port.cs := cs
    io.ad_port.rd := rd
    io.ad_port.convst := convst
    for(i <- 0 until 8){
      io.sample_data(i) := data(i)
    }
    io.ad_port.os := 0
    io.ad_port.wr := True
    io.ad_port.range := True
  }
  io.ad_port.reset := False
}

object AD7606_B extends App{
  SpinalConfig(
    enumPrefixEnable = false
  ).generateVerilog(new AD7606_B(4,20))
}

object AD7606_Sim{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new AD7606_B(4,20)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10)
      dut.clockDomain.waitSampling(1000)
    }
  }
}