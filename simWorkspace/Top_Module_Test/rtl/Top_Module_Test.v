// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Top_Module_Test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Top_Module_Test (
  input               vme_clk,
  input               gssl_clk,
  input               reset,
  input      [23:0]   vme_addr,
  input      [5:0]    vme_am,
  input               vme_as,
  input               vme_ds0,
  input               vme_ds1,
  input               vme_write,
  input               vme_lword,
  input               vme_iack,
  output              vme_dtack,
  output              vme_beer,
  output              vme_retry,
  output     [6:0]    vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [31:0]   data_read,
  output     [31:0]   data_write,
  output              data_writeEnable,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4,
  output              datadir,
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
  output              rx_led,
  output              led
);

  wire                vme_area_vme_module_vme_dtack;
  wire                vme_area_vme_module_vme_beer;
  wire                vme_area_vme_module_vme_retry;
  wire       [6:0]    vme_area_vme_module_vme_irq;
  wire                vme_area_vme_module_vme_iackout;
  wire       [31:0]   vme_area_vme_module_data_write;
  wire                vme_area_vme_module_data_writeEnable;
  wire                vme_area_vme_module_datadir;
  wire       [31:0]   vme_area_vme_module_vme_data_0;
  wire       [31:0]   vme_area_vme_module_vme_data_1;
  wire       [31:0]   vme_area_vme_module_vme_data_2;
  wire       [31:0]   vme_area_vme_module_vme_data_3;
  wire       [31:0]   vme_area_vme_module_vme_data_4;
  wire       [31:0]   vme_area_vme_module_vme_data_5;
  wire                gssl_area_gssl_module_cyp1401_GSSL_REFCLK_ABCD;
  wire                gssl_area_gssl_module_cyp1401_GSSL_INSEL_A;
  wire                gssl_area_gssl_module_cyp1401_GSSL_INSEL_B;
  wire                gssl_area_gssl_module_cyp1401_GSSL_INSEL_C;
  wire                gssl_area_gssl_module_cyp1401_GSSL_TXOPA;
  wire                gssl_area_gssl_module_cyp1401_GSSL_TXOPB;
  wire                gssl_area_gssl_module_cyp1401_GSSL_TXOPC;
  wire                gssl_area_gssl_module_cyp1401_GSSL_SPDSEL_ABCD;
  wire                gssl_area_gssl_module_cyp1401_GSSL_LPEN_ABCD;
  wire                gssl_area_gssl_module_cyp1401_GSSL_TRSTZ_N_ABCD;
  wire       [2:0]    gssl_area_gssl_module_cyp1401_GSSL_TXCT0_A;
  wire       [2:0]    gssl_area_gssl_module_cyp1401_GSSL_TXCT0_B;
  wire       [2:0]    gssl_area_gssl_module_cyp1401_GSSL_TXCT0_C;
  wire       [7:0]    gssl_area_gssl_module_cyp1401_GSSL_TXD_A;
  wire       [7:0]    gssl_area_gssl_module_cyp1401_GSSL_TXD_B;
  wire       [7:0]    gssl_area_gssl_module_cyp1401_GSSL_TXD_C;
  wire       [2:0]    gssl_area_gssl_module_cyp1401_GSSL_MODE_A;
  wire       [2:0]    gssl_area_gssl_module_cyp1401_GSSL_MODE_B;
  wire       [2:0]    gssl_area_gssl_module_cyp1401_GSSL_MODE_C;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_0;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_1;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_2;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_3;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_4;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_5;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_6;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_7;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_8;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_9;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_10;
  wire       [31:0]   gssl_area_gssl_module_sensor_data_11;
  wire                gssl_area_gssl_module_rx_led;
  wire       [25:0]   _zz_gssl_area_counter_valueNext;
  wire       [0:0]    _zz_gssl_area_counter_valueNext_1;
  (* async_reg = "true" *) reg        [31:0]   vme_area_vme_data_0;
  (* async_reg = "true" *) reg        [31:0]   vme_area_vme_data_1;
  (* async_reg = "true" *) reg        [31:0]   vme_area_vme_data_2;
  (* async_reg = "true" *) reg        [31:0]   vme_area_vme_data_3;
  (* async_reg = "true" *) reg        [31:0]   vme_area_vme_data_4;
  (* async_reg = "true" *) reg        [31:0]   vme_area_vme_data_5;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_0;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_1;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_2;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_3;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_4;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_5;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_6;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_7;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_8;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_9;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_10;
  (* async_reg = "true" *) reg        [31:0]   vme_area_sensor_data_11;
  reg                 gssl_area_ledtemp;
  wire                gssl_area_counter_willIncrement;
  reg                 gssl_area_counter_willClear;
  reg        [25:0]   gssl_area_counter_valueNext;
  reg        [25:0]   gssl_area_counter_value;
  wire                gssl_area_counter_willOverflowIfInc;
  wire                gssl_area_counter_willOverflow;

  assign _zz_gssl_area_counter_valueNext_1 = gssl_area_counter_willIncrement;
  assign _zz_gssl_area_counter_valueNext = {25'd0, _zz_gssl_area_counter_valueNext_1};
  VME_TOP vme_area_vme_module (
    .clk                 (vme_clk                               ), //i
    .reset               (reset                                 ), //i
    .vme_addr            (vme_addr[23:0]                        ), //i
    .vme_am              (vme_am[5:0]                           ), //i
    .vme_as              (vme_as                                ), //i
    .vme_ds0             (vme_ds0                               ), //i
    .vme_ds1             (vme_ds1                               ), //i
    .vme_write           (vme_write                             ), //i
    .vme_lword           (vme_lword                             ), //i
    .vme_iack            (vme_iack                              ), //i
    .vme_dtack           (vme_area_vme_module_vme_dtack         ), //o
    .vme_beer            (vme_area_vme_module_vme_beer          ), //o
    .vme_retry           (vme_area_vme_module_vme_retry         ), //o
    .vme_irq             (vme_area_vme_module_vme_irq[6:0]      ), //o
    .vme_iackin          (vme_iackin                            ), //i
    .vme_iackout         (vme_area_vme_module_vme_iackout       ), //o
    .data_read           (data_read[31:0]                       ), //i
    .data_write          (vme_area_vme_module_data_write[31:0]  ), //o
    .data_writeEnable    (vme_area_vme_module_data_writeEnable  ), //o
    .gap                 (gap[3:0]                              ), //i
    .sw                  (sw[3:0]                               ), //i
    .gap4                (gap4                                  ), //i
    .datadir             (vme_area_vme_module_datadir           ), //o
    .vme_data_0          (vme_area_vme_module_vme_data_0[31:0]  ), //o
    .vme_data_1          (vme_area_vme_module_vme_data_1[31:0]  ), //o
    .vme_data_2          (vme_area_vme_module_vme_data_2[31:0]  ), //o
    .vme_data_3          (vme_area_vme_module_vme_data_3[31:0]  ), //o
    .vme_data_4          (vme_area_vme_module_vme_data_4[31:0]  ), //o
    .vme_data_5          (vme_area_vme_module_vme_data_5[31:0]  ), //o
    .sensor_data_0       (vme_area_sensor_data_0[31:0]          ), //i
    .sensor_data_1       (vme_area_sensor_data_1[31:0]          ), //i
    .sensor_data_2       (vme_area_sensor_data_2[31:0]          ), //i
    .sensor_data_3       (vme_area_sensor_data_3[31:0]          ), //i
    .sensor_data_4       (vme_area_sensor_data_4[31:0]          ), //i
    .sensor_data_5       (vme_area_sensor_data_5[31:0]          ), //i
    .sensor_data_6       (vme_area_sensor_data_6[31:0]          ), //i
    .sensor_data_7       (vme_area_sensor_data_7[31:0]          ), //i
    .sensor_data_8       (vme_area_sensor_data_8[31:0]          ), //i
    .sensor_data_9       (vme_area_sensor_data_9[31:0]          ), //i
    .sensor_data_10      (vme_area_sensor_data_10[31:0]         ), //i
    .sensor_data_11      (vme_area_sensor_data_11[31:0]         )  //i
  );
  GSSL_MODULE gssl_area_gssl_module (
    .clk                          (gssl_clk                                         ), //i
    .reset                        (reset                                            ), //i
    .cyp1401_GSSL_A_LOS           (cyp1401_GSSL_A_LOS                               ), //i
    .cyp1401_GSSL_B_LOS           (cyp1401_GSSL_B_LOS                               ), //i
    .cyp1401_GSSL_C_LOS           (cyp1401_GSSL_C_LOS                               ), //i
    .cyp1401_GSSL_A_TXFAULT       (cyp1401_GSSL_A_TXFAULT                           ), //i
    .cyp1401_GSSL_B_TXFAULT       (cyp1401_GSSL_B_TXFAULT                           ), //i
    .cyp1401_GSSL_C_TXFAULT       (cyp1401_GSSL_C_TXFAULT                           ), //i
    .cyp1401_GSSL_REFCLK_ABCD     (gssl_area_gssl_module_cyp1401_GSSL_REFCLK_ABCD   ), //o
    .cyp1401_GSSL_INSEL_A         (gssl_area_gssl_module_cyp1401_GSSL_INSEL_A       ), //o
    .cyp1401_GSSL_INSEL_B         (gssl_area_gssl_module_cyp1401_GSSL_INSEL_B       ), //o
    .cyp1401_GSSL_INSEL_C         (gssl_area_gssl_module_cyp1401_GSSL_INSEL_C       ), //o
    .cyp1401_GSSL_TXOPA           (gssl_area_gssl_module_cyp1401_GSSL_TXOPA         ), //o
    .cyp1401_GSSL_TXOPB           (gssl_area_gssl_module_cyp1401_GSSL_TXOPB         ), //o
    .cyp1401_GSSL_TXOPC           (gssl_area_gssl_module_cyp1401_GSSL_TXOPC         ), //o
    .cyp1401_GSSL_SPDSEL_ABCD     (gssl_area_gssl_module_cyp1401_GSSL_SPDSEL_ABCD   ), //o
    .cyp1401_GSSL_LPEN_ABCD       (gssl_area_gssl_module_cyp1401_GSSL_LPEN_ABCD     ), //o
    .cyp1401_GSSL_TRSTZ_N_ABCD    (gssl_area_gssl_module_cyp1401_GSSL_TRSTZ_N_ABCD  ), //o
    .cyp1401_GSSL_MODE_A          (gssl_area_gssl_module_cyp1401_GSSL_MODE_A[2:0]   ), //o
    .cyp1401_GSSL_MODE_B          (gssl_area_gssl_module_cyp1401_GSSL_MODE_B[2:0]   ), //o
    .cyp1401_GSSL_MODE_C          (gssl_area_gssl_module_cyp1401_GSSL_MODE_C[2:0]   ), //o
    .cyp1401_GSSL_RXCLK_A         (cyp1401_GSSL_RXCLK_A                             ), //i
    .cyp1401_GSSL_RXST0_A         (cyp1401_GSSL_RXST0_A[2:0]                        ), //i
    .cyp1401_GSSL_RXD_A           (cyp1401_GSSL_RXD_A[7:0]                          ), //i
    .cyp1401_GSSL_TXCT0_A         (gssl_area_gssl_module_cyp1401_GSSL_TXCT0_A[2:0]  ), //o
    .cyp1401_GSSL_TXD_A           (gssl_area_gssl_module_cyp1401_GSSL_TXD_A[7:0]    ), //o
    .cyp1401_GSSL_RXCLK_B         (cyp1401_GSSL_RXCLK_B                             ), //i
    .cyp1401_GSSL_RXST0_B         (cyp1401_GSSL_RXST0_B[2:0]                        ), //i
    .cyp1401_GSSL_RXD_B           (cyp1401_GSSL_RXD_B[7:0]                          ), //i
    .cyp1401_GSSL_TXCT0_B         (gssl_area_gssl_module_cyp1401_GSSL_TXCT0_B[2:0]  ), //o
    .cyp1401_GSSL_TXD_B           (gssl_area_gssl_module_cyp1401_GSSL_TXD_B[7:0]    ), //o
    .cyp1401_GSSL_RXCLK_C         (cyp1401_GSSL_RXCLK_C                             ), //i
    .cyp1401_GSSL_RXST0_C         (cyp1401_GSSL_RXST0_C[2:0]                        ), //i
    .cyp1401_GSSL_RXD_C           (cyp1401_GSSL_RXD_C[7:0]                          ), //i
    .cyp1401_GSSL_TXCT0_C         (gssl_area_gssl_module_cyp1401_GSSL_TXCT0_C[2:0]  ), //o
    .cyp1401_GSSL_TXD_C           (gssl_area_gssl_module_cyp1401_GSSL_TXD_C[7:0]    ), //o
    .vme_data_0                   (vme_area_vme_data_0[31:0]                        ), //i
    .vme_data_1                   (vme_area_vme_data_1[31:0]                        ), //i
    .vme_data_2                   (vme_area_vme_data_2[31:0]                        ), //i
    .vme_data_3                   (vme_area_vme_data_3[31:0]                        ), //i
    .vme_data_4                   (vme_area_vme_data_4[31:0]                        ), //i
    .vme_data_5                   (vme_area_vme_data_5[31:0]                        ), //i
    .sensor_data_0                (gssl_area_gssl_module_sensor_data_0[31:0]        ), //o
    .sensor_data_1                (gssl_area_gssl_module_sensor_data_1[31:0]        ), //o
    .sensor_data_2                (gssl_area_gssl_module_sensor_data_2[31:0]        ), //o
    .sensor_data_3                (gssl_area_gssl_module_sensor_data_3[31:0]        ), //o
    .sensor_data_4                (gssl_area_gssl_module_sensor_data_4[31:0]        ), //o
    .sensor_data_5                (gssl_area_gssl_module_sensor_data_5[31:0]        ), //o
    .sensor_data_6                (gssl_area_gssl_module_sensor_data_6[31:0]        ), //o
    .sensor_data_7                (gssl_area_gssl_module_sensor_data_7[31:0]        ), //o
    .sensor_data_8                (gssl_area_gssl_module_sensor_data_8[31:0]        ), //o
    .sensor_data_9                (gssl_area_gssl_module_sensor_data_9[31:0]        ), //o
    .sensor_data_10               (gssl_area_gssl_module_sensor_data_10[31:0]       ), //o
    .sensor_data_11               (gssl_area_gssl_module_sensor_data_11[31:0]       ), //o
    .rx_led                       (gssl_area_gssl_module_rx_led                     )  //o
  );
  assign vme_dtack = vme_area_vme_module_vme_dtack;
  assign vme_beer = vme_area_vme_module_vme_beer;
  assign vme_retry = vme_area_vme_module_vme_retry;
  assign vme_irq = vme_area_vme_module_vme_irq;
  assign vme_iackout = vme_area_vme_module_vme_iackout;
  assign data_write = vme_area_vme_module_data_write;
  assign data_writeEnable = vme_area_vme_module_data_writeEnable;
  assign datadir = vme_area_vme_module_datadir;
  assign cyp1401_GSSL_REFCLK_ABCD = gssl_area_gssl_module_cyp1401_GSSL_REFCLK_ABCD;
  assign cyp1401_GSSL_INSEL_A = gssl_area_gssl_module_cyp1401_GSSL_INSEL_A;
  assign cyp1401_GSSL_INSEL_B = gssl_area_gssl_module_cyp1401_GSSL_INSEL_B;
  assign cyp1401_GSSL_INSEL_C = gssl_area_gssl_module_cyp1401_GSSL_INSEL_C;
  assign cyp1401_GSSL_TXOPA = gssl_area_gssl_module_cyp1401_GSSL_TXOPA;
  assign cyp1401_GSSL_TXOPB = gssl_area_gssl_module_cyp1401_GSSL_TXOPB;
  assign cyp1401_GSSL_TXOPC = gssl_area_gssl_module_cyp1401_GSSL_TXOPC;
  assign cyp1401_GSSL_SPDSEL_ABCD = gssl_area_gssl_module_cyp1401_GSSL_SPDSEL_ABCD;
  assign cyp1401_GSSL_LPEN_ABCD = gssl_area_gssl_module_cyp1401_GSSL_LPEN_ABCD;
  assign cyp1401_GSSL_TRSTZ_N_ABCD = gssl_area_gssl_module_cyp1401_GSSL_TRSTZ_N_ABCD;
  assign cyp1401_GSSL_MODE_A = gssl_area_gssl_module_cyp1401_GSSL_MODE_A;
  assign cyp1401_GSSL_MODE_B = gssl_area_gssl_module_cyp1401_GSSL_MODE_B;
  assign cyp1401_GSSL_MODE_C = gssl_area_gssl_module_cyp1401_GSSL_MODE_C;
  assign cyp1401_GSSL_TXCT0_A = gssl_area_gssl_module_cyp1401_GSSL_TXCT0_A;
  assign cyp1401_GSSL_TXD_A = gssl_area_gssl_module_cyp1401_GSSL_TXD_A;
  assign cyp1401_GSSL_TXCT0_B = gssl_area_gssl_module_cyp1401_GSSL_TXCT0_B;
  assign cyp1401_GSSL_TXD_B = gssl_area_gssl_module_cyp1401_GSSL_TXD_B;
  assign cyp1401_GSSL_TXCT0_C = gssl_area_gssl_module_cyp1401_GSSL_TXCT0_C;
  assign cyp1401_GSSL_TXD_C = gssl_area_gssl_module_cyp1401_GSSL_TXD_C;
  assign rx_led = gssl_area_gssl_module_rx_led;
  always @(*) begin
    gssl_area_counter_willClear = 1'b0;
    if(gssl_area_counter_willOverflow) begin
      gssl_area_counter_willClear = 1'b1;
    end
  end

  assign gssl_area_counter_willOverflowIfInc = (gssl_area_counter_value == 26'h3b9ac9f);
  assign gssl_area_counter_willOverflow = (gssl_area_counter_willOverflowIfInc && gssl_area_counter_willIncrement);
  always @(*) begin
    if(gssl_area_counter_willOverflow) begin
      gssl_area_counter_valueNext = 26'h0;
    end else begin
      gssl_area_counter_valueNext = (gssl_area_counter_value + _zz_gssl_area_counter_valueNext);
    end
    if(gssl_area_counter_willClear) begin
      gssl_area_counter_valueNext = 26'h0;
    end
  end

  assign gssl_area_counter_willIncrement = 1'b1;
  assign led = gssl_area_ledtemp;
  always @(posedge vme_clk) begin
    vme_area_vme_data_0 <= vme_area_vme_module_vme_data_0;
    vme_area_vme_data_1 <= vme_area_vme_module_vme_data_1;
    vme_area_vme_data_2 <= vme_area_vme_module_vme_data_2;
    vme_area_vme_data_3 <= vme_area_vme_module_vme_data_3;
    vme_area_vme_data_4 <= vme_area_vme_module_vme_data_4;
    vme_area_vme_data_5 <= vme_area_vme_module_vme_data_5;
    vme_area_sensor_data_0 <= gssl_area_gssl_module_sensor_data_0;
    vme_area_sensor_data_1 <= gssl_area_gssl_module_sensor_data_1;
    vme_area_sensor_data_2 <= gssl_area_gssl_module_sensor_data_2;
    vme_area_sensor_data_3 <= gssl_area_gssl_module_sensor_data_3;
    vme_area_sensor_data_4 <= gssl_area_gssl_module_sensor_data_4;
    vme_area_sensor_data_5 <= gssl_area_gssl_module_sensor_data_5;
    vme_area_sensor_data_6 <= gssl_area_gssl_module_sensor_data_6;
    vme_area_sensor_data_7 <= gssl_area_gssl_module_sensor_data_7;
    vme_area_sensor_data_8 <= gssl_area_gssl_module_sensor_data_8;
    vme_area_sensor_data_9 <= gssl_area_gssl_module_sensor_data_9;
    vme_area_sensor_data_10 <= gssl_area_gssl_module_sensor_data_10;
    vme_area_sensor_data_11 <= gssl_area_gssl_module_sensor_data_11;
  end

  always @(posedge gssl_clk or posedge reset) begin
    if(reset) begin
      gssl_area_ledtemp <= 1'b0;
      gssl_area_counter_value <= 26'h0;
    end else begin
      gssl_area_counter_value <= gssl_area_counter_valueNext;
      if(gssl_area_counter_willOverflow) begin
        gssl_area_ledtemp <= (! gssl_area_ledtemp);
      end
    end
  end


endmodule

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

  reg                 gssl_txarea_timer_A_io_clear;
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
  wire       [7:0]    gssl_rxarea_b_rx_module_b_writes_addr;
  wire                gssl_rxarea_b_rx_module_b_writes_en;
  wire       [31:0]   gssl_rxarea_b_rx_module_b_writes_dataIn;
  wire                gssl_rxarea_b_rx_module_b_writes_we;
  wire                gssl_rxarea_b_rx_module_b_rx_frame_done;
  wire                gssl_rxarea_b_rx_module_b_rx_ttc_trigger;
  wire                gssl_rxarea_b_rx_module_b_rx_error;
  wire       [31:0]   gssl_rxarea_b_rx_module_b_rx_frame_head_data;
  wire                gssl_rxarea_b_rx_module_b_rx_led;
  wire       [7:0]    gssl_rxarea_c_rx_module_C_writes_addr;
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
    $readmemb("Top_Module_Test.v_toplevel_gssl_area_gssl_module_gssl_txarea_roms.bin",gssl_txarea_roms);
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
    .io_tick     (gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD  ), //i
    .io_clear    (gssl_txarea_timer_A_io_clear                ), //i
    .io_limit    (32'h00001388                                ), //i
    .io_full     (gssl_txarea_timer_A_io_full                 ), //o
    .io_value    (gssl_txarea_timer_A_io_value[31:0]          ), //o
    .clk         (clk                                         ), //i
    .reset       (reset                                       )  //i
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
    .io_tick     (gssl_txarea_cyp1401_init_GSSL_TRSTZ_N_ABCD  ), //i
    .io_clear    (gssl_txarea_timer_B_io_clear                ), //i
    .io_limit    (32'h000009c4                                ), //i
    .io_full     (gssl_txarea_timer_B_io_full                 ), //o
    .io_value    (gssl_txarea_timer_B_io_value[31:0]          ), //o
    .clk         (clk                                         ), //i
    .reset       (reset                                       )  //i
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
    .GSSL_RXCLK            (cyp1401_GSSL_RXCLK_B                                ), //i
    .rst_in                (reset                                               ), //i
    .GSSL_RXST0            (cyp1401_GSSL_RXST0_B[2:0]                           ), //i
    .GSSL_RXD              (cyp1401_GSSL_RXD_B[7:0]                             ), //i
    .writes_addr           (gssl_rxarea_b_rx_module_b_writes_addr[7:0]          ), //o
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
    .GSSL_RXCLK            (cyp1401_GSSL_RXCLK_C                                ), //i
    .rst_in                (reset                                               ), //i
    .GSSL_RXST0            (cyp1401_GSSL_RXST0_C[2:0]                           ), //i
    .GSSL_RXD              (cyp1401_GSSL_RXD_C[7:0]                             ), //i
    .writes_addr           (gssl_rxarea_c_rx_module_C_writes_addr[7:0]          ), //o
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
  assign when_GSSL_MODULE_l42 = (32'h00001388 <= gssl_txarea_timer_A_io_value);
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
  assign when_GSSL_MODULE_l104 = (32'h000009c4 <= gssl_txarea_timer_B_io_value);
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
  assign when_GSSL_MODULE_l157 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h21));
  assign when_GSSL_MODULE_l160 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h22));
  assign when_GSSL_MODULE_l163 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h23));
  assign when_GSSL_MODULE_l166 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h24));
  assign when_GSSL_MODULE_l169 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h25));
  assign when_GSSL_MODULE_l172 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h26));
  assign when_GSSL_MODULE_l175 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h27));
  assign when_GSSL_MODULE_l178 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h28));
  assign when_GSSL_MODULE_l181 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h29));
  assign when_GSSL_MODULE_l184 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h2a));
  assign when_GSSL_MODULE_l187 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h2b));
  assign when_GSSL_MODULE_l190 = (gssl_rxarea_b_rx_module_b_writes_we && (gssl_rxarea_b_rx_module_b_writes_addr == 8'h2c));
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
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      gssl_txarea_rx_done_b <= 1'b0;
      gssl_txarea_rx_b_ttctriger <= 1'b0;
    end else begin
      gssl_txarea_rx_done_b <= ((gssl_rxarea_b_rx_module_b_rx_frame_done || gssl_rxarea_b_rx_done_b_delay1) || gssl_rxarea_b_rx_done_b_delay2);
      gssl_txarea_rx_b_ttctriger <= ((gssl_rxarea_c_rx_module_C_rx_ttc_trigger || gssl_rxarea_c_rx_b_ttctriger_delay1) || gssl_rxarea_c_rx_b_ttctriger_delay2);
    end
  end

  always @(posedge cyp1401_GSSL_RXCLK_B or posedge reset) begin
    if(reset) begin
      gssl_rxarea_b_rx_done_b_delay1 <= 1'b0;
      gssl_rxarea_b_rx_done_b_delay2 <= 1'b0;
    end else begin
      gssl_rxarea_b_rx_done_b_delay1 <= gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1;
      gssl_rxarea_b_rx_done_b_delay2 <= gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2;
    end
  end

  always @(posedge cyp1401_GSSL_RXCLK_B) begin
    gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1 <= gssl_rxarea_b_rx_module_b_rx_frame_done;
    gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1_1 <= gssl_rxarea_b_rx_module_b_rx_frame_done;
    gssl_rxarea_b_rx_module_b_rx_frame_done_delay_2 <= gssl_rxarea_b_rx_module_b_rx_frame_done_delay_1_1;
  end

  always @(posedge cyp1401_GSSL_RXCLK_C or posedge reset) begin
    if(reset) begin
      gssl_rxarea_c_rx_b_ttctriger_delay1 <= 1'b0;
      gssl_rxarea_c_rx_b_ttctriger_delay2 <= 1'b0;
    end else begin
      gssl_rxarea_c_rx_b_ttctriger_delay1 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1;
      gssl_rxarea_c_rx_b_ttctriger_delay2 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2;
    end
  end

  always @(posedge cyp1401_GSSL_RXCLK_C) begin
    gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger;
    gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1_1 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger;
    gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_2 <= gssl_rxarea_c_rx_module_C_rx_ttc_trigger_delay_1_1;
  end


endmodule

module VME_TOP (
  input               clk,
  input               reset,
  input      [23:0]   vme_addr,
  input      [5:0]    vme_am,
  input               vme_as,
  input               vme_ds0,
  input               vme_ds1,
  input               vme_write,
  input               vme_lword,
  input               vme_iack,
  output              vme_dtack,
  output              vme_beer,
  output              vme_retry,
  output     [6:0]    vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [31:0]   data_read,
  output     [31:0]   data_write,
  output              data_writeEnable,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4,
  output              datadir,
  output     [31:0]   vme_data_0,
  output     [31:0]   vme_data_1,
  output     [31:0]   vme_data_2,
  output     [31:0]   vme_data_3,
  output     [31:0]   vme_data_4,
  output     [31:0]   vme_data_5,
  input      [31:0]   sensor_data_0,
  input      [31:0]   sensor_data_1,
  input      [31:0]   sensor_data_2,
  input      [31:0]   sensor_data_3,
  input      [31:0]   sensor_data_4,
  input      [31:0]   sensor_data_5,
  input      [31:0]   sensor_data_6,
  input      [31:0]   sensor_data_7,
  input      [31:0]   sensor_data_8,
  input      [31:0]   sensor_data_9,
  input      [31:0]   sensor_data_10,
  input      [31:0]   sensor_data_11
);

  wire                vme_area_vme_decode_vme_dtack;
  wire                vme_area_vme_decode_vme_beer;
  wire                vme_area_vme_decode_vme_retry;
  wire       [6:0]    vme_area_vme_decode_vme_irq;
  wire                vme_area_vme_decode_vme_iackout;
  wire                vme_area_vme_decode_lwr;
  wire                vme_area_vme_decode_lrd;
  wire       [14:0]   vme_area_vme_decode_laddr;
  wire                vme_area_vme_decode_datadir;
  wire       [31:0]   vme_area_vme_apb_data_write;
  wire                vme_area_vme_apb_data_writeEnable;
  wire       [14:0]   vme_area_vme_apb_apb_PADDR;
  wire       [0:0]    vme_area_vme_apb_apb_PSEL;
  wire                vme_area_vme_apb_apb_PENABLE;
  wire                vme_area_vme_apb_apb_PWRITE;
  wire       [31:0]   vme_area_vme_apb_apb_PWDATA;
  wire                vme_area_vme_reg_apb_PREADY;
  wire       [31:0]   vme_area_vme_reg_apb_PRDATA;
  wire                vme_area_vme_reg_apb_PSLVERROR;
  wire       [31:0]   vme_area_vme_reg_vme_data_0;
  wire       [31:0]   vme_area_vme_reg_vme_data_1;
  wire       [31:0]   vme_area_vme_reg_vme_data_2;
  wire       [31:0]   vme_area_vme_reg_vme_data_3;
  wire       [31:0]   vme_area_vme_reg_vme_data_4;
  wire       [31:0]   vme_area_vme_reg_vme_data_5;

  Vme vme_area_vme_decode (
    .clk            (clk                               ), //i
    .reset          (reset                             ), //i
    .vme_addr       (vme_addr[23:0]                    ), //i
    .vme_am         (vme_am[5:0]                       ), //i
    .vme_as         (vme_as                            ), //i
    .vme_ds0        (vme_ds0                           ), //i
    .vme_ds1        (vme_ds1                           ), //i
    .vme_write      (vme_write                         ), //i
    .vme_lword      (vme_lword                         ), //i
    .vme_iack       (vme_iack                          ), //i
    .vme_dtack      (vme_area_vme_decode_vme_dtack     ), //o
    .vme_beer       (vme_area_vme_decode_vme_beer      ), //o
    .vme_retry      (vme_area_vme_decode_vme_retry     ), //o
    .vme_irq        (vme_area_vme_decode_vme_irq[6:0]  ), //o
    .vme_iackin     (vme_iackin                        ), //i
    .vme_iackout    (vme_area_vme_decode_vme_iackout   ), //o
    .gap            (gap[3:0]                          ), //i
    .sw             (sw[3:0]                           ), //i
    .gap4           (gap4                              ), //i
    .lwr            (vme_area_vme_decode_lwr           ), //o
    .lrd            (vme_area_vme_decode_lrd           ), //o
    .laddr          (vme_area_vme_decode_laddr[14:0]   ), //o
    .datadir        (vme_area_vme_decode_datadir       )  //o
  );
  VME_APB vme_area_vme_apb (
    .lwr                 (vme_area_vme_decode_lwr            ), //i
    .lrd                 (vme_area_vme_decode_lrd            ), //i
    .laddr               (vme_area_vme_decode_laddr[14:0]    ), //i
    .data_read           (data_read[31:0]                    ), //i
    .data_write          (vme_area_vme_apb_data_write[31:0]  ), //o
    .data_writeEnable    (vme_area_vme_apb_data_writeEnable  ), //o
    .apb_PADDR           (vme_area_vme_apb_apb_PADDR[14:0]   ), //o
    .apb_PSEL            (vme_area_vme_apb_apb_PSEL          ), //o
    .apb_PENABLE         (vme_area_vme_apb_apb_PENABLE       ), //o
    .apb_PREADY          (vme_area_vme_reg_apb_PREADY        ), //i
    .apb_PWRITE          (vme_area_vme_apb_apb_PWRITE        ), //o
    .apb_PWDATA          (vme_area_vme_apb_apb_PWDATA[31:0]  ), //o
    .apb_PRDATA          (vme_area_vme_reg_apb_PRDATA[31:0]  ), //i
    .apb_PSLVERROR       (vme_area_vme_reg_apb_PSLVERROR     )  //i
  );
  VME_REG vme_area_vme_reg (
    .apb_PADDR         (vme_area_vme_apb_apb_PADDR[14:0]   ), //i
    .apb_PSEL          (vme_area_vme_apb_apb_PSEL          ), //i
    .apb_PENABLE       (vme_area_vme_apb_apb_PENABLE       ), //i
    .apb_PREADY        (vme_area_vme_reg_apb_PREADY        ), //o
    .apb_PWRITE        (vme_area_vme_apb_apb_PWRITE        ), //i
    .apb_PWDATA        (vme_area_vme_apb_apb_PWDATA[31:0]  ), //i
    .apb_PRDATA        (vme_area_vme_reg_apb_PRDATA[31:0]  ), //o
    .apb_PSLVERROR     (vme_area_vme_reg_apb_PSLVERROR     ), //o
    .vme_data_0        (vme_area_vme_reg_vme_data_0[31:0]  ), //o
    .vme_data_1        (vme_area_vme_reg_vme_data_1[31:0]  ), //o
    .vme_data_2        (vme_area_vme_reg_vme_data_2[31:0]  ), //o
    .vme_data_3        (vme_area_vme_reg_vme_data_3[31:0]  ), //o
    .vme_data_4        (vme_area_vme_reg_vme_data_4[31:0]  ), //o
    .vme_data_5        (vme_area_vme_reg_vme_data_5[31:0]  ), //o
    .sensor_data_0     (sensor_data_0[31:0]                ), //i
    .sensor_data_1     (sensor_data_1[31:0]                ), //i
    .sensor_data_2     (sensor_data_2[31:0]                ), //i
    .sensor_data_3     (sensor_data_3[31:0]                ), //i
    .sensor_data_4     (sensor_data_4[31:0]                ), //i
    .sensor_data_5     (sensor_data_5[31:0]                ), //i
    .sensor_data_6     (sensor_data_6[31:0]                ), //i
    .sensor_data_7     (sensor_data_7[31:0]                ), //i
    .sensor_data_8     (sensor_data_8[31:0]                ), //i
    .sensor_data_9     (sensor_data_9[31:0]                ), //i
    .sensor_data_10    (sensor_data_10[31:0]               ), //i
    .sensor_data_11    (sensor_data_11[31:0]               ), //i
    .clk               (clk                                ), //i
    .reset             (reset                              )  //i
  );
  assign vme_dtack = vme_area_vme_decode_vme_dtack;
  assign vme_beer = vme_area_vme_decode_vme_beer;
  assign vme_retry = vme_area_vme_decode_vme_retry;
  assign vme_irq = vme_area_vme_decode_vme_irq;
  assign vme_iackout = vme_area_vme_decode_vme_iackout;
  assign datadir = vme_area_vme_decode_datadir;
  assign data_write = vme_area_vme_apb_data_write;
  assign data_writeEnable = vme_area_vme_apb_data_writeEnable;
  assign vme_data_0 = vme_area_vme_reg_vme_data_0;
  assign vme_data_1 = vme_area_vme_reg_vme_data_1;
  assign vme_data_2 = vme_area_vme_reg_vme_data_2;
  assign vme_data_3 = vme_area_vme_reg_vme_data_3;
  assign vme_data_4 = vme_area_vme_reg_vme_data_4;
  assign vme_data_5 = vme_area_vme_reg_vme_data_5;

endmodule

//GSSL_RX_MOUDLE replaced by GSSL_RX_MOUDLE

module GSSL_RX_MOUDLE (
  input               GSSL_RXCLK,
  input               rst_in,
  input      [2:0]    GSSL_RXST0,
  input      [7:0]    GSSL_RXD,
  output     [7:0]    writes_addr,
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
  wire       [7:0]    _zz_writes_addr;
  reg                 gssl_area_RXST0_out;
  reg        [7:0]    gssl_area_RXD_out;

  assign _zz_writes_addr = gssl_area_gsslrxreceiver_rx_dpram_waddress;
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
  reg        [9:0]    GSSL_Reset_Counter;
  wire       [9:0]    _zz_when_CYP1401_l91;
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

  assign _zz_when_CYP1401_l91[9 : 0] = 10'h3ff;
  assign when_CYP1401_l91 = (GSSL_Reset_Counter != _zz_when_CYP1401_l91);
  assign GSSL_TRSTZ_N_ABCD = gsslResetUnbuffered_regNext;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      GSSL_Reset_Counter <= 10'h0;
    end else begin
      if(when_CYP1401_l91) begin
        GSSL_Reset_Counter <= (GSSL_Reset_Counter + 10'h001);
      end
    end
  end

  always @(posedge clk) begin
    gsslResetUnbuffered_regNext <= gsslResetUnbuffered;
  end


endmodule

module VME_REG (
  input      [14:0]   apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output     [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output     [31:0]   vme_data_0,
  output     [31:0]   vme_data_1,
  output     [31:0]   vme_data_2,
  output     [31:0]   vme_data_3,
  output     [31:0]   vme_data_4,
  output     [31:0]   vme_data_5,
  input      [31:0]   sensor_data_0,
  input      [31:0]   sensor_data_1,
  input      [31:0]   sensor_data_2,
  input      [31:0]   sensor_data_3,
  input      [31:0]   sensor_data_4,
  input      [31:0]   sensor_data_5,
  input      [31:0]   sensor_data_6,
  input      [31:0]   sensor_data_7,
  input      [31:0]   sensor_data_8,
  input      [31:0]   sensor_data_9,
  input      [31:0]   sensor_data_10,
  input      [31:0]   sensor_data_11,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire                busslave_askWrite;
  wire                busslave_askRead;
  wire                busslave_doWrite;
  wire                busslave_doRead;
  wire                when_RegInst_l153;
  reg        [31:0]   _zz_vme_data_0;
  reg        [31:0]   _zz_vme_data_0_1;
  wire                when_RegInst_l153_1;
  reg        [31:0]   _zz_vme_data_1;
  reg        [31:0]   _zz_vme_data_1_1;
  wire                when_RegInst_l153_2;
  reg        [31:0]   _zz_vme_data_2;
  reg        [31:0]   _zz_vme_data_2_1;
  wire                when_RegInst_l153_3;
  reg        [31:0]   _zz_vme_data_3;
  reg        [31:0]   _zz_vme_data_3_1;
  wire                when_RegInst_l153_4;
  reg        [31:0]   _zz_vme_data_4;
  reg        [31:0]   _zz_vme_data_4_1;
  wire                when_RegInst_l153_5;
  reg        [31:0]   _zz_vme_data_5;
  reg        [31:0]   _zz_vme_data_5_1;

  assign apb_PREADY = 1'b1;
  assign apb_PRDATA = busslave_readData;
  assign apb_PSLVERROR = busslave_readError;
  assign busslave_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busslave_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busslave_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busslave_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign when_RegInst_l153 = ((apb_PADDR == 15'h0) && busslave_doWrite);
  assign vme_data_0 = _zz_vme_data_0_1;
  assign when_RegInst_l153_1 = ((apb_PADDR == 15'h0004) && busslave_doWrite);
  assign vme_data_1 = _zz_vme_data_1_1;
  assign when_RegInst_l153_2 = ((apb_PADDR == 15'h0008) && busslave_doWrite);
  assign vme_data_2 = _zz_vme_data_2_1;
  assign when_RegInst_l153_3 = ((apb_PADDR == 15'h000c) && busslave_doWrite);
  assign vme_data_3 = _zz_vme_data_3_1;
  assign when_RegInst_l153_4 = ((apb_PADDR == 15'h0010) && busslave_doWrite);
  assign vme_data_4 = _zz_vme_data_4_1;
  assign when_RegInst_l153_5 = ((apb_PADDR == 15'h0014) && busslave_doWrite);
  assign vme_data_5 = _zz_vme_data_5_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
      _zz_vme_data_0 <= 32'h0;
      _zz_vme_data_1 <= 32'h0;
      _zz_vme_data_2 <= 32'h0;
      _zz_vme_data_3 <= 32'h0;
      _zz_vme_data_4 <= 32'h0;
      _zz_vme_data_5 <= 32'h0;
    end else begin
      if(when_RegInst_l153) begin
        _zz_vme_data_0 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_1) begin
        _zz_vme_data_1 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_2) begin
        _zz_vme_data_2 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_3) begin
        _zz_vme_data_3 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_4) begin
        _zz_vme_data_4 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_5) begin
        _zz_vme_data_5 <= apb_PWDATA[31 : 0];
      end
      if(busslave_doRead) begin
        case(apb_PADDR)
          15'h0 : begin
            busslave_readData <= _zz_vme_data_0;
            busslave_readError <= 1'b0;
          end
          15'h0004 : begin
            busslave_readData <= _zz_vme_data_1;
            busslave_readError <= 1'b0;
          end
          15'h0008 : begin
            busslave_readData <= _zz_vme_data_2;
            busslave_readError <= 1'b0;
          end
          15'h000c : begin
            busslave_readData <= _zz_vme_data_3;
            busslave_readError <= 1'b0;
          end
          15'h0010 : begin
            busslave_readData <= _zz_vme_data_4;
            busslave_readError <= 1'b0;
          end
          15'h0014 : begin
            busslave_readData <= _zz_vme_data_5;
            busslave_readError <= 1'b0;
          end
          15'h0018 : begin
            busslave_readData <= sensor_data_0;
            busslave_readError <= 1'b0;
          end
          15'h001c : begin
            busslave_readData <= sensor_data_1;
            busslave_readError <= 1'b0;
          end
          15'h0020 : begin
            busslave_readData <= sensor_data_2;
            busslave_readError <= 1'b0;
          end
          15'h0024 : begin
            busslave_readData <= sensor_data_3;
            busslave_readError <= 1'b0;
          end
          15'h0028 : begin
            busslave_readData <= sensor_data_4;
            busslave_readError <= 1'b0;
          end
          15'h002c : begin
            busslave_readData <= sensor_data_5;
            busslave_readError <= 1'b0;
          end
          15'h0030 : begin
            busslave_readData <= sensor_data_6;
            busslave_readError <= 1'b0;
          end
          15'h0034 : begin
            busslave_readData <= sensor_data_7;
            busslave_readError <= 1'b0;
          end
          15'h0038 : begin
            busslave_readData <= sensor_data_8;
            busslave_readError <= 1'b0;
          end
          15'h003c : begin
            busslave_readData <= sensor_data_9;
            busslave_readError <= 1'b0;
          end
          15'h0040 : begin
            busslave_readData <= sensor_data_10;
            busslave_readError <= 1'b0;
          end
          15'h0044 : begin
            busslave_readData <= sensor_data_11;
            busslave_readError <= 1'b0;
          end
          default : begin
            busslave_readData <= 32'h0;
            busslave_readError <= 1'b1;
          end
        endcase
      end
    end
  end

  always @(posedge clk) begin
    if(when_RegInst_l153) begin
      _zz_vme_data_0_1 <= _zz_vme_data_0;
    end
    if(when_RegInst_l153_1) begin
      _zz_vme_data_1_1 <= _zz_vme_data_1;
    end
    if(when_RegInst_l153_2) begin
      _zz_vme_data_2_1 <= _zz_vme_data_2;
    end
    if(when_RegInst_l153_3) begin
      _zz_vme_data_3_1 <= _zz_vme_data_3;
    end
    if(when_RegInst_l153_4) begin
      _zz_vme_data_4_1 <= _zz_vme_data_4;
    end
    if(when_RegInst_l153_5) begin
      _zz_vme_data_5_1 <= _zz_vme_data_5;
    end
  end


endmodule

module VME_APB (
  input               lwr,
  input               lrd,
  input      [14:0]   laddr,
  input      [31:0]   data_read,
  output     [31:0]   data_write,
  output              data_writeEnable,
  output     [14:0]   apb_PADDR,
  output     [0:0]    apb_PSEL,
  output              apb_PENABLE,
  input               apb_PREADY,
  output              apb_PWRITE,
  output     [31:0]   apb_PWDATA,
  input      [31:0]   apb_PRDATA,
  input               apb_PSLVERROR
);


  assign apb_PADDR = laddr;
  assign apb_PSEL = ((! lwr) || (! lrd));
  assign apb_PWRITE = (! lwr);
  assign apb_PENABLE = ((! lwr) || (! lrd));
  assign data_writeEnable = (! lrd);
  assign data_write = apb_PRDATA;
  assign apb_PWDATA = data_read;

endmodule

module Vme (
  input               clk,
  input               reset,
  input      [23:0]   vme_addr,
  input      [5:0]    vme_am,
  input               vme_as,
  input               vme_ds0,
  input               vme_ds1,
  input               vme_write,
  input               vme_lword,
  input               vme_iack,
  output              vme_dtack,
  output              vme_beer,
  output              vme_retry,
  output     [6:0]    vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4,
  output              lwr,
  output              lrd,
  output     [14:0]   laddr,
  output              datadir
);

  wire                vme_area_os_count_shot_clk;
  wire                vme_area_os_count_shot_out;
  wire                vme_area_sloterr;
  wire                vme_area_addr_pass_data1;
  wire                vme_area_addr_pass_int1;
  wire                vme_area_addr_pass_data;
  wire                vme_area_addr_pass_int;
  wire                vme_area_ds;
  reg                 vme_area_dtack;
  reg                 vme_area_os_count_shot_out_regNext;
  reg                 vme_area_ds_regNext;
  wire                when_VmeInterface_l120;

  oneshot_count vme_area_os_count (
    .clk         (clk                         ), //i
    .shot_clk    (vme_area_os_count_shot_clk  ), //i
    .count       (8'h02                       ), //i
    .shot_out    (vme_area_os_count_shot_out  )  //o
  );
  assign vme_area_sloterr = (gap == sw);
  assign vme_area_addr_pass_data1 = ((((vme_am == 6'h39) || (vme_am == 6'h3d)) && vme_lword) && vme_iack);
  assign vme_area_addr_pass_int1 = ((((vme_am == 6'h29) || (vme_am == 6'h2d)) && vme_lword) && (! vme_iack));
  assign vme_area_addr_pass_data = (((((vme_area_addr_pass_data1 && (! vme_as)) && (vme_addr[19 : 16] == (~ gap))) && vme_area_sloterr) && (vme_addr[23 : 21] == 3'b110)) && (vme_addr[20] == (! gap4)));
  assign vme_area_addr_pass_int = (vme_area_addr_pass_int1 && (! vme_as));
  assign laddr = ((vme_area_addr_pass_data1 && (! vme_as)) ? vme_addr[15 : 1] : 15'h7fff);
  assign vme_area_ds = (vme_ds0 && vme_ds1);
  assign lwr = ((vme_area_addr_pass_data && (! vme_write)) ? vme_area_ds : 1'b1);
  assign lrd = ((vme_area_addr_pass_data && vme_write) ? vme_area_ds : 1'b1);
  assign vme_area_os_count_shot_clk = (! (lwr && lrd));
  assign when_VmeInterface_l120 = (((! vme_area_os_count_shot_out) && vme_area_os_count_shot_out_regNext) || (vme_area_ds && (! vme_area_ds_regNext)));
  assign vme_dtack = vme_area_dtack;
  assign datadir = ((vme_area_addr_pass_data && vme_write) ? 1'b1 : 1'b0);
  assign vme_iackout = vme_iackin;
  assign vme_beer = 1'b0;
  assign vme_retry = 1'b0;
  assign vme_irq = 7'h7f;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      vme_area_dtack <= 1'b1;
    end else begin
      if(when_VmeInterface_l120) begin
        if(vme_area_ds) begin
          vme_area_dtack <= 1'b1;
        end else begin
          vme_area_dtack <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    vme_area_os_count_shot_out_regNext <= vme_area_os_count_shot_out;
    vme_area_ds_regNext <= vme_area_ds;
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

module oneshot_count (
  input               clk,
  input               shot_clk,
  input      [7:0]    count,
  output              shot_out
);

  wire                dff_1_clrn;
  wire                dff_1_q;
  reg                 oneshot_negarea_shot_clk_buf;
  reg        [7:0]    oneshot_posarea_counter;
  wire                when_VmeInterface_l70;

  DFF dff_1 (
    .d       (1'b1                          ), //i
    .q       (dff_1_q                       ), //o
    .clrn    (dff_1_clrn                    ), //i
    .clk     (oneshot_negarea_shot_clk_buf  )  //i
  );
  assign when_VmeInterface_l70 = (! dff_1_q);
  assign dff_1_clrn = (oneshot_posarea_counter < count);
  assign shot_out = dff_1_q;
  always @(negedge clk) begin
    oneshot_negarea_shot_clk_buf <= shot_clk;
  end

  always @(posedge clk) begin
    if(when_VmeInterface_l70) begin
      oneshot_posarea_counter <= 8'h0;
    end else begin
      oneshot_posarea_counter <= (oneshot_posarea_counter + 8'h01);
    end
  end


endmodule

module DFF (
  input               d,
  output              q,
  input               clrn,
  input               clk
);

  (* async_reg = "true" *) reg                 dff_area_buffer;

  assign q = ((! clrn) ? 1'b0 : dff_area_buffer);
  always @(posedge clk) begin
    dff_area_buffer <= d;
  end


endmodule
