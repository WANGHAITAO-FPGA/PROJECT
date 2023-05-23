package YW_PROJ

import spinal.core._
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.{Counter, Flow, IMasterSlave, master, slave}
import spinal.lib.com.spi.{SpiKind, SpiMaster, SpiMasterCmd}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.io.InOutWrapper
import spinal.lib.misc.Timer

case class AD5781_Interface() extends Bundle with IMasterSlave{
  val cs = Bool()
  val sclk = Bool()
  val miso = Bool()
  val mosi = Bool()
  val ldac = Bool()
  val rst = Bool()
  val clr = Bool()
  override def asMaster(): Unit = {
    out(cs,sclk,mosi,ldac,rst,clr)
    in(miso)
  }
//  cs.setName("AD5781_CS")
//  sclk.setName("AD5781_SCLK")
//  miso.setName("AD5781_MISO")
//  mosi.setName("AD5781_MOSI")
//  ldac.setName("AD5781_LDAC")
//  rst.setName("AD5781_RSTN")
//  clr.setName("AD5781_CLRN")
}

case class AD5781_Ctrl(sclkToogle : Int) extends Component{
  val io = new Bundle{
    val ad5781 = master(AD5781_Interface())
    val daout_data = slave(Flow(Bits(18 bits)))
//    def driveFrom(bus : BusSlaveFactory, baseAddress : Int = 0)= new Area {
//      val streamUnbuffered = Flow(Bits(18 bits))
//      streamUnbuffered.valid := bus.isWriting(0)
//      bus.driveAndRead(streamUnbuffered.payload,0)
//      daout_data << streamUnbuffered
//    }
  }
  noIoPrefix()

  val resetn = Reg(Bool()) init True

  val counter = Counter(5000)

  val spi_ctrl = Spi_Master(24,sclkToogle)

  val ldac = Reg(Bool()) init True

  spi_ctrl.io.config.cpha := True
  spi_ctrl.io.config.cpol := False

  val spi_cmd_valid = Reg(Bool())
  spi_cmd_valid := False
  val spi_cmd_payload = Reg(Bits(24 bits))

  spi_ctrl.io.cmd.valid := spi_cmd_valid
  spi_ctrl.io.cmd.payload := spi_cmd_payload

  io.ad5781.cs := spi_ctrl.io.spi.ss.asBool
  io.ad5781.sclk := spi_ctrl.io.spi.sclk
  io.ad5781.mosi := spi_ctrl.io.spi.mosi
  spi_ctrl.io.spi.miso := io.ad5781.miso
  io.ad5781.rst := resetn
  io.ad5781.ldac := ldac
  io.ad5781.clr := True

  val fsm = new StateMachine{
    val Reset_Start: State = new State with EntryPoint {
      whenIsActive{
        counter.clear()
        resetn := False
        goto(Reset)
      }
    }
    val Reset: State = new State{
      whenIsActive{
        counter.increment()
        when(counter.value === 100){
          resetn := True
        }elsewhen(counter.willOverflowIfInc){
          counter.clear()
          spi_cmd_valid := True
          spi_cmd_payload := B"24'x400004"
          goto(SoftInstruction)
        }
      }
    }
    val SoftInstruction: State = new State{
      whenIsActive{
        when(spi_ctrl.io.rsp.valid){
          goto(Set_CtrlReg)
        }
      }
    }
    val Set_CtrlReg: State = new State{
      whenIsActive{
        counter.increment()
        when(counter.willOverflowIfInc){
          counter.clear()
          spi_cmd_valid:= True
          spi_cmd_payload := B"24'x200010"
          goto(Wait_SetDone)
        }
      }
    }
    val Wait_SetDone: State = new State{
      whenIsActive{
        when(spi_ctrl.io.rsp.valid){
          goto(Get_CtrlReg)
        }
      }
    }
    val Get_CtrlReg: State = new State{
      whenIsActive{
        counter.increment()
        when(counter.willOverflowIfInc){
          counter.clear()
          spi_cmd_valid:= True
          spi_cmd_payload := B"24'xa00000"
          goto(Check_Reg)
        }
      }
    }
    val Check_Reg: State = new State{
      whenIsActive{
        when(spi_ctrl.io.rsp.valid){
          goto(Wait_Time)
        }
      }
    }
    val Wait_Time: State = new State{
      whenIsActive{
        counter.increment()
        when(counter.value > 10){
          counter.clear()
          spi_cmd_valid:= True
          spi_cmd_payload := B"24'x000000"
          goto(Read_Reg)
        }
      }
    }

    val Read_Reg: State = new State{
      whenIsActive{
        when(spi_ctrl.io.rsp.valid){
          goto(Dummy)
        }
      }
    }
    val Dummy: State = new State{
      whenIsActive{
        counter.increment()
        when(counter.willOverflowIfInc){
          counter.clear()
          ldac := False
          goto(Inital_DacData)
        }
      }
    }
    val Inital_DacData: State = new State{
      whenIsActive{
        spi_cmd_valid:= True
        spi_cmd_payload := B"4'x1"##B"18'x1FFFF"##B"2'x0"
        goto(Wait_InitDone)
      }
    }
    val Wait_InitDone: State = new State{
      whenIsActive{
        when(spi_ctrl.io.rsp.valid){
          goto(Set_InitLdac)
        }
      }
    }
    val Set_InitLdac: State = new State{
      whenIsActive {
        counter.increment()
        when(counter.value >= 4) {
          ldac := True
          counter.clear()
          goto(WaitSet_DacData)
        }
      }
    }
    val WaitSet_DacData: State = new State{
      whenIsActive{
        when(io.daout_data.valid){
          ldac := False
          goto(Set_DacData)
        }
      }
    }
    val Set_DacData: State = new State{
      whenIsActive{
        spi_cmd_valid:= True
        spi_cmd_payload := B"4'x1"##io.daout_data.payload##B"2'x0"
        goto(Wait_SetDacDone)
      }
    }
    val Wait_SetDacDone: State = new State{
      whenIsActive{
        when(spi_ctrl.io.rsp.valid){
          goto(Set_Ldac)
        }
      }
    }
    val Set_Ldac: State = new State{
      whenIsActive{
        counter.increment()
        when(counter.value >= 4){
          ldac := True
          counter.clear()
          goto(WaitSet_DacData)
        }
      }
    }
//    val Set_DacData_1: State = new State{
//      whenIsActive{
//          ldac := False
//          spi_cmd_valid:= True
//          spi_cmd_payload := B"4'x1"##io.daout_data.payload##B"2'x0"
//          goto(Wait_SetDacDone_1)
//      }
//    }
//    val Wait_SetDacDone_1: State = new State{
//      whenIsActive{
//        when(spi_ctrl.io.rsp.valid){
//          goto(Set_Ldac_1)
//        }
//      }
//    }
//    val Set_Ldac_1: State = new State{
//      whenIsActive{
//        counter.increment()
//        when(counter.value <= 4){
//          ldac := True
//        }elsewhen((counter.value > 4)&&(counter.value <= 8)){
//          ldac := False
//        }elsewhen(counter.value > 8){
//          ldac := True
//          counter.clear()
//          goto(Set_DacData)
//        }
//      }
//    }
  }
}

case class Spi_Master(dataWidth : Int, sclkToogle : Int) extends Component{
  val io = new Bundle {
    val cmd = slave Flow(Bits(dataWidth bits))
    val rsp = master Flow(Bits(dataWidth bits))
    val spi = master(SpiMaster(1))
    val config = in (SpiKind())
  }
  noIoPrefix()

  val timer = new Area{
    val counter = Reg(UInt(10 bits))
    val reset = False
    val sclkToogleHit = counter === sclkToogle
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }

  val valid = Reg(Bool()) init False
  val data_temp = Reg(Bits(dataWidth bits)) init 0
  val rsp_valid = Reg(Bool())
  rsp_valid := False

  val fsm = new StateMachine{
    val counter = Counter(dataWidth*2)
    val buffer = Reg(Bits(dataWidth bits))
    val cs = Reg(Bool()) init True
    val cs_counter = Reg(UInt(10 bits)) init 0

    val Wait_Cmd: State = new State with EntryPoint {
      whenIsActive{
        when(io.cmd.valid){
          cs := False
          cs_counter := 0
          data_temp := io.cmd.payload
          goto(Active_CS)
        }
      }
    }
    val Active_CS: State = new State{
      whenIsActive{
        cs_counter := cs_counter + 1
        when(cs_counter > sclkToogle){
          valid := True
          cs_counter := 0
          timer.reset := True
          goto(Send_Data)
        }
      }
    }
    val Send_Data: State = new State{
      whenIsActive{
        when(counter.willOverflowIfInc){
          goto(End)
        }
      }
    }
    val End: State = new State{
      whenIsActive{
        valid := False
        cs_counter := cs_counter + 1
        when(cs_counter > sclkToogle){
          cs := True
          cs_counter := 0
          rsp_valid := True
          counter.clear()
          goto(Wait_Cmd)
        }
      }
    }

    when(valid) {
      when(timer.sclkToogleHit) {
        counter.increment()
        timer.reset := True
        when(!counter.lsb) {
          buffer := (buffer ## io.spi.miso).resized
        }
      }
    }

    io.rsp.valid   := RegNext(rsp_valid) init(False)
    io.rsp.payload := buffer

    io.spi.ss := cs.asBits
    io.spi.sclk := RegNext(((valid) && (counter.lsb ^ io.config.cpha)) ^ io.config.cpol)
    io.spi.mosi := RegNext(data_temp(dataWidth-1 - (counter >> 1)))
  }

}

object Spi_Master{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Spi_Master(24,20)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.cmd.valid #= false
      dut.io.config.cpha #= true
      dut.io.config.cpol #= false
      dut.clockDomain.waitSampling(50)
      dut.io.cmd.valid #= true
      dut.io.cmd.payload #= 0x555555
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(1500)
    }
  }
}

object AD5781_Ctrl{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new AD5781_Ctrl(20)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10000)
    }
  }
}

case class AD5781_Top() extends Component{
  val io = new Bundle{
    val ad5781 = master(AD5781_Interface())
    val sys_clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val clk_wiz_0 = new clk_wiz_0
  clk_wiz_0.clk_in1 := io.sys_clk
  clk_wiz_0.reset := False

  val area = new ClockingArea(ClockDomain(clk_wiz_0.clk_out1,~clk_wiz_0.locked)){
    val ad5781 = new AD5781_Ctrl(1)
    io.ad5781 <> ad5781.io.ad5781
    ad5781.io.ad5781.addAttribute("MARK_DEBUG","TRUE")

    val timer = Timer(32)
    timer.io.tick := True
    timer.io.limit := 20000
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }
    val valid = Reg(Bool())
    valid := False

    when(timer.io.full){
      valid := True
    }

    ad5781.io.daout_data.valid := valid
    ad5781.io.daout_data.payload := B"18'x0FFFF"
  }
}

object AD5781 extends App{
  SpinalConfig(headerWithDate = true
    ,targetDirectory = "E:/YW/YW_AD5781/YW_NEWBOARD.srcs/sources_1/imports/rtl"
  ).generateVerilog((new AD5781_Top()))
}

