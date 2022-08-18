package DSP48E1

import spinal.core.{Bits, _}
import spinal.lib.{Counter, Delay}

case class Fre_200U() extends Component{
  val io = new Bundle{
    val tick = in Bool()
    val clk_out = out Bool()
  }
  noIoPrefix()

  val clk_out = Reg(Bool()) init False
  val clk_temp = Reg(Bool()) init False

  val tick = Reg(Bool()) init False
  tick := io.tick

  val start = Reg(Bool()) init False
  when(io.tick.rise()){
    start := True
  }
  val counter = Counter(25000)
  when(start){
    counter.increment()
  }
  when(counter.willOverflow){
    clk_temp := True
  }otherwise{
    clk_temp := False
  }

  clk_out := clk_temp | Delay(clk_temp,1,init = False) | Delay(clk_temp,2,init = False) | Delay(clk_temp,3,init = False)

  io.clk_out := clk_out
}

object Fre_200U{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Fre_200U){dut=>
      dut.clockDomain.forkStimulus(8)
      dut.io.tick #= false
      dut.clockDomain.waitSampling(10)
      dut.io.tick #= true
      dut.clockDomain.waitSampling()
      dut.io.tick #= false
      dut.clockDomain.waitSampling(100000)
    }
  }
}

case class cal_int(datawidth : Int) extends Component{
  val io = new Bundle{
    val rx_done = in Bool()
    val dsp_int = in Bool()
    val rx_counter = out UInt(datawidth bits)
    val dsp_int_counter = out UInt(datawidth bits)
  }
  noIoPrefix()
  val rx_done = Reg(Bool()) init False
  rx_done := io.rx_done
  val dsp_int = Reg(Bool()) init False
  dsp_int := io.dsp_int

  val rx_counter = Counter((1<<(datawidth+2)))
  val dsp_counter = Counter((1<<datawidth))

  when(rx_done.rise()){
    rx_counter.increment()
  }
  when(dsp_int.rise()){
    dsp_counter.increment()
  }
  when(dsp_counter.willOverflow){
    rx_counter.clear()
    dsp_counter.clear()
  }
  io.rx_counter := (rx_counter.value>>2).resized
  io.dsp_int_counter := dsp_counter.value
}

object cal_int extends App{
  SpinalVerilog(new cal_int(28))
}

case class test_data_T(datawidth : Int) extends Component{
  val io = new Bundle{
    val tick = in Bool()
    val t_data = out Bits(datawidth bits)
    val t_counter = out UInt(32 bits)
  }
  noIoPrefix()
  val tick = Reg(Bool()) init False
  tick := io.tick

  val data_temp = Reg(Bits(datawidth bits)) init 0
  val t_counter = Reg(UInt(32 bits)) init 0

  when(tick.rise()){
    t_counter := t_counter + 1
    when(data_temp === 0){
      data_temp := B"32'xFFFFFFFF"
    }elsewhen(data_temp === B"32'xFFFFFFFF"){
      data_temp := 0
    }otherwise{
      data_temp := data_temp
    }

  }
  io.t_data := data_temp
  io.t_counter := t_counter
}

object test_data_T extends App{
  SpinalVerilog(new test_data_T(32))
}