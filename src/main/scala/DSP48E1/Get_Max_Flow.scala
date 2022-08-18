package DSP48E1

import spinal.core._
import spinal.lib.{StreamFifo, master, slave}

import scala.util.Random

case class Get_MaxMin_Flow(datawidth: Int, sample_cnt : Int) extends Component{
  val io = new Bundle{
    val data_in = slave Flow(SInt(datawidth bits))
    val data_max = master Flow(SInt(datawidth bits))
    val data_min = master Flow(SInt(datawidth bits))
    val data_middle = master Flow(SInt(datawidth bits))
  }
  noIoPrefix()

  val counter = Reg(UInt(log2Up(sample_cnt)+1 bits)) init 0
  val data_temp = Reg(Vec(SInt(datawidth bits),sample_cnt))
  val valid = Reg(Bool()) init False
  val data_middle = Reg(SInt(datawidth bits)) init 0

  val findmax = new FindMax(datawidth,sample_cnt,1)
  val findmin = new FindMin(datawidth,sample_cnt,1)

  when(io.data_in.valid && (counter < sample_cnt-1)){
    counter := counter + 1
    data_temp(counter.resized) := io.data_in.payload
  }elsewhen(io.data_in.valid && (counter === sample_cnt-1)){
    counter := 0
    valid := True
    data_temp(counter.resized) := io.data_in.payload
  }

  findmax.dataIn := data_temp
  findmin.dataIn := data_temp
  io.data_max.payload := findmax.dataOut
  io.data_max.valid := valid && RegNext(io.data_in.valid)
  io.data_min.payload := findmin.dataOut
  io.data_min.valid := valid && RegNext(io.data_in.valid)

  when(io.data_max.valid){
    data_middle := ((io.data_max.payload +^ io.data_min.payload)>>1).resized
  }
  io.data_middle.payload := data_middle
  io.data_middle.valid := RegNext(io.data_max.valid)
}

case class Data_Adjust(datawidth: Int, sample_cnt : Int) extends Component{
  val io = new Bundle{
    //val data_in = slave Flow(SInt(datawidth bits))
    val data_out = master Flow(SInt(datawidth bits))
    val quard_out = out Bool()
  }
  noIoPrefix()

  val test_data = new Test_Data(datawidth,sample_cnt)

  val get_maxmin = new Get_MaxMin_Flow(datawidth,sample_cnt)
  get_maxmin.io.data_in := test_data.io.data_out
  val quard_out = Reg(Bool()) init False

  val data_fifo = new StreamFifo(SInt(datawidth bits),2*sample_cnt)
  data_fifo.io.push.payload := test_data.io.data_out.payload
  data_fifo.io.push.valid := test_data.io.data_out.valid

  data_fifo.io.pop.ready := get_maxmin.io.data_middle.valid
  io.data_out.valid := get_maxmin.io.data_middle.valid
  io.data_out.payload := ((data_fifo.io.pop.payload - get_maxmin.io.data_middle.payload)*(((1<<(datawidth-2))-1)/get_maxmin.io.data_max.payload)).resized

  when(get_maxmin.io.data_middle.valid){
    when(data_fifo.io.pop.payload > get_maxmin.io.data_middle.payload){
      quard_out := True
    }otherwise{
      quard_out := False
    }
  }
  io.quard_out := quard_out
}

case class Test_Data(datawidth: Int,sampleCount : Int) extends Component{
  val io = new Bundle{
    val data_out = master Flow(SInt(datawidth bits))
  }
  noIoPrefix()

  val romSamples = for(sampleld <- 0 until sampleCount)yield{
    val sin = Math.sin(2*Math.PI*sampleld/sampleCount)
    val normalizedSin = 0.25*sin*(Math.pow(2.0,datawidth)-1)
    BigInt(normalizedSin.toLong)
  }
  val rom = Mem(SInt(datawidth bits),sampleCount) initBigInt(romSamples,true)

  val i = Reg(UInt(log2Up(sampleCount) bits)) init 0

  val counter = Reg(UInt(log2Up(sampleCount) bits)) init 0

  val data_valid = Reg(Bool()) init False

  val tt = Reg(UInt(10 bits)) init 0

  when(tt < 500){
    tt := tt + 1
  }otherwise{
    when(counter < 8){
      counter := counter + 1
      data_valid := False
    }otherwise{
      data_valid := True
      counter := 0
      when(i < sampleCount-1){
        i := i + 1
      }otherwise{
        i := 0
      }
    }
  }

  io.data_out.payload := rom.readAsync(i) - 5000
  io.data_out.valid := data_valid
}

object Test_Data{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Test_Data(16,32)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(1000)
    }
  }
}



object Get_Max_Flow{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Data_Adjust(16,16)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(1000)
    }
  }
}