package MO

import PHPA82.ila_test.ila
import Test.gtp_tx
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.{Fragment, Stream, master, slave}
import spinal.core.sim._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.bus.misc.SizeMapping

case class Apb_TxRam(addrwidth : Int) extends Component{
  val io = new Bundle{
    val apb = slave(Apb3(Apb3Config(10,32)))
    val output = master(Stream(Fragment(Bits(32 bits))))
    val clk = in Bool()
    val tx_clk = in Bool()
    val reset = in Bool()
    val tx_id = in Bits(32 bits)
    val tx_packet_req = in Bool()
  }
  noIoPrefix()

  val xilinx_bram = new Xilinx_Bram
  xilinx_bram.io.rd_rst := False
  xilinx_bram.io.wr_rst := False

  val busarea = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val tx_frame = Reg(Bits(32 bits)) init 0  addTag(crossClockDomain)
//    val meminitvalue = for(i <- 0 until ((BigInt(1) << addrwidth)-1).toInt)yield{
//      BigInt(0)
//    }
//    val rams = Mem(Bits(32 bits), (BigInt(1) << addrwidth)-1) initBigInt(meminitvalue)
//    rams.addAttribute("ram_style", "block")
    val busctrl = Apb3SlaveFactory(io.apb)

    val mapping    = SizeMapping(0,255 << log2Up(32 / 8))
    val memAddress = busctrl.writeAddress(mapping) >> log2Up(32 / 8)
    xilinx_bram.io.wr_clk := io.clk
    xilinx_bram.io.wr_addr := memAddress.asBits
    xilinx_bram.io.wr_en := RegNext(busctrl.doWrite)
    xilinx_bram.io.wr_data := io.apb.PWDATA

//    busctrl.writeMemWordAligned(rams,0)
    busctrl.driveAndRead(tx_frame,1020,0,"tx_frame")
  }

  val tx_area = new ClockingArea(ClockDomain(io.tx_clk,io.reset)){
    val hssl_tx = new gtp_tx
    hssl_tx.io.log_clk := io.tx_clk
    hssl_tx.io.log_rst_q := io.reset
    io.output.payload.fragment := hssl_tx.io.s_axi_tx_tdata
    io.output.payload.last := hssl_tx.io.s_axi_tx_tlast
    io.output.valid := hssl_tx.io.s_axi_tx_tvalid
    hssl_tx.io.s_axi_tx_tready := io.output.ready
    hssl_tx.io.tx_packet_gtxid := io.tx_id
    hssl_tx.io.tx_packet_req := io.tx_packet_req
    hssl_tx.io.tx_packet_trigger := False
    hssl_tx.io.tx_packet_head := busarea.tx_frame
    xilinx_bram.io.rd_en := !hssl_tx.io.tx_packet_rden
    xilinx_bram.io.rd_clk := io.tx_clk
    xilinx_bram.io.rd_addr := hssl_tx.io.tx_packet_addra.resized
    hssl_tx.io.tx_packet_data := xilinx_bram.io.rd_data
//    hssl_tx.io.tx_packet_data := busarea.rams.readSync(hssl_tx.io.tx_packet_addra.asUInt,!hssl_tx.io.tx_packet_rden)
  }

//  val ila_probe=ila("2",xilinx_bram.io.wr_en,xilinx_bram.io.wr_addr,xilinx_bram.io.wr_data,busarea.tx_frame,xilinx_bram.io.rd_en,xilinx_bram.io.rd_addr,xilinx_bram.io.rd_data)
}

object Apb_TxRam extends App{
  SpinalVerilog(new Apb_TxRam(8))
}

object Apb_TxRam_Test{
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb_TxRam(8)){dut=>
      dut.busarea.clockDomain.forkStimulus(10)
      dut.tx_area.clockDomain.forkStimulus(8)
      dut.io.output.ready #= true
      dut.io.tx_id #= 10
      dut.io.tx_packet_req #= false
      dut.busarea.clockDomain.waitSampling(50)
      val apbsim = Apb3Driver(dut.io.apb,dut.busarea.clockDomain)
      apbsim.write(0,0x01020304)
      apbsim.write(4,0x05060708)
      apbsim.write(8,0x090a0b0c)
      apbsim.write(12,0x11020304)
      apbsim.write(16,0x15060708)
      apbsim.write(20,0x190a0b0c)
      apbsim.write(1020,0x00000005)
      dut.busarea.clockDomain.waitSampling(10)
      dut.io.tx_packet_req #= true
      dut.busarea.clockDomain.waitSampling(2)
      dut.io.tx_packet_req #= false
      dut.busarea.clockDomain.waitSampling(1000)
    }
  }
}