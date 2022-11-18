package YW_PROJ

import SimpleBus.{SimpleBus, SimpleBusConfig, SpBusInterface}
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.HtmlGenerator
import spinal.lib.slave

import java.time.LocalDate

case class Yw_Regif(addrwidth : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,64)))
    val postion = out Bits(32 bits) setAsReg()
    val speed = out Bits(16 bits) setAsReg()
    val acc = out Bits(16 bits) setAsReg()
    val jerk = out Bits(16 bits) setAsReg()
    val kp = out Bits(16 bits) setAsReg()
    val ki = out Bits(16 bits) setAsReg()
    val kd = out Bits(16 bits) setAsReg()
    val endatPostion = in Bits(38 bits)
    val endatIndex = in Bool()
    val InPlace = in Bool()
    val ad_sample_data0 = in Bits(16 bits)
    val home = out Bool()
    val enable = out Bool()
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc="板卡识别号")
  val HEADER = My_Reg_HEADER.fieldAt(32,32 bits,RO,0x00F1F2F3,"板卡识别号")
  HEADER := B"x00F1F2F3"

  val My_Reg_Version = busslave.newReg(doc="软件版本号")
  val Version = My_Reg_Version.fieldAt(32,32 bits,RO,0,"软件版本号")
  Version := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_Postion = busslave.newReg(doc="上位机下发的位置值")
  val Postion = My_Reg_Postion.fieldAt(32,bc = 32 bits,RW,0,"上位机下发的位置值,nm,数字1代表1nm,n代表n*1nm")
  io.postion := Postion

  val My_Reg_Speed = busslave.newReg(doc="上位机下发的速度")
  val Speed = My_Reg_Speed.fieldAt(32,16 bits,RW,1,"上位机下发的速度值,um/s")
  io.speed := Speed

  val My_Reg_Kp = busslave.newReg(doc= "上位机下发的Kp")
  val Kp = My_Reg_Kp.fieldAt(32,bc = 16 bits,RW,500,"上位机下发的Kp")
  io.kp := Kp

  val My_Reg_Ki = busslave.newReg(doc= "上位机下发的Ki")
  val Ki = My_Reg_Ki.fieldAt(32,bc = 16 bits,RW,1000,"上位机下发的Ki")
  io.ki := Ki

  val My_Reg_Kd = busslave.newReg(doc= "上位机下发的Kd")
  val Kd = My_Reg_Kd.fieldAt(32,bc = 16 bits,RW,0,"上位机下发的Kd")
  io.kd := Kd

  val My_Reg_EndatPostion = busslave.newReg(doc= "Endat采集到的位置值")
  val EndatPostion_H = My_Reg_EndatPostion.fieldAt(0,bc = 6 bits,RO,0,"Endat采集到的位置值,数字1代表31.25pm,n代表n*31.25pm")
  val EndatPostion_L = My_Reg_EndatPostion.fieldAt(32,bc = 32 bits,RO,0,"Endat采集到的位置值,数字1代表31.25pm,n代表n*31.25pm")
  EndatPostion_H := io.endatPostion(37 downto 32)
  EndatPostion_L := io.endatPostion(31 downto 0)

  val My_Reg_EndatIndex = busslave.newReg(doc= "Endat采集到的Index信息")
  val EndatIndex = My_Reg_EndatIndex.fieldAt(32,bc = 1 bits,RO,0,"Endat采集到的Index信息")
  EndatIndex := io.endatIndex.asBits

  val My_Reg_InPlace = busslave.newReg(doc= "到位信息")
  val InPlace = My_Reg_InPlace.fieldAt(32,bc = 1 bits,RO,0,"到位信息")
  InPlace := io.InPlace.asBits

  val My_Reg_AdData = busslave.newReg(doc= "AD采集数据，通道1")
  val AdData = My_Reg_AdData.fieldAt(32,bc = 16 bits,RO,0,"AD采集数据，通道1,0v对应0,10v对应0x7fff,-10v对应0x8000,-0对应0xffff")
  AdData := io.ad_sample_data0

  val My_Reg_Home = busslave.newReg(doc="上位机下发的回零信号")
  val Home = My_Reg_Home.fieldAt(32,1 bits,RW,0,"上位机下发的回零信号")
  io.home := Home.asBool

  val My_Reg_Enable = busslave.newReg(doc="上位机下发的使能信号")
  val Enable = My_Reg_Enable.fieldAt(32,1 bits,RW,0,"上位机下发的使能信号")
  io.enable := Enable.asBool

  val My_Reg_Acc = busslave.newReg(doc="上位机下发的加速度")
  val Acc = My_Reg_Acc.fieldAt(32,16 bits,RW,10,"上位机下发的加速度值,um/(s*s)")
  io.acc := Acc

  val My_Reg_Jerk = busslave.newReg(doc="上位机下发的加加速度")
  val Jrek = My_Reg_Jerk.fieldAt(32,16 bits,RW,100,"上位机下发的加加速度值um/(s*s*s)")
  io.jerk := Jrek

  busslave.accept(HtmlGenerator("Yw_Regif", "Yw_Regif"))
}
