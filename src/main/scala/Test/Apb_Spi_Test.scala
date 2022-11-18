package Test

import spinal.core._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.com.spi.{SpiMaster, SpiMasterCtrl, SpiMasterCtrlGenerics, SpiMasterCtrlMemoryMappedConfig}
import spinal.lib.{master, slave}

object SpiConfig{

  def getApb3Config() = Apb3Config(addressWidth = 8,dataWidth = 32)
}

case class Apb_Spi_Test(ssWidth : Int) extends Component{
  val io = new Bundle{
    val spi = master(SpiMaster(ssWidth))
    val apb  = slave(Apb3(SpiConfig.getApb3Config))
  }
  noIoPrefix()

  val spictrl = new SpiMasterCtrl(SpiMasterCtrlGenerics(ssWidth = ssWidth,timerWidth = 10,dataWidth = 16))
  val factory = Apb3SlaveFactory(io.apb)
  spictrl.io.driveFrom(factory)(SpiMasterCtrlMemoryMappedConfig(SpiMasterCtrlGenerics(ssWidth = ssWidth,timerWidth = 10,dataWidth = 16)))
  spictrl.io.spi <> io.spi
}

object Apb_Spi_Test extends App{
  SpinalVerilog(new Apb_Spi_Test(1))
}

object Apb_Spi_Sim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb_Spi_Test(1)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10)
      val apbsim = Apb3Driver(dut.io.apb,dut.clockDomain)
      apbsim.write(8,1)
      apbsim.write(16,8)
      apbsim.write(20,5)
      apbsim.write(24,0)
      apbsim.write(12,4)
      apbsim.write(0,0x11000000)
      apbsim.write(0,0x00001155)
      apbsim.write(0,0x00000011)
      apbsim.write(0,0x10000000)
      dut.clockDomain.waitSampling(1000)

      apbsim.write(0,0x11000000)
      apbsim.write(0,0x00551155)
      apbsim.write(0,0x00000011)
      apbsim.write(0,0x10000000)
      dut.clockDomain.waitSampling(1000)
    }
  }
}
