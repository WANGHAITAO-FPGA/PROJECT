//package MO
//
//import spinal.core._
//import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
//import spinal.lib.bus.regif.AccessType.{RO, RW}
//import spinal.lib.bus.regif.Apb3BusInterface
//import spinal.lib.{Fragment, Stream, slave}
//
//case class ApbRdReg() extends Component{
//  val io = new Bundle{
//    val apb = slave(Apb3(Apb3Config(10,32)))
//    val input = slave(Stream(Fragment(Bits(32 bits))))
//    val clk = in Bool()
//    val rx_clk = in Bool()
//    val reset = in Bool()
//    val rx_id = in Bits(32 bits)
//    val gtp_rx_done = out Bool()
//  }
//  noIoPrefix()
//
//  val rx_area = new ClockingArea(ClockDomain(io.rx_clk,io.reset)) {
//    val rx_reg = Vec(Reg(Bits(32 bits)),100)
//    val hssl_rx = new gtp_rx
//    hssl_rx.io.log_clk := io.rx_clk
//    hssl_rx.io.log_rst_q := io.reset
//    hssl_rx.io.m_axi_rx_tdata := io.input.payload.fragment
//    hssl_rx.io.m_axi_rx_tvalid := io.input.valid
//    hssl_rx.io.m_axi_rx_tlast := io.input.payload.last
//    io.input.ready := True
//    hssl_rx.io.gtx_id := io.rx_id
//    io.gtp_rx_done := hssl_rx.io.gtp_rx_done
//
//    rx_reg(hssl_rx.io.packet_data_addr.resized) := hssl_rx.io.m_axi_rx_tdata
//  }
//
//  val busarea = new ClockingArea(ClockDomain(io.clk,io.reset)) {
//    val busctrl = Apb3BusInterface(io.apb,(0x0000, 256 Byte))
//
//    val My_Reg = (0 until 99).map { i =>
//      val Bus_Reg = busctrl.newReg(doc=s"Bus_Reg")
//      val My_Reg_Data = Bus_Reg.field(32 bits,RW,0,s"Bus_Reg")
//    }
//
//  }
//
//}
