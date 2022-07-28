package SDCR

import PHPA82.EncoderInterface
import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.HtmlGenerator
import spinal.lib.{master, slave}

import java.time.LocalDate

case class Sdcr_Regif(addrwidth : Int, datawidth : Int, endat_num : Int, temp_num : Int, endcoder_num : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val slaveid = in Bits(datawidth bits)
    val M_Fault_TTL_Filter = in Bits(8 bits)
    val FPGA_DI_Filter = in Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out Bits(16 bits)
    val Endat_Data = Seq.fill(endat_num)(in Bits(38 bits))
    val Endat_Index = Seq.fill(endat_num)(in Bool())
    val Press_Data = in Vec(Bits(32 bits),5)
    val Temp_Data = Seq.fill(temp_num)(in Bits(32 bits))
    val Encoder_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
    val Encoder_Zero_Keep = Seq.fill(endcoder_num)(in Bits(1 bits))
    val Encoder_Clr = Seq.fill(endcoder_num)(out Bits(1 bits))
    val Encoder_lock_Pos = Seq.fill(endcoder_num)(in Bits(32 bits))
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

  val My_Reg_Encoder = (0 until endcoder_num).map{ i =>
    val Encoder_Pos = busslave.newReg(doc=s"Encoder$i 增量式光栅尺位置信号")
    val Encoder_Pos_Data = Encoder_Pos.field(32 bits,RO,0,s"Encoder$i 增量式光栅尺位置信号")
    Encoder_Pos_Data := io.Encoder_Pos(i)
  }

  val My_Reg_Encoder_Lock = (0 until endcoder_num).map { i =>
    val Encoder_Lock_Pos = busslave.newReg(doc=s"Encoder$i 增量式光栅尺触发INDEX位时的位置值")
    val Lock_Pos_Data = Encoder_Lock_Pos.field(32 bits,RO,0,s"Encoder$i 增量式光栅尺触发INDEX位时的位置值")
    Lock_Pos_Data := io.Encoder_lock_Pos(i)
  }

  val My_Reg_Encoder_ZeroSingle = busslave.newReg(doc="4路增量式光栅尺零位信号")
  val Encoder1_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(0,bc = 1 bits,RO,0,"Encoder1零位信号，LE_R_I1")
  Encoder1_ZeroSingle := io.Encoder_Zero_Keep(0)
  val Encoder2_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(8,bc = 1 bits,RO,0,"Encoder2零位信号，LE_R_I2")
  Encoder2_ZeroSingle := io.Encoder_Zero_Keep(1)
  val Encoder3_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(16,bc = 1 bits,RO,0,"Encoder3零位信号，LE_R_I3")
  Encoder3_ZeroSingle := io.Encoder_Zero_Keep(2)
  val Encoder4_ZeroSingle = My_Reg_Encoder_ZeroSingle.fieldAt(24,bc = 1 bits,RO,0,"Encoder4零位信号，LE_R_I4")
  Encoder4_ZeroSingle := io.Encoder_Zero_Keep(3)

  val Endat_Data = Seq.fill(endat_num)(Reg(Bits(38 bits)))
  when(!(busslave.askRead|busslave.doRead)){
    for(i <- 0 until endat_num){
      Endat_Data(i) := io.Endat_Data(i)
    }
  }

  val My_Reg_Endat = (0 until endat_num).map { i =>
    val Data_High = busslave.newReg(s"Endat_Data_High$i 高6位")
    val Endat_Data_High = Data_High.field(32 bits,RO,0,s"Endat_Data$i")
    Endat_Data_High := Endat_Data(i)(37 downto 32).resized

    val Data_Low = busslave.newReg(s"Endat_Data_Low$i 低32位")
    val Endat_Data_Low = Data_Low.field(32 bits,RO,0,s"Endat_Data$i")
    Endat_Data_Low := Endat_Data(i)(31 downto 0)
  }

  val My_Reg_EndatIndex = (0 until endat_num).map { i =>
    val Endat_Index = busslave.newReg(s"Endat_Index$i ")
    val Endat_Index_Data = Endat_Index.fieldAt(0,bc = 1 bits,RO,0,s"Endat_Index$i ")
    Endat_Index_Data := io.Endat_Index(i).asBits
  }

  val My_Reg_Press =  (0 until 5).map { i =>
    val Press = busslave.newReg(s"Press_Data$i ASCII")
    val Press_Data = Press.field(32 bits,RO,0,s"Press_Data$i")
    Press_Data := io.Press_Data(i)
  }

  val My_Reg_Temp = (0 until temp_num).map { i =>
    val Temp = busslave.newReg(s"Temp$i float32")
    val Temp_Data = Temp.field(32 bits,RO,0,s"Temp_Data$i")
    Temp_Data := io.Temp_Data(i)
  }


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



  /**********************************************************************************************
   * SDCR 光纤接受数据
   *
   *********************************************************************************************/

  val My_Reg_M_EN_TTL = busslave.newRegAt(address = 0x010c,doc="8路外部输出TTL信号（例如：PA 使能），M_EN_TTL")
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
  io.FPGA_DO(0) := FPGA_DO_0.asBool
  val FPGA_DO_1 = My_Reg_FPGA_DO.fieldAt(2,bc = 1 bits,RW,0,"外部光耦2输入信号，FPGA_DO2")
  io.FPGA_DO(1) := FPGA_DO_1.asBool
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

  val My_Reg_Encoder_Pos_Clr = busslave.newReg(doc="4路增量式光栅尺位置清零控制信号")
  val Encoder1_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(0,bc = 1 bits,RW,0,"Encoder1位置清零")
  io.Encoder_Clr(0) := Encoder1_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)
  val Encoder2_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(8,bc = 1 bits,RW,0,"Encoder2位置清零")
  io.Encoder_Clr(1):= Encoder2_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)
  val Encoder3_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(16,bc = 1 bits,RW,0,"Encoder3位置清零")
  io.Encoder_Clr(2) := Encoder3_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)
  val Encoder4_Pos_Clr = My_Reg_Encoder_Pos_Clr.fieldAt(24,bc = 1 bits,RW,0,"Encoder4位置清零")
  io.Encoder_Clr(3) := Encoder4_Pos_Clr & (My_Reg_Encoder_Pos_Clr.hitDoWrite.asBits)

  busslave.accept(HtmlGenerator("Sdcr_Reg", "Sdcr_Reg"))

}
