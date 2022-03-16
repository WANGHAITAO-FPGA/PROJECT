// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : GSSL_MODULE

`timescale 1ns/1ps 

module GSSL_MODULE (
  input               clk,
  input               reset,
  input               cyp1401_GSSL_A_LOS,
  input               cyp1401_GSSL_B_LOS,
  input               cyp1401_GSSL_C_LOS,
  input               cyp1401_GSSL_A_TXFAULT,
  input               cyp1401_GSSL_B_TXFAULT,
  input               cyp1401_GSSL_C_TXFAULT,
  output              cyp1401_GSSL_REFCLK_ABCD,
  output              cyp1401_GSSL_INSEL_A,
  output              cyp1401_GSSL_INSEL_B,
  output              cyp1401_GSSL_INSEL_C,
  output              cyp1401_GSSL_TXOPA,
  output              cyp1401_GSSL_TXOPB,
  output              cyp1401_GSSL_TXOPC,
  output              cyp1401_GSSL_SPDSEL_ABCD,
  output              cyp1401_GSSL_LPEN_ABCD,
  output              cyp1401_GSSL_TRSTZ_N_ABCD,
  output     [2:0]    cyp1401_GSSL_MODE_A,
  output     [2:0]    cyp1401_GSSL_MODE_B,
  output     [2:0]    cyp1401_GSSL_MODE_C,
  input               cyp1401_GSSL_RXCLK_A,
  input      [2:0]    cyp1401_GSSL_RXST0_A,
  input      [7:0]    cyp1401_GSSL_RXD_A,
  output     [2:0]    cyp1401_GSSL_TXCT0_A,
  output     [7:0]    cyp1401_GSSL_TXD_A,
  input               cyp1401_GSSL_RXCLK_B,
  input      [2:0]    cyp1401_GSSL_RXST0_B,
  input      [7:0]    cyp1401_GSSL_RXD_B,
  output     [2:0]    cyp1401_GSSL_TXCT0_B,
  output     [7:0]    cyp1401_GSSL_TXD_B,
  input               cyp1401_GSSL_RXCLK_C,
  input      [2:0]    cyp1401_GSSL_RXST0_C,
  input      [7:0]    cyp1401_GSSL_RXD_C,
  output     [2:0]    cyp1401_GSSL_TXCT0_C,
  output     [7:0]    cyp1401_GSSL_TXD_C,
  input      [31:0]   vme_data_0,
  input      [31:0]   vme_data_1,
  input      [31:0]   vme_data_2,
  input      [31:0]   vme_data_3,
  input      [31:0]   vme_data_4,
  input      [31:0]   vme_data_5,
  output     [31:0]   sensor_data_0,
  output     [31:0]   sensor_data_1,
  output     [31:0]   sensor_data_2,
  output     [31:0]   sensor_data_3,
  output     [31:0]   sensor_data_4,
  output     [31:0]   sensor_data_5,
  output     [31:0]   sensor_data_6,
  output     [31:0]   sensor_data_7,
  output     [31:0]   sensor_data_8,
  output     [31:0]   sensor_data_9,
  output     [31:0]   sensor_data_10,
  output     [31:0]   sensor_data_11,
  output              rx_led
);

  wire                gssl_txarea_timer_A_io_tick;
  reg                 gssl_txarea_timer_A_io_clear;
  wire                gssl_txarea_timer_B_io_tick;
  reg                 gssl_txarea_timer_B_io_clear;
  wire       [31:0]   gssl_txarea_gssl_tx_c_reads_dataOut;
  reg        [31:0]   _zz_gssl_txarea_roms_port0;
  wire                gssl_txarea_cyp1401_init_GSSL_INSEL_A;
  wire                gssl_txarea_cyp1401_init_GSSL_INSEL_B;
  wire                gssl_txarea_cyp1401_init_GSSL_INSEL_C;
  wire                gssl_txarea_cyp1401_init_GSSL_TXOPA;
  wire                gssl_txarea_cyp1401_init_GSSL_TXOPB;
  wire                gssl_txarea_cyp1401_init_GSSL_TXOPC;
  wire                gssl_txarea_cyp1401_init_GSSL_SPDSEL_ABCD;
  wire                gssl_txarea_cyp1401_init_GSSL_LPEN_ABCD;
  wire                gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD;
  wire       [2:0]    gssl_txarea_cyp1401_init_GSSL_MODE_A;
  wire       [2:0]    gssl_txarea_cyp1401_init_GSSL_MODE_B;
  wire       [2:0]    gssl_txarea_cyp1401_init_GSSL_MODE_C;
  wire                gssl_txarea_timer_A_io_full;
  wire       [31:0]   gssl_txarea_timer_A_io_value;
  wire       [2:0]    gssl_txarea_gssl_tx_a_GSSL_TXCT0;
  wire       [7:0]    gssl_txarea_gssl_tx_a_GSSL_TXD;
  wire       [7:0]    gssl_txarea_gssl_tx_a_reads_addr;
  wire                gssl_txarea_gssl_tx_a_reads_en;
  wire                gssl_txarea_timer_B_io_full;
  wire       [31:0]   gssl_txarea_timer_B_io_value;
  wire       [2:0]    gssl_txarea_gssl_tx_b_GSSL_TXCT0;
  wire       [7:0]    gssl_txarea_gssl_tx_b_GSSL_TXD;
  wire       [7:0]    gssl_txarea_gssl_tx_b_reads_addr;
  wire                gssl_txarea_gssl_tx_b_reads_en;
  wire       [2:0]    gssl_txarea_gssl_tx_c_GSSL_TXCT0;
  wire       [7:0]    gssl_txarea_gssl_tx_c_GSSL_TXD;
  wire       [7:0]    gssl_txarea_gssl_tx_c_reads_addr;
  wire                gssl_txarea_gssl_tx_c_reads_en;
  wire       [5:0]    gssl_rxarea_b_rx_module_b_writes_addr;
  wire                gssl_rxarea_b_rx_module_b_writes_en;
  wire       [31:0]   gssl_rxarea_b_rx_module_b_writes_dataIn;
  wire                gssl_rxarea_b_rx_module_b_writes_we;
  wire                gssl_rxarea_b_rx_module_b_rx_frame_done;
  wire                gssl_rxarea_b_rx_module_b_rx_ttc_trigger;
  wire                gssl_rxarea_b_rx_module_b_rx_error;
  wire       [31:0]   gssl_rxarea_b_rx_module_b_rx_frame_head_data;
  wire                gssl_rxarea_b_rx_module_b_rx_led;
  wire       [5:0]    gssl_rxarea_c_rx_module_C_writes_addr;
  wire                gssl_rxarea_c_rx_module_C_writes_en;
  wire       [31:0]   gssl_rxarea_c_rx_module_C_writes_dataIn;
  wire                gssl_rxarea_c_rx_module_C_writes_we;
  wire                gssl_rxarea_c_rx_module_C_rx_frame_done;
  wire                gssl_rxarea_c_rx_module_C_rx_ttc_trigger;
  wire                gssl_rxarea_c_rx_module_C_rx_error;
  wire       [31:0]   gssl_rxarea_c_rx_module_C_rx_frame_head_data;
  wire                gssl_rxarea_c_rx_module_C_rx_led;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_0;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_1;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_2;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_3;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_4;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_5;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_6;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_7;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_8;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_9;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_10;
  (* async_reg = "true" *) reg        [31:0]   gssl_txarea_gssl_sensor_regs_11;
  wire                when_GSSL_MODULE_l42;
  reg        [31:0]   gssl_txarea_tx_temp;
  wire                when_GSSL_MODULE_l60;
  wire                when_GSSL_MODULE_l62;
  wire                when_GSSL_MODULE_l64;
  wire                when_GSSL_MODULE_l66;
  wire                when_GSSL_MODULE_l68;
  wire                when_GSSL_MODULE_l70;
  wire                when_GSSL_MODULE_l72;
  wire                when_GSSL_MODULE_l74;
  wire                when_GSSL_MODULE_l76;
  wire                when_GSSL_MODULE_l78;
  wire                when_GSSL_MODULE_l80;
  wire                when_GSSL_MODULE_l82;
  wire                when_GSSL_MODULE_l84;
  wire                when_GSSL_MODULE_l86;
  wire                when_GSSL_MODULE_l88;
  wire                when_GSSL_MODULE_l90;
  wire                when_GSSL_MODULE_l92;
  wire                when_GSSL_MODULE_l94;
  (* async_reg = "true" *) reg                 gssl_txarea_rx_done_b;
  wire                when_GSSL_MODULE_l104;
  (* async_reg = "true" *) reg                 gssl_txarea_rx_b_ttctriger;
  wire       [7:0]    _zz_reads_dataOut;
  wire                when_GSSL_MODULE_l157;
  wire                when_GSSL_MODULE_l160;
  wire                when_GSSL_MODULE_l163;
  wire                when_GSSL_MODULE_l166;
  wire                when_GSSL_MODULE_l169;
  wire                when_GSSL_MODULE_l172;
  wire                when_GSSL_MODULE_l175;
  wire                when_GSSL_MODULE_l178;
  wire                when_GSSL_MODULE_l181;
  wire                when_GSSL_MODULE_l184;
  wire                when_GSSL_MODULE_l187;
  wire                when_GSSL_MODULE_l190;
  reg                 gssl_rxarea_b_rx_done_b_delay1;
  reg                 gssl_rxarea_b_rx_done_b_delay2;
  reg                 gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1;
  reg                 gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1_1;
  reg                 gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2;
  reg                 gssl_rxarea_c_rx_b_ttctriger_delay1;
  reg                 gssl_rxarea_c_rx_b_ttctriger_delay2;
  reg                 gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1;
  reg                 gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1_1;
  reg                 gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2;
  reg [31:0] gssl_txarea_roms [0:255];

  initial begin
    $readmemb("GSSL_MODULE.v_toplevel_gssl_txarea_roms.bin",gssl_txarea_roms);
  end
  always @(posedge clk) begin
    if(gssl_txarea_gssl_tx_c_reads_en) begin
      _zz_gssl_txarea_roms_port0 <= gssl_txarea_roms[_zz_reads_dataOut];
    end
  end

  CYP1401_Init gssl_txarea_cyp1401_init (
    .GSSL_INSEL_A         (gssl_txarea_cyp1401_init_GSSL_INSEL_A       ), //o
    .GSSL_INSEL_B         (gssl_txarea_cyp1401_init_GSSL_INSEL_B       ), //o
    .GSSL_INSEL_C         (gssl_txarea_cyp1401_init_GSSL_INSEL_C       ), //o
    .GSSL_TXOPA           (gssl_txarea_cyp1401_init_GSSL_TXOPA         ), //o
    .GSSL_TXOPB           (gssl_txarea_cyp1401_init_GSSL_TXOPB         ), //o
    .GSSL_TXOPC           (gssl_txarea_cyp1401_init_GSSL_TXOPC         ), //o
    .GSSL_SPDSEL_ABCD     (gssl_txarea_cyp1401_init_GSSL_SPDSEL_ABCD   ), //o
    .GSSL_LPEN_ABCD       (gssl_txarea_cyp1401_init_GSSL_LPEN_ABCD     ), //o
    .GSSL_TRSTZ_N_ABCD    (gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD  ), //o
    .GSSL_MODE_A          (gssl_txarea_cyp1401_init_GSSL_MODE_A[2:0]   ), //o
    .GSSL_MODE_B          (gssl_txarea_cyp1401_init_GSSL_MODE_B[2:0]   ), //o
    .GSSL_MODE_C          (gssl_txarea_cyp1401_init_GSSL_MODE_C[2:0]   ), //o
    .clk                  (clk                                         ), //i
    .reset                (reset                                       )  //i
  );
  Timer gssl_txarea_timer_A (
    .io_tick     (gssl_txarea_timer_A_io_tick         ), //i
    .io_clear    (gssl_txarea_timer_A_io_clear        ), //i
    .io_limit    (32'h000001f4                        ), //i
    .io_full     (gssl_txarea_timer_A_io_full         ), //o
    .io_value    (gssl_txarea_timer_A_io_value[31:0]  ), //o
    .clk         (clk                                 ), //i
    .reset       (reset                               )  //i
  );
  GSSL_TX_MOUDLE gssl_txarea_gssl_tx_a (
    .GSSL_REFCLK           (clk                                    ), //i
    .rst_in                (reset                                  ), //i
    .tx_ttc_trigger        (1'b0                                   ), //i
    .tx_atc_trigger        (1'b0                                   ), //i
    .tx_data_trigger       (gssl_txarea_timer_A_io_full            ), //i
    .GSSL_TXCT0            (gssl_txarea_gssl_tx_a_GSSL_TXCT0[2:0]  ), //o
    .GSSL_TXD              (gssl_txarea_gssl_tx_a_GSSL_TXD[7:0]    ), //o
    .tx_frame_head_data    (32'h00004112                           ), //i
    .reads_addr            (gssl_txarea_gssl_tx_a_reads_addr[7:0]  ), //o
    .reads_dataOut         (gssl_txarea_tx_temp[31:0]              ), //i
    .reads_en              (gssl_txarea_gssl_tx_a_reads_en         )  //o
  );
  Timer gssl_txarea_timer_B (
    .io_tick     (gssl_txarea_timer_B_io_tick         ), //i
    .io_clear    (gssl_txarea_timer_B_io_clear        ), //i
    .io_limit    (32'h000000fa                        ), //i
    .io_full     (gssl_txarea_timer_B_io_full         ), //o
    .io_value    (gssl_txarea_timer_B_io_value[31:0]  ), //o
    .clk         (clk                                 ), //i
    .reset       (reset                               )  //i
  );
  GSSL_TX_MOUDLE gssl_txarea_gssl_tx_b (
    .GSSL_REFCLK           (clk                                    ), //i
    .rst_in                (reset                                  ), //i
    .tx_ttc_trigger        (gssl_txarea_timer_B_io_full            ), //i
    .tx_atc_trigger        (gssl_txarea_rx_done_b                  ), //i
    .tx_data_trigger       (1'b0                                   ), //i
    .GSSL_TXCT0            (gssl_txarea_gssl_tx_b_GSSL_TXCT0[2:0]  ), //o
    .GSSL_TXD              (gssl_txarea_gssl_tx_b_GSSL_TXD[7:0]    ), //o
    .tx_frame_head_data    (32'h0                                  ), //i
    .reads_addr            (gssl_txarea_gssl_tx_b_reads_addr[7:0]  ), //o
    .reads_dataOut         (32'h0                                  ), //i
    .reads_en              (gssl_txarea_gssl_tx_b_reads_en         )  //o
  );
  GSSL_TX_MOUDLE gssl_txarea_gssl_tx_c (
    .GSSL_REFCLK           (clk                                        ), //i
    .rst_in                (reset                                      ), //i
    .tx_ttc_trigger        (1'b0                                       ), //i
    .tx_atc_trigger        (1'b0                                       ), //i
    .tx_data_trigger       (gssl_txarea_rx_b_ttctriger                 ), //i
    .GSSL_TXCT0            (gssl_txarea_gssl_tx_c_GSSL_TXCT0[2:0]      ), //o
    .GSSL_TXD              (gssl_txarea_gssl_tx_c_GSSL_TXD[7:0]        ), //o
    .tx_frame_head_data    (32'h0000210c                               ), //i
    .reads_addr            (gssl_txarea_gssl_tx_c_reads_addr[7:0]      ), //o
    .reads_dataOut         (gssl_txarea_gssl_tx_c_reads_dataOut[31:0]  ), //i
    .reads_en              (gssl_txarea_gssl_tx_c_reads_en             )  //o
  );
  GSSL_RX_MOUDLE gssl_rxarea_b_rx_module_b (
    .GSSL_RXCLK            (clk                                                 ), //i
    .rst_in                (reset                                               ), //i
    .GSSL_RXST0            (gssl_txarea_gssl_tx_c_GSSL_TXCT0[2:0]               ), //i
    .GSSL_RXD              (gssl_txarea_gssl_tx_c_GSSL_TXD[7:0]                 ), //i
    .writes_addr           (gssl_rxarea_b_rx_module_b_writes_addr[5:0]          ), //o
    .writes_dataIn         (gssl_rxarea_b_rx_module_b_writes_dataIn[31:0]       ), //o
    .writes_en             (gssl_rxarea_b_rx_module_b_writes_en                 ), //o
    .writes_we             (gssl_rxarea_b_rx_module_b_writes_we                 ), //o
    .rx_frame_done         (gssl_rxarea_b_rx_module_b_rx_frame_done             ), //o
    .rx_ttc_trigger        (gssl_rxarea_b_rx_module_b_rx_ttc_trigger            ), //o
    .rx_error              (gssl_rxarea_b_rx_module_b_rx_error                  ), //o
    .rx_frame_head_data    (gssl_rxarea_b_rx_module_b_rx_frame_head_data[31:0]  ), //o
    .rx_led                (gssl_rxarea_b_rx_module_b_rx_led                    )  //o
  );
  GSSL_RX_MOUDLE gssl_rxarea_c_rx_module_C (
    .GSSL_RXCLK            (clk                                                 ), //i
    .rst_in                (reset                                               ), //i
    .GSSL_RXST0            (gssl_txarea_gssl_tx_b_GSSL_TXCT0[2:0]               ), //i
    .GSSL_RXD              (gssl_txarea_gssl_tx_b_GSSL_TXD[7:0]                 ), //i
    .writes_addr           (gssl_rxarea_c_rx_module_C_writes_addr[5:0]          ), //o
    .writes_dataIn         (gssl_rxarea_c_rx_module_C_writes_dataIn[31:0]       ), //o
    .writes_en             (gssl_rxarea_c_rx_module_C_writes_en                 ), //o
    .writes_we             (gssl_rxarea_c_rx_module_C_writes_we                 ), //o
    .rx_frame_done         (gssl_rxarea_c_rx_module_C_rx_frame_done             ), //o
    .rx_ttc_trigger        (gssl_rxarea_c_rx_module_C_rx_ttc_trigger            ), //o
    .rx_error              (gssl_rxarea_c_rx_module_C_rx_error                  ), //o
    .rx_frame_head_data    (gssl_rxarea_c_rx_module_C_rx_frame_head_data[31:0]  ), //o
    .rx_led                (gssl_rxarea_c_rx_module_C_rx_led                    )  //o
  );
  assign cyp1401_GSSL_INSEL_A = gssl_txarea_cyp1401_init_GSSL_INSEL_A;
  assign cyp1401_GSSL_INSEL_B = gssl_txarea_cyp1401_init_GSSL_INSEL_B;
  assign cyp1401_GSSL_INSEL_C = gssl_txarea_cyp1401_init_GSSL_INSEL_C;
  assign cyp1401_GSSL_TXOPA = gssl_txarea_cyp1401_init_GSSL_TXOPA;
  assign cyp1401_GSSL_TXOPB = gssl_txarea_cyp1401_init_GSSL_TXOPB;
  assign cyp1401_GSSL_TXOPC = gssl_txarea_cyp1401_init_GSSL_TXOPC;
  assign cyp1401_GSSL_LPEN_ABCD = gssl_txarea_cyp1401_init_GSSL_LPEN_ABCD;
  assign cyp1401_GSSL_SPDSEL_ABCD = gssl_txarea_cyp1401_init_GSSL_SPDSEL_ABCD;
  assign cyp1401_GSSL_TRSTZ_N_ABCD = gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD;
  assign cyp1401_GSSL_MODE_A = gssl_txarea_cyp1401_init_GSSL_MODE_A;
  assign cyp1401_GSSL_MODE_B = gssl_txarea_cyp1401_init_GSSL_MODE_B;
  assign cyp1401_GSSL_MODE_C = gssl_txarea_cyp1401_init_GSSL_MODE_C;
  assign cyp1401_GSSL_REFCLK_ABCD = (! clk);
  assign gssl_txarea_timer_A_io_tick = (! gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD);
  assign when_GSSL_MODULE_l42 = (32'h000001f4 <= gssl_txarea_timer_A_io_value);
  always @(*) begin
    if(when_GSSL_MODULE_l42) begin
      gssl_txarea_timer_A_io_clear = 1'b1;
    end else begin
      gssl_txarea_timer_A_io_clear = 1'b0;
    end
  end

  assign cyp1401_GSSL_TXCT0_A = gssl_txarea_gssl_tx_a_GSSL_TXCT0;
  assign cyp1401_GSSL_TXD_A = gssl_txarea_gssl_tx_a_GSSL_TXD;
  assign when_GSSL_MODULE_l60 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h41) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l62 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h42) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l64 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h43) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l66 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h44) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l68 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h45) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l70 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h46) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l72 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h47) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l74 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h48) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l76 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h49) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l78 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h4a) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l80 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h4b) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l82 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h4c) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l84 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h4d) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l86 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h4e) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l88 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h4f) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l90 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h50) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l92 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h51) && gssl_txarea_gssl_tx_a_reads_en);
  assign when_GSSL_MODULE_l94 = ((gssl_txarea_gssl_tx_a_reads_addr == 8'h52) && gssl_txarea_gssl_tx_a_reads_en);
  assign gssl_txarea_timer_B_io_tick = (! gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD);
  assign when_GSSL_MODULE_l104 = (32'h000000fa <= gssl_txarea_timer_B_io_value);
  always @(*) begin
    if(when_GSSL_MODULE_l104) begin
      gssl_txarea_timer_B_io_clear = 1'b1;
    end else begin
      gssl_txarea_timer_B_io_clear = 1'b0;
    end
  end

  assign cyp1401_GSSL_TXCT0_B = gssl_txarea_gssl_tx_b_GSSL_TXCT0;
  assign cyp1401_GSSL_TXD_B = gssl_txarea_gssl_tx_b_GSSL_TXD;
  assign cyp1401_GSSL_TXCT0_C = gssl_txarea_gssl_tx_c_GSSL_TXCT0;
  assign cyp1401_GSSL_TXD_C = gssl_txarea_gssl_tx_c_GSSL_TXD;
  assign _zz_reads_dataOut = gssl_txarea_gssl_tx_c_reads_addr;
  assign gssl_txarea_gssl_tx_c_reads_dataOut = _zz_gssl_txarea_roms_port0;
  assign sensor_data_0 = gssl_txarea_gssl_sensor_regs_0;
  assign sensor_data_1 = gssl_txarea_gssl_sensor_regs_1;
  assign sensor_data_2 = gssl_txarea_gssl_sensor_regs_2;
  assign sensor_data_3 = gssl_txarea_gssl_sensor_regs_3;
  assign sensor_data_4 = gssl_txarea_gssl_sensor_regs_4;
  assign sensor_data_5 = gssl_txarea_gssl_sensor_regs_5;
  assign sensor_data_6 = gssl_txarea_gssl_sensor_regs_6;
  assign sensor_data_7 = gssl_txarea_gssl_sensor_regs_7;
  assign sensor_data_8 = gssl_txarea_gssl_sensor_regs_8;
  assign sensor_data_9 = gssl_txarea_gssl_sensor_regs_9;
  assign sensor_data_10 = gssl_txarea_gssl_sensor_regs_10;
  assign sensor_data_11 = gssl_txarea_gssl_sensor_regs_11;
  assign when_GSSL_MODULE_l157 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h21));
  assign when_GSSL_MODULE_l160 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h22));
  assign when_GSSL_MODULE_l163 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h23));
  assign when_GSSL_MODULE_l166 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h24));
  assign when_GSSL_MODULE_l169 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h25));
  assign when_GSSL_MODULE_l172 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h26));
  assign when_GSSL_MODULE_l175 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h27));
  assign when_GSSL_MODULE_l178 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h28));
  assign when_GSSL_MODULE_l181 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h29));
  assign when_GSSL_MODULE_l184 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h2a));
  assign when_GSSL_MODULE_l187 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h2b));
  assign when_GSSL_MODULE_l190 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 6'h2c));
  assign rx_led = gssl_rxarea_b_rx_module_b_rx_led;
  always @(posedge clk) begin
    if(when_GSSL_MODULE_l60) begin
      gssl_txarea_tx_temp <= vme_data_0;
    end else begin
      if(when_GSSL_MODULE_l62) begin
        gssl_txarea_tx_temp <= vme_data_1;
      end else begin
        if(when_GSSL_MODULE_l64) begin
          gssl_txarea_tx_temp <= vme_data_2;
        end else begin
          if(when_GSSL_MODULE_l66) begin
            gssl_txarea_tx_temp <= vme_data_3;
          end else begin
            if(when_GSSL_MODULE_l68) begin
              gssl_txarea_tx_temp <= vme_data_4;
            end else begin
              if(when_GSSL_MODULE_l70) begin
                gssl_txarea_tx_temp <= vme_data_5;
              end else begin
                if(when_GSSL_MODULE_l72) begin
                  gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_0;
                end else begin
                  if(when_GSSL_MODULE_l74) begin
                    gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_1;
                  end else begin
                    if(when_GSSL_MODULE_l76) begin
                      gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_2;
                    end else begin
                      if(when_GSSL_MODULE_l78) begin
                        gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_3;
                      end else begin
                        if(when_GSSL_MODULE_l80) begin
                          gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_4;
                        end else begin
                          if(when_GSSL_MODULE_l82) begin
                            gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_5;
                          end else begin
                            if(when_GSSL_MODULE_l84) begin
                              gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_6;
                            end else begin
                              if(when_GSSL_MODULE_l86) begin
                                gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_7;
                              end else begin
                                if(when_GSSL_MODULE_l88) begin
                                  gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_8;
                                end else begin
                                  if(when_GSSL_MODULE_l90) begin
                                    gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_9;
                                  end else begin
                                    if(when_GSSL_MODULE_l92) begin
                                      gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_10;
                                    end else begin
                                      if(when_GSSL_MODULE_l94) begin
                                        gssl_txarea_tx_temp <= gssl_txarea_gssl_sensor_regs_11;
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if(when_GSSL_MODULE_l157) begin
      gssl_txarea_gssl_sensor_regs_0 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l160) begin
      gssl_txarea_gssl_sensor_regs_1 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l163) begin
      gssl_txarea_gssl_sensor_regs_2 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l166) begin
      gssl_txarea_gssl_sensor_regs_3 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l169) begin
      gssl_txarea_gssl_sensor_regs_4 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l172) begin
      gssl_txarea_gssl_sensor_regs_5 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l175) begin
      gssl_txarea_gssl_sensor_regs_6 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l178) begin
      gssl_txarea_gssl_sensor_regs_7 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l181) begin
      gssl_txarea_gssl_sensor_regs_8 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l184) begin
      gssl_txarea_gssl_sensor_regs_9 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l187) begin
      gssl_txarea_gssl_sensor_regs_10 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    if(when_GSSL_MODULE_l190) begin
      gssl_txarea_gssl_sensor_regs_11 <= gssl_rxarea_b_rx_module_b_writes_dataIn;
    end
    gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1 <= gssl_rxarea_b_rx_module_b_rx_frame_done;
    gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1_1 <= gssl_rxarea_b_rx_module_b_rx_frame_done;
    gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2 <= gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1_1;
    gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger;
    gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1_1 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger;
    gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1_1;
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      gssl_txarea_rx_done_b <= 1'b0;
      gssl_txarea_rx_b_ttctriger <= 1'b0;
      gssl_rxarea_b_rx_done_b_delay1 <= 1'b0;
      gssl_rxarea_b_rx_done_b_delay2 <= 1'b0;
      gssl_rxarea_c_rx_b_ttctriger_delay1 <= 1'b0;
      gssl_rxarea_c_rx_b_ttctriger_delay2 <= 1'b0;
    end else begin
      gssl_rxarea_b_rx_done_b_delay1 <= gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1;
      gssl_rxarea_b_rx_done_b_delay2 <= gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2;
      gssl_txarea_rx_done_b <= ((gssl_rxarea_b_rx_module_b_rx_frame_done || gssl_rxarea_b_rx_done_b_delay1) || gssl_rxarea_b_rx_done_b_delay2);
      gssl_rxarea_c_rx_b_ttctriger_delay1 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1;
      gssl_rxarea_c_rx_b_ttctriger_delay2 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2;
      gssl_txarea_rx_b_ttctriger <= ((gssl_rxarea_c_rx_module_C_rx_ttc_trigger || gssl_rxarea_c_rx_b_ttctriger_delay1) || gssl_rxarea_c_rx_b_ttctriger_delay2);
    end
  end


endmodule

//GSSL_RX_MOUDLE replaced by GSSL_RX_MOUDLE

module GSSL_RX_MOUDLE (
  input               GSSL_RXCLK,
  input               rst_in,
  input      [2:0]    GSSL_RXST0,
  input      [7:0]    GSSL_RXD,
  output     [5:0]    writes_addr,
  output     [31:0]   writes_dataIn,
  output              writes_en,
  output              writes_we,
  output              rx_frame_done,
  output              rx_ttc_trigger,
  output              rx_error,
  output     [31:0]   rx_frame_head_data,
  output              rx_led
);

  wire       [31:0]   gssl_area_gsslrxreceiver_rx_dpram_data;
  wire       [7:0]    gssl_area_gsslrxreceiver_rx_dpram_waddress;
  wire                gssl_area_gsslrxreceiver_rx_dpram_wr;
  wire       [31:0]   gssl_area_gsslrxreceiver_rx_frame_head_data;
  wire       [7:0]    gssl_area_gsslrxreceiver_rx_atc_status_data;
  wire                gssl_area_gsslrxreceiver_rx_ttc_trigger;
  wire                gssl_area_gsslrxreceiver_rx_atc_trigger;
  wire                gssl_area_gsslrxreceiver_rx_frame_busy;
  wire                gssl_area_gsslrxreceiver_rx_frame_done;
  wire                gssl_area_gsslrxreceiver_rx_frame_len_err;
  wire                gssl_area_gsslrxreceiver_rx_frame_chs_err;
  wire                gssl_area_gsslrxreceiver_rx_frame_scd_err;
  wire       [3:0]    gssl_area_gsslrxreceiver_rx_state_debug;
  wire                gssl_area_gssl_rx_led_rx_led;
  wire       [5:0]    _zz_writes_addr;
  reg                 gssl_area_RXST0_out;
  reg        [7:0]    gssl_area_RXD_out;

  assign _zz_writes_addr = gssl_area_gsslrxreceiver_rx_dpram_waddress[5:0];
  GSSL_RX_Receiver gssl_area_gsslrxreceiver (
    .GSSL_RXCLK            (GSSL_RXCLK                                         ), //i
    .rst_in                (rst_in                                             ), //i
    .CHS_CTRL              (1'b0                                               ), //i
    .decode_k              (gssl_area_RXST0_out                                ), //i
    .decode_data           (gssl_area_RXD_out[7:0]                             ), //i
    .rx_dpram_data         (gssl_area_gsslrxreceiver_rx_dpram_data[31:0]       ), //o
    .rx_dpram_waddress     (gssl_area_gsslrxreceiver_rx_dpram_waddress[7:0]    ), //o
    .rx_dpram_wr           (gssl_area_gsslrxreceiver_rx_dpram_wr               ), //o
    .rx_frame_head_data    (gssl_area_gsslrxreceiver_rx_frame_head_data[31:0]  ), //o
    .rx_atc_status_data    (gssl_area_gsslrxreceiver_rx_atc_status_data[7:0]   ), //o
    .rx_ttc_trigger        (gssl_area_gsslrxreceiver_rx_ttc_trigger            ), //o
    .rx_atc_trigger        (gssl_area_gsslrxreceiver_rx_atc_trigger            ), //o
    .rx_frame_busy         (gssl_area_gsslrxreceiver_rx_frame_busy             ), //o
    .rx_frame_done         (gssl_area_gsslrxreceiver_rx_frame_done             ), //o
    .rx_frame_len_err      (gssl_area_gsslrxreceiver_rx_frame_len_err          ), //o
    .rx_frame_chs_err      (gssl_area_gsslrxreceiver_rx_frame_chs_err          ), //o
    .rx_frame_scd_err      (gssl_area_gsslrxreceiver_rx_frame_scd_err          ), //o
    .rx_state_debug        (gssl_area_gsslrxreceiver_rx_state_debug[3:0]       )  //o
  );
  GSSL_RX_LED gssl_area_gssl_rx_led (
    .trig          (gssl_area_gsslrxreceiver_rx_frame_done  ), //i
    .rx_led        (gssl_area_gssl_rx_led_rx_led            ), //o
    .GSSL_RXCLK    (GSSL_RXCLK                              ), //i
    .rst_in        (rst_in                                  )  //i
  );
  assign rx_frame_done = gssl_area_gsslrxreceiver_rx_frame_done;
  assign rx_ttc_trigger = gssl_area_gsslrxreceiver_rx_ttc_trigger;
  assign writes_addr = _zz_writes_addr;
  assign writes_dataIn = gssl_area_gsslrxreceiver_rx_dpram_data;
  assign writes_en = 1'b1;
  assign writes_we = gssl_area_gsslrxreceiver_rx_dpram_wr;
  assign rx_error = ((gssl_area_gsslrxreceiver_rx_frame_chs_err || gssl_area_gsslrxreceiver_rx_frame_len_err) || gssl_area_gsslrxreceiver_rx_frame_scd_err);
  assign rx_frame_head_data = gssl_area_gsslrxreceiver_rx_frame_head_data;
  assign rx_led = gssl_area_gssl_rx_led_rx_led;
  always @(posedge GSSL_RXCLK) begin
    gssl_area_RXST0_out <= GSSL_RXST0[0];
    gssl_area_RXD_out <= GSSL_RXD;
  end


endmodule

//GSSL_TX_MOUDLE replaced by GSSL_TX_MOUDLE

//GSSL_TX_MOUDLE replaced by GSSL_TX_MOUDLE

//Timer replaced by Timer

module GSSL_TX_MOUDLE (
  input               GSSL_REFCLK,
  input               rst_in,
  input               tx_ttc_trigger,
  input               tx_atc_trigger,
  input               tx_data_trigger,
  output reg [2:0]    GSSL_TXCT0,
  output     [7:0]    GSSL_TXD,
  input      [31:0]   tx_frame_head_data,
  output     [7:0]    reads_addr,
  input      [31:0]   reads_dataOut,
  output              reads_en
);

  wire       [7:0]    gssl_area_gssltxtransmitter_tx_dpram_raddress;
  wire                gssl_area_gssltxtransmitter_encode_k;
  wire       [7:0]    gssl_area_gssltxtransmitter_encode_data;
  wire                gssl_area_gssltxtransmitter_tx_frame_busy;
  wire                gssl_area_gssltxtransmitter_tx_frame_done;
  wire                gssl_area_gssltxtransmitter_tx_dpram_rd;
  wire       [3:0]    gssl_area_gssltxtransmitter_tx_state_debug;
  wire       [7:0]    _zz_reads_addr;

  assign _zz_reads_addr = gssl_area_gssltxtransmitter_tx_dpram_raddress;
  GSSL_TX_Transmitter gssl_area_gssltxtransmitter (
    .GSSL_REFCLK           (GSSL_REFCLK                                         ), //i
    .rst_in                (rst_in                                              ), //i
    .CHS_CTRL              (1'b0                                                ), //i
    .tx_ttc_trigger        (tx_ttc_trigger                                      ), //i
    .tx_atc_trigger        (tx_atc_trigger                                      ), //i
    .tx_data_trigger       (tx_data_trigger                                     ), //i
    .tx_frame_head_data    (tx_frame_head_data[31:0]                            ), //i
    .tx_dpram_q            (reads_dataOut[31:0]                                 ), //i
    .tx_atc_status_data    (8'h0                                                ), //i
    .tx_dpram_raddress     (gssl_area_gssltxtransmitter_tx_dpram_raddress[7:0]  ), //o
    .encode_k              (gssl_area_gssltxtransmitter_encode_k                ), //o
    .encode_data           (gssl_area_gssltxtransmitter_encode_data[7:0]        ), //o
    .tx_frame_busy         (gssl_area_gssltxtransmitter_tx_frame_busy           ), //o
    .tx_frame_done         (gssl_area_gssltxtransmitter_tx_frame_done           ), //o
    .tx_dpram_rd           (gssl_area_gssltxtransmitter_tx_dpram_rd             ), //o
    .tx_state_debug        (gssl_area_gssltxtransmitter_tx_state_debug[3:0]     )  //o
  );
  assign reads_addr = _zz_reads_addr;
  assign reads_en = gssl_area_gssltxtransmitter_tx_dpram_rd;
  always @(*) begin
    GSSL_TXCT0[2 : 1] = 2'b00;
    GSSL_TXCT0[0] = gssl_area_gssltxtransmitter_encode_k;
  end

  assign GSSL_TXD = gssl_area_gssltxtransmitter_encode_data;

endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               clk,
  input               reset
);

  wire       [31:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [31:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {31'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
    end
  end


endmodule

module CYP1401_Init (
  output              GSSL_INSEL_A,
  output              GSSL_INSEL_B,
  output              GSSL_INSEL_C,
  output              GSSL_TXOPA,
  output              GSSL_TXOPB,
  output              GSSL_TXOPC,
  output              GSSL_SPDSEL_ABCD,
  output              GSSL_LPEN_ABCD,
  output              GSSL_TRSTZ_N_ABCD,
  output     [2:0]    GSSL_MODE_A,
  output     [2:0]    GSSL_MODE_B,
  output     [2:0]    GSSL_MODE_C,
  input               clk,
  input               reset
);

  reg                 gsslResetUnbuffered;
  reg        [21:0]   GSSL_Reset_Counter;
  wire       [21:0]   _zz_when_CYP1401_l91;
  wire                when_CYP1401_l91;
  reg                 gsslResetUnbuffered_regNext;

  assign GSSL_TXOPA = 1'b0;
  assign GSSL_TXOPB = 1'b0;
  assign GSSL_TXOPC = 1'b0;
  assign GSSL_MODE_A = 3'b000;
  assign GSSL_MODE_B = 3'b000;
  assign GSSL_MODE_C = 3'b000;
  assign GSSL_INSEL_A = 1'b1;
  assign GSSL_INSEL_B = 1'b1;
  assign GSSL_INSEL_C = 1'b1;
  assign GSSL_LPEN_ABCD = 1'b0;
  assign GSSL_SPDSEL_ABCD = 1'b1;
  always @(*) begin
    gsslResetUnbuffered = 1'b1;
    if(when_CYP1401_l91) begin
      gsslResetUnbuffered = 1'b0;
    end
  end

  assign _zz_when_CYP1401_l91[21 : 0] = 22'h3fffff;
  assign when_CYP1401_l91 = (GSSL_Reset_Counter != _zz_when_CYP1401_l91);
  assign GSSL_TRSTZ_N_ABCD = gsslResetUnbuffered_regNext;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      GSSL_Reset_Counter <= 22'h0;
    end else begin
      if(when_CYP1401_l91) begin
        GSSL_Reset_Counter <= (GSSL_Reset_Counter + 22'h000001);
      end
    end
  end

  always @(posedge clk) begin
    gsslResetUnbuffered_regNext <= gsslResetUnbuffered;
  end


endmodule

//GSSL_RX_LED replaced by GSSL_RX_LED

module GSSL_RX_LED (
  input               trig,
  output              rx_led,
  input               GSSL_RXCLK,
  input               rst_in
);

  reg        [31:0]   counter;
  wire                when_CYP1401_l208;

  assign when_CYP1401_l208 = (counter != 32'h0000f424);
  assign rx_led = (counter == 32'h0000f424);
  always @(posedge GSSL_RXCLK or posedge rst_in) begin
    if(rst_in) begin
      counter <= 32'h0;
    end else begin
      if(trig) begin
        counter <= 32'h0;
      end else begin
        if(when_CYP1401_l208) begin
          counter <= (counter + 32'h00000001);
        end
      end
    end
  end


endmodule
