package UART

import xilinx._
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3Decoder, Apb3Gpio}
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SharedToApb3Bridge, Axi4SlaveFactory, Axi4ToAxi4Shared}
import spinal.lib.com.uart._
import spinal.lib.io.{InOutWrapper, TriStateArray}
import spinal.lib.{master, slave}

class UartTest(addressWidth: Int, dataWidth: Int, idWidth: Int) extends Component {
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

  val axi4Config = Axi4Config(
    addressWidth = addressWidth,
    dataWidth    = dataWidth,
    idWidth      = idWidth,
    useLock      = false,
    useRegion    = false,
    useCache     = false,
    useProt      = false,
    useQos       = false
  )

  val io = new Bundle{
    val axi =  slave(Axi4(axi4Config))
    val uart = master(Uart())
    val gpio = master(TriStateArray(32 bits))
    val axiclk = in Bool()
    val axireset = in Bool()
  }
  noIoPrefix()

  val axiClockDomain = ClockDomain(
    clock = io.axiclk,
    reset = io.axireset,
    config = ClockDomainConfig(resetActiveLevel = LOW),
    frequency = FixedFrequency(100 MHz)
  )

  val axi = new ClockingArea(axiClockDomain){
    val apbBridge = Axi4SharedToApb3Bridge(
      addressWidth = addressWidth,
      dataWidth    = dataWidth,
      idWidth      = idWidth
    )
    apbBridge.io.axi <> io.axi.toShared()

    val uartCtrl = Apb3UartCtrl(uartCtrlConfig)

    val gpioCtrl = Apb3Gpio(gpioWidth = 32,withReadSync = true)

    val apbDecoder = Apb3Decoder(
      master = apbBridge.io.apb,
      slaves = List(
        gpioCtrl.io.apb  -> (0x0000, 10 Bytes),
        uartCtrl.io.apb  -> (0x0014, 20 Bytes)
      )
    )
    uartCtrl.io.uart <> io.uart
    gpioCtrl.io.gpio <> io.gpio
  }

  // Function used to rename all signals of the blackbox
  private def renameIO(): Unit = {
    io.flatten.foreach(bt => {
      if(bt.getName().contains("axi_"))
      {
        bt.setName( bt.getName().replace( "axi_", "*_")  )
        bt.setName( bt.getName().replace( "_payload_", "")  )
        bt.setName( bt.getName().replace( "_", "")  )
        bt.setName( bt.getName().replace( "*", "axi_")  )
        bt.setName("s00_" + bt.getName() )
      }
    })
  }
  // Execute the function renameIO after the creation of the component
  addPrePopTask(() => renameIO())

}


object UartTest extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true

  ).generateVerilog(new UartTest(20,32,1))
}

/*object UartTest {
  def main(args: Array[String]): Unit = {
    def VivadoSynth[T <: Component](gen: => T, name: String = "temp"): Unit = {
      val report = VivadoFlow(design = gen, name, s"E:/PHPA82/synthWorkspace/$name").doit()
      report.printArea()
      report.printFMax()
    }
    VivadoSynth(InOutWrapper((new UartTest(8,32,1))),name = "UartTest")
  }
}*/

