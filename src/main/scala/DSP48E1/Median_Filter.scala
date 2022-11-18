package DSP48E1

import spinal.core.{SInt, _}
import spinal.lib._

import scala.util.Random

case class FindMax(width: Int, count: Int, pipelineGap:Int) extends Component {
  require(isPow2(count))
  val dataType = HardType(SInt(width bits))
  val dataIn = in Vec(dataType, count)
  val dataOut = out(dataType())

  def recursiveComparation(vec: Vec[SInt]): Vec[SInt] = {
    val N = vec.size
    val ret = N match {
      case 2 => Vec(Mux(vec(0) > vec(1), vec(0), vec(1)))
      case _ => {
        val left = recursiveComparation(Vec(vec.take(N / 2)))
        val right = recursiveComparation(Vec(vec.takeRight(N / 2)))
        Vec(left.zip(right).map { case (l, r) => Mux(l > r, l, r) })
      }
    }
    if(log2Up(N) % pipelineGap == 1) RegNext(ret) else ret
  }

  dataOut := recursiveComparation(dataIn).head
}

case class FindMin(width: Int, count: Int, pipelineGap:Int) extends Component {
  require(isPow2(count))
  val dataType = HardType(SInt(width bits))
  val dataIn = in Vec(dataType, count)
  val dataOut = out(dataType())

  def recursiveComparation(vec: Vec[SInt]): Vec[SInt] = {
    val N = vec.size
    val ret = N match {
      case 2 => Vec(Mux(vec(0) < vec(1), vec(0), vec(1)))
      case _ => {
        val left = recursiveComparation(Vec(vec.take(N / 2)))
        val right = recursiveComparation(Vec(vec.takeRight(N / 2)))
        Vec(left.zip(right).map { case (l, r) => Mux(l < r, l, r) })
      }
    }
    if(log2Up(N) % pipelineGap == 1) RegNext(ret) else ret
  }

  dataOut := recursiveComparation(dataIn).head
}


case class Median_Filter(sample_cnt : Int) extends Component{
  val io = new Bundle{
    val data_in = slave Flow(SInt(16 bits))
    //val data_out = master Flow(SInt(16 bits))
    val data_max = out SInt(16 bits)
    val data_min = out SInt(16 bits)
    val data_averge = out SInt(16 bits)
  }
  noIoPrefix()

  val counter = Reg(UInt(10 bits)) init 0
  val data_temp = Reg(Vec(SInt(16 bits),sample_cnt))
  val data_max = Reg(SInt(16 bits)) init 0
  val findmax = new FindMax(16,sample_cnt,1)
  val findmin = new FindMin(16,sample_cnt,1)
  val data_averge =  Reg(SInt(16 bits)) init 0

  when(io.data_in.valid){
    counter := counter + 1
    data_temp(counter.resized) := io.data_in.payload
  }

  when(counter === sample_cnt){
    counter := 0
    data_averge := ((data_temp.reduce(_+^_) - findmax.dataOut - findmin.dataOut)/(sample_cnt-2)).resized
  }

  findmax.dataIn := data_temp
  findmin.dataIn := data_temp
  io.data_max := RegNextWhen(findmax.dataOut,counter === sample_cnt)
  io.data_min := RegNextWhen(findmin.dataOut,counter === sample_cnt)

  io.data_averge := data_averge
}




object Median_Filter{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Median_Filter(8)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.data_in.valid #= false
      dut.clockDomain.waitSampling(10)
      for(idex <- 0 until 16){
        dut.io.data_in.valid #= true
        dut.io.data_in.payload #= Random.nextInt(200)
        dut.clockDomain.waitSampling()
        dut.io.data_in.valid #= false
        dut.clockDomain.waitSampling(10)
      }
      dut.clockDomain.waitSampling(1000)
    }
  }
}