package Test

import spinal.core._
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.com.spi.{SpiMaster, SpiMasterCmd, SpiMasterCtrl, SpiMasterCtrlCmdData, SpiMasterCtrlCmdMode, SpiMasterCtrlCmdSs, SpiMasterCtrlConfig, SpiMasterCtrlGenerics, SpiMasterCtrlMemoryMappedConfig}
import spinal.lib.{Counter, CounterFreeRun, Stream, master, slave}

case class spi_test(ssWidth : Int) extends Component{
  val io = new Bundle{
    val spi = master(SpiMaster(ssWidth))
  }
  noIoPrefix()

  val spictrl = new SpiMasterCtrl(SpiMasterCtrlGenerics(ssWidth = ssWidth,timerWidth = 10,dataWidth = 16))

  spictrl.io.cmd.valid := True
  spictrl.io.spi <> io.spi
  spictrl.io.cmd.mode := SpiMasterCtrlCmdMode.DATA
  spictrl.io.cmd.args := B"17'x05555"

  val counter =  CounterFreeRun(5000)
  when(counter.willOverflow){
    counter.clear()
    //spictrl.io.cmd.valid := True
  }

  spictrl.io.config.ss.hold := 100
  spictrl.io.config.ss.activeHigh := 0
  spictrl.io.config.ss.setup := 100
  spictrl.io.config.ss.disable := 100

  spictrl.io.config.kind.cpha := True
  spictrl.io.config.kind.cpol := False

  spictrl.io.config.sclkToogle := 100
}

object spi_test{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new spi_test(1)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10)

      dut.clockDomain.waitSampling(20000)
    }
  }
}
