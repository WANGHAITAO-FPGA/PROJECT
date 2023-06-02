package STCS

import PHPA82.ila_test.ila
import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.HtmlGenerator
import spinal.lib._

import java.time.LocalDate

case class Stcs_Sdac_Regif(addrwidth : Int, datawidth : Int, endat_num : Int, ad7606_num : Int, ssi_num : Int, endcoder_num : Int, uartreg_num : Int, ad5544_num : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val slaveid = in Bits(datawidth bits)
    val M_Fault_TTL_Filter = in Bits(8 bits)
    val FPGA_DI_Filter = in Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out Bits(16 bits)
    val AD7606_DATA = Seq.fill(ad7606_num)(in (Vec(Bits(16 bits),8)))
//    val BissC_Pos = Seq.fill(bissc_num)(in Bits(32 bits))
    val Encoder_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
    val Encoder_Zero_Keep = Seq.fill(endcoder_num)(in Bits(1 bits))
    val Encoder_Clr = Seq.fill(endcoder_num)(out Bits(1 bits))
    val Encoder_lock_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
    val Endat_Data = Seq.fill(endat_num)(in Bits(32 bits))
    val uart_regin = in (Vec(Bits(16 bits),uartreg_num))
    val AD5544_DATA = Seq.fill(ad5544_num)(out (Vec(Bits(16 bits),4)))
    val AD5544_TRIGER = Seq.fill(ad5544_num)(out Bool())
    val EtherCAT_DATA = in (Vec(Bits(32 bits),12))
    val SSi_Pos = Seq.fill(ssi_num)(in Bits(32 bits))
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  /**********************************************************************************************
   * SDAC 光纤发送数据
   * 包含BISS-C光栅尺、ENCODER增量尺，AD采集数据，UART接受的温度数据，IO输入数据
   *********************************************************************************************/

  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
  HEADER := 0x00F1F2F3

  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
  Slaveid := io.slaveid

  val My_Reg_VERSION = busslave.newReg(doc="软件版本号")
  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
  VERSION := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_Bissc = (0 until ssi_num).map { i =>
    val Ssi_Pos = busslave.newReg(doc=s"Bissc$i SSI光栅尺位置信号")
    val Ssi_Pos_Data = Ssi_Pos.field(32 bits,RO,0,s"光栅尺,SSI$i ssi光栅尺位置信号")
    Ssi_Pos_Data := io.SSi_Pos(i)
  }

  val My_Reg_Encoder1_Pos = busslave.newReg(doc="EPZ光栅尺,Encoder1增量式光栅尺位置信号")
  val Encoder1_Pos = My_Reg_Encoder1_Pos.field(32 bits,RO,0,"EPZ光栅尺,Encoder1增量式光栅尺位置信号")
  Encoder1_Pos := io.Encoder_Pos(0)

  val My_Reg_Encoder2_Pos = busslave.newReg(doc="EPRZ光栅尺,Encoder2增量式光栅尺位置信号")
  val Encoder2_Pos = My_Reg_Encoder2_Pos.field(32 bits,RO,0,"EPRZ光栅尺,Encoder2增量式光栅尺位置信号")
  Encoder2_Pos := io.Encoder_Pos(1)

  val My_Reg_Encoder3_Pos = busslave.newReg(doc="Encoder3增量式光栅尺位置信号")
  val Encoder3_Pos = My_Reg_Encoder3_Pos.field(32 bits,RO,0,"Encoder3增量式光栅尺位置信号")
  Encoder3_Pos := io.Encoder_Pos(2)


  val My_Reg_Encoder4_Pos = busslave.newReg(doc="Encoder4增量式光栅尺位置信号")
  val Encoder4_Pos = My_Reg_Encoder4_Pos.field(32 bits,RO,0,"Encoder4增量式光栅尺位置信号")
  Encoder4_Pos := io.Encoder_Pos(3)


  val My_Reg_AD7606_Datatemp1 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp1 = My_Reg_AD7606_Datatemp1.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道1输入,H1电容传感器")
  AD7606_Datatemp1 := io.AD7606_DATA(0)(0).resized

  val My_Reg_AD7606_Datatemp2 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp2 = My_Reg_AD7606_Datatemp2.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道2输入,H2电容传感器")
  AD7606_Datatemp2 := io.AD7606_DATA(0)(1).resized

  val My_Reg_AD7606_Datatemp3 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp3 = My_Reg_AD7606_Datatemp3.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道3输入,H3电容传感器")
  AD7606_Datatemp3 := io.AD7606_DATA(0)(2).resized

  val My_Reg_AD7606_Datatemp4 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp4 = My_Reg_AD7606_Datatemp4.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道4输入,H4电容传感器")
  AD7606_Datatemp4 := io.AD7606_DATA(0)(3).resized

  val My_Reg_AD7606_Datatemp5 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp5 = My_Reg_AD7606_Datatemp5.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道5输入,Z1电容传感器")
  AD7606_Datatemp5 := io.AD7606_DATA(0)(4).resized

  val My_Reg_AD7606_Datatemp6 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp6 = My_Reg_AD7606_Datatemp6.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道6输入,Z2电容传感器")
  AD7606_Datatemp6 := io.AD7606_DATA(0)(5).resized

  val My_Reg_AD7606_Datatemp7 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp7 = My_Reg_AD7606_Datatemp7.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道7输入,Z3电容传感器")
  AD7606_Datatemp7 := io.AD7606_DATA(0)(6).resized

  val My_Reg_AD7606_Datatemp8 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp8 = My_Reg_AD7606_Datatemp8.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U6）数据通道8输入,CZ1电容传感器")
  AD7606_Datatemp8 := io.AD7606_DATA(0)(7).resized

  val My_Reg_AD7606_Datatemp9 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp9 = My_Reg_AD7606_Datatemp9.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道1输入,CZ2电容传感器")
  AD7606_Datatemp9 := io.AD7606_DATA(1)(0).resized

  val My_Reg_AD7606_Datatemp10 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp10 = My_Reg_AD7606_Datatemp10.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道2输入,CZ3电容传感器")
  AD7606_Datatemp10 := io.AD7606_DATA(1)(1).resized

  val My_Reg_AD7606_Datatemp11 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp11 = My_Reg_AD7606_Datatemp11.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道3输入,预留")
  AD7606_Datatemp11 := io.AD7606_DATA(1)(2).resized

  val My_Reg_AD7606_Datatemp12 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp12 = My_Reg_AD7606_Datatemp12.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道4输入,预留")
  AD7606_Datatemp12 := io.AD7606_DATA(1)(3).resized

  val My_Reg_AD7606_Datatemp13 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp13 = My_Reg_AD7606_Datatemp13.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道5输入,压力传感器,SYSTEM")
  AD7606_Datatemp13 := io.AD7606_DATA(1)(4).resized

  val My_Reg_AD7606_Datatemp14 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp14 = My_Reg_AD7606_Datatemp14.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道6输入,压力传感器,CHUCK")
  AD7606_Datatemp14 := io.AD7606_DATA(1)(5).resized

  val My_Reg_AD7606_Datatemp15 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp15 = My_Reg_AD7606_Datatemp15.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道7输入,压力传感器,SYSTEM")
  AD7606_Datatemp15 := io.AD7606_DATA(1)(6).resized

  val My_Reg_AD7606_Datatemp16 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp16 = My_Reg_AD7606_Datatemp16.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U7）数据通道8输入,压力传感器,CHUCK")
  AD7606_Datatemp16 := io.AD7606_DATA(1)(7).resized

  val My_Reg_AD7606_Datatemp17 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp17 = My_Reg_AD7606_Datatemp17.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U8）数据通道1输入,预留")
  AD7606_Datatemp17 := io.AD7606_DATA(2)(0).resized

  val My_Reg_AD7606_Datatemp18 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp18 = My_Reg_AD7606_Datatemp18.fieldAt(0,bc = 32 bits,RO,0,"AD7606（U8）数据通道2输入,预留")
  AD7606_Datatemp18 := io.AD7606_DATA(2)(1).resized

  /*val My_Reg_AD7606_Datatemp34 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp3 = My_Reg_AD7606_Datatemp34.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道3输入")
  AD7606_Datatemp3 := io.AD7606_DATA(0)(2)
  val AD7606_Datatemp4 = My_Reg_AD7606_Datatemp34.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入")
  AD7606_Datatemp4 := io.AD7606_DATA(0)(3)

  val My_Reg_AD7606_Datatemp56 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp5 = My_Reg_AD7606_Datatemp56.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道5输入")
  AD7606_Datatemp5 := io.AD7606_DATA(0)(4)
  val AD7606_Datatemp6 = My_Reg_AD7606_Datatemp56.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道6输入")
  AD7606_Datatemp6 := io.AD7606_DATA(0)(5)

  val My_Reg_AD7606_Datatemp78 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp7 = My_Reg_AD7606_Datatemp78.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道7输入")
  AD7606_Datatemp7 := io.AD7606_DATA(0)(6)
  val AD7606_Datatemp8 = My_Reg_AD7606_Datatemp78.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U6）数据通道8输入")
  AD7606_Datatemp8 := io.AD7606_DATA(0)(7)

  val My_Reg_AD7606_Datatemp910 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp9 = My_Reg_AD7606_Datatemp910.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp9 := io.AD7606_DATA(1)(0)
  val AD7606_Datatemp10 = My_Reg_AD7606_Datatemp910.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道2输入")
  AD7606_Datatemp10 := io.AD7606_DATA(1)(1)

  val My_Reg_AD7606_Datatemp1112 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp11 = My_Reg_AD7606_Datatemp1112.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道3输入")
  AD7606_Datatemp11 := io.AD7606_DATA(1)(2)
  val AD7606_Datatemp12 = My_Reg_AD7606_Datatemp1112.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道4输入")
  AD7606_Datatemp12 := io.AD7606_DATA(1)(3)

  val My_Reg_AD7606_Datatemp1314 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp13 = My_Reg_AD7606_Datatemp1314.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道5输入")
  AD7606_Datatemp13 := io.AD7606_DATA(1)(4)
  val AD7606_Datatemp14 = My_Reg_AD7606_Datatemp1314.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道6输入")
  AD7606_Datatemp14 := io.AD7606_DATA(1)(5)

  val My_Reg_AD7606_Datatemp1516 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp15 = My_Reg_AD7606_Datatemp1516.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道7输入")
  AD7606_Datatemp15 := io.AD7606_DATA(1)(6)
  val AD7606_Datatemp16 = My_Reg_AD7606_Datatemp1516.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道8输入")
  AD7606_Datatemp16 := io.AD7606_DATA(1)(7)

  val My_Reg_AD7606_Datatemp1718 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp17 = My_Reg_AD7606_Datatemp1718.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp17 := io.AD7606_DATA(2)(0)
  val AD7606_Datatemp18 = My_Reg_AD7606_Datatemp1718.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U7）数据通道2输入")
  AD7606_Datatemp18 := io.AD7606_DATA(2)(1)

  val My_Reg_AD7606_Datatemp1920 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp19 = My_Reg_AD7606_Datatemp1920.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U8）数据通道3输入")
  AD7606_Datatemp19 := io.AD7606_DATA(2)(2)
  val AD7606_Datatemp20 = My_Reg_AD7606_Datatemp1920.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U8）数据通道4输入")
  AD7606_Datatemp20 := io.AD7606_DATA(2)(3)

  val My_Reg_AD7606_Datatemp2122 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp21 = My_Reg_AD7606_Datatemp2122.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U8）数据通道5输入")
  AD7606_Datatemp21 := io.AD7606_DATA(2)(4)
  val AD7606_Datatemp22 = My_Reg_AD7606_Datatemp2122.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U8）数据通道6输入")
  AD7606_Datatemp22 := io.AD7606_DATA(2)(5)

  val My_Reg_AD7606_Datatemp2324 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp23 = My_Reg_AD7606_Datatemp2324.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U8）数据通道7输入")
  AD7606_Datatemp23 := io.AD7606_DATA(2)(6)
  val AD7606_Datatemp24 = My_Reg_AD7606_Datatemp2324.fieldAt(16,bc = 16 bits,RO,0,"AD7606（U8）数据通道8输入")
  AD7606_Datatemp24 := io.AD7606_DATA(2)(7)*/

  val My_Reg_Uart_Datatemp1 = busslave.newReg(doc="温度传感器数据，X1温度")
  val Uart_Datatemp1 = My_Reg_Uart_Datatemp1.fieldAt(0,bc = 32 bits,RO,0,"温度传感器数据，X1温度")
  Uart_Datatemp1 := io.uart_regin(0).resized

  val My_Reg_Uart_Datatemp2 = busslave.newReg(doc="温度传感器数据，X2温度")
  val Uart_Datatemp2 = My_Reg_Uart_Datatemp2.fieldAt(0,bc = 32 bits,RO,0,"温度传感器数据，X2温度")
  Uart_Datatemp2 := io.uart_regin(1).resized

  val My_Reg_Uart_Datatemp3 = busslave.newReg(doc="温度传感器数据，Y1温度")
  val Uart_Datatemp3 = My_Reg_Uart_Datatemp3.fieldAt(0,bc = 32 bits,RO,0,"温度传感器数据，Y1温度")
  Uart_Datatemp3 := io.uart_regin(2).resized

  val My_Reg_Uart_Datatemp4 = busslave.newReg(doc="温度传感器数据，Y2温度")
  val Uart_Datatemp4 = My_Reg_Uart_Datatemp4.fieldAt(0,bc = 32 bits,RO,0,"温度传感器数据，Y2温度")
  Uart_Datatemp4 := io.uart_regin(3).resized

  val My_Reg_Uart_Datatemp5 = busslave.newReg(doc="DS18B20")
  val Uart_Datatemp5 = My_Reg_Uart_Datatemp5.fieldAt(0,bc = 32 bits,RO,0,"DS18B20")
  Uart_Datatemp5 := io.uart_regin(4).resized

  val My_Reg_Uart_Datatemp6 = busslave.newReg(doc="DS18B21")
  val Uart_Datatemp6 = My_Reg_Uart_Datatemp6.fieldAt(0,bc = 32 bits,RO,0,"DS18B21")
  Uart_Datatemp6 := io.uart_regin(5).resized

  val My_Reg_Uart_Datatemp7 = busslave.newReg(doc="DS18B22")
  val Uart_Datatemp7 = My_Reg_Uart_Datatemp7.fieldAt(0,bc = 32 bits,RO,0,"DS18B22")
  Uart_Datatemp7 := io.uart_regin(6).resized

  val My_Reg_Uart_Datatemp8 = busslave.newReg(doc="预留")
  val Uart_Datatemp8 = My_Reg_Uart_Datatemp8.fieldAt(0,bc = 32 bits,RO,0,"预留")
  Uart_Datatemp8 := io.uart_regin(7).resized

  val My_Reg_Reserve0 = busslave.newReg(doc="Reserve")
  val Reserve0 = My_Reg_Reserve0.field(32 bits,RW,0x01,"Reserve")

  val My_Reg_TTL_Single = busslave.newReg(doc="8路外部输入TTL信号（例如：PA FAULT输入，限位传感器输入），M_Fault_TTL")
  val TTL1_Single = My_Reg_TTL_Single.fieldAt(0,bc = 1 bits,RO,0,"外部TTL1输入信号，M_Fault_TTL1")
  TTL1_Single := io.M_Fault_TTL_Filter(0).asBits
  val TTL2_Single = My_Reg_TTL_Single.fieldAt(4,bc = 1 bits,RO,0,"外部TTL2输入信号，M_Fault_TTL2")
  TTL2_Single := io.M_Fault_TTL_Filter(1).asBits
  val TTL3_Single = My_Reg_TTL_Single.fieldAt(8,bc = 1 bits,RO,0,"外部TTL3输入信号，M_Fault_TTL3")
  TTL3_Single := io.M_Fault_TTL_Filter(2).asBits
  val TTL4_Single = My_Reg_TTL_Single.fieldAt(12,bc = 1 bits,RO,0,"外部TTL4输入信号，M_Fault_TTL4")
  TTL4_Single := io.M_Fault_TTL_Filter(3).asBits
  val TTL5_Single = My_Reg_TTL_Single.fieldAt(16,bc = 1 bits,RO,0,"外部TTL5输入信号，M_Fault_TTL5")
  TTL5_Single := io.M_Fault_TTL_Filter(4).asBits
  val TTL6_Single = My_Reg_TTL_Single.fieldAt(20,bc = 1 bits,RO,0,"外部TTL6输入信号，M_Fault_TTL6")
  TTL6_Single := io.M_Fault_TTL_Filter(5).asBits
  val TTL7_Single = My_Reg_TTL_Single.fieldAt(24,bc = 1 bits,RO,0,"外部TTL7输入信号，M_Fault_TTL7")
  TTL7_Single := io.M_Fault_TTL_Filter(6).asBits
  val TTL8_Single = My_Reg_TTL_Single.fieldAt(28,bc = 1 bits,RO,0,"外部TTL8输入信号，M_Fault_TTL8")
  TTL8_Single := io.M_Fault_TTL_Filter(7).asBits

  val My_Reg_Opt_Single = busslave.newReg(doc="16路外部输入光耦信号），FPGA_DI(FPGA_B34_IO_IN)")
  val Opt1_Single = My_Reg_Opt_Single.fieldAt(0,bc = 1 bits,RO,0,"外部光耦1输入信号，FPGA_DI1")
  Opt1_Single := io.FPGA_DI_Filter(0).asBits
  val Opt2_Single = My_Reg_Opt_Single.fieldAt(2,bc = 1 bits,RO,0,"外部光耦2输入信号，FPGA_DI2")
  Opt2_Single := io.FPGA_DI_Filter(1).asBits
  val Opt3_Single = My_Reg_Opt_Single.fieldAt(4,bc = 1 bits,RO,0,"外部光耦3输入信号，FPGA_DI3")
  Opt3_Single := io.FPGA_DI_Filter(2).asBits
  val Opt4_Single = My_Reg_Opt_Single.fieldAt(6,bc = 1 bits,RO,0,"外部光耦4输入信号，FPGA_DI4")
  Opt4_Single := io.FPGA_DI_Filter(3).asBits
  val Opt5_Single = My_Reg_Opt_Single.fieldAt(8,bc = 1 bits,RO,0,"外部光耦5输入信号，FPGA_DI5")
  Opt5_Single := io.FPGA_DI_Filter(4).asBits
  val Opt6_Single = My_Reg_Opt_Single.fieldAt(10,bc = 1 bits,RO,0,"外部光耦6输入信号，FPGA_DI6")
  Opt6_Single := io.FPGA_DI_Filter(5).asBits
  val Opt7_Single = My_Reg_Opt_Single.fieldAt(12,bc = 1 bits,RO,0,"外部光耦7输入信号，FPGA_DI7")
  Opt7_Single := io.FPGA_DI_Filter(6).asBits
  val Opt8_Single = My_Reg_Opt_Single.fieldAt(14,bc = 1 bits,RO,0,"外部光耦8输入信号，FPGA_DI8")
  Opt8_Single := io.FPGA_DI_Filter(7).asBits
  val Opt9_Single = My_Reg_Opt_Single.fieldAt(16,bc = 1 bits,RO,0,"外部光耦9输入信号，FPGA_DI9")
  Opt9_Single := io.FPGA_DI_Filter(8).asBits
  val Opt10_Single = My_Reg_Opt_Single.fieldAt(18,bc = 1 bits,RO,0,"外部光耦10输入信号，FPGA_DI10")
  Opt10_Single := io.FPGA_DI_Filter(9).asBits
  val Opt11_Single = My_Reg_Opt_Single.fieldAt(20,bc = 1 bits,RO,0,"外部光耦11输入信号，FPGA_DI11")
  Opt11_Single := io.FPGA_DI_Filter(10).asBits
  val Opt12_Single = My_Reg_Opt_Single.fieldAt(22,bc = 1 bits,RO,0,"外部光耦12输入信号，FPGA_DI12")
  Opt12_Single := io.FPGA_DI_Filter(11).asBits
  val Opt13_Single = My_Reg_Opt_Single.fieldAt(24,bc = 1 bits,RO,0,"外部光耦13输入信号，FPGA_DI13")
  Opt13_Single := io.FPGA_DI_Filter(12).asBits
  val Opt14_Single = My_Reg_Opt_Single.fieldAt(26,bc = 1 bits,RO,0,"外部光耦14输入信号，FPGA_DI14")
  Opt14_Single := io.FPGA_DI_Filter(13).asBits
  val Opt15_Single = My_Reg_Opt_Single.fieldAt(28,bc = 1 bits,RO,0,"外部光耦15输入信号，FPGA_DI15")
  Opt15_Single := io.FPGA_DI_Filter(14).asBits
  val Opt16_Single = My_Reg_Opt_Single.fieldAt(30,bc = 1 bits,RO,0,"外部光耦16输入信号，FPGA_DI16")
  Opt16_Single := io.FPGA_DI_Filter(15).asBits

  val My_Reg_Encoder1_Lock_Pos = busslave.newReg(doc="Encoder1增量式光栅尺触发INDEX位时的位置值")
  val Encoder1_Lock_Pos = My_Reg_Encoder1_Lock_Pos.field(32 bits,RO,0,"Encoder1增量式光栅尺触发INDEX位时的位置值")
  Encoder1_Lock_Pos := io.Encoder_lock_Pos(0)

  val My_Reg_Encoder2_Lock_Pos = busslave.newReg(doc="Encoder2增量式光栅尺触发INDEX位时的位置值")
  val Encoder2_Lock_Pos = My_Reg_Encoder2_Lock_Pos.field(32 bits,RO,0,"Encoder2增量式光栅尺触发INDEX位时的位置值")
  Encoder2_Lock_Pos := io.Encoder_lock_Pos(1)

  val My_Reg_Encoder3_Lock_Pos = busslave.newReg(doc="Encoder3增量式光栅尺触发INDEX位时的位置值")
  val Encoder3_Lock_Pos = My_Reg_Encoder3_Lock_Pos.field(32 bits,RO,0,"Encoder3增量式光栅尺触发INDEX位时的位置值")
  Encoder3_Lock_Pos := io.Encoder_lock_Pos(2)

  val My_Reg_Encoder4_Lock_Pos = busslave.newReg(doc="Encoder4增量式光栅尺触发INDEX位时的位置值")
  val Encoder4_Lock_Pos = My_Reg_Encoder4_Lock_Pos.field(32 bits,RO,0,"Encoder4增量式光栅尺触发INDEX位时的位置值")
  Encoder4_Lock_Pos := io.Encoder_lock_Pos(3)

  val My_Reg_Encoder_ZeroSingle = busslave.newReg(doc="4路增量式光栅尺零位信号")
  val Encoder1_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(0,bc = 1 bits,RO,0,"Encoder1零位信号，LE_R_I1")
  Encoder1_ZeroSingle := io.Encoder_Zero_Keep(0)
  val Encoder2_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(8,bc = 1 bits,RO,0,"Encoder2零位信号，LE_R_I2")
  Encoder2_ZeroSingle := io.Encoder_Zero_Keep(1)
  val Encoder3_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(16,bc = 1 bits,RO,0,"Encoder3零位信号，LE_R_I3")
  Encoder3_ZeroSingle := io.Encoder_Zero_Keep(2)
  val Encoder4_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(24,bc = 1 bits,RO,0,"Encoder4零位信号，LE_R_I4")
  Encoder4_ZeroSingle := io.Encoder_Zero_Keep(3)

  val My_Reg_Endat1_Pos = busslave.newReg(doc="Endat1绝对式光栅尺位置信号")
  val Endat1_Pos = My_Reg_Endat1_Pos.field(32 bits,RO,0,"Endat1位置信号")
  Endat1_Pos := io.Endat_Data(0)

  val My_Reg_Endat2_Pos = busslave.newReg(doc="Endat1绝对式光栅尺位置信号")
  val Endat2_Pos = My_Reg_Endat2_Pos.field(32 bits,RO,0,"Endat2位置信号")
  Endat2_Pos := io.Endat_Data(1)

  val My_Reg_Endat3_Pos = busslave.newReg(doc="Endat1绝对式光栅尺位置信号")
  val Endat3_Pos = My_Reg_Endat3_Pos.field(32 bits,RO,0,"Endat3位置信号")
  Endat3_Pos := io.Endat_Data(2)

  val My_Reg_Endat4_Pos = busslave.newReg(doc="Endat1绝对式光栅尺位置信号")
  val Endat4_Pos = My_Reg_Endat4_Pos.field(32 bits,RO,0,"Endat4位置信号")
  Endat4_Pos := io.Endat_Data(3)

//  val My_Reg_EtherCAT = (0 until 12).map{i=>
//    val My_Reg_EtherCAT_Data = busslave.newReg(s"EtherCAT_Data$i")
//    val EtherCAT_Data = My_Reg_EtherCAT_Data.field(32 bits,RO,0,s"EtherCAT_Data$i")
//    EtherCAT_Data := io.EtherCAT_DATA(i)
//  }

  val My_Reg_TTL_DATA = busslave.newReg(doc="TTL输出信号")
  val TTL_DATA = My_Reg_TTL_DATA.field(32 bits,RO,0,"TTL输出信号")
  TTL_DATA := io.M_EN_TTL.resized

  val My_Reg_OPTO_DATA = busslave.newReg(doc="OPTO输出信号")
  val OPTO_DATA = My_Reg_OPTO_DATA.field(32 bits,RO,0,"TTL输出信号")
  OPTO_DATA := io.FPGA_DO.resized

  /**********************************************************************************************
   * SDAC 光纤接受数据
   *
   *********************************************************************************************/
  val My_Reg_AD5544_Datatemp12 = busslave.newRegAt(address = 0x010c,doc="AD5544(U73)DA数据输出")
  val AD5544_Datatemp1 = My_Reg_AD5544_Datatemp12.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道1输出,X1电机设定值-相A，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(0)(0) := AD5544_Datatemp1
  val AD5544_Datatemp2 = My_Reg_AD5544_Datatemp12.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道2输出,X1电机设定值-相B，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(0)(1) := AD5544_Datatemp2

  val My_Reg_AD5544_Datatemp34 = busslave.newReg(doc="AD5544(U73)DA数据输出")
  val AD5544_Datatemp3 = My_Reg_AD5544_Datatemp34.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道3输出,X2电机设定值-相A，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(0)(2) := AD5544_Datatemp3
  val AD5544_Datatemp4 = My_Reg_AD5544_Datatemp34.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U73)DA数据通道4输出,X2电机设定值-相B，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(0)(3) := AD5544_Datatemp4

  val AD5544_Triger1_Temp =  My_Reg_AD5544_Datatemp12.hitDoWrite || My_Reg_AD5544_Datatemp34.hitDoWrite
  //  io.AD5544_TRIGER(0) := (AD5544_Triger1_Temp|Delay(AD5544_Triger1_Temp,1)|Delay(AD5544_Triger1_Temp,2)|Delay(AD5544_Triger1_Temp,3))

  val My_Reg_AD5544_Datatemp56 = busslave.newReg(doc="AD5544(U83)DA数据输出")
  val AD5544_Datatemp5 = My_Reg_AD5544_Datatemp56.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道1输出,Y1电机设定值-相A，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(1)(0) := AD5544_Datatemp5
  val AD5544_Datatemp6 = My_Reg_AD5544_Datatemp56.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道2输出,Y1电机设定值-相B，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(1)(1) := AD5544_Datatemp6

  val My_Reg_AD5544_Datatemp78 = busslave.newReg(doc="AD5544(U83)DA数据输出")
  val AD5544_Datatemp7 = My_Reg_AD5544_Datatemp78.fieldAt(0,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道3输出,Y2电机设定值-相A，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(1)(2) := AD5544_Datatemp7
  val AD5544_Datatemp8 = My_Reg_AD5544_Datatemp78.fieldAt(16,bc = 16 bits,RW,0x8000,"AD5544(U83)DA数据通道4输出,Y2电机设定值-相B，注意：SDAC板无DA，该功能无效")
  //  io.AD5544_DATA(1)(3) := AD5544_Datatemp8

  val AD5544_Triger2_Temp =  My_Reg_AD5544_Datatemp56.hitDoWrite || My_Reg_AD5544_Datatemp78.hitDoWrite
  //  io.AD5544_TRIGER(1) := (AD5544_Triger2_Temp|Delay(AD5544_Triger2_Temp,1)|Delay(AD5544_Triger2_Temp,2)|Delay(AD5544_Triger2_Temp,3))

  val My_Reg_Reserve1 = busslave.newReg(doc="Reserve")
  val Reserve1 = My_Reg_Reserve1.field(32 bits,RW,0x01,"Reserve")
  val My_Reg_Reserve2 = busslave.newReg(doc="Reserve")
  val Reserve2 = My_Reg_Reserve2.field(32 bits,RW,0x02,"Reserve")

  val My_Reg_M_EN_TTL = busslave.newReg(doc="8路外部输出TTL信号（例如：PA 使能），M_EN_TTL")
  val M_EN_TTL1 = My_Reg_M_EN_TTL.fieldAt(0,bc = 1 bits,RW,0,"外部TTL1输出信号，M_EN_TTL1")
  io.M_EN_TTL(0) := M_EN_TTL1.asBool
  val M_EN_TTL2 = My_Reg_M_EN_TTL.fieldAt(4,bc = 1 bits,RW,0,"外部TTL2输出信号，M_EN_TTL2")
  io.M_EN_TTL(1) := M_EN_TTL2.asBool
  val M_EN_TTL3 = My_Reg_M_EN_TTL.fieldAt(8,bc = 1 bits,RW,0,"外部TTL3输出信号，M_EN_TTL3")
  io.M_EN_TTL(2) := M_EN_TTL3.asBool
  val M_EN_TTL4 = My_Reg_M_EN_TTL.fieldAt(12,bc = 1 bits,RW,0,"外部TTL4输出信号，M_EN_TTL4")
  io.M_EN_TTL(3) := M_EN_TTL4.asBool
  val M_EN_TTL5 = My_Reg_M_EN_TTL.fieldAt(16,bc = 1 bits,RW,0,"外部TTL5输出信号，M_EN_TTL5")
  io.M_EN_TTL(4) := M_EN_TTL5.asBool
  val M_EN_TTL6 = My_Reg_M_EN_TTL.fieldAt(20,bc = 1 bits,RW,0,"外部TTL6输出信号，M_EN_TTL6")
  io.M_EN_TTL(5) := M_EN_TTL6.asBool
  val M_EN_TTL7 = My_Reg_M_EN_TTL.fieldAt(24,bc = 1 bits,RW,0,"外部TTL7输出信号，M_EN_TTL7")
  io.M_EN_TTL(6) := M_EN_TTL7.asBool
  val M_EN_TTL8 = My_Reg_M_EN_TTL.fieldAt(28,bc = 1 bits,RW,0,"外部TTL8输出信号，M_EN_TTL8")
  io.M_EN_TTL(7) := M_EN_TTL8.asBool

  val My_Reg_FPGA_DO = busslave.newReg(doc="16路外部输出光耦信号），FPGA_DO(FPGA_B33_IO_OUT)")
  val FPGA_DO_0 = My_Reg_FPGA_DO.fieldAt(0,bc = 1 bits,RW,0,"外部光耦1输入信号，FPGA_DO1")
  io.FPGA_DO(0) := ~FPGA_DO_0.asBool
  val FPGA_DO_1 = My_Reg_FPGA_DO.fieldAt(2,bc = 1 bits,RW,0,"外部光耦2输入信号，FPGA_DO2")
  io.FPGA_DO(1) := ~FPGA_DO_1.asBool
  val FPGA_DO_2 = My_Reg_FPGA_DO.fieldAt(4,bc = 1 bits,RW,0,"外部光耦3输入信号，FPGA_DO3")
  io.FPGA_DO(2) := FPGA_DO_2.asBool
  val FPGA_DO_3 = My_Reg_FPGA_DO.fieldAt(6,bc = 1 bits,RW,0,"外部光耦4输入信号，FPGA_DO4")
  io.FPGA_DO(3) := FPGA_DO_3.asBool
  val FPGA_DO_4 = My_Reg_FPGA_DO.fieldAt(8,bc = 1 bits,RW,0,"外部光耦5输入信号，FPGA_DO5")
  io.FPGA_DO(4) := FPGA_DO_4.asBool
  val FPGA_DO_5 = My_Reg_FPGA_DO.fieldAt(10,bc = 1 bits,RW,0,"外部光耦6输入信号，FPGA_DO6")
  io.FPGA_DO(5) := FPGA_DO_5.asBool
  val FPGA_DO_6 = My_Reg_FPGA_DO.fieldAt(12,bc = 1 bits,RW,0,"外部光耦7输入信号，FPGA_DO7")
  io.FPGA_DO(6) := FPGA_DO_6.asBool
  val FPGA_DO_7 = My_Reg_FPGA_DO.fieldAt(14,bc = 1 bits,RW,0,"外部光耦8输入信号，FPGA_DO8")
  io.FPGA_DO(7) := FPGA_DO_7.asBool
  val FPGA_DO_8 = My_Reg_FPGA_DO.fieldAt(16,bc = 1 bits,RW,0,"外部光耦9输入信号，FPGA_DO9")
  io.FPGA_DO(8) := FPGA_DO_8.asBool
  val FPGA_DO_9 = My_Reg_FPGA_DO.fieldAt(18,bc = 1 bits,RW,0,"外部光耦10输入信号，FPGA_DO10")
  io.FPGA_DO(9) := FPGA_DO_9.asBool
  val FPGA_DO_10 = My_Reg_FPGA_DO.fieldAt(20,bc = 1 bits,RW,0,"外部光耦11输入信号，FPGA_DO11")
  io.FPGA_DO(10) := FPGA_DO_10.asBool
  val FPGA_DO_11 = My_Reg_FPGA_DO.fieldAt(22,bc = 1 bits,RW,0,"外部光耦12输入信号，FPGA_DO12")
  io.FPGA_DO(11) := FPGA_DO_11.asBool
  val FPGA_DO_12 = My_Reg_FPGA_DO.fieldAt(24,bc = 1 bits,RW,0,"外部光耦13输入信号，FPGA_DO13")
  io.FPGA_DO(12) := FPGA_DO_12.asBool
  val FPGA_DO_13 = My_Reg_FPGA_DO.fieldAt(26,bc = 1 bits,RW,0,"外部光耦14输入信号，FPGA_DO14")
  io.FPGA_DO(13) := FPGA_DO_13.asBool
  val FPGA_DO_14 = My_Reg_FPGA_DO.fieldAt(28,bc = 1 bits,RW,0,"外部光耦15输入信号，FPGA_DO15")
  io.FPGA_DO(14) := FPGA_DO_14.asBool
  val FPGA_DO_15 = My_Reg_FPGA_DO.fieldAt(30,bc = 1 bits,RW,0,"外部光耦16输入信号，FPGA_DO16")
  io.FPGA_DO(15) := FPGA_DO_15.asBool

//  val Encoder_Clr0 = Reg(Bits(1 bits)) init 0
//  val Encoder_Clr1 = Reg(Bits(1 bits)) init 0
//  val Encoder_Clr2 = Reg(Bits(1 bits)) init 0
//  val Encoder_Clr3 = Reg(Bits(1 bits)) init 0

  val My_Reg_Encoder_Pos_Clr = busslave.newReg(doc="4路增量式光栅尺位置清零控制信号")
  val Encoder1_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(0,bc = 1 bits,RW,0,"Encoder1位置清零")
  io.Encoder_Clr(0) := Encoder1_Pos_Clr

  val Encoder2_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(8,bc = 1 bits,RW,0,"Encoder2位置清零")
  io.Encoder_Clr(1):= Encoder2_Pos_Clr

  val Encoder3_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(16,bc = 1 bits,RW,0,"Encoder3位置清零")
  io.Encoder_Clr(2) := Encoder3_Pos_Clr

  val Encoder4_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(24,bc = 1 bits,RW,0,"Encoder4位置清零")
  io.Encoder_Clr(3) := Encoder4_Pos_Clr

  busslave.accept(HtmlGenerator("Sdac_Reg", "Sdac_Reg"))

  val t1 = Reg(SInt(32 bits)) init 0
  t1:= io.Encoder_Pos(0).asSInt
  val flag1 = Reg(Bool())
  flag1 := False
  when(t1 > 10000){
    flag1 := True
  }

  val t2 = Reg(SInt(32 bits)) init 0
  t2:= io.Encoder_Pos(1).asSInt
  val flag2 = Reg(Bool())
  flag2 := False
  when(t2 > 10000){
    flag2 := True
  }

  val ila_probe = ila("5",io.Encoder_Clr(0),io.Encoder_Pos(0),io.Encoder_Pos(1),io.Encoder_Pos(2),flag1,flag2)
}
