package ENDAT

import spinal.core.{UInt, _}

case class Noise_Filter() extends Component{
  val io = new Bundle{
    val data_in = in Bool()
    val data_out = out Bool()
  }
  noIoPrefix()

  val data_delayed = Reg(Bits(4 bits)) init 0
  data_delayed := Cat(data_delayed(2),data_delayed(1),data_delayed(0),io.data_in)

  val temp = Reg(Bool()) init io.data_in
  temp := (data_delayed(1)&data_delayed(2)&data_delayed(3)&(!temp))|(!((!data_delayed(1))&(!data_delayed(2))&(!data_delayed(3)))&temp)

  io.data_out := temp
}

case class Quad_Encoder() extends Component{
  val io = new Bundle{
    val quadA = in Bool()
    val quadB = in Bool()
    val postion_clr = in Bool()
    val postion = out UInt(32 bits)
  }
  noIoPrefix()

  val quadA_noise_filter = new Noise_Filter
  quadA_noise_filter.io.data_in := io.quadA
  val quadA_filter = quadA_noise_filter.io.data_out

  val quadB_noise_filter = new Noise_Filter
  quadB_noise_filter.io.data_in := io.quadB
  val quadB_filter = quadB_noise_filter.io.data_out

  val count_reg = Reg(UInt(32 bits)) init 0
  val quadA_delayed = Reg(Bits(3 bits)) init 0
  val quadB_delayed = Reg(Bits(3 bits)) init 0
  quadA_delayed := Cat(quadA_delayed(1), quadA_delayed(0), quadA_filter)
  quadB_delayed := Cat(quadB_delayed(1), quadB_delayed(0), quadB_filter)
  val count_2x = quadA_delayed(1) ^ quadA_delayed(2)
  val count_4x = quadA_delayed(1) ^ quadA_delayed(2) ^ quadB_delayed(1) ^ quadB_delayed(2)
  val count_direction = quadA_delayed(1) ^ quadB_delayed(2)
  val count_pulses = count_4x

  when(count_pulses) {
    when(count_direction) {
      count_reg := count_reg + 1
    }.otherwise {
      count_reg := count_reg - 1
    }
  }
  when(io.postion_clr){
    count_reg := 0
  }
  io.postion := count_reg
}

object Quad_Encoder extends App{
  SpinalVerilog(new Quad_Encoder)
}

/*object Noise_Filter{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Noise_Filter()){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.data_in #= true
      dut.clockDomain.waitSampling(10)
      dut.io.data_in #= true
      dut.clockDomain.waitSampling()
      dut.io.data_in #= false
      dut.clockDomain.waitSampling()
      dut.io.data_in #= true
      dut.clockDomain.waitSampling(3)
      dut.io.data_in #= false
      dut.clockDomain.waitSampling(3)
      dut.io.data_in #= true
      dut.clockDomain.waitSampling(2)
      dut.io.data_in #= false
      dut.clockDomain.waitSampling(2)
      dut.io.data_in #= true
      dut.clockDomain.waitSampling(4)
      dut.io.data_in #= false
      dut.clockDomain.waitSampling(4)
      dut.clockDomain.waitSampling(100)
    }
  }
}*/