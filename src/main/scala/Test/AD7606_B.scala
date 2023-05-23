package Test

import PHPA82.AD7606_DATA
import PHPA82.ila_test.ila
import YW_PROJ.clk_wiz_0
import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Counter, IMasterSlave, master}

case class Ad7606_Interface(withos : Boolean = false, withrange : Boolean = false, withwr : Boolean = false) extends Bundle with IMasterSlave{
  val data = Bits(16 bits)
  val busy = Bool()
  val firstdata = Bool()
  val os = if(withos) UInt(3 bits) else null
  val cs = Bool()
  val rd = Bool()
  val reset = Bool()
  val convsta = Bool()
  val convstb = Bool()
  val range = if(withrange) Bool() else null
  val wr = if(withwr) Bool() else null
  override def asMaster(): Unit = {
    out(cs,rd,reset,convsta,convstb)
    in(data,busy,firstdata)
    if(withos) out(os) else null
    if(withrange) out(range) else null
    if(withwr) out(wr) else null
  }
  data.setName("AD7606_data_in")
  busy.setName("AD7606_busy")
  firstdata.setName("AD7606_frstdata")
  if(withos) os.setName("AD7606_os") else null
  cs.setName("AD7606_cs")
  rd.setName("AD7606_rd")
  convsta.setName("AD7606_convsta")
  convstb.setName("AD7606_convstb")
  if(withrange) range.setName("AD7606_range") else null
  if(withwr) wr.setName("AD7606_wr") else null
}

case class AD7606_Ctrl(clk_divide: Int,Wait_Tcnt: Int,withos : Boolean = false, withrange : Boolean = false, withwr : Boolean = false) extends Component{
  val io = new Bundle{
    val ad_7606 = master(Ad7606_Interface(withos,withrange,withwr))
    val sample_en = in Bool()
    val adc_data = master Flow(Vec(Bits(16 bits),8))
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
    val data = Vec(Reg(Bits(16 bits)),8) addTag(crossClockDomain)
    val i = Reg(UInt(4 bits)) init 0
    val valid = Reg(Bool())
    valid := False

    val reset = Reg(Bool()) init False

    val fsm = new StateMachine{
      val Reset_Start: State = new State with EntryPoint {
        whenIsActive{
          counter := counter + 1
          reset := True
          when(counter > 20){
            counter := 0
            reset := False
            goto(Wait_Start)
          }
        }
      }
      val Wait_Start: State = new State{
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
          when(!io.ad_7606.busy){
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
          when(io.ad_7606.firstdata){
            rd := True
            i := i + 1
            data(0) := io.ad_7606.data
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
            data(i.resized) := io.ad_7606.data
            i := i + 1
            goto(Rd_Data_Low)
          }otherwise{
            i := 0
            valid := True
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
    io.ad_7606.cs := cs
    io.ad_7606.rd := rd
    io.ad_7606.convsta := convst
    io.ad_7606.convstb := convst
    io.ad_7606.reset := reset
    for(i <- 0 until 8){
      io.adc_data.payload(i) := data(i)
    }
    io.adc_data.valid := valid
    if(withos) io.ad_7606.os := 0 else null
    if(withwr) io.ad_7606.wr := True else null
    if(withrange) io.ad_7606.range := True else null
  }
}

case class AD7606_Top(clk_divide: Int,Wait_Tcnt: Int,withos : Boolean = false, withrange : Boolean = false, withwr : Boolean = false) extends Component {
  val io = new Bundle {
    val ad7606 = master(Ad7606_Interface(withos,withrange,withwr))
    val sys_clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val clk_wiz_0 = new clk_wiz_0
  clk_wiz_0.clk_in1 := io.sys_clk
  clk_wiz_0.reset := False

  val area = new ClockingArea(ClockDomain(clk_wiz_0.clk_out1,~clk_wiz_0.locked)){
    val ad7606_ctrl = new AD7606_Ctrl(clk_divide,Wait_Tcnt,true)
    io.ad7606 <> ad7606_ctrl.io.ad_7606
    ad7606_ctrl.io.sample_en := True
    ad7606_ctrl.io.addAttribute("MARK_DEBUG","TRUE")
//    val ad7606 = new AD7606_DATA()
//    ad7606.io.clk := clk_wiz_0.clk_out1
//    ad7606.io.reset := ~clk_wiz_0.locked
//
//    ad7606.io.sample_en := True
//
//    ad7606.io.ad_busy := io.ad7606.busy
//    ad7606.io.first_data := io.ad7606.firstdata
//    ad7606.io.ad_data := io.ad7606.data.asUInt
//
//    io.ad7606.convsta := ad7606.io.ad_convsta
//    io.ad7606.convstb := ad7606.io.ad_convstb
//    io.ad7606.cs := ad7606.io.ad_cs
//    io.ad7606.os := ad7606.io.ad_os
//    io.ad7606.rd := ad7606.io.ad_rd
//    io.ad7606.reset := ad7606.io.ad_reset
//
//    io.ad7606.addAttribute("MARK_DEBUG","TRUE")

  }
}

//object AD7606_Sim{
//  import spinal.core.sim._
//  def main(args: Array[String]): Unit = {
//    SimConfig.withWave.doSim(new AD7606_Ctrl(4,20)){dut=>
//      dut.clockDomain.forkStimulus(10)
//      dut.clockDomain.waitSampling(10)
//      dut.clockDomain.waitSampling(1000)
//    }
//  }
//}

object AD7606 extends App{
  SpinalConfig(headerWithDate = true
    ,targetDirectory = "E:/YW/YW_AD7606/YW_NEWBOARD.srcs/sources_1/imports/rtl"
  ).generateVerilog((new AD7606_Top(5,20,true)))
}