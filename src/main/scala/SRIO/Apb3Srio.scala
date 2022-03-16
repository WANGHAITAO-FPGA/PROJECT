package SRIO

import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.{Fragment, master, slave}
import spinal.core.sim._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver

object Apb3Srio{
  def getApb3Config = Apb3Config(
    addressWidth = 8,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3Srio(buscd : ClockDomain, sriocd : ClockDomain, byteSize : Int) extends Component {
  val io = new Bundle{
    val apb =  slave(Apb3(Apb3Srio.getApb3Config))
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

  val busClockDomain = buscd.copy()
  val busctrl = busClockDomain on new Area{
    val srio = new Srio(buscd,sriocd,byteSize)
    val busCtrl = Apb3SlaveFactory(io.apb)
    val bridge = srio.io.ctrl.driveFrom(busCtrl)
    /************************initiator request*******************************/
    srio.io.ireq_stream <> io.ireq_stream
    srio.io.iresp_stream <> io.iresp_stream
    srio.io.ireq_tuser <> io.ireq_tuser
    /************************target response*******************************/
    srio.io.treq_stream <> io.treq_stream
    srio.io.tresp_stream <> io.tresp_stream
    srio.io.treq_tuser <> io.treq_tuser
    /************************lookback test*******************************/
    /*srio.io.treq_stream << srio.io.ireq_stream
    srio.io.iresp_stream << srio.io.tresp_stream
    srio.io.treq_tuser := srio.io.ireq_tuser*/
    /************************lookback test*******************************/
  }
}

object Apb3_Srio extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new Apb3Srio(ClockDomain.external("bus"),ClockDomain.external("srio"),128))
}

/*
object Apb3_Srio{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new Apb3Srio(ClockDomain.external("bus"),ClockDomain.external("srio"),128)){dut=>
      dut.busctrl.srio.buscd.forkStimulus(10)
      dut.busctrl.srio.sriocd.forkStimulus(20)
      dut.busctrl.srio.buscd.waitSampling(50)
      val srioapb = new Apb3Driver(dut.io.apb,dut.busctrl.srio.buscd)
      /************************doorbeel test*******************************/
      srioapb.write(0x04,0)                           ///tx_flush rest
      srioapb.write(0x08,0x11A00101)                  ///CMD
      srioapb.write(0x0c,0)                           ///addr
      srioapb.write(0x10,0x01020304)                  ///tx_srcid_destid
      srioapb.write(0x014,0x00)                        ///tx_start
      dut.busctrl.srio.buscd.waitSampling(100)
      /************************doorbeel test*******************************/

      /************************nwrite test*******************************/
      srioapb.write(0x00,0x11223344)
      srioapb.write(0x00,0x55667788)
      srioapb.write(0x04,0)                           ///tx_flush rest
      srioapb.write(0x08,0x11540101)                  ///CMD
      srioapb.write(0x0c,0x10)                        ///addr
      srioapb.write(0x10,0x01020304)                  ///tx_srcid_destid
      srioapb.write(0x014,0x00)                        ///tx_start
      dut.busctrl.srio.buscd.waitSampling(100)
      /************************nwrite test*******************************/

      /************************nread test*******************************/
      srioapb.write(0x04,0)                           ///tx_flush rest
      srioapb.write(0x08,0x11200101)                  ///CMD
      srioapb.write(0x0c,0x10)                        ///addr
      srioapb.write(0x10,0x01020304)                  ///tx_srcid_destid
      srioapb.write(0x014,0x00)                       ///tx_start
      dut.busctrl.srio.buscd.waitSampling(20)
      srioapb.read(0x20)
      //srioapb.read(0x20)
      dut.busctrl.srio.buscd.waitSampling(100)
      srioapb.read(0x20)
      srioapb.read(0x20)
      dut.busctrl.srio.buscd.waitSampling(100)
      /************************nread test*******************************/

    }
  }
}*/