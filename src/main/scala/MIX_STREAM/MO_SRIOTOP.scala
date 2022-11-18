package MIX_STREAM

import EMIF.{SramInterface, SramLayout}
import MO.Mo_Code
import SRIO.{Intitaor, SrioFtype, SrioTtype, Srio_Interface, Target}
import spinal.core._
import spinal.lib.io.InOutWrapper
import spinal.lib.misc.Timer
import spinal.lib.{Fragment, Stream, StreamFork, master, slave}

case class MO_SRIOTOP(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val hssl_sts = in Vec(Bits(32 bits),4)
    val hssl1_gtx_clk = in Bool()
    val hssl2_gtx_clk = in Bool()
    val srio_clk = in Bool()
    val clk = in Bool()
    val reset = in Bool()
    val hssl1_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl1_output = master(Stream(Fragment(Bits(32 bits))))
    val hssl2_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl2_output = master(Stream(Fragment(Bits(32 bits))))
    val hssl3_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl3_output = master(Stream(Fragment(Bits(32 bits))))
    val hssl4_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl4_output = master(Stream(Fragment(Bits(32 bits))))
    val hssl_rxdone = out Vec(Bool(),4)
    val test_data = out Bits(32 bits)
    val srio_tick = in Bool()
    val srio = master(Srio_Interface())
    val link = in Bool()
  }
  noIoPrefix()

  val hssl1_clkdomain = ClockDomain(io.hssl1_gtx_clk,io.reset)
  val hssl2_clkdomain = ClockDomain(io.hssl2_gtx_clk,io.reset)
  val srio_clkdomain = ClockDomain(io.srio_clk,io.reset)
  val common_clkdomain = ClockDomain(io.clk,io.reset)

  val hssl1_area = new ClockingArea(hssl1_clkdomain){
    val hssl1_fork = new StreamForkWithFragment(Bits(32 bits),2)
    hssl1_fork.io.input << io.hssl1_input
  }
  val hssl2_area = new ClockingArea(hssl2_clkdomain){
    val hssl2_fork = new StreamForkWithFragment(Bits(32 bits),2)
    hssl2_fork.io.input << io.hssl2_input
    val hssl3_fork = new StreamForkWithFragment(Bits(32 bits),2)
    hssl3_fork.io.input << io.hssl3_input
    val hssl4_fork = new StreamForkWithFragment(Bits(32 bits),2)
    hssl4_fork.io.input << io.hssl4_input
  }

  val common_area = new ClockingArea(common_clkdomain){
    val mo_gtxtoemif = new Mo_Code(sramLayout)
    mo_gtxtoemif.io.hssl1_input << hssl1_area.hssl1_fork.io.outputs(0)
    mo_gtxtoemif.io.hssl2_input << hssl2_area.hssl2_fork.io.outputs(0)
    mo_gtxtoemif.io.hssl3_input << hssl2_area.hssl3_fork.io.outputs(0)
    mo_gtxtoemif.io.hssl4_input << hssl2_area.hssl4_fork.io.outputs(0)
    mo_gtxtoemif.io.hssl1_gtx_clk := io.hssl1_gtx_clk
    mo_gtxtoemif.io.hssl2_gtx_clk := io.hssl2_gtx_clk
    mo_gtxtoemif.io.clk := io.clk
    mo_gtxtoemif.io.reset := io.reset
    io.hssl1_output << mo_gtxtoemif.io.hssl1_output
    io.hssl2_output << mo_gtxtoemif.io.hssl2_output
    io.hssl3_output << mo_gtxtoemif.io.hssl3_output
    io.hssl4_output << mo_gtxtoemif.io.hssl4_output
    mo_gtxtoemif.io.hssl_sts := io.hssl_sts
    mo_gtxtoemif.io.emif <> io.emif
    io.hssl_rxdone := mo_gtxtoemif.io.hssl_rxdone
    io.test_data := mo_gtxtoemif.io.test_data
  }

  val srio_area = new ClockingArea(srio_clkdomain){
    val srio_send = new Srio_SendTop(hssl1_clkdomain,hssl2_clkdomain,srio_clkdomain,2500)
    srio_send.io.hssl1_input << hssl1_area.hssl1_fork.io.outputs(1)
    srio_send.io.hssl2_input << hssl2_area.hssl2_fork.io.outputs(1)
    srio_send.io.hssl3_input << hssl2_area.hssl3_fork.io.outputs(1)
    srio_send.io.hssl4_input << hssl2_area.hssl4_fork.io.outputs(1)
    srio_send.io.hssl1_slaveid := B"32'x00"
    srio_send.io.hssl2_slaveid := B"32'x00"
    srio_send.io.hssl3_slaveid := B"32'x00"
    srio_send.io.hssl4_slaveid := B"32'x04"
    srio_send.io.hssl1_header := B"64'x0060_0000_A000_0000"
    srio_send.io.hssl2_header := B"64'x0060_0000_A001_0000"
    srio_send.io.hssl3_header := B"64'x0060_0000_A002_0000"
    srio_send.io.hssl4_header := B"64'x0060_0000_A003_0000"
    srio_send.io.hssl1_doorbellinfo := B"64'x00A0_0200_0001_0000"
    srio_send.io.hssl2_doorbellinfo := B"64'x00A0_0200_0002_0000"
    srio_send.io.hssl3_doorbellinfo := B"64'x00A0_0200_0003_0000"
    srio_send.io.hssl4_doorbellinfo := B"64'x00A0_0200_0004_0000"
    srio_send.io.timer_tick := io.srio_tick

    val timer = Timer(32)
    timer.io.tick := io.link
    timer.io.limit := 6250
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }

    val moreg = new MO_Regif(8)

    val target = new Target(8,0)
    target.io.target <> io.srio.target
    target.io.simplebus <> moreg.io.simplebus

//    val intitaor = new Intitaor(64)
//    intitaor.io.intiator <> io.srio.intiator
//    intitaor.io.send_start := timer.io.full
//    intitaor.io.usercmd.user_ftype := SrioFtype.DOORB
//    intitaor.io.usercmd.user_ttype := SrioTtype.TNDATA
//    intitaor.io.usercmd.user_tid := B"8'xFF"
//    intitaor.io.usercmd.user_prio := 0
//    intitaor.io.usercmd.user_addr := 0
//    intitaor.io.usercmd.user_data.valid := False
//    intitaor.io.usercmd.user_data.payload := 0
//    intitaor.io.usercmd.user_size := 0
    io.srio.intiator.intiator_req_stream.valid := timer.io.full
    io.srio.intiator.intiator_req_stream.payload.fragment := B"64'xFFA0_0200_0001_0000"
    io.srio.intiator.intiator_req_stream.payload.last := timer.io.full
    srio_send.io.srio_output.ready := io.srio.intiator.intiator_req_stream.ready
    io.srio.intiator.intiator_req_common.tkeep := B"8'xFF"
    io.srio.intiator.intiator_req_common.tuser := B"32'x008100DD"
    io.srio.intiator.intiator_resp_stream.ready := True
  }
}

object MO_SRIOTOP extends App{
  SpinalConfig(anonymSignalPrefix = "temp",headerWithDate = true,targetDirectory = "E:/X300_20220810/X300_OldMO_SRIO_1.00/X300_MO/X300_MO.srcs/sources_1/imports/SRIO/").generateVerilog(InOutWrapper(new MO_SRIOTOP(SramLayout(24,16))))
}

//object fork_test{
//  import spinal.core.sim._
//
//  def main(args: Array[String]): Unit = {
//    SimConfig.withWave.doSim(new StreamForkWithFragment(Bits(32 bits),2)){dut=>
//      dut.io.input.valid #= false
//      dut.io.input.payload.last #= false
//      dut.io.outputs(0).ready #= true
//      dut.io.outputs(1).ready #= true
//      dut.clockDomain.forkStimulus(8)
//      dut.clockDomain.waitSampling(20)
//      dut.io.input.valid #= true
//      dut.io.input.payload.fragment #= 0x02
//      dut.clockDomain.waitSampling()
//      dut.io.input.valid #= true
//      dut.io.input.payload.fragment #= 0x03
//      dut.clockDomain.waitSampling()
//      dut.io.input.valid #= true
//      dut.io.input.payload.fragment #= 0x04
//      dut.io.input.payload.last #= true
//      dut.clockDomain.waitSampling()
//      dut.io.input.valid #= false
//      dut.io.input.payload.last #= false
//      dut.clockDomain.waitSampling(1000)
//    }
//  }
//}