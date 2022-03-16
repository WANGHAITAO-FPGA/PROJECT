package PHPA82

import MDCB_2.Encoder_Clr
import spinal.core._
import spinal.lib.{Counter, IMasterSlave, master}

case class EncoderInterface() extends Bundle with IMasterSlave{
  val encoder_aphase = Bool()
  val encoder_bphase = Bool()
  val encoder_iphase = Bool()

  override def asMaster(): Unit = {
    in(encoder_aphase,encoder_bphase,encoder_iphase)
  }
}

object ZeroState extends SpinalEnum {
  val ZIDLE, ZWAIT, ZSTOP = newElement()
}

class ZeroSensor extends Component {
  val io = new Bundle{
    val zerosensor_in = in Bool()
    val zerosensor_out = out Bool()
  }
  noIoPrefix()

  val counter = new Counter(0,40000)
  val zerosensor_temp = Reg(Bool()) init False  addTag(crossClockDomain)

  import ZeroState._

  val stateMachine = new Area {
    val state = RegInit(ZIDLE)
    switch(state) {
      is(ZIDLE) {
        when(io.zerosensor_in.rise()){
          state := ZWAIT
          counter.clear()
          zerosensor_temp := True
        }
      }
      is(ZWAIT){
        counter.increment()
        when(counter.willOverflow){
          state := ZSTOP
        }
      }
      is(ZSTOP){
        state := ZIDLE
        zerosensor_temp := False
      }
    }
  }
  io.zerosensor_out := zerosensor_temp
}

class encoder extends BlackBox{
  val clk80m = in Bool()
  val resetn = in Bool()
  val enc_rstn = in Bool()
  val enca = in Bool()
  val encb = in Bool()
  val encx = in Bool()
  val encoder_position_out = out Bits(32 bits)
  val enc_udn = out Bool()
  val enc_cas = out Bool()
  val count_enable = out Bool()
  val count_direction = out Bool()
  val clk160m = in Bool()

  noIoPrefix()

  addRTLPath("D:/SCALA/SRIO/CYP1401/encoder.v")
}

case class Encoder_Top() extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val clk_160M = in Bool()
    val encoderinterface = master(EncoderInterface())
    val encoder_position_out = out Bits(32 bits)
    val encoder_clr_in = in Bool()
    val encoder_iphase_out = out Bool()
    val encoder_lock_pos = out Bits(32 bits)
  }
  noIoPrefix()

  val encoderclockdomain = ClockDomain(io.clk,io.reset)
  val encoderarea = new ClockingArea(encoderclockdomain){
    val encoder_clr = new Encoder_Clr
    encoder_clr.io.encoder_clr_in := io.encoder_clr_in

    val zerosensor = new ZeroSensor
    zerosensor.io.zerosensor_in := io.encoderinterface.encoder_iphase
    io.encoder_iphase_out := zerosensor.io.zerosensor_out

    val Encoder =  new encoder
    Encoder.clk80m := io.clk
    Encoder.resetn := !io.reset
    Encoder.clk160m := io.clk_160M
    Encoder.enca := io.encoderinterface.encoder_aphase
    Encoder.encb := io.encoderinterface.encoder_bphase
    Encoder.encx := False
    Encoder.enc_rstn := encoder_clr.io.encoder_clr_out
    io.encoder_position_out := Encoder.encoder_position_out

    val encoder_lock_pos = Reg(Bits(32 bits)) init 0  addTag(crossClockDomain)
    when(io.encoderinterface.encoder_iphase.rise()){
      encoder_lock_pos := Encoder.encoder_position_out
    }otherwise{
      encoder_lock_pos := encoder_lock_pos
    }
    io.encoder_lock_pos := encoder_lock_pos
  }
}

object Encoder_Top extends App{
  SpinalVerilog(new Encoder_Top)
}

