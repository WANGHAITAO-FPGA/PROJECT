package MDCB_2

import CRCCORE.CRCCombinationalCore.Register
import PHPA82.{AD7606_DATA, Ad5544Interface, Ad7606Interface, BISS_Position, BissCInterface, EncoderInterface, Encoder_Top, dac_ad5544}
import spinal.core._
import spinal.lib.{BufferCC, Fragment, Stream, master, slave}


class Mdcb_Top(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int, ad5544_num : Int, ad7606_num : Int, bissc_num : Int, endcoder_num : Int) extends Component{
  val io = new Bundle{
    val intput = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val AD5544 = Seq.fill(ad5544_num)(master(Ad5544Interface()))
    val AD7606 = Seq.fill(ad7606_num)(master(Ad7606Interface()))
    val BISSC = Seq.fill(bissc_num)(master(BissCInterface()))
    val ENCODER = Seq.fill(endcoder_num)(master(EncoderInterface()))
    val M_Fault_TTL = in Bits(8 bits)
    val FPGA_DI = in  Bits(16 bits)
    val M_EN_TTL = out Bits(8 bits)
    val FPGA_DO = out  Bits(16 bits)
    val clk = in Bool()
    val reset = in Bool()
    val clk_80M = in Bool()
    val clk_160M = in Bool()
    val slaveid = in Bits(datawidth bits)
  }
  noIoPrefix()

  val mdcb_clkdomain = ClockDomain(io.clk,io.reset)

  val adda_clkdomain = ClockDomain(io.clk_80M,io.reset)

  val mdcb_area = new ClockingArea(mdcb_clkdomain){

    val mdcbRxPreamble = new MdcbRxPreamble(datawidth)
    mdcbRxPreamble.io.addAttribute("keep","true")
    mdcbRxPreamble.io.input << io.intput

    val mdcbrxsimplebus = new MdcbRxSimpleBus(addrwidth,datawidth)
    mdcbrxsimplebus.io.addAttribute("keep","true")
    mdcbrxsimplebus.io.input << mdcbRxPreamble.io.output

    val mdcbtxsimplebus = new MdcbTxSimpleBus(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int)
    mdcbtxsimplebus.io.addAttribute("keep","true")
    io.output << mdcbtxsimplebus.io.output
    mdcbtxsimplebus.io.timer_tick := True

    val mdcbregif = new Mdcb_Regif(addrwidth,datawidth,ad5544_num,ad7606_num,bissc_num,endcoder_num)
    mdcbregif.io.addAttribute("keep","true")
    mdcbregif.io.simplebus.WADDR := mdcbrxsimplebus.io.waddr
    mdcbregif.io.simplebus.WDATA := mdcbrxsimplebus.io.wdata
    mdcbregif.io.simplebus.WENABLE := mdcbrxsimplebus.io.wenable
    mdcbregif.io.simplebus.RADDR := mdcbtxsimplebus.io.RADDR
    mdcbregif.io.simplebus.RENABLE := mdcbtxsimplebus.io.RENABLE
    mdcbtxsimplebus.io.RDATA := mdcbregif.io.simplebus.RDATA
    mdcbregif.io.slaveid := io.slaveid

    val adda_area = new ClockingArea(adda_clkdomain){
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
        ad5544(i).io.AD5544_DATA_IN1 := mdcbregif.io.AD5544_DATA(i)(0).asUInt
        ad5544(i).io.AD5544_DATA_IN2 := mdcbregif.io.AD5544_DATA(i)(1).asUInt
        ad5544(i).io.AD5544_DATA_IN3 := mdcbregif.io.AD5544_DATA(i)(2).asUInt
        ad5544(i).io.AD5544_DATA_IN4 := mdcbregif.io.AD5544_DATA(i)(3).asUInt
        ad5544(i).io.ad5544_trig := mdcbregif.io.AD5544_TRIGER(i)
      }

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

        mdcbregif.io.AD7606_DATA(i)(0) :=  ad7606(i).io.ad_ch1_o.asBits
        mdcbregif.io.AD7606_DATA(i)(1) :=  ad7606(i).io.ad_ch2_o.asBits
        mdcbregif.io.AD7606_DATA(i)(2) :=  ad7606(i).io.ad_ch3_o.asBits
        mdcbregif.io.AD7606_DATA(i)(3) :=  ad7606(i).io.ad_ch4_o.asBits
        mdcbregif.io.AD7606_DATA(i)(4) :=  ad7606(i).io.ad_ch5_o.asBits
        mdcbregif.io.AD7606_DATA(i)(5) :=  ad7606(i).io.ad_ch6_o.asBits
        mdcbregif.io.AD7606_DATA(i)(6) :=  ad7606(i).io.ad_ch7_o.asBits
        mdcbregif.io.AD7606_DATA(i)(7) :=  ad7606(i).io.ad_ch8_o.asBits
      }

      val bissc = Seq.fill(bissc_num)(new BISS_Position)
      for(i <- 0 until bissc_num){
        bissc(i).clk := io.clk_80M
        bissc(i).reset := io.reset
        bissc(i).enc_data := io.BISSC(i).enc_data
        io.BISSC(i).enc_clk := bissc(i).enc_clk
        bissc(i).sample_en := True
        mdcbregif.io.BissC_Pos(i) := bissc(i).enc_position_out.asBits
      }

      val encoder = Seq.fill(endcoder_num)(new Encoder_Top)
      for(i <- 0 until endcoder_num){
        encoder(i).io.clk := io.clk_80M
        encoder(i).io.reset := io.reset
        encoder(i).io.clk_160M := io.clk_160M
        encoder(i).io.encoderinterface := io.ENCODER(i)
        mdcbregif.io.Encoder_Pos(i) := encoder(i).io.encoder_position_out
        encoder(i).io.encoder_clr_in := mdcbregif.io.Encoder_Clr(i).asBool
        mdcbregif.io.Encoder_Zero_Keep(i) := encoder(i).io.encoder_iphase_out.asBits
        mdcbregif.io.Encoder_lock_Pos(i) := encoder(i).io.encoder_lock_pos
      }
    }

    val mdcb_iofilter = new Mdcb_Ioin_Filter(4)
    mdcb_iofilter.io.M_Fault_TTL := io.M_Fault_TTL
    mdcb_iofilter.io.FPGA_DI := io.FPGA_DI
    mdcbregif.io.M_Fault_TTL_Filter := mdcb_iofilter.io.M_Fault_TTL_Filter
    mdcbregif.io.FPGA_DI_Filter := mdcb_iofilter.io.FPGA_DI_Filter

    io.M_EN_TTL := mdcbregif.io.M_EN_TTL
    io.FPGA_DO := mdcbregif.io.FPGA_DO
  }
}

object Mdcb_Top extends App{
  //SpinalConfig().addStandardMemBlackboxing(blackboxAll).generateVerilog(new Mdcb_Top(8,32,500,0,50,3,2,4,4))
  SpinalVerilog(new Mdcb_Top(9,32,500,0,50,3,2,4,4))
}

object Mdcb_Test{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Mdcb_Top(9,32,500,0,50,3,2,4,4)){dut=>
      dut.mdcb_area.clockDomain.forkStimulus(10)
      dut.io.slaveid #= 0x03
      dut.io.ENCODER(0).encoder_iphase #= false
      dut.io.ENCODER(1).encoder_iphase #= false
      dut.io.ENCODER(2).encoder_iphase #= false
      dut.io.M_Fault_TTL #= 0x55
      dut.io.FPGA_DI #= 0x5555
      dut.mdcb_area.clockDomain.waitSampling(20)
      dut.io.output.ready #= true
      dut.mdcb_area.clockDomain.waitSampling(2000)
    }
  }
}