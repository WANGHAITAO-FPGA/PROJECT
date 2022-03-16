// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : MlmcTop
// Date      : 11/03/2022, 15:00:21

`timescale 1ns/1ps 

module MlmcTop (
  (* MARK_DEBUG = "TRUE" *) input      [18:0]   emif_emif_addr,
  (* MARK_DEBUG = "TRUE" *) input               emif_emif_cs,
  (* MARK_DEBUG = "TRUE" *) input               emif_emif_we,
  (* MARK_DEBUG = "TRUE" *) input               emif_emif_oe,
  output              ad5544_A_AD5544_CS,
  output              ad5544_A_AD5544_LDAC,
  output              ad5544_A_AD5544_MSB,
  output              ad5544_A_AD5544_RS,
  output              ad5544_A_AD5544_SCLK,
  output              ad5544_A_AD5544_SDIN,
  output              ad5544_B_AD5544_CS,
  output              ad5544_B_AD5544_LDAC,
  output              ad5544_B_AD5544_MSB,
  output              ad5544_B_AD5544_RS,
  output              ad5544_B_AD5544_SCLK,
  output              ad5544_B_AD5544_SDIN,
  output              bissc_master_enc_clk,
  input               bissc_master_enc_data,
  input               bissc_slave_0_enc_clk,
  output              bissc_slave_0_enc_data,
  input               bissc_slave_1_enc_clk,
  output              bissc_slave_1_enc_data,
  input               bissc_slave_2_enc_clk,
  output              bissc_slave_2_enc_data,
  input               bissc_slave_3_enc_clk,
  output              bissc_slave_3_enc_data,
  input               bissc_slave_4_enc_clk,
  output              bissc_slave_4_enc_data,
  input               bissc_slave_5_enc_clk,
  output              bissc_slave_5_enc_data,
  input               bissc_slave_6_enc_clk,
  output              bissc_slave_6_enc_data,
  input               bissc_slave_7_enc_clk,
  output              bissc_slave_7_enc_data,
  input               bissc_slave_8_enc_clk,
  output              bissc_slave_8_enc_data,
  input               bissc_slave_9_enc_clk,
  output              bissc_slave_9_enc_data,
  input               bissc_slave_10_enc_clk,
  output              bissc_slave_10_enc_data,
  input               bissc_slave_11_enc_clk,
  output              bissc_slave_11_enc_data,
  input               bissc_slave_12_enc_clk,
  output              bissc_slave_12_enc_data,
  input               bissc_slave_13_enc_clk,
  output              bissc_slave_13_enc_data,
  input               bissc_slave_14_enc_clk,
  output              bissc_slave_14_enc_data,
  input               bissc_slave_15_enc_clk,
  output              bissc_slave_15_enc_data,
  input               bissc_slave_16_enc_clk,
  output              bissc_slave_16_enc_data,
  input               bissc_slave_17_enc_clk,
  output              bissc_slave_17_enc_data,
  input               bissc_slave_18_enc_clk,
  output              bissc_slave_18_enc_data,
  input               bissc_slave_19_enc_clk,
  output              bissc_slave_19_enc_data,
  input               bissc_slave_20_enc_clk,
  output              bissc_slave_20_enc_data,
  input               bissc_slave_21_enc_clk,
  output              bissc_slave_21_enc_data,
  input               bissc_slave_22_enc_clk,
  output              bissc_slave_22_enc_data,
  input               bissc_slave_23_enc_clk,
  output              bissc_slave_23_enc_data,
  output     [11:0]   gpioA,
  output     [11:0]   gpioB,
  input               clk,
  input               reset,
  output              led,
  output     [2:0]    currentState,
  output     [31:0]   postion,
  output     [40:0]   postion_all,
  output     [40:0]   postion_temp,
   inout     [15:0]   emif_emif_data
);

  wire       [3:0]    area_ad5544_triger_apb_PADDR;
  wire       [3:0]    area_ad5544_1_Ctrl_apb_PADDR;
  wire       [3:0]    area_ad5544_2_Ctrl_apb_PADDR;
  wire       [3:0]    area_bissc_ctrl_apb_PADDR;
  wire       [3:0]    area_apb_gpio_io_apb_PADDR;
  wire       [3:0]    area_apb_ram_apb_PADDR;
  wire       [40:0]   area_bissc_slave_0_m_postion;
  wire       [40:0]   area_bissc_slave_1_m_postion;
  wire       [40:0]   area_bissc_slave_2_m_postion;
  wire       [40:0]   area_bissc_slave_3_m_postion;
  wire       [40:0]   area_bissc_slave_4_m_postion;
  wire       [40:0]   area_bissc_slave_5_m_postion;
  wire       [40:0]   area_bissc_slave_6_m_postion;
  wire       [40:0]   area_bissc_slave_7_m_postion;
  wire       [40:0]   area_bissc_slave_8_m_postion;
  wire       [40:0]   area_bissc_slave_9_m_postion;
  wire       [40:0]   area_bissc_slave_10_m_postion;
  wire       [40:0]   area_bissc_slave_11_m_postion;
  wire       [40:0]   area_bissc_slave_12_m_postion;
  wire       [40:0]   area_bissc_slave_13_m_postion;
  wire       [40:0]   area_bissc_slave_14_m_postion;
  wire       [40:0]   area_bissc_slave_15_m_postion;
  wire       [40:0]   area_bissc_slave_16_m_postion;
  wire       [40:0]   area_bissc_slave_17_m_postion;
  wire       [40:0]   area_bissc_slave_18_m_postion;
  wire       [40:0]   area_bissc_slave_19_m_postion;
  wire       [40:0]   area_bissc_slave_20_m_postion;
  wire       [40:0]   area_bissc_slave_21_m_postion;
  wire       [40:0]   area_bissc_slave_22_m_postion;
  wire       [40:0]   area_bissc_slave_23_m_postion;
  wire       [15:0]   area_emif_interface_emif_emif_data_write;
  wire                area_emif_interface_emif_emif_data_writeEnable;
  wire       [18:0]   area_emif_interface_apb_PADDR;
  wire       [0:0]    area_emif_interface_apb_PSEL;
  wire                area_emif_interface_apb_PENABLE;
  wire                area_emif_interface_apb_PWRITE;
  wire       [15:0]   area_emif_interface_apb_PWDATA;
  wire                area_ad5544_triger_apb_PREADY;
  wire       [15:0]   area_ad5544_triger_apb_PRDATA;
  wire                area_ad5544_triger_apb_PSLVERROR;
  wire                area_ad5544_triger_ad5544_tri;
  wire                area_ad5544_1_Ctrl_apb_PREADY;
  wire       [15:0]   area_ad5544_1_Ctrl_apb_PRDATA;
  wire                area_ad5544_1_Ctrl_apb_PSLVERROR;
  wire                area_ad5544_1_Ctrl_ad5544Interface_AD5544_CS;
  wire                area_ad5544_1_Ctrl_ad5544Interface_AD5544_LDAC;
  wire                area_ad5544_1_Ctrl_ad5544Interface_AD5544_MSB;
  wire                area_ad5544_1_Ctrl_ad5544Interface_AD5544_RS;
  wire                area_ad5544_1_Ctrl_ad5544Interface_AD5544_SCLK;
  wire                area_ad5544_1_Ctrl_ad5544Interface_AD5544_SDIN;
  wire                area_ad5544_2_Ctrl_apb_PREADY;
  wire       [15:0]   area_ad5544_2_Ctrl_apb_PRDATA;
  wire                area_ad5544_2_Ctrl_apb_PSLVERROR;
  wire                area_ad5544_2_Ctrl_ad5544Interface_AD5544_CS;
  wire                area_ad5544_2_Ctrl_ad5544Interface_AD5544_LDAC;
  wire                area_ad5544_2_Ctrl_ad5544Interface_AD5544_MSB;
  wire                area_ad5544_2_Ctrl_ad5544Interface_AD5544_RS;
  wire                area_ad5544_2_Ctrl_ad5544Interface_AD5544_SCLK;
  wire                area_ad5544_2_Ctrl_ad5544Interface_AD5544_SDIN;
  wire                area_bissc_ctrl_apb_PREADY;
  wire       [15:0]   area_bissc_ctrl_apb_PRDATA;
  wire                area_bissc_ctrl_apb_PSLVERROR;
  wire                area_bissc_ctrl_bisscInterface_enc_clk;
  wire       [40:0]   area_bissc_ctrl_enc_position_all;
  wire                area_apb_gpio_io_apb_PREADY;
  wire       [15:0]   area_apb_gpio_io_apb_PRDATA;
  wire                area_apb_gpio_io_apb_PSLVERROR;
  wire       [11:0]   area_apb_gpio_io_gpioA;
  wire       [11:0]   area_apb_gpio_io_gpioB;
  wire                area_apb_ram_apb_PREADY;
  wire       [15:0]   area_apb_ram_apb_PRDATA;
  wire                area_apb_ram_apb_PSLVERROR;
  wire                apb_decoder_io_input_PREADY;
  wire       [15:0]   apb_decoder_io_input_PRDATA;
  wire                apb_decoder_io_input_PSLVERROR;
  wire       [18:0]   apb_decoder_io_output_PADDR;
  wire       [5:0]    apb_decoder_io_output_PSEL;
  wire                apb_decoder_io_output_PENABLE;
  wire                apb_decoder_io_output_PWRITE;
  wire       [15:0]   apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [15:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [18:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [18:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [18:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [18:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire       [18:0]   apb3Router_1_io_outputs_4_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_4_PSEL;
  wire                apb3Router_1_io_outputs_4_PENABLE;
  wire                apb3Router_1_io_outputs_4_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_4_PWDATA;
  wire       [18:0]   apb3Router_1_io_outputs_5_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_5_PSEL;
  wire                apb3Router_1_io_outputs_5_PENABLE;
  wire                apb3Router_1_io_outputs_5_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_5_PWDATA;
  wire                area_bissc_slave_0_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_0_currentState;
  wire       [40:0]   area_bissc_slave_0_postion_temp;
  wire                area_bissc_slave_1_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_1_currentState;
  wire       [40:0]   area_bissc_slave_1_postion_temp;
  wire                area_bissc_slave_2_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_2_currentState;
  wire       [40:0]   area_bissc_slave_2_postion_temp;
  wire                area_bissc_slave_3_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_3_currentState;
  wire       [40:0]   area_bissc_slave_3_postion_temp;
  wire                area_bissc_slave_4_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_4_currentState;
  wire       [40:0]   area_bissc_slave_4_postion_temp;
  wire                area_bissc_slave_5_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_5_currentState;
  wire       [40:0]   area_bissc_slave_5_postion_temp;
  wire                area_bissc_slave_6_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_6_currentState;
  wire       [40:0]   area_bissc_slave_6_postion_temp;
  wire                area_bissc_slave_7_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_7_currentState;
  wire       [40:0]   area_bissc_slave_7_postion_temp;
  wire                area_bissc_slave_8_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_8_currentState;
  wire       [40:0]   area_bissc_slave_8_postion_temp;
  wire                area_bissc_slave_9_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_9_currentState;
  wire       [40:0]   area_bissc_slave_9_postion_temp;
  wire                area_bissc_slave_10_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_10_currentState;
  wire       [40:0]   area_bissc_slave_10_postion_temp;
  wire                area_bissc_slave_11_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_11_currentState;
  wire       [40:0]   area_bissc_slave_11_postion_temp;
  wire                area_bissc_slave_12_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_12_currentState;
  wire       [40:0]   area_bissc_slave_12_postion_temp;
  wire                area_bissc_slave_13_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_13_currentState;
  wire       [40:0]   area_bissc_slave_13_postion_temp;
  wire                area_bissc_slave_14_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_14_currentState;
  wire       [40:0]   area_bissc_slave_14_postion_temp;
  wire                area_bissc_slave_15_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_15_currentState;
  wire       [40:0]   area_bissc_slave_15_postion_temp;
  wire                area_bissc_slave_16_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_16_currentState;
  wire       [40:0]   area_bissc_slave_16_postion_temp;
  wire                area_bissc_slave_17_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_17_currentState;
  wire       [40:0]   area_bissc_slave_17_postion_temp;
  wire                area_bissc_slave_18_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_18_currentState;
  wire       [40:0]   area_bissc_slave_18_postion_temp;
  wire                area_bissc_slave_19_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_19_currentState;
  wire       [40:0]   area_bissc_slave_19_postion_temp;
  wire                area_bissc_slave_20_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_20_currentState;
  wire       [40:0]   area_bissc_slave_20_postion_temp;
  wire                area_bissc_slave_21_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_21_currentState;
  wire       [40:0]   area_bissc_slave_21_postion_temp;
  wire                area_bissc_slave_22_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_22_currentState;
  wire       [40:0]   area_bissc_slave_22_postion_temp;
  wire                area_bissc_slave_23_s_bissc_enc_data;
  wire       [2:0]    area_bissc_slave_23_currentState;
  wire       [40:0]   area_bissc_slave_23_postion_temp;
  wire       [42:0]   _zz_m_postion;
  wire       [41:0]   _zz_m_postion_1;
  wire       [40:0]   _zz_m_postion_2;
  wire       [42:0]   _zz_m_postion_3;
  wire       [41:0]   _zz_m_postion_4;
  wire       [40:0]   _zz_m_postion_5;
  wire       [42:0]   _zz_m_postion_6;
  wire       [41:0]   _zz_m_postion_7;
  wire       [40:0]   _zz_m_postion_8;
  wire       [42:0]   _zz_m_postion_9;
  wire       [41:0]   _zz_m_postion_10;
  wire       [40:0]   _zz_m_postion_11;
  wire       [42:0]   _zz_m_postion_12;
  wire       [41:0]   _zz_m_postion_13;
  wire       [40:0]   _zz_m_postion_14;
  wire       [42:0]   _zz_m_postion_15;
  wire       [41:0]   _zz_m_postion_16;
  wire       [40:0]   _zz_m_postion_17;
  wire       [42:0]   _zz_m_postion_18;
  wire       [41:0]   _zz_m_postion_19;
  wire       [40:0]   _zz_m_postion_20;
  wire       [42:0]   _zz_m_postion_21;
  wire       [41:0]   _zz_m_postion_22;
  wire       [40:0]   _zz_m_postion_23;
  wire       [42:0]   _zz_m_postion_24;
  wire       [41:0]   _zz_m_postion_25;
  wire       [40:0]   _zz_m_postion_26;
  wire       [42:0]   _zz_m_postion_27;
  wire       [41:0]   _zz_m_postion_28;
  wire       [40:0]   _zz_m_postion_29;
  wire       [42:0]   _zz_m_postion_30;
  wire       [41:0]   _zz_m_postion_31;
  wire       [40:0]   _zz_m_postion_32;
  wire       [42:0]   _zz_m_postion_33;
  wire       [41:0]   _zz_m_postion_34;
  wire       [40:0]   _zz_m_postion_35;
  wire       [42:0]   _zz_m_postion_36;
  wire       [41:0]   _zz_m_postion_37;
  wire       [40:0]   _zz_m_postion_38;
  wire       [42:0]   _zz_m_postion_39;
  wire       [41:0]   _zz_m_postion_40;
  wire       [40:0]   _zz_m_postion_41;
  wire       [42:0]   _zz_m_postion_42;
  wire       [41:0]   _zz_m_postion_43;
  wire       [40:0]   _zz_m_postion_44;
  wire       [42:0]   _zz_m_postion_45;
  wire       [41:0]   _zz_m_postion_46;
  wire       [40:0]   _zz_m_postion_47;
  wire       [42:0]   _zz_m_postion_48;
  wire       [41:0]   _zz_m_postion_49;
  wire       [40:0]   _zz_m_postion_50;
  wire       [42:0]   _zz_m_postion_51;
  wire       [41:0]   _zz_m_postion_52;
  wire       [40:0]   _zz_m_postion_53;
  wire       [42:0]   _zz_m_postion_54;
  wire       [41:0]   _zz_m_postion_55;
  wire       [40:0]   _zz_m_postion_56;
  wire       [42:0]   _zz_m_postion_57;
  wire       [41:0]   _zz_m_postion_58;
  wire       [40:0]   _zz_m_postion_59;
  wire       [42:0]   _zz_m_postion_60;
  wire       [41:0]   _zz_m_postion_61;
  wire       [40:0]   _zz_m_postion_62;
  wire       [42:0]   _zz_m_postion_63;
  wire       [41:0]   _zz_m_postion_64;
  wire       [40:0]   _zz_m_postion_65;
  wire       [42:0]   _zz_m_postion_66;
  wire       [41:0]   _zz_m_postion_67;
  wire       [40:0]   _zz_m_postion_68;
  wire       [42:0]   _zz_m_postion_69;
  wire       [41:0]   _zz_m_postion_70;
  wire       [40:0]   _zz_m_postion_71;
  wire       [40:0]   _zz_postion;
  wire       [25:0]   _zz_area_counter_valueNext;
  wire       [0:0]    _zz_area_counter_valueNext_1;
  reg                 _zz_emif_emif_data;
  (* MARK_DEBUG = "TRUE" *) wire       [15:0]   _zz_emif_emif_data_read;
  (* MARK_DEBUG = "TRUE" *) wire       [15:0]   _zz_emif_emif_data_1;
  (* MARK_DEBUG = "TRUE" *) wire                _zz_1;
  reg                 area_ledtemp;
  wire                area_counter_willIncrement;
  reg                 area_counter_willClear;
  reg        [25:0]   area_counter_valueNext;
  reg        [25:0]   area_counter_value;
  wire                area_counter_willOverflowIfInc;
  wire                area_counter_willOverflow;

  assign _zz_m_postion = ({1'd0,_zz_m_postion_1} <<< 1);
  assign _zz_m_postion_2 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_1 = {1'd0, _zz_m_postion_2};
  assign _zz_m_postion_3 = ({1'd0,_zz_m_postion_4} <<< 1);
  assign _zz_m_postion_5 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_4 = {1'd0, _zz_m_postion_5};
  assign _zz_m_postion_6 = ({1'd0,_zz_m_postion_7} <<< 1);
  assign _zz_m_postion_8 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_7 = {1'd0, _zz_m_postion_8};
  assign _zz_m_postion_9 = ({1'd0,_zz_m_postion_10} <<< 1);
  assign _zz_m_postion_11 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_10 = {1'd0, _zz_m_postion_11};
  assign _zz_m_postion_12 = ({1'd0,_zz_m_postion_13} <<< 1);
  assign _zz_m_postion_14 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_13 = {1'd0, _zz_m_postion_14};
  assign _zz_m_postion_15 = ({1'd0,_zz_m_postion_16} <<< 1);
  assign _zz_m_postion_17 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_16 = {1'd0, _zz_m_postion_17};
  assign _zz_m_postion_18 = ({1'd0,_zz_m_postion_19} <<< 1);
  assign _zz_m_postion_20 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_19 = {1'd0, _zz_m_postion_20};
  assign _zz_m_postion_21 = ({1'd0,_zz_m_postion_22} <<< 1);
  assign _zz_m_postion_23 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_22 = {1'd0, _zz_m_postion_23};
  assign _zz_m_postion_24 = ({1'd0,_zz_m_postion_25} <<< 1);
  assign _zz_m_postion_26 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_25 = {1'd0, _zz_m_postion_26};
  assign _zz_m_postion_27 = ({1'd0,_zz_m_postion_28} <<< 1);
  assign _zz_m_postion_29 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_28 = {1'd0, _zz_m_postion_29};
  assign _zz_m_postion_30 = ({1'd0,_zz_m_postion_31} <<< 1);
  assign _zz_m_postion_32 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_31 = {1'd0, _zz_m_postion_32};
  assign _zz_m_postion_33 = ({1'd0,_zz_m_postion_34} <<< 1);
  assign _zz_m_postion_35 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_34 = {1'd0, _zz_m_postion_35};
  assign _zz_m_postion_36 = ({1'd0,_zz_m_postion_37} <<< 1);
  assign _zz_m_postion_38 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_37 = {1'd0, _zz_m_postion_38};
  assign _zz_m_postion_39 = ({1'd0,_zz_m_postion_40} <<< 1);
  assign _zz_m_postion_41 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_40 = {1'd0, _zz_m_postion_41};
  assign _zz_m_postion_42 = ({1'd0,_zz_m_postion_43} <<< 1);
  assign _zz_m_postion_44 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_43 = {1'd0, _zz_m_postion_44};
  assign _zz_m_postion_45 = ({1'd0,_zz_m_postion_46} <<< 1);
  assign _zz_m_postion_47 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_46 = {1'd0, _zz_m_postion_47};
  assign _zz_m_postion_48 = ({1'd0,_zz_m_postion_49} <<< 1);
  assign _zz_m_postion_50 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_49 = {1'd0, _zz_m_postion_50};
  assign _zz_m_postion_51 = ({1'd0,_zz_m_postion_52} <<< 1);
  assign _zz_m_postion_53 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_52 = {1'd0, _zz_m_postion_53};
  assign _zz_m_postion_54 = ({1'd0,_zz_m_postion_55} <<< 1);
  assign _zz_m_postion_56 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_55 = {1'd0, _zz_m_postion_56};
  assign _zz_m_postion_57 = ({1'd0,_zz_m_postion_58} <<< 1);
  assign _zz_m_postion_59 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_58 = {1'd0, _zz_m_postion_59};
  assign _zz_m_postion_60 = ({1'd0,_zz_m_postion_61} <<< 1);
  assign _zz_m_postion_62 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_61 = {1'd0, _zz_m_postion_62};
  assign _zz_m_postion_63 = ({1'd0,_zz_m_postion_64} <<< 1);
  assign _zz_m_postion_65 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_64 = {1'd0, _zz_m_postion_65};
  assign _zz_m_postion_66 = ({1'd0,_zz_m_postion_67} <<< 1);
  assign _zz_m_postion_68 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_67 = {1'd0, _zz_m_postion_68};
  assign _zz_m_postion_69 = ({1'd0,_zz_m_postion_70} <<< 1);
  assign _zz_m_postion_71 = area_bissc_ctrl_enc_position_all;
  assign _zz_m_postion_70 = {1'd0, _zz_m_postion_71};
  assign _zz_postion = area_bissc_ctrl_enc_position_all;
  assign _zz_area_counter_valueNext_1 = area_counter_willIncrement;
  assign _zz_area_counter_valueNext = {25'd0, _zz_area_counter_valueNext_1};
  Emif_Apb area_emif_interface (
    .emif_emif_addr                (emif_emif_addr[18:0]                            ), //i
    .emif_emif_data_read           (_zz_emif_emif_data_read[15:0]                   ), //i
    .emif_emif_data_write          (area_emif_interface_emif_emif_data_write[15:0]  ), //o
    .emif_emif_data_writeEnable    (area_emif_interface_emif_emif_data_writeEnable  ), //o
    .emif_emif_cs                  (emif_emif_cs                                    ), //i
    .emif_emif_we                  (emif_emif_we                                    ), //i
    .emif_emif_oe                  (emif_emif_oe                                    ), //i
    .apb_PADDR                     (area_emif_interface_apb_PADDR[18:0]             ), //o
    .apb_PSEL                      (area_emif_interface_apb_PSEL                    ), //o
    .apb_PENABLE                   (area_emif_interface_apb_PENABLE                 ), //o
    .apb_PREADY                    (apb_decoder_io_input_PREADY                     ), //i
    .apb_PWRITE                    (area_emif_interface_apb_PWRITE                  ), //o
    .apb_PWDATA                    (area_emif_interface_apb_PWDATA[15:0]            ), //o
    .apb_PRDATA                    (apb_decoder_io_input_PRDATA[15:0]               ), //i
    .apb_PSLVERROR                 (apb_decoder_io_input_PSLVERROR                  ), //i
    .clk                           (clk                                             ), //i
    .reset                         (reset                                           )  //i
  );
  AD5544_triger area_ad5544_triger (
    .apb_PADDR        (area_ad5544_triger_apb_PADDR[3:0]       ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_0_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_0_PENABLE       ), //i
    .apb_PREADY       (area_ad5544_triger_apb_PREADY           ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_0_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[15:0]  ), //i
    .apb_PRDATA       (area_ad5544_triger_apb_PRDATA[15:0]     ), //o
    .apb_PSLVERROR    (area_ad5544_triger_apb_PSLVERROR        ), //o
    .ad5544_tri       (area_ad5544_triger_ad5544_tri           ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  AD5544 area_ad5544_1_Ctrl (
    .apb_PADDR                      (area_ad5544_1_Ctrl_apb_PADDR[3:0]               ), //i
    .apb_PSEL                       (apb3Router_1_io_outputs_1_PSEL                  ), //i
    .apb_PENABLE                    (apb3Router_1_io_outputs_1_PENABLE               ), //i
    .apb_PREADY                     (area_ad5544_1_Ctrl_apb_PREADY                   ), //o
    .apb_PWRITE                     (apb3Router_1_io_outputs_1_PWRITE                ), //i
    .apb_PWDATA                     (apb3Router_1_io_outputs_1_PWDATA[15:0]          ), //i
    .apb_PRDATA                     (area_ad5544_1_Ctrl_apb_PRDATA[15:0]             ), //o
    .apb_PSLVERROR                  (area_ad5544_1_Ctrl_apb_PSLVERROR                ), //o
    .ad5544Interface_AD5544_CS      (area_ad5544_1_Ctrl_ad5544Interface_AD5544_CS    ), //o
    .ad5544Interface_AD5544_LDAC    (area_ad5544_1_Ctrl_ad5544Interface_AD5544_LDAC  ), //o
    .ad5544Interface_AD5544_MSB     (area_ad5544_1_Ctrl_ad5544Interface_AD5544_MSB   ), //o
    .ad5544Interface_AD5544_RS      (area_ad5544_1_Ctrl_ad5544Interface_AD5544_RS    ), //o
    .ad5544Interface_AD5544_SCLK    (area_ad5544_1_Ctrl_ad5544Interface_AD5544_SCLK  ), //o
    .ad5544Interface_AD5544_SDIN    (area_ad5544_1_Ctrl_ad5544Interface_AD5544_SDIN  ), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           ), //i
    .ad5544_enable                  (area_ad5544_triger_ad5544_tri                   )  //i
  );
  AD5544 area_ad5544_2_Ctrl (
    .apb_PADDR                      (area_ad5544_2_Ctrl_apb_PADDR[3:0]               ), //i
    .apb_PSEL                       (apb3Router_1_io_outputs_2_PSEL                  ), //i
    .apb_PENABLE                    (apb3Router_1_io_outputs_2_PENABLE               ), //i
    .apb_PREADY                     (area_ad5544_2_Ctrl_apb_PREADY                   ), //o
    .apb_PWRITE                     (apb3Router_1_io_outputs_2_PWRITE                ), //i
    .apb_PWDATA                     (apb3Router_1_io_outputs_2_PWDATA[15:0]          ), //i
    .apb_PRDATA                     (area_ad5544_2_Ctrl_apb_PRDATA[15:0]             ), //o
    .apb_PSLVERROR                  (area_ad5544_2_Ctrl_apb_PSLVERROR                ), //o
    .ad5544Interface_AD5544_CS      (area_ad5544_2_Ctrl_ad5544Interface_AD5544_CS    ), //o
    .ad5544Interface_AD5544_LDAC    (area_ad5544_2_Ctrl_ad5544Interface_AD5544_LDAC  ), //o
    .ad5544Interface_AD5544_MSB     (area_ad5544_2_Ctrl_ad5544Interface_AD5544_MSB   ), //o
    .ad5544Interface_AD5544_RS      (area_ad5544_2_Ctrl_ad5544Interface_AD5544_RS    ), //o
    .ad5544Interface_AD5544_SCLK    (area_ad5544_2_Ctrl_ad5544Interface_AD5544_SCLK  ), //o
    .ad5544Interface_AD5544_SDIN    (area_ad5544_2_Ctrl_ad5544Interface_AD5544_SDIN  ), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           ), //i
    .ad5544_enable                  (area_ad5544_triger_ad5544_tri                   )  //i
  );
  Biss_C area_bissc_ctrl (
    .apb_PADDR                  (area_bissc_ctrl_apb_PADDR[3:0]          ), //i
    .apb_PSEL                   (apb3Router_1_io_outputs_3_PSEL          ), //i
    .apb_PENABLE                (apb3Router_1_io_outputs_3_PENABLE       ), //i
    .apb_PREADY                 (area_bissc_ctrl_apb_PREADY              ), //o
    .apb_PWRITE                 (apb3Router_1_io_outputs_3_PWRITE        ), //i
    .apb_PWDATA                 (apb3Router_1_io_outputs_3_PWDATA[15:0]  ), //i
    .apb_PRDATA                 (area_bissc_ctrl_apb_PRDATA[15:0]        ), //o
    .apb_PSLVERROR              (area_bissc_ctrl_apb_PSLVERROR           ), //o
    .bisscInterface_enc_clk     (area_bissc_ctrl_bisscInterface_enc_clk  ), //o
    .bisscInterface_enc_data    (bissc_master_enc_data                   ), //i
    .clk                        (clk                                     ), //i
    .reset                      (reset                                   ), //i
    .enc_position_all           (area_bissc_ctrl_enc_position_all[40:0]  )  //o
  );
  Mlmc300_Gpio area_apb_gpio (
    .io_apb_PADDR        (area_apb_gpio_io_apb_PADDR[3:0]         ), //i
    .io_apb_PSEL         (apb3Router_1_io_outputs_4_PSEL          ), //i
    .io_apb_PENABLE      (apb3Router_1_io_outputs_4_PENABLE       ), //i
    .io_apb_PREADY       (area_apb_gpio_io_apb_PREADY             ), //o
    .io_apb_PWRITE       (apb3Router_1_io_outputs_4_PWRITE        ), //i
    .io_apb_PWDATA       (apb3Router_1_io_outputs_4_PWDATA[15:0]  ), //i
    .io_apb_PRDATA       (area_apb_gpio_io_apb_PRDATA[15:0]       ), //o
    .io_apb_PSLVERROR    (area_apb_gpio_io_apb_PSLVERROR          ), //o
    .io_gpioA            (area_apb_gpio_io_gpioA[11:0]            ), //o
    .io_gpioB            (area_apb_gpio_io_gpioB[11:0]            ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  ApbRam area_apb_ram (
    .apb_PADDR        (area_apb_ram_apb_PADDR[3:0]             ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_5_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_5_PENABLE       ), //i
    .apb_PREADY       (area_apb_ram_apb_PREADY                 ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_5_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_5_PWDATA[15:0]  ), //i
    .apb_PRDATA       (area_apb_ram_apb_PRDATA[15:0]           ), //o
    .apb_PSLVERROR    (area_apb_ram_apb_PSLVERROR              ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  Apb3Decoder apb_decoder (
    .io_input_PADDR         (area_emif_interface_apb_PADDR[18:0]   ), //i
    .io_input_PSEL          (area_emif_interface_apb_PSEL          ), //i
    .io_input_PENABLE       (area_emif_interface_apb_PENABLE       ), //i
    .io_input_PREADY        (apb_decoder_io_input_PREADY           ), //o
    .io_input_PWRITE        (area_emif_interface_apb_PWRITE        ), //i
    .io_input_PWDATA        (area_emif_interface_apb_PWDATA[15:0]  ), //i
    .io_input_PRDATA        (apb_decoder_io_input_PRDATA[15:0]     ), //o
    .io_input_PSLVERROR     (apb_decoder_io_input_PSLVERROR        ), //o
    .io_output_PADDR        (apb_decoder_io_output_PADDR[18:0]     ), //o
    .io_output_PSEL         (apb_decoder_io_output_PSEL[5:0]       ), //o
    .io_output_PENABLE      (apb_decoder_io_output_PENABLE         ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY          ), //i
    .io_output_PWRITE       (apb_decoder_io_output_PWRITE          ), //o
    .io_output_PWDATA       (apb_decoder_io_output_PWDATA[15:0]    ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[15:0]    ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR       )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR            (apb_decoder_io_output_PADDR[18:0]       ), //i
    .io_input_PSEL             (apb_decoder_io_output_PSEL[5:0]         ), //i
    .io_input_PENABLE          (apb_decoder_io_output_PENABLE           ), //i
    .io_input_PREADY           (apb3Router_1_io_input_PREADY            ), //o
    .io_input_PWRITE           (apb_decoder_io_output_PWRITE            ), //i
    .io_input_PWDATA           (apb_decoder_io_output_PWDATA[15:0]      ), //i
    .io_input_PRDATA           (apb3Router_1_io_input_PRDATA[15:0]      ), //o
    .io_input_PSLVERROR        (apb3Router_1_io_input_PSLVERROR         ), //o
    .io_outputs_0_PADDR        (apb3Router_1_io_outputs_0_PADDR[18:0]   ), //o
    .io_outputs_0_PSEL         (apb3Router_1_io_outputs_0_PSEL          ), //o
    .io_outputs_0_PENABLE      (apb3Router_1_io_outputs_0_PENABLE       ), //o
    .io_outputs_0_PREADY       (area_ad5544_triger_apb_PREADY           ), //i
    .io_outputs_0_PWRITE       (apb3Router_1_io_outputs_0_PWRITE        ), //o
    .io_outputs_0_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[15:0]  ), //o
    .io_outputs_0_PRDATA       (area_ad5544_triger_apb_PRDATA[15:0]     ), //i
    .io_outputs_0_PSLVERROR    (area_ad5544_triger_apb_PSLVERROR        ), //i
    .io_outputs_1_PADDR        (apb3Router_1_io_outputs_1_PADDR[18:0]   ), //o
    .io_outputs_1_PSEL         (apb3Router_1_io_outputs_1_PSEL          ), //o
    .io_outputs_1_PENABLE      (apb3Router_1_io_outputs_1_PENABLE       ), //o
    .io_outputs_1_PREADY       (area_ad5544_1_Ctrl_apb_PREADY           ), //i
    .io_outputs_1_PWRITE       (apb3Router_1_io_outputs_1_PWRITE        ), //o
    .io_outputs_1_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[15:0]  ), //o
    .io_outputs_1_PRDATA       (area_ad5544_1_Ctrl_apb_PRDATA[15:0]     ), //i
    .io_outputs_1_PSLVERROR    (area_ad5544_1_Ctrl_apb_PSLVERROR        ), //i
    .io_outputs_2_PADDR        (apb3Router_1_io_outputs_2_PADDR[18:0]   ), //o
    .io_outputs_2_PSEL         (apb3Router_1_io_outputs_2_PSEL          ), //o
    .io_outputs_2_PENABLE      (apb3Router_1_io_outputs_2_PENABLE       ), //o
    .io_outputs_2_PREADY       (area_ad5544_2_Ctrl_apb_PREADY           ), //i
    .io_outputs_2_PWRITE       (apb3Router_1_io_outputs_2_PWRITE        ), //o
    .io_outputs_2_PWDATA       (apb3Router_1_io_outputs_2_PWDATA[15:0]  ), //o
    .io_outputs_2_PRDATA       (area_ad5544_2_Ctrl_apb_PRDATA[15:0]     ), //i
    .io_outputs_2_PSLVERROR    (area_ad5544_2_Ctrl_apb_PSLVERROR        ), //i
    .io_outputs_3_PADDR        (apb3Router_1_io_outputs_3_PADDR[18:0]   ), //o
    .io_outputs_3_PSEL         (apb3Router_1_io_outputs_3_PSEL          ), //o
    .io_outputs_3_PENABLE      (apb3Router_1_io_outputs_3_PENABLE       ), //o
    .io_outputs_3_PREADY       (area_bissc_ctrl_apb_PREADY              ), //i
    .io_outputs_3_PWRITE       (apb3Router_1_io_outputs_3_PWRITE        ), //o
    .io_outputs_3_PWDATA       (apb3Router_1_io_outputs_3_PWDATA[15:0]  ), //o
    .io_outputs_3_PRDATA       (area_bissc_ctrl_apb_PRDATA[15:0]        ), //i
    .io_outputs_3_PSLVERROR    (area_bissc_ctrl_apb_PSLVERROR           ), //i
    .io_outputs_4_PADDR        (apb3Router_1_io_outputs_4_PADDR[18:0]   ), //o
    .io_outputs_4_PSEL         (apb3Router_1_io_outputs_4_PSEL          ), //o
    .io_outputs_4_PENABLE      (apb3Router_1_io_outputs_4_PENABLE       ), //o
    .io_outputs_4_PREADY       (area_apb_gpio_io_apb_PREADY             ), //i
    .io_outputs_4_PWRITE       (apb3Router_1_io_outputs_4_PWRITE        ), //o
    .io_outputs_4_PWDATA       (apb3Router_1_io_outputs_4_PWDATA[15:0]  ), //o
    .io_outputs_4_PRDATA       (area_apb_gpio_io_apb_PRDATA[15:0]       ), //i
    .io_outputs_4_PSLVERROR    (area_apb_gpio_io_apb_PSLVERROR          ), //i
    .io_outputs_5_PADDR        (apb3Router_1_io_outputs_5_PADDR[18:0]   ), //o
    .io_outputs_5_PSEL         (apb3Router_1_io_outputs_5_PSEL          ), //o
    .io_outputs_5_PENABLE      (apb3Router_1_io_outputs_5_PENABLE       ), //o
    .io_outputs_5_PREADY       (area_apb_ram_apb_PREADY                 ), //i
    .io_outputs_5_PWRITE       (apb3Router_1_io_outputs_5_PWRITE        ), //o
    .io_outputs_5_PWDATA       (apb3Router_1_io_outputs_5_PWDATA[15:0]  ), //o
    .io_outputs_5_PRDATA       (area_apb_ram_apb_PRDATA[15:0]           ), //i
    .io_outputs_5_PSLVERROR    (area_apb_ram_apb_PSLVERROR              ), //i
    .clk                       (clk                                     ), //i
    .reset                     (reset                                   )  //i
  );
  BissC_Slave area_bissc_slave_0 (
    .s_bissc_enc_clk     (bissc_slave_0_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_0_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_0_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_0_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_0_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_1 area_bissc_slave_1 (
    .s_bissc_enc_clk     (bissc_slave_1_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_1_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_1_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_1_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_1_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_2 area_bissc_slave_2 (
    .s_bissc_enc_clk     (bissc_slave_2_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_2_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_2_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_2_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_2_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_3 area_bissc_slave_3 (
    .s_bissc_enc_clk     (bissc_slave_3_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_3_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_3_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_3_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_3_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_4 area_bissc_slave_4 (
    .s_bissc_enc_clk     (bissc_slave_4_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_4_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_4_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_4_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_4_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_5 area_bissc_slave_5 (
    .s_bissc_enc_clk     (bissc_slave_5_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_5_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_5_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_5_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_5_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_6 area_bissc_slave_6 (
    .s_bissc_enc_clk     (bissc_slave_6_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_6_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_6_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_6_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_6_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_7 area_bissc_slave_7 (
    .s_bissc_enc_clk     (bissc_slave_7_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_7_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_7_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_7_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_7_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_8 area_bissc_slave_8 (
    .s_bissc_enc_clk     (bissc_slave_8_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_8_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_8_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_8_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_8_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_9 area_bissc_slave_9 (
    .s_bissc_enc_clk     (bissc_slave_9_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_9_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_9_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_9_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_9_postion_temp[40:0]  ), //o
    .clk                 (clk                                    ), //i
    .reset               (reset                                  )  //i
  );
  BissC_Slave_10 area_bissc_slave_10 (
    .s_bissc_enc_clk     (bissc_slave_10_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_10_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_10_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_10_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_10_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_11 area_bissc_slave_11 (
    .s_bissc_enc_clk     (bissc_slave_11_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_11_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_11_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_11_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_11_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_12 area_bissc_slave_12 (
    .s_bissc_enc_clk     (bissc_slave_12_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_12_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_12_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_12_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_12_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_13 area_bissc_slave_13 (
    .s_bissc_enc_clk     (bissc_slave_13_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_13_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_13_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_13_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_13_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_14 area_bissc_slave_14 (
    .s_bissc_enc_clk     (bissc_slave_14_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_14_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_14_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_14_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_14_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_15 area_bissc_slave_15 (
    .s_bissc_enc_clk     (bissc_slave_15_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_15_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_15_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_15_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_15_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_16 area_bissc_slave_16 (
    .s_bissc_enc_clk     (bissc_slave_16_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_16_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_16_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_16_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_16_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_17 area_bissc_slave_17 (
    .s_bissc_enc_clk     (bissc_slave_17_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_17_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_17_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_17_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_17_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_18 area_bissc_slave_18 (
    .s_bissc_enc_clk     (bissc_slave_18_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_18_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_18_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_18_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_18_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_19 area_bissc_slave_19 (
    .s_bissc_enc_clk     (bissc_slave_19_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_19_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_19_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_19_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_19_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_20 area_bissc_slave_20 (
    .s_bissc_enc_clk     (bissc_slave_20_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_20_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_20_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_20_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_20_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_21 area_bissc_slave_21 (
    .s_bissc_enc_clk     (bissc_slave_21_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_21_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_21_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_21_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_21_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_22 area_bissc_slave_22 (
    .s_bissc_enc_clk     (bissc_slave_22_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_22_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_22_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_22_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_22_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  BissC_Slave_23 area_bissc_slave_23 (
    .s_bissc_enc_clk     (bissc_slave_23_enc_clk                  ), //i
    .s_bissc_enc_data    (area_bissc_slave_23_s_bissc_enc_data    ), //o
    .m_postion           (area_bissc_slave_23_m_postion[40:0]     ), //i
    .currentState        (area_bissc_slave_23_currentState[2:0]   ), //o
    .postion_temp        (area_bissc_slave_23_postion_temp[40:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  assign emif_emif_data = _zz_emif_emif_data ? _zz_emif_emif_data_1 : 16'bzzzzzzzzzzzzzzzz;
  always @(*) begin
    _zz_emif_emif_data = 1'b0;
    if(_zz_1) begin
      _zz_emif_emif_data = 1'b1;
    end
  end

  assign _zz_emif_emif_data_1 = area_emif_interface_emif_emif_data_write;
  assign _zz_1 = area_emif_interface_emif_emif_data_writeEnable;
  assign ad5544_A_AD5544_CS = area_ad5544_1_Ctrl_ad5544Interface_AD5544_CS;
  assign ad5544_A_AD5544_LDAC = area_ad5544_1_Ctrl_ad5544Interface_AD5544_LDAC;
  assign ad5544_A_AD5544_MSB = area_ad5544_1_Ctrl_ad5544Interface_AD5544_MSB;
  assign ad5544_A_AD5544_RS = area_ad5544_1_Ctrl_ad5544Interface_AD5544_RS;
  assign ad5544_A_AD5544_SCLK = area_ad5544_1_Ctrl_ad5544Interface_AD5544_SCLK;
  assign ad5544_A_AD5544_SDIN = area_ad5544_1_Ctrl_ad5544Interface_AD5544_SDIN;
  assign ad5544_B_AD5544_CS = area_ad5544_2_Ctrl_ad5544Interface_AD5544_CS;
  assign ad5544_B_AD5544_LDAC = area_ad5544_2_Ctrl_ad5544Interface_AD5544_LDAC;
  assign ad5544_B_AD5544_MSB = area_ad5544_2_Ctrl_ad5544Interface_AD5544_MSB;
  assign ad5544_B_AD5544_RS = area_ad5544_2_Ctrl_ad5544Interface_AD5544_RS;
  assign ad5544_B_AD5544_SCLK = area_ad5544_2_Ctrl_ad5544Interface_AD5544_SCLK;
  assign ad5544_B_AD5544_SDIN = area_ad5544_2_Ctrl_ad5544Interface_AD5544_SDIN;
  assign bissc_master_enc_clk = area_bissc_ctrl_bisscInterface_enc_clk;
  assign gpioA = area_apb_gpio_io_gpioA;
  assign gpioB = area_apb_gpio_io_gpioB;
  assign area_ad5544_triger_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign area_ad5544_1_Ctrl_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign area_ad5544_2_Ctrl_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign area_bissc_ctrl_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[3:0];
  assign area_apb_gpio_io_apb_PADDR = apb3Router_1_io_outputs_4_PADDR[3:0];
  assign area_apb_ram_apb_PADDR = apb3Router_1_io_outputs_5_PADDR[3:0];
  assign bissc_slave_0_enc_data = area_bissc_slave_0_s_bissc_enc_data;
  assign area_bissc_slave_0_m_postion = _zz_m_postion[40:0];
  assign bissc_slave_1_enc_data = area_bissc_slave_1_s_bissc_enc_data;
  assign area_bissc_slave_1_m_postion = _zz_m_postion_3[40:0];
  assign bissc_slave_2_enc_data = area_bissc_slave_2_s_bissc_enc_data;
  assign area_bissc_slave_2_m_postion = _zz_m_postion_6[40:0];
  assign bissc_slave_3_enc_data = area_bissc_slave_3_s_bissc_enc_data;
  assign area_bissc_slave_3_m_postion = _zz_m_postion_9[40:0];
  assign bissc_slave_4_enc_data = area_bissc_slave_4_s_bissc_enc_data;
  assign area_bissc_slave_4_m_postion = _zz_m_postion_12[40:0];
  assign bissc_slave_5_enc_data = area_bissc_slave_5_s_bissc_enc_data;
  assign area_bissc_slave_5_m_postion = _zz_m_postion_15[40:0];
  assign bissc_slave_6_enc_data = area_bissc_slave_6_s_bissc_enc_data;
  assign area_bissc_slave_6_m_postion = _zz_m_postion_18[40:0];
  assign bissc_slave_7_enc_data = area_bissc_slave_7_s_bissc_enc_data;
  assign area_bissc_slave_7_m_postion = _zz_m_postion_21[40:0];
  assign bissc_slave_8_enc_data = area_bissc_slave_8_s_bissc_enc_data;
  assign area_bissc_slave_8_m_postion = _zz_m_postion_24[40:0];
  assign bissc_slave_9_enc_data = area_bissc_slave_9_s_bissc_enc_data;
  assign area_bissc_slave_9_m_postion = _zz_m_postion_27[40:0];
  assign bissc_slave_10_enc_data = area_bissc_slave_10_s_bissc_enc_data;
  assign area_bissc_slave_10_m_postion = _zz_m_postion_30[40:0];
  assign bissc_slave_11_enc_data = area_bissc_slave_11_s_bissc_enc_data;
  assign area_bissc_slave_11_m_postion = _zz_m_postion_33[40:0];
  assign bissc_slave_12_enc_data = area_bissc_slave_12_s_bissc_enc_data;
  assign area_bissc_slave_12_m_postion = _zz_m_postion_36[40:0];
  assign bissc_slave_13_enc_data = area_bissc_slave_13_s_bissc_enc_data;
  assign area_bissc_slave_13_m_postion = _zz_m_postion_39[40:0];
  assign bissc_slave_14_enc_data = area_bissc_slave_14_s_bissc_enc_data;
  assign area_bissc_slave_14_m_postion = _zz_m_postion_42[40:0];
  assign bissc_slave_15_enc_data = area_bissc_slave_15_s_bissc_enc_data;
  assign area_bissc_slave_15_m_postion = _zz_m_postion_45[40:0];
  assign bissc_slave_16_enc_data = area_bissc_slave_16_s_bissc_enc_data;
  assign area_bissc_slave_16_m_postion = _zz_m_postion_48[40:0];
  assign bissc_slave_17_enc_data = area_bissc_slave_17_s_bissc_enc_data;
  assign area_bissc_slave_17_m_postion = _zz_m_postion_51[40:0];
  assign bissc_slave_18_enc_data = area_bissc_slave_18_s_bissc_enc_data;
  assign area_bissc_slave_18_m_postion = _zz_m_postion_54[40:0];
  assign bissc_slave_19_enc_data = area_bissc_slave_19_s_bissc_enc_data;
  assign area_bissc_slave_19_m_postion = _zz_m_postion_57[40:0];
  assign bissc_slave_20_enc_data = area_bissc_slave_20_s_bissc_enc_data;
  assign area_bissc_slave_20_m_postion = _zz_m_postion_60[40:0];
  assign bissc_slave_21_enc_data = area_bissc_slave_21_s_bissc_enc_data;
  assign area_bissc_slave_21_m_postion = _zz_m_postion_63[40:0];
  assign bissc_slave_22_enc_data = area_bissc_slave_22_s_bissc_enc_data;
  assign area_bissc_slave_22_m_postion = _zz_m_postion_66[40:0];
  assign bissc_slave_23_enc_data = area_bissc_slave_23_s_bissc_enc_data;
  assign area_bissc_slave_23_m_postion = _zz_m_postion_69[40:0];
  assign currentState = area_bissc_slave_0_currentState;
  assign postion = _zz_postion[40 : 9];
  assign postion_all = area_bissc_ctrl_enc_position_all;
  assign postion_temp = area_bissc_slave_0_postion_temp;
  always @(*) begin
    area_counter_willClear = 1'b0;
    if(area_counter_willOverflow) begin
      area_counter_willClear = 1'b1;
    end
  end

  assign area_counter_willOverflowIfInc = (area_counter_value == 26'h2faf07f);
  assign area_counter_willOverflow = (area_counter_willOverflowIfInc && area_counter_willIncrement);
  always @(*) begin
    if(area_counter_willOverflow) begin
      area_counter_valueNext = 26'h0;
    end else begin
      area_counter_valueNext = (area_counter_value + _zz_area_counter_valueNext);
    end
    if(area_counter_willClear) begin
      area_counter_valueNext = 26'h0;
    end
  end

  assign area_counter_willIncrement = 1'b1;
  assign led = area_ledtemp;
  assign _zz_emif_emif_data_read = emif_emif_data;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      area_ledtemp <= 1'b0;
      area_counter_value <= 26'h0;
    end else begin
      area_counter_value <= area_counter_valueNext;
      if(area_counter_willOverflow) begin
        area_ledtemp <= (! area_ledtemp);
      end
    end
  end


endmodule

module BissC_Slave_23 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_23_BOOT = 3'd0;
  localparam fsm_enumDef_23_Wait_Start = 3'd1;
  localparam fsm_enumDef_23_Slo = 3'd2;
  localparam fsm_enumDef_23_Ack = 3'd3;
  localparam fsm_enumDef_23_Start = 3'd4;
  localparam fsm_enumDef_23_Zero = 3'd5;
  localparam fsm_enumDef_23_PostionOut = 3'd6;
  localparam fsm_enumDef_23_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_23_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_23_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_23_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_23_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_23_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_23_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_23_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_23_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_23_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_23_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_23_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_23_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_23_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_23_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_23_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_23_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_23_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_23_Slo;
        end
      end
      fsm_enumDef_23_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_23_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_23_Wait_Start;
        end
      end
      fsm_enumDef_23_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_23_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_23_Wait_Start;
        end
      end
      fsm_enumDef_23_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_23_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_23_Wait_Start;
        end
      end
      fsm_enumDef_23_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_23_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_23_Wait_Start;
        end
      end
      fsm_enumDef_23_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_23_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_23_Wait_Start;
        end
      end
      fsm_enumDef_23_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_23_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_23_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_23_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_23_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_23_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_23_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_23_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_23_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_23_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_23_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_23_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_23_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_23_Slo : begin
      end
      fsm_enumDef_23_Ack : begin
      end
      fsm_enumDef_23_Start : begin
      end
      fsm_enumDef_23_Zero : begin
      end
      fsm_enumDef_23_PostionOut : begin
      end
      fsm_enumDef_23_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_22 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_22_BOOT = 3'd0;
  localparam fsm_enumDef_22_Wait_Start = 3'd1;
  localparam fsm_enumDef_22_Slo = 3'd2;
  localparam fsm_enumDef_22_Ack = 3'd3;
  localparam fsm_enumDef_22_Start = 3'd4;
  localparam fsm_enumDef_22_Zero = 3'd5;
  localparam fsm_enumDef_22_PostionOut = 3'd6;
  localparam fsm_enumDef_22_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_22_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_22_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_22_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_22_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_22_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_22_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_22_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_22_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_22_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_22_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_22_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_22_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_22_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_22_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_22_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_22_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_22_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_22_Slo;
        end
      end
      fsm_enumDef_22_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_22_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_22_Wait_Start;
        end
      end
      fsm_enumDef_22_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_22_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_22_Wait_Start;
        end
      end
      fsm_enumDef_22_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_22_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_22_Wait_Start;
        end
      end
      fsm_enumDef_22_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_22_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_22_Wait_Start;
        end
      end
      fsm_enumDef_22_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_22_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_22_Wait_Start;
        end
      end
      fsm_enumDef_22_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_22_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_22_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_22_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_22_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_22_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_22_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_22_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_22_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_22_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_22_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_22_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_22_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_22_Slo : begin
      end
      fsm_enumDef_22_Ack : begin
      end
      fsm_enumDef_22_Start : begin
      end
      fsm_enumDef_22_Zero : begin
      end
      fsm_enumDef_22_PostionOut : begin
      end
      fsm_enumDef_22_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_21 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_21_BOOT = 3'd0;
  localparam fsm_enumDef_21_Wait_Start = 3'd1;
  localparam fsm_enumDef_21_Slo = 3'd2;
  localparam fsm_enumDef_21_Ack = 3'd3;
  localparam fsm_enumDef_21_Start = 3'd4;
  localparam fsm_enumDef_21_Zero = 3'd5;
  localparam fsm_enumDef_21_PostionOut = 3'd6;
  localparam fsm_enumDef_21_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_21_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_21_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_21_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_21_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_21_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_21_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_21_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_21_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_21_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_21_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_21_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_21_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_21_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_21_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_21_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_21_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_21_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_21_Slo;
        end
      end
      fsm_enumDef_21_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_21_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_21_Wait_Start;
        end
      end
      fsm_enumDef_21_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_21_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_21_Wait_Start;
        end
      end
      fsm_enumDef_21_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_21_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_21_Wait_Start;
        end
      end
      fsm_enumDef_21_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_21_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_21_Wait_Start;
        end
      end
      fsm_enumDef_21_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_21_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_21_Wait_Start;
        end
      end
      fsm_enumDef_21_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_21_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_21_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_21_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_21_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_21_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_21_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_21_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_21_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_21_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_21_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_21_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_21_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_21_Slo : begin
      end
      fsm_enumDef_21_Ack : begin
      end
      fsm_enumDef_21_Start : begin
      end
      fsm_enumDef_21_Zero : begin
      end
      fsm_enumDef_21_PostionOut : begin
      end
      fsm_enumDef_21_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_20 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_20_BOOT = 3'd0;
  localparam fsm_enumDef_20_Wait_Start = 3'd1;
  localparam fsm_enumDef_20_Slo = 3'd2;
  localparam fsm_enumDef_20_Ack = 3'd3;
  localparam fsm_enumDef_20_Start = 3'd4;
  localparam fsm_enumDef_20_Zero = 3'd5;
  localparam fsm_enumDef_20_PostionOut = 3'd6;
  localparam fsm_enumDef_20_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_20_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_20_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_20_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_20_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_20_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_20_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_20_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_20_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_20_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_20_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_20_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_20_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_20_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_20_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_20_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_20_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_20_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_20_Slo;
        end
      end
      fsm_enumDef_20_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_20_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_20_Wait_Start;
        end
      end
      fsm_enumDef_20_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_20_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_20_Wait_Start;
        end
      end
      fsm_enumDef_20_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_20_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_20_Wait_Start;
        end
      end
      fsm_enumDef_20_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_20_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_20_Wait_Start;
        end
      end
      fsm_enumDef_20_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_20_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_20_Wait_Start;
        end
      end
      fsm_enumDef_20_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_20_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_20_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_20_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_20_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_20_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_20_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_20_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_20_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_20_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_20_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_20_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_20_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_20_Slo : begin
      end
      fsm_enumDef_20_Ack : begin
      end
      fsm_enumDef_20_Start : begin
      end
      fsm_enumDef_20_Zero : begin
      end
      fsm_enumDef_20_PostionOut : begin
      end
      fsm_enumDef_20_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_19 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_19_BOOT = 3'd0;
  localparam fsm_enumDef_19_Wait_Start = 3'd1;
  localparam fsm_enumDef_19_Slo = 3'd2;
  localparam fsm_enumDef_19_Ack = 3'd3;
  localparam fsm_enumDef_19_Start = 3'd4;
  localparam fsm_enumDef_19_Zero = 3'd5;
  localparam fsm_enumDef_19_PostionOut = 3'd6;
  localparam fsm_enumDef_19_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_19_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_19_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_19_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_19_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_19_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_19_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_19_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_19_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_19_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_19_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_19_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_19_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_19_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_19_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_19_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_19_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_19_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_19_Slo;
        end
      end
      fsm_enumDef_19_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_19_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_19_Wait_Start;
        end
      end
      fsm_enumDef_19_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_19_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_19_Wait_Start;
        end
      end
      fsm_enumDef_19_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_19_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_19_Wait_Start;
        end
      end
      fsm_enumDef_19_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_19_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_19_Wait_Start;
        end
      end
      fsm_enumDef_19_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_19_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_19_Wait_Start;
        end
      end
      fsm_enumDef_19_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_19_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_19_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_19_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_19_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_19_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_19_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_19_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_19_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_19_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_19_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_19_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_19_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_19_Slo : begin
      end
      fsm_enumDef_19_Ack : begin
      end
      fsm_enumDef_19_Start : begin
      end
      fsm_enumDef_19_Zero : begin
      end
      fsm_enumDef_19_PostionOut : begin
      end
      fsm_enumDef_19_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_18 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_18_BOOT = 3'd0;
  localparam fsm_enumDef_18_Wait_Start = 3'd1;
  localparam fsm_enumDef_18_Slo = 3'd2;
  localparam fsm_enumDef_18_Ack = 3'd3;
  localparam fsm_enumDef_18_Start = 3'd4;
  localparam fsm_enumDef_18_Zero = 3'd5;
  localparam fsm_enumDef_18_PostionOut = 3'd6;
  localparam fsm_enumDef_18_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_18_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_18_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_18_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_18_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_18_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_18_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_18_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_18_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_18_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_18_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_18_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_18_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_18_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_18_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_18_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_18_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_18_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_18_Slo;
        end
      end
      fsm_enumDef_18_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_18_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_18_Wait_Start;
        end
      end
      fsm_enumDef_18_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_18_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_18_Wait_Start;
        end
      end
      fsm_enumDef_18_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_18_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_18_Wait_Start;
        end
      end
      fsm_enumDef_18_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_18_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_18_Wait_Start;
        end
      end
      fsm_enumDef_18_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_18_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_18_Wait_Start;
        end
      end
      fsm_enumDef_18_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_18_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_18_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_18_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_18_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_18_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_18_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_18_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_18_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_18_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_18_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_18_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_18_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_18_Slo : begin
      end
      fsm_enumDef_18_Ack : begin
      end
      fsm_enumDef_18_Start : begin
      end
      fsm_enumDef_18_Zero : begin
      end
      fsm_enumDef_18_PostionOut : begin
      end
      fsm_enumDef_18_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_17 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_17_BOOT = 3'd0;
  localparam fsm_enumDef_17_Wait_Start = 3'd1;
  localparam fsm_enumDef_17_Slo = 3'd2;
  localparam fsm_enumDef_17_Ack = 3'd3;
  localparam fsm_enumDef_17_Start = 3'd4;
  localparam fsm_enumDef_17_Zero = 3'd5;
  localparam fsm_enumDef_17_PostionOut = 3'd6;
  localparam fsm_enumDef_17_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_17_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_17_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_17_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_17_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_17_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_17_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_17_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_17_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_17_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_17_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_17_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_17_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_17_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_17_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_17_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_17_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_17_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_17_Slo;
        end
      end
      fsm_enumDef_17_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_17_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_17_Wait_Start;
        end
      end
      fsm_enumDef_17_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_17_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_17_Wait_Start;
        end
      end
      fsm_enumDef_17_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_17_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_17_Wait_Start;
        end
      end
      fsm_enumDef_17_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_17_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_17_Wait_Start;
        end
      end
      fsm_enumDef_17_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_17_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_17_Wait_Start;
        end
      end
      fsm_enumDef_17_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_17_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_17_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_17_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_17_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_17_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_17_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_17_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_17_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_17_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_17_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_17_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_17_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_17_Slo : begin
      end
      fsm_enumDef_17_Ack : begin
      end
      fsm_enumDef_17_Start : begin
      end
      fsm_enumDef_17_Zero : begin
      end
      fsm_enumDef_17_PostionOut : begin
      end
      fsm_enumDef_17_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_16 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_16_BOOT = 3'd0;
  localparam fsm_enumDef_16_Wait_Start = 3'd1;
  localparam fsm_enumDef_16_Slo = 3'd2;
  localparam fsm_enumDef_16_Ack = 3'd3;
  localparam fsm_enumDef_16_Start = 3'd4;
  localparam fsm_enumDef_16_Zero = 3'd5;
  localparam fsm_enumDef_16_PostionOut = 3'd6;
  localparam fsm_enumDef_16_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_16_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_16_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_16_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_16_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_16_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_16_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_16_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_16_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_16_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_16_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_16_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_16_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_16_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_16_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_16_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_16_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_16_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_16_Slo;
        end
      end
      fsm_enumDef_16_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_16_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_16_Wait_Start;
        end
      end
      fsm_enumDef_16_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_16_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_16_Wait_Start;
        end
      end
      fsm_enumDef_16_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_16_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_16_Wait_Start;
        end
      end
      fsm_enumDef_16_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_16_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_16_Wait_Start;
        end
      end
      fsm_enumDef_16_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_16_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_16_Wait_Start;
        end
      end
      fsm_enumDef_16_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_16_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_16_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_16_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_16_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_16_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_16_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_16_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_16_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_16_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_16_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_16_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_16_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_16_Slo : begin
      end
      fsm_enumDef_16_Ack : begin
      end
      fsm_enumDef_16_Start : begin
      end
      fsm_enumDef_16_Zero : begin
      end
      fsm_enumDef_16_PostionOut : begin
      end
      fsm_enumDef_16_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_15 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_15_BOOT = 3'd0;
  localparam fsm_enumDef_15_Wait_Start = 3'd1;
  localparam fsm_enumDef_15_Slo = 3'd2;
  localparam fsm_enumDef_15_Ack = 3'd3;
  localparam fsm_enumDef_15_Start = 3'd4;
  localparam fsm_enumDef_15_Zero = 3'd5;
  localparam fsm_enumDef_15_PostionOut = 3'd6;
  localparam fsm_enumDef_15_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_15_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_15_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_15_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_15_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_15_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_15_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_15_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_15_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_15_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_15_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_15_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_15_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_15_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_15_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_15_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_15_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_15_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_15_Slo;
        end
      end
      fsm_enumDef_15_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_15_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_15_Wait_Start;
        end
      end
      fsm_enumDef_15_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_15_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_15_Wait_Start;
        end
      end
      fsm_enumDef_15_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_15_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_15_Wait_Start;
        end
      end
      fsm_enumDef_15_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_15_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_15_Wait_Start;
        end
      end
      fsm_enumDef_15_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_15_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_15_Wait_Start;
        end
      end
      fsm_enumDef_15_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_15_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_15_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_15_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_15_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_15_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_15_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_15_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_15_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_15_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_15_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_15_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_15_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_15_Slo : begin
      end
      fsm_enumDef_15_Ack : begin
      end
      fsm_enumDef_15_Start : begin
      end
      fsm_enumDef_15_Zero : begin
      end
      fsm_enumDef_15_PostionOut : begin
      end
      fsm_enumDef_15_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_14 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_14_BOOT = 3'd0;
  localparam fsm_enumDef_14_Wait_Start = 3'd1;
  localparam fsm_enumDef_14_Slo = 3'd2;
  localparam fsm_enumDef_14_Ack = 3'd3;
  localparam fsm_enumDef_14_Start = 3'd4;
  localparam fsm_enumDef_14_Zero = 3'd5;
  localparam fsm_enumDef_14_PostionOut = 3'd6;
  localparam fsm_enumDef_14_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_14_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_14_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_14_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_14_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_14_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_14_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_14_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_14_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_14_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_14_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_14_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_14_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_14_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_14_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_14_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_14_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_14_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_14_Slo;
        end
      end
      fsm_enumDef_14_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_14_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_14_Wait_Start;
        end
      end
      fsm_enumDef_14_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_14_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_14_Wait_Start;
        end
      end
      fsm_enumDef_14_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_14_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_14_Wait_Start;
        end
      end
      fsm_enumDef_14_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_14_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_14_Wait_Start;
        end
      end
      fsm_enumDef_14_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_14_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_14_Wait_Start;
        end
      end
      fsm_enumDef_14_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_14_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_14_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_14_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_14_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_14_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_14_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_14_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_14_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_14_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_14_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_14_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_14_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_14_Slo : begin
      end
      fsm_enumDef_14_Ack : begin
      end
      fsm_enumDef_14_Start : begin
      end
      fsm_enumDef_14_Zero : begin
      end
      fsm_enumDef_14_PostionOut : begin
      end
      fsm_enumDef_14_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_13 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_13_BOOT = 3'd0;
  localparam fsm_enumDef_13_Wait_Start = 3'd1;
  localparam fsm_enumDef_13_Slo = 3'd2;
  localparam fsm_enumDef_13_Ack = 3'd3;
  localparam fsm_enumDef_13_Start = 3'd4;
  localparam fsm_enumDef_13_Zero = 3'd5;
  localparam fsm_enumDef_13_PostionOut = 3'd6;
  localparam fsm_enumDef_13_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_13_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_13_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_13_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_13_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_13_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_13_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_13_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_13_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_13_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_13_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_13_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_13_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_13_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_13_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_13_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_13_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_13_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_13_Slo;
        end
      end
      fsm_enumDef_13_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_13_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_13_Wait_Start;
        end
      end
      fsm_enumDef_13_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_13_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_13_Wait_Start;
        end
      end
      fsm_enumDef_13_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_13_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_13_Wait_Start;
        end
      end
      fsm_enumDef_13_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_13_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_13_Wait_Start;
        end
      end
      fsm_enumDef_13_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_13_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_13_Wait_Start;
        end
      end
      fsm_enumDef_13_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_13_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_13_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_13_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_13_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_13_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_13_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_13_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_13_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_13_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_13_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_13_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_13_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_13_Slo : begin
      end
      fsm_enumDef_13_Ack : begin
      end
      fsm_enumDef_13_Start : begin
      end
      fsm_enumDef_13_Zero : begin
      end
      fsm_enumDef_13_PostionOut : begin
      end
      fsm_enumDef_13_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_12 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_12_BOOT = 3'd0;
  localparam fsm_enumDef_12_Wait_Start = 3'd1;
  localparam fsm_enumDef_12_Slo = 3'd2;
  localparam fsm_enumDef_12_Ack = 3'd3;
  localparam fsm_enumDef_12_Start = 3'd4;
  localparam fsm_enumDef_12_Zero = 3'd5;
  localparam fsm_enumDef_12_PostionOut = 3'd6;
  localparam fsm_enumDef_12_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_12_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_12_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_12_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_12_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_12_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_12_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_12_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_12_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_12_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_12_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_12_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_12_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_12_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_12_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_12_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_12_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_12_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_12_Slo;
        end
      end
      fsm_enumDef_12_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_12_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_12_Wait_Start;
        end
      end
      fsm_enumDef_12_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_12_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_12_Wait_Start;
        end
      end
      fsm_enumDef_12_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_12_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_12_Wait_Start;
        end
      end
      fsm_enumDef_12_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_12_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_12_Wait_Start;
        end
      end
      fsm_enumDef_12_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_12_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_12_Wait_Start;
        end
      end
      fsm_enumDef_12_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_12_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_12_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_12_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_12_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_12_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_12_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_12_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_12_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_12_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_12_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_12_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_12_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_12_Slo : begin
      end
      fsm_enumDef_12_Ack : begin
      end
      fsm_enumDef_12_Start : begin
      end
      fsm_enumDef_12_Zero : begin
      end
      fsm_enumDef_12_PostionOut : begin
      end
      fsm_enumDef_12_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_11 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_11_BOOT = 3'd0;
  localparam fsm_enumDef_11_Wait_Start = 3'd1;
  localparam fsm_enumDef_11_Slo = 3'd2;
  localparam fsm_enumDef_11_Ack = 3'd3;
  localparam fsm_enumDef_11_Start = 3'd4;
  localparam fsm_enumDef_11_Zero = 3'd5;
  localparam fsm_enumDef_11_PostionOut = 3'd6;
  localparam fsm_enumDef_11_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_11_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_11_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_11_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_11_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_11_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_11_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_11_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_11_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_11_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_11_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_11_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_11_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_11_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_11_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_11_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_11_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_11_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_11_Slo;
        end
      end
      fsm_enumDef_11_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_11_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_11_Wait_Start;
        end
      end
      fsm_enumDef_11_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_11_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_11_Wait_Start;
        end
      end
      fsm_enumDef_11_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_11_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_11_Wait_Start;
        end
      end
      fsm_enumDef_11_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_11_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_11_Wait_Start;
        end
      end
      fsm_enumDef_11_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_11_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_11_Wait_Start;
        end
      end
      fsm_enumDef_11_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_11_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_11_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_11_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_11_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_11_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_11_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_11_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_11_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_11_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_11_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_11_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_11_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_11_Slo : begin
      end
      fsm_enumDef_11_Ack : begin
      end
      fsm_enumDef_11_Start : begin
      end
      fsm_enumDef_11_Zero : begin
      end
      fsm_enumDef_11_PostionOut : begin
      end
      fsm_enumDef_11_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_10 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_10_BOOT = 3'd0;
  localparam fsm_enumDef_10_Wait_Start = 3'd1;
  localparam fsm_enumDef_10_Slo = 3'd2;
  localparam fsm_enumDef_10_Ack = 3'd3;
  localparam fsm_enumDef_10_Start = 3'd4;
  localparam fsm_enumDef_10_Zero = 3'd5;
  localparam fsm_enumDef_10_PostionOut = 3'd6;
  localparam fsm_enumDef_10_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_10_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_10_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_10_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_10_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_10_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_10_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_10_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_10_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_10_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_10_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_10_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_10_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_10_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_10_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_10_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_10_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_10_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_10_Slo;
        end
      end
      fsm_enumDef_10_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_10_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_10_Wait_Start;
        end
      end
      fsm_enumDef_10_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_10_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_10_Wait_Start;
        end
      end
      fsm_enumDef_10_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_10_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_10_Wait_Start;
        end
      end
      fsm_enumDef_10_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_10_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_10_Wait_Start;
        end
      end
      fsm_enumDef_10_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_10_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_10_Wait_Start;
        end
      end
      fsm_enumDef_10_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_10_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_10_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_10_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_10_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_10_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_10_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_10_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_10_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_10_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_10_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_10_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_10_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_10_Slo : begin
      end
      fsm_enumDef_10_Ack : begin
      end
      fsm_enumDef_10_Start : begin
      end
      fsm_enumDef_10_Zero : begin
      end
      fsm_enumDef_10_PostionOut : begin
      end
      fsm_enumDef_10_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_9 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_9_BOOT = 3'd0;
  localparam fsm_enumDef_9_Wait_Start = 3'd1;
  localparam fsm_enumDef_9_Slo = 3'd2;
  localparam fsm_enumDef_9_Ack = 3'd3;
  localparam fsm_enumDef_9_Start = 3'd4;
  localparam fsm_enumDef_9_Zero = 3'd5;
  localparam fsm_enumDef_9_PostionOut = 3'd6;
  localparam fsm_enumDef_9_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_9_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_9_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_9_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_9_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_9_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_9_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_9_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_9_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_9_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_9_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_9_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_9_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_9_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_9_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_9_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_9_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_9_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_9_Slo;
        end
      end
      fsm_enumDef_9_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_9_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_9_Wait_Start;
        end
      end
      fsm_enumDef_9_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_9_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_9_Wait_Start;
        end
      end
      fsm_enumDef_9_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_9_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_9_Wait_Start;
        end
      end
      fsm_enumDef_9_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_9_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_9_Wait_Start;
        end
      end
      fsm_enumDef_9_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_9_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_9_Wait_Start;
        end
      end
      fsm_enumDef_9_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_9_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_9_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_9_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_9_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_9_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_9_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_9_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_9_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_9_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_9_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_9_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_9_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_9_Slo : begin
      end
      fsm_enumDef_9_Ack : begin
      end
      fsm_enumDef_9_Start : begin
      end
      fsm_enumDef_9_Zero : begin
      end
      fsm_enumDef_9_PostionOut : begin
      end
      fsm_enumDef_9_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_8 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_8_BOOT = 3'd0;
  localparam fsm_enumDef_8_Wait_Start = 3'd1;
  localparam fsm_enumDef_8_Slo = 3'd2;
  localparam fsm_enumDef_8_Ack = 3'd3;
  localparam fsm_enumDef_8_Start = 3'd4;
  localparam fsm_enumDef_8_Zero = 3'd5;
  localparam fsm_enumDef_8_PostionOut = 3'd6;
  localparam fsm_enumDef_8_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_8_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_8_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_8_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_8_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_8_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_8_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_8_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_8_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_8_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_8_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_8_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_8_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_8_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_8_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_8_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_8_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_8_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_8_Slo;
        end
      end
      fsm_enumDef_8_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_8_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_8_Wait_Start;
        end
      end
      fsm_enumDef_8_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_8_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_8_Wait_Start;
        end
      end
      fsm_enumDef_8_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_8_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_8_Wait_Start;
        end
      end
      fsm_enumDef_8_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_8_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_8_Wait_Start;
        end
      end
      fsm_enumDef_8_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_8_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_8_Wait_Start;
        end
      end
      fsm_enumDef_8_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_8_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_8_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_8_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_8_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_8_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_8_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_8_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_8_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_8_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_8_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_8_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_8_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_8_Slo : begin
      end
      fsm_enumDef_8_Ack : begin
      end
      fsm_enumDef_8_Start : begin
      end
      fsm_enumDef_8_Zero : begin
      end
      fsm_enumDef_8_PostionOut : begin
      end
      fsm_enumDef_8_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_7 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_7_BOOT = 3'd0;
  localparam fsm_enumDef_7_Wait_Start = 3'd1;
  localparam fsm_enumDef_7_Slo = 3'd2;
  localparam fsm_enumDef_7_Ack = 3'd3;
  localparam fsm_enumDef_7_Start = 3'd4;
  localparam fsm_enumDef_7_Zero = 3'd5;
  localparam fsm_enumDef_7_PostionOut = 3'd6;
  localparam fsm_enumDef_7_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_7_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_7_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_7_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_7_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_7_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_7_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_7_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_7_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_7_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_7_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_7_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_7_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_7_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_7_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_7_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_7_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_7_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_7_Slo;
        end
      end
      fsm_enumDef_7_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_7_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_7_Wait_Start;
        end
      end
      fsm_enumDef_7_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_7_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_7_Wait_Start;
        end
      end
      fsm_enumDef_7_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_7_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_7_Wait_Start;
        end
      end
      fsm_enumDef_7_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_7_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_7_Wait_Start;
        end
      end
      fsm_enumDef_7_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_7_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_7_Wait_Start;
        end
      end
      fsm_enumDef_7_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_7_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_7_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_7_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_7_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_7_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_7_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_7_Slo : begin
      end
      fsm_enumDef_7_Ack : begin
      end
      fsm_enumDef_7_Start : begin
      end
      fsm_enumDef_7_Zero : begin
      end
      fsm_enumDef_7_PostionOut : begin
      end
      fsm_enumDef_7_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_6 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_6_BOOT = 3'd0;
  localparam fsm_enumDef_6_Wait_Start = 3'd1;
  localparam fsm_enumDef_6_Slo = 3'd2;
  localparam fsm_enumDef_6_Ack = 3'd3;
  localparam fsm_enumDef_6_Start = 3'd4;
  localparam fsm_enumDef_6_Zero = 3'd5;
  localparam fsm_enumDef_6_PostionOut = 3'd6;
  localparam fsm_enumDef_6_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_6_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_6_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_6_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_6_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_6_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_6_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_6_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_6_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_6_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_6_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_6_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_6_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_6_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_6_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_6_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_6_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_6_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_6_Slo;
        end
      end
      fsm_enumDef_6_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_6_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_6_Wait_Start;
        end
      end
      fsm_enumDef_6_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_6_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_6_Wait_Start;
        end
      end
      fsm_enumDef_6_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_6_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_6_Wait_Start;
        end
      end
      fsm_enumDef_6_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_6_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_6_Wait_Start;
        end
      end
      fsm_enumDef_6_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_6_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_6_Wait_Start;
        end
      end
      fsm_enumDef_6_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_6_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_6_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_6_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_6_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_6_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_6_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_6_Slo : begin
      end
      fsm_enumDef_6_Ack : begin
      end
      fsm_enumDef_6_Start : begin
      end
      fsm_enumDef_6_Zero : begin
      end
      fsm_enumDef_6_PostionOut : begin
      end
      fsm_enumDef_6_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_5 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_5_BOOT = 3'd0;
  localparam fsm_enumDef_5_Wait_Start = 3'd1;
  localparam fsm_enumDef_5_Slo = 3'd2;
  localparam fsm_enumDef_5_Ack = 3'd3;
  localparam fsm_enumDef_5_Start = 3'd4;
  localparam fsm_enumDef_5_Zero = 3'd5;
  localparam fsm_enumDef_5_PostionOut = 3'd6;
  localparam fsm_enumDef_5_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_5_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_5_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_5_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_5_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_5_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_5_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_5_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_5_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_5_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_5_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_5_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_5_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_5_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_5_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_5_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_5_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_5_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_5_Slo;
        end
      end
      fsm_enumDef_5_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_5_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_5_Wait_Start;
        end
      end
      fsm_enumDef_5_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_5_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_5_Wait_Start;
        end
      end
      fsm_enumDef_5_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_5_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_5_Wait_Start;
        end
      end
      fsm_enumDef_5_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_5_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_5_Wait_Start;
        end
      end
      fsm_enumDef_5_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_5_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_5_Wait_Start;
        end
      end
      fsm_enumDef_5_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_5_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_5_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_5_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_5_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_5_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_5_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_5_Slo : begin
      end
      fsm_enumDef_5_Ack : begin
      end
      fsm_enumDef_5_Start : begin
      end
      fsm_enumDef_5_Zero : begin
      end
      fsm_enumDef_5_PostionOut : begin
      end
      fsm_enumDef_5_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_4 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_4_BOOT = 3'd0;
  localparam fsm_enumDef_4_Wait_Start = 3'd1;
  localparam fsm_enumDef_4_Slo = 3'd2;
  localparam fsm_enumDef_4_Ack = 3'd3;
  localparam fsm_enumDef_4_Start = 3'd4;
  localparam fsm_enumDef_4_Zero = 3'd5;
  localparam fsm_enumDef_4_PostionOut = 3'd6;
  localparam fsm_enumDef_4_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_4_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_4_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_4_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_4_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_4_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_4_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_4_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_4_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_4_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_4_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_4_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_4_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_4_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_4_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_4_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_4_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_4_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_4_Slo;
        end
      end
      fsm_enumDef_4_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_4_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_4_Wait_Start;
        end
      end
      fsm_enumDef_4_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_4_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_4_Wait_Start;
        end
      end
      fsm_enumDef_4_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_4_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_4_Wait_Start;
        end
      end
      fsm_enumDef_4_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_4_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_4_Wait_Start;
        end
      end
      fsm_enumDef_4_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_4_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_4_Wait_Start;
        end
      end
      fsm_enumDef_4_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_4_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_4_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_4_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_4_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_4_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_4_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_4_Slo : begin
      end
      fsm_enumDef_4_Ack : begin
      end
      fsm_enumDef_4_Start : begin
      end
      fsm_enumDef_4_Zero : begin
      end
      fsm_enumDef_4_PostionOut : begin
      end
      fsm_enumDef_4_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_3 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_3_BOOT = 3'd0;
  localparam fsm_enumDef_3_Wait_Start = 3'd1;
  localparam fsm_enumDef_3_Slo = 3'd2;
  localparam fsm_enumDef_3_Ack = 3'd3;
  localparam fsm_enumDef_3_Start = 3'd4;
  localparam fsm_enumDef_3_Zero = 3'd5;
  localparam fsm_enumDef_3_PostionOut = 3'd6;
  localparam fsm_enumDef_3_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_3_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_3_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_3_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_3_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_3_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_3_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_3_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_3_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_3_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_3_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_3_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_3_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_3_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_3_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_3_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_3_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_3_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_3_Slo;
        end
      end
      fsm_enumDef_3_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_3_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_3_Wait_Start;
        end
      end
      fsm_enumDef_3_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_3_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_3_Wait_Start;
        end
      end
      fsm_enumDef_3_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_3_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_3_Wait_Start;
        end
      end
      fsm_enumDef_3_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_3_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_3_Wait_Start;
        end
      end
      fsm_enumDef_3_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_3_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_3_Wait_Start;
        end
      end
      fsm_enumDef_3_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_3_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_3_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_3_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_3_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_3_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_3_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_3_Slo : begin
      end
      fsm_enumDef_3_Ack : begin
      end
      fsm_enumDef_3_Start : begin
      end
      fsm_enumDef_3_Zero : begin
      end
      fsm_enumDef_3_PostionOut : begin
      end
      fsm_enumDef_3_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_2 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_2_BOOT = 3'd0;
  localparam fsm_enumDef_2_Wait_Start = 3'd1;
  localparam fsm_enumDef_2_Slo = 3'd2;
  localparam fsm_enumDef_2_Ack = 3'd3;
  localparam fsm_enumDef_2_Start = 3'd4;
  localparam fsm_enumDef_2_Zero = 3'd5;
  localparam fsm_enumDef_2_PostionOut = 3'd6;
  localparam fsm_enumDef_2_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_2_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_2_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_2_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_2_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_2_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_2_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_2_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_2_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_2_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_2_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_2_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_2_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_2_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_2_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_2_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_2_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_2_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_2_Slo;
        end
      end
      fsm_enumDef_2_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_2_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_2_Wait_Start;
        end
      end
      fsm_enumDef_2_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_2_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_2_Wait_Start;
        end
      end
      fsm_enumDef_2_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_2_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_2_Wait_Start;
        end
      end
      fsm_enumDef_2_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_2_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_2_Wait_Start;
        end
      end
      fsm_enumDef_2_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_2_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_2_Wait_Start;
        end
      end
      fsm_enumDef_2_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_2_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_2_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_2_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_2_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_2_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_2_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_2_Slo : begin
      end
      fsm_enumDef_2_Ack : begin
      end
      fsm_enumDef_2_Start : begin
      end
      fsm_enumDef_2_Zero : begin
      end
      fsm_enumDef_2_PostionOut : begin
      end
      fsm_enumDef_2_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave_1 (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_1_BOOT = 3'd0;
  localparam fsm_enumDef_1_Wait_Start = 3'd1;
  localparam fsm_enumDef_1_Slo = 3'd2;
  localparam fsm_enumDef_1_Ack = 3'd3;
  localparam fsm_enumDef_1_Start = 3'd4;
  localparam fsm_enumDef_1_Zero = 3'd5;
  localparam fsm_enumDef_1_PostionOut = 3'd6;
  localparam fsm_enumDef_1_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_1_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_1_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_1_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_1_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_1_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_1_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_1_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_1_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_1_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_1_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_1_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_1_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_1_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_1_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_1_Slo;
        end
      end
      fsm_enumDef_1_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_1_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_1_Wait_Start;
        end
      end
      fsm_enumDef_1_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_1_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_1_Wait_Start;
        end
      end
      fsm_enumDef_1_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_1_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_1_Wait_Start;
        end
      end
      fsm_enumDef_1_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_1_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_1_Wait_Start;
        end
      end
      fsm_enumDef_1_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_1_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_1_Wait_Start;
        end
      end
      fsm_enumDef_1_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_1_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_1_Slo : begin
      end
      fsm_enumDef_1_Ack : begin
      end
      fsm_enumDef_1_Start : begin
      end
      fsm_enumDef_1_Zero : begin
      end
      fsm_enumDef_1_PostionOut : begin
      end
      fsm_enumDef_1_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module BissC_Slave (
  input               s_bissc_enc_clk,
  output              s_bissc_enc_data,
  input      [40:0]   m_postion,
  output     [2:0]    currentState,
  output     [40:0]   postion_temp,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_Wait_Start = 3'd1;
  localparam fsm_enumDef_Slo = 3'd2;
  localparam fsm_enumDef_Ack = 3'd3;
  localparam fsm_enumDef_Start = 3'd4;
  localparam fsm_enumDef_Zero = 3'd5;
  localparam fsm_enumDef_PostionOut = 3'd6;
  localparam fsm_enumDef_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [40:0]   postion_reg;
  reg                 enc_clk;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 enc_clk_regNext;
  wire                when_BissC_l32;
  reg                 enc_clk_regNext_1;
  wire                when_BissC_l44;
  wire                when_BissC_l48;
  wire                when_BissC_l54;
  reg                 enc_clk_regNext_2;
  wire                when_BissC_l63;
  wire                when_BissC_l68;
  reg                 enc_clk_regNext_3;
  wire                when_BissC_l77;
  wire                when_BissC_l82;
  reg                 enc_clk_regNext_4;
  wire                when_BissC_l91;
  wire                when_BissC_l97;
  reg                 enc_clk_regNext_5;
  wire                when_BissC_l106;
  wire                when_BissC_l110;
  wire                when_BissC_l116;
  reg                 enc_clk_regNext_6;
  reg                 enc_clk_regNext_7;
  wire                when_BissC_l124;
  wire                when_BissC_l127;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h29 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h29 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign postion_temp = postion_reg;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_Slo;
        end
      end
      fsm_enumDef_Slo : begin
        if(when_BissC_l44) begin
          if(when_BissC_l48) begin
            fsm_stateNext = fsm_enumDef_Ack;
          end
        end
        if(when_BissC_l54) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      fsm_enumDef_Ack : begin
        if(when_BissC_l63) begin
          fsm_stateNext = fsm_enumDef_Start;
        end
        if(when_BissC_l68) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      fsm_enumDef_Start : begin
        if(when_BissC_l77) begin
          fsm_stateNext = fsm_enumDef_Zero;
        end
        if(when_BissC_l82) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      fsm_enumDef_Zero : begin
        if(when_BissC_l91) begin
          fsm_stateNext = fsm_enumDef_PostionOut;
        end
        if(when_BissC_l97) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      fsm_enumDef_PostionOut : begin
        if(when_BissC_l106) begin
          if(when_BissC_l110) begin
            fsm_stateNext = fsm_enumDef_TimeOut;
          end
        end
        if(when_BissC_l116) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      fsm_enumDef_TimeOut : begin
        if(!when_BissC_l124) begin
          if(when_BissC_l127) begin
            fsm_stateNext = fsm_enumDef_Wait_Start;
          end
        end
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_enc_data = bisscdata;
  assign when_BissC_l32 = ((! enc_clk) && enc_clk_regNext);
  assign when_BissC_l44 = (enc_clk && (! enc_clk_regNext_1));
  assign when_BissC_l48 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (8'hc8 < timeout_cnt);
  assign when_BissC_l63 = (enc_clk && (! enc_clk_regNext_2));
  assign when_BissC_l68 = (8'hc8 < timeout_cnt);
  assign when_BissC_l77 = (enc_clk && (! enc_clk_regNext_3));
  assign when_BissC_l82 = (8'hc8 < timeout_cnt);
  assign when_BissC_l91 = (enc_clk && (! enc_clk_regNext_4));
  assign when_BissC_l97 = (8'hc8 < timeout_cnt);
  assign when_BissC_l106 = (enc_clk && (! enc_clk_regNext_5));
  assign when_BissC_l110 = (clkrise_cnt == 6'h29);
  assign when_BissC_l116 = (8'hc8 < timeout_cnt);
  assign when_BissC_l124 = ((enc_clk && (! enc_clk_regNext_6)) || ((! enc_clk) && enc_clk_regNext_7));
  assign when_BissC_l127 = (8'hc8 < timeout_cnt);
  assign currentState = fsm_stateReg;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      enc_clk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      enc_clk <= s_bissc_enc_clk;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_Slo : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l44) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l48) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
          if(when_BissC_l54) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_Ack : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l63) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b1;
          end
          if(when_BissC_l68) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_Start : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l77) begin
            timeout_cnt <= 8'h0;
            bisscdata <= 1'b0;
          end
          if(when_BissC_l82) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_Zero : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l91) begin
            timeout_cnt <= 8'h0;
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
          if(when_BissC_l97) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_PostionOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l106) begin
            timeout_cnt <= 8'h0;
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l110) begin
              bisscdata <= 1'b0;
              timeout_cnt <= 8'h0;
            end
          end
          if(when_BissC_l116) begin
            timeout_cnt <= 8'h0;
          end
        end
        fsm_enumDef_TimeOut : begin
          if(when_BissC_l124) begin
            timeout_cnt <= 8'h0;
          end else begin
            if(when_BissC_l127) begin
              timeout_cnt <= 8'h0;
              bisscdata <= 1'b1;
            end else begin
              timeout_cnt <= (timeout_cnt + 8'h01);
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    enc_clk_regNext <= enc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_Slo : begin
      end
      fsm_enumDef_Ack : begin
      end
      fsm_enumDef_Start : begin
      end
      fsm_enumDef_Zero : begin
      end
      fsm_enumDef_PostionOut : begin
      end
      fsm_enumDef_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    enc_clk_regNext_1 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_2 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_3 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_4 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_5 <= enc_clk;
  end

  always @(posedge clk) begin
    enc_clk_regNext_6 <= enc_clk;
    enc_clk_regNext_7 <= enc_clk;
  end


endmodule

module Apb3Router (
  input      [18:0]   io_input_PADDR,
  input      [5:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [15:0]   io_input_PWDATA,
  output     [15:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [18:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [15:0]   io_outputs_0_PWDATA,
  input      [15:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [18:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [15:0]   io_outputs_1_PWDATA,
  input      [15:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [18:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [15:0]   io_outputs_2_PWDATA,
  input      [15:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  output     [18:0]   io_outputs_3_PADDR,
  output     [0:0]    io_outputs_3_PSEL,
  output              io_outputs_3_PENABLE,
  input               io_outputs_3_PREADY,
  output              io_outputs_3_PWRITE,
  output     [15:0]   io_outputs_3_PWDATA,
  input      [15:0]   io_outputs_3_PRDATA,
  input               io_outputs_3_PSLVERROR,
  output     [18:0]   io_outputs_4_PADDR,
  output     [0:0]    io_outputs_4_PSEL,
  output              io_outputs_4_PENABLE,
  input               io_outputs_4_PREADY,
  output              io_outputs_4_PWRITE,
  output     [15:0]   io_outputs_4_PWDATA,
  input      [15:0]   io_outputs_4_PRDATA,
  input               io_outputs_4_PSLVERROR,
  output     [18:0]   io_outputs_5_PADDR,
  output     [0:0]    io_outputs_5_PSEL,
  output              io_outputs_5_PENABLE,
  input               io_outputs_5_PREADY,
  output              io_outputs_5_PWRITE,
  output     [15:0]   io_outputs_5_PWDATA,
  input      [15:0]   io_outputs_5_PRDATA,
  input               io_outputs_5_PSLVERROR,
  input               clk,
  input               reset
);

  reg                 _zz_io_input_PREADY;
  reg        [15:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  wire                _zz_selIndex_3;
  wire                _zz_selIndex_4;
  reg        [2:0]    selIndex;

  always @(*) begin
    case(selIndex)
      3'b000 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      3'b001 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      3'b010 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      3'b011 : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
      3'b100 : begin
        _zz_io_input_PREADY = io_outputs_4_PREADY;
        _zz_io_input_PRDATA = io_outputs_4_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_4_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_5_PREADY;
        _zz_io_input_PRDATA = io_outputs_5_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_5_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign io_outputs_4_PADDR = io_input_PADDR;
  assign io_outputs_4_PENABLE = io_input_PENABLE;
  assign io_outputs_4_PSEL[0] = io_input_PSEL[4];
  assign io_outputs_4_PWRITE = io_input_PWRITE;
  assign io_outputs_4_PWDATA = io_input_PWDATA;
  assign io_outputs_5_PADDR = io_input_PADDR;
  assign io_outputs_5_PENABLE = io_input_PENABLE;
  assign io_outputs_5_PSEL[0] = io_input_PSEL[5];
  assign io_outputs_5_PWRITE = io_input_PWRITE;
  assign io_outputs_5_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = io_input_PSEL[5];
  assign _zz_selIndex_2 = ((io_input_PSEL[1] || _zz_selIndex) || _zz_selIndex_1);
  assign _zz_selIndex_3 = (io_input_PSEL[2] || _zz_selIndex);
  assign _zz_selIndex_4 = (io_input_PSEL[4] || _zz_selIndex_1);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge clk) begin
    selIndex <= {_zz_selIndex_4,{_zz_selIndex_3,_zz_selIndex_2}};
  end


endmodule

module Apb3Decoder (
  input      [18:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [15:0]   io_input_PWDATA,
  output     [15:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [18:0]   io_output_PADDR,
  output reg [5:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [15:0]   io_output_PWDATA,
  input      [15:0]   io_output_PRDATA,
  input               io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 19'h00007)) == 19'h0) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 19'h000ff)) == 19'h00100) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 19'h000ff)) == 19'h00200) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 19'h000ff)) == 19'h00400) && io_input_PSEL[0]);
    io_output_PSEL[4] = (((io_input_PADDR & (~ 19'h000ff)) == 19'h00500) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 19'h000ff)) == 19'h00600) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 6'h0));

endmodule

module ApbRam (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  input               clk,
  input               reset
);

  wire       [15:0]   stream_fifo_io_push_payload;
  reg                 stream_fifo_io_pop_ready;
  wire                stream_fifo_io_push_ready;
  wire                stream_fifo_io_pop_valid;
  wire       [15:0]   stream_fifo_io_pop_payload;
  wire       [14:0]   stream_fifo_io_occupancy;
  wire       [14:0]   stream_fifo_io_availability;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg                 _zz_io_push_valid;
  reg                 stream_fifo_io_flush_driver;

  StreamFifo stream_fifo (
    .io_push_valid      (_zz_io_push_valid                  ), //i
    .io_push_ready      (stream_fifo_io_push_ready          ), //o
    .io_push_payload    (stream_fifo_io_push_payload[15:0]  ), //i
    .io_pop_valid       (stream_fifo_io_pop_valid           ), //o
    .io_pop_ready       (stream_fifo_io_pop_ready           ), //i
    .io_pop_payload     (stream_fifo_io_pop_payload[15:0]   ), //o
    .io_flush           (stream_fifo_io_flush_driver        ), //i
    .io_occupancy       (stream_fifo_io_occupancy[14:0]     ), //o
    .io_availability    (stream_fifo_io_availability[14:0]  ), //o
    .clk                (clk                                ), //i
    .reset              (reset                              )  //i
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    _zz_io_push_valid = 1'b0;
    stream_fifo_io_pop_ready = 1'b0;
    case(apb_PADDR)
      4'b0000 : begin
        if(ctrl_doWrite) begin
          _zz_io_push_valid = 1'b1;
        end
      end
      4'b0010 : begin
        apb_PRDATA[0 : 0] = stream_fifo_io_flush_driver;
      end
      4'b0100 : begin
        if(ctrl_doRead) begin
          stream_fifo_io_pop_ready = 1'b1;
        end
        apb_PRDATA[15 : 0] = stream_fifo_io_pop_payload;
      end
      4'b0110 : begin
        apb_PRDATA[14 : 0] = stream_fifo_io_occupancy;
      end
      4'b1000 : begin
        apb_PRDATA[14 : 0] = stream_fifo_io_availability;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign ctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign ctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign ctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign stream_fifo_io_push_payload = apb_PWDATA[15 : 0];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stream_fifo_io_flush_driver <= 1'b1;
    end else begin
      case(apb_PADDR)
        4'b0010 : begin
          if(ctrl_doWrite) begin
            stream_fifo_io_flush_driver <= apb_PWDATA[0];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Mlmc300_Gpio (
  input      [3:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [15:0]   io_apb_PWDATA,
  output reg [15:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output     [11:0]   io_gpioA,
  output     [11:0]   io_gpioB,
  input               clk,
  input               reset
);

  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg        [11:0]   io_gpioA_driver;
  reg        [11:0]   io_gpioB_driver;

  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 16'h0;
    case(io_apb_PADDR)
      4'b0000 : begin
        io_apb_PRDATA[11 : 0] = io_gpioA_driver;
      end
      4'b0100 : begin
        io_apb_PRDATA[11 : 0] = io_gpioB_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign ctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign ctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign ctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_gpioA = io_gpioA_driver;
  assign io_gpioB = io_gpioB_driver;
  always @(posedge clk) begin
    case(io_apb_PADDR)
      4'b0000 : begin
        if(ctrl_doWrite) begin
          io_gpioA_driver <= io_apb_PWDATA[11 : 0];
        end
      end
      4'b0100 : begin
        if(ctrl_doWrite) begin
          io_gpioB_driver <= io_apb_PWDATA[11 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Biss_C (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              bisscInterface_enc_clk,
  input               bisscInterface_enc_data,
  input               clk,
  input               reset,
  output     [40:0]   enc_position_all
);

  wire                area_bissc_ctrl_enc_clk;
  wire       [40:0]   area_bissc_ctrl_enc_position_all;
  wire       [31:0]   area_bissc_ctrl_enc_position_out;
  wire                area_bissc_ctrl_erro_flag;
  wire                area_bissc_ctrl_warn_flag;
  wire                area_bissc_ctrl_crc_flag;
  wire       [2:0]    _zz_area_bissc_status_reg;
  wire       [31:0]   _zz_apb_PRDATA;
  wire       [31:0]   _zz_apb_PRDATA_1;
  wire                area_ctrl_askWrite;
  wire                area_ctrl_askRead;
  wire                area_ctrl_doWrite;
  wire                area_ctrl_doRead;
  reg        [31:0]   area_bissc_pos_reg;
  reg        [15:0]   area_bissc_status_reg;

  assign _zz_area_bissc_status_reg = {{area_bissc_ctrl_erro_flag,area_bissc_ctrl_warn_flag},area_bissc_ctrl_crc_flag};
  assign _zz_apb_PRDATA = area_bissc_pos_reg;
  assign _zz_apb_PRDATA_1 = area_bissc_pos_reg;
  BISS_Position area_bissc_ctrl (
    .clk                 (clk                                     ), //i
    .reset               (reset                                   ), //i
    .enc_data            (bisscInterface_enc_data                 ), //i
    .sample_en           (1'b1                                    ), //i
    .enc_clk             (area_bissc_ctrl_enc_clk                 ), //o
    .enc_position_all    (area_bissc_ctrl_enc_position_all[40:0]  ), //o
    .enc_position_out    (area_bissc_ctrl_enc_position_out[31:0]  ), //o
    .erro_flag           (area_bissc_ctrl_erro_flag               ), //o
    .warn_flag           (area_bissc_ctrl_warn_flag               ), //o
    .crc_flag            (area_bissc_ctrl_crc_flag                )  //o
  );
  assign bisscInterface_enc_clk = area_bissc_ctrl_enc_clk;
  assign enc_position_all = area_bissc_ctrl_enc_position_all;
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      4'b0000 : begin
        apb_PRDATA[15 : 0] = _zz_apb_PRDATA[31 : 16];
      end
      4'b0010 : begin
        apb_PRDATA[15 : 0] = _zz_apb_PRDATA_1[15 : 0];
      end
      4'b0100 : begin
        apb_PRDATA[15 : 0] = area_bissc_status_reg;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign area_ctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign area_ctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign area_ctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign area_ctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      area_bissc_pos_reg <= 32'h0;
      area_bissc_status_reg <= 16'h0;
    end else begin
      area_bissc_pos_reg <= area_bissc_ctrl_enc_position_out;
      area_bissc_status_reg <= {13'd0, _zz_area_bissc_status_reg};
    end
  end


endmodule

//AD5544 replaced by AD5544

module AD5544 (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              ad5544Interface_AD5544_CS,
  output              ad5544Interface_AD5544_LDAC,
  output              ad5544Interface_AD5544_MSB,
  output              ad5544Interface_AD5544_RS,
  output              ad5544Interface_AD5544_SCLK,
  output              ad5544Interface_AD5544_SDIN,
  input               clk,
  input               reset,
  input               ad5544_enable
);

  wire                area_ad5544_ctrl_AD5544_CS;
  wire                area_ad5544_ctrl_AD5544_LDAC;
  wire                area_ad5544_ctrl_AD5544_MSB;
  wire                area_ad5544_ctrl_AD5544_RS;
  wire                area_ad5544_ctrl_AD5544_SCLK;
  wire                area_ad5544_ctrl_AD5544_SDIN;
  wire                area_ctrl_askWrite;
  wire                area_ctrl_askRead;
  wire                area_ctrl_doWrite;
  wire                area_ctrl_doRead;
  reg        [15:0]   area_ad5544_ctrl_AD5544_DATA_IN1_driver;
  reg        [15:0]   area_ad5544_ctrl_AD5544_DATA_IN2_driver;
  reg        [15:0]   area_ad5544_ctrl_AD5544_DATA_IN3_driver;
  reg        [15:0]   area_ad5544_ctrl_AD5544_DATA_IN4_driver;

  dac_ad5544 area_ad5544_ctrl (
    .clk                (clk                                            ), //i
    .reset              (reset                                          ), //i
    .AD5544_CS          (area_ad5544_ctrl_AD5544_CS                     ), //o
    .AD5544_LDAC        (area_ad5544_ctrl_AD5544_LDAC                   ), //o
    .AD5544_MSB         (area_ad5544_ctrl_AD5544_MSB                    ), //o
    .AD5544_RS          (area_ad5544_ctrl_AD5544_RS                     ), //o
    .AD5544_SCLK        (area_ad5544_ctrl_AD5544_SCLK                   ), //o
    .AD5544_SDIN        (area_ad5544_ctrl_AD5544_SDIN                   ), //o
    .ad5544_trig        (ad5544_enable                                  ), //i
    .AD5544_DATA_IN1    (area_ad5544_ctrl_AD5544_DATA_IN1_driver[15:0]  ), //i
    .AD5544_DATA_IN2    (area_ad5544_ctrl_AD5544_DATA_IN2_driver[15:0]  ), //i
    .AD5544_DATA_IN3    (area_ad5544_ctrl_AD5544_DATA_IN3_driver[15:0]  ), //i
    .AD5544_DATA_IN4    (area_ad5544_ctrl_AD5544_DATA_IN4_driver[15:0]  )  //i
  );
  assign ad5544Interface_AD5544_CS = area_ad5544_ctrl_AD5544_CS;
  assign ad5544Interface_AD5544_RS = area_ad5544_ctrl_AD5544_RS;
  assign ad5544Interface_AD5544_MSB = area_ad5544_ctrl_AD5544_MSB;
  assign ad5544Interface_AD5544_LDAC = area_ad5544_ctrl_AD5544_LDAC;
  assign ad5544Interface_AD5544_SCLK = area_ad5544_ctrl_AD5544_SCLK;
  assign ad5544Interface_AD5544_SDIN = area_ad5544_ctrl_AD5544_SDIN;
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      4'b0000 : begin
        apb_PRDATA[15 : 0] = area_ad5544_ctrl_AD5544_DATA_IN1_driver;
      end
      4'b0010 : begin
        apb_PRDATA[15 : 0] = area_ad5544_ctrl_AD5544_DATA_IN2_driver;
      end
      4'b0100 : begin
        apb_PRDATA[15 : 0] = area_ad5544_ctrl_AD5544_DATA_IN3_driver;
      end
      4'b0110 : begin
        apb_PRDATA[15 : 0] = area_ad5544_ctrl_AD5544_DATA_IN4_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign area_ctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign area_ctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign area_ctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign area_ctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(posedge clk) begin
    case(apb_PADDR)
      4'b0000 : begin
        if(area_ctrl_doWrite) begin
          area_ad5544_ctrl_AD5544_DATA_IN1_driver <= apb_PWDATA[15 : 0];
        end
      end
      4'b0010 : begin
        if(area_ctrl_doWrite) begin
          area_ad5544_ctrl_AD5544_DATA_IN2_driver <= apb_PWDATA[15 : 0];
        end
      end
      4'b0100 : begin
        if(area_ctrl_doWrite) begin
          area_ad5544_ctrl_AD5544_DATA_IN3_driver <= apb_PWDATA[15 : 0];
        end
      end
      4'b0110 : begin
        if(area_ctrl_doWrite) begin
          area_ad5544_ctrl_AD5544_DATA_IN4_driver <= apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module AD5544_triger (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              ad5544_tri,
  input               clk,
  input               reset
);

  reg                 area_temp;
  wire                area_ctrl_askWrite;
  wire                area_ctrl_askRead;
  wire                area_ctrl_doWrite;
  wire                area_ctrl_doRead;
  reg                 when_AD5544_l91;
  reg                 area_temp_delay_1;
  reg                 area_temp_delay_1_1;
  reg                 area_temp_delay_2;
  reg                 area_temp_delay_1_2;
  reg                 area_temp_delay_2_1;
  reg                 area_temp_delay_3;

  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    when_AD5544_l91 = 1'b0;
    case(apb_PADDR)
      4'b0010 : begin
        if(area_ctrl_doWrite) begin
          when_AD5544_l91 = 1'b1;
        end
        apb_PRDATA[0 : 0] = area_temp;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign area_ctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign area_ctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign area_ctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign area_ctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign ad5544_tri = (((area_temp || area_temp_delay_1) || area_temp_delay_2) || area_temp_delay_3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      area_temp <= 1'b0;
    end else begin
      if(when_AD5544_l91) begin
        area_temp <= 1'b1;
      end else begin
        area_temp <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    area_temp_delay_1 <= area_temp;
    area_temp_delay_1_1 <= area_temp;
    area_temp_delay_2 <= area_temp_delay_1_1;
    area_temp_delay_1_2 <= area_temp;
    area_temp_delay_2_1 <= area_temp_delay_1_2;
    area_temp_delay_3 <= area_temp_delay_2_1;
  end


endmodule

module Emif_Apb (
  input      [18:0]   emif_emif_addr,
  input      [15:0]   emif_emif_data_read,
  output     [15:0]   emif_emif_data_write,
  output              emif_emif_data_writeEnable,
  input               emif_emif_cs,
  input               emif_emif_we,
  input               emif_emif_oe,
  (* MARK_DEBUG = "TRUE" *) output     [18:0]   apb_PADDR,
  (* MARK_DEBUG = "TRUE" *) output     [0:0]    apb_PSEL,
  (* MARK_DEBUG = "TRUE" *) output              apb_PENABLE,
  (* MARK_DEBUG = "TRUE" *) input               apb_PREADY,
  (* MARK_DEBUG = "TRUE" *) output              apb_PWRITE,
  (* MARK_DEBUG = "TRUE" *) output     [15:0]   apb_PWDATA,
  (* MARK_DEBUG = "TRUE" *) input      [15:0]   apb_PRDATA,
  (* MARK_DEBUG = "TRUE" *) input               apb_PSLVERROR,
  input               clk,
  input               reset
);

  wire       [19:0]   _zz_apb_PADDR;
  reg                 penable;
  reg                 penable_regNext;
  (* MARK_DEBUG = "TRUE" *) reg        [15:0]   rd_data_temp;

  assign _zz_apb_PADDR = ({1'd0,emif_emif_addr} <<< 1);
  assign apb_PADDR = _zz_apb_PADDR[18:0];
  assign apb_PSEL = (~ emif_emif_cs);
  assign apb_PENABLE = ((penable && (! penable_regNext)) ? penable : 1'b0);
  assign apb_PWRITE = ((! emif_emif_we) && emif_emif_oe);
  assign emif_emif_data_writeEnable = (! emif_emif_oe);
  assign emif_emif_data_write = rd_data_temp;
  assign apb_PWDATA = emif_emif_data_read;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      penable <= 1'b0;
    end else begin
      penable <= ((! emif_emif_oe) || (! emif_emif_we));
    end
  end

  always @(posedge clk) begin
    penable_regNext <= penable;
    if(apb_PENABLE) begin
      rd_data_temp <= apb_PRDATA;
    end else begin
      rd_data_temp <= rd_data_temp;
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [15:0]   io_pop_payload,
  input               io_flush,
  output reg [14:0]   io_occupancy,
  output reg [14:0]   io_availability,
  input               clk,
  input               reset
);

  reg        [15:0]   _zz_logic_ram_port0;
  wire       [14:0]   _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [14:0]   _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [14:0]   _zz_io_occupancy;
  wire       [14:0]   _zz_io_availability;
  wire       [14:0]   _zz_io_availability_1;
  wire       [14:0]   _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [14:0]   logic_pushPtr_valueNext;
  reg        [14:0]   logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [14:0]   logic_popPtr_valueNext;
  reg        [14:0]   logic_popPtr_value;
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
  wire       [14:0]   logic_ptrDif;
  reg [15:0] logic_ram [0:30719];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {14'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {14'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (15'h7800 + logic_ptrDif);
  assign _zz_io_availability = (15'h7800 + _zz_io_availability_1);
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
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 15'h77ff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 15'h0;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 15'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 15'h77ff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 15'h0;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 15'h0;
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
      io_occupancy = (logic_risingOccupancy ? 15'h7800 : 15'h0);
      io_availability = (logic_risingOccupancy ? 15'h0 : 15'h7800);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 15'h0;
      logic_popPtr_value <= 15'h0;
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
