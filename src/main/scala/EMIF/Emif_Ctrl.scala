package EMIF

import spinal.core._
import spinal.lib.io._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Decoder, Apb3Gpio, Apb3SlaveFactory}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.com.uart.{Apb3UartCtrl, Uart, UartCtrlGenerics, UartCtrlInitConfig, UartCtrlMemoryMappedConfig, UartParityType, UartStopType}

import scala.collection.mutable.ArrayBuffer

case class SramLayout(addressWidth: Int, dataWidth : Int) {
  val capacity = BigInt(1) << (addressWidth + log2Up(dataWidth/8))
}

case class SramInterface(g : SramLayout) extends Bundle with IMasterSlave{
  val emif_addr = UInt((g.addressWidth) bits)
  val emif_data = TriState(Bits(g.dataWidth bits))
  val emif_cs  = Bool
  val emif_we  = Bool
  val emif_oe  = Bool

  override def asMaster(): Unit = {
    in(emif_addr,emif_cs,emif_we,emif_oe)
    master(emif_data)
  }
}

/*
 * gpioRead  -> 0x00 Read only register to read the physical pin values
 * gpioWrite -> 0x04 Read-Write register to access the output values
 * gpioDirection -> 0x08 Read-Write register to set the GPIO pin directions. When set, the corresponding pin is set as output.
 **/

case class apb3Gpio(gpioWidth: Int, withReadSync : Boolean) extends Component {

  val io = new Bundle {
    val apb  = slave(Apb3(Apb3Gpio.getApb3Config()))
    val gpio = master(TriStateArray(gpioWidth bits))
    val value = out Bits(gpioWidth bits)
  }

  io.value := (if(withReadSync) BufferCC(io.gpio.read) else io.gpio.read)

  val ctrl = Apb3SlaveFactory(io.apb)
  ctrl.read(io.value, 0)
  ctrl.driveAndRead(io.gpio.write, 4)
  ctrl.driveAndRead(io.gpio.writeEnable, 8)
  io.gpio.writeEnable.getDrivingReg init(0)
}



class Emif_Apb(sramLayout : SramLayout) extends Component {
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val apb = master(Apb3(Apb3Config(addressWidth = sramLayout.addressWidth,dataWidth = sramLayout.dataWidth)))
  }
  noIoPrefix()

  val penable = Reg(Bool()) init False

  penable := (!io.emif.emif_oe)|(!io.emif.emif_we)

  io.apb.PADDR := io.emif.emif_addr
  io.apb.PSEL := ~(io.emif.emif_cs.asBits)
  io.apb.PENABLE := Mux(penable.rise(),penable,False)
  io.apb.PWRITE := (!io.emif.emif_we)&io.emif.emif_oe

  io.emif.emif_data.writeEnable := !io.emif.emif_oe
  io.emif.emif_data.write := RegNextWhen(io.apb.PRDATA,!io.emif.emif_oe)

  io.apb.PWDATA := io.emif.emif_data.read
}


class Emif_Ctrl(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val gpioA = master(TriStateArray(16 bits))
    val uart = master(Uart())
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val uartCtrlConfig = UartCtrlMemoryMappedConfig(
    uartCtrlConfig = UartCtrlGenerics(
      dataWidthMax      = 8,
      clockDividerWidth = 20,
      preSamplingSize   = 1,
      samplingSize      = 3,
      postSamplingSize  = 1
    ),
    initConfig = UartCtrlInitConfig(
      baudrate = 3000000,
      dataLength = 7,  //7 => 8 bits
      parity = UartParityType.NONE,
      stop = UartStopType.ONE
    ),
    busCanWriteClockDividerConfig = false,
    busCanWriteFrameConfig = false,
    txFifoDepth = 16,
    rxFifoDepth = 16
  )

  val systemClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset,
    frequency = FixedFrequency(100 MHz)
  )

  val area = new ClockingArea(systemClockDomain){

    val emif_interface = new Emif_Apb(sramLayout)

    io.emif <> emif_interface.io.emif

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val gpioACtrl = apb3Gpio(gpioWidth = 16, withReadSync = true)
    io.gpioA <> gpioACtrl.io.gpio
    apbMapping += gpioACtrl.io.apb -> (0x00000, 4 kB)

    val uartCtrl = Apb3UartCtrl(uartCtrlConfig)
    uartCtrl.io.uart <> io.uart
    apbMapping += uartCtrl.io.apb  -> (0x10000, 4 kB)

    val apbDecoder = Apb3Decoder(
      master = emif_interface.io.apb,
      slaves = apbMapping
    )
  }
}


class Top(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val top_emif = master(SramInterface(sramLayout))
    val top_gpioA = master(TriStateArray(16 bits))
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val systemClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset,
    frequency = FixedFrequency(100 MHz)
  )

  val area = new ClockingArea(systemClockDomain) {

    val emif_Ctrl = new Emif_Ctrl(sramLayout)

    io.top_emif <> emif_Ctrl.io.emif
    io.clk <> emif_Ctrl.io.clk
    io.reset <> emif_Ctrl.io.reset
    io.top_gpioA <> emif_Ctrl.io.gpioA

    val temp = Bool()

    temp := emif_Ctrl.io.uart.txd

    emif_Ctrl.io.uart.rxd := temp

    val tt = Reg(Bool())
    tt := ~tt
  }
}

object Top extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(InOutWrapper(new Top(SramLayout(32,32))))
}
