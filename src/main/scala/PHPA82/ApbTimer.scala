package PHPA82

import PHPA82.regFileGen.regInsert
import spinal.core._
import spinal.lib.bus.amba3.apb._
import spinal.lib.misc.Timer
import spinal.lib.slave

object ApbTimerCtrl{
  def getApb3Config() = new Apb3Config(
    addressWidth = 4,
    dataWidth = 16
  )
}

class ApbTimer(moduleName:String,baseaddr:Long) extends Component {
  val io = new Bundle{
    val apb = slave(Apb3(ApbTimerCtrl.getApb3Config()))
    val interrupt = out Bool()
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val timerClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset
  )

  val area = new ClockingArea(timerClockDomain){
    val timerA = Timer(16)

    val busCtrl = Apb3SlaveFactory(io.apb)

    busCtrl.drive(timerA.io.tick,0x00,bitOffset = 0,documentation = "启动定时器")
    busCtrl.driveAndRead(timerA.io.limit,0x02,bitOffset = 0,documentation = "定时器TIMER_LOAD(16位)")
    //busCtrl.driveAndRead(timerA.io.clear,0x02)
    when(timerA.io.value >= timerA.io.limit){
      timerA.io.clear := True
    }otherwise{
      timerA.io.clear := False
    }
    io.interrupt := timerA.io.full
    busCtrl.addDataModel(moduleName,baseaddr)
  }


}

/*
object ApbTimer extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(new ApbTimer)
}*/