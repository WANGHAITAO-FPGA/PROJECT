package MLMC300

import PHPA82.SramLayout
import spinal.core.sim._

case class Mlmc_Sim(period:Int) extends MlmcTop(SramLayout(19,16)) {
  def init = {
    area.clockDomain.forkStimulus(period)
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= 0
    area.clockDomain.waitSampling(10)
  }

  def emif_write(addr: Int, data: Int) = {
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= true
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    area.clockDomain.waitSampling()
    io.emif.emif_cs #= false
    io.emif.emif_oe #= true
    io.emif.emif_we #= true
    io.emif.emif_addr #= addr
    area.clockDomain.waitSampling(2)
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

object MlmcSim {
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(Mlmc_Sim(10))
    dut.doSim{dut =>
      dut.init
      dut.area.clockDomain.waitSampling(10)
      dut.emif_write(0x301, 0x0001)
      dut.emif_write(0x301, 0x0000)
      dut.emif_write(0x300, 0x0102)
      dut.emif_write(0x300, 0x0203)
      dut.emif_write(0x300, 0x0405)
      dut.area.clockDomain.waitSampling(10)
      dut.emif_read(0x303)
      dut.emif_read(0x304)
      dut.emif_read(0x302)
      dut.emif_read(0x302)
      dut.emif_read(0x302)
      dut.area.clockDomain.waitSampling(100000)
    }
  }

}

