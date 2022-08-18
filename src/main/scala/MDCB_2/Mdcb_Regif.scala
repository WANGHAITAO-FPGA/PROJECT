package MDCB_2

import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.HtmlGenerator
import spinal.lib.{Delay, slave}

import java.time.LocalDate

case class Mdcb_Regif(addrwidth : Int, datawidth : Int, ad5544_num : Int, ad7606_num : Int, bissc_num : Int, endcoder_num : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val slaveid = in Bits(datawidth bits)
    val M_Fault_TTL_Filter = in Bits(8 bits)
    val FPGA_DI_Filter = in Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out Bits(16 bits)
    val AD5544_DATA = Seq.fill(ad5544_num)(out (Vec(Bits(16 bits),4)))
    val AD5544_TRIGER = Seq.fill(ad5544_num)(out Bool())
    val AD7606_DATA = Seq.fill(ad7606_num)(in (Vec(Bits(16 bits),8)))
    val BissC_Pos = Seq.fill(bissc_num)(in Bits(32 bits))
    val Encoder_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
    val Encoder_Zero_Keep = Seq.fill(endcoder_num)(in Bits(1 bits))
    val Encoder_Clr = Seq.fill(endcoder_num)(out Bits(1 bits))
    val Encoder_lock_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
  }
  noIoPrefix()

  /********************************E200_I_MDCB光纤寄存器总表************************************************/
  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  /********************************E200_I_MDCB光纤发送寄存器总表************************************************/
  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
  HEADER := 0x00F1F2F3

  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
  Slaveid := io.slaveid

  val My_Reg_VERSION = busslave.newReg(doc="软件版本号")
  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
  VERSION := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_BissC1_Pos = busslave.newReg(doc="BissC1绝对式光栅尺位置信号")
  val BissC1_Pos = My_Reg_BissC1_Pos.field(32 bits,RO,0,"X1光栅尺,BissC1绝对式光栅尺位置信号(预留)")
  BissC1_Pos := io.BissC_Pos(0)

  val My_Reg_BissC2_Pos = busslave.newReg(doc="BissC2绝对式光栅尺位置信号")
  val BissC2_Pos = My_Reg_BissC2_Pos.field(32 bits,RO,0,"X2光栅尺,BissC2绝对式光栅尺位置信号(预留)")
  BissC2_Pos := io.BissC_Pos(1)

  val My_Reg_BissC3_Pos = busslave.newReg(doc="BissC3绝对式光栅尺位置信号")
  val BissC3_Pos = My_Reg_BissC3_Pos.field(32 bits,RO,0,"Y1光栅尺,BissC3绝对式光栅尺位置信号(预留)")
  BissC3_Pos := io.BissC_Pos(2)

  val My_Reg_BissC4_Pos = busslave.newReg(doc="BissC4绝对式光栅尺位置信号")
  val BissC4_Pos = My_Reg_BissC4_Pos.field(32 bits,RO,0,"Y2光栅尺,BissC4绝对式光栅尺位置信号(预留)")
  BissC4_Pos := io.BissC_Pos(3)

  val My_Reg_Reserve1 = busslave.newReg(doc="Reserve")
  val Reserve1 = My_Reg_Reserve1.field(32 bits,RW,0x01,"Reserve")
  val My_Reg_Reserve2 = busslave.newReg(doc="Reserve")
  val Reserve2 = My_Reg_Reserve2.field(32 bits,RW,0x02,"Reserve")
  val My_Reg_Reserve3 = busslave.newReg(doc="Reserve")
  val Reserve3 = My_Reg_Reserve3.field(32 bits,RW,0x03,"Reserve")
  val My_Reg_Reserve4 = busslave.newReg(doc="Reserve")
  val Reserve4 = My_Reg_Reserve4.field(32 bits,RW,0x04,"Reserve")

  val My_Reg_TTL_Single = busslave.newReg(doc="8路外部输入TTL信号，数字输入寄存器")
  val TTL1_Single = My_Reg_TTL_Single.fieldAt(1,bc = 1 bits,RO,0,"外部TTL1输入信号，M_Fault_TTL1，X1电机状态")
  TTL1_Single := io.M_Fault_TTL_Filter(0).asBits
  val TTL2_Single = My_Reg_TTL_Single.fieldAt(2,bc = 1 bits,RO,0,"外部TTL2输入信号，M_Fault_TTL2，X2电机状态")
  TTL2_Single := io.M_Fault_TTL_Filter(1).asBits
  val TTL3_Single = My_Reg_TTL_Single.fieldAt(3,bc = 1 bits,RO,0,"外部TTL3输入信号，M_Fault_TTL3，Y1电机状态")
  TTL3_Single := io.M_Fault_TTL_Filter(2).asBits
  val TTL4_Single = My_Reg_TTL_Single.fieldAt(4,bc = 1 bits,RO,0,"外部TTL4输入信号，M_Fault_TTL4，Y2电机状态")
  TTL4_Single := io.M_Fault_TTL_Filter(3).asBits
  val TTL5_Single = My_Reg_TTL_Single.fieldAt(5,bc = 1 bits,RO,0,"外部TTL5输入信号，M_Fault_TTL5，预留")
  TTL5_Single := io.M_Fault_TTL_Filter(4).asBits
  val TTL6_Single = My_Reg_TTL_Single.fieldAt(6,bc = 1 bits,RO,0,"外部TTL6输入信号，M_Fault_TTL6，预留")
  TTL6_Single := io.M_Fault_TTL_Filter(5).asBits
  val TTL7_Single = My_Reg_TTL_Single.fieldAt(7,bc = 1 bits,RO,0,"外部TTL7输入信号，M_Fault_TTL7，预留")
  TTL7_Single := io.M_Fault_TTL_Filter(6).asBits
  val TTL8_Single = My_Reg_TTL_Single.fieldAt(8,bc = 1 bits,RO,0,"外部TTL8输入信号，M_Fault_TTL8，预留")
  TTL8_Single := io.M_Fault_TTL_Filter(7).asBits

  val My_Reg_Opt_Single = busslave.newReg(doc="16路外部输入光耦信号），VSO输入寄存器")
  val Opt1_Single = My_Reg_Opt_Single.fieldAt(1,bc = 1 bits,RO,0,"外部光耦1输入信号，FPGA_DI1，(X1 Home,预留)")
  Opt1_Single := io.FPGA_DI_Filter(0).asBits
  val Opt2_Single = My_Reg_Opt_Single.fieldAt(2,bc = 1 bits,RO,0,"外部光耦2输入信号，FPGA_DI2，（X2 Home，预留）")
  Opt2_Single := io.FPGA_DI_Filter(1).asBits
  val Opt3_Single = My_Reg_Opt_Single.fieldAt(3,bc = 1 bits,RO,0,"外部光耦3输入信号，FPGA_DI3,（Y1 Home，预留）")
  Opt3_Single := io.FPGA_DI_Filter(2).asBits
  val Opt4_Single = My_Reg_Opt_Single.fieldAt(4,bc = 1 bits,RO,0,"外部光耦4输入信号，FPGA_DI4,（Y2 Home，预留）")
  Opt4_Single := io.FPGA_DI_Filter(3).asBits
  val Opt5_Single = My_Reg_Opt_Single.fieldAt(5,bc = 1 bits,RO,0,"外部光耦5输入信号，FPGA_DI5,（X1限位+，预留）")
  Opt5_Single := io.FPGA_DI_Filter(4).asBits
  val Opt6_Single = My_Reg_Opt_Single.fieldAt(6,bc = 1 bits,RO,0,"外部光耦6输入信号，FPGA_DI6,（X1限位-，预留）")
  Opt6_Single := io.FPGA_DI_Filter(5).asBits
  val Opt7_Single = My_Reg_Opt_Single.fieldAt(7,bc = 1 bits,RO,0,"外部光耦7输入信号，FPGA_DI7,（X2限位+，预留）")
  Opt7_Single := io.FPGA_DI_Filter(6).asBits
  val Opt8_Single = My_Reg_Opt_Single.fieldAt(8,bc = 1 bits,RO,0,"外部光耦8输入信号，FPGA_DI8,（X2限位-，预留）")
  Opt8_Single := io.FPGA_DI_Filter(7).asBits
  val Opt9_Single = My_Reg_Opt_Single.fieldAt(9,bc = 1 bits,RO,0,"外部光耦9输入信号，FPGA_DI9,（Y1限位+，预留）")
  Opt9_Single := io.FPGA_DI_Filter(8).asBits
  val Opt10_Single = My_Reg_Opt_Single.fieldAt(10,bc = 1 bits,RO,0,"外部光耦10输入信号，FPGA_DI10,（Y1限位-，预留）")
  Opt10_Single := io.FPGA_DI_Filter(9).asBits
  val Opt11_Single = My_Reg_Opt_Single.fieldAt(11,bc = 1 bits,RO,0,"外部光耦11输入信号，FPGA_DI11,（Y2限位+，预留）")
  Opt11_Single := io.FPGA_DI_Filter(10).asBits
  val Opt12_Single = My_Reg_Opt_Single.fieldAt(12,bc = 1 bits,RO,0,"外部光耦12输入信号，FPGA_DI12,（Y2限位-，预留）")
  Opt12_Single := io.FPGA_DI_Filter(11).asBits
  val Opt13_Single = My_Reg_Opt_Single.fieldAt(13,bc = 1 bits,RO,0,"外部光耦13输入信号，FPGA_DI13，预留")
  Opt13_Single := io.FPGA_DI_Filter(12).asBits
  val Opt14_Single = My_Reg_Opt_Single.fieldAt(14,bc = 1 bits,RO,0,"外部光耦14输入信号，FPGA_DI14，预留")
  Opt14_Single := io.FPGA_DI_Filter(13).asBits
  val Opt15_Single = My_Reg_Opt_Single.fieldAt(15,bc = 1 bits,RO,0,"外部光耦15输入信号，FPGA_DI15，预留")
  Opt15_Single := io.FPGA_DI_Filter(14).asBits
  val Opt16_Single = My_Reg_Opt_Single.fieldAt(16,bc = 1 bits,RO,0,"外部光耦16输入信号，FPGA_DI16，预留")
  Opt16_Single := io.FPGA_DI_Filter(15).asBits

  val My_Reg_Encoder_ZeroSingle = busslave.newReg(doc="4路增量式光栅尺零位信号,预留")
  val Encoder1_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(0,bc = 1 bits,RO,0,"Encoder1零位信号，LE_R_I1，预留")
  Encoder1_ZeroSingle := io.Encoder_Zero_Keep(0)
  val Encoder2_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(8,bc = 1 bits,RO,0,"Encoder2零位信号，LE_R_I2，预留")
  Encoder2_ZeroSingle := io.Encoder_Zero_Keep(1)
  val Encoder3_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(16,bc = 1 bits,RO,0,"Encoder3零位信号，LE_R_I3，预留")
  Encoder3_ZeroSingle := io.Encoder_Zero_Keep(2)
  val Encoder4_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(24,bc = 1 bits,RO,0,"Encoder4零位信号，LE_R_I4，预留")
  Encoder4_ZeroSingle := io.Encoder_Zero_Keep(3)

  val My_Reg_Encoder1_Pos = busslave.newReg(doc="Encoder1增量式光栅尺位置信号,预留")
  val Encoder1_Pos = My_Reg_Encoder1_Pos.field(32 bits,RO,0,"Encoder1增量式光栅尺位置信号，预留")
  Encoder1_Pos := io.Encoder_Pos(0)

  val My_Reg_Encoder2_Pos = busslave.newReg(doc="Encoder2增量式光栅尺位置信号,预留")
  val Encoder2_Pos = My_Reg_Encoder2_Pos.field(32 bits,RO,0,"Encoder2增量式光栅尺位置信号，预留")
  Encoder2_Pos := io.Encoder_Pos(1)

  val My_Reg_Encoder3_Pos = busslave.newReg(doc="Encoder3增量式光栅尺位置信号,预留")
  val Encoder3_Pos = My_Reg_Encoder3_Pos.field(32 bits,RO,0,"Encoder3增量式光栅尺位置信号，预留")
  Encoder3_Pos := io.Encoder_Pos(2)

  val My_Reg_Encoder4_Pos = busslave.newReg(doc="Encoder4增量式光栅尺位置信号,预留")
  val Encoder4_Pos = My_Reg_Encoder4_Pos.field(32 bits,RO,0,"Encoder4增量式光栅尺位置信号，预留")
  Encoder4_Pos := io.Encoder_Pos(3)

  val My_Reg_Encoder1_Lock_Pos = busslave.newReg(doc="Encoder1增量式光栅尺触发INDEX位时的位置值,预留")
  val Encoder1_Lock_Pos = My_Reg_Encoder1_Lock_Pos.field(32 bits,RO,0,"Encoder1增量式光栅尺触发INDEX位时的位置值，预留")
  Encoder1_Lock_Pos := io.Encoder_lock_Pos(0)

  val My_Reg_Encoder2_Lock_Pos = busslave.newReg(doc="Encoder2增量式光栅尺触发INDEX位时的位置值,预留")
  val Encoder2_Lock_Pos = My_Reg_Encoder2_Lock_Pos.field(32 bits,RO,0,"Encoder2增量式光栅尺触发INDEX位时的位置值，预留")
  Encoder2_Lock_Pos := io.Encoder_lock_Pos(1)

  val My_Reg_Encoder3_Lock_Pos = busslave.newReg(doc="Encoder3增量式光栅尺触发INDEX位时的位置值,预留")
  val Encoder3_Lock_Pos = My_Reg_Encoder3_Lock_Pos.field(32 bits,RO,0,"Encoder3增量式光栅尺触发INDEX位时的位置值，预留")
  Encoder3_Lock_Pos := io.Encoder_lock_Pos(2)

  val My_Reg_Encoder4_Lock_Pos = busslave.newReg(doc="Encoder4增量式光栅尺触发INDEX位时的位置值,预留")
  val Encoder4_Lock_Pos = My_Reg_Encoder4_Lock_Pos.field(32 bits,RO,0,"Encoder4增量式光栅尺触发INDEX位时的位置值，预留")
  Encoder4_Lock_Pos := io.Encoder_lock_Pos(3)

  val My_Reg_AD7606_Datatemp12 = busslave.newReg(doc="AD7606数据输入（U6），预留")
  val AD7606_Datatemp1 = My_Reg_AD7606_Datatemp12.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道1输入，预留")
  AD7606_Datatemp1 := io.AD7606_DATA(0)(0)
  val AD7606_Datatemp2 = My_Reg_AD7606_Datatemp12.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道2输入，预留")
  AD7606_Datatemp2 := io.AD7606_DATA(0)(1)

  val My_Reg_AD7606_Datatemp34 = busslave.newReg(doc="AD7606数据输入（U6），预留")
  val AD7606_Datatemp3 = My_Reg_AD7606_Datatemp34.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道3输入，预留")
  AD7606_Datatemp3 := io.AD7606_DATA(0)(2)
  val AD7606_Datatemp4 = My_Reg_AD7606_Datatemp34.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入，预留")
  AD7606_Datatemp4 := io.AD7606_DATA(0)(3)

  val My_Reg_AD7606_Datatemp56 = busslave.newReg(doc="AD7606数据输入（U6），预留")
  val AD7606_Datatemp5 = My_Reg_AD7606_Datatemp56.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道5输入，预留")
  AD7606_Datatemp5 := io.AD7606_DATA(0)(4)
  val AD7606_Datatemp6 = My_Reg_AD7606_Datatemp56.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道6输入，预留")
  AD7606_Datatemp6 := io.AD7606_DATA(0)(5)

  val My_Reg_AD7606_Datatemp78 = busslave.newReg(doc="AD7606数据输入（U6），预留")
  val AD7606_Datatemp7 = My_Reg_AD7606_Datatemp78.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道7输入，预留")
  AD7606_Datatemp7 := io.AD7606_DATA(0)(6)
  val AD7606_Datatemp8 = My_Reg_AD7606_Datatemp78.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道8输入，预留")
  AD7606_Datatemp8 := io.AD7606_DATA(0)(7)

  val My_Reg_AD7606_Datatemp910 = busslave.newReg(doc="AD7606数据输入（U7），预留")
  val AD7606_Datatemp9 = My_Reg_AD7606_Datatemp910.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入，预留")
  AD7606_Datatemp9 := io.AD7606_DATA(1)(0)
  val AD7606_Datatemp10 = My_Reg_AD7606_Datatemp910.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道2输入，预留")
  AD7606_Datatemp10 := io.AD7606_DATA(1)(1)

  val My_Reg_AD7606_Datatemp1112 = busslave.newReg(doc="AD7606数据输入（U7），预留")
  val AD7606_Datatemp11 = My_Reg_AD7606_Datatemp1112.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道3输入，预留")
  AD7606_Datatemp11 := io.AD7606_DATA(1)(2)
  val AD7606_Datatemp12 = My_Reg_AD7606_Datatemp1112.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道4输入，预留")
  AD7606_Datatemp12 := io.AD7606_DATA(1)(3)

  val My_Reg_AD7606_Datatemp1314 = busslave.newReg(doc="AD7606数据输入（U7），预留")
  val AD7606_Datatemp13 = My_Reg_AD7606_Datatemp1314.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道5输入，预留")
  AD7606_Datatemp13 := io.AD7606_DATA(1)(4)
  val AD7606_Datatemp14 = My_Reg_AD7606_Datatemp1314.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道6输入，预留")
  AD7606_Datatemp14 := io.AD7606_DATA(1)(5)

  val My_Reg_AD7606_Datatemp1516 = busslave.newReg(doc="AD7606数据输入（U7），预留")
  val AD7606_Datatemp15 = My_Reg_AD7606_Datatemp1516.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道7输入，预留")
  AD7606_Datatemp15 := io.AD7606_DATA(1)(6)
  val AD7606_Datatemp16 = My_Reg_AD7606_Datatemp1516.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道8输入，预留")
  AD7606_Datatemp16 := io.AD7606_DATA(1)(7)


  /********************************E200_I_MDCB光纤接受寄存器总表************************************************/
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

  val My_Reg_M_EN_TTL = busslave.newReg(doc="4路外部输出TTL信号，电机控制PA寄存器")
  val M_EN_TTL1 = My_Reg_M_EN_TTL.fieldAt(2,bc = 1 bits,RW,0,"外部TTL1输出信号，M_EN_TTL1，X1电机使能")
  io.M_EN_TTL(0) := M_EN_TTL1.asBool
  val M_EN_TTL2 = My_Reg_M_EN_TTL.fieldAt(10,bc = 1 bits,RW,0,"外部TTL2输出信号，M_EN_TTL2，X2电机使能")
  io.M_EN_TTL(1) := M_EN_TTL2.asBool
  val M_EN_TTL3 = My_Reg_M_EN_TTL.fieldAt(18,bc = 1 bits,RW,0,"外部TTL3输出信号，M_EN_TTL3，Y1电机使能")
  io.M_EN_TTL(2) := M_EN_TTL3.asBool
  val M_EN_TTL4 = My_Reg_M_EN_TTL.fieldAt(26,bc = 1 bits,RW,0,"外部TTL4输出信号，M_EN_TTL4，Y2电机使能")
  io.M_EN_TTL(3) := M_EN_TTL4.asBool

  val My_Reg_M_EN_TTL1 = busslave.newReg(doc="4路外部输出TTL信号，电机控制PA寄存器")
  val M_EN_TTL5 = My_Reg_M_EN_TTL1.fieldAt(2,bc = 1 bits,RW,0,"外部TTL5输出信号，M_EN_TTL5，EPZ电机使能")
  io.M_EN_TTL(4) := M_EN_TTL5.asBool
  val M_EN_TTL6 = My_Reg_M_EN_TTL1.fieldAt(10,bc = 1 bits,RW,0,"外部TTL6输出信号，M_EN_TTL6，EPRZ电机使能")
  io.M_EN_TTL(5) := M_EN_TTL6.asBool
  val M_EN_TTL7 = My_Reg_M_EN_TTL1.fieldAt(18,bc = 1 bits,RW,0,"外部TTL7输出信号，M_EN_TTL7，预留")
  io.M_EN_TTL(6) := M_EN_TTL7.asBool
  val M_EN_TTL8 = My_Reg_M_EN_TTL1.fieldAt(26,bc = 1 bits,RW,0,"外部TTL8输出信号，M_EN_TTL8，预留")
  io.M_EN_TTL(7) := M_EN_TTL8.asBool

  val My_Reg_Emergency = busslave.newReg(doc="Emergency屏蔽寄存器")
  val Emergency = My_Reg_Emergency.fieldAt(0,32 bits,RW,0,"Emergency屏蔽寄存器")

  val My_Reg_Project_ID = busslave.newReg(doc="Project_ID配置寄存器")
  val Project_ID = My_Reg_Project_ID.fieldAt(0,32 bits,RW,0,"Project_ID配置寄存器")

  val My_Reg_Config_Encoder = busslave.newReg(doc="配置光栅尺")
  val Config_Encoder = My_Reg_Config_Encoder.fieldAt(0,32 bits,RW,0,"配置光栅尺")

  val My_Reg_Valve =  busslave.newReg(doc="阀门")
  val Valve = My_Reg_Valve.fieldAt(0,32 bits,RW,0,"阀门")

  val My_Reg_FPGA_DO = busslave.newReg(doc="16路外部输出光耦信号），FPGA_DO(FPGA_B33_IO_OUT)，预留")
  val FPGA_DO_0 = My_Reg_FPGA_DO.fieldAt(0,bc = 1 bits,RW,0,"外部光耦1输入信号，FPGA_DO1，预留")
  io.FPGA_DO(0) := FPGA_DO_0.asBool
  val FPGA_DO_1 = My_Reg_FPGA_DO.fieldAt(2,bc = 1 bits,RW,0,"外部光耦2输入信号，FPGA_DO2，预留")
  io.FPGA_DO(1) := FPGA_DO_1.asBool
  val FPGA_DO_2 = My_Reg_FPGA_DO.fieldAt(4,bc = 1 bits,RW,0,"外部光耦3输入信号，FPGA_DO3，预留")
  io.FPGA_DO(2) := FPGA_DO_2.asBool
  val FPGA_DO_3 = My_Reg_FPGA_DO.fieldAt(6,bc = 1 bits,RW,0,"外部光耦4输入信号，FPGA_DO4，预留")
  io.FPGA_DO(3) := FPGA_DO_3.asBool
  val FPGA_DO_4 = My_Reg_FPGA_DO.fieldAt(8,bc = 1 bits,RW,0,"外部光耦5输入信号，FPGA_DO5，预留")
  io.FPGA_DO(4) := FPGA_DO_4.asBool
  val FPGA_DO_5 = My_Reg_FPGA_DO.fieldAt(10,bc = 1 bits,RW,0,"外部光耦6输入信号，FPGA_DO6，预留")
  io.FPGA_DO(5) := FPGA_DO_5.asBool
  val FPGA_DO_6 = My_Reg_FPGA_DO.fieldAt(12,bc = 1 bits,RW,0,"外部光耦7输入信号，FPGA_DO7，预留")
  io.FPGA_DO(6) := FPGA_DO_6.asBool
  val FPGA_DO_7 = My_Reg_FPGA_DO.fieldAt(14,bc = 1 bits,RW,0,"外部光耦8输入信号，FPGA_DO8，预留")
  io.FPGA_DO(7) := FPGA_DO_7.asBool
  val FPGA_DO_8 = My_Reg_FPGA_DO.fieldAt(16,bc = 1 bits,RW,0,"外部光耦9输入信号，FPGA_DO9，预留")
  io.FPGA_DO(8) := FPGA_DO_8.asBool
  val FPGA_DO_9 = My_Reg_FPGA_DO.fieldAt(18,bc = 1 bits,RW,0,"外部光耦10输入信号，FPGA_DO10，预留")
  io.FPGA_DO(9) := FPGA_DO_9.asBool
  val FPGA_DO_10 = My_Reg_FPGA_DO.fieldAt(20,bc = 1 bits,RW,0,"外部光耦11输入信号，FPGA_DO11，预留")
  io.FPGA_DO(10) := FPGA_DO_10.asBool
  val FPGA_DO_11 = My_Reg_FPGA_DO.fieldAt(22,bc = 1 bits,RW,0,"外部光耦12输入信号，FPGA_DO12，预留")
  io.FPGA_DO(11) := FPGA_DO_11.asBool
  val FPGA_DO_12 = My_Reg_FPGA_DO.fieldAt(24,bc = 1 bits,RW,0,"外部光耦13输入信号，FPGA_DO13，预留")
  io.FPGA_DO(12) := FPGA_DO_12.asBool
  val FPGA_DO_13 = My_Reg_FPGA_DO.fieldAt(26,bc = 1 bits,RW,0,"外部光耦14输入信号，FPGA_DO14，预留")
  io.FPGA_DO(13) := FPGA_DO_13.asBool
  val FPGA_DO_14 = My_Reg_FPGA_DO.fieldAt(28,bc = 1 bits,RW,0,"外部光耦15输入信号，FPGA_DO15，预留")
  io.FPGA_DO(14) := FPGA_DO_14.asBool
  val FPGA_DO_15 = My_Reg_FPGA_DO.fieldAt(30,bc = 1 bits,RW,0,"外部光耦16输入信号，FPGA_DO16，预留")
  io.FPGA_DO(15) := FPGA_DO_15.asBool

  val My_Reg_Encoder_Pos_Clr = busslave.newReg(doc="4路增量式光栅尺位置清零控制信号,预留")
  val Encoder1_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(0,bc = 1 bits,RW,0,"Encoder1位置清零，预留")
  io.Encoder_Clr(0) := Encoder1_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)
  val Encoder2_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(8,bc = 1 bits,RW,0,"Encoder2位置清零，预留")
  io.Encoder_Clr(1):= Encoder2_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)
  val Encoder3_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(16,bc = 1 bits,RW,0,"Encoder3位置清零，预留")
  io.Encoder_Clr(2) := Encoder3_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)
  val Encoder4_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(24,bc = 1 bits,RW,0,"Encoder4位置清零，预留")
  io.Encoder_Clr(3) := Encoder4_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)

  busslave.accept(HtmlGenerator("mdcb.html", "AP"))

}

object Mdcb_Regif extends App{
  SpinalVerilog(new Mdcb_Regif(8,32,3,2,4,4))
}
