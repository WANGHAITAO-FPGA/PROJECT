package MLMC300

import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.bus.misc.BusSlaveFactoryAddressWrapper
import spinal.lib.{StreamFifo, slave}

object ApbRamConfig{

  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

case class ApbRam(moduleName:String,baseaddr:Long) extends Component{
  val io = new Bundle{
    val apb  = slave(Apb3(ApbRamConfig.getApb3Config()))
  }
  noIoPrefix()

  val ctrl = Apb3SlaveFactory(io.apb)

  val stream_fifo = new StreamFifo(Bits(ApbRamConfig.getApb3Config().dataWidth bits),30720)

  stream_fifo.io.push << ctrl.createAndDriveFlow(Bits(ApbRamConfig.getApb3Config().dataWidth bits),0,0).toStream

  ctrl.driveAndRead(stream_fifo.io.flush,0x02,0) init(True)

  stream_fifo.io.pop.ready := False
  ctrl.onRead(0x04){stream_fifo.io.pop.ready := True}

  ctrl.read(stream_fifo.io.pop.payload, 0x04)
  ctrl.read(stream_fifo.io.occupancy, 0x06)
  ctrl.read(stream_fifo.io.availability, 0x08)
}

/*object ApbRam extends App {
  SpinalVerilog(new ApbRam())
}*/
