package YW_PROJ

import ENDAT.{ENDAT_Interface, Endat_Ctrl}
import PHPA82.regFileGen.{genRegFileByMarkdown, regInsert}
import Test.{AD7606_Ctrl, Ad7606_Interface}
import spinal.core._
import spinal.lib.blackbox.xilinx.s7.IOBUF
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SlaveFactory, Axi4SpecRenamer}
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.io.{InOutWrapper, TriState}
import spinal.lib.{Flow, IMasterSlave, master, slave}

case class Yw_Bsp_Ctrl(addressWidth : Int, ad5781_num : Int, endat_num : Int) extends Component{
  val io = new Bundle{
    val ad5781 = Seq.fill(ad5781_num)(master(AD5781_Interface()))
    val ad7760 = master(AD7760_Interface())
    val ad_7606 = master(Ad7606_Interface(true))
    val endat = Seq.fill(endat_num)(master(ENDAT_Interface()))
    val ad7760_data = master(Flow(Bits(32 bits)))
    val ad7606_data = master Flow(Vec(Bits(16 bits),8))
    val endat_postion = out Vec(Bits(38 bits),endat_num)
    val da5781_data = Seq.fill(ad5781_num)(slave(Flow(Bits(18 bits))))

    def driveFrom(bus : BusSlaveFactory, baseAddress : Int = 0) = new Area {
      val ad7760_datatemp = Reg(Bits(32 bits)) init 0
      when(!bus.isReading(0)) {
        ad7760_datatemp := ad7760_data.payload
      }
      bus.read(ad7760_datatemp, 0, 0, "AD7760采集数据,bit[7:0]为status,bit[31:8]为AD采集数据")

      val ad7606_datatemp = Vec(Reg(Bits(16 bits)), 8)

      for (i <- 0 until 8) {
        when(!bus.isReading(4 * (i + 1))) {
          ad7606_datatemp(i) := ad7606_data.payload(i)
        }
        bus.read(ad7606_datatemp(i), 4 * (i + 1), 0, s"AD7606采集数据,ad7606 $i 通道采集数据")
      }

      val endat_temp = Vec(Reg(Bits(38 bits)), endat_num)
      for (i <- 0 until endat_num) {
        when((!bus.isReading(32 + 4 * (2 * i + 1))) || (!bus.isReading(32 + 4 * (2 * i + 2)))) {
          endat_temp(i) := endat_postion(i)
        }
        bus.read(endat_temp(i).asBits(37 downto 32), 32 + 4 * (2 * i + 1), 0, s"Endat采集数据,Endat $i 通道采集数据高6位")
        bus.read(endat_temp(i).asBits(31 downto 0), 32 + 4 * (2 * i + 2), 0, s"Endat采集数据,Endat $i 通道采集数据低32位")
      }

      for (i <- 0 until ad5781_num) {
        val streamUnbuffered = Vec(Flow(Bits(18 bits)), ad5781_num)
        streamUnbuffered(i).valid := bus.isWriting(80 + 4 * i)
        bus.driveAndRead(streamUnbuffered(i).payload, 80 + 4 * i, 0, s"AD5781设定电压，AD5781 $i 通道")
        da5781_data(i) << streamUnbuffered(i)
      }
    }
  }
  noIoPrefix()

  val ad7760_ctrl = new AD7760_Ctrl(5)
  io.ad7760 <> ad7760_ctrl.io.ad7760
  io.ad7760_data <> ad7760_ctrl.io.ad_data

  val ad7606_ctrl = new AD7606_Ctrl(5,20,true)
  io.ad_7606 <> ad7606_ctrl.io.ad_7606
  ad7606_ctrl.io.sample_en := True
  io.ad7606_data <> ad7606_ctrl.io.adc_data

  val endat_ctrl = Seq.fill(endat_num)(new Endat_Ctrl(18,6,38,250))
  for(i <- 0 until endat_num){
    io.endat(i) <> endat_ctrl(i).io.endat
    io.endat_postion(i) <> endat_ctrl(i).io.postion
  }

  val ad5781_ctrl = Seq.fill(ad5781_num)(AD5781_Ctrl(2))
  for(i <- 0 until ad5781_num){
    io.ad5781(i) <> ad5781_ctrl(i).io.ad5781
    ad5781_ctrl(i).io.daout_data <> io.da5781_data(i)
  }

  addPrePopTask(()=>genRegFileByMarkdown())
}

case class Apb3_Yw_Bsp(addressWidth : Int, ad5781_num : Int, endat_num : Int) extends Component{
  val io = new Bundle{
    val apb = slave(Apb3(Apb3Config(addressWidth,32)))
    val ad5781 = Seq.fill(ad5781_num)(master(AD5781_Interface()))
    val ad7760 = master(AD7760_Interface())
    val ad_7606 = master(Ad7606_Interface(true))
    val endat = Seq.fill(endat_num)(master(ENDAT_Interface()))
  }
  noIoPrefix()

  val bus_ctrl = Apb3SlaveFactory(io.apb)

  val Yw_Bsp = new Yw_Bsp_Ctrl(addressWidth, ad5781_num, endat_num)
  Yw_Bsp.io.ad7760 <> io.ad7760
  Yw_Bsp.io.ad_7606 <> io.ad_7606

  for(i <- 0 until ad5781_num){
    Yw_Bsp.io.ad5781(i) <> io.ad5781(i)
  }
  for(i <- 0 until endat_num){
    Yw_Bsp.io.endat(i) <> io.endat(i)
  }

  val bridge = Yw_Bsp.io.driveFrom(bus_ctrl)
}



case class Axi4_Yw_Bsp(addressWidth : Int, ad5781_num : Int, endat_num : Int) extends Component{
  val io = new Bundle{
    val s_axi = slave(Axi4(Axi4Config(addressWidth,32,12)))
    val ad5781 = Seq.fill(ad5781_num)(master(AD5781_Interface()))
    val ad7760 = master(AD7760_Interface())
    val ad_7606 = master(Ad7606_Interface(true))
    val endat = Seq.fill(endat_num)(master(ENDAT_Interface()))
    Axi4SpecRenamer(s_axi)
  }
  noIoPrefix()

  val bus_ctrl = Axi4SlaveFactory(io.s_axi)

  val Yw_Bsp = new Yw_Bsp_Ctrl(addressWidth, ad5781_num, endat_num)
  Yw_Bsp.io.ad7760 <> io.ad7760
  Yw_Bsp.io.ad_7606 <> io.ad_7606

  for(i <- 0 until ad5781_num){
    Yw_Bsp.io.ad5781(i) <> io.ad5781(i)
  }
  for(i <- 0 until endat_num){
    Yw_Bsp.io.endat(i) <> io.endat(i)
  }
  io.ad5781(0).addAttribute("MARK_DEBUG","TRUE")

  val bridge = Yw_Bsp.io.driveFrom(bus_ctrl)
}

object Axi4_Yw_Bsp extends App{
  SpinalConfig(headerWithDate = true,targetDirectory = "E:/YW/YW_BSP_TEST/YW_BSP_TEST.srcs/sources_1/imports/SRIO").generateVerilog(new Axi4_Yw_Bsp(10,4,4))
}
