package MDCB_COMMON

import PHPA82.{Ad5544Interface, Ad7606Interface, BissCInterface, EncoderInterface}
import spinal.core._
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SpecRenamer}
import spinal.lib.{Fragment, IMasterSlave, Stream, master, slave}

case class Mdcb_Io() extends Bundle with IMasterSlave{
  val TTL_IO_In = Bits(8 bits)
  val TTL_IO_Out = Bits(8 bits)
  val OPT_IO_In = Bits(16 bits)
  val OPT_IO_Out = Bits(16 bits)
  override def asMaster(): Unit = {
    in(TTL_IO_In,OPT_IO_In)
    out(TTL_IO_Out,OPT_IO_Out)
  }
}

case class Mdcb_Common_Top(addressWidth : Int, ad5544_num : Int, ad7606_num : Int, bissc_num : Int, encoder_num : Int) extends Component{
  val io = new Bundle{
    val clk_in = in Bool()
    val reset = in Bool()
    val s_axi = slave(Axi4(Axi4Config(addressWidth,32,1)))
    val intput = slave(Stream(Fragment(Bits(32 bits))))
    val output = master(Stream(Fragment(Bits(32 bits))))
    val AD5544 = Seq.fill(ad5544_num)(master(Ad5544Interface()))
    val AD7606 = Seq.fill(ad7606_num)(master(Ad7606Interface()))
    val BISSC = Seq.fill(bissc_num)(master(BissCInterface()))
    val ENCODER = Seq.fill(encoder_num)(master(EncoderInterface()))
    val IO = master(Mdcb_Io())
    Axi4SpecRenamer(s_axi)
  }
  noIoPrefix()






}
