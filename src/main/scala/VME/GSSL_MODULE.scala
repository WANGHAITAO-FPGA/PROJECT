package VME

import Memory.RamPortType.{READ, WRITE}
import Memory.XILINX_BRAM_PORT
import spinal.core._
import spinal.lib.misc.Timer
import spinal.lib.{Delay, master}

case class GSSL_MODULE(timer_cnt : Int, write_aw : Int, read_aw : Int, lookback : Boolean) extends Component{
  val io = new Bundle{
    val clk = in Bool()
    val reset = in Bool()
    val cyp1401 = master(CYP1401_Interface())
    val vme_data = in Vec(Bits(32 bits),6)
    val sensor_data = out Vec(Bits(32 bits),12)
    val rx_led = out Bool()
  }
  noIoPrefix()

    val gssl_txarea = new ClockingArea(ClockDomain(io.clk,io.reset)){
    val cyp1401_init= new CYP1401_Init
    io.cyp1401.GSSL_INSEL_A := cyp1401_init.io.GSSL_INSEL_A
    io.cyp1401.GSSL_INSEL_B := cyp1401_init.io.GSSL_INSEL_B
    io.cyp1401.GSSL_INSEL_C := cyp1401_init.io.GSSL_INSEL_C
    io.cyp1401.GSSL_TXOPA := cyp1401_init.io.GSSL_TXOPA
    io.cyp1401.GSSL_TXOPB := cyp1401_init.io.GSSL_TXOPB
    io.cyp1401.GSSL_TXOPC := cyp1401_init.io.GSSL_TXOPC
    io.cyp1401.GSSL_LPEN_ABCD := cyp1401_init.io.GSSL_LPEN_ABCD
    io.cyp1401.GSSL_SPDSEL_ABCD := cyp1401_init.io.GSSL_SPDSEL_ABCD
    io.cyp1401.GSSL_TRSTZ_N_ABCD := cyp1401_init.io.GSSL_TRSTZ_N_ABCD
    io.cyp1401.GSSL_MODE_A := cyp1401_init.io.GSSL_MODE_A
    io.cyp1401.GSSL_MODE_B := cyp1401_init.io.GSSL_MODE_B
    io.cyp1401.GSSL_MODE_C := cyp1401_init.io.GSSL_MODE_C

    io.cyp1401.GSSL_REFCLK_ABCD := io.clk
    /****************************GSSL_A 通道定时发送VME,SENSOR数据 *********************/
    val gssl_sensor_regs = Reg(Vec(Bits(32 bits),12))  addTag(crossClockDomain)
    val timer_A = Timer(32)
    timer_A.io.tick := cyp1401_init.io.GSSL_TRSTZ_N_ABCD
    timer_A.io.limit := timer_cnt
    when(timer_A.io.value >= timer_A.io.limit){
      timer_A.io.clear := True
    }otherwise{
      timer_A.io.clear := False
    }

    val gssl_tx_a = new GSSL_TX_MOUDLE(read_aw)
    gssl_tx_a.io.GSSL_REFCLK := io.clk
    gssl_tx_a.io.rst_in := io.reset
    io.cyp1401.GSSL_TXCT0_A := gssl_tx_a.io.GSSL_TXCT0
    io.cyp1401.GSSL_TXD_A := gssl_tx_a.io.GSSL_TXD
    gssl_tx_a.io.tx_frame_head_data := B"x00004112"
//      gssl_tx_a.io.tx_frame_head_data := B"x0000210C"
    gssl_tx_a.io.tx_data_trigger := timer_A.io.full
    gssl_tx_a.io.tx_atc_trigger := False
    gssl_tx_a.io.tx_ttc_trigger := False

    val tx_temp = Reg(Bits(32 bits))

//    when((gssl_tx_a.io.reads.addr === U(0x21)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x11223344"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x22)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x55667788"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x23)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x99aabbcc"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x24)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x01020304"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x25)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x05060708"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x26)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x090a0b0c"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x27)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x10203040"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x28)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x50607080"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x29)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x90a0b0c0"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x2a)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x12345678"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x2b)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x02030405"
//    }elsewhen((gssl_tx_a.io.reads.addr === U(0x2c)) && gssl_tx_a.io.reads.en){
//      tx_temp := B"32'x06070809"
//    }

    when((gssl_tx_a.io.reads.addr === U(0x41)) && gssl_tx_a.io.reads.en){
      tx_temp := io.vme_data(0)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x42)) && gssl_tx_a.io.reads.en){
      tx_temp := io.vme_data(1)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x43)) && gssl_tx_a.io.reads.en){
      tx_temp := io.vme_data(2)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x44)) && gssl_tx_a.io.reads.en){
      tx_temp := io.vme_data(3)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x45)) && gssl_tx_a.io.reads.en){
      tx_temp := io.vme_data(4)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x46)) && gssl_tx_a.io.reads.en){
      tx_temp := io.vme_data(5)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x47)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(0)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x48)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(1)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x49)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(2)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x4a)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(3)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x4b)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(4)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x4c)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(5)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x4d)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(6)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x4e)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(7)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x4f)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(8)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x50)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(9)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x51)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(10)
    }elsewhen((gssl_tx_a.io.reads.addr === U(0x52)) && gssl_tx_a.io.reads.en){
      tx_temp := gssl_sensor_regs(11)
    }
    gssl_tx_a.io.reads.dataOut := tx_temp
    /****************************GSSL_C 定时发送TTC，同时接受到SENSOR数据后返回ATC*********************/
    val rx_done_c = Reg(Bool()) init False  addTag(crossClockDomain)

    val timer_C = Timer(32)
    timer_C.io.tick := cyp1401_init.io.GSSL_TRSTZ_N_ABCD
    timer_C.io.limit := timer_cnt/2
    when(timer_C.io.value >= timer_C.io.limit){
      timer_C.io.clear := True
    }otherwise{
      timer_C.io.clear := False
    }

    val gssl_tx_c = new GSSL_TX_MOUDLE(read_aw)
    gssl_tx_c.io.GSSL_REFCLK := io.clk
    gssl_tx_c.io.rst_in := io.reset
    io.cyp1401.GSSL_TXCT0_C := gssl_tx_c.io.GSSL_TXCT0
    io.cyp1401.GSSL_TXD_C := gssl_tx_c.io.GSSL_TXD
    gssl_tx_c.io.tx_frame_head_data := 0
    gssl_tx_c.io.tx_data_trigger := False
    gssl_tx_c.io.tx_ttc_trigger := timer_C.io.full
    gssl_tx_c.io.tx_atc_trigger := rx_done_c
    gssl_tx_c.io.reads.dataOut := 0
    /****************************GSSL_B 用于测试 USE for TEST*********************/
      io.cyp1401.GSSL_TXCT0_B := 0
      io.cyp1401.GSSL_TXD_B := 0
//    val timer_B = Timer(32)
//      timer_B.io.tick := cyp1401_init.io.GSSL_TRSTZ_N_ABCD
//      timer_B.io.limit := timer_cnt
//      when(timer_B.io.value >= timer_B.io.limit){
//        timer_B.io.clear := True
//      }otherwise{
//        timer_B.io.clear := False
//      }
//
//    val meminitvalue_B = for(i <- 0 until 1<<read_aw)yield{
//      val initdata = i + 256
//      BigInt(initdata)
//    }
//    val roms = Mem(Bits(32 bits), BigInt(1) << read_aw) initBigInt(meminitvalue_B)
//
//    val rx_b_ttctriger =  Reg(Bool()) init False  addTag(crossClockDomain)
//
//    val gssl_tx_b = new GSSL_TX_MOUDLE(read_aw)
//    gssl_tx_b.io.GSSL_REFCLK := io.clk
//    gssl_tx_b.io.rst_in := io.reset
//    io.cyp1401.GSSL_TXCT0_B := gssl_tx_b.io.GSSL_TXCT0
//    io.cyp1401.GSSL_TXD_B := gssl_tx_b.io.GSSL_TXD
//    gssl_tx_b.io.tx_frame_head_data := B"x0000210c"
//    gssl_tx_b.io.tx_data_trigger := timer_B.io.full
//    //gssl_tx_c.io.tx_data_trigger := rx_b_ttctriger
//    gssl_tx_b.io.tx_atc_trigger := False
//    gssl_tx_b.io.tx_ttc_trigger := False
//    gssl_tx_b.io.reads.dataOut := roms.readSync(gssl_tx_b.io.reads.addr.resized,gssl_tx_b.io.reads.en)
//
    io.sensor_data := gssl_sensor_regs
  }
  /****************************GSSL_A接受未使用 *********************/
  /****************************GSSL_C 接受SENSOR数据 *********************/
  val gssl_rxarea_c = new ClockingArea(ClockDomain(if(!lookback) io.cyp1401.GSSL_RXCLK_C else io.clk,io.reset)){
    val rx_module_c = new GSSL_RX_MOUDLE(write_aw)
    if(!lookback){
      rx_module_c.io.GSSL_RXCLK := io.cyp1401.GSSL_RXCLK_C
      rx_module_c.io.GSSL_RXD := io.cyp1401.GSSL_RXD_C
      rx_module_c.io.GSSL_RXST0 := io.cyp1401.GSSL_RXST0_C
    }

    rx_module_c.io.rst_in := io.reset
    //rx_module_b.io.writes <> io.writes
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x21))){
      gssl_txarea.gssl_sensor_regs(0) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x22))){
      gssl_txarea.gssl_sensor_regs(1) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x23))){
      gssl_txarea.gssl_sensor_regs(2) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x24))){
      gssl_txarea.gssl_sensor_regs(3) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x25))){
      gssl_txarea.gssl_sensor_regs(4) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x26))){
      gssl_txarea.gssl_sensor_regs(5) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x27))){
      gssl_txarea.gssl_sensor_regs(6) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x28))){
      gssl_txarea.gssl_sensor_regs(7) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x29))){
      gssl_txarea.gssl_sensor_regs(8) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x2a))){
      gssl_txarea.gssl_sensor_regs(9) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x2b))){
      gssl_txarea.gssl_sensor_regs(10) := rx_module_c.io.writes.dataIn
    }
    when((rx_module_c.io.writes.we) && (rx_module_c.io.writes.addr === U(0x2c))){
      gssl_txarea.gssl_sensor_regs(11) := rx_module_c.io.writes.dataIn
    }
    io.rx_led := rx_module_c.io.rx_led

    val rx_done_b_delay1 = Reg(Bool()) init False
    val rx_done_b_delay2 = Reg(Bool()) init False
    rx_done_b_delay1 := Delay(rx_module_c.io.rx_frame_done,1)
    rx_done_b_delay2 := Delay(rx_module_c.io.rx_frame_done,2)
    gssl_txarea.rx_done_c := rx_module_c.io.rx_frame_done|rx_done_b_delay1|rx_done_b_delay2
  }
  /****************************GSSL_B接受TTC触发后发送SENSOR数据  *********************/
//  val gssl_rxarea_b = new ClockingArea(ClockDomain(if(!lookback) io.cyp1401.GSSL_RXCLK_B else io.clk,io.reset)){
//    val rx_module_b = new GSSL_RX_MOUDLE(write_aw)
//    if(!lookback){
//      rx_module_b.io.GSSL_RXCLK := io.cyp1401.GSSL_RXCLK_B
//      rx_module_b.io.GSSL_RXD := io.cyp1401.GSSL_RXD_B
//      rx_module_b.io.GSSL_RXST0 := io.cyp1401.GSSL_RXST0_B
//    }
//
//    rx_module_b.io.rst_in := io.reset
//
//    val rx_b_ttctriger_delay1 = Reg(Bool()) init False
//    val rx_b_ttctriger_delay2 = Reg(Bool()) init False
//    rx_b_ttctriger_delay1 := Delay(rx_module_b.io.rx_ttc_trigger,1)
//    rx_b_ttctriger_delay2 := Delay(rx_module_b.io.rx_ttc_trigger,2)
//    gssl_txarea.rx_b_ttctriger := rx_module_b.io.rx_ttc_trigger|rx_b_ttctriger_delay1|rx_b_ttctriger_delay2
//  }

}

object GSSL_MODULE{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new GSSL_MODULE(500,6,8,true)){dut=>
      dut.gssl_txarea.clockDomain.forkStimulus(8)
      dut.io.vme_data(0) #= 0x01020304
      dut.io.vme_data(1) #= 0x02030405
      dut.io.vme_data(2) #= 0x06070809
      dut.io.vme_data(3) #= 0x11121314
      dut.io.vme_data(4) #= 0x21222324
      dut.io.vme_data(5) #= 0x31323334

      dut.gssl_txarea.clockDomain.waitSampling(10)
//      dut.gssl_rxarea_b.clockDomain.forkStimulus(8)
      dut.gssl_txarea.clockDomain.waitSampling(5000)
    }
  }
}

/*object GSSL_MODULE extends App{
  SpinalVerilog(new GSSL_MODULE(500,6,8,false))
}*/
