//package MDCB_COMMON
//
//import SimpleBus._
//import spinal.core._
//import spinal.lib.bus.regif.AccessType.RO
//import spinal.lib.slave
//
//import java.time.LocalDate
//
//case class Mdcb_Common_Reg(addrwidth : Int) extends Component{
//  val io = new Bundle{
//    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,32)))
//    val slaveid = in Bits(32 bits)
//  }
//  noIoPrefix()
//
//  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))
//
//  val My_Reg_HEADER = busslave.newReg(doc="帧头")
//  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
//  HEADER := 0x00F1F2F3
//
//  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
//  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
//  Slaveid := io.slaveid
//
//  val My_Reg_VERSION = busslave.newReg(doc="软件版本号")
//  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
//  VERSION := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth
//
////  val My_Reg_BissC = (0 until 4).map{ i =>
////    val BissC_Pos = busslave.newReg(doc=s"BissC$i 绝对式光栅尺位置信号")
////    val BissC_Pos_Data = BissC_Pos.field(32 bits,RO,0,s"Encoder$i 绝对式光栅尺位置信号")
////    BissC_Pos_Data := io.Encoder_Pos(i)
////  }
////
////  val My_Reg_Encoder = (0 until 4).map{ i =>
////    val Encoder_Pos = busslave.newReg(doc=s"Encoder$i 增量式光栅尺位置信号")
////    val Encoder_Pos_Data = Encoder_Pos.field(32 bits,RO,0,s"Encoder$i 增量式光栅尺位置信号")
////    Encoder_Pos_Data := io.Encoder_Pos(i)
////  }
//
//}
