package SRIO

import PHPA82.ila_test.ila
import spinal.core._
import spinal.lib.misc.Timer
import spinal.lib.{Delay, StreamFifo, master, slave}

case class Intitaor(fifo_depth:Int) extends Component{
  val io = new Bundle{
    val intiator = master(Intitaor_Interface())
    val usercmd = slave (UserCmd())
    val send_start = in Bool()
    val iresp_stream = master Stream (Bits(64 bits))
  }
  noIoPrefix()

  io.intiator.intiator_req_common.tkeep := B"xFF"
  io.intiator.intiator_req_common.tuser := B"x00FF0000"

  val current_addr = io.usercmd.user_addr
  val current_ftype = io.usercmd.user_ftype
  val current_ttype = io.usercmd.user_ttype
  val current_size = io.usercmd.user_size
  val current_prio = io.usercmd.user_prio
  val current_tid = io.usercmd.user_tid

  val streamfifo = new StreamFifo(Bits(64 bits),fifo_depth)
  streamfifo.io.push << io.usercmd.user_data

  val header_beat = current_tid ## current_ftype ## current_ttype ## B"0" ## current_prio ## B"0" ## current_size ## B"2'x0" ## current_addr

  val current_beat_cnt = Reg(UInt(6 bits)) init 0
  when(io.intiator.intiator_req_stream.fire && io.intiator.intiator_req_stream.last){
    current_beat_cnt := 0
  }elsewhen(io.intiator.intiator_req_stream.fire){
    current_beat_cnt := current_beat_cnt + 1
  }otherwise{
    current_beat_cnt := current_beat_cnt
  }

  val number_of_data_beats = current_size(7 downto 3)

  val ireq_tlast = Reg(Bool()) init False

  when(((current_ftype === SrioFtype.NREAD)||(current_ftype === SrioFtype.DOORB))&&(current_beat_cnt === 0)){
    ireq_tlast := !(io.intiator.intiator_req_stream.fire && io.intiator.intiator_req_stream.last)
  }elsewhen((current_beat_cnt === number_of_data_beats.asUInt) && io.intiator.intiator_req_stream.fire){
    ireq_tlast := !ireq_tlast
  }elsewhen(!io.intiator.intiator_req_stream.ready){
    ireq_tlast := ireq_tlast
  }elsewhen(io.intiator.intiator_req_stream.ready || (!io.intiator.intiator_req_stream.valid)){
    ireq_tlast := False
  }otherwise{
    ireq_tlast := ireq_tlast
  }
  io.intiator.intiator_req_stream.last := ireq_tlast

  val ireq_tdata = Reg(Bits(64 bits))
  when((current_beat_cnt === 0) && !(io.intiator.intiator_req_stream.fire)){
    ireq_tdata := header_beat
  }otherwise{
    ireq_tdata := streamfifo.io.pop.payload
  }
  io.intiator.intiator_req_stream.payload.fragment := ireq_tdata

  val user_data_ready = Reg(Bool()) init False
  val ireq_tvalid = Reg(Bool()) init False
  val send_start_d = RegNext(io.send_start) init False
  when(io.intiator.intiator_req_stream.fire && io.intiator.intiator_req_stream.last){
    ireq_tvalid := False
    //user_data_ready := False
  }elsewhen(io.send_start && (!send_start_d)){
    ireq_tvalid := True
    //user_data_ready := True
  }otherwise{
    ireq_tvalid := ireq_tvalid
    //user_data_ready := user_data_ready
  }
  io.intiator.intiator_req_stream.valid := ireq_tvalid
  streamfifo.io.pop.ready := io.intiator.intiator_req_stream.fire && (current_beat_cnt =/= 0)

  /***********************Response Side Check*****************/
  val write_queue_data_d = B"44'x0" ## current_tid ## current_ftype ## current_size
  val write_queue_data = RegNext(write_queue_data_d)
  val expecting_a_response = Reg(Bool()) init False
  when((current_beat_cnt === 0) && (io.intiator.intiator_req_stream.fire)){
    expecting_a_response := (current_ftype === SrioFtype.NREAD)||
      (current_ftype === SrioFtype.DOORB)||
      ((current_ftype===SrioFtype.NWRITE)&&(current_ttype===SrioTtype.TNWR_R))||
      (current_ftype===SrioFtype.MESSG)
  }otherwise{
    expecting_a_response := False
  }

  val read_queue_data = RegNextWhen(write_queue_data,expecting_a_response)
  val expected_tid = read_queue_data(19 downto 12)
  val expected_ftype = read_queue_data(11 downto 8)
  val expected_size = read_queue_data(7 downto 0)

  val compare_received = Reg(Bool()) init True
  when(io.intiator.intiator_resp_stream.fire && io.intiator.intiator_resp_stream.last){
    compare_received := True
  }elsewhen(io.intiator.intiator_resp_stream.fire){
    compare_received := False
  }otherwise{
    compare_received := compare_received
  }

  val request_autocheck_error = Reg(Bool()) init False
  when(compare_received && io.intiator.intiator_resp_stream.fire){
    request_autocheck_error := (expected_tid =/= io.intiator.intiator_resp_stream.payload.fragment(63 downto 56))||
      ((expected_ftype === srio_ftype.NREAD.asBits)&&(io.intiator.intiator_resp_stream.payload.fragment(51 downto 48) =/= srio_ttype.TWDATA.asBits))||
      ((expected_ftype === srio_ftype.NWRITE.asBits)&&(io.intiator.intiator_resp_stream.payload.fragment(51 downto 48) =/= srio_ttype.TNDATA.asBits))||
      ((expected_ftype === srio_ftype.DOORB.asBits)&&(io.intiator.intiator_resp_stream.payload.fragment(51 downto 48) =/= srio_ttype.TNDATA.asBits))
  }otherwise{
    request_autocheck_error := False
  }

  val iresp_tready = Reg(Bool()) init False
  when(io.intiator.intiator_resp_stream.fire && io.intiator.intiator_resp_stream.last){
    iresp_tready := False
  }otherwise{
    iresp_tready := True
  }
  io.intiator.intiator_resp_stream.ready := iresp_tready

  val nread_iresp_write = Reg(Bool()) init False
  when(compare_received && (expected_ftype === srio_ftype.NREAD.asBits) && io.intiator.intiator_resp_stream.fire){
    nread_iresp_write := True
  }elsewhen(io.intiator.intiator_resp_stream.fire && io.intiator.intiator_resp_stream.last){
    nread_iresp_write := False
  }otherwise{
    nread_iresp_write := nread_iresp_write
  }

  io.iresp_stream.payload := io.intiator.intiator_resp_stream.payload.fragment
  io.iresp_stream.valid := nread_iresp_write && io.intiator.intiator_resp_stream.fire
}


case class Intitaor_Test(timerl_imit : Int) extends Component{
  val io = new Bundle{
    val usercmd = master (UserCmd())
    val send_start = out Bool()
  }
  noIoPrefix()

  val timer = Timer(32)
  timer.io.tick := True
  timer.io.limit := timerl_imit
  when(timer.io.value >= timer.io.limit){
    timer.io.clear := True
  }otherwise{
    timer.io.clear := False
  }

  val send_start = Reg(Bool()) init False
  send_start := False
  when(timer.io.full){
    send_start := True
  }

  io.usercmd.user_ftype := SrioFtype.NREAD
  io.usercmd.user_prio := 1
  io.usercmd.user_size := 7
  io.usercmd.user_tid := 10
  io.usercmd.user_ttype := SrioTtype.TNWR
  io.usercmd.user_addr := 16
  io.usercmd.user_data.valid := False
  io.usercmd.user_data.payload := 0

  io.send_start := send_start | Delay(send_start,1) | Delay(send_start,2) | Delay(send_start,3)
}

case class Intitaor_TestDemo() extends Component{
  val io = new Bundle{
    val intiator = master(Intitaor_Interface())
    val iresp_stream = master Stream (Bits(64 bits))
  }
  noIoPrefix()

  val intitaor_test = Intitaor_Test(500)
  val intitaor = Intitaor(256)
  intitaor.io.usercmd <> intitaor_test.io.usercmd
  io.intiator <> intitaor.io.intiator
  io.iresp_stream <> intitaor.io.iresp_stream
  intitaor.io.send_start := intitaor_test.io.send_start
  //intitaor.io.send_start.addAttribute("MARK_DEBUG","TRUE")
}

object Intitaor_TestDemo{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Intitaor_TestDemo()){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.intiator.intiator_req_stream.ready #= true
      dut.io.iresp_stream.ready #= true
      dut.clockDomain.waitSampling(10)
      dut.clockDomain.waitSampling(10000)
    }
  }
}
