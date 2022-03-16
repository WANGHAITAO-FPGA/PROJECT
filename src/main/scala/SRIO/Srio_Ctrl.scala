package SRIO

import spinal.core._
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.{Fragment, ResetCtrl, StreamFifoCC, StreamWidthAdapter, master, slave}

case class Srio_Ctrl() extends Bundle{
  val request = new Bundle{
    val ireq = new Bundle{
      val cmd = in Bits(32 bits)
      val startaddr = in Bits(32 bits)
      val datastream = slave Stream (Bits(32 bits))
      val start = in Bool()
      val flush = in Bool()
      //val stream = master Stream Fragment(Bits(64 bits))
      val src_id = in Bits(16 bits)
      val dest_id = in Bits(16 bits)
      //val tuser = out Bits(32 bits)
    }
    val iresp = new Bundle{
      //val stream = slave Stream Fragment(Bits(64 bits))
      val datastream = master Stream (Bits(32 bits))
    }
  }
  /*val response = new Bundle{
    val tresp = new Bundle{
      //val stream = master Stream Fragment(Bits(64 bits))
    }
    val treq = new Bundle{
      //val stream = slave Stream Fragment(Bits(64 bits))
      //val tuser = in Bits(32 bits)
    }
  }*/

  def driveFrom(bus: BusSlaveFactory) = new Area{
    request.ireq.datastream << bus.createAndDriveFlow(Bits(32 bits), 0x00).toStream         //txdata_stream
    bus.driveAndRead(request.ireq.flush, 0x04, 0) init(True)                              //tx_flush bit 0
    //bus.driveAndRead(request.ireq.start, 0x04, 1) init(False)                             //tx_start bit 1
    bus.read(request.ireq.datastream.ready,0x04, 2)
    bus.driveAndRead(request.ireq.cmd,0x08,0)                                             //tx_cmd
    bus.driveAndRead(request.ireq.startaddr,0x0c,0)                                       //tx_startaddr
    bus.driveAndRead(request.ireq.src_id,0x10,0)                                          //tx_srcid
    bus.driveAndRead(request.ireq.dest_id,0x10,16)                                        //tx_destid
    request.ireq.start := bus.isWriting(0x14)

    request.iresp.datastream.ready := False
    bus.onRead(0x20){request.iresp.datastream.ready := True}
    bus.read(request.iresp.datastream.payload, 0x20)
  }
}

case class Srio(buscd : ClockDomain, sriocd : ClockDomain, byteSize : Int) extends Component{
  val io = new Bundle{
    val ctrl = new Srio_Ctrl()
    /************************initiator request*******************************/
    val ireq_stream = master Stream Fragment(Bits(64 bits))
    val ireq_tuser = out Bits(32 bits)
    val iresp_stream = slave Stream Fragment(Bits(64 bits))
    /************************target response*******************************/
    val treq_stream = slave Stream Fragment(Bits(64 bits))
    val treq_tuser = in Bits(32 bits)
    val tresp_stream = master Stream Fragment(Bits(64 bits))
  }
  noIoPrefix()

  /*********************************request_ireq****************************************/
  val ctrlClockDomain = this.clockDomain
  val busReset = ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.isResetActive || io.ctrl.request.ireq.flush,
    clockDomain = buscd
  )
  val busClockDomain = buscd.copy(reset = busReset)

  val srioClockDomain = sriocd.copy(reset = busReset)


  val txFront = busClockDomain on new Area {
    val srio_txbuffer = StreamFifoCC(Bits(64 bits),byteSize,buscd,sriocd)
    StreamWidthAdapter(io.ctrl.request.ireq.datastream,srio_txbuffer.io.push)
  }

  val txBack = srioClockDomain on new Area {
    val srio_request = new SrioRequest
    srio_request.io.user_tid := io.ctrl.request.ireq.cmd(31 downto 24)  addTag(crossClockDomain)
    srio_request.io.user_ftype := io.ctrl.request.ireq.cmd(23 downto 20)  addTag(crossClockDomain)
    srio_request.io.user_ttype := io.ctrl.request.ireq.cmd(19 downto 16)  addTag(crossClockDomain)
    srio_request.io.user_size := io.ctrl.request.ireq.cmd(15 downto 8) addTag(crossClockDomain)
    srio_request.io.user_prio := io.ctrl.request.ireq.cmd(1 downto 0) addTag(crossClockDomain)
    srio_request.io.user_addr := io.ctrl.request.ireq.startaddr.resize(34 bits) addTag(crossClockDomain)
    srio_request.io.send_start := io.ctrl.request.ireq.start addTag(crossClockDomain)
    srio_request.io.user_data << txFront.srio_txbuffer.io.pop
    srio_request.io.ireq <> io.ireq_stream
    io.ireq_tuser := io.ctrl.request.ireq.src_id ## io.ctrl.request.ireq.dest_id
  }
  /*********************************request_iresp****************************************/
  val rxFront = srioClockDomain on new Area {
    txBack.srio_request.io.iresp <> io.iresp_stream
    val srio_iresprxbuffer = StreamFifoCC(Bits(64 bits),byteSize,sriocd,buscd)
    srio_iresprxbuffer.io.push << txBack.srio_request.io.iresp_stream
  }

  val rxBack = busClockDomain on new Area {
    StreamWidthAdapter(rxFront.srio_iresprxbuffer.io.pop,io.ctrl.request.iresp.datastream)
  }
  /*********************************response****************************************/
  val resp = srioClockDomain on new Area {
    val srio_response = new SrioResponse(8, 0)
    srio_response.io.tresp <> io.tresp_stream
    srio_response.io.treq <> io.treq_stream
    srio_response.io.treq_tuser <> io.treq_tuser
  }
}



/*
case class Srio_Ctrl(buscd : ClockDomain, sriocd : ClockDomain, byteSize : Int) extends Component{
  val request = new Bundle{
    val ireq = new Bundle{
      val cmd = in Bits(32 bits)
      val startaddr = in Bits(32 bits)
      val datastream = slave Stream (Bits(32 bits))
      val start = in Bool()
      val flush = in Bool()
      val stream = master Stream Fragment(Bits(64 bits))
      val src_id = in Bits(16 bits)
      val dest_id = in Bits(16 bits)
      val tuser = out Bits(32 bits)
    }
    val iresp = new Bundle{
      val stream = slave Stream Fragment(Bits(64 bits))
      val datastream = master Stream (Bits(32 bits))
    }
  }
  val response = new Bundle{
    val tresp = new Bundle{
      val stream = master Stream Fragment(Bits(64 bits))
    }
    val treq = new Bundle{
      val stream = slave Stream Fragment(Bits(64 bits))
      val tuser = in Bits(32 bits)
    }
  }
  noIoPrefix()
  /*********************************request_ireq****************************************/
  val ctrlClockDomain = this.clockDomain
  val busReset = ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.isResetActive || request.ireq.flush,
    clockDomain = buscd
  )
  val busClockDomain = buscd.copy(reset = busReset)

  val srioClockDomain = sriocd.copy(reset = busReset)


  val txFront = busClockDomain on new Area {
    val srio_txbuffer = StreamFifoCC(Bits(64 bits),byteSize,buscd,sriocd)
    StreamWidthAdapter(request.ireq.datastream,srio_txbuffer.io.push)
  }

  val txBack = srioClockDomain on new Area {
    val srio_request = new SrioRequest
    srio_request.io.user_tid := request.ireq.cmd(31 downto 24)
    srio_request.io.user_ftype := request.ireq.cmd(23 downto 20)
    srio_request.io.user_ttype := request.ireq.cmd(19 downto 16)
    srio_request.io.user_size := request.ireq.cmd(15 downto 8)
    srio_request.io.user_prio := request.ireq.cmd(1 downto 0)
    srio_request.io.user_addr := request.ireq.startaddr.resize(34 bits)
    srio_request.io.send_start := request.ireq.start
    srio_request.io.user_data << txFront.srio_txbuffer.io.pop
    srio_request.io.ireq <> request.ireq.stream
    request.ireq.tuser := request.ireq.src_id ## request.ireq.dest_id
  }
  /*********************************request_iresp****************************************/
  val rxFront = srioClockDomain on new Area {
    txBack.srio_request.io.iresp <> request.iresp.stream
    val srio_iresprxbuffer = StreamFifoCC(Bits(64 bits),byteSize,sriocd,buscd)
    srio_iresprxbuffer.io.push << txBack.srio_request.io.iresp_stream
  }

  val rxBack = busClockDomain on new Area {
    StreamWidthAdapter(rxFront.srio_iresprxbuffer.io.pop,request.iresp.datastream)
  }
  /*********************************response****************************************/
  val resp = srioClockDomain on new Area {
    val srio_response = new SrioResponse(8, 0)
    srio_response.io.tresp <> response.tresp.stream
    srio_response.io.treq <> response.treq.stream
    srio_response.io.treq_tuser <> response.treq.tuser
  }
}*/


object Srio extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new Srio(ClockDomain.external("bus"),ClockDomain.external("srio"),128))
}