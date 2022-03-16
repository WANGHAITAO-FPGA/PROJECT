package Test

import spinal.core.BlackBox
import spinal.core._
import spinal.lib.{Delay, StreamFifo}
import spinal.lib.misc.Timer

import scala.util.Random

class gtp_tx() extends BlackBox{
  val log_rst_q = in Bool()
  val log_clk = in Bool()
  val s_axi_tx_tdata = out Bits(32 bits)
  val s_axi_tx_tkeep = out Bits(4 bits)
  val s_axi_tx_tlast = out Bool()
  val s_axi_tx_tvalid = out Bool()
  val s_axi_tx_tready = in Bool()
  val tx_packet_gtxid = in Bits(32 bits)
  val tx_packet_head = in Bits(32 bits)
  val tx_packet_req = in Bool()
  val tx_packet_trigger = in Bool()
  val crc_data = out Bits(32 bits)
  val tx_packet_addra = out Bits(8 bits)
  val tx_packet_data = in Bits(32 bits)
  val tx_packet_rden = out Bool()
  noIoPrefix()
  addRTLPath("D:/SCALA/SRIO/CYP1401/gtp_tx.v")
}

case class GTP_TEST() extends Component{
  val io = new Bundle{
    val log_rst_q = in Bool()
    val log_clk = in Bool()
    val s_axi_tx_tdata = out Bits(32 bits)
    val s_axi_tx_tlast = out Bool()
    val s_axi_tx_tvalid = out Bool()
    val s_axi_tx_tready = in Bool()
  }
  noIoPrefix()

  val gtx_area = new ClockingArea(ClockDomain(io.log_clk,io.log_rst_q)){
    val timer_B = Timer(32)
    timer_B.io.tick := True
    timer_B.io.limit := 500
    when(timer_B.io.value >= timer_B.io.limit){
      timer_B.io.clear := True
    }otherwise{
      timer_B.io.clear := False
    }


    val gtxtest = new gtp_tx()
    gtxtest.log_clk := io.log_clk
    gtxtest.log_rst_q := io.log_rst_q

    gtxtest.tx_packet_gtxid := 1
    gtxtest.tx_packet_head := 59
    //gtxtest.s_axi_tx_tkeep := 15
    gtxtest.tx_packet_req := timer_B.io.full|Delay(timer_B.io.full,1)|Delay(timer_B.io.full,2)|Delay(timer_B.io.full,3)
    gtxtest.tx_packet_trigger := False

    /*val streamfifo = new StreamFifo(Bits(32 bits),128)
    streamfifo.io.push.payload := gtxtest.s_axi_tx_tdata
    streamfifo.io.push.valid := gtxtest.s_axi_tx_tvalid
    gtxtest.s_axi_tx_tready := streamfifo.io.push.ready

    streamfifo.io.pop.ready := io.s_axi_tx_tready
    io.s_axi_tx_tdata := streamfifo.io.pop.payload
    io.s_axi_tx_tvalid := streamfifo.io.pop.valid*/

    io.s_axi_tx_tlast := gtxtest.s_axi_tx_tlast
    io.s_axi_tx_tdata := gtxtest.s_axi_tx_tdata
    io.s_axi_tx_tvalid := gtxtest.s_axi_tx_tvalid
    gtxtest.s_axi_tx_tready := io.s_axi_tx_tready

    val meminitvalue = for(i <- 0 until 256)yield{
      val initdata = i + 256
      BigInt(initdata)
    }
    val mem = Mem(Bits(32 bits), 256) initBigInt(meminitvalue)
    mem.addAttribute("ram_style", "block")
    gtxtest.tx_packet_data := mem.readSync(gtxtest.tx_packet_addra.asUInt,!gtxtest.tx_packet_rden)
  }
}

object GTP_TEST{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new GTP_TEST){dut=>
      dut.gtx_area.clockDomain.forkStimulus(10)
      dut.io.s_axi_tx_tready #= false
      dut.gtx_area.clockDomain.waitSampling(10)
      var i = 0
      for(idex <- 0 until 10000){
        dut.io.s_axi_tx_tready #= Random.nextBoolean()
        dut.gtx_area.clockDomain.waitSampling()
        if(dut.io.s_axi_tx_tvalid.toBoolean && dut.io.s_axi_tx_tready.toBoolean){
          i = i + 1
          println(i)
          if(dut.io.s_axi_tx_tlast.toBoolean){
            assert(dut.io.s_axi_tx_tdata.toBigInt == 0x0000FFBD)
            assert(i == 64)
            i = 0
            println(dut.io.s_axi_tx_tdata.toBigInt)
          }
        }
      }
      sleep(100)
    }
  }
}



