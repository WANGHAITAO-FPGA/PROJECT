package FIBER

import PHPA82.regFileGen.genRegFileByMarkdown
import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.{Delay, slave}

case class FiberRegif(addrwidth : Int, datawidth : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
    val output_enable = in Bool()
    val receive_done = in Bool()
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg0 = busslave.newReg(doc="帧头")
  val HEADER = My_Reg0.field(32 bits,RO,0,"帧头")
  HEADER := 0x00F1F2F3

  val My_Reg1 = busslave.newReg(doc="版本号")
  val VERSION = My_Reg1.field(32 bits,RO,0,"板卡")
  VERSION := 0x20211224

  val My_Reg2 = busslave.newRegAt(0x0002<<2,doc="发送数据包个数")
  val SEND_CNT = My_Reg2.field(32 bits,RO,0,"发送数据包个数")
  SEND_CNT := 0x0102034


  val DATA_TEMP0 = busslave.newRegAt(0x005<<2,doc="AD5544_0 通道1、2数据")

  val AD5544_DATA_0_TEMP = DATA_TEMP0.field(16 bits,RW,0,"ad5544_0 通道1数据")
  val AD5544_DATA_0 = RegNextWhen(AD5544_DATA_0_TEMP,io.output_enable).asOutput() init 0

  val AD5544_DATA_1_TEMP = DATA_TEMP0.field(16 bits,RW,0,"ad5544_0 通道2数据")
  val AD5544_DATA_1 = RegNextWhen(AD5544_DATA_1_TEMP,io.output_enable).asOutput() init 0

  val DATA_TEMP0_isWriting = Reg(Bool()) init False
  when(DATA_TEMP0.hitDoWrite){
    DATA_TEMP0_isWriting := True
  }elsewhen(io.receive_done){
    DATA_TEMP0_isWriting := False
  }

  val DATA_TEMP1 = busslave.newReg(doc="AD5544_0 通道3、4数据")

  val AD5544_DATA_2_TEMP = DATA_TEMP1.field(16 bits,RW,0,"ad5544_0 通道3数据")
  val AD5544_DATA_2 = RegNextWhen(AD5544_DATA_2_TEMP,io.output_enable).asOutput() init 0

  val AD5544_DATA_3_TEMP = DATA_TEMP1.field(16 bits,RW,0,"ad5544_0 通道4数据")
  val AD5544_DATA_3 = RegNextWhen(AD5544_DATA_3_TEMP,io.output_enable).asOutput() init 0

  val DATA_TEMP1_isWriting = Reg(Bool()) init False
  when(DATA_TEMP1.hitDoWrite){
    DATA_TEMP1_isWriting := True
  }elsewhen(io.receive_done){
    DATA_TEMP1_isWriting := False
  }

  val Triger_0 = RegNext((DATA_TEMP0_isWriting | DATA_TEMP1_isWriting) & io.output_enable) init False
  val AD5544_0_Triger = (Triger_0|Delay(Triger_0,1)|Delay(Triger_0,2)|Delay(Triger_0,3)).asOutput()
}
