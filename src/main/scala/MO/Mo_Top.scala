package MO

import EMIF.{EMIF32_Apb, SramInterface, SramLayout}
import PHPA82.ila_test.ila
import spinal.core._
import spinal.core.sim.SimConfig
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Decoder}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.io.InOutWrapper
import spinal.lib.{Fragment, Stream, master, slave}
import spinal.core.sim._

import scala.collection.mutable.ArrayBuffer

/**
 * 实现功能：1)与DSP进行EMIF通讯
 *         2)实现4通道光纤数据收发功能
 * @param Mo_Code Top主函数入口
 */

class Mo_Code(sramLayout : SramLayout) extends Component {
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val hssl_sts = in Vec(Bits(32 bits),4)
    val hssl1_gtx_clk = in Bool()
    val hssl2_gtx_clk = in Bool()
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
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val emif32_toapb = new EMIF32_Apb(sramLayout)
    emif32_toapb.io.emif <> io.emif
//    emif32_toapb.io.emif.addAttribute("MARK_DEBUG","TRUE")
//    emif32_toapb.io.apb.addAttribute("MARK_DEBUG","TRUE")

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val hssl1_csr_reg = new Apb_CsrReg
    hssl1_csr_reg.io.hssl_sts := io.hssl_sts(0)
    apbMapping += hssl1_csr_reg.io.apb-> (0x010000, 16 Bytes)
   // hssl1_csr_reg.io.hssl_ctl_send.addAttribute("MARK_DEBUG","TRUE")

    val hssl2_csr_reg = new Apb_CsrReg
    hssl2_csr_reg.io.hssl_sts := io.hssl_sts(1)
    apbMapping += hssl2_csr_reg.io.apb-> (0x010040, 16 Bytes)

    val hssl3_csr_reg = new Apb_CsrReg
    hssl3_csr_reg.io.hssl_sts := io.hssl_sts(2)
    apbMapping += hssl3_csr_reg.io.apb-> (0x010080, 16 Bytes)

    val hssl4_csr_reg = new Apb_CsrReg
    hssl4_csr_reg.io.hssl_sts := io.hssl_sts(3)
    apbMapping += hssl4_csr_reg.io.apb-> (0x0100c0, 16 Bytes)

    val hssl1_txram = new Apb_TxRam(8)
    hssl1_txram.io.tx_clk := io.hssl1_gtx_clk
    hssl1_txram.io.clk := io.clk
    hssl1_txram.io.reset := io.reset
    hssl1_txram.io.tx_id := 0x000000b1
    hssl1_txram.io.tx_packet_req := hssl1_csr_reg.io.hssl_ctl_send
    hssl1_txram.io.tx_packet_trigger := hssl1_csr_reg.io.hssl_ctl_trigger
    io.hssl1_output << hssl1_txram.io.output
    apbMapping += hssl1_txram.io.apb -> (0x0010c00, 1024 Bytes)
    //hssl1_txram.io.apb.addAttribute("MARK_DEBUG","TRUE")

    val hssl1_rxram = new Apb_RxRAM(8)
    hssl1_rxram.io.rx_clk := io.hssl1_gtx_clk
    hssl1_rxram.io.clk := io.clk
    hssl1_rxram.io.reset := io.reset
    hssl1_rxram.io.rx_id := 0x000000b1
    hssl1_rxram.io.input << io.hssl1_input
    apbMapping += hssl1_rxram.io.apb -> (0x0010800, 1024 Bytes)
    io.hssl_rxdone(0) := hssl1_rxram.io.gtp_rx_done

    val hssl2_txram = new Apb_TxRam(8)
    hssl2_txram.io.tx_clk := io.hssl2_gtx_clk
    hssl2_txram.io.clk := io.clk
    hssl2_txram.io.reset := io.reset
    hssl2_txram.io.tx_id := 0x000000b2
    hssl2_txram.io.tx_packet_req := hssl2_csr_reg.io.hssl_ctl_send
    hssl2_txram.io.tx_packet_trigger := hssl2_csr_reg.io.hssl_ctl_trigger
    io.hssl2_output << hssl2_txram.io.output
    apbMapping += hssl2_txram.io.apb -> (0x0011400, 1024 Bytes)

    val hssl2_rxram = new Apb_RxRAM(8)
    hssl2_rxram.io.rx_clk := io.hssl2_gtx_clk
    hssl2_rxram.io.clk := io.clk
    hssl2_rxram.io.reset := io.reset
    hssl2_rxram.io.rx_id := 0x000000b2
    hssl2_rxram.io.input << io.hssl2_input
    apbMapping += hssl2_rxram.io.apb -> (0x0011000, 1024 Bytes)
    io.hssl_rxdone(1) := hssl2_rxram.io.gtp_rx_done

    io.test_data := hssl2_rxram.io.test_dataout

    val hssl3_txram = new Apb_TxRam(8)
    hssl3_txram.io.tx_clk := io.hssl2_gtx_clk
    hssl3_txram.io.clk := io.clk
    hssl3_txram.io.reset := io.reset
    hssl3_txram.io.tx_id := 0x000000b3
    hssl3_txram.io.tx_packet_req := hssl3_csr_reg.io.hssl_ctl_send
    hssl3_txram.io.tx_packet_trigger := hssl3_csr_reg.io.hssl_ctl_trigger
    io.hssl3_output << hssl3_txram.io.output
    apbMapping += hssl3_txram.io.apb -> (0x0011c00, 1024 Bytes)

    val hssl3_rxram = new Apb_RxRAM(8)
    hssl3_rxram.io.rx_clk := io.hssl2_gtx_clk
    hssl3_rxram.io.clk := io.clk
    hssl3_rxram.io.reset := io.reset
    hssl3_rxram.io.rx_id := 0x000000b3
    hssl3_rxram.io.input << io.hssl3_input
    apbMapping += hssl3_rxram.io.apb -> (0x0011800, 1024 Bytes)
    io.hssl_rxdone(2) := hssl3_rxram.io.gtp_rx_done

    val hssl4_txram = new Apb_TxRam(8)
    hssl4_txram.io.tx_clk := io.hssl2_gtx_clk
    hssl4_txram.io.clk := io.clk
    hssl4_txram.io.reset := io.reset
    hssl4_txram.io.tx_id := 0x000000b4
    hssl4_txram.io.tx_packet_req := hssl4_csr_reg.io.hssl_ctl_send
    hssl4_txram.io.tx_packet_trigger := hssl4_csr_reg.io.hssl_ctl_trigger
    io.hssl4_output << hssl4_txram.io.output
    apbMapping += hssl4_txram.io.apb -> (0x0012400, 1024 Bytes)

    val hssl4_rxram = new Apb_RxRAM(8)
    hssl4_rxram.io.rx_clk := io.hssl2_gtx_clk
    hssl4_rxram.io.clk := io.clk
    hssl4_rxram.io.reset := io.reset
    hssl4_rxram.io.rx_id := 0x000000b4
    hssl4_rxram.io.input << io.hssl4_input
    apbMapping += hssl4_rxram.io.apb -> (0x0012000, 1024 Bytes)
    io.hssl_rxdone(3) := hssl4_rxram.io.gtp_rx_done

    val apbDecoder = Apb3Decoder(
      master = emif32_toapb.io.apb,
      slaves = apbMapping
    )
    val ila_probe=ila("0",io.emif.emif_cs,io.emif.emif_oe,io.emif.emif_we,io.emif.emif_data.read,io.emif.emif_data.write,io.emif.emif_data.writeEnable,io.emif.emif_addr,emif32_toapb.io.apb.PADDR,emif32_toapb.io.apb.PENABLE,
      emif32_toapb.io.apb.PREADY,emif32_toapb.io.apb.PSEL,emif32_toapb.io.apb.PWDATA,emif32_toapb.io.apb.PRDATA,emif32_toapb.io.apb.PWRITE,io.hssl_sts(1))
  }
}

class MO_TEST(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val clk = in Bool()
    val reset = in Bool()
    //val hssl1_gtx_clk = in Bool()
    val hssl_sts = in Vec(Bits(32 bits),1)
    //val hssl1_output = master(Stream(Fragment(Bits(32 bits))))
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val emif32_toapb = new EMIF32_Apb(sramLayout)
    emif32_toapb.io.emif <> io.emif
    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val hssl1_csr_reg = new Apb_CsrReg
    hssl1_csr_reg.io.hssl_sts := io.hssl_sts(0)
    apbMapping += hssl1_csr_reg.io.apb-> (0x010000, 16 Bytes)

//    val hssl2_csr_reg = new Apb_CsrReg
//    hssl2_csr_reg.io.hssl_sts := io.hssl_sts(1)
//    apbMapping += hssl2_csr_reg.io.apb-> (0x010040, 16 Bytes)
//
//    val hssl3_csr_reg = new Apb_CsrReg
//    hssl3_csr_reg.io.hssl_sts := io.hssl_sts(2)
//    apbMapping += hssl3_csr_reg.io.apb-> (0x010080, 16 Bytes)
//
//    val hssl4_csr_reg = new Apb_CsrReg
//    hssl4_csr_reg.io.hssl_sts := io.hssl_sts(3)
//    apbMapping += hssl4_csr_reg.io.apb-> (0x0100c0, 16 Bytes)
//
//    val hssl1_txram = new Apb_TxRam(8)
//    hssl1_txram.io.tx_clk := io.hssl1_gtx_clk
//    hssl1_txram.io.clk := io.clk
//    hssl1_txram.io.reset := io.reset
//    hssl1_txram.io.tx_id := 0x000000b1
//    hssl1_txram.io.tx_packet_req := hssl1_csr_reg.io.hssl_ctl_send
//    io.hssl1_output << hssl1_txram.io.output
//    apbMapping += hssl1_txram.io.apb -> (0x0010c00, 1024 Bytes)

    val apbDecoder = Apb3Decoder(
      master = emif32_toapb.io.apb,
      slaves = apbMapping
    )

//    val ila_probe=ila("1",io.emif.emif_cs,io.emif.emif_oe,io.emif.emif_we,io.emif.emif_data.read,io.emif.emif_data.write,io.emif.emif_data.writeEnable,io.emif.emif_addr,emif32_toapb.io.apb.PADDR,emif32_toapb.io.apb.PENABLE,
//      emif32_toapb.io.apb.PREADY,emif32_toapb.io.apb.PSEL,emif32_toapb.io.apb.PWDATA,emif32_toapb.io.apb.PRDATA,emif32_toapb.io.apb.PWRITE)
  }
}

object MO_TEST extends App{
  SpinalVerilog(InOutWrapper(new MO_TEST(SramLayout(24,16))) )
}



object Mo_Top extends App{
  //SpinalConfig(anonymSignalPrefix = "temp",oneFilePerComponent = true).generateVerilog(InOutWrapper(new Mo_Code(SramLayout(24,16))))

  SpinalConfig(anonymSignalPrefix = "temp",headerWithDate = true,targetDirectory = "E:/X300_20220810/X300_MO_REFACTOR_1.04/X300_MO/X300_MO.srcs/sources_1/imports/SRIO/").generateVerilog(InOutWrapper(new Mo_Code(SramLayout(24,16))))
}

case class Mo_Top_Test(period:Int) extends MO_TEST(SramLayout(24,16)){
  def init = {
    area.clockDomain.forkStimulus(period)
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= 0
    area.clockDomain.waitSampling(10)
  }
  def emif_write(addr:Int,data:Int) = {
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= false
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= addr
    area.clockDomain.waitSampling()
    io.emif.emif_we #= false
    io.emif.emif_data.read #= data
    area.clockDomain.waitSampling(2)
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
  }

  def emif_read(addr:Int)= {
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= false
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= addr
    area.clockDomain.waitSampling()
    io.emif.emif_oe #= false
    area.clockDomain.waitSampling()
    println(io.emif.emif_data.write)
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
  }
}


object EMIF32_Apb{
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(Mo_Top_Test(10))
    dut.doSim { dut =>
      dut.init
      dut.emif_write(0x004001,0x04)
      dut.emif_write(0x804001,0x00)
      dut.area.clockDomain.waitSampling(1000)
      dut.emif_write(0x004021,0x04)
      dut.emif_write(0x804021,0x00)
      dut.area.clockDomain.waitSampling(1000)
      dut.emif_write(0x004001,0x04)
      dut.emif_write(0x804001,0x00)
      dut.area.clockDomain.waitSampling(1000)
    }
  }
}