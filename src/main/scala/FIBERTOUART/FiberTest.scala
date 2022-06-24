package FIBERTOUART

import SimpleBus._
import Test.Test_TxSimpleBus
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.{Fragment, Stream, master, slave}

case class Uart_Test(datawidth : Int) extends Component{
  val io = new Bundle{
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val slave_id = in Bits(datawidth bits)
  }
  noIoPrefix()

  val tx_simplebus = new Test_TxSimpleBus(12,32,50000000,0,64)
  io.output << tx_simplebus.io.output
  tx_simplebus.io.timer_tick := True

  val fiberTest_rom = new FiberTest_Rom(12,32)
  fiberTest_rom.io.slave_id := io.slave_id
  fiberTest_rom.io.simplebus.WADDR := 0
  fiberTest_rom.io.simplebus.WDATA := 0
  fiberTest_rom.io.simplebus.WENABLE := False
  fiberTest_rom.io.simplebus.RADDR := tx_simplebus.io.RADDR
  fiberTest_rom.io.simplebus.RENABLE := tx_simplebus.io.RENABLE
  tx_simplebus.io.RDATA := fiberTest_rom.io.simplebus.RDATA
}


case class FiberTest_Rom(addrwidth : Int, datawidth : Int) extends Component {
  val io = new Bundle {
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth, datawidth)))
    val slave_id = in Bits(datawidth bits)
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus, (0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc = "帧头")
  val HEADER = My_Reg_HEADER.field(32 bits, RO, 0, "帧头")
  HEADER := 0x00F1F2F3

  val My_Reg_Slaveid = busslave.newReg(doc = "板卡识别号")
  val Slaveid = My_Reg_Slaveid.field(32 bits, RO, 0, "板卡识别号")
  Slaveid := io.slave_id

  val Uart_Reg = (0 until 7).map{i=>
    val uart_data1 = busslave.newReg(s"uart_data1")
    val uart_addr = uart_data1.fieldAt(0,bc = 16 bits,RO,0,s"uart_addr")
    uart_addr := B"16'x01"
    val uart_function = uart_data1.fieldAt(16,bc = 8 bits,RO,0,s"uart_function")
    uart_function := B"8'x03"
    val uart_slaveid =  uart_data1.fieldAt(24,bc = 8 bits,RO,0,s"uart_slaveid")
    uart_slaveid := i + 1

    val uart_data2 = busslave.newReg(s"uart_data2")
    val crc_data = uart_data2.fieldAt(0,bc = 16 bits,RO,0,s"crc_data")
    crc_data := B"x95cb"
    val reg_num = uart_data2.fieldAt(16,bc = 16 bits,RO,0,s"reg_num")
    reg_num := 2

    val My_Reg_Reserve1 = busslave.newReg(doc="Reserve")
    val Reserve1 = My_Reg_Reserve1.field(32 bits,RW,0x00,"Reserve")

    val My_Reg_Reserve2 = busslave.newReg(doc="Reserve")
    val Reserve2 = My_Reg_Reserve2.field(32 bits,RW,0x00,"Reserve")

    val My_Reg_Reserve3 = busslave.newReg(doc="Reserve")
    val Reserve3 = My_Reg_Reserve3.field(32 bits,RW,0x00,"Reserve")

    val My_Reg_Reserve4 = busslave.newReg(doc="Reserve")
    val Reserve4 = My_Reg_Reserve4.field(32 bits,RW,0x00,"Reserve")

    val My_Reg_Reserve5 = busslave.newReg(doc="Reserve")
    val Reserve5 = My_Reg_Reserve5.field(32 bits,RW,0x00,"Reserve")

    val My_Reg_Reserve6 = busslave.newReg(doc="Reserve")
    val Reserve6 = My_Reg_Reserve6.field(32 bits,RW,0x00,"Reserve")
  }
}

object Uart_Test{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Uart_Test(32)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.output.ready #= true
      dut.clockDomain.waitSampling(10)

      dut.clockDomain.waitSampling(5000)
    }
  }
}