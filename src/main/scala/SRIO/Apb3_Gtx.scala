package SRIO

import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.core._
import spinal.lib.{Fragment, Stream, master, slave}
import spinal.core.sim._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver

import scala.util.Random
import scala.collection.mutable

object Apb3Axi{
  def getApb3Config = Apb3Config(
    addressWidth = 8,
    dataWidth = 16,
    selWidth = 1,
    useSlaveError = false
  )
}

class Apb3_Gtx(axiclkdomain : ClockDomain,rxBufferByteSize : Int,txBufferByteSize : Int) extends Component {
  val io = new Bundle{
    val apb =  slave(Apb3(Apb3Axi.getApb3Config))
    val axiw = master(Stream(Fragment(Bits(32 bits))))
    val axir = slave (Stream(Fragment(Bits(32 bits))))
  }
  noIoPrefix()
  val axictrl = new Gtx(axiclkdomain,axiclkdomain,rxBufferByteSize,txBufferByteSize,Apb3Axi.getApb3Config.dataWidth)
  val busCtrl = Apb3SlaveFactory(io.apb)
  val bridge = axictrl.io.axictrl.driveFrom(busCtrl)
  io.axiw <> axictrl.io.axiw
  io.axir <> axictrl.io.axir
  /*axictrl.io.axir.payload.fragment := axictrl.io.axiw.payload.fragment
  axictrl.io.axir.valid := axictrl.io.axiw.valid
  axictrl.io.axir.payload.last := axictrl.io.axiw.payload.last
  axictrl.io.axiw.ready := True*/
}

/*
object Apb3_Gtx {
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(new Apb3_Gtx(ClockDomain.external("axiclk"),256, 256))
    dut.doSim{dut =>
      dut.clockDomain.forkStimulus(10)
      dut.axictrl.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(20)
      val testapb = new Apb3Driver(dut.io.apb,dut.clockDomain)
      testapb.write(0x00,0x00)
      testapb.write(0x10,0x0080)
      testapb.write(0x00,0x01)
      testapb.write(0x00,0x00)
      dut.clockDomain.waitSampling(20)
      testapb.write(0x10,0x0060)
      testapb.write(0x10,0x0000)
      testapb.write(0x10,0x0304)
      testapb.write(0x10,0x0102)
      testapb.write(0x10,0x0708)
      testapb.write(0x10,0x0506)
      testapb.write(0x10,0x0b0c)
      testapb.write(0x10,0x090a)
      testapb.read(0x14)
      dut.clockDomain.waitSampling(50)
      testapb.read(0x14)
      dut.clockDomain.waitSampling(50)
      sleep(5000)
      testapb.read(0x24)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      testapb.read(0x20)
      sleep(5000)
    }
  }
}*/