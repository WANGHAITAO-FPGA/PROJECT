package VME
/*
import Memory.RamPortType.{READ, WRITE}
import Memory.XILINX_BRAM_PORT
import spinal.core._
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.slave

/*********************************************************************
 * @param dataWidth
 * @param addressWidth
 * @param decodings 第一段地址范围用于存放VME数据，第二段地址范围用于存放SENSOR数据
 * writes(0) 用于存储VME总线数据，writes(1) 用于存储SENSOR数据
 * reads(0) VME总线读取数据， reads(1) GSSL 定时发送数据 *
 ********************************************************************/

case class Mem_Module(dataWidth : Int, addressWidth : Int, decodings: Seq[SizeMapping]) extends Component{
  val io = new Bundle{
    val vmeclk = in Bool()
    val gssl_wrclk = in Bool()
    val gssl_rdclk = in Bool()
    val reset = in Bool()
    val writes = Seq.fill(2)(slave(XILINX_BRAM_PORT(dataWidth, addressWidth, WRITE)))
    val reads = Seq.fill(2)(slave(XILINX_BRAM_PORT(dataWidth, addressWidth, READ)))
  }
  noIoPrefix()

  val rams_port1 = Seq.fill(2)(Mem(Bits(dataWidth bits), BigInt(1) << 8))
  val rams_port2 = Seq.fill(2)(Mem(Bits(dataWidth bits), BigInt(1) << 8))
  val readport1 = Seq.fill(2)((XILINX_BRAM_PORT(dataWidth, addressWidth, READ)))
  val readport2 = Seq.fill(2)((XILINX_BRAM_PORT(dataWidth, addressWidth, READ)))

  val vmeclkdomain = ClockDomain(io.vmeclk,io.reset)
  val gssl_wrclkdomain = ClockDomain(io.gssl_wrclk,io.reset)
  val gssl_rdclkdomain = ClockDomain(io.gssl_rdclk,io.reset)

  val vmearea = new ClockingArea(vmeclkdomain){
    val datatemp1 = Reg(Bits(dataWidth bits))
    rams_port1(0).write(io.writes(0).addr.resize(8),io.writes(0).dataIn,io.writes(0).en&&io.writes(0).we)
    rams_port1(0).addAttribute("ram_style", "block")
    rams_port2(0).write(io.writes(0).addr.resize(8),io.writes(0).dataIn,io.writes(0).en&&io.writes(0).we)
    rams_port2(0).addAttribute("ram_style", "block")
    rams_port1.zip(readport1).foreach{case (ram, port) =>
      port.dataOut := ram.readAsync(port.addr.resize(8))
      port.addr := io.reads(0).addr
    }
    for((decoding,port) <- (decodings, readport1).zipped){
      when(decoding.hit(io.reads(0).addr)){
        datatemp1 := port.dataOut
      }
    }
    io.reads(0).dataOut := datatemp1
  }

  val gssl_wrarea = new ClockingArea(gssl_wrclkdomain){

    rams_port1(1).write(io.writes(1).addr.resize(8),io.writes(1).dataIn,io.writes(1).en&&io.writes(1).we)
    rams_port1(1).addAttribute("ram_style", "block")
    rams_port2(1).write(io.writes(1).addr.resize(8),io.writes(1).dataIn,io.writes(1).en&&io.writes(1).we)
    rams_port2(1).addAttribute("ram_style", "block")

  }
  val gssl_rdarea = new ClockingArea(gssl_rdclkdomain){
    val datatemp2 = Reg(Bits(dataWidth bits))
    rams_port2.zip(readport2).foreach{case (ram, port) =>
      port.dataOut := ram.readAsync(port.addr.resize(8))
      port.addr := io.reads(1).addr
    }
    for((decoding,port) <- (decodings, readport2).zipped){
      when(decoding.hit(io.reads(1).addr)){
        datatemp2 := port.dataOut
      }
    }
    io.reads(1).dataOut := datatemp2
  }
}

object Mem_Module extends App{
  SpinalVerilog(new Mem_Module(16,8,List((0x00000, 64 Byte),(0x1000, 64 Byte))))
}*/
