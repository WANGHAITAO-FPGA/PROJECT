package EMIF

import spinal.core.sim._

case class Emif_Ctrl_test(period:Int) extends Top(SramLayout(32,32)){
  def init = {
    area.clockDomain.forkStimulus(period)
    io.top_emif.emif_cs #= true
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    io.top_emif.emif_addr #= 0
    area.clockDomain.waitSampling(10)
  }
  def emif_write(addr:Int,data:Int) = {
    area.clockDomain.waitSampling()
    io.top_emif.emif_cs #= true
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.top_emif.emif_cs #= false
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    io.top_emif.emif_addr #= addr
    area.clockDomain.waitSampling()
    io.top_emif.emif_we #= false
    io.top_emif.emif_data.read #= data
    area.clockDomain.waitSampling(2)
    io.top_emif.emif_cs #= true
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    area.clockDomain.waitSampling()
  }

  def emif_read(addr:Int)= {
    area.clockDomain.waitSampling()
    io.top_emif.emif_cs #= true
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.top_emif.emif_cs #= false
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    io.top_emif.emif_addr #= addr
    area.clockDomain.waitSampling()
    io.top_emif.emif_oe #= false
    area.clockDomain.waitSampling()
    println(io.top_emif.emif_data.write)
    area.clockDomain.waitSampling()
    io.top_emif.emif_cs #= true
    io.top_emif.emif_oe #= true
    io.top_emif.emif_we #= true
    area.clockDomain.waitSampling()
  }
}

object Emif_Test {
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(Emif_Ctrl_test(10))
    dut.doSim{dut =>
      dut.init
      //dut.io.uart.rxd #= true
      dut.emif_write(4, 10)
      dut.emif_read(0)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(4, 0xaa)
      dut.emif_read(0)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x10000, 0xaa)
      dut.area.clockDomain.waitSampling()
      dut.emif_write(0x10000, 0x55)
      dut.area.clockDomain.waitSampling()
      dut.emif_write(0x10000, 0x11)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x10004, 0x02)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_read(0x10004)
      dut.area.clockDomain.waitSampling(400)
      dut.emif_read(0x10004)
      dut.area.clockDomain.waitSampling(400)
      dut.emif_read(0x10004)
      dut.area.clockDomain.waitSampling(400)
      dut.emif_read(0x10004)
      dut.area.clockDomain.waitSampling(400)
      dut.area.clockDomain.waitSampling(10000)
    }
  }

}
