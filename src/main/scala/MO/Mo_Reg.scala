package MO

import PHPA82.ila_test.ila
import spinal.core._
import spinal.lib.bus.amba3.apb._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.BusInterface
import spinal.lib.{Delay, DelayWithInit, slave}

//case class Mo_Reg() extends Component{
//  val io = new Bundle{
//    val apb = slave(Apb3(Apb3Config(24,32)))
//    val hssl_sts = in Vec(Bits(32 bits),4)
//    val hssl_tx_frame = out Vec(Bits(32 bits),4)
//    val hssl_ctl_rst = out Vec(Bool(),4)
//    val hssl_ctl_send = out Vec(Bool(),4)
//    val hssl_ctl_trigger = out Vec(Bool(),4)
//  }
//  noIoPrefix()
//
//  val busslave = BusInterface(io.apb,(0x10000, 500 Byte),0)
//
//  val My_Reg0 = busslave.newRegAt(0x10000,"hssl1_sts_reg")
//  val Hssl1_Status =  My_Reg0.field(32 bits,RO,0,"hssl1_sts_reg")
//  Hssl1_Status := io.hssl_sts(0)
//
//  val My_Reg1 = busslave.newReg("hssl1_ctl_reg")
//  val Hssl1_CTL_RST = My_Reg1.fieldAt(0,1 bits,RW,0,"RESET")
//  io.hssl_ctl_rst(0) := Hssl1_CTL_RST.asBool|Delay(Hssl1_CTL_RST,1,init = B"0").asBool|Delay(Hssl1_CTL_RST,2,init = B"0").asBool
//  val Hssl1_CTL_SEND = My_Reg1.fieldAt(2,1 bits,RW,0,"SEND")
//  io.hssl_ctl_send(0) := Hssl1_CTL_SEND.asBool|Delay(Hssl1_CTL_SEND,1,init = B"0").asBool|Delay(Hssl1_CTL_SEND,2,init = B"0").asBool
//  val Hssl1_CTL_TRIGGER = My_Reg1.fieldAt(7,1 bits,RW,0,"TRIGGER")
//  io.hssl_ctl_trigger(0) := Hssl1_CTL_TRIGGER.asBool|Delay(Hssl1_CTL_TRIGGER,1,init = B"0").asBool|Delay(Hssl1_CTL_TRIGGER,2,init = B"0").asBool
//
//  val My_Reg2 = busslave.newReg("hssl1_sr_reg")
//  val Hssl1_SR_REG = My_Reg2.field(32 bits,RW,0,"hssl1_sr_reg")
//
//
//  val My_Reg3 = busslave.newRegAt(0x10040,"hssl2_sts_reg")
//  val Hssl2_Status =  My_Reg3.field(32 bits,RO,0,"hssl2_sts_reg")
//  Hssl2_Status := io.hssl_sts(1)
//
//  val My_Reg4 = busslave.newReg("hssl2_ctl_reg")
//  val Hssl2_CTL_RST = My_Reg4.fieldAt(0,1 bits,RW,0,"RESET")
//  io.hssl_ctl_rst(1) := Hssl2_CTL_RST.asBool|Delay(Hssl2_CTL_RST,1,init = B"0").asBool|Delay(Hssl2_CTL_RST,2,init = B"0").asBool
//  val Hssl2_CTL_SEND = My_Reg4.fieldAt(2,1 bits,RW,0,"SEND")
//  io.hssl_ctl_send(1) := Hssl2_CTL_SEND.asBool|Delay(Hssl2_CTL_SEND,1,init = B"0").asBool|Delay(Hssl2_CTL_SEND,2,init = B"0").asBool
//  val Hssl2_CTL_TRIGGER = My_Reg4.fieldAt(7,1 bits,RW,0,"TRIGGER")
//  io.hssl_ctl_trigger(1) := Hssl2_CTL_TRIGGER.asBool|Delay(Hssl2_CTL_TRIGGER,1,init = B"0").asBool|Delay(Hssl2_CTL_TRIGGER,2,init = B"0").asBool
//
//  val My_Reg5 = busslave.newReg("hssl2_sr_reg")
//  val Hssl2_SR_REG = My_Reg5.field(32 bits,RW,0,"hssl2_sr_reg")
//
//
//  val My_Reg6 = busslave.newRegAt(0x10080,"hssl3_sts_reg")
//  val Hssl3_Status =  My_Reg6.field(32 bits,RO,0,"hssl3_sts_reg")
//  Hssl3_Status := io.hssl_sts(2)
//
//  val My_Reg7 = busslave.newReg("hssl3_ctl_reg")
//  val Hssl3_CTL_RST = My_Reg7.fieldAt(0,1 bits,RW,0,"RESET")
//  io.hssl_ctl_rst(2) := Hssl3_CTL_RST.asBool|Delay(Hssl3_CTL_RST,1,init = B"0").asBool|Delay(Hssl3_CTL_RST,2,init = B"0").asBool
//  val Hssl3_CTL_SEND = My_Reg7.fieldAt(2,1 bits,RW,0,"SEND")
//  io.hssl_ctl_send(2) := Hssl3_CTL_SEND.asBool|Delay(Hssl3_CTL_SEND,1,init = B"0").asBool|Delay(Hssl3_CTL_SEND,2,init = B"0").asBool
//  val Hssl3_CTL_TRIGGER = My_Reg7.fieldAt(7,1 bits,RW,0,"TRIGGER")
//  io.hssl_ctl_trigger(2) := Hssl3_CTL_TRIGGER.asBool|Delay(Hssl3_CTL_TRIGGER,1,init = B"0").asBool|Delay(Hssl3_CTL_TRIGGER,2,init = B"0").asBool
//
//  val My_Reg8 = busslave.newReg("hssl3_sr_reg")
//  val Hssl3_SR_REG = My_Reg8.field(32 bits,RW,0,"hssl3_sr_reg")
//
//
//  val My_Reg9 = busslave.newRegAt(0x10120,"hssl4_sts_reg")
//  val Hssl4_Status =  My_Reg9.field(32 bits,RO,0,"hssl4_sts_reg")
//  Hssl4_Status := io.hssl_sts(3)
//
//  val My_Reg10 = busslave.newReg("hssl4_ctl_reg")
//  val Hssl4_CTL_RST = My_Reg10.fieldAt(0,1 bits,RW,0,"RESET")
//  io.hssl_ctl_rst(3) := Hssl4_CTL_RST.asBool|Delay(Hssl4_CTL_RST,1,init = B"0").asBool|Delay(Hssl4_CTL_RST,2,init = B"0").asBool
//  val Hssl4_CTL_SEND = My_Reg10.fieldAt(2,1 bits,RW,0,"SEND")
//  //val Send_Triger =
//  io.hssl_ctl_send(3) := Hssl4_CTL_SEND.asBool|Delay(Hssl4_CTL_SEND,1,init = B"0").asBool|Delay(Hssl4_CTL_SEND,2,init = B"0").asBool
//  val Hssl4_CTL_TRIGGER = My_Reg10.fieldAt(7,1 bits,RW,0,"TRIGGER")
//  io.hssl_ctl_trigger(3) := Hssl4_CTL_TRIGGER.asBool|Delay(Hssl4_CTL_TRIGGER,1,init = B"0").asBool|Delay(Hssl4_CTL_TRIGGER,2,init = B"0").asBool
//
//  val My_Reg11 = busslave.newReg("hssl4_sr_reg")
//  val Hssl4_SR_REG = My_Reg11.field(32 bits,RW,0,"hssl4_sr_reg")
//
//  val My_Reg12 = busslave.newRegAt(0x10FFC,"hssl1_tx_frame")
//  val Hssl1_Tx_Frame = My_Reg12.field(32 bits,RW,0,"hssl1_tx_frame")
//  io.hssl_tx_frame(0) := Hssl1_Tx_Frame
//
//  val My_Reg13 = busslave.newRegAt(0x117FC,"hssl2_tx_frame")
//  val Hssl2_Tx_Frame = My_Reg13.field(32 bits,RW,0,"hssl2_tx_frame")
//  io.hssl_tx_frame(1) := Hssl2_Tx_Frame
//
//  val My_Reg14 = busslave.newRegAt(0x11FFC,"hssl3_tx_frame")
//  val Hssl3_Tx_Frame = My_Reg14.field(32 bits,RW,0,"hssl3_tx_frame")
//  io.hssl_tx_frame(2) := Hssl3_Tx_Frame
//
//  val My_Reg15 = busslave.newRegAt(0x127FC,"hssl4_tx_frame")
//  val Hssl4_Tx_Frame = My_Reg15.field(32 bits,RW,0,"hssl4_tx_frame")
//  io.hssl_tx_frame(3) := Hssl4_Tx_Frame
//}

case class Apb_CsrReg() extends Component{
  val io = new Bundle{
    val apb = slave(Apb3(Apb3Config(4,32)))
    val hssl_sts = in Bits(32 bits)
    val hssl_ctl_rst = out Bool()
    val hssl_ctl_send = out Bool()
    val hssl_ctl_trigger = out Bool()
  }
  noIoPrefix()

  val busCtrl = Apb3SlaveFactory(io.apb)

  val hssl_sts = Reg(Bits(32 bits)) init 0
  hssl_sts := RegNextWhen(io.hssl_sts,busCtrl.isReading(0))
  val hssl_ctl_reg = Reg(Bits(32 bits)) init 0
  val hssl_sr_reg = Reg(Bits(32 bits)) init 0


  val Bus_isWrite4 = Reg(Bool()) init False
  Bus_isWrite4 := busCtrl.isWriting(4)
  val Write4_Delay = Reg(Bool()) init False
  Write4_Delay := Delay(Bus_isWrite4,2,init = False)


  val Hssl_CTL_RST = Reg(Bits(1 bits)) init 0
  Hssl_CTL_RST := (hssl_ctl_reg(0) && Write4_Delay).asBits

  val Hssl_CTL_SEND = Reg(Bits(1 bits)) init 0  addTag(crossClockDomain)
  Hssl_CTL_SEND := (hssl_ctl_reg(2) && Write4_Delay).asBits

  val Hssl_CTL_TRIGGER = Reg(Bits(1 bits)) init 0
  Hssl_CTL_TRIGGER := (hssl_ctl_reg(7) && Write4_Delay).asBits


  busCtrl.read(hssl_sts,0,0,"光纤状态寄存器")
  busCtrl.driveAndRead(hssl_ctl_reg,4,0,"光纤控制寄存器")
  busCtrl.driveAndRead(hssl_sr_reg,8,0,"光纤SR寄存器")

  io.hssl_ctl_rst := Hssl_CTL_RST.asBool|Delay(Hssl_CTL_RST,1,init = B"0").asBool|Delay(Hssl_CTL_RST,2,init = B"0").asBool
  io.hssl_ctl_send := Hssl_CTL_SEND.asBool|Delay(Hssl_CTL_SEND,1,init = B"0").asBool|Delay(Hssl_CTL_SEND,2,init = B"0").asBool
  io.hssl_ctl_trigger := Hssl_CTL_TRIGGER.asBool|Delay(Hssl_CTL_TRIGGER,1,init = B"0").asBool|Delay(Hssl_CTL_TRIGGER,2,init = B"0").asBool

//  val ila_probe=ila("0",Bus_isWrite4,Write4_Delay,Hssl_CTL_SEND,io.apb.PWDATA,io.apb.PADDR)
}

case class Apb_TxFrameReg() extends Component{
  val io = new Bundle {
    val apb = slave(Apb3(Apb3Config(2, 32)))
    val hssl_txframe = out Bits(32 bits)
  }
  noIoPrefix()

  val hssl_txframe = Reg(Bits(32 bits)) init 0

  val busCtrl = Apb3SlaveFactory(io.apb)
  busCtrl.driveAndRead(hssl_txframe,0,0,"光纤帧头寄存器")

  io.hssl_txframe := hssl_txframe
}

object Apb_CsrReg{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Apb_CsrReg){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.clockDomain.waitSampling(10)
      val apbsim = Apb3Driver(dut.io.apb,dut.clockDomain)
      apbsim.write(4,4)
      dut.clockDomain.waitSampling(100)
      apbsim.write(4,4)
      dut.clockDomain.waitSampling(100)
    }
  }
}