package X300_SDAC

import SimpleBus.{SimpleBus, SimpleBusConfig, SpBusInterface}
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.misc.Timer
import spinal.lib.slave

import java.time.LocalDate

case class Enable_Test(addrwidth : Int, datawidth : Int, endat_num : Int, ad7606_num : Int, bissc_num : Int, endcoder_num : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val slaveid = in Bits(datawidth bits)
    val AD7606_DATA = Seq.fill(ad7606_num)(in (Vec(Bits(16 bits),8)))
    val temp = in Bits(32 bits)
    val Start_Send = out Bool()
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val timer_A = Timer(32)
  timer_A.io.tick := True
  timer_A.io.limit := 1250000000
  when(timer_A.io.value >= timer_A.io.limit){
    timer_A.io.clear := True
  }otherwise{
    timer_A.io.clear := False
  }

  val data_temp = Reg(UInt(32 bits)) init 0
  when(timer_A.io.full){
    when(data_temp === 0){
      data_temp := 0x55
    }elsewhen(data_temp === 0x55){
      data_temp := 0
    }
  }

  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
  HEADER := 0x00F1F2F3

  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
  Slaveid := 0x0F

  val My_Reg_VERSION = busslave.newReg(doc="软件版本号")
  val VERSION = My_Reg_VERSION.field(32 bits,RO,0,"软件版本号")
  VERSION := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val AD5544 = (0 until 6).map { i =>
    val My_Reg_Reserve = busslave.newReg(doc="Reserve")
    val Reserve = My_Reg_Reserve.field(32 bits,RO,0x01,"Reserve")
    Reserve := B"32'x80008000"
  }

  val Enable = (0 until 6).map { i =>
    val My_Reg_Reserve1 = busslave.newReg(doc="Reserve")
    val Reserve1 = My_Reg_Reserve1.field(32 bits,RO,0x01,"Reserve")
    Reserve1 := io.temp
  }


  val My_Reg_Start = busslave.newRegAt(address = 0x010c,doc="启动光纤传输")
  val Start_Send = My_Reg_Start.fieldAt(0,bc = 1 bits,RW,0,"外部TTL1输出信号，M_EN_TTL1")
  io.Start_Send := Start_Send.asBool
}
