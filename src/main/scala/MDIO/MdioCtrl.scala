package MDIO

import spinal.core._
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.com.spi.SpiMasterCmd
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Flow, IMasterSlave, master, slave}
import spinal.lib.io.{InOutWrapper, TriState}
import spinal.lib.misc.Timer

case class Mdio() extends Bundle with IMasterSlave{
  val MDC = Bool()
  val MDIO = TriState(Bool())
  override def asMaster(): Unit = {
    out(MDC)
    master(MDIO)
  }
}

object MdioCtrlCmdMode extends SpinalEnum(binarySequential){
  val READ, WRITE = newElement()
  defaultEncoding = SpinalEnumEncoding("MdioCtrlCmdMode")(
    READ -> 2,
    WRITE -> 1
  )
}

case class MdioCtrlConfig(timerWidth : Int) extends Bundle{
  val sclkToogle = UInt(timerWidth bits)
  val preamble = Bits(32 bits)
  val frame_start = Bits(2 bits)
  val opCode = Bits(2 bits)
  val phy_device_addr = Bits(5 bits)
  val phy_reg_addr = Bits(5 bits)
}

case class MdioCtrl(timerWidth : Int) extends Component{
  val io = new Bundle{
    val config = in(MdioCtrlConfig(timerWidth))
    val cmd = slave Flow(Bits(16 bits))
    val rsp = master Flow(Bits(16 bits))
    val mdio = master(Mdio())

    def driveFrom(bus : BusSlaveFactory, baseAddress : Int = 0) = new Area {
      //CMD
      val cmdLogic = new Area {
        cmd << bus.createAndDriveFlow(Bits(16 bits),address = baseAddress + 0)
      }
      //RSP
      val rspLogic = new Area {
        val (stream, fifoOccupancy) = rsp.queueWithOccupancy(8)
        bus.readStreamNonBlocking(stream, address = baseAddress + 4, validBitOffset = 31, payloadBitOffset = 0)
        bus.read(fifoOccupancy, address = baseAddress + 0, 16)
      }
      //Configs
      bus.drive(config.sclkToogle, baseAddress +  8)
      bus.drive(config.preamble, baseAddress +  12)
      bus.drive(config.frame_start, baseAddress +  16)
      bus.drive(config.opCode, baseAddress +  20)
      bus.drive(config.phy_device_addr, baseAddress +  24)
      bus.drive(config.phy_reg_addr, baseAddress +  28)
    }
  }
  noIoPrefix()
  io.cmd.addAttribute("MARK_DEBUG","TRUE")
  io.rsp.addAttribute("MARK_DEBUG","TRUE")

  val timer = new Area{
    val counter = Reg(UInt(timerWidth bits))
    val reset = False
    val sclkToogleHit = counter === io.config.sclkToogle
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }

  val mdc = Reg(Bool()) init True
  val start_flag = Reg(Bool()) init False

  when(timer.sclkToogleHit && start_flag){
    mdc := ~mdc
    timer.reset := True
  }
  io.mdio.MDC := mdc


  val mdio_out = Reg(Bool()) init True
  mdio_out := True

  val mdio_write_enable = Reg(Bool()) init False
  mdio_write_enable := False
  val cmd_reg_data = Reg(Bits(16 bits))
  val rsp_data = Reg(Bits(16 bits))
  val rsp_valid = Reg(Bool()) init False
  rsp_valid := False

  io.mdio.MDIO.write := mdio_out
  io.mdio.MDIO.writeEnable := mdio_write_enable

  val mdio_rddata = Reg(Bool()) init True
  mdio_rddata := io.mdio.MDIO.read

  val fsm = new StateMachine{
    val counter = Reg(UInt(8 bits)) init 0

    val IDLE : State = new State with EntryPoint {
      whenIsActive{
        timer.reset := True
        mdc := False
        when(io.cmd.valid){
          counter := 0
          start_flag := True
          mdio_write_enable := True
          cmd_reg_data := io.cmd.payload
          goto(Preamble)
        }otherwise{
          start_flag := False
        }
      }
    }
    val Preamble : State = new State{
      whenIsActive {
        mdio_write_enable := True
        when(mdc.fall()) {
          counter := counter + 1
          when(counter === 32 - 1) {
            counter := 0
            goto(Frame_start)
          }
        }
        mdio_out := io.config.preamble(32 - 1 - counter.resized)
      }
    }
    val Frame_start : State = new State{
      whenIsActive{
        mdio_write_enable := True
        when(mdc.fall()){
          counter := counter + 1
          when(counter === 2-1){
            counter := 0
            goto(OpCode)
          }
        }
        mdio_out := io.config.frame_start(2-1-counter.resized)
      }
    }
    val OpCode : State = new State{
      whenIsActive{
        mdio_write_enable := True
        when(mdc.fall()){
          counter := counter + 1
          when(counter === 2-1){
            counter := 0
            goto(Phy_device_addr)
          }
        }
        mdio_out := io.config.opCode(2-1-counter.resized)
      }
    }
    val Phy_device_addr : State = new State{
      whenIsActive{
        mdio_write_enable := True
        when(mdc.fall()){
          counter := counter + 1
          when(counter === 5-1){
            counter := 0
            goto(Phy_reg_addr)
          }
        }
        mdio_out := io.config.phy_device_addr(5 - 1 - counter.resized)
      }
    }
    val Phy_reg_addr : State = new State{
      whenIsActive{
        mdio_write_enable := True
        when(mdc.fall()){
          counter := counter + 1
          when(counter === 5-1){
            counter := 0
            when(io.config.opCode === MdioCtrlCmdMode.READ.asBits) {
              goto(Turn_around)
            }otherwise{
              goto(Write_Data)
            }
          }
        }
        mdio_out := io.config.phy_reg_addr(5 - 1 - counter.resized)
      }
    }
    val Write_Data : State = new State{
      whenIsActive{
        mdio_write_enable := True
        when(mdc.fall()){
          counter := counter + 1
          when(counter === 18-1){
            counter := 0
            goto(IDLE)
          }
        }
        mdio_out := (B"2'b10"##cmd_reg_data)(18 - 1 - counter.resized)
      }
    }
    val Turn_around : State = new State{
      whenIsActive{
        mdio_out := True
        when(mdc.rise()){
          counter := counter + 1
          when(counter === 2-1){
            counter := 0
            goto(Register_data)
          }
        }
      }
    }
    val Register_data : State = new State{
      whenIsActive{
          when(mdc.fall()){
            counter := counter + 1
            rsp_data := (rsp_data##mdio_rddata).resized
            when(counter === 16-1){
              counter := 0
              goto(END)
            }
          }
      }
    }
    val END : State = new State{
      whenIsActive{
        when(io.config.opCode === MdioCtrlCmdMode.READ.asBits){
          rsp_valid := True
        }
        goto(IDLE)
      }
    }
  }
  io.rsp.valid := rsp_valid
  io.rsp.payload := rsp_data
}

case class MdioCtrl_Test() extends Component{
  val io = new Bundle{
    val rsp = master Flow(Bits(16 bits))
    val mdio = master(Mdio())
  }
  noIoPrefix()

  val mdioctrl = new MdioCtrl(8)
  mdioctrl.io.addAttribute("MARK_DEBUG","TRUE")

  val opcode = Reg(Bits(2 bits)) init 2

  mdioctrl.io.mdio <> io.mdio
  mdioctrl.io.rsp <> io.rsp
  mdioctrl.io.config.opCode := opcode
  mdioctrl.io.config.preamble := B"32'xFFFFFFFF"
  mdioctrl.io.config.phy_device_addr := 0
  mdioctrl.io.config.phy_reg_addr := 2
  mdioctrl.io.config.sclkToogle := 20
  mdioctrl.io.config.frame_start := 1


  val timer = Timer(32)
  timer.io.tick := True
  timer.io.limit := 5000000
  when(timer.io.value >= timer.io.limit){
    timer.io.clear := True
  }otherwise{
    timer.io.clear := False
  }

  val trigger = Reg(Bool()) init False

  when(timer.io.full){
    trigger := ~trigger;
    when(trigger){
      opcode := 1
    }otherwise{
      opcode := 2
    }
  }
  mdioctrl.io.cmd.valid := timer.io.full
  mdioctrl.io.cmd.payload := B"16'x9140"
}

object MdioCtrl_Test extends App{
  SpinalVerilog(InOutWrapper(MdioCtrl_Test()))
}

object MdioCtrl{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new MdioCtrl(8)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.mdio.MDIO.read #= true
      dut.io.config.sclkToogle #= 5
      dut.io.config.preamble #= 0x11111111
      dut.io.config.frame_start #= 1
      dut.io.config.opCode #= 1
      dut.io.config.phy_device_addr #= 0
      dut.io.config.phy_reg_addr #= 0x0
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(10)
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(100)
      dut.io.cmd.valid #= true
      dut.io.cmd.payload #= 0x9140
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(2000)
    }
  }
}