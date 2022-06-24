package SRIO

import spinal.core._
import spinal.lib.master

case class Target(addressWidth : Int, addressLowBit : Int) extends Component{
  val io = new Bundle{
    val target = master(Target_Interface())
  }
  noIoPrefix()

  val current_tid = io.target.target_req_stream.payload.fragment(63 downto 56)                   //8 bits
  val current_ftype = io.target.target_req_stream.payload.fragment(55 downto 52)                 //4 bits
  val current_ttype = io.target.target_req_stream.payload.fragment(51 downto 48)                 //4 bits
  val current_size = io.target.target_req_stream.payload.fragment(43 downto 36)                  //8 bits
  val current_prio = io.target.target_req_stream.payload.fragment(46 downto 45).asUInt + 1       //2 bits
  val current_addr = io.target.target_req_stream.payload.fragment(33 downto 0)                   //34 bits
  val current_srcid = io.target.target_req_common.tuser(31 downto 16)

  val response_data_in_d = current_srcid ## current_addr(addressLowBit+addressWidth-1 downto addressLowBit) ## current_prio ## current_tid ## current_ftype ## current_size  addTag(crossClockDomain)
  val response_data_in = RegNext(response_data_in_d)

  val first_beat = Reg(Bool()) init True

  when(io.target.target_req_stream.fire && io.target.target_req_stream.last){
    first_beat := True
  }elsewhen(io.target.target_req_stream.fire){
    first_beat := False
  }otherwise{
    first_beat := first_beat
  }

  val generate_a_response = Reg(Bool()) init False
  when(first_beat && io.target.target_req_stream.fire){
    generate_a_response := (current_ftype === srio_ftype.NREAD.asBits)||
      (current_ftype === srio_ftype.DOORB.asBits)||
      (current_ftype === srio_ftype.MESSG.asBits)||
      ((current_ftype === srio_ftype.NWRITE.asBits)&&(current_ttype === srio_ttype.TNWR_R.asBits))
  }otherwise{
    generate_a_response := False
  }

  val capture_data = Reg(Bool()) init False
  when(first_beat && io.target.target_req_stream.fire){
    capture_data := (current_ftype === srio_ftype.SWRITE.asBits)||(current_ftype === srio_ftype.NWRITE.asBits)
  }elsewhen(io.target.target_req_stream.fire && io.target.target_req_stream.last){
    capture_data := False
  }otherwise{
    capture_data := capture_data
  }

  val data_store_wen = capture_data && io.target.target_req_stream.fire

  val data_store_waddr = Reg(Bits(addressWidth bits)) init 0
  when(first_beat && io.target.target_req_stream.fire){
    data_store_waddr := current_addr(addressLowBit+addressWidth-1 downto addressLowBit)
  }elsewhen(io.target.target_req_stream.fire){
    data_store_waddr := (data_store_waddr.asUInt + 1).asBits
  }otherwise{
    data_store_waddr := data_store_waddr
  }
  io.target.target_req_stream.ready := True

  val response_data_out_d = RegNextWhen(response_data_in,generate_a_response) init 0
  val response_data_out = RegNext(response_data_out_d) init 0
  val response_tid = response_data_out(19 downto 12)
  val response_ftype = response_data_out(11 downto 8)
  val response_size = response_data_out(7 downto 0)
  val response_prio = response_data_out(21 downto 20)
  val starting_read_addr = response_data_out(21+addressWidth downto 22)
  val dest_id = response_data_out(37+addressWidth downto 22+addressWidth)

  val pull_from_store = Mux((response_ftype === srio_ftype.NREAD.asBits),True,False)

  val responding_ttype = Mux((response_ftype === srio_ftype.NREAD.asBits),srio_ttype.TWDATA,srio_ttype.TNDATA)

  val current_beat_cnt = Reg(UInt(6 bits)) init 0
  val number_of_data_beats = Reg(UInt(6 bits))

  when(current_beat_cnt === 0){
    number_of_data_beats := response_size(7 downto 3).asUInt.resized
  }otherwise{
    number_of_data_beats := number_of_data_beats
  }

  when(io.target.target_resp_stream.fire && io.target.target_resp_stream.last){
    current_beat_cnt := 0
  }elsewhen(io.target.target_resp_stream.fire){
    current_beat_cnt := current_beat_cnt + 1
  }otherwise{
    current_beat_cnt := current_beat_cnt
  }

  val tresp_tlast = Reg(Bool()) init False
  when(responding_ttype === srio_ttype.TNDATA){
    tresp_tlast := !(io.target.target_resp_stream.fire && io.target.target_resp_stream.last)
  }elsewhen((current_beat_cnt === number_of_data_beats) && io.target.target_resp_stream.fire){
    tresp_tlast := !tresp_tlast
  }elsewhen(io.target.target_resp_stream.ready||(!io.target.target_resp_stream.valid)){
    tresp_tlast := False
  }otherwise{
    tresp_tlast := tresp_tlast
  }
  io.target.target_resp_stream.last := tresp_tlast

  val data_store_raddr = Reg(Bits(addressWidth bits)) init 0
  when(pull_from_store && (current_beat_cnt === 0) && (!io.target.target_resp_stream.fire)){
    data_store_raddr := starting_read_addr
  }elsewhen(pull_from_store && io.target.target_resp_stream.fire){
    data_store_raddr := (data_store_raddr.asUInt + 1).asBits
  }


  val generate_rsp = RegNext(generate_a_response) init False
  val generate_rsp_d = RegNext(generate_rsp) init False

  val pull_from_store_d = Reg(Bool()) init False
  when(generate_rsp_d && (current_beat_cnt === 0)){
    pull_from_store_d := True
  }elsewhen(io.target.target_resp_stream.last){
    pull_from_store_d := False
  }otherwise{
    pull_from_store_d := pull_from_store_d
  }

  val tresp_tvalid = Reg(Bool()) init False
  when(pull_from_store_d && (current_beat_cnt === 0)){
    tresp_tvalid := True
  }elsewhen(io.target.target_resp_stream.fire && io.target.target_resp_stream.last){
    tresp_tvalid := False
  }otherwise{
    tresp_tvalid := tresp_tvalid
  }
  io.target.target_resp_stream.valid := tresp_tvalid

  val header_beat = response_tid ## srio_ftype.RESP ## responding_ttype ## B"0" ## response_prio ## B"45'x0"

  /*val rspmem = Mem(Bits(64 bits), BigInt(1) << addressWidth)
  rspmem.write(data_store_waddr.asUInt,io.target.target_resp_stream.payload.fragment,data_store_wen)
  rspmem.addAttribute("ram_style", "block")*/

  val srio_reg = new Srio_Regif(addressWidth)
  srio_reg.io.simplebus.RADDR := data_store_raddr.asUInt
  srio_reg.io.simplebus.RENABLE := True
  srio_reg.io.simplebus.WENABLE := data_store_wen
  srio_reg.io.simplebus.WADDR := data_store_waddr.asUInt
  srio_reg.io.simplebus.WDATA := io.target.target_resp_stream.payload.fragment

  val tresp_tdata = Reg(Bits(64 bits))
  val data_store_dout = Reg(Bits(64 bits))
  when((current_beat_cnt === 0) &&(!io.target.target_resp_stream.fire)){
    tresp_tdata := header_beat
  }elsewhen(pull_from_store && io.target.target_resp_stream.fire){
    //tresp_tdata := rspmem.readAsync(data_store_raddr.asUInt)
    tresp_tdata := srio_reg.io.simplebus.RDATA
  }otherwise{
    tresp_tdata := tresp_tdata
  }
  io.target.target_resp_stream.payload.fragment := tresp_tdata

  io.target.target_resp_common.tkeep := B"xFF"
  io.target.target_resp_common.tuser := B"x000000FF"
}

object Target_Demo extends App{
  SpinalVerilog(Target(8,0))
}