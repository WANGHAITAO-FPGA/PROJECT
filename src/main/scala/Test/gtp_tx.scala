package Test

import CRCCORE.{CRC32, CRCCombinational, CRCCombinationalCmdMode, CRCCombinationalConfig}
import PHPA82.ila_test.ila
import spinal.core._
import spinal.lib.{Fragment, Stream, StreamFifo}
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

import scala.util.Random

case class gtp_tx() extends Component{
  val io = new Bundle{
    val log_rst_q = in Bool()
    val log_clk = in Bool()
    val s_axi_tx_tdata = out Bits(32 bits)
    val s_axi_tx_tkeep = out Bits(4 bits)
    val s_axi_tx_tlast = out Bool()
    val s_axi_tx_tvalid = out Bool()
    val s_axi_tx_tready = in Bool()
    val tx_packet_gtxid = in Bits(32 bits)
    val tx_packet_head = in Bits(32 bits)
    val tx_packet_req = in Bool()
    val tx_packet_trigger = in Bool()
    val crc_data = out Bits(32 bits)
    val tx_packet_addra = out Bits(8 bits)
    val tx_packet_data = in Bits(32 bits)
    val tx_packet_rden = out Bool()
  }
  noIoPrefix()

  val tx_area = new ClockingArea(ClockDomain(io.log_clk,io.log_rst_q)){
    val valid = Reg(Bool()) init False
    val last = Reg(Bool()) init False
    val data = Reg(Bits(32 bits)) init 0
    val rd_addr = Reg(UInt(8 bits)) init 0
    val rd_rden = Reg(Bool()) init True
    val length = Reg(UInt(8 bits)) init 0
    val mode = Reg(Bool()) init False

    val crc32 = new CRCCombinational(CRCCombinationalConfig(CRC32.MPEG2, 32 bits))

    crc32.io.cmd.data := data
    crc32.io.cmd.valid := valid
    when(!mode){
      crc32.io.cmd.mode := CRCCombinationalCmdMode.INIT
    }otherwise{
      crc32.io.cmd.mode := CRCCombinationalCmdMode.UPDATE
    }

    val tx_packet_req = Reg(Bool()) init False  addTag(crossClockDomain)
    tx_packet_req := io.tx_packet_req

    val tx_packet_trigger = Reg(Bool()) init False  addTag(crossClockDomain)
    tx_packet_trigger := io.tx_packet_trigger

    val fsm = new StateMachine{
      val Wait_Start: State = new State with EntryPoint {
        whenIsActive{
          valid := False
          last := False
          when(tx_packet_req.rise()){
            goto(Send_Head)
          }elsewhen(tx_packet_trigger.rise()){
            goto(Send_TriggerHead)
          }otherwise{
            goto(Wait_Start)
          }
        }
      }
      val Send_TriggerHead: State = new State{
        whenIsActive{
          mode := False
          valid := True
          data := 0x0000FFBA
          goto(Send_End)
        }
      }
      val Send_Head: State = new State{
        whenIsActive{
          mode := False
          valid := True
          data := 0x0000FFBC
          goto(Send_Id)
        }
      }
      val Send_Id: State = new State{
        whenIsActive{
          valid := True
          mode := True
          data := io.tx_packet_gtxid
          when(io.tx_packet_head(15 downto 0) === 1){
            rd_addr := 0
          }otherwise{
            when(io.tx_packet_head(15 downto 8) === 0){
              rd_addr := 1
            }otherwise{
              rd_addr := io.tx_packet_head(15 downto 8).asUInt
            }
          }
          rd_rden := False
          goto(Send_Length)
        }
      }
      val Send_Length: State = new State{
        whenIsActive{
          valid := True
          data := io.tx_packet_head
          rd_addr := rd_addr + 1
          goto(Send_Data)
        }
      }
      val Send_Data: State = new State{
        whenIsActive{
          valid := True
          data := io.tx_packet_data
          when(length < (io.tx_packet_head(7 downto 0).asUInt-1)){
            length := length + 1
            rd_addr := rd_addr + 1
          }otherwise{
            length := 0
            rd_addr := 0
            rd_rden := True
            goto(Send_Crc)
          }
        }
      }
      val Send_Crc: State = new State{
        whenIsActive{
          valid := True
          data := crc32.io.nextcrc
          goto(Send_End)
        }
      }
      val Send_End: State = new State{
        whenIsActive{
          valid := True
          last := True
          data := 0x0000FFBD
          goto(Wait_Start)
        }
      }
    }

    io.crc_data := crc32.io.nextcrc
    io.tx_packet_addra := rd_addr.asBits
    io.tx_packet_rden := rd_rden

    val streamfifo = new StreamFifo(Bits(32 bits),64)
    streamfifo.logic.ram.addAttribute("ram_style", "block")

    streamfifo.io.push.payload := data
    streamfifo.io.push.valid := valid

    io.s_axi_tx_tkeep := B"4'hF"
    io.s_axi_tx_tdata := streamfifo.io.pop.payload
    io.s_axi_tx_tvalid := streamfifo.io.pop.valid
    streamfifo.io.pop.ready := io.s_axi_tx_tready
    io.s_axi_tx_tlast := (streamfifo.io.occupancy === 1) && io.s_axi_tx_tready && io.s_axi_tx_tvalid

//    val ila_probe=ila("3",streamfifo.io.push.payload,streamfifo.io.push.valid,streamfifo.io.push.ready,io.s_axi_tx_tdata,io.s_axi_tx_tvalid,io.s_axi_tx_tlast,io.s_axi_tx_tready)

  }
}

object gtp_tx extends App {
  SpinalConfig(
    enumPrefixEnable = false
  ).generateVerilog(new gtp_tx())
}

object gtp_tx_sim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new gtp_tx){dut=>
      dut.tx_area.clockDomain.forkStimulus(10)
      dut.io.tx_packet_req #= false
      dut.io.tx_packet_trigger #= false
      dut.tx_area.clockDomain.waitSampling(10)
      dut.io.s_axi_tx_tready #= Random.nextBoolean()
      dut.io.tx_packet_trigger #= true
      dut.tx_area.clockDomain.waitSampling()
      dut.io.s_axi_tx_tready #= Random.nextBoolean()
      dut.io.tx_packet_trigger #= false
      for(i <- 0 until 100) {
        dut.io.s_axi_tx_tready #= Random.nextBoolean()
        dut.tx_area.clockDomain.waitSampling()
      }
      dut.io.tx_packet_trigger #= true
      dut.tx_area.clockDomain.waitSampling()
      dut.io.tx_packet_trigger #= false
      for(i <- 0 until 100) {
        dut.io.s_axi_tx_tready #= Random.nextBoolean()
        dut.tx_area.clockDomain.waitSampling()
      }
      dut.io.tx_packet_trigger #= true
      dut.tx_area.clockDomain.waitSampling()
      dut.io.tx_packet_trigger #= false
      for(i <- 0 until 100) {
        dut.io.s_axi_tx_tready #= Random.nextBoolean()
        dut.tx_area.clockDomain.waitSampling()
      }
    }
  }
}