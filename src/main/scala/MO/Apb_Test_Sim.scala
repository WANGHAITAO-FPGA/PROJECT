package MO

import PHPA82.{Phpa_Test, Phpa_Top, SramLayout}
import spinal.core._
import spinal.core.sim._

//class Apb_Test_Sim(period:Int) extends Apb_Test(){
//  def init = {
//    area.clockDomain.forkStimulus(period)
//    io.emif.emif_cs #= true
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    io.emif.emif_addr #= 0
//    area.clockDomain.waitSampling(10)
//  }
//  def emif_write(addr:Int,data:Int) = {
//    area.clockDomain.waitSampling()
//    io.emif.emif_cs #= true
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    area.clockDomain.waitSampling()
//    io.emif.emif_cs #= false
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    io.emif.emif_addr #= addr
//    area.clockDomain.waitSampling()
//    io.emif.emif_we #= false
//    io.emif.emif_data.read #= data
//    area.clockDomain.waitSampling(2)
//    io.emif.emif_cs #= true
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    area.clockDomain.waitSampling()
//  }
//
//  def emif_read(addr:Int)= {
//    area.clockDomain.waitSampling()
//    io.emif.emif_cs #= true
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    area.clockDomain.waitSampling()
//    io.emif.emif_cs #= false
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    io.emif.emif_addr #= addr
//    area.clockDomain.waitSampling()
//    io.emif.emif_oe #= false
//    area.clockDomain.waitSampling()
//    println(io.emif.emif_data.write)
//    area.clockDomain.waitSampling()
//    io.emif.emif_cs #= true
//    io.emif.emif_oe #= true
//    io.emif.emif_we #= true
//    area.clockDomain.waitSampling()
//  }
//}
//
//object Apb_Test_Sim{
//  def main(args: Array[String]): Unit = {
//    val dut = SimConfig.withWave.compile(new Apb_Test_Sim(10))
//    dut.doSim{dut=>
//      //dut.area.apb_txram.tx_area.clockDomain.forkStimulus(8)
//      //dut.area.apb_rxram.rx_area.clockDomain.forkStimulus(8)
//      dut.tx_clkdomain.forkStimulus(8)
//      dut.rx_clkdomain.forkStimulus(8)
//      dut.io.tx_packet_req #= false
//      dut.init
//      dut.emif_write(0x4300,0x0102)
//      dut.emif_write(0x4301,0x0304)
//      dut.emif_write(0x4302,0x0506)
//      dut.emif_write(0x4303,0x0708)
//      dut.emif_write(0x4304,0x090a)
//      dut.emif_write(0x43ff,0x0005)
//      dut.io.tx_packet_req #= true
//      dut.area.clockDomain.waitSampling(3)
//      dut.io.tx_packet_req #= false
//      dut.area.clockDomain.waitSampling(300)
//      dut.emif_read(0x4200)
//      dut.emif_read(0x4201)
//      dut.emif_read(0x4202)
//      dut.emif_read(0x4203)
//      dut.emif_read(0x4204)
//      dut.emif_read(0x4205)
////      dut.emif_read(0x4206)
//      dut.area.clockDomain.waitSampling(300)
//    }
//  }
//}
