package PHPA82

import PHPA82.regFileGen.regInsert
import SDAC_2.{SdacRxPreamble, SdacRxSimpleBus, SdacTxSimpleBus}
import SimpleBus._
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.misc.Timer
import spinal.lib.{Fragment, Stream, master, slave}

import java.time.LocalDate

object HsslConfig{
  def getApb3Config() = Apb3Config(addressWidth = 8,dataWidth = 16)
}


case class Phpa_Reg() extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(8,32)))
    val slaveid = in Bits(32 bits)
    val endcoder_value_in = in Vec(Bits(32 bits),2)
    val endcoder_value_out = out Vec(Bits(32 bits),2)
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
  HEADER := 0x00F1F2F3

  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
  Slaveid := io.slaveid

  val My_Reg_VERSION = busslave.newReg(doc="软件版本号")
  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
  VERSION := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_Encoder1 = busslave.newReg(doc="ENCODER VALUE")
  val Encoder1 = My_Reg_Encoder1.field(32 bits,RO,0,"ENCODER VALUE")
  Encoder1 := io.endcoder_value_in(0)

  val My_Reg_Encoder2 = busslave.newReg(doc="ENCODER VALUE")
  val Encoder2 = My_Reg_Encoder2.field(32 bits,RO,0,"ENCODER VALUE")
  Encoder2 := io.endcoder_value_in(1)

  val My_Reg_Encoder3 = busslave.newReg(doc="ENCODER VALUE")
  val Encoder3 = My_Reg_Encoder3.field(32 bits,RW,0,"ENCODER VALUE")
  io.endcoder_value_out(0) := Encoder3

  val My_Reg_Encoder4 = busslave.newReg(doc="ENCODER VALUE")
  val Encoder4 = My_Reg_Encoder4.field(32 bits,RW,0,"ENCODER VALUE")
  io.endcoder_value_out(1) := Encoder4

  val My_Reg_End = busslave.newReg(doc="帧尾")
  val End = My_Reg_End.field(32 bits,RO,0,"帧尾")
  End := 0x0000FFBD
}

case class PhpaRxSimpleBus() extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(32 bits))))
    val waddr = out UInt(8 bits)
    val wdata = out Bits(32 bits)
    val wenable = out Bool()
  }
  noIoPrefix()

  val waddr   = Reg(UInt(8 bits))
  val wdata   = Reg(Bits(32 bits))
  val wenable = Reg(Bool()) init False
  val flag    = Reg(Bool())
  val fsm =new StateMachine{
    val Get_Version: State = new State with EntryPoint {
      whenIsActive{
        when(io.input.valid){
          //waddr := io.input.payload.fragment(15 downto 8).asUInt.resized
          waddr := 5
          flag := False
          goto(Get_Data)
        }
      }
    }
    val Get_Data: State = new State{
      whenIsActive{
        when(io.input.valid && io.input.last){
          wenable := False
          goto(Get_Version)
        }elsewhen(io.input.valid){
          wenable := True
          wdata := io.input.payload.fragment
          when(!flag){
            flag := True
          }otherwise{
            waddr := waddr + 1
          }
        }otherwise{
          wenable := False
        }
      }
    }
  }
  io.waddr := (waddr<<2).resized
  io.wenable := wenable
  io.wdata := wdata
  io.input.ready := True
}

case class Phpa_Hssl(timerl_imit : Int) extends Component{
  val io = new Bundle{
    val output = master(Stream(Fragment(Bits(32 bits))))
    val input = slave(Stream(Fragment(Bits(32 bits))))
    val slaveid = in Bits(32 bits)
    val endcoder_value_in = in Vec(Bits(32 bits),2)
    val endcoder_value_out = out Vec(Bits(32 bits),2)
    val hssl_clk = in Bool()
    val hssl_reset = in Bool()
  }
  noIoPrefix()

  val hssl_area = new ClockingArea(ClockDomain(io.hssl_clk,io.hssl_reset)){
    val phpaRxPreamble = new SdacRxPreamble(32)
    phpaRxPreamble.io.addAttribute("keep","true")
    phpaRxPreamble.io.input << io.input
    phpaRxPreamble.io.slave_id := io.slaveid

    val phparxsimplebus = new PhpaRxSimpleBus()
    phparxsimplebus.io.addAttribute("keep","true")
    phparxsimplebus.io.input << phpaRxPreamble.io.output

    val phpatxsimplebus = new SdacTxSimpleBus(8, 32, timerl_imit: Int, 0, 8)
    phpatxsimplebus.io.addAttribute("keep","true")
    io.output << phpatxsimplebus.io.output
    phpatxsimplebus.io.timer_tick := True

    val phparegif = new Phpa_Reg()
    phparegif.io.addAttribute("keep","true")
    phparegif.io.simplebus.WADDR := phparxsimplebus.io.waddr
    phparegif.io.simplebus.WDATA := phparxsimplebus.io.wdata
    phparegif.io.simplebus.WENABLE := phparxsimplebus.io.wenable
    phparegif.io.simplebus.RADDR := phpatxsimplebus.io.RADDR
    phparegif.io.simplebus.RENABLE := phpatxsimplebus.io.RENABLE
    phpatxsimplebus.io.RDATA := phparegif.io.simplebus.RDATA
    phparegif.io.slaveid := io.slaveid
    phparegif.io.endcoder_value_in := io.endcoder_value_in
    io.endcoder_value_out := phparegif.io.endcoder_value_out
  }
}

case class Apb_Hssl(moduleName:String,baseaddr:Long) extends Component{
  val io = new Bundle{
    val apb  = slave(Apb3(HsslConfig.getApb3Config()))
    val hssl_clk = in Bool()
    val hssl_reset = in Bool()
    val output = master(Stream(Fragment(Bits(32 bits))))
    val input = slave(Stream(Fragment(Bits(32 bits))))
    val encoder_value = in Bits(32 bits)
  }
  noIoPrefix()

  val hssl_ctrl = new Phpa_Hssl(6250)
  hssl_ctrl.io.slaveid := 10
  hssl_ctrl.io.input <> io.input
  hssl_ctrl.io.output <> io.output
  hssl_ctrl.io.hssl_clk := io.hssl_clk
  hssl_ctrl.io.hssl_reset := io.hssl_reset

  val encoder_reg1 = Reg(Bits(32 bits)) init 0 addTag(crossClockDomain)
  hssl_ctrl.io.endcoder_value_in(0) := encoder_reg1
  hssl_ctrl.io.endcoder_value_in(1) := io.encoder_value

  val encoder_reg2 = Reg(Bits(32 bits)) init 0
  encoder_reg2 := io.encoder_value

  val encoder_reg3 = Reg(Bits(32 bits)) init 0  addTag(crossClockDomain)
  encoder_reg3 := hssl_ctrl.io.endcoder_value_out(0)

  val encoder_reg4 = Reg(Bits(32 bits)) init 0 addTag(crossClockDomain)
  encoder_reg4 := hssl_ctrl.io.endcoder_value_out(1)

  val ctrl = Apb3SlaveFactory(io.apb)
  ctrl.driveAndRead(encoder_reg1(31 downto 16), 0,bitOffset = 0,documentation = "encoder_reg1高16位(DSP内部增量光栅尺)")
  ctrl.driveAndRead(encoder_reg1(15 downto 0), 4,bitOffset = 0,documentation = "encoder_reg1低16位(DSP内部增量光栅尺)")

  ctrl.read(encoder_reg2(31 downto 16), 8,bitOffset = 0,documentation = "encoder_reg2高16位(FPGA内部增量光栅尺)")
  ctrl.read(encoder_reg2(15 downto 0), 12,bitOffset = 0,documentation = "encoder_reg2低16位(FPGA内部增量光栅尺)")

  ctrl.read(encoder_reg3(31 downto 16), 16,bitOffset = 0,documentation = "encoder_reg3高16位(外部DSP增量光栅尺)")
  ctrl.read(encoder_reg3(15 downto 0), 20,bitOffset = 0,documentation = "encoder_reg3低16位(外部DSP增量光栅尺)")

  ctrl.read(encoder_reg4(31 downto 16), 24,bitOffset = 0,documentation = "encoder_reg4高16位(外部FPGA增量光栅尺)")
  ctrl.read(encoder_reg4(15 downto 0), 28,bitOffset = 0,documentation = "encoder_reg4低16位(外部FPGA增量光栅尺)")

  ctrl.addDataModel(moduleName,baseaddr)
}

object Apb_Hssl extends App{
  SpinalVerilog(new Apb_Hssl("Apb_Hssl",0x000500))
}

object Phpa_Hssl{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Phpa_Hssl(500)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.output.ready #= true
      dut.io.endcoder_value_in(0) #= 0x00001234
      dut.io.endcoder_value_in(1) #= 0x00005678
      dut.io.slaveid #= 10
      dut.io.input.valid #= false
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(10)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00F1F2F3
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 10
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 20220613
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00009100
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00009111
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.last #= true
      dut.io.input.payload.fragment #= 0x0000FFBD
      dut.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.payload.last #= false
      dut.clockDomain.waitSampling(1000)
    }
  }
}

