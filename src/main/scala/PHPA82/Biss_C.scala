package PHPA82

import PHPA82.regFileGen.{genRegFileByMarkdown, regInsert}
import spinal.core._
import spinal.lib.{IMasterSlave, master, slave}
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}

object BissCConfig{

  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

case class BissCInterface() extends Bundle with IMasterSlave{
  val enc_clk = Bool
  val enc_data = Bool
  override def asMaster(): Unit = {
    out(enc_clk)
    in(enc_data)
  }
}

class BISS_Position extends BlackBox{
  val clk = in Bool()
  val reset = in Bool()
  val enc_data = in Bool()
  val sample_en = in Bool()
  val enc_clk = out Bool()
  val enc_position_all = out UInt(41 bits)
  val enc_position_out = out UInt(32 bits)
  val erro_flag = out Bool()
  val warn_flag = out Bool()
  val crc_flag = out Bool()

  noIoPrefix()

  addRTLPath("D:/SCALA/SRIO/CYP1401/BISS_Position.v")
}


class Biss_C(moduleName:String,baseaddr:Long) extends Component {
  val io = new Bundle {
    val apb  = slave(Apb3(Ad5544Config.getApb3Config()))
    val bisscInterface = master(BissCInterface())
    val clk = in Bool()
    val reset = in Bool()
    val enc_position_all = out UInt(41 bits)
  }
  noIoPrefix()

  val bisscClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset
  )

  val area = new ClockingArea(bisscClockDomain){
    val bissc_ctrl = new BISS_Position

    io.clk <> bissc_ctrl.clk
    io.reset <> bissc_ctrl.reset
    io.bisscInterface.enc_clk <> bissc_ctrl.enc_clk
    io.bisscInterface.enc_data <> bissc_ctrl.enc_data
    io.enc_position_all := bissc_ctrl.enc_position_all

    bissc_ctrl.sample_en := True

    val ctrl = Apb3SlaveFactory(io.apb)

    val bissc_pos_reg = Reg(UInt(32 bits)) init 0

    bissc_pos_reg := bissc_ctrl.enc_position_out
    //bissc_pos_reg := 0x12345678

    val bissc_status_reg = Reg(UInt(16 bits)) init 0

    bissc_status_reg := (bissc_ctrl.erro_flag.asUInt @@ bissc_ctrl.warn_flag.asUInt @@ bissc_ctrl.crc_flag.asUInt).resize(16)
    //bissc_status_reg := 0x0a0b

    ctrl.read(bissc_pos_reg.asBits(31 downto 16), 0,bitOffset = 0,documentation = "Biss光栅尺数据—高16位")
    ctrl.read(bissc_pos_reg.asBits(15 downto 0), 2,bitOffset = 0,documentation = "Biss光栅尺数据—低16位")
    ctrl.read(bissc_status_reg.asBits, 4,bitOffset = 0,documentation = "Biss光栅尺状态，bit0---crc,bit1---warn,bit2---error")
    //ctrl.printDataModel()
    ctrl.addDataModel(moduleName,baseaddr)
  }
}

/*
object Biss_C extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(new Biss_C)
}*/
