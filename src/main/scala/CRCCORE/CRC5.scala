package CRCCORE

import spinal.core._

class crc extends BlackBox{
  val data_in = in Bits(24 bits)
  val crc_en = in Bool()
  val crc_out = out Bits(5 bits)
  val clk = in Bool()
  val rst = in Bool()
  addRTLPath("D:/SCALA/SRIO/CYP1401/crc5.v")
}

class CRC5_ extends Component{
  val io = new Bundle{
    val data_in = in Bits(24 bits)
    val crc_en = in Bool()
    val crc_out = out Bits(5 bits)
    val clk = in Bool()
    val rst = in Bool()
  }
  noIoPrefix()

  val area = new ClockingArea(ClockDomain(io.clk,io.rst)){
    val crc = new crc
    crc.data_in := io.data_in
    io.crc_out := crc.crc_out
    crc.crc_en := io.crc_en
    crc.clk := io.clk
    crc.rst := io.rst
  }

}


object crc5_sim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new CRC5_){dut =>
      dut.area.clockDomain.forkStimulus(10)
      dut.io.crc_en #= false
      dut.area.clockDomain.waitSampling(10)
      dut.io.data_in #= 0x02
      dut.io.crc_en #= true
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= false
      dut.area.clockDomain.waitSampling(10)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x0a
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x0b
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x02
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x0a
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x0b
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)

      dut.io.crc_en #= true
      dut.io.data_in #= 0x1d
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x15
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x14
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x1d
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x15
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)
      dut.io.crc_en #= true
      dut.io.data_in #= 0x14
      dut.area.clockDomain.waitSampling(1)
      println(dut.io.crc_out.toBigInt)
      dut.area.clockDomain.waitSampling(5)


    }

  }
}
