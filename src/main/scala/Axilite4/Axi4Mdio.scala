//package Axilite4
//
//import spinal.core._
//import spinal.lib.bus.amba3.apb.{Apb3, Apb3Decoder, Apb3Gpio}
//import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SharedToApb3Bridge, Axi4SpecRenamer}
//import spinal.lib.bus.misc.SizeMapping
//import spinal.lib.com.spi.{Apb3SpiMasterCtrl, SpiMasterCtrlGenerics, SpiMasterCtrlMemoryMappedConfig}
//import spinal.lib.{IMasterSlave, master, slave}
//import spinal.lib.io.{InOutWrapper, TriState}
//
//import scala.collection.mutable.ArrayBuffer
//
//case class Mdio() extends Bundle with IMasterSlave{
//  val MDC = Bool()
//  val MDIO = TriState(Bool())
//  override def asMaster(): Unit = {
//    out(MDC)
//    master(MDIO)
//  }
//}
//
//case class Axi4Mdio(addressWidth : Int) extends Component{
//  val io = new Bundle{
//    val s_axi = slave(Axi4(Axi4Config(addressWidth,32,1)))
//    val mdio = master(Mdio())
//    Axi4SpecRenamer(s_axi)
//    mdio.setName("")
//  }
//  noIoPrefix()
//
//  val apbBridge = Axi4SharedToApb3Bridge(addressWidth,32,1)
//  apbBridge.io.axi << io.s_axi.toShared()
//
//  val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()
//
//  val spi_ctrl = new Apb3SpiMasterCtrl(SpiMasterCtrlMemoryMappedConfig(SpiMasterCtrlGenerics(0,10)))
//  apbMapping += spi_ctrl.io.apb -> (0x000000, 256 Bytes)
//  spi_ctrl.io.spi.addAttribute("MARK_DEBUG","TRUE")
//  spi_ctrl.io.spi.addAttribute("DONT_TOUCH","TRUE")
//  io.mdio.addAttribute("MARK_DEBUG","TRUE")
//  spi_ctrl.io.apb.addAttribute("MARK_DEBUG","TRUE")
//
//  val gpio = new Apb3Gpio(1,false)
//  apbMapping += gpio.io.apb -> (0x000100, 256 Bytes)
//  gpio.io.gpio.read := 0
//
//  io.mdio.MDC := spi_ctrl.io.spi.sclk
//
//  io.mdio.MDIO.write := spi_ctrl.io.spi.mosi
//  spi_ctrl.io.spi.miso := io.mdio.MDIO.read
//  io.mdio.MDIO.writeEnable := gpio.io.gpio.write.asBool
//
//  val apbDecoder = Apb3Decoder(
//    master = apbBridge.io.apb,
//    slaves = apbMapping
//  )
//}
//
//object Axi4Mdio extends App{
//  SpinalConfig(anonymSignalPrefix = "temp",headerWithDate = true,targetDirectory = "E:/TEST/Axi4Mdio/Axi4Mdio.srcs/sources_1/imports/SRIO/").generateVerilog(InOutWrapper(new Axi4Mdio(10)))
//}