//package MO
//
//import Test.gtp_tx
//import spinal.core._
//import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
//import spinal.lib.{Fragment, Stream, master, slave}
//
//case class Mo_TxRam(addrwidth : Int) extends Component{
//  val io = new Bundle{
//    val apb = slave(Apb3(Apb3Config(10,32)))
//    val tx_clk = in Bool()
//    val reset = in Bool()
//    val output = master(Stream(Fragment(Bits(32 bits))))
//    val tx_packet_req = in Bool()
//    val tx_packet_head = in Bits(32 bits)
//    val tx_packet_gtxid = in Bits(32 bits)
//  }
//  noIoPrefix()
//
//  val busCtrl = Apb3SlaveFactory(io.apb)
//
//  val rams = Mem(Bits(32 bits), BigInt(1) << addrwidth-2)
//
//  val clkarea = new ClockingArea(ClockDomain(this.clockDomain.clock,io.reset)){
//    rams.write(busCtrl.writeAddress>>2,io.apb.PWDATA,busCtrl.doWrite)
//    rams.addAttribute("ram_style", "block")
//  }
//
//  val gtxarea = new ClockingArea(ClockDomain(io.tx_clk,io.reset)){
//    val gtx = new gtp_tx()
//    gtx.io.log_clk := io.tx_clk
//    gtx.io.log_rst_q := io.reset
//    gtx.io.tx_packet_req := io.tx_packet_req
//    gtx.io.tx_packet_head := io.tx_packet_head
//    io.output.valid := gtx.io.s_axi_tx_tvalid
//    io.output.payload.fragment := gtx.io.s_axi_tx_tdata
//    io.output.payload.last := gtx.io.s_axi_tx_tlast
//    gtx.io.s_axi_tx_tready := io.output.ready
//    gtx.io.tx_packet_trigger := False
//    gtx.io.tx_packet_gtxid := io.tx_packet_gtxid
//    gtx.io.tx_packet_data := rams.readAsync((gtx.io.tx_packet_addra).asUInt)
//  }
//}
