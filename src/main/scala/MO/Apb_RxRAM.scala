package MO

import PHPA82.ila_test.ila
import spinal.core._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.{Delay, Fragment, Stream, slave}

class gtp_rx extends BlackBox{
  val io = new Bundle{
    val log_clk = in Bool()
    val log_rst_q = in Bool()
    val m_axi_rx_tdata = in Bits(32 bits)
    val m_axi_rx_tvalid = in Bool()
    val m_axi_rx_tlast = in Bool()
    val gtp_rx_done = out Bool()
    val gtp_rx_trigger = out Bool()
    val packet_data_addr = out Bits(8 bits)
    val packet_data_wr = out Bool()
    val gtx_id = in Bits(32 bits)
    val gtx_rd_id = out Bits(32 bits)
    val gtx_id_error = out Bool()
    val packet_data_head = out Bits(32 bits)
  }
  noIoPrefix()
  addRTLPath("C:/untitled2/CYP1401/gtp_rx.v")
}

class Apb_RxRAM(addrwidth : Int) extends Component{
  val io = new Bundle{
    val apb = slave(Apb3(Apb3Config(10,32)))
    val input = slave(Stream(Fragment(Bits(32 bits))))
    val clk = in Bool()
    val rx_clk = in Bool()
    val reset = in Bool()
    val rx_id = in Bits(32 bits)
    val gtp_rx_done = out Bool()
    val test_dataout = out Bits(32 bits)
   }
  noIoPrefix()

  val xilinx_bram = new Xilinx_Bram
  xilinx_bram.io.wr_rst := False
  xilinx_bram.io.rd_rst := False

  val rx_area = new ClockingArea(ClockDomain(io.rx_clk,io.reset)){
    val hssl_rx = new gtp_rx
    val gtp_rx_done = Reg(Bool()) init False
    hssl_rx.io.log_clk := io.rx_clk
    hssl_rx.io.log_rst_q := io.reset
    hssl_rx.io.m_axi_rx_tdata := io.input.payload.fragment
    hssl_rx.io.m_axi_rx_tvalid := io.input.valid
    hssl_rx.io.m_axi_rx_tlast := io.input.payload.last
    io.input.ready := True
    hssl_rx.io.gtx_id := io.rx_id
    //io.gtp_rx_done := hssl_rx.io.gtp_rx_done
    gtp_rx_done := io.input.valid && io.input.payload.last && (io.input.payload.fragment === B"32'x0000FFBD")
    io.gtp_rx_done := gtp_rx_done || Delay(gtp_rx_done,1,init = False) || Delay(gtp_rx_done,2,init = False) || Delay(gtp_rx_done,3,init = False)

//    val meminitvalue = for(i <- 0 until (BigInt(1) << addrwidth).toInt)yield{
//      val initdata = i + 256
//      BigInt(initdata)
//    }
//    val rams = Mem(Bits(32 bits), BigInt(1) << addrwidth) initBigInt(meminitvalue)
//    rams.addAttribute("ram_style", "block")
//    rams.readWriteSync(hssl_rx.io.packet_data_addr.asUInt,hssl_rx.io.m_axi_rx_tdata,hssl_rx.io.packet_data_wr,True,clockCrossing = true)

    xilinx_bram.io.wr_clk := io.rx_clk
    xilinx_bram.io.wr_addr := hssl_rx.io.packet_data_addr.resized
    xilinx_bram.io.wr_data := hssl_rx.io.m_axi_rx_tdata
    xilinx_bram.io.wr_en := hssl_rx.io.packet_data_wr

    io.test_dataout := RegNextWhen(hssl_rx.io.m_axi_rx_tdata.asBits,((hssl_rx.io.packet_data_addr === 7)&&hssl_rx.io.packet_data_wr))
  }
  val busarea = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val busctrl = Apb3SlaveFactory(io.apb)

    val psel = Reg(Bool()) init False
    psel := io.apb.PSEL.asBool

    xilinx_bram.io.rd_clk := io.clk
    //xilinx_bram.io.rd_en := io.apb.PSEL.asBool
    xilinx_bram.io.rd_en := psel.rise() || (Delay(psel.rise(),1,init = False))|| (Delay(psel.rise(),2,init = False))
    //busctrl.readSyncMemWordAligned(rx_area.rams,0)
    val mapping = SizeMapping(0,256 << log2Up(32/8))
    val memAddress = busctrl.readAddress(mapping) >> log2Up(32/8)
    xilinx_bram.io.rd_addr := memAddress.asBits
    val readData = xilinx_bram.io.rd_data
    busctrl.readPrimitive(readData,mapping,0,"")

//    val ila_probe=ila("3",xilinx_bram.io.wr_clk,xilinx_bram.io.wr_addr,xilinx_bram.io.wr_data,xilinx_bram.io.wr_en,
//      xilinx_bram.io.rd_en,xilinx_bram.io.rd_data,io.input.payload.fragment,io.input.valid,io.input.payload.last,io.input.ready,xilinx_bram.io.rd_addr)
  }


}

object Hssl_RxRAM extends App{
  SpinalVerilog(new Apb_RxRAM(8 ))
}

object Hssl_RxRAM_Test{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb_RxRAM(8 )){dut=>
      dut.rx_area.clockDomain.forkStimulus(8)
      dut.busarea.clockDomain.forkStimulus(10)
      dut.io.input.valid #= false
      dut.io.input.last #= false
      dut.io.rx_id #= 10
      dut.rx_area.clockDomain.waitSampling(50)
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x0000ffbc
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x0000000a
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x00000003
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x01020304
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x05060708
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x090a0b0c
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x11223344
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= true
      dut.io.input.payload.fragment #= 0x0000ffbd
      dut.io.input.payload.last #= true
      dut.rx_area.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.io.input.last #= false
      dut.rx_area.clockDomain.waitSampling(20)
      val apbsim = Apb3Driver(dut.io.apb,dut.busarea.clockDomain)
      println("addr0: " +apbsim.read(0).toInt)
      dut.busarea.clockDomain.waitSampling()
      println("addr4: " +apbsim.read(4).toInt)
      dut.busarea.clockDomain.waitSampling()
      println("addr4: " +apbsim.read(8).toInt)
      dut.busarea.clockDomain.waitSampling()
      println("addr4: " +apbsim.read(12).toInt)
      dut.busarea.clockDomain.waitSampling()
      println("addr4: " +apbsim.read(16).toInt)
      dut.busarea.clockDomain.waitSampling()
      dut.rx_area.clockDomain.waitSampling(200)
    }
  }
}