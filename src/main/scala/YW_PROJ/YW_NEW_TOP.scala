package YW_PROJ

import EMIF.{EMIF32_Apb, SramInterface, SramLayout}
import ENDAT.ENDAT_Interface
import PHPA82.ila_test.ila
import PHPA82.regFileGen.genRegFileByMarkdown
import Test.Ad7606_Interface
import spinal.core._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Decoder, Apb3Gpio}
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.io.InOutWrapper
import spinal.lib.{CounterFreeRun, master}

import scala.collection.mutable.ArrayBuffer

case class YW_NEW_TOP(sramLayout : SramLayout, ad5781_num : Int, endat_num : Int) extends Component{
  val io = new Bundle{
    val emif = master(SramInterface(sramLayout))
    val ad5781 = Seq.fill(ad5781_num)(master(AD5781_Interface()))
    val ad7760 = master(AD7760_Interface())
    val ad_7606 = master(Ad7606_Interface(true))
    val endat = Seq.fill(endat_num)(master(ENDAT_Interface()))
    val sys_clk = in Bool()
    val reset = in Bool()
    val led = out Bool()
    val interrupt = Seq.fill(endat_num)(out Bool())
    val gpio_in = in Bits(6 bits)
    val gpio_out = out Bits(6 bits)
    emif.emif_data.setName("emif_data")
    emif.emif_addr.setName("emif_addr")
    emif.emif_cs.setName("emif_cs_n")
    emif.emif_oe.setName("emif_oe_n")
    emif.emif_we.setName("emif_we_n")
  }
  noIoPrefix()

  val clk_wiz_0 = new clk_wiz_0
  clk_wiz_0.clk_in1 := io.sys_clk
  clk_wiz_0.reset := False

  val area = new ClockingArea(ClockDomain(clk_wiz_0.clk_out1,~clk_wiz_0.locked)){
    val emif32_toapb = new EMIF32_Apb(sramLayout)
    emif32_toapb.io.emif <> io.emif

    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val bsp_ctrl = new Apb3_Yw_Bsp(12,ad5781_num,endat_num)
    bsp_ctrl.io.ad7760 <> io.ad7760
    bsp_ctrl.io.ad_7606 <> io.ad_7606
    bsp_ctrl.io.gpio_in := io.gpio_in
    io.gpio_out := bsp_ctrl.io.gpio_out
    for(i <- 0 until ad5781_num){
      bsp_ctrl.io.ad5781(i) <> io.ad5781(i)
    }
    for(i <- 0 until endat_num){
      bsp_ctrl.io.endat(i) <> io.endat(i)
      io.interrupt(i) := bsp_ctrl.io.interrupt(i)
    }
    apbMapping += bsp_ctrl.io.apb-> (0x010000, 1024 Bytes)

    val apbDecoder = Apb3Decoder(
      master = emif32_toapb.io.apb,
      slaves = apbMapping
    )

    val ila_probe=ila("0",bsp_ctrl.io.apb.PWRITE,bsp_ctrl.io.apb.PWDATA,bsp_ctrl.io.apb.PADDR,bsp_ctrl.io.apb.PSEL,emif32_toapb.io.emif.emif_we,
      emif32_toapb.io.emif.emif_oe,emif32_toapb.io.emif.emif_cs,emif32_toapb.io.emif.emif_data.read,emif32_toapb.io.emif.emif_data.write,
      emif32_toapb.io.emif.emif_data.writeEnable,io.gpio_in,io.gpio_out)
//      val ila_probe=ila("0",io.ad_7606.cs,io.ad_7606.rd,io.ad_7606.convsta,io.ad_7606.busy,io.ad_7606.firstdata,io.ad_7606.data)

    val ledtemp = Reg(Bool()) init False

    val counter =  CounterFreeRun(50000000)
    when(counter.willOverflow){
      counter.clear()
      ledtemp := ~ledtemp;
    }
    io.led := ledtemp

    addPrePopTask(()=>genRegFileByMarkdown())
  }
}

object YW_NEW_TOP extends App{
  SpinalConfig(anonymSignalPrefix = "temp",headerWithDate = true,targetDirectory = "E:/YW/YW_NEW_TOP/YW_NEW_TOP.srcs/sources_1/imports/SRIO/").generateVerilog(InOutWrapper(new YW_NEW_TOP(SramLayout(24,16),4,4)))
}
