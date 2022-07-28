package YW_PROJ

import PHPA82.ila_test.ila
import PHPA82.regFileGen
import PHPA82.regFileGen.regInsert
import SRIO.{AxiConfig, Intitaor, Intitaor_Interface, SrioFtype, SrioTtype, Tx_Buffer, Tx_Buffer_Adapt, UserCmd}
import spinal.core.{Bits, SpinalEnum, _}
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.bus.misc.BusSlaveFactory

object Srio_Config{
  def getApb3Config() = Apb3Config(addressWidth = 8,dataWidth = 16)
}

case class Intitaor_Ctrl() extends Bundle{
  val user_addr  = in Bits(34 bits)
  val user_ftype = in UInt(4 bits)
  val user_ttype = in UInt(4 bits)
  val user_size  = in Bits(8 bits)
  val user_prio  = in Bits(2 bits)
  val user_tid   = in Bits(8 bits)
  val user_stream = slave(Stream(Bits(Srio_Config.getApb3Config().dataWidth bits)))
  val send_start = in Bool()
  val flush = in Bool()
  val user_rdstream = master(Stream(Bits(Srio_Config.getApb3Config().dataWidth bits)))
  val rx_flush = in Bool()

    def driveFrom(bus: BusSlaveFactory) = new Area{
      bus.driveAndRead(flush,   0x000, 0,"clear fifo stream") init True
      bus.read(user_stream.ready, 0x004, 1,"user_stream.ready singal")
      user_stream << bus.createAndDriveFlow(Bits(Srio_Config.getApb3Config().dataWidth bits), 0x08).toStream
      bus.driveAndRead(user_tid,0x00c, 0,"user_tid")
      bus.driveAndRead(user_ftype,0x010, 0,"user_ftype")
      bus.driveAndRead(user_ttype,0x014, 0,"user_ttype")
      bus.driveAndRead(user_prio,0x018, 0,"user_prio")
      bus.driveAndRead(user_size,0x01c, 0,"user_size")
      bus.driveAndRead(user_addr(33 downto 32),0x020, 0,"user_addr")
      bus.driveAndRead(user_addr(31 downto 16),0x024, 0,"user_addr")
      bus.driveAndRead(user_addr(15 downto 0),0x028, 0,"user_addr")
      val S_start = Reg(Bool()) init False
      S_start := bus.isWriting(0x02c)
      send_start := S_start || Delay(S_start,1,init = False)

      bus.driveAndRead(rx_flush,   0x030, 0,"clear fifo stream") init True
      user_rdstream.ready := False
      bus.onRead(0x34){user_rdstream.ready := True}
      bus.read(user_rdstream.payload, 0x34)
    }


}

case class Srio_Intitaor(SrioCd : ClockDomain, BufferByteSize : Int) extends Component{
  val io = new Bundle{
    val ctrl = new Intitaor_Ctrl()
    val intiator = master(Intitaor_Interface())
  }
  noIoPrefix()

  val ctrlClockDomain = this.clockDomain

  val txReset = ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.isResetActive || io.ctrl.flush,
    clockDomain = SrioCd
  )
  val SrioClockDomain = SrioCd.copy(reset = txReset)

  val txFrontend = new Area{
    val stream_adapt = Tx_Buffer_Adapt(
      Cd = ctrlClockDomain.copy(softReset = io.ctrl.flush),
      pushWidth = Srio_Config.getApb3Config().dataWidth,
      popWidth = 64,
      byteSize = BufferByteSize
    )
    stream_adapt.io.push.stream << io.ctrl.user_stream

    val buffer = StreamFifoCC(Bits(64 bits),BufferByteSize,ctrlClockDomain.copy(softReset = io.ctrl.flush),SrioClockDomain)

    buffer.io.push << stream_adapt.io.pop.stream
  }

  val srio_area = new ClockingArea(SrioClockDomain){
    val intitaor = new Intitaor(64)
    intitaor.io.intiator <> io.intiator
    intitaor.io.usercmd.user_addr := io.ctrl.user_addr       addTag(crossClockDomain)
    intitaor.io.usercmd.user_ftype := io.ctrl.user_ftype.as(SrioFtype())   addTag(crossClockDomain)
    intitaor.io.usercmd.user_ttype := io.ctrl.user_ttype.as(SrioTtype())   addTag(crossClockDomain)
    intitaor.io.usercmd.user_tid := io.ctrl.user_tid   addTag(crossClockDomain)
    intitaor.io.usercmd.user_size := io.ctrl.user_size   addTag(crossClockDomain)
    intitaor.io.usercmd.user_prio := io.ctrl.user_prio   addTag(crossClockDomain)
    intitaor.io.send_start := io.ctrl.send_start         addTag(crossClockDomain)
    intitaor.io.usercmd.user_data << txFrontend.buffer.io.pop
  }

  val rxFrontend = new Area{
    val buffer = StreamFifoCC(Bits(64 bits),BufferByteSize,SrioClockDomain,ctrlClockDomain.copy(softReset = io.ctrl.rx_flush))
    buffer.io.push << srio_area.intitaor.io.iresp_stream

    val rx_buffer = StreamFifoCC(Bits(16 bits),BufferByteSize,ctrlClockDomain.copy(softReset = io.ctrl.rx_flush),ctrlClockDomain.copy(softReset = io.ctrl.rx_flush))
    StreamWidthAdapter(buffer.io.pop,rx_buffer.io.push)

    io.ctrl.user_rdstream << rx_buffer.io.pop
  }

//  val ila_probe=ila("1",io.ctrl.user_rdstream.valid,io.ctrl.user_rdstream.ready,io.ctrl.user_rdstream.payload,rxFrontend.buffer.io.push.valid,
//    rxFrontend.buffer.io.push.ready,rxFrontend.buffer.io.push.payload,rxFrontend.buffer.io.pop.ready,rxFrontend.buffer.io.pop.valid,rxFrontend.buffer.io.pop.payload,
//    srio_area.intitaor.io.iresp_stream.ready,srio_area.intitaor.io.iresp_stream.valid,srio_area.intitaor.io.iresp_stream.payload)
}

case class Apb_Intitaor(SrioCd : ClockDomain, BufferByteSize : Int) extends Component{
  val io = new Bundle{
    val apb  = slave(Apb3(Srio_Config.getApb3Config()))
    val intiator = master(Intitaor_Interface())
  }
  noIoPrefix()

  val intitaor_ctrl = new Srio_Intitaor(SrioCd,BufferByteSize)

  intitaor_ctrl.io.intiator <> io.intiator

  val busCtrl = Apb3SlaveFactory(io.apb)
  val bridge = intitaor_ctrl.io.ctrl.driveFrom(busCtrl)
}

object Apb_Intitaor extends App{
  SpinalVerilog(new Apb_Intitaor(ClockDomain.external("srio_clk"),64))
}

object Intitaor_Sim{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb_Intitaor(ClockDomain.external("srio_clk",withReset = false),64)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10)
      dut.intitaor_ctrl.SrioCd.forkStimulus(8)
      dut.io.intiator.intiator_req_stream.ready #= true
      val srioapb = new Apb3Driver(dut.io.apb,dut.clockDomain)
      srioapb.write(0,1)
      srioapb.write(0,0)
      srioapb.write(4,0x0708)
      srioapb.write(4,0x0506)
      srioapb.write(4,0x0304)
      srioapb.write(4,0x0102)
      srioapb.write(8,0x5554)
      srioapb.write(12,0x0107)
      srioapb.write(16,0x0001)
      srioapb.write(20,0x0203)
      srioapb.write(24,0x0405)
      srioapb.write(28,0x0001)
      dut.clockDomain.waitSampling(1000)
      srioapb.write(0,1)
      srioapb.write(0,0)
      srioapb.write(4,0x1718)
      srioapb.write(4,0x1516)
      srioapb.write(4,0x1314)
      srioapb.write(4,0x1112)
      srioapb.write(8,0x5554)
      srioapb.write(12,0x0107)
      srioapb.write(16,0x0001)
      srioapb.write(20,0x0203)
      srioapb.write(24,0x0405)
      srioapb.write(28,0x0001)
      dut.clockDomain.waitSampling(1000)
    }
  }
}