package SDAC_2

import ENDAT.{Endat, EndatInterface}
import MDCB_2.{MdcbRxPreamble, MdcbRxSimpleBus, MdcbTxSimpleBus, Mdcb_Ioin_Filter, Mdcb_Regif}
import PHPA82.{AD7606_DATA, Ad5544Interface, Ad7606Interface, BISS_Position, BissCInterface, EncoderInterface, Encoder_Top, dac_ad5544}
import spinal.core._
import spinal.lib.com.uart.Uart
import spinal.lib.io.InOutWrapper
import spinal.lib.{Fragment, Stream, master, slave}

class Sdac_Top(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int, endat_num : Int, ad7606_num : Int, bissc_num : Int, endcoder_num : Int, ssi_num : Int,  uartreg_num : Int, ad5544_num : Int) extends Component{
  val io = new Bundle{
    val intput = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val AD7606 = Seq.fill(ad7606_num)(master(Ad7606Interface()))
    val BISSC = Seq.fill(bissc_num)(master(BissCInterface()))
    val ENCODER = Seq.fill(endcoder_num)(master(EncoderInterface()))
    val AD5544 = Seq.fill(ad5544_num)(master(Ad5544Interface()))
    val M_Fault_TTL = in Bits(8 bits)
    val FPGA_DI = in  Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out  Bits(16 bits)
    val clk = in Bool()
    val reset = in Bool()
    val clk_80M = in Bool()
    val clk_160M = in Bool()
    val slaveid = in Bits(datawidth bits)
    val ENDAT = Seq.fill(endat_num)(master(EndatInterface()))
    //val uart  = master(Uart())
    val EtherCAT_DATA = in (Vec(Bits(32 bits),12))
    val uart_regin = in (Vec(Bits(16 bits),uartreg_num))
  }
  noIoPrefix()

  val sdac_clkdomain = ClockDomain(io.clk,io.reset)

  val ad_clkdomain = ClockDomain(io.clk_80M,io.reset)

  val sdac_area = new ClockingArea(sdac_clkdomain){
    val sdacRxPreamble = new SdacRxPreamble(datawidth)
    sdacRxPreamble.io.addAttribute("keep","true")
    sdacRxPreamble.io.input << io.intput
    sdacRxPreamble.io.slave_id := io.slaveid

    val sdacrxsimplebus = new SdacRxSimpleBus(addrwidth,datawidth)
    sdacrxsimplebus.io.addAttribute("keep","true")
    sdacrxsimplebus.io.input << sdacRxPreamble.io.output

    val sdactxsimplebus = new SdacTxSimpleBus(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int)
    sdactxsimplebus.io.addAttribute("keep","true")
    io.output << sdactxsimplebus.io.output
    sdactxsimplebus.io.timer_tick := True

    /*val sdacurat = new Sdac_Uart(32,32,4000,uartreg_num,false)
    sdacurat.io.uart <> io.uart*/

    val sdacregif = new Sdac_Regif(addrwidth,datawidth,endat_num,ad7606_num,bissc_num,endcoder_num, uartreg_num, ad5544_num)
    sdacregif.io.addAttribute("keep","true")
    sdacregif.io.simplebus.WADDR := sdacrxsimplebus.io.waddr
    sdacregif.io.simplebus.WDATA := sdacrxsimplebus.io.wdata
    sdacregif.io.simplebus.WENABLE := sdacrxsimplebus.io.wenable
    sdacregif.io.simplebus.RADDR := sdactxsimplebus.io.RADDR
    sdacregif.io.simplebus.RENABLE := sdactxsimplebus.io.RENABLE
    sdactxsimplebus.io.RDATA := sdacregif.io.simplebus.RDATA
    sdacregif.io.slaveid := io.slaveid
    //sdacregif.io.uart_regin := sdacurat.io.uart_regout
    sdacregif.io.uart_regin := io.uart_regin
    sdacregif.io.EtherCAT_DATA := io.EtherCAT_DATA

    val ad_area = new ClockingArea(ad_clkdomain){
      val ad7606 = Seq.fill(ad7606_num)(new AD7606_DATA)
      for(i <- 0 until ad7606_num){
        ad7606(i).io.clk := io.clk_80M
        ad7606(i).io.reset := io.reset
        io.AD7606(i).ad_cs := ad7606(i).io.ad_cs
        io.AD7606(i).ad_os := ad7606(i).io.ad_os
        io.AD7606(i).ad_rd := ad7606(i).io.ad_rd
        io.AD7606(i).ad_convsta := ad7606(i).io.ad_convsta
        io.AD7606(i).ad_convstb := ad7606(i).io.ad_convstb
        io.AD7606(i).ad_reset := ad7606(i).io.ad_reset
        io.AD7606(i).ad_range := ad7606(i).io.ad_range

        ad7606(i).io.ad_busy := io.AD7606(i).ad_busy
        ad7606(i).io.first_data := io.AD7606(i).first_data
        ad7606(i).io.ad_data := io.AD7606(i).ad_data

        ad7606(i).io.sample_en := True

        sdacregif.io.AD7606_DATA(i)(0) :=  ad7606(i).io.ad_ch1_o.asBits
        sdacregif.io.AD7606_DATA(i)(1) :=  ad7606(i).io.ad_ch2_o.asBits
        sdacregif.io.AD7606_DATA(i)(2) :=  ad7606(i).io.ad_ch3_o.asBits
        sdacregif.io.AD7606_DATA(i)(3) :=  ad7606(i).io.ad_ch4_o.asBits
        sdacregif.io.AD7606_DATA(i)(4) :=  ad7606(i).io.ad_ch5_o.asBits
        sdacregif.io.AD7606_DATA(i)(5) :=  ad7606(i).io.ad_ch6_o.asBits
        sdacregif.io.AD7606_DATA(i)(6) :=  ad7606(i).io.ad_ch7_o.asBits
        sdacregif.io.AD7606_DATA(i)(7) :=  ad7606(i).io.ad_ch8_o.asBits
      }

      val bissc = Seq.fill(bissc_num)(new BISS_Position)
      for(i <- 0 until bissc_num){
        bissc(i).clk := io.clk_80M
        bissc(i).reset := io.reset
        bissc(i).enc_data := io.BISSC(i).enc_data
        io.BISSC(i).enc_clk := bissc(i).enc_clk
        bissc(i).sample_en := True
        sdacregif.io.BissC_Pos(i) := bissc(i).enc_position_out.asBits
      }

      val encoder = Seq.fill(endcoder_num)(new Encoder_Top(false))
      for(i <- 0 until endcoder_num){
        encoder(i).io.clk := io.clk_80M
        encoder(i).io.reset := io.reset
        encoder(i).io.clk_160M := io.clk_160M
        encoder(i).io.encoderinterface := io.ENCODER(i)
        sdacregif.io.Encoder_Pos(i) := encoder(i).io.encoder_position_out
        encoder(i).io.encoder_clr_in := sdacregif.io.Encoder_Clr(i).asBool
        sdacregif.io.Encoder_Zero_Keep(i) := encoder(i).io.encoder_iphase_out.asBits
        sdacregif.io.Encoder_lock_Pos(i) := encoder(i).io.encoder_lock_pos
      }

      val endat = Seq.fill(endat_num)((new Endat(20,6,38,3000)))
      for(i <- 0 until endat_num){
        endat(i).io.endat <> io.ENDAT(i)
        endat(i).io.endat_mode := B"000111"
        endat(i).io.sample := True
        sdacregif.io.Endat_Data(i) := endat(i).io.postion(33 downto 2)  addTag(crossClockDomain)
      }

      val ad5544 = Seq.fill(ad5544_num)(new dac_ad5544)
      for(i <- 0 until ad5544_num){
        ad5544(i).io.clk := io.clk_80M
        ad5544(i).io.reset := io.reset
        io.AD5544(i).AD5544_SCLK := ad5544(i).io.AD5544_SCLK
        io.AD5544(i).AD5544_CS := ad5544(i).io.AD5544_CS
        io.AD5544(i).AD5544_LDAC := ad5544(i).io.AD5544_LDAC
        io.AD5544(i).AD5544_RS := ad5544(i).io.AD5544_RS
        io.AD5544(i).AD5544_SDIN := ad5544(i).io.AD5544_SDIN
        io.AD5544(i).AD5544_MSB := ad5544(i).io.AD5544_MSB
        ad5544(i).io.AD5544_DATA_IN1 := sdacregif.io.AD5544_DATA(i)(0).asUInt
        ad5544(i).io.AD5544_DATA_IN2 := sdacregif.io.AD5544_DATA(i)(1).asUInt
        ad5544(i).io.AD5544_DATA_IN3 := sdacregif.io.AD5544_DATA(i)(2).asUInt
        ad5544(i).io.AD5544_DATA_IN4 := sdacregif.io.AD5544_DATA(i)(3).asUInt
        ad5544(i).io.ad5544_trig := sdacregif.io.AD5544_TRIGER(i)
      }
    }

    val mdcb_iofilter = new Mdcb_Ioin_Filter(40)
    mdcb_iofilter.io.M_Fault_TTL := io.M_Fault_TTL
    mdcb_iofilter.io.FPGA_DI := io.FPGA_DI
    sdacregif.io.M_Fault_TTL_Filter := mdcb_iofilter.io.M_Fault_TTL_Filter
    sdacregif.io.FPGA_DI_Filter := mdcb_iofilter.io.FPGA_DI_Filter

    io.M_EN_TTL := sdacregif.io.M_EN_TTL
    io.FPGA_DO := sdacregif.io.FPGA_DO
  }
}

object Sdac_Top extends App{
  SpinalConfig(headerWithDate = true,targetDirectory = "E:/E200I/OLD_VERSION/E200I_SDAC_V1.05/MDCB_2.srcs/sources_1/imports/untitled2/").generateVerilog((new Sdac_Top(10,32,6250,0,62,4,3,4,4,0,8,0)))
}