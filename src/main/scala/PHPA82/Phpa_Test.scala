package PHPA82

import spinal.core.sim._

case class Phpa_Test(period:Int) extends Phpa_Top(SramLayout(20,16)){
  def init = {
    area.clockDomain.forkStimulus(period)
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= 0
    area.clockDomain.waitSampling(10)
  }
  def emif_write(addr:Int,data:Int) = {
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= false
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= addr
    area.clockDomain.waitSampling()
    io.emif.emif_we #= false
    io.emif.emif_data.read #= data
    area.clockDomain.waitSampling(2)
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
  }

  def emif_read(addr:Int)= {
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= false
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= addr
    area.clockDomain.waitSampling()
    io.emif.emif_oe #= false
    area.clockDomain.waitSampling()
    println(io.emif.emif_data.write)
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
  }
}


object Phpa_TestSim {
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(Phpa_Test(10))
    dut.doSim{dut =>
      dut.init
      /*dut.emif_write(0x600, 0x01)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x601, 0x3FF)
      dut.area.clockDomain.waitSampling(10)*/
      dut.area.clockDomain.waitSampling(10)
      //dut.io.axiw.ready #= true
      dut.axiclkdomain.forkStimulus(100)
      dut.emif_write(0x380, 0x0000)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x380, 0x0001)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x380, 0x0000)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0060)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0000)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0304)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0102)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0708)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0506)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x0b0c)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x388, 0x090a)
      dut.area.clockDomain.waitSampling(10)
      dut.area.clockDomain.waitSampling(2000)
      dut.emif_read(0x392)
      dut.emif_read(0x390)
      dut.emif_read(0x390)
      dut.emif_read(0x390)
      dut.emif_read(0x390)
      dut.emif_read(0x390)
      dut.emif_read(0x390)
      dut.emif_read(0x390)
      dut.emif_read(0x390)

      sleep(100)
      dut.area.clockDomain.waitSampling(100000)
    }
  }

}
