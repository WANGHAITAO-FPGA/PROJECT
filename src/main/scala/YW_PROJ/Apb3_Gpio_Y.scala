package YW_PROJ

import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3Gpio, Apb3SlaveFactory}
import spinal.lib.io.TriStateArray
import spinal.lib._

//case class Apb3_Gpio_Y(addressWidth: Int) extends Component {
//  val io = new Bundle {
//    val apb  = slave(Apb3(Apb3Config(addressWidth,32)))
//    val gpio_in = in Bits(6 bits)
//    val gpio_out = out Bits(6 bits)
//  }
//
//  val gpio_in_temp = Reg(Bits(6 bits)) init 0
//  val gpio_out_temp = Reg(Bits(6 bits)) init 0
//
//  gpio_in_temp := BufferCC(io.gpio_in)
//  val ctrl = Apb3SlaveFactory(io.apb)
//  ctrl.read(gpio_in_temp, 0x20)
//  ctrl.driveAndRead(gpio_out_temp, 0x40)
//  io.gpio_out := gpio_out_temp
//
//}
