package SDCR

import ENDAT.{Endat, EndatInterface, Endat_Ctrl}
import MDCB_2.Mdcb_Ioin_Filter
import PHPA82.{EncoderInterface, Encoder_Top}
import SDAC_2.{SdacRxPreamble, SdacRxSimpleBus, SdacTxSimpleBus, Sdac_Regif}
import spinal.core._
import spinal.lib.{Fragment, Stream, master, slave}

case class Sdcr_Top(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int, endat_num : Int, temp_num : Int, endcoder_num : Int) extends Component{
  val io = new Bundle{
    val intput = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val ENDAT = Seq.fill(endat_num)(master(EndatInterface()))
    val ENCODER = Seq.fill(endcoder_num)(master(EncoderInterface()))
    val slaveid = in Bits(datawidth bits)
    val Press_Data = in Vec(Bits(32 bits),5)
    val Temp_Data = Seq.fill(temp_num)(in Bits(32 bits))
    val M_Fault_TTL = in Bits(8 bits)
    val FPGA_DI = in  Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out  Bits(16 bits)
    val clk = in Bool()
    val clk_80M = in Bool()
    val clk_160M = in Bool()
    val reset = in Bool()
  }
  noIoPrefix()

  val sdcr_clkdomain = ClockDomain(io.clk,io.reset)

  val sdcr_area = new ClockingArea(sdcr_clkdomain){
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

    val sdacregif = new Sdcr_Regif(addrwidth,datawidth,endat_num,temp_num,endcoder_num)
    sdacregif.io.addAttribute("keep","true")
    sdacregif.io.simplebus.WADDR := sdacrxsimplebus.io.waddr
    sdacregif.io.simplebus.WDATA := sdacrxsimplebus.io.wdata
    sdacregif.io.simplebus.WENABLE := sdacrxsimplebus.io.wenable
    sdacregif.io.simplebus.RADDR := sdactxsimplebus.io.RADDR
    sdacregif.io.simplebus.RENABLE := sdactxsimplebus.io.RENABLE
    sdactxsimplebus.io.RDATA := sdacregif.io.simplebus.RDATA
    sdacregif.io.slaveid := io.slaveid
    sdacregif.io.Press_Data := io.Press_Data
    for(i <- 0 until temp_num){
      sdacregif.io.Temp_Data(i) := io.Temp_Data(i)
    }


    val endat = Seq.fill(endat_num)((new Endat_Ctrl(25,6,38,3000)))
    for(i <- 0 until endat_num){
      endat(i).io.endat <> io.ENDAT(i)
      sdacregif.io.Endat_Data(i) := endat(i).io.postion
      sdacregif.io.Endat_Index(i) := endat(i).io.index
    }

    val mdcb_iofilter = new Mdcb_Ioin_Filter(40)
    mdcb_iofilter.io.M_Fault_TTL := io.M_Fault_TTL
    mdcb_iofilter.io.FPGA_DI := io.FPGA_DI
    sdacregif.io.M_Fault_TTL_Filter := mdcb_iofilter.io.M_Fault_TTL_Filter
    sdacregif.io.FPGA_DI_Filter := mdcb_iofilter.io.FPGA_DI_Filter

    io.M_EN_TTL := sdacregif.io.M_EN_TTL
    io.FPGA_DO := sdacregif.io.FPGA_DO
  }

  val encoder_clkdomain = ClockDomain(io.clk_80M,io.reset)

  val encoder_area = new ClockingArea(encoder_clkdomain){
    val encoder = Seq.fill(endcoder_num)(new Encoder_Top(false))
    for(i <- 0 until endcoder_num){
      encoder(i).io.clk := io.clk_80M
      encoder(i).io.reset := io.reset
      encoder(i).io.clk_160M := io.clk_160M
      encoder(i).io.encoderinterface := io.ENCODER(i)
      sdcr_area.sdacregif.io.Encoder_Pos(i) := encoder(i).io.encoder_position_out
      encoder(i).io.encoder_clr_in := sdcr_area.sdacregif.io.Encoder_Clr(i).asBool
      sdcr_area.sdacregif.io.Encoder_Zero_Keep(i) := encoder(i).io.encoder_iphase_out.asBits
      sdcr_area.sdacregif.io.Encoder_lock_Pos(i) := encoder(i).io.encoder_lock_pos
    }
  }

}

object Sdcr_Top extends App{
  SpinalConfig(headerWithDate = true,targetDirectory = "E:/E200I/OLD_VERSION/E200I_SDCR/MDCB_2.srcs/sources_1/imports/SRIO").generateVerilog(new Sdcr_Top(10,32,6250,0,62,4,4,4))
}
