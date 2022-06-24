package EMIF

import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config}
import spinal.lib.io.InOutWrapper
import spinal.lib.master
import spinal.core.sim._


class EMIF32_Apb(sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val apb = master(Apb3(Apb3Config(addressWidth = sramLayout.addressWidth,dataWidth = sramLayout.dataWidth*2)))
  }
  noIoPrefix()

  val penable = Reg(Bool()) init False

  val wr_datatemp = Reg(Bits(sramLayout.dataWidth*2 bits)) init 0

  val rd_datatemp = Reg(Bits(sramLayout.dataWidth bits)) init 0

  penable := (!io.emif.emif_oe)|(!io.emif.emif_we)
  io.apb.PADDR := (io.emif.emif_addr(sramLayout.addressWidth-2 downto 0)<<2).resized
  io.apb.PSEL := ~(io.emif.emif_cs.asBits)
  io.apb.PENABLE := Mux(penable.rise(),penable,False)
  //io.apb.PENABLE := (!io.emif.emif_oe)|(!io.emif.emif_we)
  io.apb.PWRITE := (!io.emif.emif_we)&io.emif.emif_oe&io.emif.emif_addr.msb

  io.emif.emif_data.writeEnable := !io.emif.emif_oe

  io.emif.emif_data.write := Mux(!io.emif.emif_addr.msb,io.apb.PRDATA(15 downto 0),io.apb.PRDATA(31 downto 16))

  when((!io.emif.emif_we)&io.emif.emif_oe&(!io.emif.emif_addr.msb)){
    wr_datatemp(15 downto 0) := io.emif.emif_data.read
  }elsewhen((!io.emif.emif_we)&io.emif.emif_oe&io.emif.emif_addr.msb){
    wr_datatemp(31 downto 16) := io.emif.emif_data.read
  }
  io.apb.PWDATA := wr_datatemp
}

//object EMIF32_Apb extends App{
//  SpinalVerilog(InOutWrapper(new EMIF32_Apb(SramLayout(24,16))))
//}

