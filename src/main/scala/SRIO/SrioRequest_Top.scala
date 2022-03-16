package SRIO

import spinal.core._
import spinal.lib.{Fragment, StreamFifoCC, StreamWidthAdapter, master, slave}
import spinal.core.sim._

class SrioRequest_Cmd(pushcd : ClockDomain, popcd : ClockDomain, byteSize : Int) extends Component{
  val io = new Bundle{
    val ireq_cmd = in Bits(32 bits)
    val ireq_addr = in Bits(32 bits)
    val ireq_start = in Bool()
    val ireq_data_in = slave Stream (Bits(32 bits))
    val iresp_data_out = master Stream (Bits(32 bits))
    //val ireq_stream = master Stream Fragment(Bits(64 bits))

  }
  noIoPrefix()

  val apterarea = new ClockingArea(pushcd){
    val srio_txbuffer = StreamFifoCC(Bits(64 bits),byteSize,pushcd,popcd)
    StreamWidthAdapter(io.ireq_data_in,srio_txbuffer.io.push)
  }

  val srio_txarea = new ClockingArea(popcd){
    val srio_request = new SrioRequest
    srio_request.io.user_tid := io.ireq_cmd(31 downto 24)
    srio_request.io.user_ftype := io.ireq_cmd(23 downto 20)
    srio_request.io.user_ttype := io.ireq_cmd(19 downto 16)
    srio_request.io.user_size := io.ireq_cmd(15 downto 8)
    srio_request.io.user_prio := io.ireq_cmd(1 downto 0)
    srio_request.io.user_addr := io.ireq_addr.resize(34 bits)
    srio_request.io.send_start := io.ireq_start
    srio_request.io.user_data << apterarea.srio_txbuffer.io.pop
    //srio_request.io.ireq <> io.ireq_stream
    //srio_request.io.iresp_stream <> io.iresp_data_out


    val srio_iresprxbuffer = StreamFifoCC(Bits(64 bits),byteSize,popcd,pushcd)
    srio_iresprxbuffer.io.push << srio_request.io.iresp_stream

    /****************lookback_Test*************************/
    val srio_response = new SrioResponse(8,0)
    srio_response.io.treq << srio_request.io.ireq
    srio_response.io.tresp >> srio_request.io.iresp
    srio_response.io.treq_tuser := B"32'xffcc"
  }

  val iresparea = new ClockingArea(pushcd){
    StreamWidthAdapter(srio_txarea.srio_iresprxbuffer.io.pop,io.iresp_data_out)
  }
}

/*
object SrioRequest_Cmd extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new SrioRequest_Cmd(ClockDomain.external("clk"),ClockDomain.external("srioclk"),128))
}*/

object SrioRequest_Cmd{
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new SrioRequest_Cmd(ClockDomain.external("clk"),ClockDomain.external("srioclk"),128)){dut=>
      dut.apterarea.clockDomain.forkStimulus(10)
      dut.srio_txarea.clockDomain.forkStimulus(10)
      dut.io.ireq_cmd #= 0
      dut.io.ireq_addr #= 0
      dut.io.ireq_start #= false
      dut.io.ireq_data_in.valid #= false
      dut.io.iresp_data_out.ready #= true
      //dut.io.ireq_stream.ready #= true
      dut.apterarea.clockDomain.waitSampling(20)
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x01020304
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x05060708
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x11223344
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x55667788
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x090a0b0c
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x0d0e0f10
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x12345678
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x04050607
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.payload #= 0x090a0b0c
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x0d0e0f10
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= false
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_cmd #= 0x55540801
      dut.io.ireq_addr #= 100
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= true
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= false
      dut.apterarea.clockDomain.waitSampling(50)


      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_cmd #= 0x55540801
      dut.io.ireq_addr #= 100
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= true
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= false
      dut.apterarea.clockDomain.waitSampling(50)
      /*dut.io.ireq_cmd #= 0x55a00000
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= true
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= false
      dut.apterarea.clockDomain.waitSampling(50)*/
      dut.io.ireq_cmd #= 0x55200064
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= true
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= false
      dut.apterarea.clockDomain.waitSampling(50)

      /*dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x01020304
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x05060708
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x11223344
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= true
      dut.io.ireq_data_in.payload #= 0x55667788
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_data_in.valid #= false
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_cmd #= 0x55540801
      dut.io.ireq_addr #= 100
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= true
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= false
      dut.apterarea.clockDomain.waitSampling(50)*/

      dut.io.ireq_cmd #= 0x55200064
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= true
      dut.apterarea.clockDomain.waitSampling()
      dut.io.ireq_start #= false
      dut.apterarea.clockDomain.waitSampling(50)

    }
  }

}

