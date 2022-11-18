package Axilite4

import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Decoder, Apb3Gpio}
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Config, Axi4SharedToApb3Bridge, Axi4SpecRenamer}
import spinal.lib.bus.amba4.axilite.{AxiLite4, AxiLite4SpecRenamer}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.com.i2c.{Apb3I2cCtrl, I2c, I2cMasterMemoryMappedGenerics, I2cSlaveGenerics, I2cSlaveMemoryMappedGenerics}
import spinal.lib.io.{InOutWrapper, TriState}
import spinal.lib.{master, slave}

import scala.collection.mutable.ArrayBuffer

case class AxiLite4I2C(addressWidth : Int) extends Component{
  val io = new Bundle{
    val s_axi = slave(Axi4(Axi4Config(addressWidth,32,1)))
    val i2c_scl = out Bool()
    val i2c_sda = master(TriState(Bool()))
    Axi4SpecRenamer(s_axi)
  }
  noIoPrefix()

  val apbBridge = Axi4SharedToApb3Bridge(addressWidth,32,1)
  apbBridge.io.axi << io.s_axi.toShared()

  val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

  val gpio = new Apb3Gpio(1,false)
  apbMapping += gpio.io.apb -> (0x000100, 256 Bytes)
  gpio.io.gpio.read := 0

  val i2c_ctrl = new Apb3I2cCtrl(I2cSlaveMemoryMappedGenerics(I2cSlaveGenerics(3,10 bits,6 bits,20 bits),0,I2cMasterMemoryMappedGenerics(12)))
  apbMapping += i2c_ctrl.io.apb -> (0x000000, 256 Bytes)

  i2c_ctrl.io.apb.addAttribute("MARK_DEBUG","TRUE")
  i2c_ctrl.io.i2c.addAttribute("MARK_DEBUG","TRUE")
  i2c_ctrl.io.i2c.addAttribute("DONT_TOUCH","TRUE")
  io.i2c_scl := i2c_ctrl.io.i2c.scl.write
  i2c_ctrl.io.i2c.scl.read := i2c_ctrl.io.i2c.scl.write

  i2c_ctrl.io.i2c.sda.read := io.i2c_sda.read
  //io.i2c_sda.write := i2c_ctrl.io.i2c.sda.write
  //io.i2c_sda.writeEnable := gpio.io.gpio.write.asBool
  io.i2c_sda.write := False
  io.i2c_sda.writeEnable := !i2c_ctrl.io.i2c.sda.write

  io.i2c_sda.writeEnable.addAttribute("MARK_DEBUG","TRUE")
  io.i2c_sda.writeEnable.addAttribute("DONT_TOUCH","TRUE")
  io.i2c_sda.write.addAttribute("DONT_TOUCH","TRUE")

  val apbDecoder = Apb3Decoder(
    master = apbBridge.io.apb,
    slaves = apbMapping
  )

}

object AxiLite4I2C extends App{
  SpinalConfig(anonymSignalPrefix = "temp",headerWithDate = true,targetDirectory = "E:/TEST/I2C_TT/I2C_TT.srcs/sources_1/imports/SRIO/").generateVerilog(InOutWrapper(new AxiLite4I2C(10)))
}
