package YW_PROJ

import PHPA82.regFileGen.regInsert
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.slave

object ApbRegConfig{
  def getApb3Config() = Apb3Config(addressWidth = 8,dataWidth = 16)
}

case class Apb_Reg(moduleName:String,baseaddr:Long) extends Component{
  val io = new Bundle{
    val apb  = slave(Apb3(ApbRegConfig.getApb3Config()))
    val srio_status = in Bits(16 bits)
    val srio_postion = in Bits(32 bits)
    val srio_speed = in Bits(16 bits)
    val srio_acc = in Bits(16 bits)
    val srio_jerk = in Bits(16 bits)
    val kp = in Bits(16 bits)
    val ki = in Bits(16 bits)
    val kd = in Bits(16 bits)
    val inplace = out Bool()
    val srio_home = in Bool()
    val srio_enable = in Bool()
  }
  noIoPrefix()

  val ctrl = Apb3SlaveFactory(io.apb)

  val srio_postion = Reg(Bits(32 bits)) init 0
  val srio_speed = Reg(Bits(16 bits)) init 0
  val srio_acc = Reg(Bits(16 bits)) init 0
  val srio_jerk = Reg(Bits(16 bits)) init 0
  val kp = Reg(Bits(16 bits)) init 0
  val ki = Reg(Bits(16 bits)) init 0
  val kd = Reg(Bits(16 bits)) init 0
  val inplace = Reg(Bits(16 bits)) init 0
  val srio_home = Reg(Bits(16 bits)) init 0
  val srio_enable = Reg(Bits(16 bits)) init 0

  when(!(ctrl.isReading(4)|ctrl.isReading(8))){
    srio_postion := io.srio_postion
  }
  when(!(ctrl.isReading(12))){
    srio_home := io.srio_home.asBits.resized
  }

  when(!(ctrl.isReading(16))){
    srio_enable := io.srio_enable.asBits.resized
  }

  when(!(ctrl.isReading(20))){
    kp := io.kp
  }
  when(!(ctrl.isReading(24))){
    ki := io.ki
  }
  when(!(ctrl.isReading(28))){
    kd := io.kd
  }

  when(!(ctrl.isReading(32))){
    srio_speed := io.srio_speed
  }

  when(!(ctrl.isReading(36))){
    srio_acc := io.srio_acc
  }

  when(!(ctrl.isReading(40))){
    srio_jerk := io.srio_jerk
  }

  ctrl.read(io.srio_status, 0,documentation = "srio status,bit 0 port_initialized, bit 1 link_initialized")

  ctrl.read(srio_postion(31 downto 16), 4,documentation = "上位机下发的位置值，Bit31 to Bit16")

  ctrl.read(srio_postion(15 downto 0), 8,documentation = "上位机下发的位置值，Bit15 to Bit0")

  ctrl.read(srio_home, 12,documentation = "上位机下发的回零信号")

  ctrl.read(srio_enable, 16,documentation = "上位机下发的使能信号")

  ctrl.read(kp, 20,documentation = "上位机下发的KP")

  ctrl.read(ki, 24,documentation = "上位机下发的Ki")

  ctrl.read(kd, 28,documentation = "上位机下发的Kd")

  ctrl.read(srio_speed, 32,documentation = "上位机下发的最大速度值")

  ctrl.read(srio_acc, 36,documentation = "上位机下发的最大加速度值")

  ctrl.read(srio_jerk, 40,documentation = "上位机下发的最大加加速度值")

  ctrl.driveAndRead(inplace,44,0,"驱动器发出的到位信息")
  io.inplace := inplace(0 downto 0).asBool

  ctrl.addDataModel(moduleName,baseaddr)
}