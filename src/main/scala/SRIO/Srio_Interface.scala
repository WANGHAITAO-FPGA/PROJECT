package SRIO

import spinal.core._
import spinal.lib.{Fragment, IMasterSlave, Stream, master, slave}

object SrioFtype extends SpinalEnum{
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

object SrioTtype extends SpinalEnum() {
  val TNWR,TNWR_R,TNDATA,TWDATA= newElement()
  defaultEncoding = SpinalEnumEncoding("")(
    TNWR   -> 0x4,
    TNWR_R -> 0x5,
    TNDATA -> 0x0,
    TWDATA -> 0x8
  )
}

case class UserCmd() extends Bundle with IMasterSlave{
  val user_addr = Bits(34 bits)
  val user_ftype = SrioFtype()
  val user_ttype = SrioTtype()
  val user_size = Bits(8 bits)
  val user_prio = Bits(2 bits)
  val user_tid  = Bits(8 bits)
  val user_data = Stream(Bits(64 bits))

  override def asMaster(): Unit = {
    out(user_addr,user_ftype,user_ttype,user_size,user_prio,user_tid)
    master(user_data)
  }
}


case class Common_Interface() extends Bundle with IMasterSlave{
  val tkeep = Bits(8 bits)
  val tuser = Bits(32 bits)
  override def asMaster(): Unit = {
    out(tkeep,tuser)
  }
}

case class Intitaor_Interface() extends Bundle with IMasterSlave{
  val intiator_req_stream = Stream Fragment(Bits(64 bits))
  val intiator_req_common = Common_Interface()

  val intiator_resp_stream = Stream Fragment(Bits(64 bits))
  val intiator_resp_common = Common_Interface()

  override def asMaster(): Unit = {
    master(intiator_req_stream,intiator_req_common)
    slave(intiator_resp_stream,intiator_resp_common)
  }
  intiator_req_stream.valid.setName("s_axis_ireq_tvalid")
  intiator_req_stream.ready.setName("s_axis_ireq_tready")
  intiator_req_stream.payload.fragment.setName("s_axis_ireq_tdata")
  intiator_req_stream.payload.last.setName("s_axis_ireq_tlast")
  intiator_req_common.tkeep.setName("s_axis_ireq_tkeep")
  intiator_req_common.tuser.setName("s_axis_ireq_tuser")

  intiator_resp_stream.valid.setName("m_axis_iresp_tvalid")
  intiator_resp_stream.ready.setName("m_axis_iresp_tready")
  intiator_resp_stream.payload.fragment.setName("m_axis_iresp_tdata")
  intiator_resp_stream.payload.last.setName("m_axis_iresp_tlast")
  intiator_resp_common.tkeep.setName("m_axis_iresp_tkeep")
  intiator_resp_common.tuser.setName("m_axis_iresp_tuser")
}

case class Target_Interface() extends Bundle with IMasterSlave{
  val target_resp_stream = Stream Fragment(Bits(64 bits))
  val target_resp_common = Common_Interface()

  val target_req_stream = Stream Fragment(Bits(64 bits))
  val target_req_common = Common_Interface()

  override def asMaster(): Unit = {
    master(target_resp_stream,target_resp_common)
    slave(target_req_stream,target_req_common)
  }

  target_resp_stream.valid.setName("s_axis_tresp_tvalid")
  target_resp_stream.ready.setName("s_axis_tresp_tready")
  target_resp_stream.payload.fragment.setName("s_axis_tresp_tdata")
  target_resp_stream.payload.last.setName("s_axis_tresp_tlast")
  target_resp_common.tkeep.setName("s_axis_tresp_tkeep")
  target_resp_common.tuser.setName("s_axis_tresp_tuser")

  target_req_stream.valid.setName("m_axis_treq_tvalid")
  target_req_stream.ready.setName("m_axis_treq_tready")
  target_req_stream.payload.fragment.setName("m_axis_treq_tdata")
  target_req_stream.payload.last.setName("m_axis_treq_tlast")
  target_req_common.tkeep.setName("m_axis_treq_tkeep")
  target_req_common.tuser.setName("m_axis_treq_tuser")
}

case class Srio_Interface() extends Bundle with IMasterSlave{
  val intiator = Intitaor_Interface()
  val target = Target_Interface()

  override def asMaster(): Unit = {
    master(intiator,target)
  }

}

case class Srio_Interface_Demo() extends Component{
  /*def stub: this.type = this.rework{
    for (elem <- this.getAllIo) {         //遍历所有端口
      if(elem.isInOut | elem.isOutput){    //如果端口为inout 或者 output
        elem.removeAssignments()           //剔除这些端口上的连线
        elem := elem.getZero               //给这些端口连上io
      }
    }
    this
  }*/

  val io = new Bundle{
    val srio = master (Srio_Interface())
  }
  noIoPrefix()

  val initator_t = Intitaor_TestDemo()
  val target_t = Target(8,0)
  io.srio.target <> target_t.io.target
  io.srio.intiator <> initator_t.io.intiator
  //io.srio.intiator.addAttribute("MARK_DEBUG","TRUE")


}

object Srio_Interface_Demo extends App{
  SpinalVerilog(new Srio_Interface_Demo())
}

object Srio_Interface_Sim{
  import spinal.core.sim._

  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new Srio_Interface_Demo()){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.srio.intiator.intiator_req_stream.ready #= true
      dut.clockDomain.waitSampling(10)
      dut.clockDomain.waitSampling(10000)
    }
  }
}