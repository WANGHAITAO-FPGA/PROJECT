package MDIO

import spinal.core._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.io.InOutWrapper
import spinal.lib.{master, slave}

object Apb3MdioCtrl {
  def getApb3Config = Apb3Config(
    addressWidth = 5,
    dataWidth = 32,
    selWidth = 1,
    useSlaveError = true
  )
}

case class Apb3Mdio() extends Component{
  val io = new Bundle{
    val apb =  slave(Apb3(Apb3MdioCtrl.getApb3Config))
    val mdio = master(Mdio())
    apb.PADDR.setName("s_apb_paddr")
    apb.PENABLE.setName("s_apb_penable")
    apb.PRDATA.setName("s_apb_prdata")
    apb.PREADY.setName("s_apb_pready")
    apb.PSEL.setName("s_apb_psel")
    apb.PSLVERROR.setName("s_apb_pslverr")
    apb.PWDATA.setName("s_apb_pwdata")
    apb.PWRITE.setName("s_apb_pwrite")
  }
  noIoPrefix()

  val mdioctrl = new MdioCtrl(10)
  val busCtrl = Apb3SlaveFactory(io.apb)
  val bridge = mdioctrl.io.driveFrom(busCtrl,0)
  io.mdio <> mdioctrl.io.mdio
}

object Apb3Mdio extends App{
  SpinalVerilog(new Apb3Mdio())
}

object Apb3Mdio_Sim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb3Mdio()){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(100)
      val apb = new Apb3Driver(dut.io.apb,dut.clockDomain)
      apb.write(8,5)
      apb.write(12,0x11111111)
      apb.write(16,1)
      apb.write(20,2)
      apb.write(24,0)
      apb.write(28,0)
      apb.write(0,0)
      dut.clockDomain.waitSampling(2000)
    }
  }
}