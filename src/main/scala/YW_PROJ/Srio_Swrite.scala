package YW_PROJ

import SRIO.{Intitaor, Intitaor_Interface, SrioFtype, SrioTtype}
import SimpleBus.{SimpleBus, SimpleBusConfig, SpBusInterface}
import spinal.core._
import spinal.lib.bus.regif.AccessType.{RO, RW}
import spinal.lib.bus.regif.HtmlGenerator
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.{StreamFifo, master, slave}
import spinal.lib.misc.Timer

import java.time.LocalDate
import scala.util.Random

case class Yw_Intiator_Regif(addrwidth : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,64)))
    val postion = in Bits(32 bits)
    val speed = in Bits(16 bits)
    val kp = in Bits(16 bits)
    val ki = in Bits(16 bits)
    val kd = in Bits(16 bits)
    val endatPostion = in Bits(38 bits)
    val endatIndex = in Bool()
    val InPlace = in Bool()
    val ad_sample_data0 = in Bits(16 bits)
    val home = in Bool()
    val enable = in Bool()
    val acc = in Bits(16 bits)
    val jerk = in Bits(16 bits)
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

  val My_Reg_HEADER = busslave.newReg(doc="板卡识别号")
  val HEADER = My_Reg_HEADER.fieldAt(32,32 bits,RO,0x00F1F2F3,"板卡识别号")
  HEADER := B"x00F1F2F3"

  val My_Reg_Version = busslave.newReg(doc="软件版本号")
  val Version = My_Reg_Version.fieldAt(32,32 bits,RO,0,"软件版本号")
  Version := LocalDate.now().getYear<<16 | LocalDate.now().getMonthValue<<8 | LocalDate.now().getDayOfMonth

  val My_Reg_Postion = busslave.newReg(doc="上位机下发的位置值")
  val Postion = My_Reg_Postion.fieldAt(32,32 bits,RO,0,"上位机下发的位置值")
  Postion := io.postion

  val My_Reg_Speed = busslave.newReg(doc="上位机下发的速度")
  val Speed = My_Reg_Speed.fieldAt(32,16 bits,RO,1,"上位机下发的速度值")
  Speed := io.speed

  val My_Reg_Kp = busslave.newReg(doc= "上位机下发的Kp")
  val Kp = My_Reg_Kp.fieldAt(32,bc = 16 bits,RO,500,"上位机下发的Kp")
  Kp := io.kp

  val My_Reg_Ki = busslave.newReg(doc= "上位机下发的Ki")
  val Ki = My_Reg_Ki.fieldAt(32,bc = 16 bits,RO,1000,"上位机下发的Ki")
  Ki := io.ki

  val My_Reg_Kd = busslave.newReg(doc= "上位机下发的Kd")
  val Kd = My_Reg_Kd.fieldAt(32,bc = 16 bits,RO,0,"上位机下发的Kd")
  Kd := io.kd

  val My_Reg_EndatPostion = busslave.newReg(doc= "Endat采集到的位置值")
  val EndatPostion_H = My_Reg_EndatPostion.fieldAt(0,bc = 6 bits,RO,0,"Endat采集到的位置值,数字1代表31.25pm,n代表n*31.25pm")
  val EndatPostion_L = My_Reg_EndatPostion.fieldAt(32,bc = 32 bits,RO,0,"Endat采集到的位置值,数字1代表31.25pm,n代表n*31.25pm")
  EndatPostion_H := io.endatPostion(37 downto 32)
  EndatPostion_L := io.endatPostion(31 downto 0)

  val My_Reg_EndatIndex = busslave.newReg(doc= "Endat采集到的Index信息")
  val EndatIndex = My_Reg_EndatIndex.fieldAt(32,bc = 1 bits,RO,0,"Endat采集到的Index信息")
  EndatIndex := io.endatIndex.asBits

  val My_Reg_InPlace = busslave.newReg(doc= "到位信息")
  val InPlace = My_Reg_InPlace.fieldAt(32,bc = 1 bits,RO,0,"到位信息")
  InPlace := io.InPlace.asBits

  val My_Reg_AdData = busslave.newReg(doc= "AD采集数据，通道1")
  val AdData = My_Reg_AdData.fieldAt(32,bc = 16 bits,RO,0,"AD采集数据，通道1")
  AdData := io.ad_sample_data0

  val My_Reg_Home = busslave.newReg(doc="上位机下发的回零信号")
  val Home = My_Reg_Home.fieldAt(32,1 bits,RO,0,"上位机下发的回零信号")
  Home := io.home.asBits

  val My_Reg_Enable = busslave.newReg(doc="上位机下发的使能信号")
  val Enable = My_Reg_Enable.fieldAt(32,1 bits,RO,0,"上位机下发的使能信号")
  Enable := io.enable.asBits

  val My_Reg_Acc = busslave.newReg(doc="上位机下发的加速度")
  val Acc = My_Reg_Acc.fieldAt(32,16 bits,RO,10,"上位机下发的加速度值")
  Acc := io.acc

  val My_Reg_Jerk = busslave.newReg(doc="上位机下发的加加速度")
  val Jrek = My_Reg_Jerk.fieldAt(32,16 bits,RO,100,"上位机下发的加加速度值")
  Jrek := io.jerk

  val My_Reg_Reverse = (0 until 22).map { i =>
    val Reverse = busslave.newReg(doc=s"Reverse$i Reverse")
    val Reverse_Data = Reverse.fieldAt(32,bc = 32 bits,RO,0,"Reverse")
    Reverse_Data := 0
  }

  busslave.accept(HtmlGenerator("Yw_Intiator_Regif", "Yw_Intiator_Regif"))
}


case class Srio_Swrite(addrwidth : Int, data_length : Int) extends Component{
  val io = new Bundle{
    val intiator = master(Intitaor_Interface())
    val postion = in Bits(32 bits)
    val speed = in Bits(16 bits)
    val kp = in Bits(16 bits)
    val ki = in Bits(16 bits)
    val kd = in Bits(16 bits)
    val endatPostion = in Bits(38 bits)
    val endatIndex = in Bool()
    val InPlace = in Bool()
    val ad_sample_data0 = in Bits(16 bits)
    val tick = in Bool()
    val home = in Bool()
    val enable = in Bool()
    val acc = in Bits(16 bits)
    val jerk = in Bits(16 bits)
  }
  noIoPrefix()

  val intiator = new Intitaor(64)
  intiator.io.intiator.intiator_req_common <> io.intiator.intiator_req_common
  intiator.io.intiator.intiator_resp_common <> io.intiator.intiator_resp_common
  intiator.io.intiator.intiator_resp_stream <> io.intiator.intiator_resp_stream

  intiator.io.usercmd.user_ftype := SrioFtype.SWRITE
  intiator.io.usercmd.user_ttype := SrioTtype.TNDATA
  intiator.io.usercmd.user_prio := 0
  intiator.io.usercmd.user_size := 255
  intiator.io.usercmd.user_addr := 0x0c200000

  val tcnt = Reg(UInt(8 bits)) init 0
  intiator.io.usercmd.user_tid := tcnt.asBits

  val RENABLE = Reg(Bool()) init False
  val RADDR = Reg(UInt(addrwidth bits)) init 0
  val RDATA = Reg(Bits(64 bits))
  val send_length = Reg(UInt(addrwidth bits)) init 0
  val start = Reg(Bool()) init False
  start := False

  val intiator_reg = new Yw_Intiator_Regif(addrwidth)
  intiator_reg.io.simplebus.RADDR := RADDR
  intiator_reg.io.simplebus.RENABLE := RENABLE
  intiator_reg.io.simplebus.WENABLE := False
  intiator_reg.io.simplebus.WADDR := 0
  intiator_reg.io.simplebus.WDATA := 0

  intiator_reg.io.postion := io.postion
  intiator_reg.io.speed := io.speed
  intiator_reg.io.kp := io.kp
  intiator_reg.io.ki := io.ki
  intiator_reg.io.kd := io.kd
  intiator_reg.io.endatPostion := io.endatPostion
  intiator_reg.io.endatIndex := io.endatIndex
  intiator_reg.io.InPlace := io.InPlace
  intiator_reg.io.ad_sample_data0 := io.ad_sample_data0

  intiator_reg.io.acc := io.acc
  intiator_reg.io.jerk := io.jerk
  intiator_reg.io.home := io.home
  intiator_reg.io.enable := io.enable

  val fsm =new StateMachine{
    val Wait_Start: State = new State with EntryPoint {
      whenIsActive{
        when(io.tick){
          tcnt := tcnt + 1
          RADDR := 0
          RENABLE := True
          send_length := 0
          goto(Send_Data)
        }
      }
    }
    val Send_Data: State = new State{
      whenIsActive{
        RADDR := RADDR + 8
        send_length := send_length + 1
        when(send_length === data_length-1){
          RENABLE := False
          goto(End)
        }
      }
    }
    val End: State = new State{
      whenIsActive{
        send_length := 0
        RENABLE := False
        start := True
        goto(Wait_Start)
      }
    }
  }
  intiator.io.send_start := start
  intiator.io.usercmd.user_data.payload := intiator_reg.io.simplebus.RDATA
  intiator.io.usercmd.user_data.valid := RegNext(RENABLE)

  val streamfifo = new StreamFifo(Bits(64 bits),64)
  streamfifo.io.push.payload := intiator.io.intiator.intiator_req_stream.payload.fragment
  streamfifo.io.push.valid := intiator.io.intiator.intiator_req_stream.valid
  intiator.io.intiator.intiator_req_stream.ready := streamfifo.io.push.ready

  io.intiator.intiator_req_stream.payload.fragment := streamfifo.io.pop.payload
  io.intiator.intiator_req_stream.valid := streamfifo.io.pop.valid
  streamfifo.io.pop.ready := io.intiator.intiator_req_stream.ready
  io.intiator.intiator_req_stream.payload.last := (streamfifo.io.occupancy === 1) & io.intiator.intiator_req_stream.fire
}

object Srio_Swrite{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Srio_Swrite(9,32)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.tick #= false
      dut.io.postion #= 0x01020304
      dut.io.speed #= 0x05060708
      dut.io.kp #= 0x456789
      dut.io.ki #= 0x11223344
      dut.io.kd #= 0x05060715
      dut.clockDomain.waitSampling(100)
      for(i <- 0 until 5){
        dut.io.tick #= true
        dut.clockDomain.waitSampling()
        dut.io.tick #= false
        for(t <- 0 until 100){
          dut.clockDomain.waitSampling()
          dut.io.intiator.intiator_req_stream.ready #= Random.nextBoolean()
        }
        dut.clockDomain.waitSampling(200)
      }
    }
  }
}