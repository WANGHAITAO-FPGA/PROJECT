package SRIO

import spinal.core._
import spinal.lib.bus.amba4.axi.{Axi4Config, Axi4R, Axi4W}
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.com.eth.CrcKind
import spinal.lib.{Fragment, ResetCtrl, Stream, StreamFifoCC, StreamFragmentWidthAdapter, StreamWidthAdapter, master, slave}

object AxiConfig{
  val axi4Config = Axi4Config(
    addressWidth = 20,
    dataWidth = 32,
    idWidth = 1,
    useStrb = false,
    useId = false,
    useResp = false
  )
}

class Gtx_Ctrl(Bus_DataWidth : Int,rxBufferByteSize : Int,
               txBufferByteSize : Int) extends Bundle {
  val rx = new Bundle {
    val stream = master(Stream(Bits(Bus_DataWidth bits)))
    val flush = in Bool()
    val popOccupancy = out UInt(log2Up(rxBufferByteSize + 1) bits)
  }
  val tx = new Bundle{
    val stream = slave(Stream(Bits(Bus_DataWidth bits)))
    val flush = in Bool()
    //val availability = out UInt(log2Up(txBufferByteSize * 8 / Bus_DataWidth) + 1 bits)
  }

  def driveFrom(bus: BusSlaveFactory) = new Area{
    bus.driveAndRead(tx.flush,   0x000, 0) init(True)
    bus.read(tx.stream.ready, 0x000, 1)

    bus.driveAndRead(rx.flush,   0x000, 4) init(True)
    bus.read(rx.stream.valid, 0x000, 5)

    tx.stream << bus.createAndDriveFlow(Bits(Bus_DataWidth bits), 0x010).toStream
    //bus.read(tx.availability, 0x14)

    rx.stream.ready := False
    bus.onRead(0x20){rx.stream.ready := True}
    bus.read(rx.stream.payload, 0x20)
    bus.read(rx.popOccupancy,0x24)
  }
}

class Gtx(txCd : ClockDomain, rxCd : ClockDomain,rxBufferByteSize : Int,
          txBufferByteSize : Int, Bus_DataWidth : Int) extends Component{
  val io = new Bundle{
    val axiw = master(Stream(Fragment(Bits(AxiConfig.axi4Config.dataWidth bits))))
    val axir = slave (Stream(Fragment(Bits(AxiConfig.axi4Config.dataWidth bits))))
    val axictrl = new Gtx_Ctrl(Bus_DataWidth,rxBufferByteSize,txBufferByteSize)
    //val interrupt = out Bool()
  }
  noIoPrefix()

  val ctrlClockDomain = this.clockDomain
  val rxReset = ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.isResetActive || io.axictrl.rx.flush,
    clockDomain = rxCd
  )
  val rxClockDomain = rxCd.copy(reset = rxReset)

  val txReset = ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.isResetActive || io.axictrl.tx.flush,
    clockDomain = txCd
  )
  val txClockDomain = txCd.copy(reset = txReset)

  val txFrontend = new Area{
    val stream_adapt = Tx_Buffer_Adapt(
      Cd = ctrlClockDomain.copy(softReset = io.axictrl.tx.flush),
      pushWidth = Bus_DataWidth,
      popWidth = AxiConfig.axi4Config.dataWidth,
      byteSize = txBufferByteSize
    )
    stream_adapt.io.push.stream << io.axictrl.tx.stream

    val buffer = Tx_Buffer(
      pushCd = ctrlClockDomain.copy(softReset = io.axictrl.tx.flush),
      popCd = txClockDomain,
      Width = AxiConfig.axi4Config.dataWidth,
      byteSize = txBufferByteSize
    )
    buffer.io.push.stream << stream_adapt.io.pop.stream
  }

  val txBackend = txClockDomain on new Area{
    val crc = Tx_Crc(AxiConfig.axi4Config.dataWidth)
    crc.io.input << txFrontend.buffer.io.pop.stream

    val header = Tx_Header(AxiConfig.axi4Config.dataWidth)
    header.io.input << crc.io.output
    header.io.output >> io.axiw

    txFrontend.buffer.io.pop.redo := False
    txFrontend.buffer.io.pop.commit := RegNext(header.io.output.lastFire) init(False)
  }

  val rxFrontend = rxClockDomain on new Area{
    val preamble = Rx_Preamble(AxiConfig.axi4Config.dataWidth)
    preamble.io.input << io.axir
    //.io.input.addAttribute("MARK_DEBUG","TRUE")
    //.io.output.addAttribute("MARK_DEBUG","TRUE")

    val checker = Rx_Checker(AxiConfig.axi4Config.dataWidth)
    checker.io.input << preamble.io.output
    //checker.io.input.addAttribute("MARK_DEBUG","TRUE")

    val buffer = Rx_Buffer_Adapt(
      pushCd = rxClockDomain,
      popCd = rxClockDomain,
      pushWidth = AxiConfig.axi4Config.dataWidth,
      popWidth = Bus_DataWidth,
      byteSize = rxBufferByteSize
    )
    buffer.io.push.stream << checker.io.output
    //buffer.io.push.stream.addAttribute("MARK_DEBUG","TRUE")
    //buffer.io.pop.stream.addAttribute("MARK_DEBUG","TRUE")

    val buffer_CC = StreamFifoCC(
      dataType = Bits(Bus_DataWidth bits),
      depth = rxBufferByteSize,
      pushClock = rxClockDomain,
      popClock = ctrlClockDomain.copy(softReset = io.axictrl.rx.flush)
    )
    buffer_CC.io.push << buffer.io.pop.stream
  }

  val rxBackend = new Area{
    rxFrontend.buffer_CC.io.pop >> io.axictrl.rx.stream
    //rxFrontend.buffer_CC.io.pop.addAttribute("MARK_DEBUG","TRUE")
    //io.axictrl.rx.stream.addAttribute("MARK_DEBUG","TRUE")
    io.axictrl.rx.popOccupancy := rxFrontend.buffer_CC.io.popOccupancy
  }
}

object Gtx extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(new Gtx(ClockDomain.external("pushclk"),ClockDomain.external("popclk"),128,128,16))
}