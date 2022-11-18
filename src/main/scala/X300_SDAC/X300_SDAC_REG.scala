package X300_SDAC

import SimpleBus.{SimpleBus, SimpleBusConfig, SpBusInterface}
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.slave

case class X300_SdacRegif(addrwidth : Int, datawidth : Int, endat_num : Int, ad7606_num : Int, bissc_num : Int, endcoder_num : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val slaveid = in Bits(datawidth bits)
    /*val M_Fault_TTL_Filter = in Bits(8 bits)
    val FPGA_DI_Filter = in Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out Bits(16 bits)*/
    val AD7606_DATA = Seq.fill(ad7606_num)(in (Vec(Bits(16 bits),8)))
    /*val BissC_Pos = Seq.fill(bissc_num)(in Bits(32 bits))
    val Encoder_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
    val Encoder_Zero_Keep = Seq.fill(endcoder_num)(in Bits(1 bits))
    val Encoder_Clr = Seq.fill(endcoder_num)(out Bits(1 bits))
    val Encoder_lock_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
    val Endat_Data = Seq.fill(endat_num)(in Bits(32 bits))*/
    val Start_Send = out Bool()
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
  HEADER := 0x0000FFBC

  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
  Slaveid := io.slaveid

  val My_Reg_ADDR = busslave.newReg(doc="地址")
  val ADDR = My_Reg_ADDR.field(32 bits,RO,0x01,"地址")
  ADDR := 0x00000037

  val My_Reg_Reserve0 = busslave.newReg(doc="Reserve")
  val Reserve0 = My_Reg_Reserve0.field(32 bits,RO,0x01,"Reserve")
  Reserve0 := 0x01

  val My_Reg_VERSION = busslave.newReg(doc="软件版本号")
  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
  VERSION := 0x20220114

  val My_Reg_Reserve1 = busslave.newReg(doc="Reserve")
  val Reserve1 = My_Reg_Reserve1.field(32 bits,RO,0x01,"Reserve")
  Reserve1 := 0x01
  val My_Reg_Reserve2 = busslave.newReg(doc="Reserve")
  val Reserve2 = My_Reg_Reserve2.field(32 bits,RO,0x02,"Reserve")
  Reserve2 := 0x02
  val My_Reg_Reserve3 = busslave.newReg(doc="Reserve")
  val Reserve3 = My_Reg_Reserve3.field(32 bits,RO,0x03,"Reserve")
  Reserve3 := 0x03
  val My_Reg_Reserve4 = busslave.newReg(doc="Reserve")
  val Reserve4 = My_Reg_Reserve4.field(32 bits,RO,0x04,"Reserve")
  Reserve4 := 0x04

  val My_Reg_AD7606_Datatemp1 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp1 = My_Reg_AD7606_Datatemp1.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道1输入")
  AD7606_Datatemp1 := io.AD7606_DATA(0)(0).resized

  val My_Reg_AD7606_Datatemp2 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp2 = My_Reg_AD7606_Datatemp2.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道1输入")
  AD7606_Datatemp2 := io.AD7606_DATA(0)(1).resized

  val My_Reg_AD7606_Datatemp3 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp3 = My_Reg_AD7606_Datatemp3.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道1输入")
  AD7606_Datatemp3 := io.AD7606_DATA(0)(2).resized

  val My_Reg_AD7606_Datatemp4 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp4 = My_Reg_AD7606_Datatemp4.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入")
  AD7606_Datatemp4 := io.AD7606_DATA(0)(3)

  val My_Reg_AD7606_Datatemp5 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp5 = My_Reg_AD7606_Datatemp5.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入")
  AD7606_Datatemp5 := io.AD7606_DATA(1)(0)

  val My_Reg_AD7606_Datatemp6 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp6 = My_Reg_AD7606_Datatemp6.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入")
  AD7606_Datatemp6 := io.AD7606_DATA(1)(1)

  val My_Reg_AD7606_Datatemp7 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp7 = My_Reg_AD7606_Datatemp7.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入")
  AD7606_Datatemp7 := io.AD7606_DATA(1)(2)

  val My_Reg_AD7606_Datatemp8 = busslave.newReg(doc="AD7606数据输入（U6）")
  val AD7606_Datatemp8 = My_Reg_AD7606_Datatemp8.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U6）数据通道4输入")
  AD7606_Datatemp8 := io.AD7606_DATA(1)(3)

  val My_Reg_AD7606_Datatemp9 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp9 = My_Reg_AD7606_Datatemp9.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp9 := io.AD7606_DATA(2)(0)

  val My_Reg_AD7606_Datatemp10 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp10 = My_Reg_AD7606_Datatemp10.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp10 := io.AD7606_DATA(2)(1)

  val My_Reg_AD7606_Datatemp11 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp11 = My_Reg_AD7606_Datatemp11.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp11 := io.AD7606_DATA(2)(2)

  val My_Reg_AD7606_Datatemp12 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp12 = My_Reg_AD7606_Datatemp12.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp12 := io.AD7606_DATA(2)(3)

  val My_Reg_AD7606_Datatemp13 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp13 = My_Reg_AD7606_Datatemp13.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp13 := io.AD7606_DATA(0)(4)

  val My_Reg_AD7606_Datatemp14 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp14 = My_Reg_AD7606_Datatemp14.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp14 := io.AD7606_DATA(0)(5)

  val My_Reg_AD7606_Datatemp15 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp15 = My_Reg_AD7606_Datatemp15.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp15 := io.AD7606_DATA(0)(6)

  val My_Reg_AD7606_Datatemp16 = busslave.newReg(doc="AD7606数据输入（U7）")
  val AD7606_Datatemp16 = My_Reg_AD7606_Datatemp16.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp16 := io.AD7606_DATA(0)(7)

  val My_Reg_AD7606_Datatemp17 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp17 = My_Reg_AD7606_Datatemp17.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp17 := io.AD7606_DATA(1)(4)

  val My_Reg_AD7606_Datatemp18 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp18 = My_Reg_AD7606_Datatemp18.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp18 := io.AD7606_DATA(1)(5)

  val My_Reg_AD7606_Datatemp19 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp19 = My_Reg_AD7606_Datatemp19.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp19 := io.AD7606_DATA(1)(6)

  val My_Reg_AD7606_Datatemp20 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp20 = My_Reg_AD7606_Datatemp20.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp20 := io.AD7606_DATA(1)(7)

  val My_Reg_AD7606_Datatemp21 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp21 = My_Reg_AD7606_Datatemp21.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp21 := io.AD7606_DATA(2)(4)

  val My_Reg_AD7606_Datatemp22 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp22 = My_Reg_AD7606_Datatemp22.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp22 := io.AD7606_DATA(2)(5)

  val My_Reg_AD7606_Datatemp23 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp23 = My_Reg_AD7606_Datatemp23.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp23 := io.AD7606_DATA(2)(6)

  val My_Reg_AD7606_Datatemp24 = busslave.newReg(doc="AD7606数据输入（U8）")
  val AD7606_Datatemp24 = My_Reg_AD7606_Datatemp24.fieldAt(0,bc = 16 bits,RO,0,"AD7606（U7）数据通道1输入")
  AD7606_Datatemp24 := io.AD7606_DATA(2)(7)

  val My_Reg_tail = busslave.newRegAt(252,"帧尾")
  val tail = My_Reg_tail.field(32 bits,RO,0,"帧头")
  tail := 0x0000FFBD

  val My_Reg_Start = busslave.newRegAt(address = 0x010c,doc="启动光纤传输")
  val Start_Send = My_Reg_Start.fieldAt(0,bc = 1 bits,RW,0,"外部TTL1输出信号，M_EN_TTL1")
  io.Start_Send := Start_Send.asBool
}
