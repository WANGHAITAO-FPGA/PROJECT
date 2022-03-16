// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : X300_SDAC_TOP

`timescale 1ns/1ps 

module X300_SDAC_TOP (
  input               intput_valid,
  output              intput_ready,
  input               intput_payload_last,
  input      [31:0]   intput_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input      [15:0]   AD7606_0_ad_data,
  input               AD7606_0_ad_busy,
  input               AD7606_0_first_data,
  output     [2:0]    AD7606_0_ad_os,
  output              AD7606_0_ad_cs,
  output              AD7606_0_ad_rd,
  output              AD7606_0_ad_reset,
  output              AD7606_0_ad_convsta,
  output              AD7606_0_ad_convstb,
  output              AD7606_0_ad_range,
  input      [15:0]   AD7606_1_ad_data,
  input               AD7606_1_ad_busy,
  input               AD7606_1_first_data,
  output     [2:0]    AD7606_1_ad_os,
  output              AD7606_1_ad_cs,
  output              AD7606_1_ad_rd,
  output              AD7606_1_ad_reset,
  output              AD7606_1_ad_convsta,
  output              AD7606_1_ad_convstb,
  output              AD7606_1_ad_range,
  input      [15:0]   AD7606_2_ad_data,
  input               AD7606_2_ad_busy,
  input               AD7606_2_first_data,
  output     [2:0]    AD7606_2_ad_os,
  output              AD7606_2_ad_cs,
  output              AD7606_2_ad_rd,
  output              AD7606_2_ad_reset,
  output              AD7606_2_ad_convsta,
  output              AD7606_2_ad_convstb,
  output              AD7606_2_ad_range,
  input               clk,
  input               reset,
  input               clk_80M,
  input      [31:0]   slaveid,
  input               tick,
  output              led
);

  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_0;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_1;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_2;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_3;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_4;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_5;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_6;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_0_7;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_0;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_1;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_2;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_3;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_4;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_5;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_6;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_1_7;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_0;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_1;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_2;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_3;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_4;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_5;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_6;
  wire       [15:0]   sdac_area_sdacregif_AD7606_DATA_2_7;
  wire                sdac_area_sdacRxPreamble_input_ready;
  wire                sdac_area_sdacRxPreamble_output_valid;
  wire                sdac_area_sdacRxPreamble_output_payload_last;
  wire       [31:0]   sdac_area_sdacRxPreamble_output_payload_fragment;
  wire                sdac_area_sdacrxsimplebus_input_ready;
  wire       [7:0]    sdac_area_sdacrxsimplebus_waddr;
  wire       [31:0]   sdac_area_sdacrxsimplebus_wdata;
  wire                sdac_area_sdacrxsimplebus_wenable;
  wire                sdac_area_sdactxsimplebus_output_valid;
  wire                sdac_area_sdactxsimplebus_output_payload_last;
  wire       [31:0]   sdac_area_sdactxsimplebus_output_payload_fragment;
  wire                sdac_area_sdactxsimplebus_RENABLE;
  wire       [7:0]    sdac_area_sdactxsimplebus_RADDR;
  wire       [31:0]   sdac_area_sdacregif_simplebus_RDATA;
  wire       [2:0]    sdac_area_ad_area_ad7606_0_ad_os;
  wire                sdac_area_ad_area_ad7606_0_ad_cs;
  wire                sdac_area_ad_area_ad7606_0_ad_rd;
  wire                sdac_area_ad_area_ad7606_0_ad_reset;
  wire                sdac_area_ad_area_ad7606_0_ad_convsta;
  wire                sdac_area_ad_area_ad7606_0_ad_convstb;
  wire                sdac_area_ad_area_ad7606_0_ad_range;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch1_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch2_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch3_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch4_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch5_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch6_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch7_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_0_ad_ch8_o;
  wire                sdac_area_ad_area_ad7606_0_ad_data_valid_o;
  wire       [2:0]    sdac_area_ad_area_ad7606_1_ad_os;
  wire                sdac_area_ad_area_ad7606_1_ad_cs;
  wire                sdac_area_ad_area_ad7606_1_ad_rd;
  wire                sdac_area_ad_area_ad7606_1_ad_reset;
  wire                sdac_area_ad_area_ad7606_1_ad_convsta;
  wire                sdac_area_ad_area_ad7606_1_ad_convstb;
  wire                sdac_area_ad_area_ad7606_1_ad_range;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch1_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch2_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch3_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch4_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch5_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch6_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch7_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_1_ad_ch8_o;
  wire                sdac_area_ad_area_ad7606_1_ad_data_valid_o;
  wire       [2:0]    sdac_area_ad_area_ad7606_2_ad_os;
  wire                sdac_area_ad_area_ad7606_2_ad_cs;
  wire                sdac_area_ad_area_ad7606_2_ad_rd;
  wire                sdac_area_ad_area_ad7606_2_ad_reset;
  wire                sdac_area_ad_area_ad7606_2_ad_convsta;
  wire                sdac_area_ad_area_ad7606_2_ad_convstb;
  wire                sdac_area_ad_area_ad7606_2_ad_range;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch1_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch2_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch3_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch4_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch5_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch6_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch7_o;
  wire       [15:0]   sdac_area_ad_area_ad7606_2_ad_ch8_o;
  wire                sdac_area_ad_area_ad7606_2_ad_data_valid_o;
  wire       [25:0]   _zz_sdac_area_counter_valueNext;
  wire       [0:0]    _zz_sdac_area_counter_valueNext_1;
  wire       [15:0]   _zz_sdac_area_tick_count_valueNext;
  wire       [0:0]    _zz_sdac_area_tick_count_valueNext_1;
  reg                 sdac_area_ledtemp;
  wire                sdac_area_counter_willIncrement;
  reg                 sdac_area_counter_willClear;
  reg        [25:0]   sdac_area_counter_valueNext;
  reg        [25:0]   sdac_area_counter_value;
  wire                sdac_area_counter_willOverflowIfInc;
  wire                sdac_area_counter_willOverflow;
  reg                 sdac_area_tx_tick;
  reg                 sdac_area_tick_count_willIncrement;
  reg                 sdac_area_tick_count_willClear;
  reg        [15:0]   sdac_area_tick_count_valueNext;
  reg        [15:0]   sdac_area_tick_count_value;
  wire                sdac_area_tick_count_willOverflowIfInc;
  wire                sdac_area_tick_count_willOverflow;

  assign _zz_sdac_area_counter_valueNext_1 = sdac_area_counter_willIncrement;
  assign _zz_sdac_area_counter_valueNext = {25'd0, _zz_sdac_area_counter_valueNext_1};
  assign _zz_sdac_area_tick_count_valueNext_1 = sdac_area_tick_count_willIncrement;
  assign _zz_sdac_area_tick_count_valueNext = {15'd0, _zz_sdac_area_tick_count_valueNext_1};
  X300_RxPreamble sdac_area_sdacRxPreamble (
    .input_valid                (intput_valid                                            ), //i
    .input_ready                (sdac_area_sdacRxPreamble_input_ready                    ), //o
    .input_payload_last         (intput_payload_last                                     ), //i
    .input_payload_fragment     (intput_payload_fragment[31:0]                           ), //i
    .output_valid               (sdac_area_sdacRxPreamble_output_valid                   ), //o
    .output_ready               (sdac_area_sdacrxsimplebus_input_ready                   ), //i
    .output_payload_last        (sdac_area_sdacRxPreamble_output_payload_last            ), //o
    .output_payload_fragment    (sdac_area_sdacRxPreamble_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                                     ), //i
    .reset                      (reset                                                   )  //i
  );
  X300_RxSimpleBus sdac_area_sdacrxsimplebus (
    .input_valid               (sdac_area_sdacRxPreamble_output_valid                   ), //i
    .input_ready               (sdac_area_sdacrxsimplebus_input_ready                   ), //o
    .input_payload_last        (sdac_area_sdacRxPreamble_output_payload_last            ), //i
    .input_payload_fragment    (sdac_area_sdacRxPreamble_output_payload_fragment[31:0]  ), //i
    .waddr                     (sdac_area_sdacrxsimplebus_waddr[7:0]                    ), //o
    .wdata                     (sdac_area_sdacrxsimplebus_wdata[31:0]                   ), //o
    .wenable                   (sdac_area_sdacrxsimplebus_wenable                       ), //o
    .clk                       (clk                                                     ), //i
    .reset                     (reset                                                   )  //i
  );
  X300_TxSimpleBus sdac_area_sdactxsimplebus (
    .output_valid               (sdac_area_sdactxsimplebus_output_valid                   ), //o
    .output_ready               (output_ready                                             ), //i
    .output_payload_last        (sdac_area_sdactxsimplebus_output_payload_last            ), //o
    .output_payload_fragment    (sdac_area_sdactxsimplebus_output_payload_fragment[31:0]  ), //o
    .RENABLE                    (sdac_area_sdactxsimplebus_RENABLE                        ), //o
    .RADDR                      (sdac_area_sdactxsimplebus_RADDR[7:0]                     ), //o
    .RDATA                      (sdac_area_sdacregif_simplebus_RDATA[31:0]                ), //i
    .timer_tick                 (sdac_area_tx_tick                                        ), //i
    .clk                        (clk                                                      ), //i
    .reset                      (reset                                                    )  //i
  );
  X300_SdacRegif sdac_area_sdacregif (
    .simplebus_RADDR      (sdac_area_sdactxsimplebus_RADDR[7:0]       ), //i
    .simplebus_RDATA      (sdac_area_sdacregif_simplebus_RDATA[31:0]  ), //o
    .simplebus_RENABLE    (sdac_area_sdactxsimplebus_RENABLE          ), //i
    .simplebus_WADDR      (sdac_area_sdacrxsimplebus_waddr[7:0]       ), //i
    .simplebus_WDATA      (sdac_area_sdacrxsimplebus_wdata[31:0]      ), //i
    .simplebus_WENABLE    (sdac_area_sdacrxsimplebus_wenable          ), //i
    .slaveid              (slaveid[31:0]                              ), //i
    .AD7606_DATA_0_0      (sdac_area_sdacregif_AD7606_DATA_0_0[15:0]  ), //i
    .AD7606_DATA_0_1      (sdac_area_sdacregif_AD7606_DATA_0_1[15:0]  ), //i
    .AD7606_DATA_0_2      (sdac_area_sdacregif_AD7606_DATA_0_2[15:0]  ), //i
    .AD7606_DATA_0_3      (sdac_area_sdacregif_AD7606_DATA_0_3[15:0]  ), //i
    .AD7606_DATA_0_4      (sdac_area_sdacregif_AD7606_DATA_0_4[15:0]  ), //i
    .AD7606_DATA_0_5      (sdac_area_sdacregif_AD7606_DATA_0_5[15:0]  ), //i
    .AD7606_DATA_0_6      (sdac_area_sdacregif_AD7606_DATA_0_6[15:0]  ), //i
    .AD7606_DATA_0_7      (sdac_area_sdacregif_AD7606_DATA_0_7[15:0]  ), //i
    .AD7606_DATA_1_0      (sdac_area_sdacregif_AD7606_DATA_1_0[15:0]  ), //i
    .AD7606_DATA_1_1      (sdac_area_sdacregif_AD7606_DATA_1_1[15:0]  ), //i
    .AD7606_DATA_1_2      (sdac_area_sdacregif_AD7606_DATA_1_2[15:0]  ), //i
    .AD7606_DATA_1_3      (sdac_area_sdacregif_AD7606_DATA_1_3[15:0]  ), //i
    .AD7606_DATA_1_4      (sdac_area_sdacregif_AD7606_DATA_1_4[15:0]  ), //i
    .AD7606_DATA_1_5      (sdac_area_sdacregif_AD7606_DATA_1_5[15:0]  ), //i
    .AD7606_DATA_1_6      (sdac_area_sdacregif_AD7606_DATA_1_6[15:0]  ), //i
    .AD7606_DATA_1_7      (sdac_area_sdacregif_AD7606_DATA_1_7[15:0]  ), //i
    .AD7606_DATA_2_0      (sdac_area_sdacregif_AD7606_DATA_2_0[15:0]  ), //i
    .AD7606_DATA_2_1      (sdac_area_sdacregif_AD7606_DATA_2_1[15:0]  ), //i
    .AD7606_DATA_2_2      (sdac_area_sdacregif_AD7606_DATA_2_2[15:0]  ), //i
    .AD7606_DATA_2_3      (sdac_area_sdacregif_AD7606_DATA_2_3[15:0]  ), //i
    .AD7606_DATA_2_4      (sdac_area_sdacregif_AD7606_DATA_2_4[15:0]  ), //i
    .AD7606_DATA_2_5      (sdac_area_sdacregif_AD7606_DATA_2_5[15:0]  ), //i
    .AD7606_DATA_2_6      (sdac_area_sdacregif_AD7606_DATA_2_6[15:0]  ), //i
    .AD7606_DATA_2_7      (sdac_area_sdacregif_AD7606_DATA_2_7[15:0]  ), //i
    .clk                  (clk                                        ), //i
    .reset                (reset                                      )  //i
  );
  AD7606_DATA sdac_area_ad_area_ad7606_0 (
    .clk                (clk_80M                                     ), //i
    .reset              (reset                                       ), //i
    .sample_en          (1'b1                                        ), //i
    .ad_data            (AD7606_0_ad_data[15:0]                      ), //i
    .ad_busy            (AD7606_0_ad_busy                            ), //i
    .first_data         (AD7606_0_first_data                         ), //i
    .ad_os              (sdac_area_ad_area_ad7606_0_ad_os[2:0]       ), //o
    .ad_cs              (sdac_area_ad_area_ad7606_0_ad_cs            ), //o
    .ad_rd              (sdac_area_ad_area_ad7606_0_ad_rd            ), //o
    .ad_reset           (sdac_area_ad_area_ad7606_0_ad_reset         ), //o
    .ad_convsta         (sdac_area_ad_area_ad7606_0_ad_convsta       ), //o
    .ad_convstb         (sdac_area_ad_area_ad7606_0_ad_convstb       ), //o
    .ad_range           (sdac_area_ad_area_ad7606_0_ad_range         ), //o
    .ad_ch1_o           (sdac_area_ad_area_ad7606_0_ad_ch1_o[15:0]   ), //o
    .ad_ch2_o           (sdac_area_ad_area_ad7606_0_ad_ch2_o[15:0]   ), //o
    .ad_ch3_o           (sdac_area_ad_area_ad7606_0_ad_ch3_o[15:0]   ), //o
    .ad_ch4_o           (sdac_area_ad_area_ad7606_0_ad_ch4_o[15:0]   ), //o
    .ad_ch5_o           (sdac_area_ad_area_ad7606_0_ad_ch5_o[15:0]   ), //o
    .ad_ch6_o           (sdac_area_ad_area_ad7606_0_ad_ch6_o[15:0]   ), //o
    .ad_ch7_o           (sdac_area_ad_area_ad7606_0_ad_ch7_o[15:0]   ), //o
    .ad_ch8_o           (sdac_area_ad_area_ad7606_0_ad_ch8_o[15:0]   ), //o
    .ad_data_valid_o    (sdac_area_ad_area_ad7606_0_ad_data_valid_o  )  //o
  );
  AD7606_DATA sdac_area_ad_area_ad7606_1 (
    .clk                (clk_80M                                     ), //i
    .reset              (reset                                       ), //i
    .sample_en          (1'b1                                        ), //i
    .ad_data            (AD7606_1_ad_data[15:0]                      ), //i
    .ad_busy            (AD7606_1_ad_busy                            ), //i
    .first_data         (AD7606_1_first_data                         ), //i
    .ad_os              (sdac_area_ad_area_ad7606_1_ad_os[2:0]       ), //o
    .ad_cs              (sdac_area_ad_area_ad7606_1_ad_cs            ), //o
    .ad_rd              (sdac_area_ad_area_ad7606_1_ad_rd            ), //o
    .ad_reset           (sdac_area_ad_area_ad7606_1_ad_reset         ), //o
    .ad_convsta         (sdac_area_ad_area_ad7606_1_ad_convsta       ), //o
    .ad_convstb         (sdac_area_ad_area_ad7606_1_ad_convstb       ), //o
    .ad_range           (sdac_area_ad_area_ad7606_1_ad_range         ), //o
    .ad_ch1_o           (sdac_area_ad_area_ad7606_1_ad_ch1_o[15:0]   ), //o
    .ad_ch2_o           (sdac_area_ad_area_ad7606_1_ad_ch2_o[15:0]   ), //o
    .ad_ch3_o           (sdac_area_ad_area_ad7606_1_ad_ch3_o[15:0]   ), //o
    .ad_ch4_o           (sdac_area_ad_area_ad7606_1_ad_ch4_o[15:0]   ), //o
    .ad_ch5_o           (sdac_area_ad_area_ad7606_1_ad_ch5_o[15:0]   ), //o
    .ad_ch6_o           (sdac_area_ad_area_ad7606_1_ad_ch6_o[15:0]   ), //o
    .ad_ch7_o           (sdac_area_ad_area_ad7606_1_ad_ch7_o[15:0]   ), //o
    .ad_ch8_o           (sdac_area_ad_area_ad7606_1_ad_ch8_o[15:0]   ), //o
    .ad_data_valid_o    (sdac_area_ad_area_ad7606_1_ad_data_valid_o  )  //o
  );
  AD7606_DATA sdac_area_ad_area_ad7606_2 (
    .clk                (clk_80M                                     ), //i
    .reset              (reset                                       ), //i
    .sample_en          (1'b1                                        ), //i
    .ad_data            (AD7606_2_ad_data[15:0]                      ), //i
    .ad_busy            (AD7606_2_ad_busy                            ), //i
    .first_data         (AD7606_2_first_data                         ), //i
    .ad_os              (sdac_area_ad_area_ad7606_2_ad_os[2:0]       ), //o
    .ad_cs              (sdac_area_ad_area_ad7606_2_ad_cs            ), //o
    .ad_rd              (sdac_area_ad_area_ad7606_2_ad_rd            ), //o
    .ad_reset           (sdac_area_ad_area_ad7606_2_ad_reset         ), //o
    .ad_convsta         (sdac_area_ad_area_ad7606_2_ad_convsta       ), //o
    .ad_convstb         (sdac_area_ad_area_ad7606_2_ad_convstb       ), //o
    .ad_range           (sdac_area_ad_area_ad7606_2_ad_range         ), //o
    .ad_ch1_o           (sdac_area_ad_area_ad7606_2_ad_ch1_o[15:0]   ), //o
    .ad_ch2_o           (sdac_area_ad_area_ad7606_2_ad_ch2_o[15:0]   ), //o
    .ad_ch3_o           (sdac_area_ad_area_ad7606_2_ad_ch3_o[15:0]   ), //o
    .ad_ch4_o           (sdac_area_ad_area_ad7606_2_ad_ch4_o[15:0]   ), //o
    .ad_ch5_o           (sdac_area_ad_area_ad7606_2_ad_ch5_o[15:0]   ), //o
    .ad_ch6_o           (sdac_area_ad_area_ad7606_2_ad_ch6_o[15:0]   ), //o
    .ad_ch7_o           (sdac_area_ad_area_ad7606_2_ad_ch7_o[15:0]   ), //o
    .ad_ch8_o           (sdac_area_ad_area_ad7606_2_ad_ch8_o[15:0]   ), //o
    .ad_data_valid_o    (sdac_area_ad_area_ad7606_2_ad_data_valid_o  )  //o
  );
  always @(*) begin
    sdac_area_counter_willClear = 1'b0;
    if(sdac_area_counter_willOverflow) begin
      sdac_area_counter_willClear = 1'b1;
    end
  end

  assign sdac_area_counter_willOverflowIfInc = (sdac_area_counter_value == 26'h3b9ac9f);
  assign sdac_area_counter_willOverflow = (sdac_area_counter_willOverflowIfInc && sdac_area_counter_willIncrement);
  always @(*) begin
    if(sdac_area_counter_willOverflow) begin
      sdac_area_counter_valueNext = 26'h0;
    end else begin
      sdac_area_counter_valueNext = (sdac_area_counter_value + _zz_sdac_area_counter_valueNext);
    end
    if(sdac_area_counter_willClear) begin
      sdac_area_counter_valueNext = 26'h0;
    end
  end

  assign sdac_area_counter_willIncrement = 1'b1;
  assign led = sdac_area_ledtemp;
  always @(*) begin
    sdac_area_tick_count_willIncrement = 1'b0;
    if(tick) begin
      sdac_area_tick_count_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    sdac_area_tick_count_willClear = 1'b0;
    if(!tick) begin
      sdac_area_tick_count_willClear = 1'b1;
    end
  end

  assign sdac_area_tick_count_willOverflowIfInc = (sdac_area_tick_count_value == 16'hc350);
  assign sdac_area_tick_count_willOverflow = (sdac_area_tick_count_willOverflowIfInc && sdac_area_tick_count_willIncrement);
  always @(*) begin
    if(sdac_area_tick_count_willOverflow) begin
      sdac_area_tick_count_valueNext = 16'h0;
    end else begin
      sdac_area_tick_count_valueNext = (sdac_area_tick_count_value + _zz_sdac_area_tick_count_valueNext);
    end
    if(sdac_area_tick_count_willClear) begin
      sdac_area_tick_count_valueNext = 16'h0;
    end
  end

  assign intput_ready = sdac_area_sdacRxPreamble_input_ready;
  assign output_valid = sdac_area_sdactxsimplebus_output_valid;
  assign output_payload_last = sdac_area_sdactxsimplebus_output_payload_last;
  assign output_payload_fragment = sdac_area_sdactxsimplebus_output_payload_fragment;
  assign AD7606_0_ad_cs = sdac_area_ad_area_ad7606_0_ad_cs;
  assign AD7606_0_ad_os = sdac_area_ad_area_ad7606_0_ad_os;
  assign AD7606_0_ad_rd = sdac_area_ad_area_ad7606_0_ad_rd;
  assign AD7606_0_ad_convsta = sdac_area_ad_area_ad7606_0_ad_convsta;
  assign AD7606_0_ad_convstb = sdac_area_ad_area_ad7606_0_ad_convstb;
  assign AD7606_0_ad_reset = sdac_area_ad_area_ad7606_0_ad_reset;
  assign AD7606_0_ad_range = sdac_area_ad_area_ad7606_0_ad_range;
  assign sdac_area_sdacregif_AD7606_DATA_0_0 = sdac_area_ad_area_ad7606_0_ad_ch1_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_1 = sdac_area_ad_area_ad7606_0_ad_ch2_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_2 = sdac_area_ad_area_ad7606_0_ad_ch3_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_3 = sdac_area_ad_area_ad7606_0_ad_ch4_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_4 = sdac_area_ad_area_ad7606_0_ad_ch5_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_5 = sdac_area_ad_area_ad7606_0_ad_ch6_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_6 = sdac_area_ad_area_ad7606_0_ad_ch7_o;
  assign sdac_area_sdacregif_AD7606_DATA_0_7 = sdac_area_ad_area_ad7606_0_ad_ch8_o;
  assign AD7606_1_ad_cs = sdac_area_ad_area_ad7606_1_ad_cs;
  assign AD7606_1_ad_os = sdac_area_ad_area_ad7606_1_ad_os;
  assign AD7606_1_ad_rd = sdac_area_ad_area_ad7606_1_ad_rd;
  assign AD7606_1_ad_convsta = sdac_area_ad_area_ad7606_1_ad_convsta;
  assign AD7606_1_ad_convstb = sdac_area_ad_area_ad7606_1_ad_convstb;
  assign AD7606_1_ad_reset = sdac_area_ad_area_ad7606_1_ad_reset;
  assign AD7606_1_ad_range = sdac_area_ad_area_ad7606_1_ad_range;
  assign sdac_area_sdacregif_AD7606_DATA_1_0 = sdac_area_ad_area_ad7606_1_ad_ch1_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_1 = sdac_area_ad_area_ad7606_1_ad_ch2_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_2 = sdac_area_ad_area_ad7606_1_ad_ch3_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_3 = sdac_area_ad_area_ad7606_1_ad_ch4_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_4 = sdac_area_ad_area_ad7606_1_ad_ch5_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_5 = sdac_area_ad_area_ad7606_1_ad_ch6_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_6 = sdac_area_ad_area_ad7606_1_ad_ch7_o;
  assign sdac_area_sdacregif_AD7606_DATA_1_7 = sdac_area_ad_area_ad7606_1_ad_ch8_o;
  assign AD7606_2_ad_cs = sdac_area_ad_area_ad7606_2_ad_cs;
  assign AD7606_2_ad_os = sdac_area_ad_area_ad7606_2_ad_os;
  assign AD7606_2_ad_rd = sdac_area_ad_area_ad7606_2_ad_rd;
  assign AD7606_2_ad_convsta = sdac_area_ad_area_ad7606_2_ad_convsta;
  assign AD7606_2_ad_convstb = sdac_area_ad_area_ad7606_2_ad_convstb;
  assign AD7606_2_ad_reset = sdac_area_ad_area_ad7606_2_ad_reset;
  assign AD7606_2_ad_range = sdac_area_ad_area_ad7606_2_ad_range;
  assign sdac_area_sdacregif_AD7606_DATA_2_0 = sdac_area_ad_area_ad7606_2_ad_ch1_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_1 = sdac_area_ad_area_ad7606_2_ad_ch2_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_2 = sdac_area_ad_area_ad7606_2_ad_ch3_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_3 = sdac_area_ad_area_ad7606_2_ad_ch4_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_4 = sdac_area_ad_area_ad7606_2_ad_ch5_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_5 = sdac_area_ad_area_ad7606_2_ad_ch6_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_6 = sdac_area_ad_area_ad7606_2_ad_ch7_o;
  assign sdac_area_sdacregif_AD7606_DATA_2_7 = sdac_area_ad_area_ad7606_2_ad_ch8_o;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      sdac_area_ledtemp <= 1'b0;
      sdac_area_counter_value <= 26'h0;
      sdac_area_tx_tick <= 1'b0;
      sdac_area_tick_count_value <= 16'h0;
    end else begin
      sdac_area_counter_value <= sdac_area_counter_valueNext;
      if(sdac_area_counter_willOverflow) begin
        sdac_area_ledtemp <= (! sdac_area_ledtemp);
      end
      sdac_area_tick_count_value <= sdac_area_tick_count_valueNext;
      if(!tick) begin
        sdac_area_tx_tick <= 1'b0;
      end
      if(sdac_area_tick_count_willOverflow) begin
        sdac_area_tx_tick <= 1'b1;
      end
    end
  end


endmodule

module X300_SdacRegif (
  (* keep = "true" *) input      [7:0]    simplebus_RADDR,
  (* keep = "true" *) output     [31:0]   simplebus_RDATA,
  (* keep = "true" *) input               simplebus_RENABLE,
  (* keep = "true" *) input      [7:0]    simplebus_WADDR,
  (* keep = "true" *) input      [31:0]   simplebus_WDATA,
  (* keep = "true" *) input               simplebus_WENABLE,
  (* keep = "true" *) input      [31:0]   slaveid,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_0,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_1,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_2,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_3,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_4,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_5,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_6,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_0_7,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_0,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_1,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_2,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_3,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_4,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_5,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_6,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_1_7,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_0,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_1,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_2,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_3,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_4,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_5,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_6,
  (* keep = "true" *) input      [15:0]   AD7606_DATA_2_7,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire       [31:0]   HEADER;
  wire       [31:0]   Slaveid_1;
  wire       [31:0]   ADDR;
  wire       [31:0]   VERSION;
  wire       [31:0]   Reserve1;
  wire       [31:0]   Reserve2;
  wire       [31:0]   Reserve3;
  wire       [31:0]   Reserve4;
  wire       [15:0]   AD7606_Datatemp1;
  wire       [15:0]   AD7606_Datatemp2;
  wire       [15:0]   AD7606_Datatemp3;
  wire       [15:0]   AD7606_Datatemp4;
  wire       [15:0]   AD7606_Datatemp5;
  wire       [15:0]   AD7606_Datatemp6;
  wire       [15:0]   AD7606_Datatemp7;
  wire       [15:0]   AD7606_Datatemp8;
  wire       [15:0]   AD7606_Datatemp9;
  wire       [15:0]   AD7606_Datatemp10;
  wire       [15:0]   AD7606_Datatemp11;
  wire       [15:0]   AD7606_Datatemp12;
  wire       [15:0]   AD7606_Datatemp13;
  wire       [15:0]   AD7606_Datatemp14;
  wire       [15:0]   AD7606_Datatemp15;
  wire       [15:0]   AD7606_Datatemp16;
  wire       [15:0]   AD7606_Datatemp17;
  wire       [15:0]   AD7606_Datatemp18;
  wire       [15:0]   AD7606_Datatemp19;
  wire       [15:0]   AD7606_Datatemp20;
  wire       [15:0]   AD7606_Datatemp21;
  wire       [15:0]   AD7606_Datatemp22;
  wire       [15:0]   AD7606_Datatemp23;
  wire       [15:0]   AD7606_Datatemp24;
  wire       [31:0]   tail;

  assign simplebus_RDATA = busslave_readData;
  assign HEADER = 32'h0000ffbc;
  assign Slaveid_1 = slaveid;
  assign ADDR = 32'h0000003b;
  assign VERSION = 32'h20220114;
  assign Reserve1 = 32'h00000001;
  assign Reserve2 = 32'h00000002;
  assign Reserve3 = 32'h00000003;
  assign Reserve4 = 32'h00000004;
  assign AD7606_Datatemp1 = AD7606_DATA_0_0;
  assign AD7606_Datatemp2 = AD7606_DATA_0_1;
  assign AD7606_Datatemp3 = AD7606_DATA_0_2;
  assign AD7606_Datatemp4 = AD7606_DATA_0_3;
  assign AD7606_Datatemp5 = AD7606_DATA_0_4;
  assign AD7606_Datatemp6 = AD7606_DATA_0_5;
  assign AD7606_Datatemp7 = AD7606_DATA_0_6;
  assign AD7606_Datatemp8 = AD7606_DATA_0_7;
  assign AD7606_Datatemp9 = AD7606_DATA_1_0;
  assign AD7606_Datatemp10 = AD7606_DATA_1_1;
  assign AD7606_Datatemp11 = AD7606_DATA_1_2;
  assign AD7606_Datatemp12 = AD7606_DATA_1_3;
  assign AD7606_Datatemp13 = AD7606_DATA_1_4;
  assign AD7606_Datatemp14 = AD7606_DATA_1_5;
  assign AD7606_Datatemp15 = AD7606_DATA_1_6;
  assign AD7606_Datatemp16 = AD7606_DATA_1_7;
  assign AD7606_Datatemp17 = AD7606_DATA_2_0;
  assign AD7606_Datatemp18 = AD7606_DATA_2_1;
  assign AD7606_Datatemp19 = AD7606_DATA_2_2;
  assign AD7606_Datatemp20 = AD7606_DATA_2_3;
  assign AD7606_Datatemp21 = AD7606_DATA_2_4;
  assign AD7606_Datatemp22 = AD7606_DATA_2_5;
  assign AD7606_Datatemp23 = AD7606_DATA_2_6;
  assign AD7606_Datatemp24 = AD7606_DATA_2_7;
  assign tail = 32'h0000ffbd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
    end else begin
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          8'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          8'h04 : begin
            busslave_readData <= Slaveid_1;
            busslave_readError <= 1'b0;
          end
          8'h08 : begin
            busslave_readData <= ADDR;
            busslave_readError <= 1'b0;
          end
          8'h0c : begin
            busslave_readData <= VERSION;
            busslave_readError <= 1'b0;
          end
          8'h10 : begin
            busslave_readData <= Reserve1;
            busslave_readError <= 1'b0;
          end
          8'h14 : begin
            busslave_readData <= Reserve2;
            busslave_readError <= 1'b0;
          end
          8'h18 : begin
            busslave_readData <= Reserve3;
            busslave_readError <= 1'b0;
          end
          8'h1c : begin
            busslave_readData <= Reserve4;
            busslave_readError <= 1'b0;
          end
          8'h20 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp1};
            busslave_readError <= 1'b0;
          end
          8'h24 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp2};
            busslave_readError <= 1'b0;
          end
          8'h28 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp3};
            busslave_readError <= 1'b0;
          end
          8'h2c : begin
            busslave_readData <= {16'h0,AD7606_Datatemp4};
            busslave_readError <= 1'b0;
          end
          8'h30 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp5};
            busslave_readError <= 1'b0;
          end
          8'h34 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp6};
            busslave_readError <= 1'b0;
          end
          8'h38 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp7};
            busslave_readError <= 1'b0;
          end
          8'h3c : begin
            busslave_readData <= {16'h0,AD7606_Datatemp8};
            busslave_readError <= 1'b0;
          end
          8'h40 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp9};
            busslave_readError <= 1'b0;
          end
          8'h44 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp10};
            busslave_readError <= 1'b0;
          end
          8'h48 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp11};
            busslave_readError <= 1'b0;
          end
          8'h4c : begin
            busslave_readData <= {16'h0,AD7606_Datatemp12};
            busslave_readError <= 1'b0;
          end
          8'h50 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp13};
            busslave_readError <= 1'b0;
          end
          8'h54 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp14};
            busslave_readError <= 1'b0;
          end
          8'h58 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp15};
            busslave_readError <= 1'b0;
          end
          8'h5c : begin
            busslave_readData <= {16'h0,AD7606_Datatemp16};
            busslave_readError <= 1'b0;
          end
          8'h60 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp17};
            busslave_readError <= 1'b0;
          end
          8'h64 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp18};
            busslave_readError <= 1'b0;
          end
          8'h68 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp19};
            busslave_readError <= 1'b0;
          end
          8'h6c : begin
            busslave_readData <= {16'h0,AD7606_Datatemp20};
            busslave_readError <= 1'b0;
          end
          8'h70 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp21};
            busslave_readError <= 1'b0;
          end
          8'h74 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp22};
            busslave_readError <= 1'b0;
          end
          8'h78 : begin
            busslave_readData <= {16'h0,AD7606_Datatemp23};
            busslave_readError <= 1'b0;
          end
          8'h7c : begin
            busslave_readData <= {16'h0,AD7606_Datatemp24};
            busslave_readError <= 1'b0;
          end
          8'hfc : begin
            busslave_readData <= tail;
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


endmodule

module X300_TxSimpleBus (
  (* keep = "true" *) output              output_valid,
  (* keep = "true" *) input               output_ready,
  (* keep = "true" *) output              output_payload_last,
  (* keep = "true" *) output     [31:0]   output_payload_fragment,
  (* keep = "true" *) output              RENABLE,
  (* keep = "true" *) output     [7:0]    RADDR,
  (* keep = "true" *) input      [31:0]   RDATA,
  (* keep = "true" *) input               timer_tick,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_1_BOOT = 2'd0;
  localparam fsm_enumDef_1_Wait_Start = 2'd1;
  localparam fsm_enumDef_1_Send_Data = 2'd2;
  localparam fsm_enumDef_1_End_1 = 2'd3;

  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire                streamfifo_1_io_push_ready;
  wire                streamfifo_1_io_pop_valid;
  wire       [31:0]   streamfifo_1_io_pop_payload;
  wire       [6:0]    streamfifo_1_io_occupancy;
  wire       [6:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [7:0]    RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [7:0]    send_length;
  wire                when_X300_SDAC_TX_l30;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_X300_SDAC_TX_l54;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  Timer timer_1 (
    .io_tick     (timer_tick              ), //i
    .io_clear    (timer_1_io_clear        ), //i
    .io_limit    (32'h000001f4            ), //i
    .io_full     (timer_1_io_full         ), //o
    .io_value    (timer_1_io_value[31:0]  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  StreamFifo streamfifo_1 (
    .io_push_valid      (RENABLE_1_regNext                  ), //i
    .io_push_ready      (streamfifo_1_io_push_ready         ), //o
    .io_push_payload    (RDATA[31:0]                        ), //i
    .io_pop_valid       (streamfifo_1_io_pop_valid          ), //o
    .io_pop_ready       (output_ready                       ), //i
    .io_pop_payload     (streamfifo_1_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                               ), //i
    .io_occupancy       (streamfifo_1_io_occupancy[6:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[6:0]  ), //o
    .clk                (clk                                ), //i
    .reset              (reset                              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_1_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_1_Send_Data : fsm_stateReg_string = "Send_Data ";
      fsm_enumDef_1_End_1 : fsm_stateReg_string = "End_1     ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_1_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_1_Send_Data : fsm_stateNext_string = "Send_Data ";
      fsm_enumDef_1_End_1 : fsm_stateNext_string = "End_1     ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign when_X300_SDAC_TX_l30 = (32'h000001f4 <= timer_1_io_value);
  always @(*) begin
    if(when_X300_SDAC_TX_l30) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
      end
      fsm_enumDef_1_Send_Data : begin
      end
      fsm_enumDef_1_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign RADDR = RADDR_1;
  assign RENABLE = RENABLE_1;
  assign output_payload_fragment = streamfifo_1_io_pop_payload;
  assign output_valid = streamfifo_1_io_pop_valid;
  assign output_fire = (output_valid && output_ready);
  assign output_payload_last = ((streamfifo_1_io_occupancy == 7'h01) && output_fire);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = fsm_enumDef_1_Send_Data;
        end
      end
      fsm_enumDef_1_Send_Data : begin
        if(when_X300_SDAC_TX_l54) begin
          fsm_stateNext = fsm_enumDef_1_End_1;
        end
      end
      fsm_enumDef_1_End_1 : begin
        fsm_stateNext = fsm_enumDef_1_Wait_Start;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_X300_SDAC_TX_l54 = (send_length == 8'h3f);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 8'h0;
      send_length <= 8'h0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 8'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 8'h0;
          end
        end
        fsm_enumDef_1_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 8'h04);
          send_length <= (send_length + 8'h01);
          if(when_X300_SDAC_TX_l54) begin
            RENABLE_1 <= 1'b0;
          end
        end
        fsm_enumDef_1_End_1 : begin
          send_length <= 8'h0;
          RENABLE_1 <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    RENABLE_1_regNext <= RENABLE_1;
  end


endmodule

module X300_RxSimpleBus (
  (* keep = "true" *) input               input_valid,
  (* keep = "true" *) output              input_ready,
  (* keep = "true" *) input               input_payload_last,
  (* keep = "true" *) input      [31:0]   input_payload_fragment,
  (* keep = "true" *) output     [7:0]    waddr,
  (* keep = "true" *) output     [31:0]   wdata,
  (* keep = "true" *) output              wenable,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Get_Header = 2'd1;
  localparam fsm_enumDef_Get_Data = 2'd2;

  wire       [9:0]    _zz_waddr;
  reg        [7:0]    waddr_1;
  reg        [31:0]   wdata_1;
  reg                 wenable_1;
  reg                 flag;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_X300_SDAC_RX_l67;
  wire                when_X300_SDAC_RX_l73;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_waddr = ({2'd0,waddr_1} <<< 2);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_Get_Header : fsm_stateReg_string = "Get_Header";
      fsm_enumDef_Get_Data : fsm_stateReg_string = "Get_Data  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_Get_Header : fsm_stateNext_string = "Get_Header";
      fsm_enumDef_Get_Data : fsm_stateNext_string = "Get_Data  ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Get_Header : begin
      end
      fsm_enumDef_Get_Data : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign waddr = _zz_waddr[7:0];
  assign wenable = wenable_1;
  assign wdata = wdata_1;
  assign input_ready = 1'b1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Get_Header : begin
        if(input_valid) begin
          fsm_stateNext = fsm_enumDef_Get_Data;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(when_X300_SDAC_RX_l67) begin
          fsm_stateNext = fsm_enumDef_Get_Header;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Get_Header;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_X300_SDAC_RX_l67 = (input_valid && input_payload_last);
  assign when_X300_SDAC_RX_l73 = (! flag);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      wenable_1 <= 1'b0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Get_Header : begin
        end
        fsm_enumDef_Get_Data : begin
          if(when_X300_SDAC_RX_l67) begin
            wenable_1 <= 1'b0;
          end else begin
            if(input_valid) begin
              wenable_1 <= 1'b1;
            end else begin
              wenable_1 <= 1'b0;
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_Get_Header : begin
        if(input_valid) begin
          waddr_1 <= input_payload_fragment[15 : 8];
          flag <= 1'b0;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(!when_X300_SDAC_RX_l67) begin
          if(input_valid) begin
            wdata_1 <= input_payload_fragment;
            if(when_X300_SDAC_RX_l73) begin
              flag <= 1'b1;
            end else begin
              waddr_1 <= (waddr_1 + 8'h01);
            end
          end
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module X300_RxPreamble (
  (* keep = "true" *) input               input_valid,
  (* keep = "true" *) output              input_ready,
  (* keep = "true" *) input               input_payload_last,
  (* keep = "true" *) input      [31:0]   input_payload_fragment,
  (* keep = "true" *) output reg          output_valid,
  (* keep = "true" *) input               output_ready,
  (* keep = "true" *) output              output_payload_last,
  (* keep = "true" *) output     [31:0]   output_payload_fragment,
  input               clk,
  input               reset
);

  wire       [63:0]   startDelimiter;
  wire                input_fire;
  wire                history_0_valid;
  wire                history_0_ready;
  wire                history_0_payload_last;
  wire       [31:0]   history_0_payload_fragment;
  wire                history_1_valid;
  wire                history_1_ready;
  wire                history_1_payload_last;
  wire       [31:0]   history_1_payload_fragment;
  wire                _zz_history_0_valid;
  wire                _zz_history_0_ready;
  wire                _zz_history_0_payload_last;
  wire       [31:0]   _zz_history_0_payload_fragment;
  reg                 _zz_history_1_valid;
  reg                 _zz_history_1_ready;
  reg                 _zz_history_1_payload_last;
  reg        [31:0]   _zz_history_1_payload_fragment;
  wire       [63:0]   historyDataCat;
  wire                hit;
  reg                 inFrame;
  wire                when_X300_SDAC_RX_l26;
  wire                when_X300_SDAC_RX_l33;

  assign startDelimiter = 64'h0000ffbc00000000;
  assign input_fire = (input_valid && input_ready);
  assign _zz_history_0_valid = input_valid;
  assign _zz_history_0_ready = input_ready;
  assign _zz_history_0_payload_last = input_payload_last;
  assign _zz_history_0_payload_fragment = input_payload_fragment;
  assign history_0_valid = _zz_history_0_valid;
  assign history_0_ready = _zz_history_0_ready;
  assign history_0_payload_last = _zz_history_0_payload_last;
  assign history_0_payload_fragment = _zz_history_0_payload_fragment;
  assign history_1_valid = _zz_history_1_valid;
  assign history_1_ready = _zz_history_1_ready;
  assign history_1_payload_last = _zz_history_1_payload_last;
  assign history_1_payload_fragment = _zz_history_1_payload_fragment;
  assign historyDataCat = {history_0_payload_fragment,history_1_payload_fragment};
  assign hit = ((history_0_valid && history_1_valid) && (historyDataCat == startDelimiter));
  always @(*) begin
    output_valid = 1'b0;
    if(!when_X300_SDAC_RX_l26) begin
      if(input_valid) begin
        output_valid = 1'b1;
      end
    end
  end

  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = ((! inFrame) || output_ready);
  assign output_payload_last = input_payload_last;
  assign when_X300_SDAC_RX_l26 = (! inFrame);
  assign when_X300_SDAC_RX_l33 = (output_ready && input_payload_last);
  always @(posedge clk) begin
    if(input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_X300_SDAC_RX_l26) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(input_valid) begin
          if(when_X300_SDAC_RX_l33) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  input               io_flush,
  output     [6:0]    io_occupancy,
  output     [6:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [5:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l946;
  wire       [5:0]    logic_ptrDif;
  (* ram_style = "block" *) reg [31:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h3f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h3f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l946 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l946) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


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
