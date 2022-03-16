package PHPA82

import PHPA82.regFileGen.{genRegFileByMarkdown, regInsert}
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb._

object Ad5544Config{

  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

object Ad5544_TrigerConfig{

  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

case class Ad5544Interface() extends Bundle with IMasterSlave{
  val AD5544_CS = Bool
  val AD5544_LDAC = Bool
  val AD5544_MSB  = Bool
  val AD5544_RS  = Bool
  val AD5544_SCLK  = Bool
  val AD5544_SDIN  = Bool

  override def asMaster(): Unit = {
    out(AD5544_CS,AD5544_LDAC,AD5544_MSB,AD5544_RS,AD5544_SCLK,AD5544_SDIN)
  }
}

class AD5544(moduleName:String,baseaddr:Long) extends Component {
  val io = new Bundle {
    val apb  = slave(Apb3(Ad5544Config.getApb3Config()))
    val ad5544Interface = master(Ad5544Interface())
    val clk = in Bool()
    val reset = in Bool()
    val ad5544_enable = in Bool()
  }
  noIoPrefix()

  val ad5544ClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset
  )

  val area = new ClockingArea(ad5544ClockDomain){
    val ad5544_ctrl = new dac_ad5544

    io.ad5544Interface.AD5544_CS <> ad5544_ctrl.io.AD5544_CS
    io.ad5544Interface.AD5544_RS <> ad5544_ctrl.io.AD5544_RS
    io.ad5544Interface.AD5544_MSB <> ad5544_ctrl.io.AD5544_MSB
    io.ad5544Interface.AD5544_LDAC <> ad5544_ctrl.io.AD5544_LDAC
    io.ad5544Interface.AD5544_SCLK <> ad5544_ctrl.io.AD5544_SCLK
    io.ad5544Interface.AD5544_SDIN <> ad5544_ctrl.io.AD5544_SDIN

    io.clk <> ad5544_ctrl.io.clk
    io.reset <> ad5544_ctrl.io.reset

    io.ad5544_enable <> ad5544_ctrl.io.ad5544_trig

    val ctrl = Apb3SlaveFactory(io.apb)
    ctrl.driveAndRead(ad5544_ctrl.io.AD5544_DATA_IN1, 0,bitOffset = 0,documentation = "ad5544---通道1输出数据")
    ctrl.driveAndRead(ad5544_ctrl.io.AD5544_DATA_IN2, 2,bitOffset = 0,documentation = "ad5544---通道2输出数据")
    ctrl.driveAndRead(ad5544_ctrl.io.AD5544_DATA_IN3, 4,bitOffset = 0,documentation = "ad5544---通道3输出数据")
    ctrl.driveAndRead(ad5544_ctrl.io.AD5544_DATA_IN4, 6,bitOffset = 0,documentation = "ad5544---通道4输出数据")
    //ctrl.driveAndRead(ad5544_ctrl.io.ad5544_trig, 8,bitOffset = 0,documentation = "ad5544---输出使能，上升沿有效")
    //ctrl.printDataModel()
    ctrl.addDataModel(moduleName,baseaddr)
  }
}

class AD5544_triger(moduleName:String,baseaddr:Long) extends Component {
  val io = new Bundle {
    val apb  = slave(Apb3(Ad5544_TrigerConfig.getApb3Config()))
    val ad5544_tri = out Bool()
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val ad5544_trigerClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset
  )

  val area = new ClockingArea(ad5544_trigerClockDomain){
    val temp = Reg(Bool()) init False

    val ctrl = Apb3SlaveFactory(io.apb)

    when(ctrl.isWriting(2)){
      temp := True
    }otherwise{
      temp := False
    }
    io.ad5544_tri := temp|Delay(temp,1)|Delay(temp,2)|Delay(temp,3)
    ctrl.read(temp,2,bitOffset = 0,documentation = "AD5544----使能")
    ctrl.addDataModel(moduleName,baseaddr)
  }
}

class dac_ad5544 extends BlackBox{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val AD5544_CS = out Bool()
    val AD5544_LDAC = out Bool()
    val AD5544_MSB = out Bool()
    val AD5544_RS = out Bool()
    val AD5544_SCLK = out Bool()
    val AD5544_SDIN = out Bool()
    val ad5544_trig = in Bool()
    val AD5544_DATA_IN1 = in UInt(16 bits)
    val AD5544_DATA_IN2 = in UInt(16 bits)
    val AD5544_DATA_IN3 = in UInt(16 bits)
    val AD5544_DATA_IN4 = in UInt(16 bits)
  }
  noIoPrefix()
  addRTLPath("D:/SCALA/SRIO/CYP1401/dac_ad5544.v")
}

/*
object AD5544 extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(new AD5544)
}*/


