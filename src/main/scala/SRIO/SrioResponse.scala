package SRIO

import spinal.core.SpinalEnum
import spinal.core._
import spinal.lib.{Fragment, master, slave}
import spinal.core.sim._

object srio_ftype extends SpinalEnum {
  val NREAD,NWRITE,SWRITE,DOORB,MESSG,RESP,FTYPE9= newElement()
  defaultEncoding = SpinalEnumEncoding("")(
    NREAD   -> 0x2,
    NWRITE  -> 0x5,
    SWRITE  -> 0x6,
    DOORB   -> 0xA,
    MESSG   -> 0xB,
    RESP    -> 0xD,
    FTYPE9  -> 0x9)
}

object srio_ttype extends SpinalEnum {
  val TNWR,TNWR_R,TNDATA,TWDATA= newElement()
  defaultEncoding = SpinalEnumEncoding("")(
    TNWR   -> 0x4,
    TNWR_R -> 0x5,
    TNDATA -> 0x0,
    TWDATA -> 0x8
  )
}

case class SrioResponse(addressWidth : Int, addressLowBit : Int) extends Component{
  val io = new Bundle{
    val tresp = master Stream Fragment(Bits(64 bits))
    val treq  = slave Stream Fragment(Bits(64 bits))
    val treq_tuser = in Bits(32 bits)
  }
  noIoPrefix()

  import srio_ftype._
  import srio_ttype._

  val current_tid = io.treq.payload.fragment(63 downto 56)                   //8 bits
  val current_ftype = io.treq.payload.fragment(55 downto 52)                 //4 bits
  val current_ttype = io.treq.payload.fragment(51 downto 48)                 //4 bits
  val current_size = io.treq.payload.fragment(43 downto 36)                  //8 bits
  val current_prio = io.treq.payload.fragment(46 downto 45).asUInt + 1       //2 bits
  val current_addr = io.treq.payload.fragment(33 downto 0)                   //34 bits
  val current_srcid = io.treq_tuser(31 downto 16)

  val response_data_in_d = current_srcid ## current_addr(addressLowBit+addressWidth-1 downto addressLowBit) ## current_prio ## current_tid ## current_ftype ## current_size  addTag(crossClockDomain)
  val response_data_in = RegNext(response_data_in_d)

  val first_beat = Reg(Bool()) init True

  when(io.treq.fire && io.treq.last){
    first_beat := True
  }elsewhen(io.treq.fire){
    first_beat := False
  }otherwise{
    first_beat := first_beat
  }

  val generate_a_response = Reg(Bool()) init False
  when(first_beat && io.treq.fire){
    generate_a_response := (current_ftype === srio_ftype.NREAD.asBits)||
      (current_ftype === srio_ftype.DOORB.asBits)||
      (current_ftype === srio_ftype.MESSG.asBits)||
      ((current_ftype === srio_ftype.NWRITE.asBits)&&(current_ttype === srio_ttype.TNWR_R.asBits))
  }otherwise{
    generate_a_response := False
  }

  val capture_data = Reg(Bool()) init False
  when(first_beat && io.treq.fire){
    capture_data := (current_ftype === srio_ftype.SWRITE.asBits)||(current_ftype === srio_ftype.NWRITE.asBits)
  }elsewhen(io.treq.fire && io.treq.last){
    capture_data := False
  }otherwise{
    capture_data := capture_data
  }

  val data_store_wen = capture_data && io.treq.fire

  val data_store_waddr = Reg(Bits(addressWidth bits)) init 0
  when(first_beat && io.treq.fire){
    data_store_waddr := current_addr(addressLowBit+addressWidth-1 downto addressLowBit)
  }elsewhen(io.treq.fire){
    data_store_waddr := (data_store_waddr.asUInt + 1).asBits
  }otherwise{
    data_store_waddr := data_store_waddr
  }
  io.treq.ready := True

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

  when(io.tresp.fire && io.tresp.last){
    current_beat_cnt := 0
  }elsewhen(io.tresp.fire){
    current_beat_cnt := current_beat_cnt + 1
  }otherwise{
    current_beat_cnt := current_beat_cnt
  }

  val tresp_tlast = Reg(Bool()) init False
  when(responding_ttype === srio_ttype.TNDATA){
    tresp_tlast := !(io.tresp.fire && io.tresp.last)
  }elsewhen((current_beat_cnt === number_of_data_beats) && io.tresp.fire){
    tresp_tlast := !tresp_tlast
  }elsewhen(io.tresp.ready||(!io.tresp.valid)){
    tresp_tlast := False
  }otherwise{
    tresp_tlast := tresp_tlast
  }
  io.tresp.last := tresp_tlast

  val data_store_raddr = Reg(Bits(addressWidth bits)) init 0
  when(pull_from_store && (current_beat_cnt === 0) && (!io.tresp.fire)){
    data_store_raddr := starting_read_addr
  }elsewhen(pull_from_store && io.tresp.fire){
    data_store_raddr := (data_store_raddr.asUInt + 1).asBits
  }


  val generate_rsp = RegNext(generate_a_response) init False
  val generate_rsp_d = RegNext(generate_rsp) init False

  val pull_from_store_d = Reg(Bool()) init False
  when(generate_rsp_d && (current_beat_cnt === 0)){
    pull_from_store_d := True
  }elsewhen(io.tresp.last){
    pull_from_store_d := False
  }otherwise{
    pull_from_store_d := pull_from_store_d
  }

  val tresp_tvalid = Reg(Bool()) init False
  when(pull_from_store_d && (current_beat_cnt === 0)){
    tresp_tvalid := True
  }elsewhen(io.tresp.fire && io.tresp.last){
    tresp_tvalid := False
  }otherwise{
    tresp_tvalid := tresp_tvalid
  }
  io.tresp.valid := tresp_tvalid

  val header_beat = response_tid ## srio_ftype.RESP ## responding_ttype ## B"0" ## response_prio ## B"45'x0"

  val rspmem = Mem(Bits(64 bits), BigInt(1) << addressWidth)
  rspmem.write(data_store_waddr.asUInt,io.treq.payload.fragment,data_store_wen)
  rspmem.addAttribute("ram_style", "block")

  val tresp_tdata = Reg(Bits(64 bits))
  val data_store_dout = Reg(Bits(64 bits))
  when((current_beat_cnt === 0) &&(!io.tresp.fire)){
    tresp_tdata := header_beat
  }elsewhen(pull_from_store && io.tresp.fire){
    tresp_tdata := rspmem.readAsync(data_store_raddr.asUInt)

  }otherwise{
    tresp_tdata := tresp_tdata
  }
  io.tresp.payload.fragment := tresp_tdata
}

/*object SrioResponse extends App {
  SpinalConfig(
    //oneFilePerComponent = true,
    defaultClockDomainFrequency = FixedFrequency(100 MHz),
    headerWithDate = true,
    mergeAsyncProcess = true
  ).generateVerilog(new SrioResponse(8,0))
}*/

 object  SrioResponse{
   import srio_ftype._
   import srio_ttype._
   def BigInt2IntArray(data: BigInt, len : Int):Array[Int] = {
     val dataArray = data.toByteArray.reverse
     var length = scala.math.min(len,dataArray.length)
     var result = Array.fill[Int](len)(0.toByte)
     for(i <- 0 until length)
       result(i) = if(dataArray(i)>=0) dataArray(i) else 256 + dataArray(i)
     result
   }
   def ByteArray2BigInt(data: Array[Byte], len : Int):BigInt={
     val buffer = data.reverse.toBuffer
     buffer.prepend(0.toByte)
     BigInt(buffer.toArray)
   }
   def SrioCmd(srctid : Int, ftype : Int, ttype : Int, size : Int, addr : BigInt, prio : Int):BigInt={
     val data = Array[Byte](
       addr.toByte,
       (addr >> 8).toByte,
       (addr >> 16).toByte,
       (addr >> 24).toByte,
       ((size<<4) + (addr >> 32)).toByte,
       ((prio<<5)+ (size>>4)).toByte,
       ((ftype<<4)+ ttype).toByte,
       srctid.toByte)
     ByteArray2BigInt(data,8)
   }

   def main(args: Array[String]): Unit ={
     SimConfig.withWave.doSim(new SrioResponse(8,0)){dut=>
       dut.clockDomain.forkStimulus(10)
       dut.io.treq.valid #= false
       dut.io.treq.last #= false
       dut.io.tresp.ready #= true
       dut.io.treq_tuser #= 0
       dut.clockDomain.waitSampling(10)

//       dut.io.treq.payload.fragment #= SrioCmd(12,5,4,0x56,100,2)
//       dut.io.treq.valid #= true
//       dut.io.treq.last #= false
//       dut.clockDomain.waitSampling()
//       dut.io.treq.payload.fragment #= 0x55555555
//       dut.io.treq.valid #= true
//       dut.io.treq.last #= true
//       dut.clockDomain.waitSampling()
//       dut.io.treq.valid #= false
//       dut.io.treq.last #= false
//       dut.clockDomain.waitSampling(20)

       dut.io.treq.payload.fragment #= SrioCmd(13,6,0,3,100,2)
       dut.io.treq.valid #= true
       dut.io.treq.last #= false
       dut.clockDomain.waitSampling()
       dut.io.treq.payload.fragment #= 0x55555555
       dut.io.treq.valid #= true
       dut.io.treq.last #= false
       dut.clockDomain.waitSampling()
       dut.io.treq.payload.fragment #= 0x44444444
       dut.io.treq.valid #= true
       dut.io.treq.last #= false
       dut.clockDomain.waitSampling()
       dut.io.treq.valid #= false
       dut.io.treq.last #= false
       dut.clockDomain.waitSampling()
       dut.io.treq.payload.fragment #= 0x33333333
       dut.io.treq.valid #= true
       dut.io.treq.last #= true
       dut.clockDomain.waitSampling()
       dut.io.treq.valid #= false
       dut.io.treq.last #= false
       dut.clockDomain.waitSampling(20)

//       dut.io.treq.payload.fragment #= SrioCmd(10,5,5,0x56,100,2)
//       dut.io.treq.valid #= true
//       dut.io.treq.last #= false
//       dut.clockDomain.waitSampling()
//       dut.io.treq.payload.fragment #= 0x55555555
//       dut.io.treq.valid #= true
//       dut.io.treq.last #= true
//       dut.clockDomain.waitSampling()
//       dut.io.treq.valid #= false
//       dut.io.treq.last #= false
//       dut.clockDomain.waitSampling(20)
//
//       dut.io.treq.payload.fragment #= SrioCmd(10,2,5,0x008,0x064,2)
//       dut.io.tresp.ready #= true
//       dut.io.treq.valid #= true
//       dut.io.treq.last #= true
//       dut.clockDomain.waitSampling()
//       dut.io.tresp.ready #= false
//       dut.io.treq.valid #= false
//       dut.io.treq.last #= false
//       dut.clockDomain.waitSampling()
//       dut.io.tresp.ready #= true
//       dut.io.treq.valid #= false
//       dut.io.treq.last #= false
//       dut.clockDomain.waitSampling(200)
     }
   }
 }
