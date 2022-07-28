package ENDAT

import CRCCORE.{CRC5, CRCCombinational, CRCCombinationalCmdMode, CRCCombinationalConfig}
import spinal.core._
import spinal.lib.com.eth.{Crc, CrcKind}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.master
import spinal.lib.misc.Timer

case class Endat2_2(endat_clkToogle : Int, Mode_Bits : Int, Pos_Bits : Int, Wait_Tcnt : Int) extends Component{
  val io = new Bundle{
    val endat = master(EndatInterface())
    val sample = in Bool()
    val endat_mode = in Bits(Mode_Bits bits)
    val endat_mrs = in Bits(24 bits)
    val endat_mrs2 = in Bits(24 bits)
    val currentState = out UInt(5 bits)
    val postion = out Bits(Pos_Bits bits)
    val endat_crc = out Bits(5 bits)
    val endat_cal = out Bits(5 bits)
    val extra_data1 = out Bits(25 bits)
    val extra_data2 = out Bits(25 bits)
    val crc_check = out Bool()
    val init_done = out Bool()
    val index = out Bool()
  }
  noIoPrefix()

  val timer = new Area{
    val counter = Reg(UInt(log2Up(endat_clkToogle)+1 bits))
    val reset = False
    val endat_clkToogleHit = counter === endat_clkToogle
    counter := counter + 1
    when(reset){
      counter := 0
    }
  }

  val init_timer_tick = Reg(Bool()) init False

  val init_timer_limit = Reg(UInt(32 bits)) init 0

  val init_timer = Timer(32)
  init_timer.io.tick := init_timer_tick
  init_timer.io.limit := init_timer_limit
  when(init_timer.io.value >= init_timer.io.limit){
    init_timer.io.clear := True
  }otherwise{
    init_timer.io.clear := False
  }

  val init_done = Reg(Bool()) init False

  val endat_clk = Reg(Bool()) init True
  val mode_out = Reg(Bool())
  val write_enable = Reg(Bool()) init False
  val buffer = Reg(Bits(Pos_Bits bits)) init 0
  val postion = Reg(Bits(Pos_Bits bits)) init 0
  val crc = Reg(Bits(5 bits)) init 0

  val extra_data1 = Reg(Bits(25 bits)) init 0
  val extra_data1_buffer = Reg(Bits(25 bits)) init 0
  val extra_data2 = Reg(Bits(25 bits)) init 0
  val extra_data2_buffer = Reg(Bits(25 bits)) init 0

  val extra_crc1 = Reg(Bits(5 bits)) init 0
  val extra_crc2 = Reg(Bits(5 bits)) init 0

  val postion_crc = Reg(Bits(5 bits)) init 1
  val postion_cal = Reg(Bits(5 bits)) init 0
  val add1_cal = Reg(Bits(5 bits)) init 1
  val add1_crc = Reg(Bits(5 bits)) init 0

  val endat_rddata = Reg(Bool()) init False

  endat_rddata := io.endat.data.read

  val crc_cal = new CRCCombinational(CRCCombinationalConfig(CRC5.ENDAT, 1 bits))
  val crc_valid = Reg(Bool()) init False
  val crc_payload = Reg(Bits(1 bits)) init 0
  val crc_mode = CRCCombinationalCmdMode
  crc_cal.io.cmd.valid := crc_valid
  crc_cal.io.cmd.data := crc_payload
  crc_cal.io.cmd.mode := crc_mode.INIT

  val crc_check = Reg(Bool()) init False

  val fsm = new StateMachine{
    val counter = Reg(UInt(log2Up(Wait_Tcnt)+1 bits)) init 0
    val Init_Start: State = new State with EntryPoint {
      whenIsActive{
        init_timer_tick := True
        init_timer_limit := 45000000
        endat_clk := True
        counter := 0
        when(init_timer.io.full){
          init_timer_tick := False
          endat_clk := False
          goto(Endat_Init)
        }
      }
    }
    val Endat_Init : State = new State{
      whenIsActive{
        counter := counter + 1
        when(counter > 10){
          endat_clk := True
          counter := 0
          init_timer_tick := True
          init_timer_limit := 200000000
          goto(Init_Done)
        }
      }
    }
    val Init_Done : State = new State{
      whenIsActive{
        when(init_timer.io.full){
          init_timer_tick := False
          init_done := True
          goto(Wait_Start)
        }
      }
    }
    val Wait_Start: State = new State{
      whenIsActive{
        when(io.sample){
          endat_clk := True
          write_enable := False
          mode_out := False
          timer.reset := True
          crc_valid := False
          crc_check := False
          goto(Dummy_State)
        }
      }
    }
    val Dummy_State: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 4){
            write_enable := True
            counter := 0
            goto(Send_Mode)
          }
        }
      }
    }
    val Send_Mode: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          buffer := 0
          when(counter === (2*Mode_Bits-1)){
            counter := 0
            //write_enable := False
            goto(Two_Cycle)
          }
        }
        mode_out := io.endat_mode(Mode_Bits - 1 - (counter >> 1).resized)
        //mode_out := io.endat_mode((counter >> 1).resized)
      }
    }
    val Two_Cycle: State = new State{
      whenIsActive{
        mode_out := False
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (3)){
            counter := 0
            //write_enable := False
            goto(Wait_Mode)
          }elsewhen(counter === 1){
            write_enable := False
          }
        }
      }
    }
    val Wait_Mode: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          mode_out := False
        }
        when(endat_rddata.rise(False) && endat_clk){
          counter := 0
          goto(Read_Start)
        }
      }
    }
    val Read_Start: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 1){
            counter := 0
            write_enable := False
            goto(Read_F1)
          }otherwise{
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_F1:  State = new State{
      whenIsActive{
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 1){
            counter := 0
            write_enable := False
            goto(Read_F2)
          }otherwise{
            crc_payload := endat_rddata.asBits
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_F2:  State = new State{
      whenIsActive{
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === 1){
            counter := 0
            write_enable := False
            goto(Read_postion)
          }otherwise{
            crc_payload := endat_rddata.asBits
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_postion: State = new State{
      whenIsActive{
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(!counter.lsb){
            buffer := ((endat_rddata##buffer)>>1).resized
            crc_valid := True
            crc_payload := endat_rddata.asBits
          }
          when(counter === (2*Pos_Bits-1)){
            counter := 0
            crc := 0
            goto(Read_Crc)
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_Crc: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          postion := buffer
          when(counter.lsb){
            crc := (crc##endat_rddata).resized
            postion_cal := crc_cal.io.crc
          }
          when(counter === (2*5-1)){
            counter := 0
            when(io.endat_mode === B"111000"){
              goto(One_Cycle)
            }otherwise{
              goto(Wait_ThreeCycle)
            }
          }
        }
      }
    }
    val Wait_ThreeCycle: State = new State{
      whenIsActive{
        mode_out := False
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (5)){
            counter := 0
            write_enable := True
            goto(Wait_TwoCycle)
          }
        }
      }
    }
    val Wait_TwoCycle: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (3)){
            counter := 0
            mode_out := True
            write_enable := True
            goto(Send_MrsStart)
          }
        }
      }
    }
    val Send_MrsStart: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (1)){
            counter := 0
            goto(Send_Mrs)
          }
        }

      }
    }
    val Send_Mrs: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          buffer := 0
          when(counter === (2*24-1)){
            counter := 0
            write_enable := False
            //goto(Mrs_Two_Cycle)
            goto(Mrs_Two_Cycle)
          }
        }
        mode_out := io.endat_mrs(24 - 1 - (counter >> 1).resized)
      }
    }
    val Mrs_Two_Cycle: State = new State{
      whenIsActive{
        mode_out := False
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (3)){
            counter := 0
            write_enable := False
            goto(Wait_Reset)
          }
        }
      }
    }
    val One_Cycle: State = new State{
      whenIsActive{
        mode_out := False
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (1)){
            counter := 0
            write_enable := False
            goto(Read_AddData1)
          }otherwise{
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_AddData1: State = new State{
      whenIsActive{
        postion_crc := crc
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(!counter.lsb){
            extra_data1_buffer := (extra_data1_buffer##endat_rddata).resized
            crc_valid := True
            crc_payload := endat_rddata.asBits
          }
          when(counter === (2*24-1)){
            counter := 0
            crc := 0
            goto(Read_Add1Crc)
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_Add1Crc: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          extra_data1 := extra_data1_buffer
          when(counter.lsb){
            crc := (crc##endat_rddata).resized
            add1_cal := crc_cal.io.crc
          }
          when(counter === (2*5-1)){
            counter := 0
            crc_valid := True
            goto(AddOne_Cycle)
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val AddOne_Cycle: State = new State{
      whenIsActive{
        mode_out := False
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(counter === (1)){
            counter := 0
            write_enable := False
            goto(Read_AddData2)
          }otherwise{
            crc_valid := True
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_AddData2: State = new State{
      whenIsActive{
        add1_crc := crc
        crc_cal.io.cmd.mode := crc_mode.UPDATE
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          when(!counter.lsb){
            extra_data2_buffer := (extra_data2_buffer##endat_rddata).resized
            crc_valid := True
            crc_payload := endat_rddata.asBits
          }
          when(counter === (2*24-1)){
            counter := 0
            crc := 0
            goto(Read_Add2Crc)
          }
        }otherwise{
          crc_valid := False
        }
      }
    }
    val Read_Add2Crc: State = new State{
      whenIsActive{
        when(timer.endat_clkToogleHit){
          counter := counter + 1
          endat_clk := ~endat_clk
          timer.reset := True
          extra_data2 := extra_data2_buffer
          when(counter.lsb){
            crc := (crc##endat_rddata).resized
          }
          when(counter === (2*5-1)){
            counter := 0
            goto(Wait_Reset)
          }
        }
      }
    }
    val Wait_Reset: State = new State{
      whenIsActive{
        counter := counter + 1
        endat_clk := True
        when(counter > Wait_Tcnt) {
          counter := 0
          goto(Wait_Start)
        }
      }
    }
  }
  io.endat.clk := endat_clk
  io.endat.data.write := mode_out
  io.endat.data.writeEnable := write_enable
  io.postion := RegNextWhen(postion,postion_crc === postion_cal)  addTag(crossClockDomain)
  io.endat_crc := crc
  io.endat_cal := crc_cal.io.crc
  io.extra_data1 := RegNextWhen(extra_data1,add1_crc === add1_cal)
  io.extra_data2 := extra_data2
  io.crc_check := postion_crc === postion_cal
  io.init_done := init_done
  io.index := io.extra_data1(22)
  addPrePopTask(()=>io.currentState.assignFromBits(fsm.stateReg.asBits))
}


case class Endat_Ctrl(endat_clkToogle : Int, Mode_Bits : Int, Pos_Bits : Int, Wait_Tcnt : Int) extends Component{
  val io = new Bundle{
    val endat = master(EndatInterface())
    val currentState = out UInt(4 bits)
    val postion = out Bits(Pos_Bits bits)
    val endat_crc = out Bits(5 bits)
    val endat_cal = out Bits(5 bits)
    val extra_data1 = out Bits(25 bits)
    val extra_data2 = out Bits(25 bits)
    val State = out UInt(5 bits)
    val index = out Bool()
  }
  noIoPrefix()

  val endat = new Endat2_2(endat_clkToogle,Mode_Bits,Pos_Bits,Wait_Tcnt)

  val sample = Reg(Bool()) init False
  val mode = Reg(Bits(6 bits)) init 0
  val endat_mrs = Reg(Bits(24 bits)) init 0

  endat.io.endat <> io.endat
  io.postion := endat.io.postion
  io.endat_crc := endat.io.endat_crc
  io.endat_cal := endat.io.endat_cal
  io.extra_data1 := endat.io.extra_data1
  io.extra_data2 := endat.io.extra_data2
  endat.io.sample := sample
  endat.io.endat_mode := mode
  endat.io.endat_mrs := endat_mrs
  io.State := endat.io.currentState
  io.index := endat.io.index

  val counter = Reg(UInt(10 bits)) init 0

  val fsm = new StateMachine{
    val Wait_InitDone: State = new State with EntryPoint {
      whenIsActive{
        when(endat.io.init_done){
          counter := 0
          goto(Send_Mrs_1)
        }
      }
    }
    val Send_Mrs_1 : State = new State{
      whenIsActive{
        mode := B"001001"
        endat_mrs := 0x4c0000
        sample := True
        counter := counter + 1
        when(counter >20){
          counter := 0
          goto(Wait_Mrs1_Done)
        }
      }
    }
    val Wait_Mrs1_Done : State = new State{
      whenIsActive{
        sample := False
        when(endat.io.currentState === 4){
          goto(Wait)
        }
      }
    }
    val Wait : State = new State{
      whenIsActive{
        counter := counter + 1
        when(counter > 500){
          counter := 0
          goto(Confirm_Mrs_1)
        }
      }
    }
    val Confirm_Mrs_1 : State = new State{
      whenIsActive{
        mode := B"001001"
        endat_mrs := 0x470000
        sample := True
        counter := counter + 1
        when(counter >20) {
          counter := 0
          goto(Wait_Confirm1_Done)
        }
      }
    }
    val Wait_Confirm1_Done : State = new State{
      whenIsActive{
        sample := False
        when(endat.io.currentState === 4){
          goto(Add1Wait)
        }
      }
    }
    val Add1Wait : State = new State{
      whenIsActive{
        counter := counter + 1
        when(counter > 500){
          counter := 0
          goto(Get_Postion)
        }
      }
    }
//    val First_Get_Postion : State = new State {
//      whenIsActive{
//        mode := B"111000"
//        sample := True
//        counter := counter + 1
//        when(counter >20) {
//          counter := 0
//          goto(Wait_GetPostion_Done)
//        }
//      }
//    }
//    val Wait_GetPostion_Done : State = new State {
//      whenIsActive{
//        sample := False
//        when(endat.io.currentState === 4){
//          goto(PostionWait)
//        }
//      }
//    }
//    val PostionWait : State = new State {
//      whenIsActive{
//        counter := counter + 1
//        when(counter > 500){
//          counter := 0
//          goto(Send_Mrs_2)
//        }
//      }
//    }
//    val Send_Mrs_2 : State = new State{
//      whenIsActive{
//        mode := B"001001"
//        endat_mrs := 0x540000
//        sample := True
//        counter := counter + 1
//        when(counter >20) {
//          counter := 0
//          goto(Wait_Mrs2_Done)
//        }
//      }
//    }
//    val Wait_Mrs2_Done : State = new State{
//      whenIsActive{
//        sample := False
//        when(endat.io.currentState === 4){
//          goto(Add2Wait)
//        }
//      }
//    }
//    val Add2Wait : State = new State{
//      whenIsActive{
//        counter := counter + 1
//        when(counter > 500){
//          counter := 0
//          goto(Confirm_Mrs_2)
//        }
//      }
//    }
//    val Confirm_Mrs_2 : State = new State{
//      whenIsActive{
//        mode := B"001001"
//        endat_mrs := 0x470000
//        sample := True
//        counter := counter + 1
//        when(counter >20) {
//          counter := 0
//          goto(Wait_Confirm2_Done)
//        }
//      }
//    }
//    val Wait_Confirm2_Done : State = new State{
//      whenIsActive{
//        sample := False
//        when(endat.io.currentState === 4){
//          goto(Get_Postion)
//        }
//      }
//    }
    val Get_Postion : State = new State{
      whenIsActive{
        mode := B"111000"
        sample := True
      }
    }
  }
  addPrePopTask(()=>io.currentState.assignFromBits(fsm.stateReg.asBits))
}

object Endat_Ctrl extends App{
  SpinalConfig(enumPrefixEnable = false,targetDirectory = "E:/E200I/ENDAT_TEST/MDCB_2.srcs/sources_1/imports/SRIO").generateSystemVerilog(new Endat_Ctrl(25,6,38,3000))
}





object Endat2_2 extends App{
  SpinalVerilog(new Endat2_2(25,6,38,3000))
}
