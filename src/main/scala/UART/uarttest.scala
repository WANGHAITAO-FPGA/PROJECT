package UART

import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Decoder}
import spinal.lib.com.uart.{Apb3UartCtrl, UartCtrlGenerics, UartCtrlInitConfig, UartCtrlMemoryMappedConfig, UartParityType, UartStopType}
import spinal.lib.slave
import spinal.core.sim._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver

class uartlookback(addressWidth: Int, dataWidth: Int) extends Component {
  val uartCtrlConfig = UartCtrlMemoryMappedConfig(
    uartCtrlConfig = UartCtrlGenerics(
      dataWidthMax = 8,
      clockDividerWidth = 20,
      preSamplingSize = 1,
      samplingSize = 3,
      postSamplingSize = 1
    ),
    initConfig = UartCtrlInitConfig(
      baudrate = 3000000,
      dataLength = 7, //7 => 8 bits
      parity = UartParityType.NONE,
      stop = UartStopType.ONE
    ),
    busCanWriteClockDividerConfig = false,
    busCanWriteFrameConfig = false,
    txFifoDepth = 16,
    rxFifoDepth = 16
  )

  val io = new Bundle{
    val apb = slave(Apb3(Apb3Config(addressWidth = addressWidth,dataWidth = dataWidth)))
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val apbClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset,
    config = ClockDomainConfig(resetActiveLevel = LOW),
    frequency = FixedFrequency(100 MHz)
  )

  val apbarea = new ClockingArea(apbClockDomain){
    val uartCtrl = Apb3UartCtrl(uartCtrlConfig)
    uartCtrl.io.uart.rxd := uartCtrl.io.uart.txd

    val apbDecoder = Apb3Decoder(
      master = io.apb,
      slaves = List(
        uartCtrl.io.apb  -> (0x0000, 100 Bytes)
      )
    )
  }
}

/*object uartlookback extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new uartlookback(20, 32))
}*/

object uartlookback{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new uartlookback(20, 32)){dut=>
      dut.apbarea.clockDomain.forkStimulus(10)
      dut.apbarea.clockDomain.waitSampling(10)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).write(0x04,0x02)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).write(0x00,0x01020304)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).write(0x00,0x05060708)
      dut.apbarea.clockDomain.waitSampling(1000)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x04)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x00)
      Apb3Driver(dut.io.apb,dut.apbClockDomain).read(0x00)
      dut.apbarea.clockDomain.waitSampling(100)
    }
  }
}