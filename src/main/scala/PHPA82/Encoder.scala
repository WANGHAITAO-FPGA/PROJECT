package PHPA82

import MDCB_2.Encoder_Clr
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.{Counter, IMasterSlave, master, slave}

object EncoderConfig{

  def getApb3Config() = Apb3Config(addressWidth = 8,dataWidth = 16)
}

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

case class Encoder_Top(inclr : Boolean) extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val clk_160M = in Bool()
    val encoderinterface = master(EncoderInterface())
    val encoder_position_out = out Bits(32 bits)
    val encoder_clr_in = if(!inclr) in Bool() else null
    val encoder_iphase_out = if(!inclr) out Bool() else null
    val encoder_lock_pos = if(!inclr) out Bits(32 bits) else null
  }
  noIoPrefix()

  val encoderclockdomain = ClockDomain(io.clk,io.reset)
  val encoderarea = new ClockingArea(encoderclockdomain){

    val encoder_clr = new Encoder_Clr
    encoder_clr.io.encoder_clr_in := io.encoder_clr_in

    val zerosensor = new ZeroSensor
    zerosensor.io.zerosensor_in := io.encoderinterface.encoder_iphase
    io.encoder_iphase_out := zerosensor.io.zerosensor_out

//    if(!inclr){
//
//    }
    val encoder_iphase = Reg(Bool()) init False
    encoder_iphase := io.encoderinterface.encoder_iphase

    val Encoder =  new encoder
    Encoder.clk80m := io.clk
    Encoder.resetn := !io.reset
    Encoder.clk160m := io.clk_160M
    Encoder.enca := io.encoderinterface.encoder_aphase
    Encoder.encb := io.encoderinterface.encoder_bphase
    Encoder.encx := False
    io.encoder_position_out := Encoder.encoder_position_out

    if(inclr){
      Encoder.enc_rstn := !encoder_iphase.rise()
    }else{
      Encoder.enc_rstn := encoder_clr.io.encoder_clr_out
      val encoder_lock_pos = Reg(Bits(32 bits)) init 0  addTag(crossClockDomain)
      when(io.encoderinterface.encoder_iphase.rise()){
        encoder_lock_pos := Encoder.encoder_position_out
      }otherwise{
        encoder_lock_pos := encoder_lock_pos
      }
      io.encoder_lock_pos := encoder_lock_pos
    }
  }
}

//class ApbEncoder(moduleName:String,baseaddr:Long) extends Component {
//  val io = new Bundle{
//    val clk = in Bool()
//    val reset = in Bool()
//    val clk_160M = in Bool()
//    val encoderinterface = master(EncoderInterface())
//    val apb  = slave(Apb3(EncoderConfig.getApb3Config()))
//  }
//  noIoPrefix()
//
//  val encoderClockDomain = ClockDomain(
//    clock = io.clk,
//    reset = io.reset
//  )
//
//  val area = new ClockingArea(encoderClockDomain){
//    val encoder_ctrl = new Encoder_Top()
//    encoder_ctrl.io.clk := io.clk
//    encoder_ctrl.io.reset := io.reset
//    encoder_ctrl.io.clk_160M := io.clk_160M
//    encoder_ctrl.io.encoderinterface <> io.encoderinterface
//
//    val encoder_pos_reg = Reg(Bits(32 bits)) init 0
//    encoder_pos_reg := encoder_ctrl.io.encoder_position_out
//    val encoder_lock_reg = Reg(Bits(32 bits)) init 0
//    encoder_lock_reg := encoder_ctrl.io.encoder_lock_pos
//    val encoder_iphase_out = Reg(Bool()) init False
//    encoder_iphase_out := encoder_ctrl.io.encoder_iphase_out
//
//    val ctrl = Apb3SlaveFactory(io.apb)
//    ctrl.driveAndRead(encoder_ctrl.io.encoder_clr_in, 0,bitOffset = 0,documentation = "Encoder光栅尺清零寄存器")
//
//    ctrl.read(encoder_pos_reg(31 downto 16), 4,bitOffset = 0,documentation = "Encoder光栅尺数据—低16位")
//
//    ctrl.read(encoder_pos_reg(15 downto 0), 8,bitOffset = 0,documentation = "Encoder光栅尺数据—低16位")
//
//    ctrl.read(encoder_lock_reg(31 downto 16), 12,bitOffset = 0,documentation = "Encoder光栅尺数据—低16位")
//
//    ctrl.read(encoder_lock_reg(15 downto 0), 16,bitOffset = 0,documentation = "Encoder光栅尺数据—低16位")
//
//    ctrl.read(encoder_iphase_out.asBits, 20,bitOffset = 0,documentation = "Encoder光栅尺数据—index信号")
//  }
//}





//object Encoder_Top extends App{
//  SpinalVerilog(new ApbEncoder("Encoder",0x000500))
//}

