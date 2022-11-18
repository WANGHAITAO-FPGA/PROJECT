package YW_PROJ

import spinal.core.{Bits, _}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Counter, Flow, IMasterSlave, master}
import spinal.lib.io.{InOutWrapper, TriState}

case class AD7760_Interface() extends Bundle with IMasterSlave{
  val cs = Bool()
  val drdy = Bool()
  val rd_wr = Bool()
  val reset_n = Bool()
  val mclk = Bool()
  val data = TriState(Bits(16 bits))
  override def asMaster(): Unit = {
    in(drdy)
    out(cs,rd_wr,reset_n,mclk)
    master(data)
  }
  cs.setName("AD7760_CS")
  drdy.setName("AD7760_DRDY")
  rd_wr.setName("AD7760_RD_WR")
  data.setName("AD7760_DATA")
  reset_n.setName("AD7760_RESETN")
  mclk.setName("AD7760_MCLK")
}


case class AD7760_Ctrl(clkToogle : Int) extends Component{
  val io = new Bundle{
    val ad7760 = master(AD7760_Interface())
    val ad_data = master(Flow(Bits(32 bits)))
    val ad_outdata = out Bits(24 bits)
  }
  noIoPrefix()

  val resetn = Reg(Bool()) init True
  val cs = Reg(Bool()) init True
  val rd_wr = Reg(Bool()) init False
  val drdy = Reg(Bool()) init True
  drdy := io.ad7760.drdy

  val write_data_temp = Reg(Bits(16 bits)) init 0
  val read_data_temp = Reg(Bits(32 bits)) init 0
  val read_data = Reg(Bits(32 bits)) init 0
  val write_enable = Reg(Bool()) init False
  val valid = Reg(Bool()) init False
  valid := False

  val counter = Counter(0,2000)

  val mclk = Reg(Bool()) init False

  val timer = new Area{
    val counter = Reg(UInt(log2Up(clkToogle)+1 bits))
    val reset = False
    val clkToogleHit = counter === clkToogle
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }
  when(timer.clkToogleHit){
    timer.reset := True
    mclk := ~mclk;
  }
  io.ad7760.mclk := mclk

  val fsm = new StateMachine{
    val Reset_Start: State = new State with EntryPoint {
      whenIsActive{
        when(mclk.fall()){
          resetn := False
          counter.clear()
          goto(Reset)
        }
      }
    }
    val Reset: State = new State{
      whenIsActive{
        write_data_temp := B"16'x0002"
        when(mclk.fall()){
          counter.increment()
          when((counter.value >= 20)&&(counter.value < 40)){
            resetn := True
          }elsewhen(counter.value > 40){
            counter.clear()
            cs := False
            rd_wr := True
            write_enable := True
            goto(WriteReg1_Start)
          }
        }
      }
    }
    val WriteReg1_Start: State = new State{
      whenIsActive{
        when(mclk.fall()){
          counter.increment()
          when((counter.value >= 2)&&(counter.value < 4)){
            cs := True
            write_data_temp := B"16'x0026"
          }elsewhen((counter.value >= 4)&&(counter.value < 6)){
            cs := False
          }elsewhen((counter.value >= 6)&&(counter.value < 10)){
            cs := True
            write_data_temp := B"16'x0001"
          }elsewhen(counter.value > 10){
            counter.clear()
            goto(WriteReg2_Start)
          }
        }
      }
    }
    val WriteReg2_Start: State = new State{
      whenIsActive{
        when(mclk.fall()){
          counter.increment()
          cs := False
          when((counter.value >= 2)&&(counter.value < 4)){
            cs := True
            write_data_temp := B"16'x001A"
          }elsewhen((counter.value >= 4)&&(counter.value < 6)){
            cs := False
          }elsewhen(counter.value >= 6){
            cs := True
            counter.clear()
            write_enable := False
            goto(Wait_DRDY)
          }
        }
      }
    }
    val Wait_DRDY: State = new State{
      whenIsActive{
        when(drdy.fall()){
          counter.clear()
          rd_wr := False
          goto(Read_Data)
        }
      }
    }
    val Read_Data: State = new State{
      whenIsActive{
        when(mclk.fall()){
          counter.increment()
          when(counter.value === 0){
            cs := False
          }elsewhen((counter.value >= 1)&&(counter.value < 2)){
            read_data_temp(31 downto 16) := io.ad7760.data.read
            cs := True
            rd_wr := True
          }elsewhen((counter.value === 2)){
            rd_wr := False
          }elsewhen((counter.value === 3)){
            cs := False
          }elsewhen(counter.value > 3){
            read_data_temp(15 downto 0) := io.ad7760.data.read
            read_data := read_data_temp(31 downto 16) ## io.ad7760.data.read
            counter.clear()
            cs := True
            rd_wr := True
            valid := True
            goto(Wait_DRDY)
          }
        }
      }
    }
  }
  io.ad7760.cs := cs
  io.ad7760.rd_wr := rd_wr
  io.ad7760.data.write := write_data_temp
  io.ad7760.data.writeEnable := write_enable
  io.ad7760.reset_n := resetn
  io.ad_data.valid := valid
  io.ad_data.payload := read_data
  io.ad_outdata := read_data(31 downto 8)
}

object AD7760_Ctrl_Sim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new AD7760_Ctrl(5)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.ad7760.drdy #= true
      dut.clockDomain.waitSampling(20)
      dut.clockDomain.waitSampling(2000)
      dut.io.ad7760.drdy #= false
      dut.clockDomain.waitSampling(2)
      dut.io.ad7760.data.read #= 0x0102
      dut.clockDomain.waitSampling(5)
      dut.io.ad7760.data.read #= 0x0304
      dut.clockDomain.waitSampling(2000)
    }
  }
}

case class Top() extends Component{
  val io = new Bundle{
    val ad7760 = master(AD7760_Interface())
    val sys_clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val clk_wiz_0 = new clk_wiz_0
  clk_wiz_0.clk_in1 := io.sys_clk
  clk_wiz_0.reset := False

  val area = new ClockingArea(ClockDomain(clk_wiz_0.clk_out1,~clk_wiz_0.locked)){
    val ad7760 = new AD7760_Ctrl(5)
    io.ad7760 <> ad7760.io.ad7760
    ad7760.io.ad_data.addAttribute("MARK_DEBUG","TRUE")
    ad7760.io.ad7760.addAttribute("MARK_DEBUG","TRUE")
    ad7760.io.ad_outdata.addAttribute("MARK_DEBUG","TRUE")
  }
}


object AD7760_Ctrl extends App{
  SpinalConfig(headerWithDate = true
    ,targetDirectory = "E:/YW/YW_NEWBOARD2/YW_NEWBOARD.srcs/sources_1/imports/rtl/"
  ).generateVerilog(InOutWrapper(new Top()))
}