package Test

import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.com.i2c.{Apb3I2cCtrl, I2cMasterMemoryMappedGenerics, I2cSlaveGenerics, I2cSlaveMemoryMappedGenerics}
import spinal.lib.io.InOutWrapper

object Apb_I2c_Test{
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb3I2cCtrl(I2cSlaveMemoryMappedGenerics(I2cSlaveGenerics(4,10 bits,6 bits,20 bits),0,I2cMasterMemoryMappedGenerics(12)))){dut=>
      dut.clockDomain.forkStimulus(50)
      dut.clockDomain.waitSampling(10)
      val apbsim = Apb3Driver(dut.io.apb,dut.clockDomain)
      apbsim.write(0x28,40)
      apbsim.write(0x2C,10)
      apbsim.write(0x30,8)
      apbsim.write(0x50,4)
      apbsim.write(0x54,4)
      apbsim.write(0x58,4)
      apbsim.write(0x40,0x10)
      apbsim.write(0x00,0x55)
      dut.clockDomain.waitSampling(1000)
    }
  }
}
object Apb_I2c extends App{
  SpinalVerilog(InOutWrapper(new Apb3I2cCtrl(I2cSlaveMemoryMappedGenerics(I2cSlaveGenerics(4,10 bits,6 bits,20 bits),0,I2cMasterMemoryMappedGenerics(12)))))
}


