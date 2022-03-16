package Memory

import UART.UartTop
import spinal.core.{Mem, _}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.slave
import spinal.core.sim._

case class Muli_Mem(writeport_num : Int, dataWidth : Int, addressWidth : Int, decodings: Seq[SizeMapping]) extends Component{
  import RamPortType._
  val io = new Bundle {
    val reads = slave(XILINX_BRAM_PORT(dataWidth, addressWidth, READ))
    val writes = Seq.fill(writeport_num)(slave(XILINX_BRAM_PORT(dataWidth, addressWidth, WRITE)))
  }
  noIoPrefix()

  val datatemp = Reg(Bits(dataWidth bits))
  val readport = Seq.fill(writeport_num)((XILINX_BRAM_PORT(dataWidth, addressWidth, READ)))
  val rams = Seq.fill(writeport_num)(Mem(Bits(dataWidth bits), BigInt(1) << 8))

  rams.zip(io.writes).foreach{case (ram, port) =>
    ram.write(port.addr.resize(8),port.dataIn,port.en&&port.we)
    ram.addAttribute("ram_style", "block")
  }
  rams.zip(readport).foreach{case (ram, port) =>
    port.dataOut := ram.readAsync(port.addr.resize(8))
    port.addr := io.reads.addr
  }

  for((decoding,port) <- (decodings, readport).zipped){
    when(decoding.hit(io.reads.addr)){
      datatemp := port.dataOut
    }
  }
  io.reads.dataOut := datatemp
}

/*object Muli_Mem extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new Muli_Mem(2,32,10,List((0x00000, 1 KiB),
    (0x2000, 1 KiB))))
}*/

object Muli_Mem{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new Muli_Mem(2,32,12,List((0x00000, 64 Byte),(0x100, 64 Byte)))){dut =>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(20)
      dut.io.writes(0).en #= true
      dut.io.writes(0).addr #= 0x005
      dut.io.writes(0).dataIn #= 0x1234
      dut.io.writes(0).we #= true
      dut.clockDomain.waitSampling()
      dut.io.writes(0).en #= false
      dut.io.writes(0).we #= false
      dut.clockDomain.waitSampling()
      dut.io.writes(1).en #= true
      dut.io.writes(1).addr #= 0x105
      dut.io.writes(1).dataIn #= 0x5678
      dut.io.writes(1).we #= true
      dut.clockDomain.waitSampling()
      dut.io.writes(1).en #= false
      dut.io.writes(1).we #= false
      dut.clockDomain.waitSampling(10)
      dut.io.writes(0).en #= true
      dut.io.writes(0).addr #= 0x006
      dut.io.writes(0).dataIn #= 0x010203
      dut.io.writes(0).we #= true
      dut.clockDomain.waitSampling()
      dut.io.writes(0).en #= false
      dut.io.writes(0).we #= false
      dut.clockDomain.waitSampling()
      dut.io.writes(1).en #= true
      dut.io.writes(1).addr #= 0x106
      dut.io.writes(1).dataIn #= 0x050607
      dut.io.writes(1).we #= true
      dut.clockDomain.waitSampling()
      dut.io.writes(1).en #= false
      dut.io.writes(1).we #= false
      dut.clockDomain.waitSampling(50)

      dut.io.reads.addr #= 0x005
      dut.clockDomain.waitSampling(20)
      dut.io.reads.addr #= 0x106
      dut.clockDomain.waitSampling(100)
      dut.clockDomain.waitSampling(100)
    }
  }
}


