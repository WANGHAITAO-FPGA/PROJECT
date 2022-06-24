package MO

import PHPA82._
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Decoder}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.{Fragment, Stream, master, slave}

import scala.collection.mutable.ArrayBuffer

case class Apb_Test() extends Component{
  val io = new Bundle{
    //val apb = master(Apb3(Apb3Config(24,32)))
    val emif = master(SramInterface(SramLayout(24,32)))
    val clk = in Bool()
    val reset = in Bool()
    val rx_clk = in Bool()
    val tx_clk = in Bool()
    val tx_packet_req = in Bool()
    val input = slave(Stream(Fragment(Bits(32 bits))))
    val output = master(Stream(Fragment(Bits(32 bits))))
  }
  noIoPrefix()

  val tx_clkdomain = ClockDomain(io.tx_clk,io.reset)

  val rx_clkdomain = ClockDomain(io.rx_clk,io.reset)

  val area = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val emif_interface = new Emif_Apb(SramLayout(24,32))
    io.emif <> emif_interface.io.emif


    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

//    for(i <- 0 until hssl_count){
//      val hssl_txram = Seq.fill(hssl_count)(new Apb_TxRam(8))
//      hssl_txram(i).io.tx_clk := io.tx_clk
//      hssl_txram(i).io.clk := io.clk
//      hssl_txram(i).io.reset := io.reset
//      hssl_txram(i).io.tx_id := 0x000000b1 + i
//      hssl_txram(i).io.tx_packet_req := io.tx_packet_req
//      io.output(i) := hssl_txram(i).io.output
//      apbMapping += hssl_txram(i).io.apb -> (0x0010c00 + i*0x800, 1024 Bytes)
//    }

//    for(i <- 0 until hssl_count){
//      val hssl_rxram = Seq.fill(hssl_count)(new Apb_RxRAM(8))
//      hssl_rxram(i).io.rx_clk := io.rx_clk
//      hssl_rxram(i).io.clk := io.clk
//      hssl_rxram(i).io.reset := io.reset
//      hssl_rxram(i).io.rx_id := 0x000000b1 + i
//      hssl_rxram(i).io.input := io.input(i)
//      apbMapping += hssl_rxram(i).io.apb -> (0x0010800 + i*0x800, 1024 Bytes)
//    }


    val apb_txram = new Apb_TxRam(8)
    apb_txram.io.tx_clk := io.tx_clk
    apb_txram.io.clk := io.clk
    apb_txram.io.reset := io.reset
    apb_txram.io.tx_id := 0x000000b1
    apb_txram.io.tx_packet_req := io.tx_packet_req
    io.output << apb_txram.io.output
    apbMapping += apb_txram.io.apb -> (0x0010c00, 1024 Bytes)

    val apb_rxram = new Apb_RxRAM(8)
    apb_rxram.io.rx_clk := io.rx_clk
    apb_rxram.io.clk := io.clk
    apb_rxram.io.reset := io.reset
    apb_rxram.io.rx_id := 0x000000b1
    apb_rxram.io.input << io.input

    apbMapping += apb_rxram.io.apb -> (0x0010800, 1024 Bytes)

    val apbDecoder = Apb3Decoder(
      master = emif_interface.io.apb,
      slaves = apbMapping
    )
  }
}

object Apb_Test extends App{
  SpinalVerilog(new Apb_Test())
}

