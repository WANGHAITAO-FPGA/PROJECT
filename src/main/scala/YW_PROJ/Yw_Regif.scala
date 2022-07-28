package YW_PROJ

import SimpleBus.{SimpleBus, SimpleBusConfig, SpBusInterface}
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.slave

import java.time.LocalDate

case class Yw_Regif(addrwidth : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,64)))
    val postion = out Bits(64 bits) setAsReg()
    val endatPostion = in Bits(38 bits)
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(64 bits,RO,0,"帧头")
  HEADER := B"x0000000000F1F2F3"

  val My_Reg_Slaveid = busslave.newReg(doc="Slaveid")
  val Slaveid = My_Reg_Slaveid.field(64 bits,RO,0,"Slaveid")
  Slaveid := B"x000000000000000F"

  val My_Reg_Version = busslave.newReg(doc="软件版本号")
  val Version = My_Reg_Version.field(64 bits,RO,0,"软件版本号")
  Version := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_Postion = busslave.newReg(doc="上位机下发的位置值")
  val Postion = My_Reg_Postion.field(64 bits,RW,0,"上位机下发的位置值")
  io.postion := Postion

  val My_Reg_EndatPostion = busslave.newReg(doc= "Endat采集到的位置值")
  val EndatPostion = My_Reg_EndatPostion.fieldAt(0,bc = 38 bits,RO,0,"Endat采集到的位置值")
  EndatPostion := io.endatPostion
}
