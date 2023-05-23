package PHPA82_FIBER

import MDCB_2.{MdcbRxPreamble, MdcbRxSimpleBus, MdcbTxSimpleBus}
import PHPA82.{Ad5544Interface, dac_ad5544}
import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.{Delay, Fragment, Stream, master, slave}

import java.time.LocalDate

case class PHPA_FIBER_Regif(addrwidth : Int, datawidth : Int, ad5544_num : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val AD5544_DATA = Seq.fill(ad5544_num)(out (Vec(Bits(16 bits),4)))
    val AD5544_TRIGER = Seq.fill(ad5544_num)(out Bool())
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newRegAt(address = 0x0100,doc="帧头")
  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
  HEADER := 0x00F1F2F3

  val My_Reg_Slaveid = busslave.newRegAt(address = 0x0104,doc="板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
  Slaveid := 0x01

  val My_Reg_VERSION = busslave.newRegAt(address = 0x0108,doc="软件版本号")
  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
  VERSION := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_AD5544_Datatemp12 = busslave.newRegAt(address = 0x010c,doc="AD5544(U73)DA数据输出")
  val AD5544_Datatemp1 = My_Reg_AD5544_Datatemp12.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道1输出,X1电机设定值-相A")
  io.AD5544_DATA(0)(0) := AD5544_Datatemp1
  val AD5544_Datatemp2 = My_Reg_AD5544_Datatemp12.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道2输出,X1电机设定值-相B")
  io.AD5544_DATA(0)(1) := AD5544_Datatemp2

  val My_Reg_AD5544_Datatemp34 = busslave.newReg(doc="AD5544(U73)DA数据输出")
  val AD5544_Datatemp3 = My_Reg_AD5544_Datatemp34.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道3输出,X2电机设定值-相A")
  io.AD5544_DATA(0)(2) := AD5544_Datatemp3
  val AD5544_Datatemp4 = My_Reg_AD5544_Datatemp34.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道4输出,X2电机设定值-相B")
  io.AD5544_DATA(0)(3) := AD5544_Datatemp4

  val AD5544_Triger1_Temp =  My_Reg_AD5544_Datatemp12.hitDoWrite | My_Reg_AD5544_Datatemp34.hitDoWrite
  io.AD5544_TRIGER(0) := (AD5544_Triger1_Temp|Delay(AD5544_Triger1_Temp,1)|Delay(AD5544_Triger1_Temp,2)|Delay(AD5544_Triger1_Temp,3))

  val My_Reg_AD5544_Datatemp56 = busslave.newReg(doc="AD5544(U83)DA数据输出")
  val AD5544_Datatemp5 = My_Reg_AD5544_Datatemp56.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道1输出,Y1电机设定值-相A")
  io.AD5544_DATA(1)(0) := AD5544_Datatemp5
  val AD5544_Datatemp6 = My_Reg_AD5544_Datatemp56.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道2输出,Y1电机设定值-相B")
  io.AD5544_DATA(1)(1) := AD5544_Datatemp6

  val My_Reg_AD5544_Datatemp78 = busslave.newReg(doc="AD5544(U83)DA数据输出")
  val AD5544_Datatemp7 = My_Reg_AD5544_Datatemp78.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道3输出,Y2电机设定值-相A")
  io.AD5544_DATA(1)(2) := AD5544_Datatemp7
  val AD5544_Datatemp8 = My_Reg_AD5544_Datatemp78.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道4输出,Y2电机设定值-相B")
  io.AD5544_DATA(1)(3) := AD5544_Datatemp8

  val AD5544_Triger2_Temp =  My_Reg_AD5544_Datatemp56.hitDoWrite | My_Reg_AD5544_Datatemp78.hitDoWrite
  io.AD5544_TRIGER(1) := (AD5544_Triger2_Temp|Delay(AD5544_Triger2_Temp,1)|Delay(AD5544_Triger2_Temp,2)|Delay(AD5544_Triger2_Temp,3))

  val My_Reg_AD5544_Datatemp910 = busslave.newReg(doc="AD5544(U93)DA数据输出")
  val AD5544_Datatemp9 = My_Reg_AD5544_Datatemp910.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U93)DA数据通道1输出,EPIN-Z电机设定值-相A")
  io.AD5544_DATA(2)(0) := AD5544_Datatemp9
  val AD5544_Datatemp10 = My_Reg_AD5544_Datatemp910.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U93)DA数据通道2输出,EPIN-RZ电机设定值-相A")
  io.AD5544_DATA(2)(1) := AD5544_Datatemp10

  val My_Reg_AD5544_Datatemp1112 = busslave.newReg(doc="AD5544(U93)DA数据输出")
  val AD5544_Datatemp11 = My_Reg_AD5544_Datatemp1112.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U93)DA数据通道3输出,预留")
  io.AD5544_DATA(2)(2) := AD5544_Datatemp11
  val AD5544_Datatemp12 = My_Reg_AD5544_Datatemp1112.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U93)DA数据通道4输出,预留")
  io.AD5544_DATA(2)(3) := AD5544_Datatemp12
  val AD5544_Triger3_Temp =  My_Reg_AD5544_Datatemp910.hitDoWrite | My_Reg_AD5544_Datatemp1112.hitDoWrite
  io.AD5544_TRIGER(2) := (AD5544_Triger3_Temp|Delay(AD5544_Triger3_Temp,1)|Delay(AD5544_Triger3_Temp,2)|Delay(AD5544_Triger3_Temp,3))
}



case class PHPA_FIBER(ad5544_num : Int,addrwidth : Int, datawidth : Int) extends Component{
  val io = new Bundle{
    val axiw = master(Stream(Fragment(Bits(32 bits))))
    val axir = slave (Stream(Fragment(Bits(32 bits))))
    val AD5544 = Seq.fill(ad5544_num)(master(Ad5544Interface()))
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val RxPreamble = new MdcbRxPreamble(datawidth)
    RxPreamble.io.input << io.axir
    RxPreamble.io.slave_id := 0x01

    val Rxsimplebus = new MdcbRxSimpleBus(addrwidth,datawidth)
    Rxsimplebus.io.input << RxPreamble.io.output

    val Txsimplebus = new MdcbTxSimpleBus(addrwidth : Int, datawidth : Int, 6250, 0x100, 20)
    io.axiw << Txsimplebus.io.output
    Txsimplebus.io.timer_tick := True

    val Regif = new PHPA_FIBER_Regif(addrwidth,datawidth,ad5544_num)
    Regif.io.simplebus.WADDR := Rxsimplebus.io.waddr
    Regif.io.simplebus.WDATA := Rxsimplebus.io.wdata
    Regif.io.simplebus.WENABLE := Rxsimplebus.io.wenable
    Regif.io.simplebus.RADDR := Txsimplebus.io.RADDR
    Regif.io.simplebus.RENABLE := Txsimplebus.io.RENABLE
    Txsimplebus.io.RDATA := Regif.io.simplebus.RDATA

    val ad5544 = Seq.fill(ad5544_num)(new dac_ad5544)
    for(i <- 0 until ad5544_num){
      ad5544(i).io.clk := io.clk
      ad5544(i).io.reset := io.reset
      io.AD5544(i).AD5544_SCLK := ad5544(i).io.AD5544_SCLK
      io.AD5544(i).AD5544_CS := ad5544(i).io.AD5544_CS
      io.AD5544(i).AD5544_LDAC := ad5544(i).io.AD5544_LDAC
      io.AD5544(i).AD5544_RS := ad5544(i).io.AD5544_RS
      io.AD5544(i).AD5544_SDIN := ad5544(i).io.AD5544_SDIN
      io.AD5544(i).AD5544_MSB := ad5544(i).io.AD5544_MSB
      ad5544(i).io.AD5544_DATA_IN1 := Regif.io.AD5544_DATA(i)(0).asUInt
      ad5544(i).io.AD5544_DATA_IN2 := Regif.io.AD5544_DATA(i)(1).asUInt
      ad5544(i).io.AD5544_DATA_IN3 := Regif.io.AD5544_DATA(i)(2).asUInt
      ad5544(i).io.AD5544_DATA_IN4 := Regif.io.AD5544_DATA(i)(3).asUInt
      ad5544(i).io.ad5544_trig := Regif.io.AD5544_TRIGER(i)
    }
  }
}

object PHPA_FIBER extends App{
  SpinalConfig(headerWithDate = true,targetDirectory = "E:/PHPA82/PHPA_E200/PHPA_TOP.srcs/sources_1/imports/PHPA82").generateVerilog(new PHPA_FIBER(3,12,32))
}