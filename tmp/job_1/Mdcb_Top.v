// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Mdcb_Top
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Mdcb_Top (
  input               intput_valid,
  output              intput_ready,
  input               intput_payload_last,
  input      [31:0]   intput_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  output              AD5544_0_AD5544_CS,
  output              AD5544_0_AD5544_LDAC,
  output              AD5544_0_AD5544_MSB,
  output              AD5544_0_AD5544_RS,
  output              AD5544_0_AD5544_SCLK,
  output              AD5544_0_AD5544_SDIN,
  output              AD5544_1_AD5544_CS,
  output              AD5544_1_AD5544_LDAC,
  output              AD5544_1_AD5544_MSB,
  output              AD5544_1_AD5544_RS,
  output              AD5544_1_AD5544_SCLK,
  output              AD5544_1_AD5544_SDIN,
  output              AD5544_2_AD5544_CS,
  output              AD5544_2_AD5544_LDAC,
  output              AD5544_2_AD5544_MSB,
  output              AD5544_2_AD5544_RS,
  output              AD5544_2_AD5544_SCLK,
  output              AD5544_2_AD5544_SDIN,
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
  output              BISSC_0_enc_clk,
  input               BISSC_0_enc_data,
  output              BISSC_1_enc_clk,
  input               BISSC_1_enc_data,
  output              BISSC_2_enc_clk,
  input               BISSC_2_enc_data,
  output              BISSC_3_enc_clk,
  input               BISSC_3_enc_data,
  input               ENCODER_0_encoder_aphase,
  input               ENCODER_0_encoder_bphase,
  input               ENCODER_0_encoder_iphase,
  input               ENCODER_1_encoder_aphase,
  input               ENCODER_1_encoder_bphase,
  input               ENCODER_1_encoder_iphase,
  input               ENCODER_2_encoder_aphase,
  input               ENCODER_2_encoder_bphase,
  input               ENCODER_2_encoder_iphase,
  input               ENCODER_3_encoder_aphase,
  input               ENCODER_3_encoder_bphase,
  input               ENCODER_3_encoder_iphase,
  input      [7:0]    M_Fault_TTL,
  input      [15:0]   FPGA_DI,
  output     [7:0]    M_EN_TTL,
  output     [15:0]   FPGA_DO,
  input               clk,
  input               reset,
  input               clk_80M,
  input               clk_160M,
  input      [31:0]   slaveid,
  output     [15:0]   AD5544_DATA_0_0,
  output     [15:0]   AD5544_DATA_0_1,
  output     [15:0]   AD5544_DATA_0_2,
  output     [15:0]   AD5544_DATA_0_3,
  output     [15:0]   AD5544_DATA_1_0,
  output     [15:0]   AD5544_DATA_1_1,
  output     [15:0]   AD5544_DATA_1_2,
  output     [15:0]   AD5544_DATA_1_3,
  output     [15:0]   AD5544_DATA_2_0,
  output     [15:0]   AD5544_DATA_2_1,
  output     [15:0]   AD5544_DATA_2_2,
  output     [15:0]   AD5544_DATA_2_3,
  output              AD5544_TRIGER_0,
  output              AD5544_TRIGER_1,
  output              AD5544_TRIGER_2
);

  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_0;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_1;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_2;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_3;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_4;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_5;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_6;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_0_7;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_0;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_1;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_2;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_3;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_4;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_5;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_6;
  wire       [15:0]   mdcb_area_mdcbregif_AD7606_DATA_1_7;
  wire       [31:0]   mdcb_area_mdcbregif_BissC_Pos_0;
  wire       [31:0]   mdcb_area_mdcbregif_BissC_Pos_1;
  wire       [31:0]   mdcb_area_mdcbregif_BissC_Pos_2;
  wire       [31:0]   mdcb_area_mdcbregif_BissC_Pos_3;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Zero_Keep_0;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Zero_Keep_1;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Zero_Keep_2;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Zero_Keep_3;
  wire       [15:0]   mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN1;
  wire       [15:0]   mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN2;
  wire       [15:0]   mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN3;
  wire       [15:0]   mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN4;
  wire       [15:0]   mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN1;
  wire       [15:0]   mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN2;
  wire       [15:0]   mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN3;
  wire       [15:0]   mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN4;
  wire       [15:0]   mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN1;
  wire       [15:0]   mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN2;
  wire       [15:0]   mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN3;
  wire       [15:0]   mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN4;
  wire                mdcb_area_adda_area_encoder_0_encoder_clr_in;
  wire                mdcb_area_adda_area_encoder_1_encoder_clr_in;
  wire                mdcb_area_adda_area_encoder_2_encoder_clr_in;
  wire                mdcb_area_adda_area_encoder_3_encoder_clr_in;
  wire                mdcb_area_mdcbRxPreamble_input_ready;
  wire                mdcb_area_mdcbRxPreamble_output_valid;
  wire                mdcb_area_mdcbRxPreamble_output_payload_last;
  wire       [31:0]   mdcb_area_mdcbRxPreamble_output_payload_fragment;
  wire                mdcb_area_mdcbrxsimplebus_input_ready;
  wire       [8:0]    mdcb_area_mdcbrxsimplebus_waddr;
  wire       [31:0]   mdcb_area_mdcbrxsimplebus_wdata;
  wire                mdcb_area_mdcbrxsimplebus_wenable;
  wire                mdcb_area_mdcbtxsimplebus_output_valid;
  wire                mdcb_area_mdcbtxsimplebus_output_payload_last;
  wire       [31:0]   mdcb_area_mdcbtxsimplebus_output_payload_fragment;
  wire                mdcb_area_mdcbtxsimplebus_RENABLE;
  wire       [8:0]    mdcb_area_mdcbtxsimplebus_RADDR;
  wire       [31:0]   mdcb_area_mdcbregif_simplebus_RDATA;
  wire       [7:0]    mdcb_area_mdcbregif_M_EN_TTL;
  wire       [15:0]   mdcb_area_mdcbregif_FPGA_DO;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_0_0;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_0_1;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_0_2;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_0_3;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_1_0;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_1_1;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_1_2;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_1_3;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_2_0;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_2_1;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_2_2;
  wire       [15:0]   mdcb_area_mdcbregif_AD5544_DATA_2_3;
  wire                mdcb_area_mdcbregif_AD5544_TRIGER_0;
  wire                mdcb_area_mdcbregif_AD5544_TRIGER_1;
  wire                mdcb_area_mdcbregif_AD5544_TRIGER_2;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Clr_0;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Clr_1_1;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Clr_2_1;
  wire       [0:0]    mdcb_area_mdcbregif_Encoder_Clr_3_1;
  wire                mdcb_area_adda_area_ad5544_0_AD5544_CS;
  wire                mdcb_area_adda_area_ad5544_0_AD5544_LDAC;
  wire                mdcb_area_adda_area_ad5544_0_AD5544_MSB;
  wire                mdcb_area_adda_area_ad5544_0_AD5544_RS;
  wire                mdcb_area_adda_area_ad5544_0_AD5544_SCLK;
  wire                mdcb_area_adda_area_ad5544_0_AD5544_SDIN;
  wire                mdcb_area_adda_area_ad5544_1_AD5544_CS;
  wire                mdcb_area_adda_area_ad5544_1_AD5544_LDAC;
  wire                mdcb_area_adda_area_ad5544_1_AD5544_MSB;
  wire                mdcb_area_adda_area_ad5544_1_AD5544_RS;
  wire                mdcb_area_adda_area_ad5544_1_AD5544_SCLK;
  wire                mdcb_area_adda_area_ad5544_1_AD5544_SDIN;
  wire                mdcb_area_adda_area_ad5544_2_AD5544_CS;
  wire                mdcb_area_adda_area_ad5544_2_AD5544_LDAC;
  wire                mdcb_area_adda_area_ad5544_2_AD5544_MSB;
  wire                mdcb_area_adda_area_ad5544_2_AD5544_RS;
  wire                mdcb_area_adda_area_ad5544_2_AD5544_SCLK;
  wire                mdcb_area_adda_area_ad5544_2_AD5544_SDIN;
  wire       [2:0]    mdcb_area_adda_area_ad7606_0_ad_os;
  wire                mdcb_area_adda_area_ad7606_0_ad_cs;
  wire                mdcb_area_adda_area_ad7606_0_ad_rd;
  wire                mdcb_area_adda_area_ad7606_0_ad_reset;
  wire                mdcb_area_adda_area_ad7606_0_ad_convsta;
  wire                mdcb_area_adda_area_ad7606_0_ad_convstb;
  wire                mdcb_area_adda_area_ad7606_0_ad_range;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch1_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch2_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch3_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch4_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch5_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch6_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch7_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_0_ad_ch8_o;
  wire                mdcb_area_adda_area_ad7606_0_ad_data_valid_o;
  wire       [2:0]    mdcb_area_adda_area_ad7606_1_ad_os;
  wire                mdcb_area_adda_area_ad7606_1_ad_cs;
  wire                mdcb_area_adda_area_ad7606_1_ad_rd;
  wire                mdcb_area_adda_area_ad7606_1_ad_reset;
  wire                mdcb_area_adda_area_ad7606_1_ad_convsta;
  wire                mdcb_area_adda_area_ad7606_1_ad_convstb;
  wire                mdcb_area_adda_area_ad7606_1_ad_range;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch1_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch2_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch3_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch4_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch5_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch6_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch7_o;
  wire       [15:0]   mdcb_area_adda_area_ad7606_1_ad_ch8_o;
  wire                mdcb_area_adda_area_ad7606_1_ad_data_valid_o;
  wire                mdcb_area_adda_area_bissc_0_enc_clk;
  wire       [40:0]   mdcb_area_adda_area_bissc_0_enc_position_all;
  wire       [31:0]   mdcb_area_adda_area_bissc_0_enc_position_out;
  wire                mdcb_area_adda_area_bissc_0_erro_flag;
  wire                mdcb_area_adda_area_bissc_0_warn_flag;
  wire                mdcb_area_adda_area_bissc_0_crc_flag;
  wire                mdcb_area_adda_area_bissc_1_enc_clk;
  wire       [40:0]   mdcb_area_adda_area_bissc_1_enc_position_all;
  wire       [31:0]   mdcb_area_adda_area_bissc_1_enc_position_out;
  wire                mdcb_area_adda_area_bissc_1_erro_flag;
  wire                mdcb_area_adda_area_bissc_1_warn_flag;
  wire                mdcb_area_adda_area_bissc_1_crc_flag;
  wire                mdcb_area_adda_area_bissc_2_enc_clk;
  wire       [40:0]   mdcb_area_adda_area_bissc_2_enc_position_all;
  wire       [31:0]   mdcb_area_adda_area_bissc_2_enc_position_out;
  wire                mdcb_area_adda_area_bissc_2_erro_flag;
  wire                mdcb_area_adda_area_bissc_2_warn_flag;
  wire                mdcb_area_adda_area_bissc_2_crc_flag;
  wire                mdcb_area_adda_area_bissc_3_enc_clk;
  wire       [40:0]   mdcb_area_adda_area_bissc_3_enc_position_all;
  wire       [31:0]   mdcb_area_adda_area_bissc_3_enc_position_out;
  wire                mdcb_area_adda_area_bissc_3_erro_flag;
  wire                mdcb_area_adda_area_bissc_3_warn_flag;
  wire                mdcb_area_adda_area_bissc_3_crc_flag;
  wire       [31:0]   mdcb_area_adda_area_encoder_0_encoder_position_out;
  wire                mdcb_area_adda_area_encoder_0_encoder_iphase_out;
  wire       [31:0]   mdcb_area_adda_area_encoder_0_encoder_lock_pos;
  wire       [31:0]   mdcb_area_adda_area_encoder_1_encoder_position_out;
  wire                mdcb_area_adda_area_encoder_1_encoder_iphase_out;
  wire       [31:0]   mdcb_area_adda_area_encoder_1_encoder_lock_pos;
  wire       [31:0]   mdcb_area_adda_area_encoder_2_encoder_position_out;
  wire                mdcb_area_adda_area_encoder_2_encoder_iphase_out;
  wire       [31:0]   mdcb_area_adda_area_encoder_2_encoder_lock_pos;
  wire       [31:0]   mdcb_area_adda_area_encoder_3_encoder_position_out;
  wire                mdcb_area_adda_area_encoder_3_encoder_iphase_out;
  wire       [31:0]   mdcb_area_adda_area_encoder_3_encoder_lock_pos;
  wire       [7:0]    mdcb_area_mdcb_iofilter_M_Fault_TTL_Filter;
  wire       [15:0]   mdcb_area_mdcb_iofilter_FPGA_DI_Filter;

  MdcbRxPreamble mdcb_area_mdcbRxPreamble (
    .input_valid                (intput_valid                                            ), //i
    .input_ready                (mdcb_area_mdcbRxPreamble_input_ready                    ), //o
    .input_payload_last         (intput_payload_last                                     ), //i
    .input_payload_fragment     (intput_payload_fragment[31:0]                           ), //i
    .slave_id                   (slaveid[31:0]                                           ), //i
    .output_valid               (mdcb_area_mdcbRxPreamble_output_valid                   ), //o
    .output_ready               (mdcb_area_mdcbrxsimplebus_input_ready                   ), //i
    .output_payload_last        (mdcb_area_mdcbRxPreamble_output_payload_last            ), //o
    .output_payload_fragment    (mdcb_area_mdcbRxPreamble_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                                     ), //i
    .reset                      (reset                                                   )  //i
  );
  MdcbRxSimpleBus mdcb_area_mdcbrxsimplebus (
    .input_valid               (mdcb_area_mdcbRxPreamble_output_valid                   ), //i
    .input_ready               (mdcb_area_mdcbrxsimplebus_input_ready                   ), //o
    .input_payload_last        (mdcb_area_mdcbRxPreamble_output_payload_last            ), //i
    .input_payload_fragment    (mdcb_area_mdcbRxPreamble_output_payload_fragment[31:0]  ), //i
    .waddr                     (mdcb_area_mdcbrxsimplebus_waddr[8:0]                    ), //o
    .wdata                     (mdcb_area_mdcbrxsimplebus_wdata[31:0]                   ), //o
    .wenable                   (mdcb_area_mdcbrxsimplebus_wenable                       ), //o
    .clk                       (clk                                                     ), //i
    .reset                     (reset                                                   )  //i
  );
  MdcbTxSimpleBus mdcb_area_mdcbtxsimplebus (
    .output_valid               (mdcb_area_mdcbtxsimplebus_output_valid                   ), //o
    .output_ready               (output_ready                                             ), //i
    .output_payload_last        (mdcb_area_mdcbtxsimplebus_output_payload_last            ), //o
    .output_payload_fragment    (mdcb_area_mdcbtxsimplebus_output_payload_fragment[31:0]  ), //o
    .RENABLE                    (mdcb_area_mdcbtxsimplebus_RENABLE                        ), //o
    .RADDR                      (mdcb_area_mdcbtxsimplebus_RADDR[8:0]                     ), //o
    .RDATA                      (mdcb_area_mdcbregif_simplebus_RDATA[31:0]                ), //i
    .timer_tick                 (1'b1                                                     ), //i
    .clk                        (clk                                                      ), //i
    .reset                      (reset                                                    )  //i
  );
  Mdcb_Regif mdcb_area_mdcbregif (
    .simplebus_RADDR        (mdcb_area_mdcbtxsimplebus_RADDR[8:0]                      ), //i
    .simplebus_RDATA        (mdcb_area_mdcbregif_simplebus_RDATA[31:0]                 ), //o
    .simplebus_RENABLE      (mdcb_area_mdcbtxsimplebus_RENABLE                         ), //i
    .simplebus_WADDR        (mdcb_area_mdcbrxsimplebus_waddr[8:0]                      ), //i
    .simplebus_WDATA        (mdcb_area_mdcbrxsimplebus_wdata[31:0]                     ), //i
    .simplebus_WENABLE      (mdcb_area_mdcbrxsimplebus_wenable                         ), //i
    .slaveid                (slaveid[31:0]                                             ), //i
    .M_Fault_TTL_Filter     (mdcb_area_mdcb_iofilter_M_Fault_TTL_Filter[7:0]           ), //i
    .FPGA_DI_Filter         (mdcb_area_mdcb_iofilter_FPGA_DI_Filter[15:0]              ), //i
    .M_EN_TTL               (mdcb_area_mdcbregif_M_EN_TTL[7:0]                         ), //o
    .FPGA_DO                (mdcb_area_mdcbregif_FPGA_DO[15:0]                         ), //o
    .AD5544_DATA_0_0        (mdcb_area_mdcbregif_AD5544_DATA_0_0[15:0]                 ), //o
    .AD5544_DATA_0_1        (mdcb_area_mdcbregif_AD5544_DATA_0_1[15:0]                 ), //o
    .AD5544_DATA_0_2        (mdcb_area_mdcbregif_AD5544_DATA_0_2[15:0]                 ), //o
    .AD5544_DATA_0_3        (mdcb_area_mdcbregif_AD5544_DATA_0_3[15:0]                 ), //o
    .AD5544_DATA_1_0        (mdcb_area_mdcbregif_AD5544_DATA_1_0[15:0]                 ), //o
    .AD5544_DATA_1_1        (mdcb_area_mdcbregif_AD5544_DATA_1_1[15:0]                 ), //o
    .AD5544_DATA_1_2        (mdcb_area_mdcbregif_AD5544_DATA_1_2[15:0]                 ), //o
    .AD5544_DATA_1_3        (mdcb_area_mdcbregif_AD5544_DATA_1_3[15:0]                 ), //o
    .AD5544_DATA_2_0        (mdcb_area_mdcbregif_AD5544_DATA_2_0[15:0]                 ), //o
    .AD5544_DATA_2_1        (mdcb_area_mdcbregif_AD5544_DATA_2_1[15:0]                 ), //o
    .AD5544_DATA_2_2        (mdcb_area_mdcbregif_AD5544_DATA_2_2[15:0]                 ), //o
    .AD5544_DATA_2_3        (mdcb_area_mdcbregif_AD5544_DATA_2_3[15:0]                 ), //o
    .AD5544_TRIGER_0        (mdcb_area_mdcbregif_AD5544_TRIGER_0                       ), //o
    .AD5544_TRIGER_1        (mdcb_area_mdcbregif_AD5544_TRIGER_1                       ), //o
    .AD5544_TRIGER_2        (mdcb_area_mdcbregif_AD5544_TRIGER_2                       ), //o
    .AD7606_DATA_0_0        (mdcb_area_mdcbregif_AD7606_DATA_0_0[15:0]                 ), //i
    .AD7606_DATA_0_1        (mdcb_area_mdcbregif_AD7606_DATA_0_1[15:0]                 ), //i
    .AD7606_DATA_0_2        (mdcb_area_mdcbregif_AD7606_DATA_0_2[15:0]                 ), //i
    .AD7606_DATA_0_3        (mdcb_area_mdcbregif_AD7606_DATA_0_3[15:0]                 ), //i
    .AD7606_DATA_0_4        (mdcb_area_mdcbregif_AD7606_DATA_0_4[15:0]                 ), //i
    .AD7606_DATA_0_5        (mdcb_area_mdcbregif_AD7606_DATA_0_5[15:0]                 ), //i
    .AD7606_DATA_0_6        (mdcb_area_mdcbregif_AD7606_DATA_0_6[15:0]                 ), //i
    .AD7606_DATA_0_7        (mdcb_area_mdcbregif_AD7606_DATA_0_7[15:0]                 ), //i
    .AD7606_DATA_1_0        (mdcb_area_mdcbregif_AD7606_DATA_1_0[15:0]                 ), //i
    .AD7606_DATA_1_1        (mdcb_area_mdcbregif_AD7606_DATA_1_1[15:0]                 ), //i
    .AD7606_DATA_1_2        (mdcb_area_mdcbregif_AD7606_DATA_1_2[15:0]                 ), //i
    .AD7606_DATA_1_3        (mdcb_area_mdcbregif_AD7606_DATA_1_3[15:0]                 ), //i
    .AD7606_DATA_1_4        (mdcb_area_mdcbregif_AD7606_DATA_1_4[15:0]                 ), //i
    .AD7606_DATA_1_5        (mdcb_area_mdcbregif_AD7606_DATA_1_5[15:0]                 ), //i
    .AD7606_DATA_1_6        (mdcb_area_mdcbregif_AD7606_DATA_1_6[15:0]                 ), //i
    .AD7606_DATA_1_7        (mdcb_area_mdcbregif_AD7606_DATA_1_7[15:0]                 ), //i
    .BissC_Pos_0            (mdcb_area_mdcbregif_BissC_Pos_0[31:0]                     ), //i
    .BissC_Pos_1            (mdcb_area_mdcbregif_BissC_Pos_1[31:0]                     ), //i
    .BissC_Pos_2            (mdcb_area_mdcbregif_BissC_Pos_2[31:0]                     ), //i
    .BissC_Pos_3            (mdcb_area_mdcbregif_BissC_Pos_3[31:0]                     ), //i
    .Encoder_Pos_0          (mdcb_area_adda_area_encoder_0_encoder_position_out[31:0]  ), //i
    .Encoder_Pos_1          (mdcb_area_adda_area_encoder_1_encoder_position_out[31:0]  ), //i
    .Encoder_Pos_2          (mdcb_area_adda_area_encoder_2_encoder_position_out[31:0]  ), //i
    .Encoder_Pos_3          (mdcb_area_adda_area_encoder_3_encoder_position_out[31:0]  ), //i
    .Encoder_Zero_Keep_0    (mdcb_area_mdcbregif_Encoder_Zero_Keep_0                   ), //i
    .Encoder_Zero_Keep_1    (mdcb_area_mdcbregif_Encoder_Zero_Keep_1                   ), //i
    .Encoder_Zero_Keep_2    (mdcb_area_mdcbregif_Encoder_Zero_Keep_2                   ), //i
    .Encoder_Zero_Keep_3    (mdcb_area_mdcbregif_Encoder_Zero_Keep_3                   ), //i
    .Encoder_Clr_0          (mdcb_area_mdcbregif_Encoder_Clr_0                         ), //o
    .Encoder_Clr_1_1        (mdcb_area_mdcbregif_Encoder_Clr_1_1                       ), //o
    .Encoder_Clr_2_1        (mdcb_area_mdcbregif_Encoder_Clr_2_1                       ), //o
    .Encoder_Clr_3_1        (mdcb_area_mdcbregif_Encoder_Clr_3_1                       ), //o
    .Encoder_lock_Pos_0     (mdcb_area_adda_area_encoder_0_encoder_lock_pos[31:0]      ), //i
    .Encoder_lock_Pos_1     (mdcb_area_adda_area_encoder_1_encoder_lock_pos[31:0]      ), //i
    .Encoder_lock_Pos_2     (mdcb_area_adda_area_encoder_2_encoder_lock_pos[31:0]      ), //i
    .Encoder_lock_Pos_3     (mdcb_area_adda_area_encoder_3_encoder_lock_pos[31:0]      ), //i
    .clk                    (clk                                                       ), //i
    .reset                  (reset                                                     )  //i
  );
  dac_ad5544 mdcb_area_adda_area_ad5544_0 (
    .clk                (clk_80M                                             ), //i
    .reset              (reset                                               ), //i
    .AD5544_CS          (mdcb_area_adda_area_ad5544_0_AD5544_CS              ), //o
    .AD5544_LDAC        (mdcb_area_adda_area_ad5544_0_AD5544_LDAC            ), //o
    .AD5544_MSB         (mdcb_area_adda_area_ad5544_0_AD5544_MSB             ), //o
    .AD5544_RS          (mdcb_area_adda_area_ad5544_0_AD5544_RS              ), //o
    .AD5544_SCLK        (mdcb_area_adda_area_ad5544_0_AD5544_SCLK            ), //o
    .AD5544_SDIN        (mdcb_area_adda_area_ad5544_0_AD5544_SDIN            ), //o
    .ad5544_trig        (mdcb_area_mdcbregif_AD5544_TRIGER_0                 ), //i
    .AD5544_DATA_IN1    (mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN1[15:0]  ), //i
    .AD5544_DATA_IN2    (mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN2[15:0]  ), //i
    .AD5544_DATA_IN3    (mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN3[15:0]  ), //i
    .AD5544_DATA_IN4    (mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN4[15:0]  )  //i
  );
  dac_ad5544 mdcb_area_adda_area_ad5544_1 (
    .clk                (clk_80M                                             ), //i
    .reset              (reset                                               ), //i
    .AD5544_CS          (mdcb_area_adda_area_ad5544_1_AD5544_CS              ), //o
    .AD5544_LDAC        (mdcb_area_adda_area_ad5544_1_AD5544_LDAC            ), //o
    .AD5544_MSB         (mdcb_area_adda_area_ad5544_1_AD5544_MSB             ), //o
    .AD5544_RS          (mdcb_area_adda_area_ad5544_1_AD5544_RS              ), //o
    .AD5544_SCLK        (mdcb_area_adda_area_ad5544_1_AD5544_SCLK            ), //o
    .AD5544_SDIN        (mdcb_area_adda_area_ad5544_1_AD5544_SDIN            ), //o
    .ad5544_trig        (mdcb_area_mdcbregif_AD5544_TRIGER_1                 ), //i
    .AD5544_DATA_IN1    (mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN1[15:0]  ), //i
    .AD5544_DATA_IN2    (mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN2[15:0]  ), //i
    .AD5544_DATA_IN3    (mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN3[15:0]  ), //i
    .AD5544_DATA_IN4    (mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN4[15:0]  )  //i
  );
  dac_ad5544 mdcb_area_adda_area_ad5544_2 (
    .clk                (clk_80M                                             ), //i
    .reset              (reset                                               ), //i
    .AD5544_CS          (mdcb_area_adda_area_ad5544_2_AD5544_CS              ), //o
    .AD5544_LDAC        (mdcb_area_adda_area_ad5544_2_AD5544_LDAC            ), //o
    .AD5544_MSB         (mdcb_area_adda_area_ad5544_2_AD5544_MSB             ), //o
    .AD5544_RS          (mdcb_area_adda_area_ad5544_2_AD5544_RS              ), //o
    .AD5544_SCLK        (mdcb_area_adda_area_ad5544_2_AD5544_SCLK            ), //o
    .AD5544_SDIN        (mdcb_area_adda_area_ad5544_2_AD5544_SDIN            ), //o
    .ad5544_trig        (mdcb_area_mdcbregif_AD5544_TRIGER_2                 ), //i
    .AD5544_DATA_IN1    (mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN1[15:0]  ), //i
    .AD5544_DATA_IN2    (mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN2[15:0]  ), //i
    .AD5544_DATA_IN3    (mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN3[15:0]  ), //i
    .AD5544_DATA_IN4    (mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN4[15:0]  )  //i
  );
  AD7606_DATA mdcb_area_adda_area_ad7606_0 (
    .clk                (clk_80M                                       ), //i
    .reset              (reset                                         ), //i
    .sample_en          (1'b1                                          ), //i
    .ad_data            (AD7606_0_ad_data[15:0]                        ), //i
    .ad_busy            (AD7606_0_ad_busy                              ), //i
    .first_data         (AD7606_0_first_data                           ), //i
    .ad_os              (mdcb_area_adda_area_ad7606_0_ad_os[2:0]       ), //o
    .ad_cs              (mdcb_area_adda_area_ad7606_0_ad_cs            ), //o
    .ad_rd              (mdcb_area_adda_area_ad7606_0_ad_rd            ), //o
    .ad_reset           (mdcb_area_adda_area_ad7606_0_ad_reset         ), //o
    .ad_convsta         (mdcb_area_adda_area_ad7606_0_ad_convsta       ), //o
    .ad_convstb         (mdcb_area_adda_area_ad7606_0_ad_convstb       ), //o
    .ad_range           (mdcb_area_adda_area_ad7606_0_ad_range         ), //o
    .ad_ch1_o           (mdcb_area_adda_area_ad7606_0_ad_ch1_o[15:0]   ), //o
    .ad_ch2_o           (mdcb_area_adda_area_ad7606_0_ad_ch2_o[15:0]   ), //o
    .ad_ch3_o           (mdcb_area_adda_area_ad7606_0_ad_ch3_o[15:0]   ), //o
    .ad_ch4_o           (mdcb_area_adda_area_ad7606_0_ad_ch4_o[15:0]   ), //o
    .ad_ch5_o           (mdcb_area_adda_area_ad7606_0_ad_ch5_o[15:0]   ), //o
    .ad_ch6_o           (mdcb_area_adda_area_ad7606_0_ad_ch6_o[15:0]   ), //o
    .ad_ch7_o           (mdcb_area_adda_area_ad7606_0_ad_ch7_o[15:0]   ), //o
    .ad_ch8_o           (mdcb_area_adda_area_ad7606_0_ad_ch8_o[15:0]   ), //o
    .ad_data_valid_o    (mdcb_area_adda_area_ad7606_0_ad_data_valid_o  )  //o
  );
  AD7606_DATA mdcb_area_adda_area_ad7606_1 (
    .clk                (clk_80M                                       ), //i
    .reset              (reset                                         ), //i
    .sample_en          (1'b1                                          ), //i
    .ad_data            (AD7606_1_ad_data[15:0]                        ), //i
    .ad_busy            (AD7606_1_ad_busy                              ), //i
    .first_data         (AD7606_1_first_data                           ), //i
    .ad_os              (mdcb_area_adda_area_ad7606_1_ad_os[2:0]       ), //o
    .ad_cs              (mdcb_area_adda_area_ad7606_1_ad_cs            ), //o
    .ad_rd              (mdcb_area_adda_area_ad7606_1_ad_rd            ), //o
    .ad_reset           (mdcb_area_adda_area_ad7606_1_ad_reset         ), //o
    .ad_convsta         (mdcb_area_adda_area_ad7606_1_ad_convsta       ), //o
    .ad_convstb         (mdcb_area_adda_area_ad7606_1_ad_convstb       ), //o
    .ad_range           (mdcb_area_adda_area_ad7606_1_ad_range         ), //o
    .ad_ch1_o           (mdcb_area_adda_area_ad7606_1_ad_ch1_o[15:0]   ), //o
    .ad_ch2_o           (mdcb_area_adda_area_ad7606_1_ad_ch2_o[15:0]   ), //o
    .ad_ch3_o           (mdcb_area_adda_area_ad7606_1_ad_ch3_o[15:0]   ), //o
    .ad_ch4_o           (mdcb_area_adda_area_ad7606_1_ad_ch4_o[15:0]   ), //o
    .ad_ch5_o           (mdcb_area_adda_area_ad7606_1_ad_ch5_o[15:0]   ), //o
    .ad_ch6_o           (mdcb_area_adda_area_ad7606_1_ad_ch6_o[15:0]   ), //o
    .ad_ch7_o           (mdcb_area_adda_area_ad7606_1_ad_ch7_o[15:0]   ), //o
    .ad_ch8_o           (mdcb_area_adda_area_ad7606_1_ad_ch8_o[15:0]   ), //o
    .ad_data_valid_o    (mdcb_area_adda_area_ad7606_1_ad_data_valid_o  )  //o
  );
  BISS_Position mdcb_area_adda_area_bissc_0 (
    .clk                 (clk_80M                                             ), //i
    .reset               (reset                                               ), //i
    .enc_data            (BISSC_0_enc_data                                    ), //i
    .sample_en           (1'b1                                                ), //i
    .enc_clk             (mdcb_area_adda_area_bissc_0_enc_clk                 ), //o
    .enc_position_all    (mdcb_area_adda_area_bissc_0_enc_position_all[40:0]  ), //o
    .enc_position_out    (mdcb_area_adda_area_bissc_0_enc_position_out[31:0]  ), //o
    .erro_flag           (mdcb_area_adda_area_bissc_0_erro_flag               ), //o
    .warn_flag           (mdcb_area_adda_area_bissc_0_warn_flag               ), //o
    .crc_flag            (mdcb_area_adda_area_bissc_0_crc_flag                )  //o
  );
  BISS_Position mdcb_area_adda_area_bissc_1 (
    .clk                 (clk_80M                                             ), //i
    .reset               (reset                                               ), //i
    .enc_data            (BISSC_1_enc_data                                    ), //i
    .sample_en           (1'b1                                                ), //i
    .enc_clk             (mdcb_area_adda_area_bissc_1_enc_clk                 ), //o
    .enc_position_all    (mdcb_area_adda_area_bissc_1_enc_position_all[40:0]  ), //o
    .enc_position_out    (mdcb_area_adda_area_bissc_1_enc_position_out[31:0]  ), //o
    .erro_flag           (mdcb_area_adda_area_bissc_1_erro_flag               ), //o
    .warn_flag           (mdcb_area_adda_area_bissc_1_warn_flag               ), //o
    .crc_flag            (mdcb_area_adda_area_bissc_1_crc_flag                )  //o
  );
  BISS_Position mdcb_area_adda_area_bissc_2 (
    .clk                 (clk_80M                                             ), //i
    .reset               (reset                                               ), //i
    .enc_data            (BISSC_2_enc_data                                    ), //i
    .sample_en           (1'b1                                                ), //i
    .enc_clk             (mdcb_area_adda_area_bissc_2_enc_clk                 ), //o
    .enc_position_all    (mdcb_area_adda_area_bissc_2_enc_position_all[40:0]  ), //o
    .enc_position_out    (mdcb_area_adda_area_bissc_2_enc_position_out[31:0]  ), //o
    .erro_flag           (mdcb_area_adda_area_bissc_2_erro_flag               ), //o
    .warn_flag           (mdcb_area_adda_area_bissc_2_warn_flag               ), //o
    .crc_flag            (mdcb_area_adda_area_bissc_2_crc_flag                )  //o
  );
  BISS_Position mdcb_area_adda_area_bissc_3 (
    .clk                 (clk_80M                                             ), //i
    .reset               (reset                                               ), //i
    .enc_data            (BISSC_3_enc_data                                    ), //i
    .sample_en           (1'b1                                                ), //i
    .enc_clk             (mdcb_area_adda_area_bissc_3_enc_clk                 ), //o
    .enc_position_all    (mdcb_area_adda_area_bissc_3_enc_position_all[40:0]  ), //o
    .enc_position_out    (mdcb_area_adda_area_bissc_3_enc_position_out[31:0]  ), //o
    .erro_flag           (mdcb_area_adda_area_bissc_3_erro_flag               ), //o
    .warn_flag           (mdcb_area_adda_area_bissc_3_warn_flag               ), //o
    .crc_flag            (mdcb_area_adda_area_bissc_3_crc_flag                )  //o
  );
  Encoder_Top mdcb_area_adda_area_encoder_0 (
    .clk                                (clk_80M                                                   ), //i
    .reset                              (reset                                                     ), //i
    .clk_160M                           (clk_160M                                                  ), //i
    .encoderinterface_encoder_aphase    (ENCODER_0_encoder_aphase                                  ), //i
    .encoderinterface_encoder_bphase    (ENCODER_0_encoder_bphase                                  ), //i
    .encoderinterface_encoder_iphase    (ENCODER_0_encoder_iphase                                  ), //i
    .encoder_position_out               (mdcb_area_adda_area_encoder_0_encoder_position_out[31:0]  ), //o
    .encoder_clr_in                     (mdcb_area_adda_area_encoder_0_encoder_clr_in              ), //i
    .encoder_iphase_out                 (mdcb_area_adda_area_encoder_0_encoder_iphase_out          ), //o
    .encoder_lock_pos                   (mdcb_area_adda_area_encoder_0_encoder_lock_pos[31:0]      )  //o
  );
  Encoder_Top mdcb_area_adda_area_encoder_1 (
    .clk                                (clk_80M                                                   ), //i
    .reset                              (reset                                                     ), //i
    .clk_160M                           (clk_160M                                                  ), //i
    .encoderinterface_encoder_aphase    (ENCODER_1_encoder_aphase                                  ), //i
    .encoderinterface_encoder_bphase    (ENCODER_1_encoder_bphase                                  ), //i
    .encoderinterface_encoder_iphase    (ENCODER_1_encoder_iphase                                  ), //i
    .encoder_position_out               (mdcb_area_adda_area_encoder_1_encoder_position_out[31:0]  ), //o
    .encoder_clr_in                     (mdcb_area_adda_area_encoder_1_encoder_clr_in              ), //i
    .encoder_iphase_out                 (mdcb_area_adda_area_encoder_1_encoder_iphase_out          ), //o
    .encoder_lock_pos                   (mdcb_area_adda_area_encoder_1_encoder_lock_pos[31:0]      )  //o
  );
  Encoder_Top mdcb_area_adda_area_encoder_2 (
    .clk                                (clk_80M                                                   ), //i
    .reset                              (reset                                                     ), //i
    .clk_160M                           (clk_160M                                                  ), //i
    .encoderinterface_encoder_aphase    (ENCODER_2_encoder_aphase                                  ), //i
    .encoderinterface_encoder_bphase    (ENCODER_2_encoder_bphase                                  ), //i
    .encoderinterface_encoder_iphase    (ENCODER_2_encoder_iphase                                  ), //i
    .encoder_position_out               (mdcb_area_adda_area_encoder_2_encoder_position_out[31:0]  ), //o
    .encoder_clr_in                     (mdcb_area_adda_area_encoder_2_encoder_clr_in              ), //i
    .encoder_iphase_out                 (mdcb_area_adda_area_encoder_2_encoder_iphase_out          ), //o
    .encoder_lock_pos                   (mdcb_area_adda_area_encoder_2_encoder_lock_pos[31:0]      )  //o
  );
  Encoder_Top mdcb_area_adda_area_encoder_3 (
    .clk                                (clk_80M                                                   ), //i
    .reset                              (reset                                                     ), //i
    .clk_160M                           (clk_160M                                                  ), //i
    .encoderinterface_encoder_aphase    (ENCODER_3_encoder_aphase                                  ), //i
    .encoderinterface_encoder_bphase    (ENCODER_3_encoder_bphase                                  ), //i
    .encoderinterface_encoder_iphase    (ENCODER_3_encoder_iphase                                  ), //i
    .encoder_position_out               (mdcb_area_adda_area_encoder_3_encoder_position_out[31:0]  ), //o
    .encoder_clr_in                     (mdcb_area_adda_area_encoder_3_encoder_clr_in              ), //i
    .encoder_iphase_out                 (mdcb_area_adda_area_encoder_3_encoder_iphase_out          ), //o
    .encoder_lock_pos                   (mdcb_area_adda_area_encoder_3_encoder_lock_pos[31:0]      )  //o
  );
  Mdcb_Ioin_Filter mdcb_area_mdcb_iofilter (
    .M_Fault_TTL           (M_Fault_TTL[7:0]                                 ), //i
    .FPGA_DI               (FPGA_DI[15:0]                                    ), //i
    .M_Fault_TTL_Filter    (mdcb_area_mdcb_iofilter_M_Fault_TTL_Filter[7:0]  ), //o
    .FPGA_DI_Filter        (mdcb_area_mdcb_iofilter_FPGA_DI_Filter[15:0]     ), //o
    .clk                   (clk                                              ), //i
    .reset                 (reset                                            )  //i
  );
  assign intput_ready = mdcb_area_mdcbRxPreamble_input_ready;
  assign output_valid = mdcb_area_mdcbtxsimplebus_output_valid;
  assign output_payload_last = mdcb_area_mdcbtxsimplebus_output_payload_last;
  assign output_payload_fragment = mdcb_area_mdcbtxsimplebus_output_payload_fragment;
  assign AD5544_TRIGER_0 = mdcb_area_mdcbregif_AD5544_TRIGER_0;
  assign AD5544_DATA_0_0 = mdcb_area_mdcbregif_AD5544_DATA_0_0;
  assign AD5544_DATA_0_1 = mdcb_area_mdcbregif_AD5544_DATA_0_1;
  assign AD5544_DATA_0_2 = mdcb_area_mdcbregif_AD5544_DATA_0_2;
  assign AD5544_DATA_0_3 = mdcb_area_mdcbregif_AD5544_DATA_0_3;
  assign AD5544_TRIGER_1 = mdcb_area_mdcbregif_AD5544_TRIGER_1;
  assign AD5544_DATA_1_0 = mdcb_area_mdcbregif_AD5544_DATA_1_0;
  assign AD5544_DATA_1_1 = mdcb_area_mdcbregif_AD5544_DATA_1_1;
  assign AD5544_DATA_1_2 = mdcb_area_mdcbregif_AD5544_DATA_1_2;
  assign AD5544_DATA_1_3 = mdcb_area_mdcbregif_AD5544_DATA_1_3;
  assign AD5544_TRIGER_2 = mdcb_area_mdcbregif_AD5544_TRIGER_2;
  assign AD5544_DATA_2_0 = mdcb_area_mdcbregif_AD5544_DATA_2_0;
  assign AD5544_DATA_2_1 = mdcb_area_mdcbregif_AD5544_DATA_2_1;
  assign AD5544_DATA_2_2 = mdcb_area_mdcbregif_AD5544_DATA_2_2;
  assign AD5544_DATA_2_3 = mdcb_area_mdcbregif_AD5544_DATA_2_3;
  assign AD5544_0_AD5544_SCLK = mdcb_area_adda_area_ad5544_0_AD5544_SCLK;
  assign AD5544_0_AD5544_CS = mdcb_area_adda_area_ad5544_0_AD5544_CS;
  assign AD5544_0_AD5544_LDAC = mdcb_area_adda_area_ad5544_0_AD5544_LDAC;
  assign AD5544_0_AD5544_RS = mdcb_area_adda_area_ad5544_0_AD5544_RS;
  assign AD5544_0_AD5544_SDIN = mdcb_area_adda_area_ad5544_0_AD5544_SDIN;
  assign AD5544_0_AD5544_MSB = mdcb_area_adda_area_ad5544_0_AD5544_MSB;
  assign mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN1 = mdcb_area_mdcbregif_AD5544_DATA_0_0;
  assign mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN2 = mdcb_area_mdcbregif_AD5544_DATA_0_1;
  assign mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN3 = mdcb_area_mdcbregif_AD5544_DATA_0_2;
  assign mdcb_area_adda_area_ad5544_0_AD5544_DATA_IN4 = mdcb_area_mdcbregif_AD5544_DATA_0_3;
  assign AD5544_1_AD5544_SCLK = mdcb_area_adda_area_ad5544_1_AD5544_SCLK;
  assign AD5544_1_AD5544_CS = mdcb_area_adda_area_ad5544_1_AD5544_CS;
  assign AD5544_1_AD5544_LDAC = mdcb_area_adda_area_ad5544_1_AD5544_LDAC;
  assign AD5544_1_AD5544_RS = mdcb_area_adda_area_ad5544_1_AD5544_RS;
  assign AD5544_1_AD5544_SDIN = mdcb_area_adda_area_ad5544_1_AD5544_SDIN;
  assign AD5544_1_AD5544_MSB = mdcb_area_adda_area_ad5544_1_AD5544_MSB;
  assign mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN1 = mdcb_area_mdcbregif_AD5544_DATA_1_0;
  assign mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN2 = mdcb_area_mdcbregif_AD5544_DATA_1_1;
  assign mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN3 = mdcb_area_mdcbregif_AD5544_DATA_1_2;
  assign mdcb_area_adda_area_ad5544_1_AD5544_DATA_IN4 = mdcb_area_mdcbregif_AD5544_DATA_1_3;
  assign AD5544_2_AD5544_SCLK = mdcb_area_adda_area_ad5544_2_AD5544_SCLK;
  assign AD5544_2_AD5544_CS = mdcb_area_adda_area_ad5544_2_AD5544_CS;
  assign AD5544_2_AD5544_LDAC = mdcb_area_adda_area_ad5544_2_AD5544_LDAC;
  assign AD5544_2_AD5544_RS = mdcb_area_adda_area_ad5544_2_AD5544_RS;
  assign AD5544_2_AD5544_SDIN = mdcb_area_adda_area_ad5544_2_AD5544_SDIN;
  assign AD5544_2_AD5544_MSB = mdcb_area_adda_area_ad5544_2_AD5544_MSB;
  assign mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN1 = mdcb_area_mdcbregif_AD5544_DATA_2_0;
  assign mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN2 = mdcb_area_mdcbregif_AD5544_DATA_2_1;
  assign mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN3 = mdcb_area_mdcbregif_AD5544_DATA_2_2;
  assign mdcb_area_adda_area_ad5544_2_AD5544_DATA_IN4 = mdcb_area_mdcbregif_AD5544_DATA_2_3;
  assign AD7606_0_ad_cs = mdcb_area_adda_area_ad7606_0_ad_cs;
  assign AD7606_0_ad_os = mdcb_area_adda_area_ad7606_0_ad_os;
  assign AD7606_0_ad_rd = mdcb_area_adda_area_ad7606_0_ad_rd;
  assign AD7606_0_ad_convsta = mdcb_area_adda_area_ad7606_0_ad_convsta;
  assign AD7606_0_ad_convstb = mdcb_area_adda_area_ad7606_0_ad_convstb;
  assign AD7606_0_ad_reset = mdcb_area_adda_area_ad7606_0_ad_reset;
  assign AD7606_0_ad_range = mdcb_area_adda_area_ad7606_0_ad_range;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_0 = mdcb_area_adda_area_ad7606_0_ad_ch1_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_1 = mdcb_area_adda_area_ad7606_0_ad_ch2_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_2 = mdcb_area_adda_area_ad7606_0_ad_ch3_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_3 = mdcb_area_adda_area_ad7606_0_ad_ch4_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_4 = mdcb_area_adda_area_ad7606_0_ad_ch5_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_5 = mdcb_area_adda_area_ad7606_0_ad_ch6_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_6 = mdcb_area_adda_area_ad7606_0_ad_ch7_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_0_7 = mdcb_area_adda_area_ad7606_0_ad_ch8_o;
  assign AD7606_1_ad_cs = mdcb_area_adda_area_ad7606_1_ad_cs;
  assign AD7606_1_ad_os = mdcb_area_adda_area_ad7606_1_ad_os;
  assign AD7606_1_ad_rd = mdcb_area_adda_area_ad7606_1_ad_rd;
  assign AD7606_1_ad_convsta = mdcb_area_adda_area_ad7606_1_ad_convsta;
  assign AD7606_1_ad_convstb = mdcb_area_adda_area_ad7606_1_ad_convstb;
  assign AD7606_1_ad_reset = mdcb_area_adda_area_ad7606_1_ad_reset;
  assign AD7606_1_ad_range = mdcb_area_adda_area_ad7606_1_ad_range;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_0 = mdcb_area_adda_area_ad7606_1_ad_ch1_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_1 = mdcb_area_adda_area_ad7606_1_ad_ch2_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_2 = mdcb_area_adda_area_ad7606_1_ad_ch3_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_3 = mdcb_area_adda_area_ad7606_1_ad_ch4_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_4 = mdcb_area_adda_area_ad7606_1_ad_ch5_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_5 = mdcb_area_adda_area_ad7606_1_ad_ch6_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_6 = mdcb_area_adda_area_ad7606_1_ad_ch7_o;
  assign mdcb_area_mdcbregif_AD7606_DATA_1_7 = mdcb_area_adda_area_ad7606_1_ad_ch8_o;
  assign BISSC_0_enc_clk = mdcb_area_adda_area_bissc_0_enc_clk;
  assign mdcb_area_mdcbregif_BissC_Pos_0 = mdcb_area_adda_area_bissc_0_enc_position_out;
  assign BISSC_1_enc_clk = mdcb_area_adda_area_bissc_1_enc_clk;
  assign mdcb_area_mdcbregif_BissC_Pos_1 = mdcb_area_adda_area_bissc_1_enc_position_out;
  assign BISSC_2_enc_clk = mdcb_area_adda_area_bissc_2_enc_clk;
  assign mdcb_area_mdcbregif_BissC_Pos_2 = mdcb_area_adda_area_bissc_2_enc_position_out;
  assign BISSC_3_enc_clk = mdcb_area_adda_area_bissc_3_enc_clk;
  assign mdcb_area_mdcbregif_BissC_Pos_3 = mdcb_area_adda_area_bissc_3_enc_position_out;
  assign mdcb_area_adda_area_encoder_0_encoder_clr_in = mdcb_area_mdcbregif_Encoder_Clr_0[0];
  assign mdcb_area_mdcbregif_Encoder_Zero_Keep_0 = mdcb_area_adda_area_encoder_0_encoder_iphase_out;
  assign mdcb_area_adda_area_encoder_1_encoder_clr_in = mdcb_area_mdcbregif_Encoder_Clr_1_1[0];
  assign mdcb_area_mdcbregif_Encoder_Zero_Keep_1 = mdcb_area_adda_area_encoder_1_encoder_iphase_out;
  assign mdcb_area_adda_area_encoder_2_encoder_clr_in = mdcb_area_mdcbregif_Encoder_Clr_2_1[0];
  assign mdcb_area_mdcbregif_Encoder_Zero_Keep_2 = mdcb_area_adda_area_encoder_2_encoder_iphase_out;
  assign mdcb_area_adda_area_encoder_3_encoder_clr_in = mdcb_area_mdcbregif_Encoder_Clr_3_1[0];
  assign mdcb_area_mdcbregif_Encoder_Zero_Keep_3 = mdcb_area_adda_area_encoder_3_encoder_iphase_out;
  assign M_EN_TTL = mdcb_area_mdcbregif_M_EN_TTL;
  assign FPGA_DO = mdcb_area_mdcbregif_FPGA_DO;

endmodule

module Mdcb_Ioin_Filter (
  input      [7:0]    M_Fault_TTL,
  input      [15:0]   FPGA_DI,
  output     [7:0]    M_Fault_TTL_Filter,
  output     [15:0]   FPGA_DI_Filter,
  input               clk,
  input               reset
);

  wire                io_filter_0_io_in;
  wire                io_filter_1_io_in;
  wire                io_filter_2_io_in;
  wire                io_filter_3_io_in;
  wire                io_filter_4_io_in;
  wire                io_filter_5_io_in;
  wire                io_filter_6_io_in;
  wire                io_filter_7_io_in;
  wire                io_filter_8_io_in;
  wire                io_filter_9_io_in;
  wire                io_filter_10_io_in;
  wire                io_filter_11_io_in;
  wire                io_filter_12_io_in;
  wire                io_filter_13_io_in;
  wire                io_filter_14_io_in;
  wire                io_filter_15_io_in;
  wire                io_filter_16_io_in;
  wire                io_filter_17_io_in;
  wire                io_filter_18_io_in;
  wire                io_filter_19_io_in;
  wire                io_filter_20_io_in;
  wire                io_filter_21_io_in;
  wire                io_filter_22_io_in;
  wire                io_filter_23_io_in;
  wire                io_filter_0_io_out;
  wire                io_filter_1_io_out;
  wire                io_filter_2_io_out;
  wire                io_filter_3_io_out;
  wire                io_filter_4_io_out;
  wire                io_filter_5_io_out;
  wire                io_filter_6_io_out;
  wire                io_filter_7_io_out;
  wire                io_filter_8_io_out;
  wire                io_filter_9_io_out;
  wire                io_filter_10_io_out;
  wire                io_filter_11_io_out;
  wire                io_filter_12_io_out;
  wire                io_filter_13_io_out;
  wire                io_filter_14_io_out;
  wire                io_filter_15_io_out;
  wire                io_filter_16_io_out;
  wire                io_filter_17_io_out;
  wire                io_filter_18_io_out;
  wire                io_filter_19_io_out;
  wire                io_filter_20_io_out;
  wire                io_filter_21_io_out;
  wire                io_filter_22_io_out;
  wire                io_filter_23_io_out;
  reg        [7:0]    M_Fault_TTL_Filter_1;
  reg        [15:0]   FPGA_DI_Filter_1;

  IoFilter io_filter_0 (
    .io_in     (io_filter_0_io_in   ), //i
    .io_out    (io_filter_0_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_1 (
    .io_in     (io_filter_1_io_in   ), //i
    .io_out    (io_filter_1_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_2 (
    .io_in     (io_filter_2_io_in   ), //i
    .io_out    (io_filter_2_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_3 (
    .io_in     (io_filter_3_io_in   ), //i
    .io_out    (io_filter_3_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_4 (
    .io_in     (io_filter_4_io_in   ), //i
    .io_out    (io_filter_4_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_5 (
    .io_in     (io_filter_5_io_in   ), //i
    .io_out    (io_filter_5_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_6 (
    .io_in     (io_filter_6_io_in   ), //i
    .io_out    (io_filter_6_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_7 (
    .io_in     (io_filter_7_io_in   ), //i
    .io_out    (io_filter_7_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_8 (
    .io_in     (io_filter_8_io_in   ), //i
    .io_out    (io_filter_8_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_9 (
    .io_in     (io_filter_9_io_in   ), //i
    .io_out    (io_filter_9_io_out  ), //o
    .clk       (clk                 ), //i
    .reset     (reset               )  //i
  );
  IoFilter io_filter_10 (
    .io_in     (io_filter_10_io_in   ), //i
    .io_out    (io_filter_10_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_11 (
    .io_in     (io_filter_11_io_in   ), //i
    .io_out    (io_filter_11_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_12 (
    .io_in     (io_filter_12_io_in   ), //i
    .io_out    (io_filter_12_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_13 (
    .io_in     (io_filter_13_io_in   ), //i
    .io_out    (io_filter_13_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_14 (
    .io_in     (io_filter_14_io_in   ), //i
    .io_out    (io_filter_14_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_15 (
    .io_in     (io_filter_15_io_in   ), //i
    .io_out    (io_filter_15_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_16 (
    .io_in     (io_filter_16_io_in   ), //i
    .io_out    (io_filter_16_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_17 (
    .io_in     (io_filter_17_io_in   ), //i
    .io_out    (io_filter_17_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_18 (
    .io_in     (io_filter_18_io_in   ), //i
    .io_out    (io_filter_18_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_19 (
    .io_in     (io_filter_19_io_in   ), //i
    .io_out    (io_filter_19_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_20 (
    .io_in     (io_filter_20_io_in   ), //i
    .io_out    (io_filter_20_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_21 (
    .io_in     (io_filter_21_io_in   ), //i
    .io_out    (io_filter_21_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_22 (
    .io_in     (io_filter_22_io_in   ), //i
    .io_out    (io_filter_22_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  IoFilter io_filter_23 (
    .io_in     (io_filter_23_io_in   ), //i
    .io_out    (io_filter_23_io_out  ), //o
    .clk       (clk                  ), //i
    .reset     (reset                )  //i
  );
  assign io_filter_0_io_in = M_Fault_TTL[0];
  assign io_filter_1_io_in = M_Fault_TTL[1];
  assign io_filter_2_io_in = M_Fault_TTL[2];
  assign io_filter_3_io_in = M_Fault_TTL[3];
  assign io_filter_4_io_in = M_Fault_TTL[4];
  assign io_filter_5_io_in = M_Fault_TTL[5];
  assign io_filter_6_io_in = M_Fault_TTL[6];
  assign io_filter_7_io_in = M_Fault_TTL[7];
  assign M_Fault_TTL_Filter = M_Fault_TTL_Filter_1;
  assign io_filter_8_io_in = FPGA_DI[0];
  assign io_filter_9_io_in = FPGA_DI[1];
  assign io_filter_10_io_in = FPGA_DI[2];
  assign io_filter_11_io_in = FPGA_DI[3];
  assign io_filter_12_io_in = FPGA_DI[4];
  assign io_filter_13_io_in = FPGA_DI[5];
  assign io_filter_14_io_in = FPGA_DI[6];
  assign io_filter_15_io_in = FPGA_DI[7];
  assign io_filter_16_io_in = FPGA_DI[8];
  assign io_filter_17_io_in = FPGA_DI[9];
  assign io_filter_18_io_in = FPGA_DI[10];
  assign io_filter_19_io_in = FPGA_DI[11];
  assign io_filter_20_io_in = FPGA_DI[12];
  assign io_filter_21_io_in = FPGA_DI[13];
  assign io_filter_22_io_in = FPGA_DI[14];
  assign io_filter_23_io_in = FPGA_DI[15];
  assign FPGA_DI_Filter = FPGA_DI_Filter_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      M_Fault_TTL_Filter_1 <= 8'h0;
      FPGA_DI_Filter_1 <= 16'h0;
    end else begin
      M_Fault_TTL_Filter_1[0] <= io_filter_0_io_out;
      M_Fault_TTL_Filter_1[1] <= io_filter_1_io_out;
      M_Fault_TTL_Filter_1[2] <= io_filter_2_io_out;
      M_Fault_TTL_Filter_1[3] <= io_filter_3_io_out;
      M_Fault_TTL_Filter_1[4] <= io_filter_4_io_out;
      M_Fault_TTL_Filter_1[5] <= io_filter_5_io_out;
      M_Fault_TTL_Filter_1[6] <= io_filter_6_io_out;
      M_Fault_TTL_Filter_1[7] <= io_filter_7_io_out;
      FPGA_DI_Filter_1[0] <= io_filter_8_io_out;
      FPGA_DI_Filter_1[1] <= io_filter_9_io_out;
      FPGA_DI_Filter_1[2] <= io_filter_10_io_out;
      FPGA_DI_Filter_1[3] <= io_filter_11_io_out;
      FPGA_DI_Filter_1[4] <= io_filter_12_io_out;
      FPGA_DI_Filter_1[5] <= io_filter_13_io_out;
      FPGA_DI_Filter_1[6] <= io_filter_14_io_out;
      FPGA_DI_Filter_1[7] <= io_filter_15_io_out;
      FPGA_DI_Filter_1[8] <= io_filter_16_io_out;
      FPGA_DI_Filter_1[9] <= io_filter_17_io_out;
      FPGA_DI_Filter_1[10] <= io_filter_18_io_out;
      FPGA_DI_Filter_1[11] <= io_filter_19_io_out;
      FPGA_DI_Filter_1[12] <= io_filter_20_io_out;
      FPGA_DI_Filter_1[13] <= io_filter_21_io_out;
      FPGA_DI_Filter_1[14] <= io_filter_22_io_out;
      FPGA_DI_Filter_1[15] <= io_filter_23_io_out;
    end
  end


endmodule

//Encoder_Top replaced by Encoder_Top

//Encoder_Top replaced by Encoder_Top

//Encoder_Top replaced by Encoder_Top

module Encoder_Top (
  input               clk,
  input               reset,
  input               clk_160M,
  input               encoderinterface_encoder_aphase,
  input               encoderinterface_encoder_bphase,
  input               encoderinterface_encoder_iphase,
  output     [31:0]   encoder_position_out,
  input               encoder_clr_in,
  output              encoder_iphase_out,
  output     [31:0]   encoder_lock_pos
);

  wire                encoderarea_Encoder_resetn;
  wire                encoder_Clr_4_encoder_clr_out;
  wire                zeroSensor_4_zerosensor_out;
  wire       [31:0]   encoderarea_Encoder_encoder_position_out;
  wire                encoderarea_Encoder_enc_udn;
  wire                encoderarea_Encoder_enc_cas;
  wire                encoderarea_Encoder_count_enable;
  wire                encoderarea_Encoder_count_direction;
  reg                 encoderarea_encoder_iphase;
  (* async_reg = "true" *) reg        [31:0]   _zz_encoder_lock_pos;
  reg                 encoderinterface_encoder_iphase_regNext;
  wire                when_Encoder_l122;

  Encoder_Clr encoder_Clr_4 (
    .encoder_clr_in     (encoder_clr_in                 ), //i
    .encoder_clr_out    (encoder_Clr_4_encoder_clr_out  ), //o
    .clk                (clk                            ), //i
    .reset              (reset                          )  //i
  );
  ZeroSensor zeroSensor_4 (
    .zerosensor_in     (encoderinterface_encoder_iphase  ), //i
    .zerosensor_out    (zeroSensor_4_zerosensor_out      ), //o
    .clk               (clk                              ), //i
    .reset             (reset                            )  //i
  );
  encoder encoderarea_Encoder (
    .clk80m                  (clk                                             ), //i
    .resetn                  (encoderarea_Encoder_resetn                      ), //i
    .enc_rstn                (encoder_clr_in                                  ), //i
    .enca                    (encoderinterface_encoder_aphase                 ), //i
    .encb                    (encoderinterface_encoder_bphase                 ), //i
    .encx                    (1'b0                                            ), //i
    .encoder_position_out    (encoderarea_Encoder_encoder_position_out[31:0]  ), //o
    .enc_udn                 (encoderarea_Encoder_enc_udn                     ), //o
    .enc_cas                 (encoderarea_Encoder_enc_cas                     ), //o
    .count_enable            (encoderarea_Encoder_count_enable                ), //o
    .count_direction         (encoderarea_Encoder_count_direction             ), //o
    .clk160m                 (clk_160M                                        )  //i
  );
  assign encoder_iphase_out = zeroSensor_4_zerosensor_out;
  assign encoderarea_Encoder_resetn = (! reset);
  assign encoder_position_out = encoderarea_Encoder_encoder_position_out;
  assign when_Encoder_l122 = (encoderinterface_encoder_iphase && (! encoderinterface_encoder_iphase_regNext));
  assign encoder_lock_pos = _zz_encoder_lock_pos;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      encoderarea_encoder_iphase <= 1'b0;
      _zz_encoder_lock_pos <= 32'h0;
    end else begin
      encoderarea_encoder_iphase <= encoderinterface_encoder_iphase;
      if(when_Encoder_l122) begin
        _zz_encoder_lock_pos <= encoderarea_Encoder_encoder_position_out;
      end else begin
        _zz_encoder_lock_pos <= _zz_encoder_lock_pos;
      end
    end
  end

  always @(posedge clk) begin
    encoderinterface_encoder_iphase_regNext <= encoderinterface_encoder_iphase;
  end


endmodule

module Mdcb_Regif (
  (* keep = "true" *) input      [8:0]    simplebus_RADDR,
  (* keep = "true" *) output     [31:0]   simplebus_RDATA,
  (* keep = "true" *) input               simplebus_RENABLE,
  (* keep = "true" *) input      [8:0]    simplebus_WADDR,
  (* keep = "true" *) input      [31:0]   simplebus_WDATA,
  (* keep = "true" *) input               simplebus_WENABLE,
  (* keep = "true" *) input      [31:0]   slaveid,
  (* keep = "true" *) input      [7:0]    M_Fault_TTL_Filter,
  (* keep = "true" *) input      [15:0]   FPGA_DI_Filter,
  (* keep = "true" *) output reg [7:0]    M_EN_TTL,
  (* keep = "true" *) output reg [15:0]   FPGA_DO,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_0_0,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_0_1,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_0_2,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_0_3,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_1_0,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_1_1,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_1_2,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_1_3,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_2_0,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_2_1,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_2_2,
  (* keep = "true" *) output     [15:0]   AD5544_DATA_2_3,
  (* keep = "true" *) output              AD5544_TRIGER_0,
  (* keep = "true" *) output              AD5544_TRIGER_1,
  (* keep = "true" *) output              AD5544_TRIGER_2,
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
  (* keep = "true" *) input      [31:0]   BissC_Pos_0,
  (* keep = "true" *) input      [31:0]   BissC_Pos_1,
  (* keep = "true" *) input      [31:0]   BissC_Pos_2,
  (* keep = "true" *) input      [31:0]   BissC_Pos_3,
  (* keep = "true" *) input      [31:0]   Encoder_Pos_0,
  (* keep = "true" *) input      [31:0]   Encoder_Pos_1,
  (* keep = "true" *) input      [31:0]   Encoder_Pos_2,
  (* keep = "true" *) input      [31:0]   Encoder_Pos_3,
  (* keep = "true" *) input      [0:0]    Encoder_Zero_Keep_0,
  (* keep = "true" *) input      [0:0]    Encoder_Zero_Keep_1,
  (* keep = "true" *) input      [0:0]    Encoder_Zero_Keep_2,
  (* keep = "true" *) input      [0:0]    Encoder_Zero_Keep_3,
  (* keep = "true" *) output     [0:0]    Encoder_Clr_0,
  (* keep = "true" *) output     [0:0]    Encoder_Clr_1_1,
  (* keep = "true" *) output     [0:0]    Encoder_Clr_2_1,
  (* keep = "true" *) output     [0:0]    Encoder_Clr_3_1,
  (* keep = "true" *) input      [31:0]   Encoder_lock_Pos_0,
  (* keep = "true" *) input      [31:0]   Encoder_lock_Pos_1,
  (* keep = "true" *) input      [31:0]   Encoder_lock_Pos_2,
  (* keep = "true" *) input      [31:0]   Encoder_lock_Pos_3,
  input               clk,
  input               reset
);

  wire       [1:0]    _zz_busslave_readData;
  wire       [0:0]    _zz_busslave_readData_1;
  wire       [10:0]   _zz_busslave_readData_2;
  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire       [31:0]   HEADER;
  wire       [31:0]   Slaveid_1;
  wire       [31:0]   VERSION;
  wire       [31:0]   BissC1_Pos;
  wire       [31:0]   BissC2_Pos;
  wire       [31:0]   BissC3_Pos;
  wire       [31:0]   BissC4_Pos;
  wire                when_RegInst_l153;
  reg        [31:0]   Reserve1;
  wire                when_RegInst_l153_1;
  reg        [31:0]   Reserve2;
  wire                when_RegInst_l153_2;
  reg        [31:0]   Reserve3;
  wire                when_RegInst_l153_3;
  reg        [31:0]   Reserve4;
  wire       [0:0]    TTL1_Single;
  wire       [0:0]    TTL2_Single;
  wire       [0:0]    TTL3_Single;
  wire       [0:0]    TTL4_Single;
  wire       [0:0]    TTL5_Single;
  wire       [0:0]    TTL6_Single;
  wire       [0:0]    TTL7_Single;
  wire       [0:0]    TTL8_Single;
  wire       [0:0]    Opt1_Single;
  wire       [0:0]    Opt2_Single;
  wire       [0:0]    Opt3_Single;
  wire       [0:0]    Opt4_Single;
  wire       [0:0]    Opt5_Single;
  wire       [0:0]    Opt6_Single;
  wire       [0:0]    Opt7_Single;
  wire       [0:0]    Opt8_Single;
  wire       [0:0]    Opt9_Single;
  wire       [0:0]    Opt10_Single;
  wire       [0:0]    Opt11_Single;
  wire       [0:0]    Opt12_Single;
  wire       [0:0]    Opt13_Single;
  wire       [0:0]    Opt14_Single;
  wire       [0:0]    Opt15_Single;
  wire       [0:0]    Opt16_Single;
  wire       [0:0]    Encoder1_ZeroSingle;
  wire       [0:0]    Encoder2_ZeroSingle;
  wire       [0:0]    Encoder3_ZeroSingle;
  wire       [0:0]    Encoder4_ZeroSingle;
  wire       [31:0]   Encoder1_Pos;
  wire       [31:0]   Encoder2_Pos;
  wire       [31:0]   Encoder3_Pos;
  wire       [31:0]   Encoder4_Pos;
  wire       [31:0]   Encoder1_Lock_Pos;
  wire       [31:0]   Encoder2_Lock_Pos;
  wire       [31:0]   Encoder3_Lock_Pos;
  wire       [31:0]   Encoder4_Lock_Pos;
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
  wire                when_RegInst_l153_4;
  reg        [15:0]   AD5544_Datatemp1;
  reg        [15:0]   AD5544_Datatemp2;
  wire                when_RegInst_l153_5;
  reg        [15:0]   AD5544_Datatemp3;
  reg        [15:0]   AD5544_Datatemp4;
  wire                AD5544_Triger1_Temp;
  reg                 AD5544_Triger1_Temp_delay_1;
  reg                 AD5544_Triger1_Temp_delay_1_1;
  reg                 AD5544_Triger1_Temp_delay_2;
  reg                 AD5544_Triger1_Temp_delay_1_2;
  reg                 AD5544_Triger1_Temp_delay_2_1;
  reg                 AD5544_Triger1_Temp_delay_3;
  wire                when_RegInst_l153_6;
  reg        [15:0]   AD5544_Datatemp5;
  reg        [15:0]   AD5544_Datatemp6;
  wire                when_RegInst_l153_7;
  reg        [15:0]   AD5544_Datatemp7;
  reg        [15:0]   AD5544_Datatemp8;
  wire                AD5544_Triger2_Temp;
  reg                 AD5544_Triger2_Temp_delay_1;
  reg                 AD5544_Triger2_Temp_delay_1_1;
  reg                 AD5544_Triger2_Temp_delay_2;
  reg                 AD5544_Triger2_Temp_delay_1_2;
  reg                 AD5544_Triger2_Temp_delay_2_1;
  reg                 AD5544_Triger2_Temp_delay_3;
  wire                when_RegInst_l153_8;
  reg        [15:0]   AD5544_Datatemp9;
  reg        [15:0]   AD5544_Datatemp10;
  wire                when_RegInst_l153_9;
  reg        [15:0]   AD5544_Datatemp11;
  reg        [15:0]   AD5544_Datatemp12;
  wire                AD5544_Triger3_Temp;
  reg                 AD5544_Triger3_Temp_delay_1;
  reg                 AD5544_Triger3_Temp_delay_1_1;
  reg                 AD5544_Triger3_Temp_delay_2;
  reg                 AD5544_Triger3_Temp_delay_1_2;
  reg                 AD5544_Triger3_Temp_delay_2_1;
  reg                 AD5544_Triger3_Temp_delay_3;
  wire                when_RegInst_l153_10;
  reg        [0:0]    M_EN_TTL1;
  reg        [0:0]    M_EN_TTL2;
  reg        [0:0]    M_EN_TTL3;
  reg        [0:0]    M_EN_TTL4;
  wire                when_RegInst_l153_11;
  reg        [0:0]    M_EN_TTL5;
  reg        [0:0]    M_EN_TTL6;
  reg        [0:0]    M_EN_TTL7;
  reg        [0:0]    M_EN_TTL8;
  wire                when_RegInst_l153_12;
  reg        [31:0]   Emergency;
  wire                when_RegInst_l153_13;
  reg        [31:0]   Project_ID;
  wire                when_RegInst_l153_14;
  reg        [31:0]   Config_Encoder;
  wire                when_RegInst_l153_15;
  reg        [31:0]   Valve;
  wire                when_RegInst_l153_16;
  reg        [0:0]    FPGA_DO_0;
  reg        [0:0]    FPGA_DO_1;
  reg        [0:0]    FPGA_DO_2;
  reg        [0:0]    FPGA_DO_3;
  reg        [0:0]    FPGA_DO_4;
  reg        [0:0]    FPGA_DO_5;
  reg        [0:0]    FPGA_DO_6;
  reg        [0:0]    FPGA_DO_7;
  reg        [0:0]    FPGA_DO_8;
  reg        [0:0]    FPGA_DO_9;
  reg        [0:0]    FPGA_DO_10;
  reg        [0:0]    FPGA_DO_11;
  reg        [0:0]    FPGA_DO_12;
  reg        [0:0]    FPGA_DO_13;
  reg        [0:0]    FPGA_DO_14;
  reg        [0:0]    FPGA_DO_15;
  wire                when_RegInst_l153_17;
  reg        [0:0]    Encoder1_Pos_Clr;
  reg        [0:0]    Encoder2_Pos_Clr;
  reg        [0:0]    Encoder3_Pos_Clr;
  reg        [0:0]    Encoder4_Pos_Clr;

  assign _zz_busslave_readData = {Opt1_Single,1'b0};
  assign _zz_busslave_readData_1 = 1'b0;
  assign _zz_busslave_readData_2 = {FPGA_DO_5,{1'b0,{FPGA_DO_4,{1'b0,{FPGA_DO_3,{1'b0,{FPGA_DO_2,{1'b0,{FPGA_DO_1,{1'b0,FPGA_DO_0}}}}}}}}}};
  assign simplebus_RDATA = busslave_readData;
  assign HEADER = 32'h00f1f2f3;
  assign Slaveid_1 = slaveid;
  assign VERSION = 32'h07e6060f;
  assign BissC1_Pos = BissC_Pos_0;
  assign BissC2_Pos = BissC_Pos_1;
  assign BissC3_Pos = BissC_Pos_2;
  assign BissC4_Pos = BissC_Pos_3;
  assign when_RegInst_l153 = ((simplebus_WADDR == 9'h01c) && simplebus_WENABLE);
  assign when_RegInst_l153_1 = ((simplebus_WADDR == 9'h020) && simplebus_WENABLE);
  assign when_RegInst_l153_2 = ((simplebus_WADDR == 9'h024) && simplebus_WENABLE);
  assign when_RegInst_l153_3 = ((simplebus_WADDR == 9'h028) && simplebus_WENABLE);
  assign TTL1_Single = M_Fault_TTL_Filter[0];
  assign TTL2_Single = M_Fault_TTL_Filter[1];
  assign TTL3_Single = M_Fault_TTL_Filter[2];
  assign TTL4_Single = M_Fault_TTL_Filter[3];
  assign TTL5_Single = M_Fault_TTL_Filter[4];
  assign TTL6_Single = M_Fault_TTL_Filter[5];
  assign TTL7_Single = M_Fault_TTL_Filter[6];
  assign TTL8_Single = M_Fault_TTL_Filter[7];
  assign Opt1_Single = FPGA_DI_Filter[0];
  assign Opt2_Single = FPGA_DI_Filter[1];
  assign Opt3_Single = FPGA_DI_Filter[2];
  assign Opt4_Single = FPGA_DI_Filter[3];
  assign Opt5_Single = FPGA_DI_Filter[4];
  assign Opt6_Single = FPGA_DI_Filter[5];
  assign Opt7_Single = FPGA_DI_Filter[6];
  assign Opt8_Single = FPGA_DI_Filter[7];
  assign Opt9_Single = FPGA_DI_Filter[8];
  assign Opt10_Single = FPGA_DI_Filter[9];
  assign Opt11_Single = FPGA_DI_Filter[10];
  assign Opt12_Single = FPGA_DI_Filter[11];
  assign Opt13_Single = FPGA_DI_Filter[12];
  assign Opt14_Single = FPGA_DI_Filter[13];
  assign Opt15_Single = FPGA_DI_Filter[14];
  assign Opt16_Single = FPGA_DI_Filter[15];
  assign Encoder1_ZeroSingle = Encoder_Zero_Keep_0;
  assign Encoder2_ZeroSingle = Encoder_Zero_Keep_1;
  assign Encoder3_ZeroSingle = Encoder_Zero_Keep_2;
  assign Encoder4_ZeroSingle = Encoder_Zero_Keep_3;
  assign Encoder1_Pos = Encoder_Pos_0;
  assign Encoder2_Pos = Encoder_Pos_1;
  assign Encoder3_Pos = Encoder_Pos_2;
  assign Encoder4_Pos = Encoder_Pos_3;
  assign Encoder1_Lock_Pos = Encoder_lock_Pos_0;
  assign Encoder2_Lock_Pos = Encoder_lock_Pos_1;
  assign Encoder3_Lock_Pos = Encoder_lock_Pos_2;
  assign Encoder4_Lock_Pos = Encoder_lock_Pos_3;
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
  assign when_RegInst_l153_4 = ((simplebus_WADDR == 9'h10c) && simplebus_WENABLE);
  assign AD5544_DATA_0_0 = AD5544_Datatemp1;
  assign AD5544_DATA_0_1 = AD5544_Datatemp2;
  assign when_RegInst_l153_5 = ((simplebus_WADDR == 9'h110) && simplebus_WENABLE);
  assign AD5544_DATA_0_2 = AD5544_Datatemp3;
  assign AD5544_DATA_0_3 = AD5544_Datatemp4;
  assign AD5544_Triger1_Temp = (when_RegInst_l153_4 || when_RegInst_l153_5);
  assign AD5544_TRIGER_0 = (((AD5544_Triger1_Temp || AD5544_Triger1_Temp_delay_1) || AD5544_Triger1_Temp_delay_2) || AD5544_Triger1_Temp_delay_3);
  assign when_RegInst_l153_6 = ((simplebus_WADDR == 9'h114) && simplebus_WENABLE);
  assign AD5544_DATA_1_0 = AD5544_Datatemp5;
  assign AD5544_DATA_1_1 = AD5544_Datatemp6;
  assign when_RegInst_l153_7 = ((simplebus_WADDR == 9'h118) && simplebus_WENABLE);
  assign AD5544_DATA_1_2 = AD5544_Datatemp7;
  assign AD5544_DATA_1_3 = AD5544_Datatemp8;
  assign AD5544_Triger2_Temp = (when_RegInst_l153_6 || when_RegInst_l153_7);
  assign AD5544_TRIGER_1 = (((AD5544_Triger2_Temp || AD5544_Triger2_Temp_delay_1) || AD5544_Triger2_Temp_delay_2) || AD5544_Triger2_Temp_delay_3);
  assign when_RegInst_l153_8 = ((simplebus_WADDR == 9'h11c) && simplebus_WENABLE);
  assign AD5544_DATA_2_0 = AD5544_Datatemp9;
  assign AD5544_DATA_2_1 = AD5544_Datatemp10;
  assign when_RegInst_l153_9 = ((simplebus_WADDR == 9'h120) && simplebus_WENABLE);
  assign AD5544_DATA_2_2 = AD5544_Datatemp11;
  assign AD5544_DATA_2_3 = AD5544_Datatemp12;
  assign AD5544_Triger3_Temp = (when_RegInst_l153_8 || when_RegInst_l153_9);
  assign AD5544_TRIGER_2 = (((AD5544_Triger3_Temp || AD5544_Triger3_Temp_delay_1) || AD5544_Triger3_Temp_delay_2) || AD5544_Triger3_Temp_delay_3);
  assign when_RegInst_l153_10 = ((simplebus_WADDR == 9'h124) && simplebus_WENABLE);
  always @(*) begin
    M_EN_TTL[0] = M_EN_TTL1[0];
    M_EN_TTL[1] = M_EN_TTL2[0];
    M_EN_TTL[2] = M_EN_TTL3[0];
    M_EN_TTL[3] = M_EN_TTL4[0];
    M_EN_TTL[4] = M_EN_TTL5[0];
    M_EN_TTL[5] = M_EN_TTL6[0];
    M_EN_TTL[6] = M_EN_TTL7[0];
    M_EN_TTL[7] = M_EN_TTL8[0];
  end

  assign when_RegInst_l153_11 = ((simplebus_WADDR == 9'h128) && simplebus_WENABLE);
  assign when_RegInst_l153_12 = ((simplebus_WADDR == 9'h12c) && simplebus_WENABLE);
  assign when_RegInst_l153_13 = ((simplebus_WADDR == 9'h130) && simplebus_WENABLE);
  assign when_RegInst_l153_14 = ((simplebus_WADDR == 9'h134) && simplebus_WENABLE);
  assign when_RegInst_l153_15 = ((simplebus_WADDR == 9'h138) && simplebus_WENABLE);
  assign when_RegInst_l153_16 = ((simplebus_WADDR == 9'h13c) && simplebus_WENABLE);
  always @(*) begin
    FPGA_DO[0] = FPGA_DO_0[0];
    FPGA_DO[1] = FPGA_DO_1[0];
    FPGA_DO[2] = FPGA_DO_2[0];
    FPGA_DO[3] = FPGA_DO_3[0];
    FPGA_DO[4] = FPGA_DO_4[0];
    FPGA_DO[5] = FPGA_DO_5[0];
    FPGA_DO[6] = FPGA_DO_6[0];
    FPGA_DO[7] = FPGA_DO_7[0];
    FPGA_DO[8] = FPGA_DO_8[0];
    FPGA_DO[9] = FPGA_DO_9[0];
    FPGA_DO[10] = FPGA_DO_10[0];
    FPGA_DO[11] = FPGA_DO_11[0];
    FPGA_DO[12] = FPGA_DO_12[0];
    FPGA_DO[13] = FPGA_DO_13[0];
    FPGA_DO[14] = FPGA_DO_14[0];
    FPGA_DO[15] = FPGA_DO_15[0];
  end

  assign when_RegInst_l153_17 = ((simplebus_WADDR == 9'h140) && simplebus_WENABLE);
  assign Encoder_Clr_0 = (Encoder1_Pos_Clr & when_RegInst_l153_17);
  assign Encoder_Clr_1_1 = (Encoder2_Pos_Clr & when_RegInst_l153_17);
  assign Encoder_Clr_2_1 = (Encoder3_Pos_Clr & when_RegInst_l153_17);
  assign Encoder_Clr_3_1 = (Encoder4_Pos_Clr & when_RegInst_l153_17);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
      Reserve1 <= 32'h00000001;
      Reserve2 <= 32'h00000002;
      Reserve3 <= 32'h00000003;
      Reserve4 <= 32'h00000004;
      AD5544_Datatemp1 <= 16'h8000;
      AD5544_Datatemp2 <= 16'h8000;
      AD5544_Datatemp3 <= 16'h8000;
      AD5544_Datatemp4 <= 16'h8000;
      AD5544_Datatemp5 <= 16'h8000;
      AD5544_Datatemp6 <= 16'h8000;
      AD5544_Datatemp7 <= 16'h8000;
      AD5544_Datatemp8 <= 16'h8000;
      AD5544_Datatemp9 <= 16'h8000;
      AD5544_Datatemp10 <= 16'h8000;
      AD5544_Datatemp11 <= 16'h8000;
      AD5544_Datatemp12 <= 16'h8000;
      M_EN_TTL1 <= 1'b0;
      M_EN_TTL2 <= 1'b0;
      M_EN_TTL3 <= 1'b0;
      M_EN_TTL4 <= 1'b0;
      M_EN_TTL5 <= 1'b0;
      M_EN_TTL6 <= 1'b0;
      M_EN_TTL7 <= 1'b0;
      M_EN_TTL8 <= 1'b0;
      Emergency <= 32'h0;
      Project_ID <= 32'h0;
      Config_Encoder <= 32'h0;
      Valve <= 32'h0;
      FPGA_DO_0 <= 1'b0;
      FPGA_DO_1 <= 1'b0;
      FPGA_DO_2 <= 1'b0;
      FPGA_DO_3 <= 1'b0;
      FPGA_DO_4 <= 1'b0;
      FPGA_DO_5 <= 1'b0;
      FPGA_DO_6 <= 1'b0;
      FPGA_DO_7 <= 1'b0;
      FPGA_DO_8 <= 1'b0;
      FPGA_DO_9 <= 1'b0;
      FPGA_DO_10 <= 1'b0;
      FPGA_DO_11 <= 1'b0;
      FPGA_DO_12 <= 1'b0;
      FPGA_DO_13 <= 1'b0;
      FPGA_DO_14 <= 1'b0;
      FPGA_DO_15 <= 1'b0;
      Encoder1_Pos_Clr <= 1'b0;
      Encoder2_Pos_Clr <= 1'b0;
      Encoder3_Pos_Clr <= 1'b0;
      Encoder4_Pos_Clr <= 1'b0;
    end else begin
      if(when_RegInst_l153) begin
        Reserve1 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_1) begin
        Reserve2 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_2) begin
        Reserve3 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_3) begin
        Reserve4 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_4) begin
        AD5544_Datatemp1 <= simplebus_WDATA[15 : 0];
      end
      if(when_RegInst_l153_4) begin
        AD5544_Datatemp2 <= simplebus_WDATA[31 : 16];
      end
      if(when_RegInst_l153_5) begin
        AD5544_Datatemp3 <= simplebus_WDATA[15 : 0];
      end
      if(when_RegInst_l153_5) begin
        AD5544_Datatemp4 <= simplebus_WDATA[31 : 16];
      end
      if(when_RegInst_l153_6) begin
        AD5544_Datatemp5 <= simplebus_WDATA[15 : 0];
      end
      if(when_RegInst_l153_6) begin
        AD5544_Datatemp6 <= simplebus_WDATA[31 : 16];
      end
      if(when_RegInst_l153_7) begin
        AD5544_Datatemp7 <= simplebus_WDATA[15 : 0];
      end
      if(when_RegInst_l153_7) begin
        AD5544_Datatemp8 <= simplebus_WDATA[31 : 16];
      end
      if(when_RegInst_l153_8) begin
        AD5544_Datatemp9 <= simplebus_WDATA[15 : 0];
      end
      if(when_RegInst_l153_8) begin
        AD5544_Datatemp10 <= simplebus_WDATA[31 : 16];
      end
      if(when_RegInst_l153_9) begin
        AD5544_Datatemp11 <= simplebus_WDATA[15 : 0];
      end
      if(when_RegInst_l153_9) begin
        AD5544_Datatemp12 <= simplebus_WDATA[31 : 16];
      end
      if(when_RegInst_l153_10) begin
        M_EN_TTL1 <= simplebus_WDATA[2 : 2];
      end
      if(when_RegInst_l153_10) begin
        M_EN_TTL2 <= simplebus_WDATA[10 : 10];
      end
      if(when_RegInst_l153_10) begin
        M_EN_TTL3 <= simplebus_WDATA[18 : 18];
      end
      if(when_RegInst_l153_10) begin
        M_EN_TTL4 <= simplebus_WDATA[26 : 26];
      end
      if(when_RegInst_l153_11) begin
        M_EN_TTL5 <= simplebus_WDATA[2 : 2];
      end
      if(when_RegInst_l153_11) begin
        M_EN_TTL6 <= simplebus_WDATA[10 : 10];
      end
      if(when_RegInst_l153_11) begin
        M_EN_TTL7 <= simplebus_WDATA[18 : 18];
      end
      if(when_RegInst_l153_11) begin
        M_EN_TTL8 <= simplebus_WDATA[26 : 26];
      end
      if(when_RegInst_l153_12) begin
        Emergency <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_13) begin
        Project_ID <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_14) begin
        Config_Encoder <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_15) begin
        Valve <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_0 <= simplebus_WDATA[0 : 0];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_1 <= simplebus_WDATA[2 : 2];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_2 <= simplebus_WDATA[4 : 4];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_3 <= simplebus_WDATA[6 : 6];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_4 <= simplebus_WDATA[8 : 8];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_5 <= simplebus_WDATA[10 : 10];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_6 <= simplebus_WDATA[12 : 12];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_7 <= simplebus_WDATA[14 : 14];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_8 <= simplebus_WDATA[16 : 16];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_9 <= simplebus_WDATA[18 : 18];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_10 <= simplebus_WDATA[20 : 20];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_11 <= simplebus_WDATA[22 : 22];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_12 <= simplebus_WDATA[24 : 24];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_13 <= simplebus_WDATA[26 : 26];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_14 <= simplebus_WDATA[28 : 28];
      end
      if(when_RegInst_l153_16) begin
        FPGA_DO_15 <= simplebus_WDATA[30 : 30];
      end
      if(when_RegInst_l153_17) begin
        Encoder1_Pos_Clr <= simplebus_WDATA[0 : 0];
      end
      if(when_RegInst_l153_17) begin
        Encoder2_Pos_Clr <= simplebus_WDATA[8 : 8];
      end
      if(when_RegInst_l153_17) begin
        Encoder3_Pos_Clr <= simplebus_WDATA[16 : 16];
      end
      if(when_RegInst_l153_17) begin
        Encoder4_Pos_Clr <= simplebus_WDATA[24 : 24];
      end
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          9'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          9'h004 : begin
            busslave_readData <= Slaveid_1;
            busslave_readError <= 1'b0;
          end
          9'h008 : begin
            busslave_readData <= VERSION;
            busslave_readError <= 1'b0;
          end
          9'h00c : begin
            busslave_readData <= BissC1_Pos;
            busslave_readError <= 1'b0;
          end
          9'h010 : begin
            busslave_readData <= BissC2_Pos;
            busslave_readError <= 1'b0;
          end
          9'h014 : begin
            busslave_readData <= BissC3_Pos;
            busslave_readError <= 1'b0;
          end
          9'h018 : begin
            busslave_readData <= BissC4_Pos;
            busslave_readError <= 1'b0;
          end
          9'h01c : begin
            busslave_readData <= Reserve1;
            busslave_readError <= 1'b0;
          end
          9'h020 : begin
            busslave_readData <= Reserve2;
            busslave_readError <= 1'b0;
          end
          9'h024 : begin
            busslave_readData <= Reserve3;
            busslave_readError <= 1'b0;
          end
          9'h028 : begin
            busslave_readData <= Reserve4;
            busslave_readError <= 1'b0;
          end
          9'h02c : begin
            busslave_readData <= {23'h0,{TTL8_Single,{TTL7_Single,{TTL6_Single,{TTL5_Single,{TTL4_Single,{TTL3_Single,{TTL2_Single,{TTL1_Single,1'b0}}}}}}}}};
            busslave_readError <= 1'b0;
          end
          9'h030 : begin
            busslave_readData <= {15'h0,{Opt16_Single,{Opt15_Single,{Opt14_Single,{Opt13_Single,{Opt12_Single,{Opt11_Single,{Opt10_Single,{Opt9_Single,{Opt8_Single,{Opt7_Single,{Opt6_Single,{Opt5_Single,{Opt4_Single,{Opt3_Single,{Opt2_Single,_zz_busslave_readData}}}}}}}}}}}}}}}};
            busslave_readError <= 1'b0;
          end
          9'h034 : begin
            busslave_readData <= {7'h0,{Encoder4_ZeroSingle,{7'h0,{Encoder3_ZeroSingle,{7'h0,{Encoder2_ZeroSingle,{7'h0,Encoder1_ZeroSingle}}}}}}};
            busslave_readError <= 1'b0;
          end
          9'h038 : begin
            busslave_readData <= Encoder1_Pos;
            busslave_readError <= 1'b0;
          end
          9'h03c : begin
            busslave_readData <= Encoder2_Pos;
            busslave_readError <= 1'b0;
          end
          9'h040 : begin
            busslave_readData <= Encoder3_Pos;
            busslave_readError <= 1'b0;
          end
          9'h044 : begin
            busslave_readData <= Encoder4_Pos;
            busslave_readError <= 1'b0;
          end
          9'h048 : begin
            busslave_readData <= Encoder1_Lock_Pos;
            busslave_readError <= 1'b0;
          end
          9'h04c : begin
            busslave_readData <= Encoder2_Lock_Pos;
            busslave_readError <= 1'b0;
          end
          9'h050 : begin
            busslave_readData <= Encoder3_Lock_Pos;
            busslave_readError <= 1'b0;
          end
          9'h054 : begin
            busslave_readData <= Encoder4_Lock_Pos;
            busslave_readError <= 1'b0;
          end
          9'h058 : begin
            busslave_readData <= {AD7606_Datatemp2,AD7606_Datatemp1};
            busslave_readError <= 1'b0;
          end
          9'h05c : begin
            busslave_readData <= {AD7606_Datatemp4,AD7606_Datatemp3};
            busslave_readError <= 1'b0;
          end
          9'h060 : begin
            busslave_readData <= {AD7606_Datatemp6,AD7606_Datatemp5};
            busslave_readError <= 1'b0;
          end
          9'h064 : begin
            busslave_readData <= {AD7606_Datatemp8,AD7606_Datatemp7};
            busslave_readError <= 1'b0;
          end
          9'h068 : begin
            busslave_readData <= {AD7606_Datatemp10,AD7606_Datatemp9};
            busslave_readError <= 1'b0;
          end
          9'h06c : begin
            busslave_readData <= {AD7606_Datatemp12,AD7606_Datatemp11};
            busslave_readError <= 1'b0;
          end
          9'h070 : begin
            busslave_readData <= {AD7606_Datatemp14,AD7606_Datatemp13};
            busslave_readError <= 1'b0;
          end
          9'h074 : begin
            busslave_readData <= {AD7606_Datatemp16,AD7606_Datatemp15};
            busslave_readError <= 1'b0;
          end
          9'h10c : begin
            busslave_readData <= {AD5544_Datatemp2,AD5544_Datatemp1};
            busslave_readError <= 1'b0;
          end
          9'h110 : begin
            busslave_readData <= {AD5544_Datatemp4,AD5544_Datatemp3};
            busslave_readError <= 1'b0;
          end
          9'h114 : begin
            busslave_readData <= {AD5544_Datatemp6,AD5544_Datatemp5};
            busslave_readError <= 1'b0;
          end
          9'h118 : begin
            busslave_readData <= {AD5544_Datatemp8,AD5544_Datatemp7};
            busslave_readError <= 1'b0;
          end
          9'h11c : begin
            busslave_readData <= {AD5544_Datatemp10,AD5544_Datatemp9};
            busslave_readError <= 1'b0;
          end
          9'h120 : begin
            busslave_readData <= {AD5544_Datatemp12,AD5544_Datatemp11};
            busslave_readError <= 1'b0;
          end
          9'h124 : begin
            busslave_readData <= {5'h0,{M_EN_TTL4,{7'h0,{M_EN_TTL3,{7'h0,{M_EN_TTL2,{7'h0,{M_EN_TTL1,2'b00}}}}}}}};
            busslave_readError <= 1'b0;
          end
          9'h128 : begin
            busslave_readData <= {5'h0,{M_EN_TTL8,{7'h0,{M_EN_TTL7,{7'h0,{M_EN_TTL6,{7'h0,{M_EN_TTL5,2'b00}}}}}}}};
            busslave_readError <= 1'b0;
          end
          9'h12c : begin
            busslave_readData <= Emergency;
            busslave_readError <= 1'b0;
          end
          9'h130 : begin
            busslave_readData <= Project_ID;
            busslave_readError <= 1'b0;
          end
          9'h134 : begin
            busslave_readData <= Config_Encoder;
            busslave_readError <= 1'b0;
          end
          9'h138 : begin
            busslave_readData <= Valve;
            busslave_readError <= 1'b0;
          end
          9'h13c : begin
            busslave_readData <= {1'b0,{FPGA_DO_15,{1'b0,{FPGA_DO_14,{1'b0,{FPGA_DO_13,{1'b0,{FPGA_DO_12,{1'b0,{FPGA_DO_11,{1'b0,{FPGA_DO_10,{1'b0,{FPGA_DO_9,{1'b0,{FPGA_DO_8,{1'b0,{FPGA_DO_7,{1'b0,{FPGA_DO_6,{_zz_busslave_readData_1,_zz_busslave_readData_2}}}}}}}}}}}}}}}}}}}}};
            busslave_readError <= 1'b0;
          end
          9'h140 : begin
            busslave_readData <= {7'h0,{Encoder4_Pos_Clr,{7'h0,{Encoder3_Pos_Clr,{7'h0,{Encoder2_Pos_Clr,{7'h0,Encoder1_Pos_Clr}}}}}}};
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
    AD5544_Triger1_Temp_delay_1 <= AD5544_Triger1_Temp;
    AD5544_Triger1_Temp_delay_1_1 <= AD5544_Triger1_Temp;
    AD5544_Triger1_Temp_delay_2 <= AD5544_Triger1_Temp_delay_1_1;
    AD5544_Triger1_Temp_delay_1_2 <= AD5544_Triger1_Temp;
    AD5544_Triger1_Temp_delay_2_1 <= AD5544_Triger1_Temp_delay_1_2;
    AD5544_Triger1_Temp_delay_3 <= AD5544_Triger1_Temp_delay_2_1;
    AD5544_Triger2_Temp_delay_1 <= AD5544_Triger2_Temp;
    AD5544_Triger2_Temp_delay_1_1 <= AD5544_Triger2_Temp;
    AD5544_Triger2_Temp_delay_2 <= AD5544_Triger2_Temp_delay_1_1;
    AD5544_Triger2_Temp_delay_1_2 <= AD5544_Triger2_Temp;
    AD5544_Triger2_Temp_delay_2_1 <= AD5544_Triger2_Temp_delay_1_2;
    AD5544_Triger2_Temp_delay_3 <= AD5544_Triger2_Temp_delay_2_1;
    AD5544_Triger3_Temp_delay_1 <= AD5544_Triger3_Temp;
    AD5544_Triger3_Temp_delay_1_1 <= AD5544_Triger3_Temp;
    AD5544_Triger3_Temp_delay_2 <= AD5544_Triger3_Temp_delay_1_1;
    AD5544_Triger3_Temp_delay_1_2 <= AD5544_Triger3_Temp;
    AD5544_Triger3_Temp_delay_2_1 <= AD5544_Triger3_Temp_delay_1_2;
    AD5544_Triger3_Temp_delay_3 <= AD5544_Triger3_Temp_delay_2_1;
  end


endmodule

module MdcbTxSimpleBus (
  (* keep = "true" *) output              output_valid,
  (* keep = "true" *) input               output_ready,
  (* keep = "true" *) output              output_payload_last,
  (* keep = "true" *) output     [31:0]   output_payload_fragment,
  (* keep = "true" *) output              RENABLE,
  (* keep = "true" *) output     [8:0]    RADDR,
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
  wire       [5:0]    streamfifo_1_io_occupancy;
  wire       [5:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [8:0]    RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [8:0]    send_length;
  wire                when_MdcbTxSimpleBus_l30;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_MdcbTxSimpleBus_l54;
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
    .io_occupancy       (streamfifo_1_io_occupancy[5:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[5:0]  ), //o
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

  assign when_MdcbTxSimpleBus_l30 = (32'h000001f4 <= timer_1_io_value);
  always @(*) begin
    if(when_MdcbTxSimpleBus_l30) begin
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
  assign output_payload_last = ((streamfifo_1_io_occupancy == 6'h01) && output_fire);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = fsm_enumDef_1_Send_Data;
        end
      end
      fsm_enumDef_1_Send_Data : begin
        if(when_MdcbTxSimpleBus_l54) begin
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

  assign when_MdcbTxSimpleBus_l54 = (send_length == 9'h031);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 9'h0;
      send_length <= 9'h0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 9'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 9'h0;
          end
        end
        fsm_enumDef_1_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 9'h004);
          send_length <= (send_length + 9'h001);
          if(when_MdcbTxSimpleBus_l54) begin
            RENABLE_1 <= 1'b0;
          end
        end
        fsm_enumDef_1_End_1 : begin
          send_length <= 9'h0;
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

module MdcbRxSimpleBus (
  (* keep = "true" *) input               input_valid,
  (* keep = "true" *) output              input_ready,
  (* keep = "true" *) input               input_payload_last,
  (* keep = "true" *) input      [31:0]   input_payload_fragment,
  (* keep = "true" *) output     [8:0]    waddr,
  (* keep = "true" *) output     [31:0]   wdata,
  (* keep = "true" *) output              wenable,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Get_Header = 2'd1;
  localparam fsm_enumDef_Get_Data = 2'd2;

  wire       [10:0]   _zz_waddr;
  reg        [8:0]    waddr_1;
  reg        [31:0]   wdata_1;
  reg                 wenable_1;
  reg                 flag;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_MdcbRxPreamble_l68;
  wire                when_MdcbRxPreamble_l74;
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
  assign waddr = _zz_waddr[8:0];
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
        if(when_MdcbRxPreamble_l68) begin
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

  assign when_MdcbRxPreamble_l68 = (input_valid && input_payload_last);
  assign when_MdcbRxPreamble_l74 = (! flag);
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
          if(when_MdcbRxPreamble_l68) begin
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
          waddr_1 <= 9'h043;
          flag <= 1'b0;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(!when_MdcbRxPreamble_l68) begin
          if(input_valid) begin
            wdata_1 <= input_payload_fragment;
            if(when_MdcbRxPreamble_l74) begin
              flag <= 1'b1;
            end else begin
              waddr_1 <= (waddr_1 + 9'h001);
            end
          end
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module MdcbRxPreamble (
  (* keep = "true" *) input               input_valid,
  (* keep = "true" *) output              input_ready,
  (* keep = "true" *) input               input_payload_last,
  (* keep = "true" *) input      [31:0]   input_payload_fragment,
  (* keep = "true" *) input      [31:0]   slave_id,
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
  wire                when_MdcbRxPreamble_l27;
  wire                when_MdcbRxPreamble_l34;

  assign startDelimiter = {slave_id,32'h00f1f2f3};
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
    if(!when_MdcbRxPreamble_l27) begin
      if(input_valid) begin
        output_valid = 1'b1;
      end
    end
  end

  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = ((! inFrame) || output_ready);
  assign output_payload_last = input_payload_last;
  assign when_MdcbRxPreamble_l27 = (! inFrame);
  assign when_MdcbRxPreamble_l34 = (output_ready && input_payload_last);
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
      if(when_MdcbRxPreamble_l27) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(input_valid) begin
          if(when_MdcbRxPreamble_l34) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

//IoFilter replaced by IoFilter

module IoFilter (
  input               io_in,
  output              io_out,
  input               clk,
  input               reset
);

  wire                io_in_buffercc_io_dataOut;
  reg        [0:0]    timer_counter;
  wire                timer_tick;
  wire                sampler_ioSync;
  wire                sampler_ioSamples_0;
  wire                sampler_ioSamples_1;
  wire                sampler_ioSamples_2;
  wire                sampler_ioSamples_3;
  wire                _zz_sampler_ioSamples_0;
  reg                 _zz_sampler_ioSamples_1;
  reg                 _zz_sampler_ioSamples_2;
  reg                 _zz_sampler_ioSamples_3;
  reg                 iosampleout;
  wire                when_Mdcb_Ioin_Filter_l31;

  BufferCC io_in_buffercc (
    .io_dataIn     (io_in                      ), //i
    .io_dataOut    (io_in_buffercc_io_dataOut  ), //o
    .clk           (clk                        ), //i
    .reset         (reset                      )  //i
  );
  assign timer_tick = (timer_counter == 1'b0);
  assign sampler_ioSync = io_in_buffercc_io_dataOut;
  assign _zz_sampler_ioSamples_0 = sampler_ioSync;
  assign sampler_ioSamples_0 = _zz_sampler_ioSamples_0;
  assign sampler_ioSamples_1 = _zz_sampler_ioSamples_1;
  assign sampler_ioSamples_2 = _zz_sampler_ioSamples_2;
  assign sampler_ioSamples_3 = _zz_sampler_ioSamples_3;
  assign when_Mdcb_Ioin_Filter_l31 = ((((sampler_ioSamples_0 != iosampleout) && (sampler_ioSamples_1 != iosampleout)) && (sampler_ioSamples_2 != iosampleout)) && (sampler_ioSamples_3 != iosampleout));
  assign io_out = iosampleout;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      timer_counter <= 1'b0;
      _zz_sampler_ioSamples_1 <= 1'b1;
      _zz_sampler_ioSamples_2 <= 1'b1;
      _zz_sampler_ioSamples_3 <= 1'b1;
      iosampleout <= 1'b1;
    end else begin
      timer_counter <= (timer_counter - 1'b1);
      if(timer_tick) begin
        timer_counter <= 1'b1;
      end
      if(timer_tick) begin
        _zz_sampler_ioSamples_1 <= _zz_sampler_ioSamples_0;
      end
      if(timer_tick) begin
        _zz_sampler_ioSamples_2 <= _zz_sampler_ioSamples_1;
      end
      if(timer_tick) begin
        _zz_sampler_ioSamples_3 <= _zz_sampler_ioSamples_2;
      end
      if(timer_tick) begin
        if(when_Mdcb_Ioin_Filter_l31) begin
          iosampleout <= sampler_ioSamples_3;
        end
      end
    end
  end


endmodule

//ZeroSensor replaced by ZeroSensor

//Encoder_Clr replaced by Encoder_Clr

//ZeroSensor replaced by ZeroSensor

//Encoder_Clr replaced by Encoder_Clr

//ZeroSensor replaced by ZeroSensor

//Encoder_Clr replaced by Encoder_Clr

module ZeroSensor (
  input               zerosensor_in,
  output              zerosensor_out,
  input               clk,
  input               reset
);
  localparam ZeroState_ZIDLE = 2'd0;
  localparam ZeroState_ZWAIT = 2'd1;
  localparam ZeroState_ZSTOP = 2'd2;

  wire       [15:0]   _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [15:0]   counter_valueNext;
  reg        [15:0]   counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  (* async_reg = "true" *) reg                 zerosensor_temp;
  reg        [1:0]    stateMachine_state;
  reg                 zerosensor_in_regNext;
  wire                when_Encoder_l43;
  `ifndef SYNTHESIS
  reg [39:0] stateMachine_state_string;
  `endif


  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {15'd0, _zz_counter_valueNext_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(stateMachine_state)
      ZeroState_ZIDLE : stateMachine_state_string = "ZIDLE";
      ZeroState_ZWAIT : stateMachine_state_string = "ZWAIT";
      ZeroState_ZSTOP : stateMachine_state_string = "ZSTOP";
      default : stateMachine_state_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    counter_willIncrement = 1'b0;
    case(stateMachine_state)
      ZeroState_ZIDLE : begin
      end
      ZeroState_ZWAIT : begin
        counter_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    counter_willClear = 1'b0;
    case(stateMachine_state)
      ZeroState_ZIDLE : begin
        if(when_Encoder_l43) begin
          counter_willClear = 1'b1;
        end
      end
      ZeroState_ZWAIT : begin
      end
      default : begin
      end
    endcase
  end

  assign counter_willOverflowIfInc = (counter_value == 16'h9c40);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 16'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 16'h0;
    end
  end

  assign when_Encoder_l43 = (zerosensor_in && (! zerosensor_in_regNext));
  assign zerosensor_out = zerosensor_temp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 16'h0;
      zerosensor_temp <= 1'b0;
      stateMachine_state <= ZeroState_ZIDLE;
    end else begin
      counter_value <= counter_valueNext;
      case(stateMachine_state)
        ZeroState_ZIDLE : begin
          if(when_Encoder_l43) begin
            stateMachine_state <= ZeroState_ZWAIT;
            zerosensor_temp <= 1'b1;
          end
        end
        ZeroState_ZWAIT : begin
          if(counter_willOverflow) begin
            stateMachine_state <= ZeroState_ZSTOP;
          end
        end
        default : begin
          stateMachine_state <= ZeroState_ZIDLE;
          zerosensor_temp <= 1'b0;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    zerosensor_in_regNext <= zerosensor_in;
  end


endmodule

module Encoder_Clr (
  input               encoder_clr_in,
  output              encoder_clr_out,
  input               clk,
  input               reset
);

  (* async_reg = "true" *) reg                 encoder_clr_out_1;
  (* async_reg = "true" *) reg                 encoder_clr_in_1;
  reg                 encoder_clr_in_1_regNext;
  wire                when_Encoder_Clr_l17;
  reg                 encoder_clr_out_1_delay_1;
  reg                 encoder_clr_out_1_delay_1_1;
  reg                 encoder_clr_out_1_delay_2;

  assign when_Encoder_Clr_l17 = (encoder_clr_in_1 && (! encoder_clr_in_1_regNext));
  assign encoder_clr_out = (! ((encoder_clr_out_1 || encoder_clr_out_1_delay_1) || encoder_clr_out_1_delay_2));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      encoder_clr_out_1 <= 1'b0;
      encoder_clr_in_1 <= 1'b0;
    end else begin
      encoder_clr_in_1 <= encoder_clr_in;
      if(when_Encoder_Clr_l17) begin
        encoder_clr_out_1 <= 1'b1;
      end else begin
        encoder_clr_out_1 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    encoder_clr_in_1_regNext <= encoder_clr_in_1;
    encoder_clr_out_1_delay_1 <= encoder_clr_out_1;
    encoder_clr_out_1_delay_1_1 <= encoder_clr_out_1;
    encoder_clr_out_1_delay_2 <= encoder_clr_out_1_delay_1_1;
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
  output reg [5:0]    io_occupancy,
  output reg [5:0]    io_availability,
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
  wire       [5:0]    _zz_io_occupancy;
  wire       [5:0]    _zz_io_availability;
  wire       [5:0]    _zz_io_availability_1;
  wire       [5:0]    _zz_io_availability_2;
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
  (* ram_style = "block" *) reg [31:0] logic_ram [0:49];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (6'h32 + logic_ptrDif);
  assign _zz_io_availability = (6'h32 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h31);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 6'h0;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h31);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 6'h0;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
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
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 6'h32 : 6'h0);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 6'h0 : 6'h32);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

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

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
