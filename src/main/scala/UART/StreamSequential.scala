package UART

import UART.StreamState.IDLE
import spinal.core.{Vec, _}
import spinal.lib.{StreamMux, master, slave}

object StreamSequentialState extends SpinalEnum {
  val ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN = newElement()
}

case class StreamSequential(bitWidth : Int, rxfifodepth : Int) extends Component{
  val io = new Bundle{
    val input = Vec(slave Stream (Bits(bitWidth bit)), 7)
    val interrupt = in Vec(Bool(),7)
    val occupancy = in Vec(UInt(log2Up(rxfifodepth + 1) bits),7)
    val output = master Stream (Bits(bitWidth bit))
    val readfifo = out Vec(Bool(),7)
  }
  noIoPrefix()

  val streammux = new StreamMux((Bits(bitWidth bit)),7)
  streammux.io.inputs <> io.input
  streammux.io.output <> io.output

  val rdfifo = Reg(Vec(Bool(),7))
  val select = Reg(UInt (log2Up(7) bit))

  import StreamSequentialState._
  val stateMachine = new Area {
    val state = RegInit(ONE)
    switch(state) {
      is(ONE){
        when(io.occupancy(0) === 0){
          rdfifo(0) := False
          state := TWO
        }elsewhen((io.occupancy(0) =/= 0) && io.interrupt(0)){
          rdfifo(0) := True
          select := 0
        }otherwise{
          rdfifo(0) := False
        }
      }
      is(TWO){
        when(io.occupancy(1) === 0){
          rdfifo(1) := False
          state := THREE
        }elsewhen((io.occupancy(1) =/= 0) && io.interrupt(1)){
          rdfifo(1) := True
          select := 1
        }otherwise{
          rdfifo(1) := False
        }
      }
      is(THREE){
        when(io.occupancy(2) === 0){
          rdfifo(2) := False
          state := FOUR
        }elsewhen((io.occupancy(2) =/= 0) && io.interrupt(2)){
          rdfifo(2) := True
          select := 2
        }otherwise{
          rdfifo(2) := False
        }
      }
      is(FOUR){
        when(io.occupancy(3) === 0){
          rdfifo(3) := False
          state := FIVE
        }elsewhen((io.occupancy(3) =/= 0) && io.interrupt(3)){
          rdfifo(3) := True
          select := 3
        }otherwise{
          rdfifo(3) := False
        }
      }
      is(FIVE){
        when(io.occupancy(4) === 0){
          rdfifo(4) := False
          state := SIX
        }elsewhen((io.occupancy(4) =/= 0) && io.interrupt(4)){
          rdfifo(4) := True
          select := 4
        }otherwise{
          rdfifo(4) := False
        }
      }
      is(SIX){
        when(io.occupancy(5) === 0){
          rdfifo(5) := False
          state := SEVEN
        }elsewhen((io.occupancy(5) =/= 0) && io.interrupt(5)){
          rdfifo(5) := True
          select := 5
        }otherwise{
          rdfifo(5) := False
        }
      }
      is(SEVEN){
        when(io.occupancy(6) === 0){
          rdfifo(6) := False
          state := ONE
        }elsewhen((io.occupancy(6) =/= 0) && io.interrupt(6)){
          rdfifo(6) := True
          select := 6
        }otherwise{
          rdfifo(6) := False
        }
      }
    }
  }
  for(i <- 0 until 7){
    io.readfifo(i) := rdfifo(i)
  }
  streammux.io.select := select
}



object StreamSequential extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new StreamSequential(8,16))
}