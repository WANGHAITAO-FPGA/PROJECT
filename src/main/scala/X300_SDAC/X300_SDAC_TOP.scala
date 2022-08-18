package X300_SDAC

import ENDAT.EndatInterface
import PHPA82.{AD7606_DATA, Ad7606Interface, BissCInterface, EncoderInterface}
import SDAC_2.{SdacRxPreamble, SdacRxSimpleBus, SdacTxSimpleBus, Sdac_Regif, Sdac_Top}
import spinal.core._
import spinal.lib.io.InOutWrapper
import spinal.lib.{Counter, CounterFreeRun, Fragment, Stream, master, slave}

case class X300_SDAC_TOP(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int, endat_num : Int, ad7606_num : Int, bissc_num : Int, endcoder_num : Int, ssi_num : Int) extends Component{
  val io = new Bundle{
    val intput = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val AD7606 = Seq.fill(ad7606_num)(master(Ad7606Interface()))
    val clk = in Bool()
    val reset = in Bool()
    val clk_80M = in Bool()
    val slaveid = in Bits(datawidth bits)
    val tick = in Bool()
    val led = out Bool()
    //val temp = in Bits(32 bits)
  }
  noIoPrefix()

  val sdac_clkdomain = ClockDomain(io.clk,io.reset)

  val ad_clkdomain = ClockDomain(io.clk_80M,io.reset)

  val sdac_area = new ClockingArea(sdac_clkdomain){
    val ledtemp = Reg(Bool()) init False

    val counter =  CounterFreeRun(62500000)
    when(counter.willOverflow){
      counter.clear()
      ledtemp := ~ledtemp;
    }
    io.led := ledtemp

    val tx_tick = Reg(Bool()) init False
    val tick_count = Counter(0,25000)
    when(io.tick){
      tick_count.increment()
    }otherwise{
      tick_count.clear()
      tx_tick := False
    }
    when(tick_count.willOverflow){
      tx_tick := True
    }

    val start_send = Reg(Bool()) init False

    val sdacRxPreamble = new X300_RxPreamble(datawidth)
    sdacRxPreamble.io.addAttribute("keep","true")
    sdacRxPreamble.io.input << io.intput

    val sdacrxsimplebus = new X300_RxSimpleBus(addrwidth,datawidth)
    sdacrxsimplebus.io.addAttribute("keep","true")
    sdacrxsimplebus.io.input << sdacRxPreamble.io.output

    val sdactxsimplebus = new X300_TxSimpleBus(addrwidth : Int, datawidth : Int, timerl_imit: Int, start_addr : Int, data_length : Int)
    sdactxsimplebus.io.addAttribute("keep","true")
    io.output << sdactxsimplebus.io.output
    sdactxsimplebus.io.timer_tick := tx_tick

    val sdacregif = new X300_SdacRegif(addrwidth,datawidth,endat_num,ad7606_num,bissc_num,endcoder_num)
    //val sdacregif = new Enable_Test(addrwidth,datawidth,endat_num,ad7606_num,bissc_num,endcoder_num)
    sdacregif.io.addAttribute("keep","true")
    sdacregif.io.simplebus.WADDR := sdacrxsimplebus.io.waddr
    sdacregif.io.simplebus.WDATA := sdacrxsimplebus.io.wdata
    sdacregif.io.simplebus.WENABLE := sdacrxsimplebus.io.wenable
    sdacregif.io.simplebus.RADDR := sdactxsimplebus.io.RADDR
    sdacregif.io.simplebus.RENABLE := sdactxsimplebus.io.RENABLE
    sdactxsimplebus.io.RDATA := sdacregif.io.simplebus.RDATA
    sdacregif.io.slaveid := io.slaveid
    start_send := sdacregif.io.Start_Send
    //sdacregif.io.temp := io.temp

    val ad_area = new ClockingArea(ad_clkdomain) {
      val ad7606 = Seq.fill(ad7606_num)(new AD7606_DATA)
      for (i <- 0 until ad7606_num) {
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

        sdacregif.io.AD7606_DATA(i)(0) := ad7606(i).io.ad_ch1_o.asBits
        sdacregif.io.AD7606_DATA(i)(1) := ad7606(i).io.ad_ch2_o.asBits
        sdacregif.io.AD7606_DATA(i)(2) := ad7606(i).io.ad_ch3_o.asBits
        sdacregif.io.AD7606_DATA(i)(3) := ad7606(i).io.ad_ch4_o.asBits
        sdacregif.io.AD7606_DATA(i)(4) := ad7606(i).io.ad_ch5_o.asBits
        sdacregif.io.AD7606_DATA(i)(5) := ad7606(i).io.ad_ch6_o.asBits
        sdacregif.io.AD7606_DATA(i)(6) := ad7606(i).io.ad_ch7_o.asBits
        sdacregif.io.AD7606_DATA(i)(7) := ad7606(i).io.ad_ch8_o.asBits
      }
    }
  }
}

object X300_SDAC_TOP extends App{
  SpinalConfig(headerWithDate = true,targetDirectory = "E:/E200I/X300_ENABLE_TEST/SDAC_ENABLE_TEST/SDAC_PSD.srcs/sources_1/imports/rtl/").generateVerilog(InOutWrapper(new X300_SDAC_TOP(9,32,6250,0,60,0,3,0,0,0)))
}

object X300_SDAC_Sim{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new X300_SDAC_TOP(8,32,500,0,60,0,3,0,0,0)){dut=>
      dut.sdac_area.clockDomain.forkStimulus(8)
      dut.io.output.ready #= false
      dut.io.tick #= false
      dut.sdac_area.clockDomain.waitSampling(10)
      dut.io.tick #= true
      dut.io.output.ready #= true
      dut.sdac_area.clockDomain.waitSampling(300000)
      dut.io.tick #= false
      dut.sdac_area.clockDomain.waitSampling(100)
      dut.io.tick #= true
      dut.io.output.ready #= true
      dut.sdac_area.clockDomain.waitSampling(300000)
    }
  }
}

