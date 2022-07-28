package YW_PROJ

import PHPA82.regFileGen.regInsert
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.slave

object ApbRegConfig{
  def getApb3Config() = Apb3Config(addressWidth = 8,dataWidth = 16)
}

case class Apb_Reg(moduleName:String,baseaddr:Long) extends Component{
  val io = new Bundle{
    val apb  = slave(Apb3(ApbRegConfig.getApb3Config()))
    val srio_status = in Bits(16 bits)
    val srio_postion = in Bits(64 bits)
  }
  noIoPrefix()

  val ctrl = Apb3SlaveFactory(io.apb)

  val srio_postion = Reg(Bits(64 bits)) init 0
  when(!(ctrl.isReading(4)|ctrl.isReading(8)|ctrl.isReading(12)|ctrl.isReading(16))){
    srio_postion := io.srio_postion
  }

  ctrl.read(io.srio_status, 0,documentation = "srio status,bit 0 port_initialized, bit 1 link_initialized")
  ctrl.read(srio_postion(63 downto 48), 4,documentation = "上位机下发的位置值，Bit63 to Bit48")
  ctrl.read(srio_postion(47 downto 32), 8,documentation = "上位机下发的位置值，Bit47 to Bit32")
  ctrl.read(srio_postion(31 downto 16), 12,documentation = "上位机下发的位置值，Bit31 to Bit16")
  ctrl.read(srio_postion(15 downto 0), 16,documentation = "上位机下发的位置值，Bit15 to Bit0")

  ctrl.addDataModel(moduleName,baseaddr)
}