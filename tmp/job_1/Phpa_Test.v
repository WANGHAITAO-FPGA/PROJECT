// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Phpa_Test

`timescale 1ns/1ps 

module Phpa_Test (
  input      [19:0]   emif_emif_addr,
  input      [15:0]   emif_emif_data_read,
  output     [15:0]   emif_emif_data_write,
  output              emif_emif_data_writeEnable,
  input               emif_emif_cs,
  input               emif_emif_we,
  input               emif_emif_oe,
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
  output              ad5544_C_AD5544_CS,
  output              ad5544_C_AD5544_LDAC,
  output              ad5544_C_AD5544_MSB,
  output              ad5544_C_AD5544_RS,
  output              ad5544_C_AD5544_SCLK,
  output              ad5544_C_AD5544_SDIN,
  output              biss_c_enc_clk,
  input               biss_c_enc_data,
  input      [15:0]   ad7606_ad_data,
  input               ad7606_ad_busy,
  input               ad7606_first_data,
  output     [2:0]    ad7606_ad_os,
  output              ad7606_ad_cs,
  output              ad7606_ad_rd,
  output              ad7606_ad_reset,
  output              ad7606_ad_convsta,
  output              ad7606_ad_convstb,
  output              ad7606_ad_range,
  input               clk,
  input               reset,
  output              led,
  input               gtxuser_clk,
  output              axiw_valid,
  input               axiw_ready,
  output              axiw_payload_last,
  output     [31:0]   axiw_payload_fragment,
  input               axir_valid,
  output              axir_ready,
  input               axir_payload_last,
  input      [31:0]   axir_payload_fragment
);

  wire       [3:0]    area_apbtimer_apb_PADDR;
  wire       [3:0]    area_ad5544_triger_apb_PADDR;
  wire       [3:0]    area_ad5544_A_Ctrl_apb_PADDR;
  wire                area_ad5544_A_Ctrl_ad5544_enable;
  wire       [3:0]    area_ad5544_B_Ctrl_apb_PADDR;
  wire                area_ad5544_B_Ctrl_ad5544_enable;
  wire       [3:0]    area_ad5544_C_Ctrl_apb_PADDR;
  wire                area_ad5544_C_Ctrl_ad5544_enable;
  wire       [3:0]    area_biss_c_ctrl_apb_PADDR;
  wire       [3:0]    area_ad7606_ctrl_apb_PADDR;
  wire       [7:0]    area_gtx_ctrl_apb_PADDR;
  wire       [15:0]   area_emif_interface_emif_emif_data_write;
  wire                area_emif_interface_emif_emif_data_writeEnable;
  wire       [19:0]   area_emif_interface_apb_PADDR;
  wire       [0:0]    area_emif_interface_apb_PSEL;
  wire                area_emif_interface_apb_PENABLE;
  wire                area_emif_interface_apb_PWRITE;
  wire       [15:0]   area_emif_interface_apb_PWDATA;
  wire                area_apbtimer_apb_PREADY;
  wire       [15:0]   area_apbtimer_apb_PRDATA;
  wire                area_apbtimer_apb_PSLVERROR;
  wire                area_apbtimer_interrupt;
  wire                area_ad5544_triger_apb_PREADY;
  wire       [15:0]   area_ad5544_triger_apb_PRDATA;
  wire                area_ad5544_triger_apb_PSLVERROR;
  wire                area_ad5544_triger_ad5544_tri;
  wire                area_ad5544_A_Ctrl_apb_PREADY;
  wire       [15:0]   area_ad5544_A_Ctrl_apb_PRDATA;
  wire                area_ad5544_A_Ctrl_apb_PSLVERROR;
  wire                area_ad5544_A_Ctrl_ad5544Interface_AD5544_CS;
  wire                area_ad5544_A_Ctrl_ad5544Interface_AD5544_LDAC;
  wire                area_ad5544_A_Ctrl_ad5544Interface_AD5544_MSB;
  wire                area_ad5544_A_Ctrl_ad5544Interface_AD5544_RS;
  wire                area_ad5544_A_Ctrl_ad5544Interface_AD5544_SCLK;
  wire                area_ad5544_A_Ctrl_ad5544Interface_AD5544_SDIN;
  wire                area_ad5544_B_Ctrl_apb_PREADY;
  wire       [15:0]   area_ad5544_B_Ctrl_apb_PRDATA;
  wire                area_ad5544_B_Ctrl_apb_PSLVERROR;
  wire                area_ad5544_B_Ctrl_ad5544Interface_AD5544_CS;
  wire                area_ad5544_B_Ctrl_ad5544Interface_AD5544_LDAC;
  wire                area_ad5544_B_Ctrl_ad5544Interface_AD5544_MSB;
  wire                area_ad5544_B_Ctrl_ad5544Interface_AD5544_RS;
  wire                area_ad5544_B_Ctrl_ad5544Interface_AD5544_SCLK;
  wire                area_ad5544_B_Ctrl_ad5544Interface_AD5544_SDIN;
  wire                area_ad5544_C_Ctrl_apb_PREADY;
  wire       [15:0]   area_ad5544_C_Ctrl_apb_PRDATA;
  wire                area_ad5544_C_Ctrl_apb_PSLVERROR;
  wire                area_ad5544_C_Ctrl_ad5544Interface_AD5544_CS;
  wire                area_ad5544_C_Ctrl_ad5544Interface_AD5544_LDAC;
  wire                area_ad5544_C_Ctrl_ad5544Interface_AD5544_MSB;
  wire                area_ad5544_C_Ctrl_ad5544Interface_AD5544_RS;
  wire                area_ad5544_C_Ctrl_ad5544Interface_AD5544_SCLK;
  wire                area_ad5544_C_Ctrl_ad5544Interface_AD5544_SDIN;
  wire                area_biss_c_ctrl_apb_PREADY;
  wire       [15:0]   area_biss_c_ctrl_apb_PRDATA;
  wire                area_biss_c_ctrl_apb_PSLVERROR;
  wire                area_biss_c_ctrl_bisscInterface_enc_clk;
  wire                area_ad7606_ctrl_apb_PREADY;
  wire       [15:0]   area_ad7606_ctrl_apb_PRDATA;
  wire                area_ad7606_ctrl_apb_PSLVERROR;
  wire       [2:0]    area_ad7606_ctrl_ad7606Interface_ad_os;
  wire                area_ad7606_ctrl_ad7606Interface_ad_cs;
  wire                area_ad7606_ctrl_ad7606Interface_ad_rd;
  wire                area_ad7606_ctrl_ad7606Interface_ad_reset;
  wire                area_ad7606_ctrl_ad7606Interface_ad_convsta;
  wire                area_ad7606_ctrl_ad7606Interface_ad_convstb;
  wire                area_ad7606_ctrl_ad7606Interface_ad_range;
  wire                area_gtx_ctrl_apb_PREADY;
  wire       [15:0]   area_gtx_ctrl_apb_PRDATA;
  wire                area_gtx_ctrl_axiw_valid;
  wire                area_gtx_ctrl_axiw_payload_last;
  wire       [31:0]   area_gtx_ctrl_axiw_payload_fragment;
  wire                area_gtx_ctrl_axir_ready;
  wire                apb_decoder_io_input_PREADY;
  wire       [15:0]   apb_decoder_io_input_PRDATA;
  wire                apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   apb_decoder_io_output_PADDR;
  wire       [7:0]    apb_decoder_io_output_PSEL;
  wire                apb_decoder_io_output_PENABLE;
  wire                apb_decoder_io_output_PWRITE;
  wire       [15:0]   apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [15:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_4_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_4_PSEL;
  wire                apb3Router_1_io_outputs_4_PENABLE;
  wire                apb3Router_1_io_outputs_4_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_4_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_5_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_5_PSEL;
  wire                apb3Router_1_io_outputs_5_PENABLE;
  wire                apb3Router_1_io_outputs_5_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_5_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_6_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_6_PSEL;
  wire                apb3Router_1_io_outputs_6_PENABLE;
  wire                apb3Router_1_io_outputs_6_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_6_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_7_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_7_PSEL;
  wire                apb3Router_1_io_outputs_7_PENABLE;
  wire                apb3Router_1_io_outputs_7_PWRITE;
  wire       [15:0]   apb3Router_1_io_outputs_7_PWDATA;
  wire       [25:0]   _zz_area_counter_valueNext;
  wire       [0:0]    _zz_area_counter_valueNext_1;
  reg                 area_interrupt_temp;
  reg                 area_apbtimer_interrupt_delay_1;
  reg                 area_apbtimer_interrupt_delay_1_1;
  reg                 area_apbtimer_interrupt_delay_2;
  reg                 area_apbtimer_interrupt_delay_1_2;
  reg                 area_apbtimer_interrupt_delay_2_1;
  reg                 area_apbtimer_interrupt_delay_3;
  reg                 area_ledtemp;
  wire                area_counter_willIncrement;
  reg                 area_counter_willClear;
  reg        [25:0]   area_counter_valueNext;
  reg        [25:0]   area_counter_value;
  wire                area_counter_willOverflowIfInc;
  wire                area_counter_willOverflow;

  assign _zz_area_counter_valueNext_1 = area_counter_willIncrement;
  assign _zz_area_counter_valueNext = {25'd0, _zz_area_counter_valueNext_1};
  Emif_Apb area_emif_interface (
    .emif_emif_addr                (emif_emif_addr[19:0]                            ), //i
    .emif_emif_data_read           (emif_emif_data_read[15:0]                       ), //i
    .emif_emif_data_write          (area_emif_interface_emif_emif_data_write[15:0]  ), //o
    .emif_emif_data_writeEnable    (area_emif_interface_emif_emif_data_writeEnable  ), //o
    .emif_emif_cs                  (emif_emif_cs                                    ), //i
    .emif_emif_we                  (emif_emif_we                                    ), //i
    .emif_emif_oe                  (emif_emif_oe                                    ), //i
    .apb_PADDR                     (area_emif_interface_apb_PADDR[19:0]             ), //o
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
  ApbTimer area_apbtimer (
    .apb_PADDR        (area_apbtimer_apb_PADDR[3:0]            ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_0_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_0_PENABLE       ), //i
    .apb_PREADY       (area_apbtimer_apb_PREADY                ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_0_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[15:0]  ), //i
    .apb_PRDATA       (area_apbtimer_apb_PRDATA[15:0]          ), //o
    .apb_PSLVERROR    (area_apbtimer_apb_PSLVERROR             ), //o
    .interrupt        (area_apbtimer_interrupt                 ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  AD5544_triger area_ad5544_triger (
    .apb_PADDR        (area_ad5544_triger_apb_PADDR[3:0]       ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_1_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_1_PENABLE       ), //i
    .apb_PREADY       (area_ad5544_triger_apb_PREADY           ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_1_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[15:0]  ), //i
    .apb_PRDATA       (area_ad5544_triger_apb_PRDATA[15:0]     ), //o
    .apb_PSLVERROR    (area_ad5544_triger_apb_PSLVERROR        ), //o
    .ad5544_tri       (area_ad5544_triger_ad5544_tri           ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  AD5544 area_ad5544_A_Ctrl (
    .apb_PADDR                      (area_ad5544_A_Ctrl_apb_PADDR[3:0]               ), //i
    .apb_PSEL                       (apb3Router_1_io_outputs_2_PSEL                  ), //i
    .apb_PENABLE                    (apb3Router_1_io_outputs_2_PENABLE               ), //i
    .apb_PREADY                     (area_ad5544_A_Ctrl_apb_PREADY                   ), //o
    .apb_PWRITE                     (apb3Router_1_io_outputs_2_PWRITE                ), //i
    .apb_PWDATA                     (apb3Router_1_io_outputs_2_PWDATA[15:0]          ), //i
    .apb_PRDATA                     (area_ad5544_A_Ctrl_apb_PRDATA[15:0]             ), //o
    .apb_PSLVERROR                  (area_ad5544_A_Ctrl_apb_PSLVERROR                ), //o
    .ad5544Interface_AD5544_CS      (area_ad5544_A_Ctrl_ad5544Interface_AD5544_CS    ), //o
    .ad5544Interface_AD5544_LDAC    (area_ad5544_A_Ctrl_ad5544Interface_AD5544_LDAC  ), //o
    .ad5544Interface_AD5544_MSB     (area_ad5544_A_Ctrl_ad5544Interface_AD5544_MSB   ), //o
    .ad5544Interface_AD5544_RS      (area_ad5544_A_Ctrl_ad5544Interface_AD5544_RS    ), //o
    .ad5544Interface_AD5544_SCLK    (area_ad5544_A_Ctrl_ad5544Interface_AD5544_SCLK  ), //o
    .ad5544Interface_AD5544_SDIN    (area_ad5544_A_Ctrl_ad5544Interface_AD5544_SDIN  ), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           ), //i
    .ad5544_enable                  (area_ad5544_A_Ctrl_ad5544_enable                )  //i
  );
  AD5544 area_ad5544_B_Ctrl (
    .apb_PADDR                      (area_ad5544_B_Ctrl_apb_PADDR[3:0]               ), //i
    .apb_PSEL                       (apb3Router_1_io_outputs_3_PSEL                  ), //i
    .apb_PENABLE                    (apb3Router_1_io_outputs_3_PENABLE               ), //i
    .apb_PREADY                     (area_ad5544_B_Ctrl_apb_PREADY                   ), //o
    .apb_PWRITE                     (apb3Router_1_io_outputs_3_PWRITE                ), //i
    .apb_PWDATA                     (apb3Router_1_io_outputs_3_PWDATA[15:0]          ), //i
    .apb_PRDATA                     (area_ad5544_B_Ctrl_apb_PRDATA[15:0]             ), //o
    .apb_PSLVERROR                  (area_ad5544_B_Ctrl_apb_PSLVERROR                ), //o
    .ad5544Interface_AD5544_CS      (area_ad5544_B_Ctrl_ad5544Interface_AD5544_CS    ), //o
    .ad5544Interface_AD5544_LDAC    (area_ad5544_B_Ctrl_ad5544Interface_AD5544_LDAC  ), //o
    .ad5544Interface_AD5544_MSB     (area_ad5544_B_Ctrl_ad5544Interface_AD5544_MSB   ), //o
    .ad5544Interface_AD5544_RS      (area_ad5544_B_Ctrl_ad5544Interface_AD5544_RS    ), //o
    .ad5544Interface_AD5544_SCLK    (area_ad5544_B_Ctrl_ad5544Interface_AD5544_SCLK  ), //o
    .ad5544Interface_AD5544_SDIN    (area_ad5544_B_Ctrl_ad5544Interface_AD5544_SDIN  ), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           ), //i
    .ad5544_enable                  (area_ad5544_B_Ctrl_ad5544_enable                )  //i
  );
  AD5544 area_ad5544_C_Ctrl (
    .apb_PADDR                      (area_ad5544_C_Ctrl_apb_PADDR[3:0]               ), //i
    .apb_PSEL                       (apb3Router_1_io_outputs_4_PSEL                  ), //i
    .apb_PENABLE                    (apb3Router_1_io_outputs_4_PENABLE               ), //i
    .apb_PREADY                     (area_ad5544_C_Ctrl_apb_PREADY                   ), //o
    .apb_PWRITE                     (apb3Router_1_io_outputs_4_PWRITE                ), //i
    .apb_PWDATA                     (apb3Router_1_io_outputs_4_PWDATA[15:0]          ), //i
    .apb_PRDATA                     (area_ad5544_C_Ctrl_apb_PRDATA[15:0]             ), //o
    .apb_PSLVERROR                  (area_ad5544_C_Ctrl_apb_PSLVERROR                ), //o
    .ad5544Interface_AD5544_CS      (area_ad5544_C_Ctrl_ad5544Interface_AD5544_CS    ), //o
    .ad5544Interface_AD5544_LDAC    (area_ad5544_C_Ctrl_ad5544Interface_AD5544_LDAC  ), //o
    .ad5544Interface_AD5544_MSB     (area_ad5544_C_Ctrl_ad5544Interface_AD5544_MSB   ), //o
    .ad5544Interface_AD5544_RS      (area_ad5544_C_Ctrl_ad5544Interface_AD5544_RS    ), //o
    .ad5544Interface_AD5544_SCLK    (area_ad5544_C_Ctrl_ad5544Interface_AD5544_SCLK  ), //o
    .ad5544Interface_AD5544_SDIN    (area_ad5544_C_Ctrl_ad5544Interface_AD5544_SDIN  ), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           ), //i
    .ad5544_enable                  (area_ad5544_C_Ctrl_ad5544_enable                )  //i
  );
  Biss_C area_biss_c_ctrl (
    .apb_PADDR                  (area_biss_c_ctrl_apb_PADDR[3:0]          ), //i
    .apb_PSEL                   (apb3Router_1_io_outputs_5_PSEL           ), //i
    .apb_PENABLE                (apb3Router_1_io_outputs_5_PENABLE        ), //i
    .apb_PREADY                 (area_biss_c_ctrl_apb_PREADY              ), //o
    .apb_PWRITE                 (apb3Router_1_io_outputs_5_PWRITE         ), //i
    .apb_PWDATA                 (apb3Router_1_io_outputs_5_PWDATA[15:0]   ), //i
    .apb_PRDATA                 (area_biss_c_ctrl_apb_PRDATA[15:0]        ), //o
    .apb_PSLVERROR              (area_biss_c_ctrl_apb_PSLVERROR           ), //o
    .bisscInterface_enc_clk     (area_biss_c_ctrl_bisscInterface_enc_clk  ), //o
    .bisscInterface_enc_data    (biss_c_enc_data                          ), //i
    .clk                        (clk                                      ), //i
    .reset                      (reset                                    )  //i
  );
  AD7606 area_ad7606_ctrl (
    .apb_PADDR                     (area_ad7606_ctrl_apb_PADDR[3:0]              ), //i
    .apb_PSEL                      (apb3Router_1_io_outputs_6_PSEL               ), //i
    .apb_PENABLE                   (apb3Router_1_io_outputs_6_PENABLE            ), //i
    .apb_PREADY                    (area_ad7606_ctrl_apb_PREADY                  ), //o
    .apb_PWRITE                    (apb3Router_1_io_outputs_6_PWRITE             ), //i
    .apb_PWDATA                    (apb3Router_1_io_outputs_6_PWDATA[15:0]       ), //i
    .apb_PRDATA                    (area_ad7606_ctrl_apb_PRDATA[15:0]            ), //o
    .apb_PSLVERROR                 (area_ad7606_ctrl_apb_PSLVERROR               ), //o
    .ad7606Interface_ad_data       (ad7606_ad_data[15:0]                         ), //i
    .ad7606Interface_ad_busy       (ad7606_ad_busy                               ), //i
    .ad7606Interface_first_data    (ad7606_first_data                            ), //i
    .ad7606Interface_ad_os         (area_ad7606_ctrl_ad7606Interface_ad_os[2:0]  ), //o
    .ad7606Interface_ad_cs         (area_ad7606_ctrl_ad7606Interface_ad_cs       ), //o
    .ad7606Interface_ad_rd         (area_ad7606_ctrl_ad7606Interface_ad_rd       ), //o
    .ad7606Interface_ad_reset      (area_ad7606_ctrl_ad7606Interface_ad_reset    ), //o
    .ad7606Interface_ad_convsta    (area_ad7606_ctrl_ad7606Interface_ad_convsta  ), //o
    .ad7606Interface_ad_convstb    (area_ad7606_ctrl_ad7606Interface_ad_convstb  ), //o
    .ad7606Interface_ad_range      (area_ad7606_ctrl_ad7606Interface_ad_range    ), //o
    .clk                           (clk                                          ), //i
    .reset                         (reset                                        )  //i
  );
  Apb3_Gtx area_gtx_ctrl (
    .apb_PADDR                (area_gtx_ctrl_apb_PADDR[7:0]               ), //i
    .apb_PSEL                 (apb3Router_1_io_outputs_7_PSEL             ), //i
    .apb_PENABLE              (apb3Router_1_io_outputs_7_PENABLE          ), //i
    .apb_PREADY               (area_gtx_ctrl_apb_PREADY                   ), //o
    .apb_PWRITE               (apb3Router_1_io_outputs_7_PWRITE           ), //i
    .apb_PWDATA               (apb3Router_1_io_outputs_7_PWDATA[15:0]     ), //i
    .apb_PRDATA               (area_gtx_ctrl_apb_PRDATA[15:0]             ), //o
    .axiw_valid               (area_gtx_ctrl_axiw_valid                   ), //o
    .axiw_ready               (axiw_ready                                 ), //i
    .axiw_payload_last        (area_gtx_ctrl_axiw_payload_last            ), //o
    .axiw_payload_fragment    (area_gtx_ctrl_axiw_payload_fragment[31:0]  ), //o
    .axir_valid               (axir_valid                                 ), //i
    .axir_ready               (area_gtx_ctrl_axir_ready                   ), //o
    .axir_payload_last        (axir_payload_last                          ), //i
    .axir_payload_fragment    (axir_payload_fragment[31:0]                ), //i
    .reset                    (reset                                      ), //i
    .clk                      (clk                                        ), //i
    .gtxuser_clk              (gtxuser_clk                                )  //i
  );
  Apb3Decoder apb_decoder (
    .io_input_PADDR         (area_emif_interface_apb_PADDR[19:0]   ), //i
    .io_input_PSEL          (area_emif_interface_apb_PSEL          ), //i
    .io_input_PENABLE       (area_emif_interface_apb_PENABLE       ), //i
    .io_input_PREADY        (apb_decoder_io_input_PREADY           ), //o
    .io_input_PWRITE        (area_emif_interface_apb_PWRITE        ), //i
    .io_input_PWDATA        (area_emif_interface_apb_PWDATA[15:0]  ), //i
    .io_input_PRDATA        (apb_decoder_io_input_PRDATA[15:0]     ), //o
    .io_input_PSLVERROR     (apb_decoder_io_input_PSLVERROR        ), //o
    .io_output_PADDR        (apb_decoder_io_output_PADDR[19:0]     ), //o
    .io_output_PSEL         (apb_decoder_io_output_PSEL[7:0]       ), //o
    .io_output_PENABLE      (apb_decoder_io_output_PENABLE         ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY          ), //i
    .io_output_PWRITE       (apb_decoder_io_output_PWRITE          ), //o
    .io_output_PWDATA       (apb_decoder_io_output_PWDATA[15:0]    ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[15:0]    ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR       )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR            (apb_decoder_io_output_PADDR[19:0]       ), //i
    .io_input_PSEL             (apb_decoder_io_output_PSEL[7:0]         ), //i
    .io_input_PENABLE          (apb_decoder_io_output_PENABLE           ), //i
    .io_input_PREADY           (apb3Router_1_io_input_PREADY            ), //o
    .io_input_PWRITE           (apb_decoder_io_output_PWRITE            ), //i
    .io_input_PWDATA           (apb_decoder_io_output_PWDATA[15:0]      ), //i
    .io_input_PRDATA           (apb3Router_1_io_input_PRDATA[15:0]      ), //o
    .io_input_PSLVERROR        (apb3Router_1_io_input_PSLVERROR         ), //o
    .io_outputs_0_PADDR        (apb3Router_1_io_outputs_0_PADDR[19:0]   ), //o
    .io_outputs_0_PSEL         (apb3Router_1_io_outputs_0_PSEL          ), //o
    .io_outputs_0_PENABLE      (apb3Router_1_io_outputs_0_PENABLE       ), //o
    .io_outputs_0_PREADY       (area_apbtimer_apb_PREADY                ), //i
    .io_outputs_0_PWRITE       (apb3Router_1_io_outputs_0_PWRITE        ), //o
    .io_outputs_0_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[15:0]  ), //o
    .io_outputs_0_PRDATA       (area_apbtimer_apb_PRDATA[15:0]          ), //i
    .io_outputs_0_PSLVERROR    (area_apbtimer_apb_PSLVERROR             ), //i
    .io_outputs_1_PADDR        (apb3Router_1_io_outputs_1_PADDR[19:0]   ), //o
    .io_outputs_1_PSEL         (apb3Router_1_io_outputs_1_PSEL          ), //o
    .io_outputs_1_PENABLE      (apb3Router_1_io_outputs_1_PENABLE       ), //o
    .io_outputs_1_PREADY       (area_ad5544_triger_apb_PREADY           ), //i
    .io_outputs_1_PWRITE       (apb3Router_1_io_outputs_1_PWRITE        ), //o
    .io_outputs_1_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[15:0]  ), //o
    .io_outputs_1_PRDATA       (area_ad5544_triger_apb_PRDATA[15:0]     ), //i
    .io_outputs_1_PSLVERROR    (area_ad5544_triger_apb_PSLVERROR        ), //i
    .io_outputs_2_PADDR        (apb3Router_1_io_outputs_2_PADDR[19:0]   ), //o
    .io_outputs_2_PSEL         (apb3Router_1_io_outputs_2_PSEL          ), //o
    .io_outputs_2_PENABLE      (apb3Router_1_io_outputs_2_PENABLE       ), //o
    .io_outputs_2_PREADY       (area_ad5544_A_Ctrl_apb_PREADY           ), //i
    .io_outputs_2_PWRITE       (apb3Router_1_io_outputs_2_PWRITE        ), //o
    .io_outputs_2_PWDATA       (apb3Router_1_io_outputs_2_PWDATA[15:0]  ), //o
    .io_outputs_2_PRDATA       (area_ad5544_A_Ctrl_apb_PRDATA[15:0]     ), //i
    .io_outputs_2_PSLVERROR    (area_ad5544_A_Ctrl_apb_PSLVERROR        ), //i
    .io_outputs_3_PADDR        (apb3Router_1_io_outputs_3_PADDR[19:0]   ), //o
    .io_outputs_3_PSEL         (apb3Router_1_io_outputs_3_PSEL          ), //o
    .io_outputs_3_PENABLE      (apb3Router_1_io_outputs_3_PENABLE       ), //o
    .io_outputs_3_PREADY       (area_ad5544_B_Ctrl_apb_PREADY           ), //i
    .io_outputs_3_PWRITE       (apb3Router_1_io_outputs_3_PWRITE        ), //o
    .io_outputs_3_PWDATA       (apb3Router_1_io_outputs_3_PWDATA[15:0]  ), //o
    .io_outputs_3_PRDATA       (area_ad5544_B_Ctrl_apb_PRDATA[15:0]     ), //i
    .io_outputs_3_PSLVERROR    (area_ad5544_B_Ctrl_apb_PSLVERROR        ), //i
    .io_outputs_4_PADDR        (apb3Router_1_io_outputs_4_PADDR[19:0]   ), //o
    .io_outputs_4_PSEL         (apb3Router_1_io_outputs_4_PSEL          ), //o
    .io_outputs_4_PENABLE      (apb3Router_1_io_outputs_4_PENABLE       ), //o
    .io_outputs_4_PREADY       (area_ad5544_C_Ctrl_apb_PREADY           ), //i
    .io_outputs_4_PWRITE       (apb3Router_1_io_outputs_4_PWRITE        ), //o
    .io_outputs_4_PWDATA       (apb3Router_1_io_outputs_4_PWDATA[15:0]  ), //o
    .io_outputs_4_PRDATA       (area_ad5544_C_Ctrl_apb_PRDATA[15:0]     ), //i
    .io_outputs_4_PSLVERROR    (area_ad5544_C_Ctrl_apb_PSLVERROR        ), //i
    .io_outputs_5_PADDR        (apb3Router_1_io_outputs_5_PADDR[19:0]   ), //o
    .io_outputs_5_PSEL         (apb3Router_1_io_outputs_5_PSEL          ), //o
    .io_outputs_5_PENABLE      (apb3Router_1_io_outputs_5_PENABLE       ), //o
    .io_outputs_5_PREADY       (area_biss_c_ctrl_apb_PREADY             ), //i
    .io_outputs_5_PWRITE       (apb3Router_1_io_outputs_5_PWRITE        ), //o
    .io_outputs_5_PWDATA       (apb3Router_1_io_outputs_5_PWDATA[15:0]  ), //o
    .io_outputs_5_PRDATA       (area_biss_c_ctrl_apb_PRDATA[15:0]       ), //i
    .io_outputs_5_PSLVERROR    (area_biss_c_ctrl_apb_PSLVERROR          ), //i
    .io_outputs_6_PADDR        (apb3Router_1_io_outputs_6_PADDR[19:0]   ), //o
    .io_outputs_6_PSEL         (apb3Router_1_io_outputs_6_PSEL          ), //o
    .io_outputs_6_PENABLE      (apb3Router_1_io_outputs_6_PENABLE       ), //o
    .io_outputs_6_PREADY       (area_ad7606_ctrl_apb_PREADY             ), //i
    .io_outputs_6_PWRITE       (apb3Router_1_io_outputs_6_PWRITE        ), //o
    .io_outputs_6_PWDATA       (apb3Router_1_io_outputs_6_PWDATA[15:0]  ), //o
    .io_outputs_6_PRDATA       (area_ad7606_ctrl_apb_PRDATA[15:0]       ), //i
    .io_outputs_6_PSLVERROR    (area_ad7606_ctrl_apb_PSLVERROR          ), //i
    .io_outputs_7_PADDR        (apb3Router_1_io_outputs_7_PADDR[19:0]   ), //o
    .io_outputs_7_PSEL         (apb3Router_1_io_outputs_7_PSEL          ), //o
    .io_outputs_7_PENABLE      (apb3Router_1_io_outputs_7_PENABLE       ), //o
    .io_outputs_7_PREADY       (area_gtx_ctrl_apb_PREADY                ), //i
    .io_outputs_7_PWRITE       (apb3Router_1_io_outputs_7_PWRITE        ), //o
    .io_outputs_7_PWDATA       (apb3Router_1_io_outputs_7_PWDATA[15:0]  ), //o
    .io_outputs_7_PRDATA       (area_gtx_ctrl_apb_PRDATA[15:0]          ), //i
    .io_outputs_7_PSLVERROR    (1'b0                                    ), //i
    .clk                       (clk                                     ), //i
    .reset                     (reset                                   )  //i
  );
  assign emif_emif_data_write = area_emif_interface_emif_emif_data_write;
  assign emif_emif_data_writeEnable = area_emif_interface_emif_emif_data_writeEnable;
  assign ad5544_A_AD5544_CS = area_ad5544_A_Ctrl_ad5544Interface_AD5544_CS;
  assign ad5544_A_AD5544_LDAC = area_ad5544_A_Ctrl_ad5544Interface_AD5544_LDAC;
  assign ad5544_A_AD5544_MSB = area_ad5544_A_Ctrl_ad5544Interface_AD5544_MSB;
  assign ad5544_A_AD5544_RS = area_ad5544_A_Ctrl_ad5544Interface_AD5544_RS;
  assign ad5544_A_AD5544_SCLK = area_ad5544_A_Ctrl_ad5544Interface_AD5544_SCLK;
  assign ad5544_A_AD5544_SDIN = area_ad5544_A_Ctrl_ad5544Interface_AD5544_SDIN;
  assign area_ad5544_A_Ctrl_ad5544_enable = (area_ad5544_triger_ad5544_tri || area_interrupt_temp);
  assign ad5544_B_AD5544_CS = area_ad5544_B_Ctrl_ad5544Interface_AD5544_CS;
  assign ad5544_B_AD5544_LDAC = area_ad5544_B_Ctrl_ad5544Interface_AD5544_LDAC;
  assign ad5544_B_AD5544_MSB = area_ad5544_B_Ctrl_ad5544Interface_AD5544_MSB;
  assign ad5544_B_AD5544_RS = area_ad5544_B_Ctrl_ad5544Interface_AD5544_RS;
  assign ad5544_B_AD5544_SCLK = area_ad5544_B_Ctrl_ad5544Interface_AD5544_SCLK;
  assign ad5544_B_AD5544_SDIN = area_ad5544_B_Ctrl_ad5544Interface_AD5544_SDIN;
  assign area_ad5544_B_Ctrl_ad5544_enable = (area_ad5544_triger_ad5544_tri || area_interrupt_temp);
  assign ad5544_C_AD5544_CS = area_ad5544_C_Ctrl_ad5544Interface_AD5544_CS;
  assign ad5544_C_AD5544_LDAC = area_ad5544_C_Ctrl_ad5544Interface_AD5544_LDAC;
  assign ad5544_C_AD5544_MSB = area_ad5544_C_Ctrl_ad5544Interface_AD5544_MSB;
  assign ad5544_C_AD5544_RS = area_ad5544_C_Ctrl_ad5544Interface_AD5544_RS;
  assign ad5544_C_AD5544_SCLK = area_ad5544_C_Ctrl_ad5544Interface_AD5544_SCLK;
  assign ad5544_C_AD5544_SDIN = area_ad5544_C_Ctrl_ad5544Interface_AD5544_SDIN;
  assign area_ad5544_C_Ctrl_ad5544_enable = (area_ad5544_triger_ad5544_tri || area_interrupt_temp);
  assign biss_c_enc_clk = area_biss_c_ctrl_bisscInterface_enc_clk;
  assign ad7606_ad_os = area_ad7606_ctrl_ad7606Interface_ad_os;
  assign ad7606_ad_cs = area_ad7606_ctrl_ad7606Interface_ad_cs;
  assign ad7606_ad_rd = area_ad7606_ctrl_ad7606Interface_ad_rd;
  assign ad7606_ad_reset = area_ad7606_ctrl_ad7606Interface_ad_reset;
  assign ad7606_ad_convsta = area_ad7606_ctrl_ad7606Interface_ad_convsta;
  assign ad7606_ad_convstb = area_ad7606_ctrl_ad7606Interface_ad_convstb;
  assign ad7606_ad_range = area_ad7606_ctrl_ad7606Interface_ad_range;
  assign axiw_valid = area_gtx_ctrl_axiw_valid;
  assign axiw_payload_last = area_gtx_ctrl_axiw_payload_last;
  assign axiw_payload_fragment = area_gtx_ctrl_axiw_payload_fragment;
  assign axir_ready = area_gtx_ctrl_axir_ready;
  assign area_apbtimer_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign area_ad5544_triger_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign area_ad5544_A_Ctrl_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign area_ad5544_B_Ctrl_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[3:0];
  assign area_ad5544_C_Ctrl_apb_PADDR = apb3Router_1_io_outputs_4_PADDR[3:0];
  assign area_biss_c_ctrl_apb_PADDR = apb3Router_1_io_outputs_5_PADDR[3:0];
  assign area_ad7606_ctrl_apb_PADDR = apb3Router_1_io_outputs_6_PADDR[3:0];
  assign area_gtx_ctrl_apb_PADDR = apb3Router_1_io_outputs_7_PADDR[7:0];
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
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      area_interrupt_temp <= 1'b0;
      area_ledtemp <= 1'b0;
      area_counter_value <= 26'h0;
    end else begin
      area_interrupt_temp <= (((area_apbtimer_interrupt || area_apbtimer_interrupt_delay_1) || area_apbtimer_interrupt_delay_2) || area_apbtimer_interrupt_delay_3);
      area_counter_value <= area_counter_valueNext;
      if(area_counter_willOverflow) begin
        area_ledtemp <= (! area_ledtemp);
      end
    end
  end

  always @(posedge clk) begin
    area_apbtimer_interrupt_delay_1 <= area_apbtimer_interrupt;
    area_apbtimer_interrupt_delay_1_1 <= area_apbtimer_interrupt;
    area_apbtimer_interrupt_delay_2 <= area_apbtimer_interrupt_delay_1_1;
    area_apbtimer_interrupt_delay_1_2 <= area_apbtimer_interrupt;
    area_apbtimer_interrupt_delay_2_1 <= area_apbtimer_interrupt_delay_1_2;
    area_apbtimer_interrupt_delay_3 <= area_apbtimer_interrupt_delay_2_1;
  end


endmodule

module Apb3Router (
  input      [19:0]   io_input_PADDR,
  input      [7:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [15:0]   io_input_PWDATA,
  output     [15:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [19:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [15:0]   io_outputs_0_PWDATA,
  input      [15:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [19:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [15:0]   io_outputs_1_PWDATA,
  input      [15:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [19:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [15:0]   io_outputs_2_PWDATA,
  input      [15:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  output     [19:0]   io_outputs_3_PADDR,
  output     [0:0]    io_outputs_3_PSEL,
  output              io_outputs_3_PENABLE,
  input               io_outputs_3_PREADY,
  output              io_outputs_3_PWRITE,
  output     [15:0]   io_outputs_3_PWDATA,
  input      [15:0]   io_outputs_3_PRDATA,
  input               io_outputs_3_PSLVERROR,
  output     [19:0]   io_outputs_4_PADDR,
  output     [0:0]    io_outputs_4_PSEL,
  output              io_outputs_4_PENABLE,
  input               io_outputs_4_PREADY,
  output              io_outputs_4_PWRITE,
  output     [15:0]   io_outputs_4_PWDATA,
  input      [15:0]   io_outputs_4_PRDATA,
  input               io_outputs_4_PSLVERROR,
  output     [19:0]   io_outputs_5_PADDR,
  output     [0:0]    io_outputs_5_PSEL,
  output              io_outputs_5_PENABLE,
  input               io_outputs_5_PREADY,
  output              io_outputs_5_PWRITE,
  output     [15:0]   io_outputs_5_PWDATA,
  input      [15:0]   io_outputs_5_PRDATA,
  input               io_outputs_5_PSLVERROR,
  output     [19:0]   io_outputs_6_PADDR,
  output     [0:0]    io_outputs_6_PSEL,
  output              io_outputs_6_PENABLE,
  input               io_outputs_6_PREADY,
  output              io_outputs_6_PWRITE,
  output     [15:0]   io_outputs_6_PWDATA,
  input      [15:0]   io_outputs_6_PRDATA,
  input               io_outputs_6_PSLVERROR,
  output     [19:0]   io_outputs_7_PADDR,
  output     [0:0]    io_outputs_7_PSEL,
  output              io_outputs_7_PENABLE,
  input               io_outputs_7_PREADY,
  output              io_outputs_7_PWRITE,
  output     [15:0]   io_outputs_7_PWDATA,
  input      [15:0]   io_outputs_7_PRDATA,
  input               io_outputs_7_PSLVERROR,
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
  wire                _zz_selIndex_5;
  wire                _zz_selIndex_6;
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
      3'b101 : begin
        _zz_io_input_PREADY = io_outputs_5_PREADY;
        _zz_io_input_PRDATA = io_outputs_5_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_5_PSLVERROR;
      end
      3'b110 : begin
        _zz_io_input_PREADY = io_outputs_6_PREADY;
        _zz_io_input_PRDATA = io_outputs_6_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_6_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_7_PREADY;
        _zz_io_input_PRDATA = io_outputs_7_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_7_PSLVERROR;
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
  assign io_outputs_6_PADDR = io_input_PADDR;
  assign io_outputs_6_PENABLE = io_input_PENABLE;
  assign io_outputs_6_PSEL[0] = io_input_PSEL[6];
  assign io_outputs_6_PWRITE = io_input_PWRITE;
  assign io_outputs_6_PWDATA = io_input_PWDATA;
  assign io_outputs_7_PADDR = io_input_PADDR;
  assign io_outputs_7_PENABLE = io_input_PENABLE;
  assign io_outputs_7_PSEL[0] = io_input_PSEL[7];
  assign io_outputs_7_PWRITE = io_input_PWRITE;
  assign io_outputs_7_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = io_input_PSEL[5];
  assign _zz_selIndex_2 = io_input_PSEL[6];
  assign _zz_selIndex_3 = io_input_PSEL[7];
  assign _zz_selIndex_4 = (((io_input_PSEL[1] || _zz_selIndex) || _zz_selIndex_1) || _zz_selIndex_3);
  assign _zz_selIndex_5 = (((io_input_PSEL[2] || _zz_selIndex) || _zz_selIndex_2) || _zz_selIndex_3);
  assign _zz_selIndex_6 = (((io_input_PSEL[4] || _zz_selIndex_1) || _zz_selIndex_2) || _zz_selIndex_3);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge clk) begin
    selIndex <= {_zz_selIndex_6,{_zz_selIndex_5,_zz_selIndex_4}};
  end


endmodule

module Apb3Decoder (
  input      [19:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [15:0]   io_input_PWDATA,
  output     [15:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [19:0]   io_output_PADDR,
  output reg [7:0]    io_output_PSEL,
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
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00600) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h00007)) == 20'h0) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00100) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00200) && io_input_PSEL[0]);
    io_output_PSEL[4] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00300) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00400) && io_input_PSEL[0]);
    io_output_PSEL[6] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00500) && io_input_PSEL[0]);
    io_output_PSEL[7] = (((io_input_PADDR & (~ 20'h000ff)) == 20'h00700) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 8'h0));

endmodule

module Apb3_Gtx (
  input      [7:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              axiw_valid,
  input               axiw_ready,
  output              axiw_payload_last,
  output     [31:0]   axiw_payload_fragment,
  input               axir_valid,
  output              axir_ready,
  input               axir_payload_last,
  input      [31:0]   axir_payload_fragment,
  input               reset,
  input               clk,
  input               gtxuser_clk
);

  reg                 axictrl_axictrl_rx_stream_ready;
  wire       [15:0]   axictrl_axictrl_tx_stream_payload;
  wire                axictrl_axiw_valid;
  wire                axictrl_axiw_payload_last;
  wire       [31:0]   axictrl_axiw_payload_fragment;
  wire                axictrl_axir_ready;
  wire                axictrl_axictrl_rx_stream_valid;
  wire       [15:0]   axictrl_axictrl_rx_stream_payload;
  wire       [8:0]    axictrl_axictrl_rx_popOccupancy;
  wire                axictrl_axictrl_tx_stream_ready;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 axictrl_axictrl_tx_flush_driver;
  reg                 axictrl_axictrl_rx_flush_driver;
  reg                 _zz_axictrl_tx_stream_valid;

  Gtx axictrl (
    .axiw_valid                   (axictrl_axiw_valid                       ), //o
    .axiw_ready                   (axiw_ready                               ), //i
    .axiw_payload_last            (axictrl_axiw_payload_last                ), //o
    .axiw_payload_fragment        (axictrl_axiw_payload_fragment[31:0]      ), //o
    .axir_valid                   (axir_valid                               ), //i
    .axir_ready                   (axictrl_axir_ready                       ), //o
    .axir_payload_last            (axir_payload_last                        ), //i
    .axir_payload_fragment        (axir_payload_fragment[31:0]              ), //i
    .axictrl_rx_stream_valid      (axictrl_axictrl_rx_stream_valid          ), //o
    .axictrl_rx_stream_ready      (axictrl_axictrl_rx_stream_ready          ), //i
    .axictrl_rx_stream_payload    (axictrl_axictrl_rx_stream_payload[15:0]  ), //o
    .axictrl_rx_flush             (axictrl_axictrl_rx_flush_driver          ), //i
    .axictrl_rx_popOccupancy      (axictrl_axictrl_rx_popOccupancy[8:0]     ), //o
    .axictrl_tx_stream_valid      (_zz_axictrl_tx_stream_valid              ), //i
    .axictrl_tx_stream_ready      (axictrl_axictrl_tx_stream_ready          ), //o
    .axictrl_tx_stream_payload    (axictrl_axictrl_tx_stream_payload[15:0]  ), //i
    .axictrl_tx_flush             (axictrl_axictrl_tx_flush_driver          ), //i
    .reset                        (reset                                    ), //i
    .gtxuser_clk                  (gtxuser_clk                              ), //i
    .clk                          (clk                                      )  //i
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      8'h0 : begin
        apb_PRDATA[0 : 0] = axictrl_axictrl_tx_flush_driver;
        apb_PRDATA[1 : 1] = axictrl_axictrl_tx_stream_ready;
        apb_PRDATA[4 : 4] = axictrl_axictrl_rx_flush_driver;
        apb_PRDATA[5 : 5] = axictrl_axictrl_rx_stream_valid;
      end
      8'h20 : begin
        apb_PRDATA[15 : 0] = axictrl_axictrl_rx_stream_payload;
      end
      8'h24 : begin
        apb_PRDATA[8 : 0] = axictrl_axictrl_rx_popOccupancy;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busCtrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busCtrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busCtrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(*) begin
    _zz_axictrl_tx_stream_valid = 1'b0;
    case(apb_PADDR)
      8'h10 : begin
        if(busCtrl_doWrite) begin
          _zz_axictrl_tx_stream_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign axictrl_axictrl_tx_stream_payload = apb_PWDATA[15 : 0];
  always @(*) begin
    axictrl_axictrl_rx_stream_ready = 1'b0;
    case(apb_PADDR)
      8'h20 : begin
        if(busCtrl_doRead) begin
          axictrl_axictrl_rx_stream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign axiw_valid = axictrl_axiw_valid;
  assign axiw_payload_last = axictrl_axiw_payload_last;
  assign axiw_payload_fragment = axictrl_axiw_payload_fragment;
  assign axir_ready = axictrl_axir_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      axictrl_axictrl_tx_flush_driver <= 1'b1;
      axictrl_axictrl_rx_flush_driver <= 1'b1;
    end else begin
      case(apb_PADDR)
        8'h0 : begin
          if(busCtrl_doWrite) begin
            axictrl_axictrl_tx_flush_driver <= apb_PWDATA[0];
            axictrl_axictrl_rx_flush_driver <= apb_PWDATA[4];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module AD7606 (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  input      [15:0]   ad7606Interface_ad_data,
  input               ad7606Interface_ad_busy,
  input               ad7606Interface_first_data,
  output     [2:0]    ad7606Interface_ad_os,
  output              ad7606Interface_ad_cs,
  output              ad7606Interface_ad_rd,
  output              ad7606Interface_ad_reset,
  output              ad7606Interface_ad_convsta,
  output              ad7606Interface_ad_convstb,
  output              ad7606Interface_ad_range,
  input               clk,
  input               reset
);

  wire       [2:0]    area_ad7606_ctrl_ad_os;
  wire                area_ad7606_ctrl_ad_cs;
  wire                area_ad7606_ctrl_ad_rd;
  wire                area_ad7606_ctrl_ad_reset;
  wire                area_ad7606_ctrl_ad_convsta;
  wire                area_ad7606_ctrl_ad_convstb;
  wire                area_ad7606_ctrl_ad_range;
  wire       [15:0]   area_ad7606_ctrl_ad_ch1_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch2_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch3_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch4_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch5_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch6_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch7_o;
  wire       [15:0]   area_ad7606_ctrl_ad_ch8_o;
  wire                area_ad7606_ctrl_ad_data_valid_o;
  reg        [15:0]   area_data_temp_1;
  reg        [15:0]   area_data_temp_2;
  reg        [15:0]   area_data_temp_3;
  reg        [15:0]   area_data_temp_4;
  reg        [15:0]   area_data_temp_5;
  reg        [15:0]   area_data_temp_6;
  reg        [15:0]   area_data_temp_7;
  reg        [15:0]   area_data_temp_8;
  wire                area_ctrl_askWrite;
  wire                area_ctrl_askRead;
  wire                area_ctrl_doWrite;
  wire                area_ctrl_doRead;

  AD7606_DATA area_ad7606_ctrl (
    .clk                (clk                               ), //i
    .reset              (reset                             ), //i
    .sample_en          (1'b1                              ), //i
    .ad_data            (ad7606Interface_ad_data[15:0]     ), //i
    .ad_busy            (ad7606Interface_ad_busy           ), //i
    .first_data         (ad7606Interface_first_data        ), //i
    .ad_os              (area_ad7606_ctrl_ad_os[2:0]       ), //o
    .ad_cs              (area_ad7606_ctrl_ad_cs            ), //o
    .ad_rd              (area_ad7606_ctrl_ad_rd            ), //o
    .ad_reset           (area_ad7606_ctrl_ad_reset         ), //o
    .ad_convsta         (area_ad7606_ctrl_ad_convsta       ), //o
    .ad_convstb         (area_ad7606_ctrl_ad_convstb       ), //o
    .ad_range           (area_ad7606_ctrl_ad_range         ), //o
    .ad_ch1_o           (area_ad7606_ctrl_ad_ch1_o[15:0]   ), //o
    .ad_ch2_o           (area_ad7606_ctrl_ad_ch2_o[15:0]   ), //o
    .ad_ch3_o           (area_ad7606_ctrl_ad_ch3_o[15:0]   ), //o
    .ad_ch4_o           (area_ad7606_ctrl_ad_ch4_o[15:0]   ), //o
    .ad_ch5_o           (area_ad7606_ctrl_ad_ch5_o[15:0]   ), //o
    .ad_ch6_o           (area_ad7606_ctrl_ad_ch6_o[15:0]   ), //o
    .ad_ch7_o           (area_ad7606_ctrl_ad_ch7_o[15:0]   ), //o
    .ad_ch8_o           (area_ad7606_ctrl_ad_ch8_o[15:0]   ), //o
    .ad_data_valid_o    (area_ad7606_ctrl_ad_data_valid_o  )  //o
  );
  assign ad7606Interface_ad_os = area_ad7606_ctrl_ad_os;
  assign ad7606Interface_ad_cs = area_ad7606_ctrl_ad_cs;
  assign ad7606Interface_ad_rd = area_ad7606_ctrl_ad_rd;
  assign ad7606Interface_ad_convsta = area_ad7606_ctrl_ad_convsta;
  assign ad7606Interface_ad_convstb = area_ad7606_ctrl_ad_convstb;
  assign ad7606Interface_ad_reset = area_ad7606_ctrl_ad_reset;
  assign ad7606Interface_ad_range = area_ad7606_ctrl_ad_range;
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      4'b0000 : begin
        apb_PRDATA[15 : 0] = area_data_temp_1;
      end
      4'b0010 : begin
        apb_PRDATA[15 : 0] = area_data_temp_2;
      end
      4'b0100 : begin
        apb_PRDATA[15 : 0] = area_data_temp_3;
      end
      4'b0110 : begin
        apb_PRDATA[15 : 0] = area_data_temp_4;
      end
      4'b1000 : begin
        apb_PRDATA[15 : 0] = area_data_temp_5;
      end
      4'b1010 : begin
        apb_PRDATA[15 : 0] = area_data_temp_6;
      end
      4'b1100 : begin
        apb_PRDATA[15 : 0] = area_data_temp_7;
      end
      4'b1110 : begin
        apb_PRDATA[15 : 0] = area_data_temp_8;
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
      area_data_temp_1 <= 16'h1234;
      area_data_temp_2 <= 16'h5678;
      area_data_temp_3 <= 16'h0a0b;
      area_data_temp_4 <= 16'h0102;
      area_data_temp_5 <= 16'h0203;
      area_data_temp_6 <= 16'h0304;
      area_data_temp_7 <= 16'h0405;
      area_data_temp_8 <= 16'h0506;
    end else begin
      if(area_ad7606_ctrl_ad_data_valid_o) begin
        area_data_temp_1 <= area_ad7606_ctrl_ad_ch1_o;
        area_data_temp_2 <= area_ad7606_ctrl_ad_ch2_o;
        area_data_temp_3 <= area_ad7606_ctrl_ad_ch3_o;
        area_data_temp_4 <= area_ad7606_ctrl_ad_ch4_o;
        area_data_temp_5 <= area_ad7606_ctrl_ad_ch5_o;
        area_data_temp_6 <= area_ad7606_ctrl_ad_ch6_o;
        area_data_temp_7 <= area_ad7606_ctrl_ad_ch7_o;
        area_data_temp_8 <= area_ad7606_ctrl_ad_ch8_o;
      end
    end
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
  input               reset
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
    case(apb_PADDR)
      4'b0010 : begin
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
  always @(*) begin
    when_AD5544_l91 = 1'b0;
    case(apb_PADDR)
      4'b0010 : begin
        if(area_ctrl_doWrite) begin
          when_AD5544_l91 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

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

module ApbTimer (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              interrupt,
  input               clk,
  input               reset
);

  reg                 area_timerA_io_clear;
  wire                area_timerA_io_full;
  wire       [15:0]   area_timerA_io_value;
  wire                area_busCtrl_askWrite;
  wire                area_busCtrl_askRead;
  wire                area_busCtrl_doWrite;
  wire                area_busCtrl_doRead;
  reg                 _zz_io_tick;
  reg        [15:0]   area_timerA_io_limit_driver;
  wire                when_ApbTimer_l38;

  Timer area_timerA (
    .io_tick     (_zz_io_tick                        ), //i
    .io_clear    (area_timerA_io_clear               ), //i
    .io_limit    (area_timerA_io_limit_driver[15:0]  ), //i
    .io_full     (area_timerA_io_full                ), //o
    .io_value    (area_timerA_io_value[15:0]         ), //o
    .clk         (clk                                ), //i
    .reset       (reset                              )  //i
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      4'b0010 : begin
        apb_PRDATA[15 : 0] = area_timerA_io_limit_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign area_busCtrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign area_busCtrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign area_busCtrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign area_busCtrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign when_ApbTimer_l38 = (area_timerA_io_limit_driver <= area_timerA_io_value);
  always @(*) begin
    if(when_ApbTimer_l38) begin
      area_timerA_io_clear = 1'b1;
    end else begin
      area_timerA_io_clear = 1'b0;
    end
  end

  assign interrupt = area_timerA_io_full;
  always @(posedge clk) begin
    case(apb_PADDR)
      4'b0000 : begin
        if(area_busCtrl_doWrite) begin
          _zz_io_tick <= apb_PWDATA[0];
        end
      end
      4'b0010 : begin
        if(area_busCtrl_doWrite) begin
          area_timerA_io_limit_driver <= apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Emif_Apb (
  (* MARK_DEBUG = "TRUE" *) input      [19:0]   emif_emif_addr,
  (* MARK_DEBUG = "TRUE" *) input      [15:0]   emif_emif_data_read,
  (* MARK_DEBUG = "TRUE" *) output     [15:0]   emif_emif_data_write,
  (* MARK_DEBUG = "TRUE" *) output              emif_emif_data_writeEnable,
  (* MARK_DEBUG = "TRUE" *) input               emif_emif_cs,
  (* MARK_DEBUG = "TRUE" *) input               emif_emif_we,
  (* MARK_DEBUG = "TRUE" *) input               emif_emif_oe,
  (* MARK_DEBUG = "TRUE" *) output     [19:0]   apb_PADDR,
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

  wire       [20:0]   _zz_apb_PADDR;
  reg                 penable;
  reg                 penable_regNext;
  (* MARK_DEBUG = "TRUE" *) reg        [15:0]   rd_data_temp;

  assign _zz_apb_PADDR = ({1'd0,emif_emif_addr} <<< 1);
  assign apb_PADDR = _zz_apb_PADDR[19:0];
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

module Gtx (
  output              axiw_valid,
  input               axiw_ready,
  output              axiw_payload_last,
  output     [31:0]   axiw_payload_fragment,
  input               axir_valid,
  output              axir_ready,
  input               axir_payload_last,
  input      [31:0]   axir_payload_fragment,
  output              axictrl_rx_stream_valid,
  input               axictrl_rx_stream_ready,
  output     [15:0]   axictrl_rx_stream_payload,
  input               axictrl_rx_flush,
  output     [8:0]    axictrl_rx_popOccupancy,
  input               axictrl_tx_stream_valid,
  output              axictrl_tx_stream_ready,
  input      [15:0]   axictrl_tx_stream_payload,
  input               axictrl_tx_flush,
  input               reset,
  input               gtxuser_clk,
  input               clk
);

  wire                bufferCC_14_io_dataOut;
  wire                bufferCC_15_io_dataOut;
  wire                txFrontend_stream_adapt_push_stream_ready;
  wire                txFrontend_stream_adapt_pop_stream_valid;
  wire       [31:0]   txFrontend_stream_adapt_pop_stream_payload;
  wire                txFrontend_buffer_io_push_stream_ready;
  wire       [6:0]    txFrontend_buffer_io_push_availability;
  wire                txFrontend_buffer_io_pop_stream_valid;
  wire                txFrontend_buffer_io_pop_stream_payload_last;
  wire       [31:0]   txFrontend_buffer_io_pop_stream_payload_fragment;
  wire                txBackend_crc_input_ready;
  wire                txBackend_crc_output_valid;
  wire                txBackend_crc_output_payload_last;
  wire       [31:0]   txBackend_crc_output_payload_fragment;
  wire                txBackend_header_input_ready;
  wire                txBackend_header_output_valid;
  wire                txBackend_header_output_payload_last;
  wire       [31:0]   txBackend_header_output_payload_fragment;
  wire                rxFrontend_preamble_io_input_ready;
  wire                rxFrontend_preamble_io_output_valid;
  wire                rxFrontend_preamble_io_output_payload_last;
  wire       [31:0]   rxFrontend_preamble_io_output_payload_fragment;
  wire                rxFrontend_checker_io_input_ready;
  wire                rxFrontend_checker_io_output_valid;
  wire                rxFrontend_checker_io_output_payload_last;
  wire       [31:0]   rxFrontend_checker_io_output_payload_fragment;
  wire                rxFrontend_checker_io_error;
  wire                rxFrontend_buffer_io_push_stream_ready;
  wire                rxFrontend_buffer_io_pop_stream_valid;
  wire       [15:0]   rxFrontend_buffer_io_pop_stream_payload;
  wire                rxFrontend_buffer_CC_io_push_ready;
  wire                rxFrontend_buffer_CC_io_pop_valid;
  wire       [15:0]   rxFrontend_buffer_CC_io_pop_payload;
  wire       [8:0]    rxFrontend_buffer_CC_io_pushOccupancy;
  wire       [8:0]    rxFrontend_buffer_CC_io_popOccupancy;
  wire                _zz_1;
  wire                rxReset;
  wire                _zz_2;
  wire                txReset;
  wire                txBackend_header_output_fire;
  reg                 _zz_io_pop_commit;

  BufferCC_12 bufferCC_14 (
    .io_dataIn      (1'b0                    ), //i
    .io_dataOut     (bufferCC_14_io_dataOut  ), //o
    .gtxuser_clk    (gtxuser_clk             ), //i
    ._zz_1          (_zz_1                   )  //i
  );
  BufferCC_12 bufferCC_15 (
    .io_dataIn      (1'b0                    ), //i
    .io_dataOut     (bufferCC_15_io_dataOut  ), //o
    .gtxuser_clk    (gtxuser_clk             ), //i
    ._zz_1          (_zz_2                   )  //i
  );
  Tx_Buffer_Adapt txFrontend_stream_adapt (
    .push_stream_valid      (axictrl_tx_stream_valid                           ), //i
    .push_stream_ready      (txFrontend_stream_adapt_push_stream_ready         ), //o
    .push_stream_payload    (axictrl_tx_stream_payload[15:0]                   ), //i
    .pop_stream_valid       (txFrontend_stream_adapt_pop_stream_valid          ), //o
    .pop_stream_ready       (txFrontend_buffer_io_push_stream_ready            ), //i
    .pop_stream_payload     (txFrontend_stream_adapt_pop_stream_payload[31:0]  ), //o
    .clk                    (clk                                               ), //i
    .reset                  (reset                                             ), //i
    .axictrl_tx_flush       (axictrl_tx_flush                                  )  //i
  );
  Tx_Buffer txFrontend_buffer (
    .io_push_stream_valid              (txFrontend_stream_adapt_pop_stream_valid                ), //i
    .io_push_stream_ready              (txFrontend_buffer_io_push_stream_ready                  ), //o
    .io_push_stream_payload            (txFrontend_stream_adapt_pop_stream_payload[31:0]        ), //i
    .io_push_availability              (txFrontend_buffer_io_push_availability[6:0]             ), //o
    .io_pop_stream_valid               (txFrontend_buffer_io_pop_stream_valid                   ), //o
    .io_pop_stream_ready               (txBackend_crc_input_ready                               ), //i
    .io_pop_stream_payload_last        (txFrontend_buffer_io_pop_stream_payload_last            ), //o
    .io_pop_stream_payload_fragment    (txFrontend_buffer_io_pop_stream_payload_fragment[31:0]  ), //o
    .io_pop_redo                       (1'b0                                                    ), //i
    .io_pop_commit                     (_zz_io_pop_commit                                       ), //i
    .clk                               (clk                                                     ), //i
    .reset                             (reset                                                   ), //i
    .axictrl_tx_flush                  (axictrl_tx_flush                                        ), //i
    .gtxuser_clk                       (gtxuser_clk                                             ), //i
    .txReset                           (txReset                                                 )  //i
  );
  Tx_Crc txBackend_crc (
    .input_valid                (txFrontend_buffer_io_pop_stream_valid                   ), //i
    .input_ready                (txBackend_crc_input_ready                               ), //o
    .input_payload_last         (txFrontend_buffer_io_pop_stream_payload_last            ), //i
    .input_payload_fragment     (txFrontend_buffer_io_pop_stream_payload_fragment[31:0]  ), //i
    .output_valid               (txBackend_crc_output_valid                              ), //o
    .output_ready               (txBackend_header_input_ready                            ), //i
    .output_payload_last        (txBackend_crc_output_payload_last                       ), //o
    .output_payload_fragment    (txBackend_crc_output_payload_fragment[31:0]             ), //o
    .gtxuser_clk                (gtxuser_clk                                             ), //i
    .txReset                    (txReset                                                 )  //i
  );
  Tx_Header txBackend_header (
    .input_valid                (txBackend_crc_output_valid                      ), //i
    .input_ready                (txBackend_header_input_ready                    ), //o
    .input_payload_last         (txBackend_crc_output_payload_last               ), //i
    .input_payload_fragment     (txBackend_crc_output_payload_fragment[31:0]     ), //i
    .output_valid               (txBackend_header_output_valid                   ), //o
    .output_ready               (axiw_ready                                      ), //i
    .output_payload_last        (txBackend_header_output_payload_last            ), //o
    .output_payload_fragment    (txBackend_header_output_payload_fragment[31:0]  ), //o
    .gtxuser_clk                (gtxuser_clk                                     ), //i
    .txReset                    (txReset                                         )  //i
  );
  Rx_Preamble rxFrontend_preamble (
    .io_input_valid                (axir_valid                                            ), //i
    .io_input_ready                (rxFrontend_preamble_io_input_ready                    ), //o
    .io_input_payload_last         (axir_payload_last                                     ), //i
    .io_input_payload_fragment     (axir_payload_fragment[31:0]                           ), //i
    .io_output_valid               (rxFrontend_preamble_io_output_valid                   ), //o
    .io_output_ready               (rxFrontend_checker_io_input_ready                     ), //i
    .io_output_payload_last        (rxFrontend_preamble_io_output_payload_last            ), //o
    .io_output_payload_fragment    (rxFrontend_preamble_io_output_payload_fragment[31:0]  ), //o
    .gtxuser_clk                   (gtxuser_clk                                           ), //i
    .rxReset                       (rxReset                                               )  //i
  );
  Rx_Checker rxFrontend_checker (
    .io_input_valid                (rxFrontend_preamble_io_output_valid                   ), //i
    .io_input_ready                (rxFrontend_checker_io_input_ready                     ), //o
    .io_input_payload_last         (rxFrontend_preamble_io_output_payload_last            ), //i
    .io_input_payload_fragment     (rxFrontend_preamble_io_output_payload_fragment[31:0]  ), //i
    .io_output_valid               (rxFrontend_checker_io_output_valid                    ), //o
    .io_output_ready               (rxFrontend_buffer_io_push_stream_ready                ), //i
    .io_output_payload_last        (rxFrontend_checker_io_output_payload_last             ), //o
    .io_output_payload_fragment    (rxFrontend_checker_io_output_payload_fragment[31:0]   ), //o
    .io_error                      (rxFrontend_checker_io_error                           ), //o
    .gtxuser_clk                   (gtxuser_clk                                           ), //i
    .rxReset                       (rxReset                                               )  //i
  );
  Rx_Buffer_Adapt rxFrontend_buffer (
    .io_push_stream_valid               (rxFrontend_checker_io_output_valid                   ), //i
    .io_push_stream_ready               (rxFrontend_buffer_io_push_stream_ready               ), //o
    .io_push_stream_payload_last        (rxFrontend_checker_io_output_payload_last            ), //i
    .io_push_stream_payload_fragment    (rxFrontend_checker_io_output_payload_fragment[31:0]  ), //i
    .io_pop_stream_valid                (rxFrontend_buffer_io_pop_stream_valid                ), //o
    .io_pop_stream_ready                (rxFrontend_buffer_CC_io_push_ready                   ), //i
    .io_pop_stream_payload              (rxFrontend_buffer_io_pop_stream_payload[15:0]        ), //o
    .gtxuser_clk                        (gtxuser_clk                                          ), //i
    .rxReset                            (rxReset                                              )  //i
  );
  StreamFifoCC_1 rxFrontend_buffer_CC (
    .io_push_valid       (rxFrontend_buffer_io_pop_stream_valid          ), //i
    .io_push_ready       (rxFrontend_buffer_CC_io_push_ready             ), //o
    .io_push_payload     (rxFrontend_buffer_io_pop_stream_payload[15:0]  ), //i
    .io_pop_valid        (rxFrontend_buffer_CC_io_pop_valid              ), //o
    .io_pop_ready        (axictrl_rx_stream_ready                        ), //i
    .io_pop_payload      (rxFrontend_buffer_CC_io_pop_payload[15:0]      ), //o
    .io_pushOccupancy    (rxFrontend_buffer_CC_io_pushOccupancy[8:0]     ), //o
    .io_popOccupancy     (rxFrontend_buffer_CC_io_popOccupancy[8:0]      ), //o
    .gtxuser_clk         (gtxuser_clk                                    ), //i
    .rxReset             (rxReset                                        ), //i
    .clk                 (clk                                            ), //i
    .reset               (reset                                          ), //i
    .axictrl_rx_flush    (axictrl_rx_flush                               )  //i
  );
  assign _zz_1 = (reset || axictrl_rx_flush);
  assign rxReset = bufferCC_14_io_dataOut;
  assign _zz_2 = (reset || axictrl_tx_flush);
  assign txReset = bufferCC_15_io_dataOut;
  assign axictrl_tx_stream_ready = txFrontend_stream_adapt_push_stream_ready;
  assign axiw_valid = txBackend_header_output_valid;
  assign axiw_payload_last = txBackend_header_output_payload_last;
  assign axiw_payload_fragment = txBackend_header_output_payload_fragment;
  assign txBackend_header_output_fire = (txBackend_header_output_valid && axiw_ready);
  assign axir_ready = rxFrontend_preamble_io_input_ready;
  assign axictrl_rx_stream_valid = rxFrontend_buffer_CC_io_pop_valid;
  assign axictrl_rx_stream_payload = rxFrontend_buffer_CC_io_pop_payload;
  assign axictrl_rx_popOccupancy = rxFrontend_buffer_CC_io_popOccupancy;
  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      _zz_io_pop_commit <= 1'b0;
    end else begin
      _zz_io_pop_commit <= (txBackend_header_output_fire && txBackend_header_output_payload_last);
    end
  end


endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_full,
  output     [15:0]   io_value,
  input               clk,
  input               reset
);

  wire       [15:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {15'd0, _zz_counter_1};
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
      counter <= 16'h0;
    end
  end


endmodule

module StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [15:0]   io_pop_payload,
  output     [8:0]    io_pushOccupancy,
  output     [8:0]    io_popOccupancy,
  input               gtxuser_clk,
  input               rxReset,
  input               clk,
  input               reset,
  input               axictrl_rx_flush
);

  reg        [15:0]   _zz_ram_port1;
  wire       [8:0]    popToPushGray_buffercc_io_dataOut;
  wire       [8:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [8:0]    _zz_pushCC_pushPtrGray;
  wire       [7:0]    _zz_ram_port;
  wire       [8:0]    _zz_popCC_popPtrGray;
  wire       [7:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [7:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [8:0]    popToPushGray;
  wire       [8:0]    pushToPopGray;
  reg        [8:0]    pushCC_pushPtr;
  wire       [8:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [8:0]    pushCC_pushPtrGray;
  wire       [8:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  wire                _zz_io_pushOccupancy_7;
  reg        [8:0]    popCC_popPtr;
  wire       [8:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [8:0]    popCC_popPtrGray;
  wire       [8:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [8:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  wire                _zz_io_popOccupancy_7;
  reg [15:0] ram [0:255];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[7:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[7:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge gtxuser_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_10 popToPushGray_buffercc (
    .io_dataIn      (popToPushGray[8:0]                      ), //i
    .io_dataOut     (popToPushGray_buffercc_io_dataOut[8:0]  ), //o
    .gtxuser_clk    (gtxuser_clk                             ), //i
    .rxReset        (rxReset                                 )  //i
  );
  BufferCC_11 pushToPopGray_buffercc (
    .io_dataIn           (pushToPopGray[8:0]                      ), //i
    .io_dataOut          (pushToPopGray_buffercc_io_dataOut[8:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   ), //i
    .axictrl_rx_flush    (axictrl_rx_flush                        )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 9'h001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[8 : 7] == (~ pushCC_popPtrGray[8 : 7])) && (pushCC_pushPtrGray[6 : 0] == pushCC_popPtrGray[6 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = (pushCC_popPtrGray[7] ^ _zz_io_pushOccupancy_7);
  assign _zz_io_pushOccupancy_7 = pushCC_popPtrGray[8];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_7,{_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 9'h001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = (popCC_pushPtrGray[6] ^ _zz_io_popOccupancy_6);
  assign _zz_io_popOccupancy_6 = (popCC_pushPtrGray[7] ^ _zz_io_popOccupancy_7);
  assign _zz_io_popOccupancy_7 = popCC_pushPtrGray[8];
  assign io_popOccupancy = ({_zz_io_popOccupancy_7,{_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      pushCC_pushPtr <= 9'h0;
      pushCC_pushPtrGray <= 9'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      popCC_popPtr <= 9'h0;
      popCC_popPtrGray <= 9'h0;
    end else begin
      if(axictrl_rx_flush) begin
      popCC_popPtr <= 9'h0;
      popCC_popPtrGray <= 9'h0;
      end else begin
        if(io_pop_fire) begin
          popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
        end
        if(io_pop_fire_2) begin
          popCC_popPtr <= popCC_popPtrPlus;
        end
      end
    end
  end


endmodule

module Rx_Buffer_Adapt (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input               io_push_stream_payload_last,
  input      [31:0]   io_push_stream_payload_fragment,
  output reg          io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [15:0]   io_pop_stream_payload,
  input               gtxuser_clk,
  input               rxReset
);

  reg                 fifo_io_pop_stream_ready;
  wire                fifo_io_push_stream_ready;
  wire       [6:0]    fifo_io_push_availability;
  wire                fifo_io_pop_stream_valid;
  wire       [31:0]   fifo_io_pop_stream_payload;
  reg        [15:0]   _zz_io_pop_stream_payload;
  reg                 push_commit;
  reg        [0:0]    pop_spliter;
  wire                when_Rx_Crc_l272;

  MacTxManagedStreamFifoCc_1 fifo (
    .io_push_stream_valid      (io_push_stream_valid                   ), //i
    .io_push_stream_ready      (fifo_io_push_stream_ready              ), //o
    .io_push_stream_payload    (io_push_stream_payload_fragment[31:0]  ), //i
    .io_push_commit            (push_commit                            ), //i
    .io_push_availability      (fifo_io_push_availability[6:0]         ), //o
    .io_pop_stream_valid       (fifo_io_pop_stream_valid               ), //o
    .io_pop_stream_ready       (fifo_io_pop_stream_ready               ), //i
    .io_pop_stream_payload     (fifo_io_pop_stream_payload[31:0]       ), //o
    .io_pop_redo               (1'b0                                   ), //i
    .io_pop_commit             (1'b0                                   ), //i
    .gtxuser_clk               (gtxuser_clk                            ), //i
    .rxReset                   (rxReset                                )  //i
  );
  always @(*) begin
    case(pop_spliter)
      1'b0 : begin
        _zz_io_pop_stream_payload = fifo_io_pop_stream_payload[15 : 0];
      end
      default : begin
        _zz_io_pop_stream_payload = fifo_io_pop_stream_payload[31 : 16];
      end
    endcase
  end

  assign io_push_stream_ready = fifo_io_push_stream_ready;
  always @(*) begin
    fifo_io_pop_stream_ready = 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        if(io_pop_stream_ready) begin
          if(when_Rx_Crc_l272) begin
            fifo_io_pop_stream_ready = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    io_pop_stream_valid = 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        io_pop_stream_valid = 1'b1;
      end
    end
  end

  assign io_pop_stream_payload = _zz_io_pop_stream_payload;
  assign when_Rx_Crc_l272 = (pop_spliter == 1'b1);
  always @(posedge gtxuser_clk) begin
    push_commit <= 1'b0;
    if(io_push_stream_payload_last) begin
      push_commit <= 1'b1;
    end
    pop_spliter <= 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        if(io_pop_stream_ready) begin
          pop_spliter <= (pop_spliter + 1'b1);
        end
      end
    end
  end


endmodule

module Rx_Checker (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  output              io_error,
  input               gtxuser_clk,
  input               rxReset
);

  wire                crc_2_flush;
  wire       [31:0]   crc_2_result;
  wire                io_output_fire;

  Crc_1 crc_2 (
    .flush            (crc_2_flush                      ), //i
    .input_valid      (io_input_valid                   ), //i
    .input_payload    (io_input_payload_fragment[31:0]  ), //i
    .result           (crc_2_result[31:0]               ), //o
    .gtxuser_clk      (gtxuser_clk                      ), //i
    .rxReset          (rxReset                          )  //i
  );
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign crc_2_flush = (io_output_fire && io_output_payload_last);
  assign io_output_valid = io_input_valid;
  assign io_output_payload_last = io_input_payload_last;
  assign io_output_payload_fragment = io_input_payload_fragment;
  assign io_input_ready = io_output_ready;
  assign io_error = (io_input_payload_last && (crc_2_result != io_input_payload_fragment));

endmodule

module Rx_Preamble (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output reg          io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  input               gtxuser_clk,
  input               rxReset
);

  wire       [63:0]   startDelimiter;
  wire                io_input_fire;
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
  wire                when_Rx_Crc_l27;
  wire                when_Rx_Crc_l34;

  assign startDelimiter = 64'h000000120000ffbc;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign _zz_history_0_valid = io_input_valid;
  assign _zz_history_0_ready = io_input_ready;
  assign _zz_history_0_payload_last = io_input_payload_last;
  assign _zz_history_0_payload_fragment = io_input_payload_fragment;
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
    io_output_valid = 1'b0;
    if(!when_Rx_Crc_l27) begin
      if(io_input_valid) begin
        io_output_valid = 1'b1;
      end
    end
  end

  assign io_output_payload_fragment = io_input_payload_fragment;
  assign io_input_ready = ((! inFrame) || io_output_ready);
  assign io_output_payload_last = io_input_payload_last;
  assign when_Rx_Crc_l27 = (! inFrame);
  assign when_Rx_Crc_l34 = (io_output_ready && io_input_payload_last);
  always @(posedge gtxuser_clk) begin
    if(io_input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_Rx_Crc_l27) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(io_input_valid) begin
          if(when_Rx_Crc_l34) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule

module Tx_Header (
  input               input_valid,
  output reg          input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               gtxuser_clk,
  input               txReset
);

  reg        [31:0]   _zz_output_payload_fragment;
  wire       [0:0]    _zz_output_payload_fragment_1;
  wire       [63:0]   header;
  reg        [1:0]    state;
  wire                when_Tx_Crc_l183;
  wire                output_fire;
  wire                input_fire;
  wire                when_Tx_Crc_l192;

  assign _zz_output_payload_fragment_1 = state[0:0];
  always @(*) begin
    case(_zz_output_payload_fragment_1)
      1'b0 : begin
        _zz_output_payload_fragment = header[63 : 32];
      end
      default : begin
        _zz_output_payload_fragment = header[31 : 0];
      end
    endcase
  end

  assign header = 64'h0000ffbc00000012;
  assign output_valid = input_valid;
  always @(*) begin
    output_payload_last = 1'b0;
    if(when_Tx_Crc_l183) begin
      output_payload_last = input_payload_last;
    end
  end

  always @(*) begin
    input_ready = 1'b0;
    if(when_Tx_Crc_l183) begin
      input_ready = output_ready;
    end
  end

  assign when_Tx_Crc_l183 = (state == 2'b10);
  always @(*) begin
    if(when_Tx_Crc_l183) begin
      output_payload_fragment = input_payload_fragment;
    end else begin
      output_payload_fragment = _zz_output_payload_fragment;
    end
  end

  assign output_fire = (output_valid && output_ready);
  assign input_fire = (input_valid && input_ready);
  assign when_Tx_Crc_l192 = (input_fire && input_payload_last);
  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      state <= 2'b00;
    end else begin
      if(!when_Tx_Crc_l183) begin
        if(output_fire) begin
          state <= (state + 2'b01);
        end
      end
      if(when_Tx_Crc_l192) begin
        state <= 2'b00;
      end
    end
  end


endmodule

module Tx_Crc (
  input               input_valid,
  output reg          input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output reg          output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               gtxuser_clk,
  input               txReset
);

  wire                crc_2_flush;
  wire       [31:0]   crc_2_result;
  reg                 emitCrc;
  wire                input_fire;
  wire                when_Tx_Crc_l151;
  wire                output_fire;
  wire                when_Tx_Crc_l151_1;
  wire                input_fire_1;
  wire                output_fire_1;
  wire                when_Tx_Crc_l157;

  Crc crc_2 (
    .flush            (crc_2_flush                   ), //i
    .input_valid      (input_fire_1                  ), //i
    .input_payload    (input_payload_fragment[31:0]  ), //i
    .result           (crc_2_result[31:0]            ), //o
    .gtxuser_clk      (gtxuser_clk                   ), //i
    .txReset          (txReset                       )  //i
  );
  assign input_fire = (input_valid && input_ready);
  assign when_Tx_Crc_l151 = (input_fire && input_payload_last);
  assign output_fire = (output_valid && output_ready);
  assign when_Tx_Crc_l151_1 = (output_fire && output_payload_last);
  assign input_fire_1 = (input_valid && input_ready);
  assign output_fire_1 = (output_valid && output_ready);
  assign crc_2_flush = (output_fire_1 && output_payload_last);
  always @(*) begin
    output_payload_last = 1'b0;
    if(!when_Tx_Crc_l157) begin
      output_payload_last = 1'b1;
    end
  end

  assign when_Tx_Crc_l157 = (! emitCrc);
  always @(*) begin
    if(when_Tx_Crc_l157) begin
      output_valid = input_valid;
    end else begin
      output_valid = 1'b1;
    end
  end

  always @(*) begin
    if(when_Tx_Crc_l157) begin
      output_payload_fragment = input_payload_fragment;
    end else begin
      output_payload_fragment = crc_2_result;
    end
  end

  always @(*) begin
    if(when_Tx_Crc_l157) begin
      input_ready = output_ready;
    end else begin
      input_ready = 1'b0;
    end
  end

  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      emitCrc <= 1'b0;
    end else begin
      if(when_Tx_Crc_l151) begin
        emitCrc <= 1'b1;
      end
      if(when_Tx_Crc_l151_1) begin
        emitCrc <= 1'b0;
      end
      if(!when_Tx_Crc_l157) begin
        emitCrc <= 1'b0;
      end
    end
  end


endmodule

module Tx_Buffer (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  output     [6:0]    io_push_availability,
  output reg          io_pop_stream_valid,
  input               io_pop_stream_ready,
  output reg          io_pop_stream_payload_last,
  output     [31:0]   io_pop_stream_payload_fragment,
  input               io_pop_redo,
  input               io_pop_commit,
  input               clk,
  input               reset,
  input               axictrl_tx_flush,
  input               gtxuser_clk,
  input               txReset
);
  localparam push_State_LENGTH = 1'd0;
  localparam push_State_DATA = 1'd1;
  localparam pop_State_LENGTH = 2'd0;
  localparam pop_State_DATA = 2'd1;
  localparam pop_State_WAIT_1 = 2'd2;

  reg                 fifo_io_pop_stream_ready;
  wire                fifo_io_push_stream_ready;
  wire       [6:0]    fifo_io_push_availability;
  wire                fifo_io_pop_stream_valid;
  wire       [31:0]   fifo_io_pop_stream_payload;
  wire       [10:0]   _zz_push_wordCountMinusOne;
  wire       [31:0]   _zz_push_length;
  wire       [31:0]   _zz_pop_length;
  reg                 push_commit;
  reg        [0:0]    push_state_1;
  reg        [10:0]   push_length;
  wire       [5:0]    push_wordCountMinusOne;
  reg        [5:0]    push_wordCounter;
  wire                fifo_io_push_stream_fire;
  wire                io_push_stream_fire;
  wire                when_Tx_Crc_l66;
  reg        [1:0]    pop_state_1;
  reg        [10:0]   pop_length;
  wire       [10:0]   pop_lengthMinusOne;
  reg        [5:0]    pop_wordCounter;
  wire       [5:0]    pop_wordCountEndAt;
  wire                when_Tx_Crc_l105;
  `ifndef SYNTHESIS
  reg [47:0] push_state_1_string;
  reg [47:0] pop_state_1_string;
  `endif


  assign _zz_push_wordCountMinusOne = (push_length - 11'h001);
  assign _zz_push_length = io_push_stream_payload;
  assign _zz_pop_length = fifo_io_pop_stream_payload;
  MacTxManagedStreamFifoCc fifo (
    .io_push_stream_valid      (io_push_stream_valid              ), //i
    .io_push_stream_ready      (fifo_io_push_stream_ready         ), //o
    .io_push_stream_payload    (io_push_stream_payload[31:0]      ), //i
    .io_push_commit            (push_commit                       ), //i
    .io_push_availability      (fifo_io_push_availability[6:0]    ), //o
    .io_pop_stream_valid       (fifo_io_pop_stream_valid          ), //o
    .io_pop_stream_ready       (fifo_io_pop_stream_ready          ), //i
    .io_pop_stream_payload     (fifo_io_pop_stream_payload[31:0]  ), //o
    .io_pop_redo               (io_pop_redo                       ), //i
    .io_pop_commit             (io_pop_commit                     ), //i
    .clk                       (clk                               ), //i
    .reset                     (reset                             ), //i
    .axictrl_tx_flush          (axictrl_tx_flush                  ), //i
    .gtxuser_clk               (gtxuser_clk                       ), //i
    .txReset                   (txReset                           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(push_state_1)
      push_State_LENGTH : push_state_1_string = "LENGTH";
      push_State_DATA : push_state_1_string = "DATA  ";
      default : push_state_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(pop_state_1)
      pop_State_LENGTH : pop_state_1_string = "LENGTH";
      pop_State_DATA : pop_state_1_string = "DATA  ";
      pop_State_WAIT_1 : pop_state_1_string = "WAIT_1";
      default : pop_state_1_string = "??????";
    endcase
  end
  `endif

  assign io_push_availability = fifo_io_push_availability;
  assign io_push_stream_ready = fifo_io_push_stream_ready;
  assign push_wordCountMinusOne = (_zz_push_wordCountMinusOne >>> 5);
  assign fifo_io_push_stream_fire = (io_push_stream_valid && fifo_io_push_stream_ready);
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign when_Tx_Crc_l66 = (push_wordCounter == push_wordCountMinusOne);
  assign pop_lengthMinusOne = (pop_length - 11'h001);
  assign pop_wordCountEndAt = (pop_lengthMinusOne >>> 5);
  always @(*) begin
    fifo_io_pop_stream_ready = 1'b0;
    case(pop_state_1)
      pop_State_LENGTH : begin
        if(fifo_io_pop_stream_valid) begin
          fifo_io_pop_stream_ready = 1'b1;
        end
      end
      pop_State_DATA : begin
        if(io_pop_stream_ready) begin
          fifo_io_pop_stream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_pop_stream_valid = 1'b0;
    case(pop_state_1)
      pop_State_LENGTH : begin
      end
      pop_State_DATA : begin
        io_pop_stream_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_pop_stream_payload_last = 1'b0;
    case(pop_state_1)
      pop_State_LENGTH : begin
      end
      pop_State_DATA : begin
        if(io_pop_stream_ready) begin
          if(when_Tx_Crc_l105) begin
            io_pop_stream_payload_last = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign io_pop_stream_payload_fragment = fifo_io_pop_stream_payload;
  assign when_Tx_Crc_l105 = (pop_wordCounter == pop_wordCountEndAt);
  always @(posedge clk) begin
    push_commit <= 1'b0;
    case(push_state_1)
      push_State_LENGTH : begin
        push_wordCounter <= 6'h0;
        if(fifo_io_push_stream_fire) begin
          push_length <= _zz_push_length[10:0];
        end
      end
      default : begin
        if(io_push_stream_fire) begin
          push_wordCounter <= (push_wordCounter + 6'h01);
          if(when_Tx_Crc_l66) begin
            push_commit <= 1'b1;
          end
        end
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      push_state_1 <= push_State_LENGTH;
    end else begin
      if(axictrl_tx_flush) begin
      push_state_1 <= push_State_LENGTH;
      end else begin
        case(push_state_1)
          push_State_LENGTH : begin
            if(fifo_io_push_stream_fire) begin
              push_state_1 <= push_State_DATA;
            end
          end
          default : begin
            if(io_push_stream_fire) begin
              if(when_Tx_Crc_l66) begin
                push_state_1 <= push_State_LENGTH;
              end
            end
          end
        endcase
      end
    end
  end

  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      pop_state_1 <= pop_State_LENGTH;
    end else begin
      case(pop_state_1)
        pop_State_LENGTH : begin
          if(fifo_io_pop_stream_valid) begin
            pop_state_1 <= pop_State_DATA;
          end
        end
        pop_State_DATA : begin
          if(io_pop_stream_ready) begin
            if(when_Tx_Crc_l105) begin
              pop_state_1 <= pop_State_WAIT_1;
            end
          end
        end
        default : begin
          if(io_pop_commit) begin
            pop_state_1 <= pop_State_LENGTH;
          end
        end
      endcase
      if(io_pop_redo) begin
        pop_state_1 <= pop_State_LENGTH;
      end
    end
  end

  always @(posedge gtxuser_clk) begin
    case(pop_state_1)
      pop_State_LENGTH : begin
        pop_wordCounter <= 6'h0;
        if(fifo_io_pop_stream_valid) begin
          pop_length <= _zz_pop_length[10:0];
        end
      end
      pop_State_DATA : begin
        if(io_pop_stream_ready) begin
          pop_wordCounter <= (pop_wordCounter + 6'h01);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Tx_Buffer_Adapt (
  input               push_stream_valid,
  output              push_stream_ready,
  input      [15:0]   push_stream_payload,
  output              pop_stream_valid,
  input               pop_stream_ready,
  output     [31:0]   pop_stream_payload,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);

  wire                area_fifo_io_push_valid;
  wire       [31:0]   area_fifo_io_push_payload;
  wire                area_fifo_io_push_ready;
  wire                area_fifo_io_pop_valid;
  wire       [31:0]   area_fifo_io_pop_payload;
  wire       [6:0]    area_fifo_io_pushOccupancy;
  wire       [6:0]    area_fifo_io_popOccupancy;
  wire                push_stream_fire;
  reg                 _zz_push_stream_ready;
  reg        [0:0]    _zz_push_stream_ready_1;
  reg        [0:0]    _zz_push_stream_ready_2;
  wire                _zz_push_stream_ready_3;
  reg        [15:0]   _zz_io_push_payload;
  wire                push_stream_fire_1;

  StreamFifoCC area_fifo (
    .io_push_valid       (area_fifo_io_push_valid          ), //i
    .io_push_ready       (area_fifo_io_push_ready          ), //o
    .io_push_payload     (area_fifo_io_push_payload[31:0]  ), //i
    .io_pop_valid        (area_fifo_io_pop_valid           ), //o
    .io_pop_ready        (pop_stream_ready                 ), //i
    .io_pop_payload      (area_fifo_io_pop_payload[31:0]   ), //o
    .io_pushOccupancy    (area_fifo_io_pushOccupancy[6:0]  ), //o
    .io_popOccupancy     (area_fifo_io_popOccupancy[6:0]   ), //o
    .clk                 (clk                              ), //i
    .reset               (reset                            ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                 )  //i
  );
  assign push_stream_fire = (push_stream_valid && push_stream_ready);
  always @(*) begin
    _zz_push_stream_ready = 1'b0;
    if(push_stream_fire) begin
      _zz_push_stream_ready = 1'b1;
    end
  end

  assign _zz_push_stream_ready_3 = (_zz_push_stream_ready_2 == 1'b1);
  always @(*) begin
    _zz_push_stream_ready_1 = (_zz_push_stream_ready_2 + _zz_push_stream_ready);
    if(1'b0) begin
      _zz_push_stream_ready_1 = 1'b0;
    end
  end

  assign push_stream_fire_1 = (push_stream_valid && push_stream_ready);
  assign area_fifo_io_push_valid = (push_stream_valid && _zz_push_stream_ready_3);
  assign area_fifo_io_push_payload = {push_stream_payload,_zz_io_push_payload};
  assign push_stream_ready = (! ((! area_fifo_io_push_ready) && _zz_push_stream_ready_3));
  assign pop_stream_valid = area_fifo_io_pop_valid;
  assign pop_stream_payload = area_fifo_io_pop_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_push_stream_ready_2 <= 1'b0;
    end else begin
      if(axictrl_tx_flush) begin
      _zz_push_stream_ready_2 <= 1'b0;
      end else begin
        _zz_push_stream_ready_2 <= _zz_push_stream_ready_1;
      end
    end
  end

  always @(posedge clk) begin
    if(push_stream_fire_1) begin
      _zz_io_push_payload <= push_stream_payload;
    end
  end


endmodule

//BufferCC_12 replaced by BufferCC_12

module BufferCC_12 (
  input               io_dataIn,
  output              io_dataOut,
  input               gtxuser_clk,
  input               _zz_1
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge gtxuser_clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_11 (
  input      [8:0]    io_dataIn,
  output     [8:0]    io_dataOut,
  input               clk,
  input               reset,
  input               axictrl_rx_flush
);

  (* async_reg = "true" *) reg        [8:0]    buffers_0;
  (* async_reg = "true" *) reg        [8:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 9'h0;
      buffers_1 <= 9'h0;
    end else begin
      if(axictrl_rx_flush) begin
      buffers_0 <= 9'h0;
      buffers_1 <= 9'h0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule

module BufferCC_10 (
  input      [8:0]    io_dataIn,
  output     [8:0]    io_dataOut,
  input               gtxuser_clk,
  input               rxReset
);

  (* async_reg = "true" *) reg        [8:0]    buffers_0;
  (* async_reg = "true" *) reg        [8:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      buffers_0 <= 9'h0;
      buffers_1 <= 9'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module MacTxManagedStreamFifoCc_1 (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  input               io_push_commit,
  output     [6:0]    io_push_availability,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  input               io_pop_redo,
  input               io_pop_commit,
  input               gtxuser_clk,
  input               rxReset
);

  reg        [31:0]   _zz_ram_port1;
  wire                popToPush_io_input_ready;
  wire                popToPush_io_output_valid;
  wire       [6:0]    popToPush_io_output_payload;
  wire                pushToPop_io_input_ready;
  wire                pushToPop_io_output_valid;
  wire       [6:0]    pushToPop_io_output_payload;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_io_push_availability;
  reg                 _zz_1;
  reg        [6:0]    push_currentPtr;
  reg        [6:0]    push_oldPtr;
  reg        [6:0]    push_popPtr;
  wire                io_push_stream_fire;
  reg        [6:0]    pop_currentPtr;
  reg        [6:0]    pop_oldPtr;
  reg        [6:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [5:0]    pop_cmd_payload;
  wire                io_pop_stream_fire;
  reg        [6:0]    pop_commitPtr;
  wire                _zz_io_pop_stream_valid;
  reg                 _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  reg                 _zz_io_pop_stream_valid_2;
  wire                pop_cmd_fire;
  reg [31:0] ram [0:63];

  assign _zz_ram_port = push_currentPtr[5:0];
  assign _zz_io_push_availability = (push_currentPtr - push_popPtr);
  always @(posedge gtxuser_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_stream_payload;
    end
  end

  always @(posedge gtxuser_clk) begin
    if(pop_cmd_ready) begin
      _zz_ram_port1 <= ram[pop_cmd_payload];
    end
  end

  StreamCCByToggle_2 popToPush (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (popToPush_io_input_ready          ), //o
    .io_input_payload     (pop_oldPtr[6:0]                   ), //i
    .io_output_valid      (popToPush_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (popToPush_io_output_payload[6:0]  ), //o
    .gtxuser_clk          (gtxuser_clk                       ), //i
    .rxReset              (rxReset                           )  //i
  );
  StreamCCByToggle_2 pushToPop (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (pushToPop_io_input_ready          ), //o
    .io_input_payload     (push_oldPtr[6:0]                  ), //i
    .io_output_valid      (pushToPop_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (pushToPop_io_output_payload[6:0]  ), //o
    .gtxuser_clk          (gtxuser_clk                       ), //i
    .rxReset              (rxReset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_stream_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign io_push_stream_ready = (! ((push_currentPtr[6] != push_popPtr[6]) && (push_currentPtr[5 : 0] == push_popPtr[5 : 0])));
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign io_push_availability = (7'h40 - _zz_io_push_availability);
  assign pop_cmd_valid = ((! (pop_currentPtr == pop_pushPtr)) && (! io_pop_redo));
  assign pop_cmd_payload = pop_currentPtr[5:0];
  assign io_pop_stream_fire = (io_pop_stream_valid && io_pop_stream_ready);
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  always @(*) begin
    _zz_io_pop_stream_valid_2 = _zz_io_pop_stream_valid;
    if(io_pop_redo) begin
      _zz_io_pop_stream_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    _zz_pop_cmd_ready = io_pop_stream_ready;
    if(io_pop_redo) begin
      _zz_pop_cmd_ready = 1'b1;
    end
  end

  assign io_pop_stream_valid = _zz_io_pop_stream_valid_2;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      push_currentPtr <= 7'h0;
      push_oldPtr <= 7'h0;
      push_popPtr <= 7'h0;
      pop_currentPtr <= 7'h0;
      pop_oldPtr <= 7'h0;
      pop_pushPtr <= 7'h0;
      _zz_io_pop_stream_valid_1 <= 1'b0;
    end else begin
      if(popToPush_io_output_valid) begin
        push_popPtr <= popToPush_io_output_payload;
      end
      if(io_push_stream_fire) begin
        push_currentPtr <= (push_currentPtr + 7'h01);
      end
      if(io_push_commit) begin
        push_oldPtr <= push_currentPtr;
      end
      if(pushToPop_io_output_valid) begin
        pop_pushPtr <= pushToPop_io_output_payload;
      end
      if(_zz_pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= 1'b0;
      end
      if(pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= pop_cmd_valid;
      end
      if(pop_cmd_fire) begin
        pop_currentPtr <= (pop_currentPtr + 7'h01);
      end
      if(io_pop_redo) begin
        pop_currentPtr <= pop_oldPtr;
      end
      if(io_pop_commit) begin
        pop_oldPtr <= pop_commitPtr;
      end
    end
  end

  always @(posedge gtxuser_clk) begin
    if(io_pop_stream_fire) begin
      pop_commitPtr <= pop_currentPtr;
    end
  end


endmodule

module Crc_1 (
  input               flush,
  input               input_valid,
  input      [31:0]   input_payload,
  output     [31:0]   result,
  input               gtxuser_clk,
  input               rxReset
);

  wire       [31:0]   crc32_2_crc_o;
  reg        [31:0]   crc_data;

  Crc32 crc32_2 (
    .crc_i     (crc_data[31:0]       ), //i
    .data_i    (input_payload[31:0]  ), //i
    .crc_o     (crc32_2_crc_o[31:0]  )  //o
  );
  assign result = crc_data;
  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      crc_data <= 32'hffffffff;
    end else begin
      if(input_valid) begin
        crc_data <= crc32_2_crc_o;
      end
      if(flush) begin
        crc_data <= 32'hffffffff;
      end
    end
  end


endmodule

module Crc (
  input               flush,
  input               input_valid,
  input      [31:0]   input_payload,
  output     [31:0]   result,
  input               gtxuser_clk,
  input               txReset
);

  wire       [31:0]   crc32_2_crc_o;
  reg        [31:0]   crc_data;

  Crc32 crc32_2 (
    .crc_i     (crc_data[31:0]       ), //i
    .data_i    (input_payload[31:0]  ), //i
    .crc_o     (crc32_2_crc_o[31:0]  )  //o
  );
  assign result = crc_data;
  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      crc_data <= 32'hffffffff;
    end else begin
      if(input_valid) begin
        crc_data <= crc32_2_crc_o;
      end
      if(flush) begin
        crc_data <= 32'hffffffff;
      end
    end
  end


endmodule

module MacTxManagedStreamFifoCc (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  input               io_push_commit,
  output     [6:0]    io_push_availability,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  input               io_pop_redo,
  input               io_pop_commit,
  input               clk,
  input               reset,
  input               axictrl_tx_flush,
  input               gtxuser_clk,
  input               txReset
);

  reg        [31:0]   _zz_ram_port1;
  wire                popToPush_io_input_ready;
  wire                popToPush_io_output_valid;
  wire       [6:0]    popToPush_io_output_payload;
  wire                pushToPop_io_input_ready;
  wire                pushToPop_io_output_valid;
  wire       [6:0]    pushToPop_io_output_payload;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_io_push_availability;
  reg                 _zz_1;
  reg        [6:0]    push_currentPtr;
  reg        [6:0]    push_oldPtr;
  reg        [6:0]    push_popPtr;
  wire                io_push_stream_fire;
  reg        [6:0]    pop_currentPtr;
  reg        [6:0]    pop_oldPtr;
  reg        [6:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [5:0]    pop_cmd_payload;
  wire                io_pop_stream_fire;
  reg        [6:0]    pop_commitPtr;
  wire                _zz_io_pop_stream_valid;
  reg                 _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  reg                 _zz_io_pop_stream_valid_2;
  wire                pop_cmd_fire;
  reg [31:0] ram [0:63];

  assign _zz_ram_port = push_currentPtr[5:0];
  assign _zz_io_push_availability = (push_currentPtr - push_popPtr);
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_stream_payload;
    end
  end

  always @(posedge gtxuser_clk) begin
    if(pop_cmd_ready) begin
      _zz_ram_port1 <= ram[pop_cmd_payload];
    end
  end

  StreamCCByToggle popToPush (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (popToPush_io_input_ready          ), //o
    .io_input_payload     (pop_oldPtr[6:0]                   ), //i
    .io_output_valid      (popToPush_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (popToPush_io_output_payload[6:0]  ), //o
    .gtxuser_clk          (gtxuser_clk                       ), //i
    .txReset              (txReset                           ), //i
    .clk                  (clk                               ), //i
    .reset                (reset                             ), //i
    .axictrl_tx_flush     (axictrl_tx_flush                  )  //i
  );
  StreamCCByToggle_1 pushToPop (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (pushToPop_io_input_ready          ), //o
    .io_input_payload     (push_oldPtr[6:0]                  ), //i
    .io_output_valid      (pushToPop_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (pushToPop_io_output_payload[6:0]  ), //o
    .clk                  (clk                               ), //i
    .reset                (reset                             ), //i
    .axictrl_tx_flush     (axictrl_tx_flush                  ), //i
    .gtxuser_clk          (gtxuser_clk                       ), //i
    .txReset              (txReset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_stream_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign io_push_stream_ready = (! ((push_currentPtr[6] != push_popPtr[6]) && (push_currentPtr[5 : 0] == push_popPtr[5 : 0])));
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign io_push_availability = (7'h40 - _zz_io_push_availability);
  assign pop_cmd_valid = ((! (pop_currentPtr == pop_pushPtr)) && (! io_pop_redo));
  assign pop_cmd_payload = pop_currentPtr[5:0];
  assign io_pop_stream_fire = (io_pop_stream_valid && io_pop_stream_ready);
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  always @(*) begin
    _zz_io_pop_stream_valid_2 = _zz_io_pop_stream_valid;
    if(io_pop_redo) begin
      _zz_io_pop_stream_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    _zz_pop_cmd_ready = io_pop_stream_ready;
    if(io_pop_redo) begin
      _zz_pop_cmd_ready = 1'b1;
    end
  end

  assign io_pop_stream_valid = _zz_io_pop_stream_valid_2;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      push_currentPtr <= 7'h0;
      push_oldPtr <= 7'h0;
      push_popPtr <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      push_currentPtr <= 7'h0;
      push_oldPtr <= 7'h0;
      push_popPtr <= 7'h0;
      end else begin
        if(popToPush_io_output_valid) begin
          push_popPtr <= popToPush_io_output_payload;
        end
        if(io_push_stream_fire) begin
          push_currentPtr <= (push_currentPtr + 7'h01);
        end
        if(io_push_commit) begin
          push_oldPtr <= push_currentPtr;
        end
      end
    end
  end

  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      pop_currentPtr <= 7'h0;
      pop_oldPtr <= 7'h0;
      pop_pushPtr <= 7'h0;
      _zz_io_pop_stream_valid_1 <= 1'b0;
    end else begin
      if(pushToPop_io_output_valid) begin
        pop_pushPtr <= pushToPop_io_output_payload;
      end
      if(_zz_pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= 1'b0;
      end
      if(pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= pop_cmd_valid;
      end
      if(pop_cmd_fire) begin
        pop_currentPtr <= (pop_currentPtr + 7'h01);
      end
      if(io_pop_redo) begin
        pop_currentPtr <= pop_oldPtr;
      end
      if(io_pop_commit) begin
        pop_oldPtr <= pop_commitPtr;
      end
    end
  end

  always @(posedge gtxuser_clk) begin
    if(io_pop_stream_fire) begin
      pop_commitPtr <= pop_currentPtr;
    end
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  output     [6:0]    io_pushOccupancy,
  output     [6:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);

  reg        [31:0]   _zz_ram_port1;
  wire       [6:0]    popToPushGray_buffercc_io_dataOut;
  wire       [6:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [6:0]    _zz_pushCC_pushPtrGray;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_popCC_popPtrGray;
  wire       [5:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [5:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [6:0]    popToPushGray;
  wire       [6:0]    pushToPopGray;
  reg        [6:0]    pushCC_pushPtr;
  wire       [6:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [6:0]    pushCC_pushPtrGray;
  wire       [6:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  reg        [6:0]    popCC_popPtr;
  wire       [6:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [6:0]    popCC_popPtrGray;
  wire       [6:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [6:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  reg [31:0] ram [0:63];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[5:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[5:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_8 popToPushGray_buffercc (
    .io_dataIn           (popToPushGray[6:0]                      ), //i
    .io_dataOut          (popToPushGray_buffercc_io_dataOut[6:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                        )  //i
  );
  BufferCC_8 pushToPopGray_buffercc (
    .io_dataIn           (pushToPopGray[6:0]                      ), //i
    .io_dataOut          (pushToPopGray_buffercc_io_dataOut[6:0]  ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                        )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 7'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[6 : 5] == (~ pushCC_popPtrGray[6 : 5])) && (pushCC_pushPtrGray[4 : 0] == pushCC_popPtrGray[4 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = pushCC_popPtrGray[6];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 7'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = popCC_pushPtrGray[6];
  assign io_popOccupancy = ({_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
      end else begin
        if(io_push_fire) begin
          pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
        end
        if(io_push_fire_1) begin
          pushCC_pushPtr <= pushCC_pushPtrPlus;
        end
        if(io_pop_fire) begin
          popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
        end
        if(io_pop_fire_2) begin
          popCC_popPtr <= popCC_popPtrPlus;
        end
      end
    end
  end


endmodule

//StreamCCByToggle_2 replaced by StreamCCByToggle_2

module StreamCCByToggle_2 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               gtxuser_clk,
  input               rxReset
);

  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC_4 outHitSignal_buffercc (
    .io_dataIn      (outHitSignal                      ), //i
    .io_dataOut     (outHitSignal_buffercc_io_dataOut  ), //o
    .gtxuser_clk    (gtxuser_clk                       ), //i
    .rxReset        (rxReset                           )  //i
  );
  BufferCC_4 pushArea_target_buffercc (
    .io_dataIn      (pushArea_target                      ), //i
    .io_dataOut     (pushArea_target_buffercc_io_dataOut  ), //o
    .gtxuser_clk    (gtxuser_clk                          ), //i
    .rxReset        (rxReset                              )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      pushArea_target <= 1'b0;
      popArea_hit <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

//Crc32 replaced by Crc32

module Crc32 (
  input      [31:0]   crc_i,
  input      [31:0]   data_i,
  output reg [31:0]   crc_o
);

  wire                _zz_crc_o;
  wire                _zz_crc_o_1;
  wire                _zz_crc_o_2;
  wire                _zz_crc_o_3;
  wire                _zz_crc_o_4;
  wire                _zz_crc_o_5;
  wire                _zz_crc_o_6;
  wire                _zz_crc_o_7;
  wire                _zz_crc_o_8;
  wire                _zz_crc_o_9;
  wire                _zz_crc_o_10;
  wire                _zz_crc_o_11;
  wire                _zz_crc_o_12;
  wire                _zz_crc_o_13;
  wire                _zz_crc_o_14;
  wire                _zz_crc_o_15;
  wire                _zz_crc_o_16;
  wire                _zz_crc_o_17;
  wire                _zz_crc_o_18;
  wire                _zz_crc_o_19;
  wire                _zz_crc_o_20;
  wire                _zz_crc_o_21;
  wire                _zz_crc_o_22;
  wire                _zz_crc_o_23;
  wire                _zz_crc_o_24;
  wire                _zz_crc_o_25;
  wire                _zz_crc_o_26;
  wire                _zz_crc_o_27;
  wire                _zz_crc_o_28;
  wire                _zz_crc_o_29;
  wire                _zz_crc_o_30;
  wire                _zz_crc_o_31;
  wire                _zz_crc_o_32;
  wire                _zz_crc_o_33;
  wire                _zz_crc_o_34;
  wire                _zz_crc_o_35;
  wire                _zz_crc_o_36;
  wire                _zz_crc_o_37;
  wire                _zz_crc_o_38;
  wire                _zz_crc_o_39;
  wire                _zz_crc_o_40;
  wire                _zz_crc_o_41;
  wire                _zz_crc_o_42;
  wire                _zz_crc_o_43;
  wire                _zz_crc_o_44;
  wire                _zz_crc_o_45;
  wire                _zz_crc_o_46;
  wire                _zz_crc_o_47;
  wire                _zz_crc_o_48;
  wire                _zz_crc_o_49;
  wire                _zz_crc_o_50;
  wire                _zz_crc_o_51;
  wire                _zz_crc_o_52;
  wire                _zz_crc_o_53;
  wire                _zz_crc_o_54;
  wire                _zz_crc_o_55;
  wire                _zz_crc_o_56;
  wire                _zz_crc_o_57;
  wire                _zz_crc_o_58;
  wire                _zz_crc_o_59;
  wire                _zz_crc_o_60;
  wire                _zz_crc_o_61;
  wire                _zz_crc_o_62;
  wire                _zz_crc_o_63;
  wire                _zz_crc_o_64;
  wire                _zz_crc_o_65;
  wire                _zz_crc_o_66;
  wire                _zz_crc_o_67;
  wire                _zz_crc_o_68;
  wire                _zz_crc_o_69;

  assign _zz_crc_o = (((((((((data_i[31] ^ data_i[30]) ^ data_i[29]) ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[16]) ^ data_i[12]) ^ data_i[10]);
  assign _zz_crc_o_1 = data_i[9];
  assign _zz_crc_o_2 = (((((((((data_i[28] ^ data_i[27]) ^ data_i[24]) ^ data_i[17]) ^ data_i[16]) ^ data_i[13]) ^ data_i[12]) ^ data_i[11]) ^ data_i[9]) ^ data_i[7]);
  assign _zz_crc_o_3 = data_i[6];
  assign _zz_crc_o_4 = (((((((((((((((data_i[31] ^ data_i[30]) ^ data_i[26]) ^ data_i[24]) ^ data_i[18]) ^ data_i[17]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[2]) ^ data_i[1]) ^ data_i[0]);
  assign _zz_crc_o_5 = crc_i[0];
  assign _zz_crc_o_6 = (((((((((((((data_i[31] ^ data_i[27]) ^ data_i[25]) ^ data_i[19]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[14]) ^ data_i[10]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[3]) ^ data_i[2]);
  assign _zz_crc_o_7 = data_i[1];
  assign _zz_crc_o_8 = ((((((((((((((((_zz_crc_o_9 ^ _zz_crc_o_10) ^ data_i[25]) ^ data_i[24]) ^ data_i[20]) ^ data_i[19]) ^ data_i[18]) ^ data_i[15]) ^ data_i[12]) ^ data_i[11]) ^ data_i[8]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]) ^ data_i[2]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_11 = crc_i[2];
  assign _zz_crc_o_9 = (data_i[31] ^ data_i[30]);
  assign _zz_crc_o_10 = data_i[29];
  assign _zz_crc_o_12 = (((((((((((((data_i[29] ^ data_i[28]) ^ data_i[24]) ^ data_i[21]) ^ data_i[20]) ^ data_i[19]) ^ data_i[13]) ^ data_i[10]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[3]) ^ data_i[1]);
  assign _zz_crc_o_13 = data_i[0];
  assign _zz_crc_o_14 = (((((((((((((data_i[30] ^ data_i[29]) ^ data_i[25]) ^ data_i[22]) ^ data_i[21]) ^ data_i[20]) ^ data_i[14]) ^ data_i[11]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[2]);
  assign _zz_crc_o_15 = data_i[1];
  assign _zz_crc_o_16 = (((((((((((((((data_i[29] ^ data_i[28]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[21]) ^ data_i[16]) ^ data_i[15]) ^ data_i[10]) ^ data_i[8]) ^ data_i[7]) ^ data_i[5]) ^ data_i[3]) ^ data_i[2]) ^ data_i[0]);
  assign _zz_crc_o_17 = crc_i[0];
  assign _zz_crc_o_18 = (((((((((data_i[31] ^ data_i[28]) ^ data_i[23]) ^ data_i[22]) ^ data_i[17]) ^ data_i[12]) ^ data_i[11]) ^ data_i[10]) ^ data_i[8]) ^ data_i[4]);
  assign _zz_crc_o_19 = data_i[3];
  assign _zz_crc_o_20 = (((((((data_i[29] ^ data_i[24]) ^ data_i[23]) ^ data_i[18]) ^ data_i[13]) ^ data_i[12]) ^ data_i[11]) ^ data_i[9]);
  assign _zz_crc_o_21 = data_i[5];
  assign _zz_crc_o_22 = (((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[26]) ^ data_i[19]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[5]);
  assign _zz_crc_o_23 = data_i[3];
  assign _zz_crc_o_24 = ((((((((((((((((_zz_crc_o_25 ^ _zz_crc_o_26) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[20]) ^ data_i[17]) ^ data_i[16]) ^ data_i[15]) ^ data_i[14]) ^ data_i[12]) ^ data_i[9]) ^ data_i[4]) ^ data_i[3]) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_27 = crc_i[1];
  assign _zz_crc_o_25 = (data_i[31] ^ data_i[28]);
  assign _zz_crc_o_26 = data_i[27];
  assign _zz_crc_o_28 = ((((((((((((((((_zz_crc_o_29 ^ _zz_crc_o_30) ^ data_i[24]) ^ data_i[21]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[13]) ^ data_i[12]) ^ data_i[9]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[2]) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_31 = crc_i[1];
  assign _zz_crc_o_29 = (data_i[31] ^ data_i[30]);
  assign _zz_crc_o_30 = data_i[27];
  assign _zz_crc_o_32 = (((((((((((((((data_i[31] ^ data_i[28]) ^ data_i[25]) ^ data_i[22]) ^ data_i[19]) ^ data_i[18]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[10]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[3]) ^ data_i[2]) ^ data_i[1]);
  assign _zz_crc_o_33 = crc_i[1];
  assign _zz_crc_o_34 = (((((((((((((data_i[29] ^ data_i[26]) ^ data_i[23]) ^ data_i[20]) ^ data_i[19]) ^ data_i[17]) ^ data_i[15]) ^ data_i[14]) ^ data_i[11]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]);
  assign _zz_crc_o_35 = data_i[2];
  assign _zz_crc_o_36 = (((((((((((((data_i[30] ^ data_i[27]) ^ data_i[24]) ^ data_i[21]) ^ data_i[20]) ^ data_i[18]) ^ data_i[16]) ^ data_i[15]) ^ data_i[12]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[5]) ^ data_i[4]);
  assign _zz_crc_o_37 = data_i[3];
  assign _zz_crc_o_38 = (((((((((((data_i[30] ^ data_i[29]) ^ data_i[26]) ^ data_i[24]) ^ data_i[22]) ^ data_i[21]) ^ data_i[19]) ^ data_i[17]) ^ data_i[13]) ^ data_i[12]) ^ data_i[8]) ^ data_i[5]);
  assign _zz_crc_o_39 = data_i[4];
  assign _zz_crc_o_40 = (((((((((((data_i[31] ^ data_i[30]) ^ data_i[27]) ^ data_i[25]) ^ data_i[23]) ^ data_i[22]) ^ data_i[20]) ^ data_i[18]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[6]);
  assign _zz_crc_o_41 = data_i[5];
  assign _zz_crc_o_42 = (((((((((data_i[31] ^ data_i[28]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[21]) ^ data_i[19]) ^ data_i[15]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_43 = data_i[7];
  assign _zz_crc_o_44 = (((((((data_i[29] ^ data_i[27]) ^ data_i[25]) ^ data_i[24]) ^ data_i[22]) ^ data_i[20]) ^ data_i[16]) ^ data_i[15]);
  assign _zz_crc_o_45 = data_i[11];
  assign _zz_crc_o_46 = (((((((data_i[30] ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[23]) ^ data_i[21]) ^ data_i[17]) ^ data_i[16]);
  assign _zz_crc_o_47 = data_i[12];
  assign _zz_crc_o_48 = (((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[22]) ^ data_i[18]) ^ data_i[17]);
  assign _zz_crc_o_49 = data_i[13];
  assign _zz_crc_o_50 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[19]) ^ data_i[18]) ^ data_i[16]) ^ data_i[14]) ^ data_i[12]) ^ data_i[11]);
  assign _zz_crc_o_51 = data_i[9];
  assign _zz_crc_o_52 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[20]) ^ data_i[19]) ^ data_i[17]) ^ data_i[16]) ^ data_i[15]) ^ data_i[13]) ^ data_i[9]) ^ data_i[6]);
  assign _zz_crc_o_53 = data_i[1];
  assign _zz_crc_o_54 = (((((((((data_i[30] ^ data_i[28]) ^ data_i[27]) ^ data_i[21]) ^ data_i[20]) ^ data_i[18]) ^ data_i[17]) ^ data_i[16]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_55 = data_i[7];
  assign _zz_crc_o_56 = (((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[22]) ^ data_i[21]) ^ data_i[19]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[11]);
  assign _zz_crc_o_57 = data_i[8];
  assign _zz_crc_o_58 = (((((((((((((data_i[31] ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[20]) ^ data_i[19]) ^ data_i[18]) ^ data_i[10]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]);
  assign _zz_crc_o_59 = data_i[0];
  assign _zz_crc_o_60 = (((((((((((data_i[29] ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[21]) ^ data_i[20]) ^ data_i[19]) ^ data_i[11]) ^ data_i[7]) ^ data_i[5]);
  assign _zz_crc_o_61 = data_i[4];
  assign _zz_crc_o_62 = (((((((((((data_i[30] ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[22]) ^ data_i[21]) ^ data_i[20]) ^ data_i[12]) ^ data_i[8]) ^ data_i[6]);
  assign _zz_crc_o_63 = data_i[5];
  assign _zz_crc_o_64 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[23]) ^ data_i[22]) ^ data_i[21]) ^ data_i[13]) ^ data_i[9]) ^ data_i[7]);
  assign _zz_crc_o_65 = data_i[6];
  assign _zz_crc_o_66 = (((((((((data_i[30] ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_67 = data_i[8];
  assign _zz_crc_o_68 = (((((((((data_i[31] ^ data_i[30]) ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[15]) ^ data_i[11]);
  assign _zz_crc_o_69 = data_i[9];
  always @(*) begin
    crc_o[0] = ((((((((((((((((_zz_crc_o ^ _zz_crc_o_1) ^ data_i[6]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[12]) ^ crc_i[16]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[1] = ((((((((((((((((_zz_crc_o_2 ^ _zz_crc_o_3) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[28]);
    crc_o[2] = ((((((((((((((((_zz_crc_o_4 ^ _zz_crc_o_5) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[3] = ((((((((((((((((_zz_crc_o_6 ^ _zz_crc_o_7) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[31]);
    crc_o[4] = ((((((((((((((((_zz_crc_o_8 ^ _zz_crc_o_11) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[15]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[5] = ((((((((((((((((_zz_crc_o_12 ^ _zz_crc_o_13) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[28]) ^ crc_i[29]);
    crc_o[6] = ((((((((((((((((_zz_crc_o_14 ^ _zz_crc_o_15) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[14]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[25]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[7] = ((((((((((((((((_zz_crc_o_16 ^ _zz_crc_o_17) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[28]) ^ crc_i[29]);
    crc_o[8] = ((((((((((((((((_zz_crc_o_18 ^ _zz_crc_o_19) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[17]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[9] = ((((((((((((((((_zz_crc_o_20 ^ _zz_crc_o_21) ^ data_i[4]) ^ data_i[2]) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[18]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[29]);
    crc_o[10] = ((((((((((((((((_zz_crc_o_22 ^ _zz_crc_o_23) ^ data_i[2]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[19]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[11] = ((((((((((((((((_zz_crc_o_24 ^ _zz_crc_o_27) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[20]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[12] = ((((((((((((((((_zz_crc_o_28 ^ _zz_crc_o_31) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[13] = ((((((((((((((((_zz_crc_o_32 ^ _zz_crc_o_33) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[22]) ^ crc_i[25]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[14] = ((((((((((((((((_zz_crc_o_34 ^ _zz_crc_o_35) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[23]) ^ crc_i[26]) ^ crc_i[29]);
    crc_o[15] = ((((((((((((((((_zz_crc_o_36 ^ _zz_crc_o_37) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[30]);
    crc_o[16] = ((((((((((((((((_zz_crc_o_38 ^ _zz_crc_o_39) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[8]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[17] = ((((((((((((((((_zz_crc_o_40 ^ _zz_crc_o_41) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[18] = ((((((((((((((((_zz_crc_o_42 ^ _zz_crc_o_43) ^ data_i[6]) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[19] = ((((((((((((((((_zz_crc_o_44 ^ _zz_crc_o_45) ^ data_i[8]) ^ data_i[7]) ^ data_i[3]) ^ crc_i[3]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[29]);
    crc_o[20] = ((((((((((((((((_zz_crc_o_46 ^ _zz_crc_o_47) ^ data_i[9]) ^ data_i[8]) ^ data_i[4]) ^ crc_i[4]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[21] = ((((((((((((((((_zz_crc_o_48 ^ _zz_crc_o_49) ^ data_i[10]) ^ data_i[9]) ^ data_i[5]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[22] = ((((((((((((((((_zz_crc_o_50 ^ _zz_crc_o_51) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[23] = ((((((((((((((((_zz_crc_o_52 ^ _zz_crc_o_53) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[24] = ((((((((((((((((_zz_crc_o_54 ^ _zz_crc_o_55) ^ data_i[2]) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[25] = ((((((((((((((((_zz_crc_o_56 ^ _zz_crc_o_57) ^ data_i[3]) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[26] = ((((((((((((((((_zz_crc_o_58 ^ _zz_crc_o_59) ^ crc_i[0]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[10]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[27] = ((((((((((((((((_zz_crc_o_60 ^ _zz_crc_o_61) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[11]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]);
    crc_o[28] = ((((((((((((((((_zz_crc_o_62 ^ _zz_crc_o_63) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[8]) ^ crc_i[12]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[29] = ((((((((((((((((_zz_crc_o_64 ^ _zz_crc_o_65) ^ data_i[3]) ^ crc_i[3]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[30] = ((((((((((((((((_zz_crc_o_66 ^ _zz_crc_o_67) ^ data_i[7]) ^ data_i[4]) ^ crc_i[4]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[31] = ((((((((((((((((_zz_crc_o_68 ^ _zz_crc_o_69) ^ data_i[8]) ^ data_i[5]) ^ crc_i[5]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
  end


endmodule

module StreamCCByToggle_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               clk,
  input               reset,
  input               axictrl_tx_flush,
  input               gtxuser_clk,
  input               txReset
);

  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC_1 outHitSignal_buffercc (
    .io_dataIn           (outHitSignal                      ), //i
    .io_dataOut          (outHitSignal_buffercc_io_dataOut  ), //o
    .clk                 (clk                               ), //i
    .reset               (reset                             ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                  )  //i
  );
  BufferCC pushArea_target_buffercc (
    .io_dataIn      (pushArea_target                      ), //i
    .io_dataOut     (pushArea_target_buffercc_io_dataOut  ), //o
    .gtxuser_clk    (gtxuser_clk                          ), //i
    .txReset        (txReset                              )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
      end else begin
        if(pushArea_accept) begin
          pushArea_target <= (! pushArea_target);
        end
        if(pushArea_accept) begin
          pushArea_data <= io_input_payload;
        end
      end
    end
  end

  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      popArea_hit <= 1'b0;
    end else begin
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

module StreamCCByToggle (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               gtxuser_clk,
  input               txReset,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);

  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC outHitSignal_buffercc (
    .io_dataIn      (outHitSignal                      ), //i
    .io_dataOut     (outHitSignal_buffercc_io_dataOut  ), //o
    .gtxuser_clk    (gtxuser_clk                       ), //i
    .txReset        (txReset                           )  //i
  );
  BufferCC_1 pushArea_target_buffercc (
    .io_dataIn           (pushArea_target                      ), //i
    .io_dataOut          (pushArea_target_buffercc_io_dataOut  ), //o
    .clk                 (clk                                  ), //i
    .reset               (reset                                ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                     )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      popArea_hit <= 1'b0;
    end else begin
      if(axictrl_tx_flush) begin
      popArea_hit <= 1'b0;
      end else begin
        if(popArea_stream_fire) begin
          popArea_hit <= popArea_target;
        end
      end
    end
  end


endmodule

//BufferCC_8 replaced by BufferCC_8

module BufferCC_8 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule

//BufferCC_4 replaced by BufferCC_4

//BufferCC_4 replaced by BufferCC_4

//BufferCC_4 replaced by BufferCC_4

module BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               gtxuser_clk,
  input               rxReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge gtxuser_clk or posedge rxReset) begin
    if(rxReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC_1 replaced by BufferCC_1

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      if(axictrl_tx_flush) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               gtxuser_clk,
  input               txReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge gtxuser_clk or posedge txReset) begin
    if(txReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
