package SDAC_2

import UART.uartctrl_stream
import spinal.core._
import spinal.lib.com.uart.Uart
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{Stream, master, slave}

case class Sdac_Uart(txfifodepth: Int, rxfifodepth : Int, rx_waittime : Int, reg_num : Int ,lookback : Boolean) extends Component{
  val io = new Bundle{
    val uart  = if(!lookback) master(Uart()) else null
    val uart_regout = out (Vec(Bits(16 bits),reg_num))
    val stream_in = if(lookback) slave(Stream(Bits(8 bit))) else null
  }
  noIoPrefix()

  val default_clkdomain = new ClockDomain(this.clockDomain.clock,this.clockDomain.reset,frequency = FixedFrequency(100 MHz))

  val area = new ClockingArea(default_clkdomain){
    val rxfiforead = Reg(Bool()) init False
    val rx_ready = Reg(Bool()) init False

    val uartctrl_stream = new uartctrl_stream(txfifodepth,rxfifodepth,rx_waittime)
    if(!lookback) uartctrl_stream.io.uart <> io.uart
    else uartctrl_stream.io.uart.rxd := uartctrl_stream.io.uart.txd
    if(lookback) uartctrl_stream.io.stream_in << io.stream_in
    uartctrl_stream.io.rxfiforead := rxfiforead
    uartctrl_stream.io.stream_out.ready := rx_ready

    val reg_temp = Reg(Vec(Bits(8 bits),reg_num*2))
    val uart_regout_temp = Reg(Vec(Bits(16 bits),reg_num))

    val txstream_valid = Reg(Bool()) init False
    val txstream_payload = Reg(Bits(8 bits)) init 0


    val fsm = new StateMachine{
      val counter = Reg(UInt(log2Up(reg_num*2) bits)) init 0
      val Wait_Start: State = new State with EntryPoint {
        whenIsActive{
          when(uartctrl_stream.io.rxint && (uartctrl_stream.io.rxfifooccupancy =/= 0)){
            rxfiforead := True
            rx_ready := True
            txstream_valid := False
            goto(Check_HeadH)
          }otherwise{
            rxfiforead := False
            rx_ready := False
            txstream_valid := False
          }
        }
      }
      val Check_HeadH: State = new State{
        whenIsActive{
          when(uartctrl_stream.io.stream_out.fire && (uartctrl_stream.io.stream_out.payload === B"8'hAA")){
            goto(Check_HeadL)
          }elsewhen(uartctrl_stream.io.rxfifooccupancy =/= 0){
            goto(Check_HeadH)
          }otherwise{
            goto(Wait_Start)
          }
        }
      }
      val Check_HeadL: State = new State{
        whenIsActive{
          when(uartctrl_stream.io.stream_out.fire && (uartctrl_stream.io.stream_out.payload === B"8'h55")){
            counter := 0
            goto(Get_Data)
          }elsewhen(uartctrl_stream.io.rxfifooccupancy =/= 0){
            goto(Check_HeadH)
          }otherwise{
            goto(Wait_Start)
          }
        }
      }
      val Get_Data: State = new State{
        whenIsActive{
          when(uartctrl_stream.io.stream_out.fire && (uartctrl_stream.io.rxfifooccupancy =/= 0)){
            reg_temp(counter) := uartctrl_stream.io.stream_out.payload
            counter := counter + 1
          }elsewhen(uartctrl_stream.io.rxfifooccupancy === 0){
            rxfiforead := False
            rx_ready := False
            goto(End)
          }
        }
      }
      val End: State = new State{
        whenIsActive{
          for(i <- 0 until reg_num){
            uart_regout_temp(i) := reg_temp(i+1)##reg_temp(i)
          }
          txstream_valid := True
          txstream_payload := B"8'hAA"
          goto(Wait_Start)
        }
      }
    }

    if(!lookback) uartctrl_stream.io.stream_in.payload := txstream_payload else null
    if(!lookback) uartctrl_stream.io.stream_in.valid := txstream_valid else null

    for(i <- 0 until reg_num){
      io.uart_regout(i) := uart_regout_temp(i).asBits
    }
  }
}

object Sdac_UartSim{
  import spinal.core.sim._
  def main(args: Array[String]): Unit ={
    SimConfig.withWave.doSim(new Sdac_Uart(32,32,4000,6,true)){dut=>
      dut.area.clockDomain.forkStimulus(10)
      dut.io.stream_in.valid #= false
      dut.io.stream_in.payload #= 0
      dut.area.clockDomain.waitSampling(10)
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xaa
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x55
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x11
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x12
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.payload #= 0x21
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x22
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.payload #= 0x31
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x32
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= false
      dut.io.stream_in.payload #= 0x00
      dut.area.clockDomain.waitSampling()

      dut.area.clockDomain.waitSampling(40000)

      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xab
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x55
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x11
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x12
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.payload #= 0x21
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x22
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.payload #= 0x31
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x32
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= false
      dut.io.stream_in.payload #= 0x00
      dut.area.clockDomain.waitSampling()

      dut.area.clockDomain.waitSampling(40000)

      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xab
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xaa
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0x55
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xF1
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xF2
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.payload #= 0xF3
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xF4
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.payload #= 0xF5
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= true
      dut.io.stream_in.payload #= 0xF6
      dut.area.clockDomain.waitSampling()
      dut.io.stream_in.valid #= false
      dut.io.stream_in.payload #= 0x00
      dut.area.clockDomain.waitSampling()

      dut.area.clockDomain.waitSampling(40000)

    }
  }
}
