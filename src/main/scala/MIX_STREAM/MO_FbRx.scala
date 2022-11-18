package MIX_STREAM

import FIBERTOUART.{FiberRxPreamble, FiberTxPadder}
import MO.Xilinx_Bram
import PHPA82.ila_test.ila
import spinal.core
import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.misc.Timer
import spinal.lib.{BIG, Counter, Fragment, PulseCCByToggle, Stream, StreamFifo, StreamFifoCC, StreamFifoLowLatency, StreamFragmentWidthAdapter, StreamMux, master, slave}

import scala.util.Random

case class MO_FbRx(hssl_cd : ClockDomain, srio_cd : ClockDomain, datawidth : Int = 32, cycles_number : Int = 64) extends Component{
  val io = new Bundle{
    val hssl_input = slave Stream(Fragment(Bits(datawidth bits)))
    val output = master Stream (Fragment(Bits(64 bits)))
    val slave_id = in Bits(32 bits)
    val pulse_out = out Bool()
  }
  noIoPrefix()
  val hssl_pusharea = new ClockingArea(hssl_cd) {
    val hssl_rxpreamble = FiberRxPreamble(datawidth)
    hssl_rxpreamble.io.input << io.hssl_input
    hssl_rxpreamble.io.slave_id := io.slave_id
    val hssl_rxpadder = FiberTxPadder(datawidth,cycles_number)
    hssl_rxpadder.io.input << hssl_rxpreamble.io.output

    val hssl_stream = Stream(Fragment(Bits(64 bits)))
    StreamFragmentWidthAdapter(hssl_rxpadder.io.output,hssl_stream,BIG)
    hssl_stream.ready := True

    val wcounter = new Counter(0,cycles_number)
    when(hssl_stream.fire){
      wcounter.increment()
      when(hssl_stream.last){
        wcounter.clear()
      }
    }

    val ram = Mem(Bits(64 bits), cycles_number)
    ram.addAttribute("ram_style", "block")
    ram.readWriteSync(wcounter.resized,hssl_stream.payload.fragment,True,hssl_stream.fire)

    val pulse = new PulseCCByToggle(hssl_cd,srio_cd)
    pulse.io.pulseIn := hssl_rxpadder.io.output.payload.last
  }
  val srio_area = new ClockingArea(srio_cd){
    val pulse_out = Reg(Bool()) init False
    pulse_out := hssl_pusharea.pulse.io.pulseOut

    val valid = Reg(Bool()) init False
    val counter = new Counter(0,cycles_number)
    when(valid){
      counter.increment()
    }

    val streamfifo = new StreamFifo(Bits(64 bits),cycles_number)

    when(pulse_out && (streamfifo.io.occupancy === 0)){
      valid := True
    }elsewhen(counter === cycles_number/2-1){
      valid := False
      counter.clear()
    }otherwise{
      valid := valid
    }

    streamfifo.io.push.valid := valid
    streamfifo.io.push.payload := hssl_pusharea.ram.readAsync(counter.resized)

    io.output.valid := streamfifo.io.pop.valid && io.output.ready
    io.output.payload.fragment := streamfifo.io.pop.payload
    io.output.payload.last := (streamfifo.io.occupancy === 1) && streamfifo.io.pop.fire
    streamfifo.io.pop.ready := io.output.ready
    io.pulse_out := streamfifo.io.occupancy > 30
  }
}

case class MO_ToSrio(hssl_cd : ClockDomain, srio_cd : ClockDomain, datawidth : Int = 32, cycles_number : Int = 64) extends Component{
  val io = new Bundle{
    val hssl_input = slave Stream(Fragment(Bits(datawidth bits)))
    val output = master Stream (Fragment(Bits(64 bits)))
    val header = in Bits(64 bits)
    val slave_id = in Bits(32 bits)
    val doorbell_Info = in Bits(64 bits)
    val tick_in = in Bool()
    val tick_out = out Bool()
    val currentState = out UInt(3 bits)
  }
  noIoPrefix()

  val hssl_area = new ClockingArea(hssl_cd){
    val hssl_fbrx = MO_FbRx(hssl_cd,srio_cd)
    hssl_fbrx.io.hssl_input << io.hssl_input
    hssl_fbrx.io.slave_id := io.slave_id
  }

  val srio_area = new ClockingArea(srio_cd){
    val tick_in = Reg(Bool()) init False
    tick_in := io.tick_in

    val tick_out = Reg(Bool()) init False
    tick_out := False

    val hssl_trigger = Reg(Bool()) init False
    hssl_trigger := hssl_area.hssl_fbrx.io.pulse_out

    val swrite_trigger = Reg(Bool()) init False
    swrite_trigger := False
    val doorbell_trigger = Reg(Bool()) init False
    doorbell_trigger := False

    val valid = Reg(Bool()) init False
    valid := False

    val fsm =new StateMachine{
      val Wait_Start: State = new State with EntryPoint {
        whenIsActive{
          when(tick_in.rise()){
            when(hssl_trigger){
              valid := True
              //goto(Send_HsslData)
              goto(Wait_SendDoorbell)
            }otherwise{
              goto(End)
            }
          }
        }
      }
      val Send_HsslData: State = new State{
        whenIsActive{
            swrite_trigger := True
            when(io.output.payload.last){
              //goto(Wait_SendDoorbell)
              goto(End)
            }
        }
      }
      val Wait_SendDoorbell: State = new State{
        whenIsActive{
          goto(SendDoorbell)
        }
      }
      val SendDoorbell: State = new State{
        whenIsActive{
          doorbell_trigger := True
          when(io.output.payload.last){
            doorbell_trigger := False
            goto(End)
          }
        }
      }
      val End: State = new State{
        whenIsActive{
          tick_out := True
          goto(Wait_Start)
        }
      }
    }
    io.output.valid := Mux(swrite_trigger, hssl_area.hssl_fbrx.io.output.valid, Mux(doorbell_trigger,io.output.ready,False))
    io.output.payload.fragment := Mux(swrite_trigger, hssl_area.hssl_fbrx.io.output.payload.fragment, Mux(doorbell_trigger,io.doorbell_Info,io.header))
    io.output.payload.last := Mux(swrite_trigger,hssl_area.hssl_fbrx.io.output.last,Mux(doorbell_trigger,io.output.ready,False))
    hssl_area.hssl_fbrx.io.output.ready := Mux(swrite_trigger,io.output.ready,False)
    io.tick_out := tick_out

    addPrePopTask(()=>io.currentState.assignFromBits(fsm.stateReg.asBits))
    val ila_probe=ila("3",io.output.valid,io.output.payload.last,io.output.payload.fragment,io.output.ready,swrite_trigger,io.currentState)
  }
}

case class StreamMuxWithFragment[T <: Data](dataType: T, portCount: Int) extends Component {
  val io = new Bundle {
    val select = in UInt (log2Up(portCount) bit)
    val inputs = Vec(slave(Stream(Fragment(dataType))), portCount)
    val output = master Stream(Fragment(dataType))
  }
  for ((input, index) <- io.inputs.zipWithIndex) {
    input.ready := io.select === index && io.output.ready
  }
  io.output.valid := io.inputs(io.select).valid
  io.output.payload.fragment := io.inputs(io.select).payload.fragment
  io.output.payload.last := io.inputs(io.select).payload.last
}

case class Srio_SendTop(hssl1_cd : ClockDomain, hssl2_cd : ClockDomain, srio_cd : ClockDomain, timerl_imit : Int) extends Component{
  val io = new Bundle{
    val hssl1_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl1_slaveid = in Bits(32 bits)
    val hssl1_header = in Bits(64 bits)
    val hssl1_doorbellinfo = in Bits(64 bits)
    val hssl2_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl2_slaveid = in Bits(32 bits)
    val hssl2_header = in Bits(64 bits)
    val hssl2_doorbellinfo = in Bits(64 bits)
    val hssl3_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl3_slaveid = in Bits(32 bits)
    val hssl3_header = in Bits(64 bits)
    val hssl3_doorbellinfo = in Bits(64 bits)
    val hssl4_input = slave(Stream(Fragment(Bits(32 bits))))
    val hssl4_slaveid = in Bits(32 bits)
    val hssl4_header = in Bits(64 bits)
    val hssl4_doorbellinfo = in Bits(64 bits)
    val srio_output = master(Stream(Fragment(Bits(64 bits))))
    val timer_tick = in Bool()
  }
  noIoPrefix()

  val hssl1_area = new ClockingArea(hssl1_cd){
    val hssl1_toSrio = MO_ToSrio(hssl1_cd,srio_cd)
    hssl1_toSrio.io.hssl_input << io.hssl1_input
    hssl1_toSrio.io.header := io.hssl1_header
    hssl1_toSrio.io.slave_id := io.hssl1_slaveid
    hssl1_toSrio.io.doorbell_Info := io.hssl1_doorbellinfo
  }

  val hssl2_area = new ClockingArea(hssl2_cd){
    val hssl2_toSrio = MO_ToSrio(hssl2_cd,srio_cd)
    hssl2_toSrio.io.hssl_input << io.hssl2_input
    hssl2_toSrio.io.header := io.hssl2_header
    hssl2_toSrio.io.slave_id := io.hssl2_slaveid
    hssl2_toSrio.io.doorbell_Info := io.hssl2_doorbellinfo

    val hssl3_toSrio = MO_ToSrio(hssl2_cd,srio_cd)
    hssl3_toSrio.io.hssl_input << io.hssl3_input
    hssl3_toSrio.io.header := io.hssl3_header
    hssl3_toSrio.io.slave_id := io.hssl3_slaveid
    hssl3_toSrio.io.doorbell_Info := io.hssl3_doorbellinfo

    val hssl4_toSrio = MO_ToSrio(hssl2_cd,srio_cd)
    hssl4_toSrio.io.hssl_input << io.hssl4_input
    hssl4_toSrio.io.header := io.hssl4_header
    hssl4_toSrio.io.slave_id := io.hssl4_slaveid
    hssl4_toSrio.io.doorbell_Info := io.hssl4_doorbellinfo
  }

  val srio_area = new ClockingArea(srio_cd){
    val timer = Timer(32)
    timer.io.tick := io.timer_tick
    timer.io.limit := timerl_imit
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }
    hssl1_area.hssl1_toSrio.io.tick_in := timer.io.full
    hssl2_area.hssl2_toSrio.io.tick_in := hssl1_area.hssl1_toSrio.io.tick_out
    hssl2_area.hssl3_toSrio.io.tick_in := hssl2_area.hssl2_toSrio.io.tick_out
    hssl2_area.hssl4_toSrio.io.tick_in := hssl2_area.hssl3_toSrio.io.tick_out

    val stream_mux = StreamMuxWithFragment(Bits(64 bits),4)
    stream_mux.io.inputs(0) << hssl1_area.hssl1_toSrio.io.output
    stream_mux.io.inputs(1) << hssl2_area.hssl2_toSrio.io.output
    stream_mux.io.inputs(2) << hssl2_area.hssl3_toSrio.io.output
    stream_mux.io.inputs(3) << hssl2_area.hssl4_toSrio.io.output
    io.srio_output << stream_mux.io.output

    val select = Reg(UInt(log2Up(4) bits)) init 0
    when(timer.io.full){
      select := 0
    }elsewhen(hssl1_area.hssl1_toSrio.io.tick_out){
      select := 1
    }elsewhen(hssl2_area.hssl2_toSrio.io.tick_out){
      select := 2
    }elsewhen(hssl2_area.hssl3_toSrio.io.tick_out){
      select := 3
    }otherwise{
      select := select
    }
    stream_mux.io.select := select
  }
}

object Srio_SendTop extends App{
  SpinalConfig(headerWithDate = true).generateVerilog(new Srio_SendTop(ClockDomain.external("hssl1"),ClockDomain.external("hssl2"),ClockDomain.external("srio"),6250))
}


object MO_FbRx{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new MO_ToSrio(ClockDomain.external("hssl"),ClockDomain.external("srio"))){dut=>
      dut.io.hssl_input.valid #= false
      dut.io.hssl_input.payload.last #= false
      dut.io.output.ready #= false
      dut.io.tick_in #= false
      dut.io.slave_id #= 0x05
      dut.io.header #= 0x11223344
      dut.io.doorbell_Info #= 0x015
      dut.hssl_area.clockDomain.forkStimulus(8)
      dut.srio_area.clockDomain.forkStimulus(20)
      dut.hssl_area.clockDomain.waitSampling(50)
      dut.io.hssl_input.valid #= true
      dut.io.hssl_input.payload.fragment #= 0x0000FFBC
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.hssl_input.valid #= true
      dut.io.hssl_input.payload.fragment #= 0x05
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.hssl_input.valid #= true
      dut.io.hssl_input.payload.fragment #= 0x01
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.hssl_input.valid #= true
      dut.io.hssl_input.payload.fragment #= 0x02
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.hssl_input.valid #= true
      dut.io.hssl_input.payload.fragment #= 0x03
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.hssl_input.valid #= true
      dut.io.hssl_input.payload.fragment #= 0x04
      dut.io.hssl_input.payload.last #= true
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.hssl_input.valid #= false
      dut.io.hssl_input.payload.last #= false
      dut.hssl_area.clockDomain.waitSampling()
      dut.io.tick_in #= true
      dut.srio_area.clockDomain.waitSampling()
      dut.io.tick_in #= false
      for(i <- 0 until 1000){
        dut.io.output.ready #= Random.nextBoolean()
        //dut.io.output.ready #= true
        dut.srio_area.clockDomain.waitSampling()
      }
      dut.io.tick_in #= true
      dut.srio_area.clockDomain.waitSampling()
      dut.io.tick_in #= false
      for(i <- 0 until 1000){
        dut.io.output.ready #= Random.nextBoolean()
        //dut.io.output.ready #= true
        dut.srio_area.clockDomain.waitSampling()
      }

    }
  }
}