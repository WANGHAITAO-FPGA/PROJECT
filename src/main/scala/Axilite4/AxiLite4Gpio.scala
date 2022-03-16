package Axilite4

import spinal.core._
import spinal.lib.bus.amba4.axilite.{AxiLite4, AxiLite4Config, AxiLite4SlaveFactory}
import spinal.lib.io.TriStateArray
import spinal.lib.{BufferCC, master, slave}

object AxiLite4GpioConfig {
  def getaxi4liteconfig = AxiLite4Config(16,32)
}

case class AxiLite4Gpio(gpioWidth : Int, withReadSync : Boolean) extends Component{
  val io = new Bundle{
    val s_axi = slave(AxiLite4(AxiLite4GpioConfig.getaxi4liteconfig))
    val gpio = master(TriStateArray(gpioWidth bits))
    val value = out Bits(gpioWidth bits)
  }
  noIoPrefix()

  io.value := (if(withReadSync) BufferCC(io.gpio.read) else io.gpio.read)
  val ctrl = new AxiLite4SlaveFactory(io.s_axi)
  ctrl.read(io.value, 0)
  ctrl.driveAndRead(io.gpio.write, 4)
  ctrl.driveAndRead(io.gpio.writeEnable, 8)
  io.gpio.writeEnable.getDrivingReg init(0)
}

object AxiLite4Gpio extends App{
  SpinalVerilog(AxiLite4Gpio(32,false))
}