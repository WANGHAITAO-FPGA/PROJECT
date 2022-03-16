package FIBERTOUART

import UART.uartctrl_stream
import spinal.core._
import spinal.lib.com.uart.Uart
import spinal.lib.{CounterFreeRun, Fragment, Stream, StreamFragmentWidthAdapter, master, slave}

import scala.util.Random

/*********************************************************************************************************************************/
/************portcount 转换的MODUS通道数量）*********************************************/
/************datawidth 光纤传输数据宽度*********************************************/
/************distrib_length 分配的单个MODUS指令所占的寄存器长度（32位寄存器）*********************************************/
/************txfifodepth MODUS串口FIFO发送深度*********************************************/
/************rxfifodepth MODUS串口FIFO接受深度*********************************************/
/************rx_waittime MODUS串口认定接受完成一帧数据所等待的时间*********************************************/
/************timerl_imit 光纤定时传输时间*********************************************/
/*********************************************************************************************************************************/

class FiberTop(portcount : Int, datawidth : Int, distrib_length : Int, txfifodepth: Int, rxfifodepth : Int, rx_waittime : Int, timerl_imit: Int,lookback : Boolean) extends Component{
  val io = new Bundle{
    val input = slave(Stream(Fragment(Bits(datawidth bits))))
    val output = master(Stream(Fragment(Bits(datawidth bits))))
    val timer_tick = in Bool()
    val clk = in Bool()
    val reset = in Bool()
    val uart = if(!lookback) Seq.fill(portcount)(master(Uart())) else null
    val led = out Bool()
  }
  noIoPrefix()

  val fiberclkdomain = ClockDomain(io.clk,io.reset,frequency = FixedFrequency(125 MHz))

  val fiberarea = new ClockingArea(fiberclkdomain){
    val fiberrxpreamble = new FiberRxPreamble(32)
    fiberrxpreamble.io.input << io.input
    fiberrxpreamble.io.slave_id := B"x00000001"

    val fiberrxbuffer = new FiberRxBuffer(fiberclkdomain,fiberclkdomain,datawidth,8,256)
    fiberrxbuffer.io.push.stream << fiberrxpreamble.io.output

    val fiberrxstream = new FiberRxStream(portcount,8,portcount*distrib_length*datawidth/8)
    fiberrxstream.io.input << fiberrxbuffer.io.pop.stream

    val modbus = Seq.fill(portcount)(new ModusTop(txfifodepth,rxfifodepth,rx_waittime,lookback))

    val fibertxstream = new FiberTxStream(fiberclkdomain,fiberclkdomain,portcount,datawidth,portcount*distrib_length*datawidth/8,rxfifodepth,timerl_imit)

    for(i <- 0 until portcount){
      if(!lookback) io.uart(i) <> modbus(i).io.uart
      modbus(i).io.input << fiberrxstream.io.output(i)
      modbus(i).io.slaveid := i + 1
      modbus(i).io.reads.en := fibertxstream.io.reads(i).en
      modbus(i).io.reads.addr := fibertxstream.io.reads(i).addr
      fibertxstream.io.reads(i).dataOut := modbus(i).io.reads.dataOut
    }

    val fibertxheader = new FiberTxHeader(32)
    fibertxheader.io.input << fibertxstream.io.output
    //io.output << fibertxheader.io.output

    val fibertxpadder = new FiberTxPadder(32,64)
    fibertxpadder.io.input << fibertxheader.io.output
    io.output << fibertxpadder.io.output

    fibertxstream.io.timer_tick := io.timer_tick

    val ledtemp = Reg(Bool()) init False

    val counter =  CounterFreeRun(62500000)
    when(counter.willOverflow){
      counter.clear()
      ledtemp := ~ledtemp;
    }
    io.led := ledtemp
  }
}

object FiberTop_v extends App{
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(125 MHz)
  ).generateVerilog(new FiberTop(7,32,8,32,32,4000,6000,false))
}


case class FiberTest() extends FiberTop(7,32,8,32,32,4000,6000,true){
  import spinal.core.sim._
  def init: Unit ={
    fiberarea.clockDomain.forkStimulus(10)
    io.input.payload.last #= false
    io.input.valid #= false
    io.output.ready #= true
    io.timer_tick #= true
    fiberarea.clockDomain.waitSampling(10)
  }
  def header: Unit ={
    io.input.payload.fragment #= 0x00F1F2F3
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0x00000001
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
  }
  def modbus_read(slaveid:Int, functioncode:Int, addr: Int, length: Int, crc: Int, last : Boolean): Unit ={
    io.input.payload.fragment #= (slaveid<<24)+(functioncode<<16)+addr
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= (length>>16)+crc
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    if(last)io.input.payload.last #= true else io.input.payload.last #= false
    fiberarea.clockDomain.waitSampling()
  }
  def modbus_write(slaveid:Int, functioncode:Int, addr: Int, length: Int, data: Int, crc: Int, last : Boolean): Unit ={
    io.input.payload.fragment #= (slaveid<<24)+(functioncode<<16)+addr
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= ((length&0xffff)<<16)+((2*length)<<8)+ (data>>8)&0xff
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= ((data&0xff)<<24)+(crc<<8)
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    fiberarea.clockDomain.waitSampling()
    io.input.payload.fragment #= 0
    io.input.valid #= true
    if(last)io.input.payload.last #= true else io.input.payload.last #= false
    fiberarea.clockDomain.waitSampling()
  }
  def reset : Unit ={
    io.input.valid #= false
    io.input.payload.last #= false
  }

  def waitcycle(count: Int): Unit ={
    for(i <- 0 until count){
      fiberarea.clockDomain.waitSampling()
    }
  }
}

object FiberTop{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(new FiberTest())
    dut.doSim{dut=>
      dut.init
      dut.header
      dut.modbus_write(1,16,300,1,85,340,false)
      dut.modbus_write(2,16,300,1,85,340,false)
      dut.modbus_write(3,16,300,1,85,340,false)
      dut.modbus_write(4,16,300,1,85,340,false)
      dut.modbus_write(5,16,300,1,85,340,false)
      dut.modbus_write(6,16,300,1,85,340,false)
      dut.modbus_write(7,16,300,1,85,340,true)
      dut.reset
      dut.fiberarea.clockDomain.waitSampling(100000)
      for(i <- 0 until 10000){
        dut.io.output.ready #= Random.nextBoolean()
        dut.fiberarea.clockDomain.waitSampling()
      }
    }
  }
}