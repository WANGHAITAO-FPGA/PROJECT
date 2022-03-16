package VME

import spinal.core._
import spinal.core.sim.SimConfig
import spinal.lib.io.TriState
import spinal.lib.{CounterFreeRun, master, slave}

case class Top_Module(timer_cnt : Int) extends Component{
  val io = new Bundle{
    val vme_clk = in Bool()
    val gssl_clk = in Bool()
    val reset = in Bool()
    /************VME INTERFACE*********************/
    val vme = master(VmeInterface())
    val data = master(TriState(Bits(16 bits)))
    val gap = in Bits(4 bits)
    val sw = in Bits(4 bits)
    val gap4 = in Bool()
    val datadir = out Bool()
    /************GSSL INTERFACE*********************/
    val cyp1401 = master(CYP1401_Interface())
    val rx_led = out Bool()
    val led = out Bool()
  }
  noIoPrefix()

  val vme_area = new ClockingArea(ClockDomain(io.vme_clk,io.reset)){
    val vme_data = Reg(Vec(Bits(32 bits),6))  addTag(crossClockDomain)
    val sensor_data = Reg(Vec(Bits(32 bits),12))  addTag(crossClockDomain)
    val vme_module = new VME_TOP
    vme_module.io.clk := io.vme_clk
    vme_module.io.reset := io.reset
    vme_module.io.vme <> io.vme
    vme_module.io.data <> io.data
    vme_module.io.gap := io.gap
    vme_module.io.gap4 := io.gap4
    vme_module.io.sw := io.sw
    io.datadir := vme_module.io.datadir
    vme_data := vme_module.io.vme_data
    vme_module.io.sensor_data := sensor_data
  }

  val gssl_area = new ClockingArea(ClockDomain(io.gssl_clk,io.reset)){
    val gssl_module = new GSSL_MODULE(timer_cnt,8,8,false)
    gssl_module.io.clk := io.gssl_clk
    gssl_module.io.reset := io.reset
    io.cyp1401 <> gssl_module.io.cyp1401
    io.rx_led := gssl_module.io.rx_led
    gssl_module.io.vme_data := vme_area.vme_data
    vme_area.sensor_data := gssl_module.io.sensor_data

    val ledtemp = Reg(Bool()) init False
    val counter =  CounterFreeRun(62500000)
    when(counter.willOverflow){
      counter.clear()
      ledtemp := ~ledtemp;
    }
    io.led := ledtemp
  }
}

object Top_Module extends App{
  SpinalVerilog(new Top_Module(500))
}
class Top_Module_Test extends Top_Module(5000){
  import spinal.core.sim._
  def init = {
    vme_area.clockDomain.forkStimulus(25)
    gssl_area.clockDomain.forkStimulus(8)
    io.vme.am #= 0
    io.vme.lword #= false
    io.vme.iack #= false
    io.gap #= 15
    io.sw #= 15
    io.gap4 #= true
    io.vme.write #= true
    io.vme.as #= true
    io.vme.ds0 #= true
    io.vme.ds1 #= true
    vme_area.clockDomain.waitSampling(20)
  }
  def vme_write(addr:Int,data:Int): Unit ={
    io.vme.am #= 57
    io.vme.lword #= true
    io.vme.iack #= true
    io.vme.as #= false
    io.vme.addr #= 0xc00000+(addr<<1)
    vme_area.clockDomain.waitSampling()
    io.vme.write #= false
    vme_area.clockDomain.waitSamplingWhere(io.vme.dtack.toBoolean)
    io.vme.ds0 #= false
    io.vme.ds1 #= false
    io.data.read #= data
    vme_area.clockDomain.waitSamplingWhere(!io.vme.dtack.toBoolean)
    io.vme.am #= 0
    io.vme.lword #= false
    io.vme.iack #= false
    io.vme.write #= true
    io.vme.as #= true
    io.vme.ds0 #= true
    io.vme.ds1 #= true
    vme_area.clockDomain.waitSampling()
  }
  def vme_read(addr : Int){
    io.vme.am #= 57
    io.vme.lword #= true
    io.vme.iack #= true
    io.vme.as #= false
    io.vme.addr #= 0xc00000+(addr<<1)
    vme_area.clockDomain.waitSampling()
    io.vme.write #= true
    vme_area.clockDomain.waitSamplingWhere(io.vme.dtack.toBoolean)
    io.vme.ds0 #= false
    io.vme.ds1 #= false
    vme_area.clockDomain.waitSamplingWhere(!io.vme.dtack.toBoolean)
    println(io.data.write)
    io.vme.am #= 0
    io.vme.lword #= false
    io.vme.iack #= false
    io.vme.write #= true
    io.vme.as #= true
    io.vme.ds0 #= true
    io.vme.ds1 #= true
    vme_area.clockDomain.waitSampling()
  }
  def wait(cycle : Int): Unit ={
    vme_area.clockDomain.waitSampling(cycle)
  }
}

object Top_Module_Sim{
  def main(args: Array[String]): Unit = {
    val dut = SimConfig.withWave.compile(new Top_Module_Test)
    dut.doSim { dut =>
      dut.init
      dut.vme_write(0x0000,0x1234)
      dut.vme_write(0x0002,0x5678)
      dut.vme_write(0x0004,0x0102)
      dut.vme_write(0x0006,0x0304)
      dut.vme_write(0x0008,0x1112)
      dut.vme_write(0x000a,0x1314)
      dut.vme_write(0x000c,0x2122)
      dut.vme_write(0x000e,0x2324)
      dut.vme_write(0x0010,0x3132)
      dut.vme_write(0x0012,0x3334)
      dut.vme_write(0x0014,0x4142)
      dut.vme_write(0x0016,0x4344)
      dut.wait(2000)
      dut.vme_read(0x0000)
      dut.vme_read(0x0002)
      dut.vme_read(0x0004)
      dut.vme_read(0x0006)
      dut.vme_read(0x0018)
      dut.vme_read(0x001a)
      dut.vme_read(0x001c)
      dut.vme_read(0x001e)
      dut.vme_read(0x0020)
      dut.vme_read(0x0022)
      dut.vme_read(0x0024)
      dut.vme_read(0x0026)
      dut.vme_read(0x0028)
      dut.vme_read(0x002a)
      dut.vme_read(0x002c)
      dut.vme_read(0x002e)
      dut.vme_read(0x0030)
      dut.vme_read(0x0032)
      dut.vme_read(0x0034)
      dut.vme_read(0x0036)
      dut.vme_read(0x0038)
      dut.vme_read(0x003a)
      dut.vme_read(0x003c)
      dut.vme_read(0x003e)
      dut.vme_read(0x0040)
      dut.vme_read(0x0042)
      dut.vme_read(0x0044)
      dut.vme_read(0x0046)
      dut.wait(40000)
    }
  }
}
