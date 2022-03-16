package FIBERTOUART

import Memory.RamPortType.READ
import Memory.XILINX_BRAM_PORT
import SimpleBus.SimpleBusDemo
import UART.uartctrl_stream
import spinal.core._
import spinal.lib.com.uart.Uart
import spinal.lib.{master, slave}

import scala.collection.Seq

case class ModusTop(txfifodepth: Int, rxfifodepth : Int, rx_waittime : Int, lookback : Boolean) extends Component{
  val io = new Bundle{
    val input = slave Stream (Bits(8 bit))
    val slaveid = in Bits(8 bit)
    val uart  = if(!lookback) master(Uart()) else null
    val reads = slave(XILINX_BRAM_PORT(8, log2Up(rxfifodepth), READ))
  }
  noIoPrefix()

  val decoderxstream = new DecodeRxStream()
  decoderxstream.io.input << io.input
  decoderxstream.io.slaveid := io.slaveid

  val uartctrl_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
  uartctrl_stream.io.stream_in << decoderxstream.io.output

  if(!lookback) uartctrl_stream.io.uart <> io.uart
  else uartctrl_stream.io.uart.rxd := uartctrl_stream.io.uart.txd

  val meminitvalue = for(i <- 0 until rxfifodepth)yield{
    BigInt(0)
  }
  val mem = Mem(Bits(8 bits), rxfifodepth) initBigInt(meminitvalue)
  mem.addAttribute("ram_style", "block")

  val mem_addr = Reg(UInt((log2Up(rxfifodepth)) bits)) init 0

  when(uartctrl_stream.io.rxint && (uartctrl_stream.io.rxfifooccupancy =/= 0)){
    uartctrl_stream.io.rxfiforead := True
    uartctrl_stream.io.stream_out.ready := True
    when(uartctrl_stream.io.stream_out.fire){
      mem_addr := mem_addr + 1
    }
  }otherwise{
    mem_addr := 0
    uartctrl_stream.io.stream_out.ready := False
    uartctrl_stream.io.rxfiforead := False
  }
  mem.write(mem_addr,uartctrl_stream.io.stream_out.payload,uartctrl_stream.io.stream_out.fire)
  io.reads.dataOut := mem.readSync(io.reads.addr,io.reads.en)
}

object ModusTop extends App{
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency=FixedFrequency(125 MHz)
  ).generateVerilog(new ModusTop(32,32,100,false))
}

/*object ModusTop{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new ModusTop(1,32,32,1000)){dut=>
      dut.uartarea.clockDomain.forkStimulus(10)
      dut.io.input.valid #= false
      dut.io.reads.en #= false
      dut.uartarea.clockDomain.waitSampling(10)
      dut.io.input.valid #= false
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x01
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x10
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x04
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x05
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x00
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x01
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0x02
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa1
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.payload #= 0xa2
      dut.io.input.valid #= true
      dut.uartarea.clockDomain.waitSampling()
      dut.io.input.valid #= false
      dut.uartarea.clockDomain.waitSampling(20000)
      dut.io.reads.en #= true
      dut.io.reads.addr #= 0
      dut.uartarea.clockDomain.waitSampling()
      dut.io.reads.en #= true
      dut.io.reads.addr #= 1
      dut.uartarea.clockDomain.waitSampling()
      dut.io.reads.en #= true
      dut.io.reads.addr #= 2
      dut.uartarea.clockDomain.waitSampling()
      dut.io.reads.en #= true
      dut.io.reads.addr #= 3
      dut.uartarea.clockDomain.waitSampling()
      dut.io.reads.en #= true
      dut.io.reads.addr #= 4
      dut.uartarea.clockDomain.waitSampling()
      dut.io.reads.en #= true
      dut.io.reads.addr #= 5
      dut.uartarea.clockDomain.waitSampling()
      dut.io.reads.en #= true
      dut.io.reads.addr #= 6
      dut.uartarea.clockDomain.waitSampling(1000)
    }
  }
}*/
