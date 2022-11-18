package MDIO

import Axilite4.AxiLite4I2C
import spinal.core._
import spinal.lib.blackbox.xilinx.s7.IOBUF
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Decoder, Apb3Gpio}
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SharedToApb3Bridge, Axi4SpecRenamer}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.io.InOutWrapper
import spinal.lib.{master, slave}

import scala.collection.mutable.ArrayBuffer

class Axi4Mdio(addressWidth : Int) extends Component{
  val io = new Bundle{
    val s_axi = slave(Axi4(Axi4Config(addressWidth,32,1)))
//    val MDC = out Bool()
//    val MDIO = inout(Analog(Bool()))
    val mdio = master(Mdio())
    val phy_reset = out Bool()
    Axi4SpecRenamer(s_axi)
    mdio.MDC.setName("MDC")
    mdio.MDIO.setName("MDIO")
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(this.clockDomain.clock,this.clockDomain.reset,config = ClockDomainConfig(resetActiveLevel = LOW))){
    val apbBridge = Axi4SharedToApb3Bridge(addressWidth,32,1)
    apbBridge.io.axi << io.s_axi.toShared()

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

//    val io_buf = new IOBUF

    val mdioctrl = new Apb3Mdio()
    apbMapping += mdioctrl.io.apb -> (0x000000, 256 Bytes)
    mdioctrl.io.mdio <> io.mdio
    mdioctrl.io.addAttribute("MARK_DEBUG","TRUE")
//    io_buf.T := !mdioctrl.io.mdio.MDIO.writeEnable
//    io_buf.I := mdioctrl.io.mdio.MDIO.write
//    mdioctrl.io.mdio.MDIO.read := io_buf.O
//    io.MDIO <> io_buf.IO
//    io.MDC := mdioctrl.io.mdio.MDC

    val gpio = new Apb3Gpio(1,false)
    apbMapping += gpio.io.apb -> (0x000100, 256 Bytes)
    gpio.io.gpio.read := 0
    io.phy_reset := gpio.io.gpio.write.asBool

    val apbDecoder = Apb3Decoder(
      master = apbBridge.io.apb,
      slaves = apbMapping
    )
  }
}

object Axi4Mdio extends App{
  SpinalConfig(anonymSignalPrefix = "temp",
    headerWithDate = true,
    targetDirectory = "E:/TEST/Axi4Mdio/Axi4Mdio.srcs/sources_1/imports/SRIO/"
  ).generateVerilog(new Axi4Mdio(9))
}
