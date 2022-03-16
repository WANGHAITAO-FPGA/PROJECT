package SimpleBus

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.bus.regif.AccessType.RW
import spinal.lib.bus.regif.{BusIf, BusInterface, ClassName, RegInst, SymbolName}

import scala.collection.mutable.ListBuffer

case class SimpleBusConfig(
                            addressWidth  : Int,
                            dataWidth     : Int
                          )

object SimpleBus{
  def apply(addressWidth: Int, dataWidth: Int) = new SimpleBus(SimpleBusConfig(addressWidth = addressWidth, dataWidth = dataWidth))
}

case class SimpleBus(config: SimpleBusConfig) extends Bundle with IMasterSlave{
  val RADDR   = UInt(config.addressWidth bits)
  val RDATA   = Bits(config.dataWidth bits)
  val RENABLE = Bool()
  val WADDR   = UInt(config.addressWidth bits)
  val WDATA   = Bits(config.dataWidth bits)
  val WENABLE = Bool()

  override def asMaster(): Unit = {
    out(WADDR, WDATA, WENABLE, RADDR, RENABLE)
    in(RDATA)
  }
}

case class SimpleBusInterface(bus: SimpleBus, sizeMap: SizeMapping, regPre: String = "")(implicit moduleName: ClassName) extends BusIf{
  override def getModuleName = moduleName.name

  val readError = Bool()
  val readData  = Bits(bus.config.dataWidth bits)

  readError.setAsReg() init False
  readData.setAsReg()  init 0

  val askWrite  = (bus.WENABLE).allowPruning()
  val askRead   = (bus.RENABLE).allowPruning()
  val doWrite   = (bus.WENABLE).allowPruning()
  val doRead    = (bus.RENABLE).allowPruning()
  val writeData = bus.WDATA

  bus.RDATA := readData

  override def readAddress()  = bus.RADDR
  override def writeAddress() = bus.WADDR

  override def readHalt()  = bus.RENABLE := False
  override def writeHalt() = bus.WENABLE := False

  override def busDataWidth   = bus.config.dataWidth
}

object SpBusInterface {
  def apply(bus: SimpleBus, sizeMap: SizeMapping)(implicit moduleName: ClassName): BusIf = SimpleBusInterface(bus, sizeMap)(moduleName)
}


class SimpleBusDemo extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(16,32)))
  }
  noIoPrefix()
  val busslave = SpBusInterface(io.simplebus,(0x0000, 100 Byte))
  val M_REG0  = busslave.newReg(doc="REG0")
  val reg0 = M_REG0.field(32 bits,RW,0,"TEST").asOutput()
  val wr_reg0 = M_REG0.hitDoWrite.asOutput()
  val M_REG1  = busslave.newReg(doc="REG1")
}


object SimpleBusDemo extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(new SimpleBusDemo)
}
