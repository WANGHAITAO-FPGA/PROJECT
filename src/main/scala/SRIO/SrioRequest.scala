package SRIO

import spinal.core._
import spinal.lib.{Fragment, master, slave}
import spinal.core.sim._

class SrioRequest extends Component{
  val io = new Bundle{
    val ireq = master Stream Fragment(Bits(64 bits))
    val iresp = slave Stream Fragment(Bits(64 bits))
    val user_addr = in Bits(34 bits)
    val user_ftype = in Bits(4 bits)
    val user_ttype = in Bits(4 bits)
    val user_size = in Bits(8 bits)
    val user_prio = in Bits(2 bits)
    val user_tid  = in Bits(8 bits)
    val user_data = slave Stream (Bits(64 bits))
    val send_start = in Bool()
    val iresp_stream = master Stream (Bits(64 bits))
  }
  noIoPrefix()
  import srio_ttype._
  import srio_ftype._

  val current_addr = io.user_addr
  val current_ftype = io.user_ftype
  val current_ttype = io.user_ttype
  val current_size = io.user_size
  val current_prio = io.user_prio
  val current_tid = io.user_tid

  val header_beat = current_tid ## current_ftype ## current_ttype ## B"0" ## current_prio ## B"0" ## current_size ## B"2'x0" ## current_addr

  val current_beat_cnt = Reg(UInt(6 bits)) init 0
  when(io.ireq.fire && io.ireq.last){
    current_beat_cnt := 0
  }elsewhen(io.ireq.fire){
    current_beat_cnt := current_beat_cnt + 1
  }otherwise{
    current_beat_cnt := current_beat_cnt
  }

  val number_of_data_beats = current_size(7 downto 3)

  val ireq_tlast = Reg(Bool()) init False
  when(((current_ftype === srio_ftype.NREAD.asBits)||(current_ftype === srio_ftype.DOORB.asBits))&&(current_beat_cnt === 0)){
    ireq_tlast := !(io.ireq.fire && io.ireq.last)
  }elsewhen((current_beat_cnt === number_of_data_beats.asUInt) && io.ireq.fire){
    ireq_tlast := !ireq_tlast
  }elsewhen(!io.ireq.ready){
    ireq_tlast := ireq_tlast
  }elsewhen(io.ireq.ready || (!io.ireq.valid)){
    ireq_tlast := False
  }otherwise{
    ireq_tlast := ireq_tlast
  }
  io.ireq.last := ireq_tlast

  val ireq_tdata = Reg(Bits(64 bits))
  when((current_beat_cnt === 0) && !(io.ireq.fire)){
    ireq_tdata := header_beat
  }otherwise{
    ireq_tdata := io.user_data.payload
  }
  io.ireq.payload.fragment := ireq_tdata

  val user_data_ready = Reg(Bool()) init False
  val ireq_tvalid = Reg(Bool()) init False
  val send_start_d = RegNext(io.send_start) init False
  when(io.ireq.fire && io.ireq.last){
    ireq_tvalid := False
    user_data_ready := False
  }elsewhen(io.send_start && (!send_start_d)){
    ireq_tvalid := True
    user_data_ready := True
  }otherwise{
    ireq_tvalid := ireq_tvalid
    user_data_ready := user_data_ready
  }
  io.ireq.valid := ireq_tvalid
  io.user_data.ready := user_data_ready

  /***********************Response Side Check*****************/
  val write_queue_data_d = B"44'x0" ## current_tid ## current_ftype ## current_size
  val write_queue_data = RegNext(write_queue_data_d)
  val expecting_a_response = Reg(Bool()) init False
  when((current_beat_cnt === 0) && (io.ireq.fire)){
    expecting_a_response := (current_ftype === srio_ftype.NREAD.asBits)||
      (current_ftype === srio_ftype.DOORB.asBits)||
      ((current_ftype===srio_ftype.NWRITE.asBits)&&(current_ttype===srio_ttype.TNWR_R.asBits))||
      (current_ftype===srio_ftype.MESSG.asBits)
  }otherwise{
    expecting_a_response := False
  }

  val read_queue_data = RegNextWhen(write_queue_data,expecting_a_response)
  val expected_tid = read_queue_data(19 downto 12)
  val expected_ftype = read_queue_data(11 downto 8)
  val expected_size = read_queue_data(7 downto 0)

  val compare_received = Reg(Bool()) init True
  when(io.iresp.fire && io.iresp.last){
    compare_received := True
  }elsewhen(io.iresp.fire){
    compare_received := False
  }otherwise{
    compare_received := compare_received
  }

  val request_autocheck_error = Reg(Bool()) init False
  when(compare_received && io.iresp.fire){
    request_autocheck_error := (expected_tid =/= io.iresp.payload.fragment(63 downto 56))||
      ((expected_ftype === srio_ftype.NREAD.asBits)&&(io.iresp.payload.fragment(51 downto 48) =/= srio_ttype.TWDATA.asBits))||
      ((expected_ftype === srio_ftype.NWRITE.asBits)&&(io.iresp.payload.fragment(51 downto 48) =/= srio_ttype.TNDATA.asBits))||
      ((expected_ftype === srio_ftype.DOORB.asBits)&&(io.iresp.payload.fragment(51 downto 48) =/= srio_ttype.TNDATA.asBits))
  }otherwise{
    request_autocheck_error := False
  }

  val iresp_tready = Reg(Bool()) init False
  when(io.iresp.fire && io.iresp.last){
    iresp_tready := False
  }otherwise{
    iresp_tready := True
  }
  io.iresp.ready := iresp_tready

  val nread_iresp_write = Reg(Bool()) init False
  when(compare_received && (expected_ftype === srio_ftype.NREAD.asBits) && io.iresp.fire){
    nread_iresp_write := True
  }elsewhen(io.iresp.fire && io.iresp.last){
    nread_iresp_write := False
  }otherwise{
    nread_iresp_write := nread_iresp_write
  }

  io.iresp_stream.payload := io.iresp.payload.fragment
  io.iresp_stream.valid := nread_iresp_write && io.iresp.fire
}


object SrioRequest extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new SrioRequest())
}
