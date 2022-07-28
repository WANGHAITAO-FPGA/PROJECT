package ENDAT

import PHPA82.regFileGen.regInsert
import spinal.core._
import spinal.lib.bus.amba3.apb._
import spinal.lib._

object EndatConfig{
  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

case class Apb_Endat(moduleName:String,baseaddr:Long) extends Component{
  val io = new Bundle{
    val apb  = slave(Apb3(EndatConfig.getApb3Config()))
    val endat = master(EndatInterface())
    val endat_postion = out Bits(38 bits)
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val ctrl = Apb3SlaveFactory(io.apb)

//    val endat = new Endat(30,6,38,3000)
//    endat.io.endat <> io.endat
//    endat.io.sample := True
//    endat.io.endat_mode := B"000111"
//
//    val endat_postion = Reg(Bits(38 bits)) init 0
//    when(!(ctrl.isReading(0)|ctrl.isReading(4)|ctrl.isReading(8))){
//      endat_postion := endat.io.postion
//    }
//    io.endat_postion := endat.io.postion
//


    val endat = new Endat_Ctrl(25,6,38,3000)
    endat.io.endat <> io.endat

    val endat_postion = Reg(Bits(38 bits)) init 0
    val endat_index = Reg(Bool()) init False

    when(!((io.apb.PADDR === 0)||(io.apb.PADDR === 4)||(io.apb.PADDR === 8))){
      endat_postion := endat.io.postion
    }otherwise{
      endat_postion := endat_postion
    }
    io.endat_postion := endat.io.postion
    endat_index := endat.io.index

    ctrl.read(endat_postion.asBits(37 downto 32), 0,bitOffset = 0,documentation = "endat_postion光栅尺数据—高6位")
    ctrl.read(endat_postion.asBits(31 downto 16), 4,bitOffset = 0,documentation = "endat_postion光栅尺数据—中16位")
    ctrl.read(endat_postion.asBits(15 downto 0), 8,bitOffset = 0,documentation = "endat_postion光栅尺数据—低16位")
    ctrl.read(endat_index.asBits(0 downto 0), 12,bitOffset = 0,documentation = "endat_postion光栅尺数据—低16位")
    ctrl.addDataModel(moduleName,baseaddr)
  }

}
