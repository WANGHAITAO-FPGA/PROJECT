package MDCB_2

import spinal.core._
import spinal.lib.{BufferCC, History, traversableOnceBoolPimped}

case class IoFilter(samplingSize: Int) extends Component {
  val io = new Bundle{
    val io_in = in Bool()
    val io_out = out Bool()
  }
  noIoPrefix()

  val timer = new Area{
    val counter = Reg(UInt(1 bits)) init(0)
    val tick    = counter === 0

    counter := counter - 1
    when(tick){
      counter := 1
    }
  }

  val sampler = new Area {
    val ioSync = BufferCC(io.io_in, True)
    val ioSamples = History(that = ioSync, range = 0 until samplingSize, when = timer.tick, init = True)
  }

  val iosampleout = RegInit(True)

  when(timer.tick){
    when(sampler.ioSamples.map(_ =/= iosampleout).andR){
      iosampleout := sampler.ioSamples.last
    }
  }

  io.io_out := iosampleout
}

case class Mdcb_Ioin_Filter(samplingSize: Int) extends Component{
  val io = new Bundle{
    val M_Fault_TTL = in Bits(8 bits)
    val FPGA_DI = in  Bits(16 bits)
    val M_Fault_TTL_Filter = out Bits(8 bits)
    val FPGA_DI_Filter = out Bits(16 bits)
  }
  noIoPrefix()

  val io_filter = Seq.fill(24)(new IoFilter(samplingSize))

  val M_Fault_TTL_Filter = Reg(Bits(8 bits)) init 0
  val FPGA_DI_Filter = Reg(Bits(16 bits)) init 0

  for(i <- 0 until 8){
    io_filter(i).io.io_in := io.M_Fault_TTL(i)
    M_Fault_TTL_Filter(i) := io_filter(i).io.io_out
  }
  io.M_Fault_TTL_Filter := M_Fault_TTL_Filter

  for(i <- 8 until 24){
    io_filter(i).io.io_in := io.FPGA_DI(i-8)
    FPGA_DI_Filter(i-8) := io_filter(i).io.io_out
  }
  io.FPGA_DI_Filter := FPGA_DI_Filter
}

object Mdcb_Ioin_Filter extends App{
  SpinalVerilog(new Mdcb_Ioin_Filter(2))
}