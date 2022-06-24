package SRIO

import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.RO
import spinal.lib.slave

case class Srio_Regif(addrwidth : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,64)))
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc="帧头")
  val HEADER = My_Reg_HEADER.field(64 bits,RO,0,"帧头")
  HEADER := B"x0000000000F1F2F3"

  val My_Reg_Slaveid = busslave.newReg(doc="Slaveid")
  val Slaveid = My_Reg_Slaveid.field(64 bits,RO,0,"Slaveid")
  Slaveid := B"x000000000000000F"

  val My_Reg_Version = busslave.newReg(doc="软件版本号")
  val Version = My_Reg_Version.field(64 bits,RO,0,"软件版本号")
  Version := B"x00202206011514"
}

object Srio_Regif extends App {
  SpinalVerilog(new Srio_Regif(10))
}