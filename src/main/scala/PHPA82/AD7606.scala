package PHPA82

import PHPA82.regFileGen.{genRegFileByMarkdown, regInsert}
import spinal.core._
import spinal.lib.{IMasterSlave, master, slave}
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}

object Ad7606Config{

  def getApb3Config() = Apb3Config(addressWidth = 4,dataWidth = 16)
}

case class Ad7606Interface() extends Bundle with IMasterSlave{
  val ad_data = UInt(16 bits)
  val ad_busy = Bool()
  val first_data = Bool()
  val ad_os = UInt(3 bits)
  val ad_cs = Bool()
  val ad_rd = Bool()
  val ad_reset = Bool()
  val ad_convsta = Bool()
  val ad_convstb = Bool()
  val ad_range = Bool()
  override def asMaster(): Unit = {
    out(ad_os,ad_cs,ad_rd,ad_reset,ad_convsta,ad_convstb,ad_range)
    in(ad_data,ad_busy,first_data)
  }
}

class AD7606_DATA extends BlackBox {
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val sample_en = in Bool()
    val ad_data = in UInt(16 bits)
    val ad_busy = in Bool()
    val first_data = in Bool()
    val ad_os = out UInt(3 bits)
    val ad_cs = out Bool()
    val ad_rd = out Bool()
    val ad_reset = out Bool()
    val ad_convsta = out Bool()
    val ad_convstb = out Bool()
    val ad_range = out Bool()
    val ad_ch1_o = out UInt(16 bits)
    val ad_ch2_o = out UInt(16 bits)
    val ad_ch3_o = out UInt(16 bits)
    val ad_ch4_o = out UInt(16 bits)
    val ad_ch5_o = out UInt(16 bits)
    val ad_ch6_o = out UInt(16 bits)
    val ad_ch7_o = out UInt(16 bits)
    val ad_ch8_o = out UInt(16 bits)
    val ad_data_valid_o = out Bool()
  }
  noIoPrefix()

  addRTLPath("D:/SCALA/SRIO/CYP1401/AD7606_DATA.v")
}

class AD7606(moduleName:String,baseaddr:Long) extends Component {
  val io = new Bundle{
    val apb  = slave(Apb3(Ad5544Config.getApb3Config()))
    val ad7606Interface = master(Ad7606Interface())
    val clk = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val ad7606ClockDomain = ClockDomain(
    clock = io.clk,
    reset = io.reset
  )

  val area = new ClockingArea(ad7606ClockDomain){
    val ad7606_ctrl = new AD7606_DATA
    io.clk <> ad7606_ctrl.io.clk
    io.reset <> ad7606_ctrl.io.reset
    io.ad7606Interface.ad_os <> ad7606_ctrl.io.ad_os
    io.ad7606Interface.ad_cs <> ad7606_ctrl.io.ad_cs
    io.ad7606Interface.ad_rd <> ad7606_ctrl.io.ad_rd
    io.ad7606Interface.ad_busy <> ad7606_ctrl.io.ad_busy
    io.ad7606Interface.ad_convsta <> ad7606_ctrl.io.ad_convsta
    io.ad7606Interface.ad_convstb <> ad7606_ctrl.io.ad_convstb
    io.ad7606Interface.ad_reset <> ad7606_ctrl.io.ad_reset
    io.ad7606Interface.ad_range <> ad7606_ctrl.io.ad_range
    io.ad7606Interface.ad_data <> ad7606_ctrl.io.ad_data
    io.ad7606Interface.first_data <> ad7606_ctrl.io.first_data

    ad7606_ctrl.io.sample_en := True

    val data_temp_1 = Reg(UInt(16 bits)) init 0x1234
    val data_temp_2 = Reg(UInt(16 bits)) init 0x5678
    val data_temp_3 = Reg(UInt(16 bits)) init 0x0a0b
    val data_temp_4 = Reg(UInt(16 bits)) init 0x0102
    val data_temp_5 = Reg(UInt(16 bits)) init 0x0203
    val data_temp_6 = Reg(UInt(16 bits)) init 0x0304
    val data_temp_7 = Reg(UInt(16 bits)) init 0x0405
    val data_temp_8 = Reg(UInt(16 bits)) init 0x0506

    when(ad7606_ctrl.io.ad_data_valid_o){
      data_temp_1 := ad7606_ctrl.io.ad_ch1_o
      data_temp_2 := ad7606_ctrl.io.ad_ch2_o
      data_temp_3 := ad7606_ctrl.io.ad_ch3_o
      data_temp_4 := ad7606_ctrl.io.ad_ch4_o
      data_temp_5 := ad7606_ctrl.io.ad_ch5_o
      data_temp_6 := ad7606_ctrl.io.ad_ch6_o
      data_temp_7 := ad7606_ctrl.io.ad_ch7_o
      data_temp_8 := ad7606_ctrl.io.ad_ch8_o
    }

    val ctrl = Apb3SlaveFactory(io.apb)
    ctrl.read(data_temp_1, 0,bitOffset = 0,documentation = "AD7606---1通道数据")
    ctrl.read(data_temp_2, 2,bitOffset = 0,documentation = "AD7606---2通道数据")
    ctrl.read(data_temp_3, 4,bitOffset = 0,documentation = "AD7606---3通道数据")
    ctrl.read(data_temp_4, 6,bitOffset = 0,documentation = "AD7606---4通道数据")
    ctrl.read(data_temp_5, 8,bitOffset = 0,documentation = "AD7606---5通道数据")
    ctrl.read(data_temp_6, 10,bitOffset = 0,documentation = "AD7606---6通道数据")
    ctrl.read(data_temp_7, 12,bitOffset = 0,documentation = "AD7606---7通道数据")
    ctrl.read(data_temp_8, 14,bitOffset = 0,documentation = "AD7606---8通道数据")
    //ctrl.printDataModel()

    //data_temp_1.addAttribute("MARK_DEBUG","TRUE")

    ctrl.addDataModel(moduleName,baseaddr)
  }
}

/*
object AD7606 extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(100 MHz)
  ).generateVerilog(new AD7606)
}*/