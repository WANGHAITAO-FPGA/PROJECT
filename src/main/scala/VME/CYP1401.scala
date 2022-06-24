package VME


import Memory.RamPortType.{READ, WRITE}
import Memory.XILINX_BRAM_PORT
import spinal.core._
import spinal.lib.misc.Timer
import spinal.lib.{IMasterSlave, master, slave}

case class CYP1401_Interface() extends Bundle  with IMasterSlave{
  val GSSL_A_LOS = Bool()
  val GSSL_B_LOS = Bool()
  val GSSL_C_LOS = Bool()
  //val GSSL_D_LOS = Bool()
  val GSSL_A_TXFAULT = Bool()
  val GSSL_B_TXFAULT = Bool()
  val GSSL_C_TXFAULT = Bool()
  //val GSSL_D_TXFAULT = Bool()
  val GSSL_REFCLK_ABCD = Bool()
  val GSSL_INSEL_A = Bool()
  val GSSL_INSEL_B = Bool()
  val GSSL_INSEL_C = Bool()
  //val GSSL_INSEL_D = Bool()
  val GSSL_TXOPA = Bool()
  val GSSL_TXOPB = Bool()
  val GSSL_TXOPC = Bool()
  //val GSSL_TXOPD = Bool()
  val GSSL_SPDSEL_ABCD = Bool()
  val GSSL_LPEN_ABCD = Bool()
  val GSSL_TRSTZ_N_ABCD = Bool()
  val GSSL_MODE_A = Bits(3 bits)
  val GSSL_MODE_B = Bits(3 bits)
  val GSSL_MODE_C = Bits(3 bits)
  /*********GSSL1*********************/
  val GSSL_RXCLK_A = Bool()
  val GSSL_RXST0_A = Bits(3 bits)
  val GSSL_RXD_A = Bits(8 bits)
  val GSSL_TXCT0_A = Bits(3 bits)
  val GSSL_TXD_A = Bits(8 bits)
  /*********GSSL2*********************/
  val GSSL_RXCLK_B = Bool()
  val GSSL_RXST0_B = Bits(3 bits)
  val GSSL_RXD_B = Bits(8 bits)
  val GSSL_TXCT0_B = Bits(3 bits)
  val GSSL_TXD_B = Bits(8 bits)
  /*********GSSL3*********************/
  val GSSL_RXCLK_C = Bool()
  val GSSL_RXST0_C = Bits(3 bits)
  val GSSL_RXD_C = Bits(8 bits)
  val GSSL_TXCT0_C = Bits(3 bits)
  val GSSL_TXD_C = Bits(8 bits)

  override def asMaster(): Unit = {
    out(GSSL_REFCLK_ABCD,GSSL_INSEL_A,GSSL_INSEL_B,GSSL_INSEL_C,GSSL_TXOPA,GSSL_TXOPB,GSSL_TXOPC,GSSL_SPDSEL_ABCD,GSSL_LPEN_ABCD,GSSL_TRSTZ_N_ABCD,
      GSSL_TXCT0_A,GSSL_TXCT0_B,GSSL_TXCT0_C,GSSL_TXD_A,GSSL_TXD_B,GSSL_TXD_C,GSSL_MODE_A,GSSL_MODE_B,GSSL_MODE_C)
    in(GSSL_A_LOS,GSSL_B_LOS,GSSL_C_LOS,GSSL_A_TXFAULT,GSSL_B_TXFAULT,GSSL_C_TXFAULT,GSSL_RXCLK_A,GSSL_RXCLK_B,GSSL_RXCLK_C,GSSL_RXST0_A,GSSL_RXST0_B,GSSL_RXST0_C,
      GSSL_RXD_A,GSSL_RXD_B,GSSL_RXD_C)
  }
}

case class CYP1401_Init() extends Component{
  val io = new Bundle{
    val GSSL_INSEL_A = out Bool()
    val GSSL_INSEL_B = out Bool()
    val GSSL_INSEL_C = out Bool()
    val GSSL_TXOPA = out Bool()
    val GSSL_TXOPB = out Bool()
    val GSSL_TXOPC = out Bool()
    val GSSL_SPDSEL_ABCD = out Bool()
    val GSSL_LPEN_ABCD = out Bool()
    val GSSL_TRSTZ_N_ABCD = out Bool()
    val GSSL_MODE_A = out Bits(3 bits)
    val GSSL_MODE_B = out Bits(3 bits)
    val GSSL_MODE_C = out Bits(3 bits)
  }
  noIoPrefix()
  io.GSSL_TXOPA := False
  io.GSSL_TXOPB := False
  io.GSSL_TXOPC := False
  io.GSSL_MODE_A := 0
  io.GSSL_MODE_B := 0
  io.GSSL_MODE_C := 0
  io.GSSL_INSEL_A := True
  io.GSSL_INSEL_B := True
  io.GSSL_INSEL_C := True     //硬件回环，FALSE有效
  io.GSSL_LPEN_ABCD := False   //软件回环，TRUE有效
  io.GSSL_SPDSEL_ABCD := True

  val gsslResetUnbuffered  = True
  val GSSL_Reset_Counter = Reg(UInt(22 bits)) init 0         //22
  when(GSSL_Reset_Counter =/= U(GSSL_Reset_Counter.range -> true)){
    GSSL_Reset_Counter := GSSL_Reset_Counter + 1
    gsslResetUnbuffered := False
  }
  io.GSSL_TRSTZ_N_ABCD := RegNext(gsslResetUnbuffered)
}


case class GSSL_RX_Receiver() extends BlackBox{
  val GSSL_RXCLK = in Bool()
  val rst_in = in Bool()
  val CHS_CTRL = in Bool()
  val decode_k = in Bool()
  val decode_data = in Bits(8 bits)
  val rx_dpram_data = out Bits(32 bits)
  val rx_dpram_waddress = out Bits(8 bits)
  val rx_dpram_wr = out Bool()
  val rx_frame_head_data = out Bits(32 bits)
  val rx_atc_status_data = out Bits(8 bits)
  val rx_ttc_trigger = out Bool()
  val rx_atc_trigger = out Bool()
  val rx_frame_busy = out Bool()
  val rx_frame_done = out Bool()
  val rx_frame_len_err = out Bool()
  val rx_frame_chs_err = out Bool()
  val rx_frame_scd_err = out Bool()
  val rx_state_debug = out Bits(4 bits)
  noIoPrefix()
  addRTLPath("D:/SCALA/SRIO/CYP1401/GSSL_RX_Receiver.v")
}

case class GSSL_TX_Transmitter() extends BlackBox{
  val GSSL_REFCLK = in Bool()
  val rst_in = in Bool()
  val CHS_CTRL = in Bool()
  val tx_ttc_trigger = in Bool()
  val tx_atc_trigger = in Bool()
  val tx_data_trigger = in Bool()
  val tx_frame_head_data = in Bits(32 bits)
  val tx_dpram_q = in Bits(32 bits)
  val tx_atc_status_data = in Bits(8 bits)
  val tx_dpram_raddress = out Bits(8 bits)
  val encode_k = out Bool()
  val encode_data = out Bits(8 bits)
  val tx_frame_busy = out Bool()
  val tx_frame_done = out Bool()
  val tx_dpram_rd = out Bool()
  val tx_state_debug = out Bits(4 bits)
  noIoPrefix()
  addRTLPath("D:/SCALA/SRIO/CYP1401/GSSL_TX_Transmitter.v")
}

case class DFF_RX() extends BlackBox{
  val RXST0_in = in Bool()
  val RXCLK = in Bool()
  val RXD_in = in Bits(8 bits)
  val RXST0_out = out Bool()
  val RXD_out = out Bits(8 bits)
  noIoPrefix()
  addRTLPath("D:/SCALA/SRIO/CYP1401/dff_9.v")
}

case class GSSL_TX_MOUDLE(addressWidth : Int) extends Component{
  val io = new Bundle{
    val GSSL_REFCLK = in Bool()
    val rst_in = in Bool()
    val tx_ttc_trigger = in Bool()
    val tx_atc_trigger = in Bool()
    val tx_data_trigger = in Bool()
    val GSSL_TXCT0 = out Bits(3 bits)
    val GSSL_TXD = out Bits(8 bits)
    val tx_frame_head_data = in Bits(32 bits)
    val reads = master(XILINX_BRAM_PORT(32, addressWidth, READ))
  }
  noIoPrefix()

  val gssl_txdomain = ClockDomain(io.GSSL_REFCLK,io.rst_in)
  val gssl_area = new ClockingArea(gssl_txdomain){
    /*val timer = Timer(32)
    timer.io.tick := io.timer_tick
    timer.io.limit := timer_cnt
    when(timer.io.value >= timer.io.limit){
      timer.io.clear := True
    }otherwise{
      timer.io.clear := False
    }*/

    val gssltxtransmitter = new GSSL_TX_Transmitter
    gssltxtransmitter.GSSL_REFCLK := io.GSSL_REFCLK
    gssltxtransmitter.rst_in := io.rst_in
    gssltxtransmitter.CHS_CTRL := False
    gssltxtransmitter.tx_ttc_trigger := io.tx_ttc_trigger
    gssltxtransmitter.tx_atc_trigger := io.tx_atc_trigger
    gssltxtransmitter.tx_data_trigger := io.tx_data_trigger
    gssltxtransmitter.tx_frame_head_data := io.tx_frame_head_data
    gssltxtransmitter.tx_atc_status_data := 0

    io.reads.addr := gssltxtransmitter.tx_dpram_raddress.resize(addressWidth).asUInt
    io.reads.en := gssltxtransmitter.tx_dpram_rd
    gssltxtransmitter.tx_dpram_q := io.reads.dataOut

    io.GSSL_TXCT0(2 downto 1) := 0
    io.GSSL_TXCT0(0) := gssltxtransmitter.encode_k
    io.GSSL_TXD := gssltxtransmitter.encode_data
  }
}

case class GSSL_RX_LED(error_cnt : Int) extends Component{
  val io = new Bundle{
    val trig = in Bool()
    val rx_led = out Bool()
  }
  noIoPrefix()
  val counter = Reg(UInt(32 bits)) init 0
  when(io.trig){
    counter := 0
  }otherwise{
    when(counter =/= error_cnt){
      counter := counter + 1
    }
  }
  io.rx_led := (counter === error_cnt)
}

case class GSSL_RX_MOUDLE(addressWidth : Int) extends Component{
  val io = new Bundle{
    val GSSL_RXCLK = in Bool()
    val rst_in = in Bool()
    val GSSL_RXST0 = in Bits(3 bits)
    val GSSL_RXD = in Bits(8 bits)
    val writes = master(XILINX_BRAM_PORT(32, addressWidth, WRITE))
    val rx_frame_done = out Bool()
    val rx_ttc_trigger = out Bool()
    val rx_error = out Bool()
    val rx_frame_head_data = out Bits(32 bits)
    val rx_led = out Bool()
  }
  noIoPrefix()
  val gssl_rxdomain = ClockDomain(io.GSSL_RXCLK,io.rst_in)
  val gssl_area = new ClockingArea(gssl_rxdomain){
    val RXST0_out = Reg(Bool())
    val RXD_out = Reg(Bits(8 bits))
    RXST0_out := io.GSSL_RXST0(0)
    RXD_out := io.GSSL_RXD

    val gsslrxreceiver = new GSSL_RX_Receiver
    gsslrxreceiver.GSSL_RXCLK := io.GSSL_RXCLK
    gsslrxreceiver.rst_in := io.rst_in
    //gsslrxreceiver.decode_k := io.GSSL_RXST0(0)
    //gsslrxreceiver.decode_data := io.GSSL_RXD
    gsslrxreceiver.decode_k := RXST0_out
    gsslrxreceiver.decode_data := RXD_out
    gsslrxreceiver.CHS_CTRL := False
    io.rx_frame_done := gsslrxreceiver.rx_frame_done
    io.rx_ttc_trigger := gsslrxreceiver.rx_ttc_trigger
    io.writes.addr := gsslrxreceiver.rx_dpram_waddress.resize(addressWidth).asUInt
    io.writes.dataIn := gsslrxreceiver.rx_dpram_data
    io.writes.en := True
    io.writes.we := gsslrxreceiver.rx_dpram_wr
    io.rx_error := gsslrxreceiver.rx_frame_chs_err||gsslrxreceiver.rx_frame_len_err||gsslrxreceiver.rx_frame_scd_err
    io.rx_frame_head_data := gsslrxreceiver.rx_frame_head_data

    val gssl_rx_led = new GSSL_RX_LED(62500)  //500us
    gssl_rx_led.io.trig := gsslrxreceiver.rx_frame_done
    io.rx_led := gssl_rx_led.io.rx_led
  }
}

/*
case class GSSL_TX_TEST(timer_cnt : Int, addressWidth : Int) extends Component{
  val io = new Bundle{
    val GSSL_REFCLK = in Bool()
    val rst_in = in Bool()
    val GSSL_TXCT0 = out Bits(3 bits)
    val GSSL_TXD = out Bits(8 bits)
    val writes = master(XILINX_BRAM_PORT(16, addressWidth, WRITE))
    val rx_led = out Bool()
  }
  noIoPrefix()
  val gssl_txdomain = ClockDomain(io.GSSL_REFCLK,io.rst_in)
  val gssl_area = new ClockingArea(gssl_txdomain){
    val meminitvalue = for(i <- 0 until 256)yield{
      val initdata = i + 10
      BigInt(initdata)
    }
    val rams = Mem(Bits(16 bits), BigInt(1) << 8) initBigInt(meminitvalue)

    val gssl_tx_module = new GSSL_TX_MOUDLE(timer_cnt,addressWidth)
    gssl_tx_module.io.GSSL_REFCLK := io.GSSL_REFCLK
    gssl_tx_module.io.rst_in := io.rst_in
    io.GSSL_TXCT0 := gssl_tx_module.io.GSSL_TXCT0
    io.GSSL_TXD := gssl_tx_module.io.GSSL_TXD
    gssl_tx_module.io.reads.dataOut := rams.readSync(gssl_tx_module.io.reads.addr.resized,gssl_tx_module.io.reads.en)
    gssl_tx_module.io.tx_frame_head_data := B"x0020"
    gssl_tx_module.io.timer_tick := True

    val gssl_rx_module = new GSSL_RX_MOUDLE(addressWidth)
    gssl_rx_module.io.GSSL_RXCLK := io.GSSL_REFCLK
    gssl_rx_module.io.rst_in := io.rst_in
    gssl_rx_module.io.GSSL_RXD := io.GSSL_TXD
    gssl_rx_module.io.GSSL_RXST0 := io.GSSL_TXCT0
    gssl_rx_module.io.writes <> io.writes
    io.rx_led := gssl_rx_module.io.rx_led
  }
}

object GSSL_TX_TEST{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new GSSL_TX_TEST(1000,8)) { dut =>
      dut.gssl_area.clockDomain.forkStimulus(8)
      dut.gssl_area.clockDomain.waitSampling(10)
      dut.gssl_area.clockDomain.waitSampling(5000)
    }
  }
}*/