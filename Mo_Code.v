// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Mo_Code
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Mo_Code (
  input      [23:0]   emif_emif_addr,
  input               emif_emif_cs,
  input               emif_emif_we,
  input               emif_emif_oe,
  input      [31:0]   hssl_sts_0,
  input      [31:0]   hssl_sts_1,
  input      [31:0]   hssl_sts_2,
  input      [31:0]   hssl_sts_3,
  input               hssl1_gtx_clk,
  input               hssl2_gtx_clk,
  input               clk,
  input               reset,
  input               hssl1_input_valid,
  output              hssl1_input_ready,
  input               hssl1_input_payload_last,
  input      [31:0]   hssl1_input_payload_fragment,
  output              hssl1_output_valid,
  input               hssl1_output_ready,
  output              hssl1_output_payload_last,
  output     [31:0]   hssl1_output_payload_fragment,
  input               hssl2_input_valid,
  output              hssl2_input_ready,
  input               hssl2_input_payload_last,
  input      [31:0]   hssl2_input_payload_fragment,
  output              hssl2_output_valid,
  input               hssl2_output_ready,
  output              hssl2_output_payload_last,
  output     [31:0]   hssl2_output_payload_fragment,
  input               hssl3_input_valid,
  output              hssl3_input_ready,
  input               hssl3_input_payload_last,
  input      [31:0]   hssl3_input_payload_fragment,
  output              hssl3_output_valid,
  input               hssl3_output_ready,
  output              hssl3_output_payload_last,
  output     [31:0]   hssl3_output_payload_fragment,
  input               hssl4_input_valid,
  output              hssl4_input_ready,
  input               hssl4_input_payload_last,
  input      [31:0]   hssl4_input_payload_fragment,
  output              hssl4_output_valid,
  input               hssl4_output_ready,
  output              hssl4_output_payload_last,
  output     [31:0]   hssl4_output_payload_fragment,
   inout     [15:0]   emif_emif_data
);

  wire       [3:0]    area_hssl1_csr_reg_apb_PADDR;
  wire       [3:0]    area_hssl2_csr_reg_apb_PADDR;
  wire       [3:0]    area_hssl3_csr_reg_apb_PADDR;
  wire       [3:0]    area_hssl4_csr_reg_apb_PADDR;
  wire       [9:0]    area_hssl1_txram_apb_PADDR;
  wire       [9:0]    area_hssl1_rxram_apb_PADDR;
  wire       [9:0]    area_hssl2_txram_apb_PADDR;
  wire       [9:0]    area_hssl2_rxram_apb_PADDR;
  wire       [9:0]    area_hssl3_txram_apb_PADDR;
  wire       [9:0]    area_hssl3_rxram_apb_PADDR;
  wire       [9:0]    area_hssl4_txram_apb_PADDR;
  wire       [9:0]    area_hssl4_rxram_apb_PADDR;
  wire       [15:0]   area_emif32_toapb_emif_emif_data_write;
  wire                area_emif32_toapb_emif_emif_data_writeEnable;
  wire       [23:0]   area_emif32_toapb_apb_PADDR;
  wire       [0:0]    area_emif32_toapb_apb_PSEL;
  wire                area_emif32_toapb_apb_PENABLE;
  wire                area_emif32_toapb_apb_PWRITE;
  wire       [31:0]   area_emif32_toapb_apb_PWDATA;
  wire                area_hssl1_csr_reg_apb_PREADY;
  wire       [31:0]   area_hssl1_csr_reg_apb_PRDATA;
  wire                area_hssl1_csr_reg_apb_PSLVERROR;
  wire                area_hssl1_csr_reg_hssl_ctl_rst;
  wire                area_hssl1_csr_reg_hssl_ctl_send;
  wire                area_hssl1_csr_reg_hssl_ctl_trigger;
  wire                area_hssl2_csr_reg_apb_PREADY;
  wire       [31:0]   area_hssl2_csr_reg_apb_PRDATA;
  wire                area_hssl2_csr_reg_apb_PSLVERROR;
  wire                area_hssl2_csr_reg_hssl_ctl_rst;
  wire                area_hssl2_csr_reg_hssl_ctl_send;
  wire                area_hssl2_csr_reg_hssl_ctl_trigger;
  wire                area_hssl3_csr_reg_apb_PREADY;
  wire       [31:0]   area_hssl3_csr_reg_apb_PRDATA;
  wire                area_hssl3_csr_reg_apb_PSLVERROR;
  wire                area_hssl3_csr_reg_hssl_ctl_rst;
  wire                area_hssl3_csr_reg_hssl_ctl_send;
  wire                area_hssl3_csr_reg_hssl_ctl_trigger;
  wire                area_hssl4_csr_reg_apb_PREADY;
  wire       [31:0]   area_hssl4_csr_reg_apb_PRDATA;
  wire                area_hssl4_csr_reg_apb_PSLVERROR;
  wire                area_hssl4_csr_reg_hssl_ctl_rst;
  wire                area_hssl4_csr_reg_hssl_ctl_send;
  wire                area_hssl4_csr_reg_hssl_ctl_trigger;
  wire                area_hssl1_txram_apb_PREADY;
  wire       [31:0]   area_hssl1_txram_apb_PRDATA;
  wire                area_hssl1_txram_apb_PSLVERROR;
  wire                area_hssl1_txram_output_valid;
  wire                area_hssl1_txram_output_payload_last;
  wire       [31:0]   area_hssl1_txram_output_payload_fragment;
  wire                area_hssl1_rxram_apb_PREADY;
  wire       [31:0]   area_hssl1_rxram_apb_PRDATA;
  wire                area_hssl1_rxram_apb_PSLVERROR;
  wire                area_hssl1_rxram_input_ready;
  wire                area_hssl2_txram_apb_PREADY;
  wire       [31:0]   area_hssl2_txram_apb_PRDATA;
  wire                area_hssl2_txram_apb_PSLVERROR;
  wire                area_hssl2_txram_output_valid;
  wire                area_hssl2_txram_output_payload_last;
  wire       [31:0]   area_hssl2_txram_output_payload_fragment;
  wire                area_hssl2_rxram_apb_PREADY;
  wire       [31:0]   area_hssl2_rxram_apb_PRDATA;
  wire                area_hssl2_rxram_apb_PSLVERROR;
  wire                area_hssl2_rxram_input_ready;
  wire                area_hssl3_txram_apb_PREADY;
  wire       [31:0]   area_hssl3_txram_apb_PRDATA;
  wire                area_hssl3_txram_apb_PSLVERROR;
  wire                area_hssl3_txram_output_valid;
  wire                area_hssl3_txram_output_payload_last;
  wire       [31:0]   area_hssl3_txram_output_payload_fragment;
  wire                area_hssl3_rxram_apb_PREADY;
  wire       [31:0]   area_hssl3_rxram_apb_PRDATA;
  wire                area_hssl3_rxram_apb_PSLVERROR;
  wire                area_hssl3_rxram_input_ready;
  wire                area_hssl4_txram_apb_PREADY;
  wire       [31:0]   area_hssl4_txram_apb_PRDATA;
  wire                area_hssl4_txram_apb_PSLVERROR;
  wire                area_hssl4_txram_output_valid;
  wire                area_hssl4_txram_output_payload_last;
  wire       [31:0]   area_hssl4_txram_output_payload_fragment;
  wire                area_hssl4_rxram_apb_PREADY;
  wire       [31:0]   area_hssl4_rxram_apb_PRDATA;
  wire                area_hssl4_rxram_apb_PSLVERROR;
  wire                area_hssl4_rxram_input_ready;
  wire                apb_decoder_io_input_PREADY;
  wire       [31:0]   apb_decoder_io_input_PRDATA;
  wire                apb_decoder_io_input_PSLVERROR;
  wire       [23:0]   apb_decoder_io_output_PADDR;
  wire       [11:0]   apb_decoder_io_output_PSEL;
  wire                apb_decoder_io_output_PENABLE;
  wire                apb_decoder_io_output_PWRITE;
  wire       [31:0]   apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [23:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_4_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_4_PSEL;
  wire                apb3Router_1_io_outputs_4_PENABLE;
  wire                apb3Router_1_io_outputs_4_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_4_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_5_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_5_PSEL;
  wire                apb3Router_1_io_outputs_5_PENABLE;
  wire                apb3Router_1_io_outputs_5_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_5_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_6_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_6_PSEL;
  wire                apb3Router_1_io_outputs_6_PENABLE;
  wire                apb3Router_1_io_outputs_6_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_6_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_7_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_7_PSEL;
  wire                apb3Router_1_io_outputs_7_PENABLE;
  wire                apb3Router_1_io_outputs_7_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_7_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_8_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_8_PSEL;
  wire                apb3Router_1_io_outputs_8_PENABLE;
  wire                apb3Router_1_io_outputs_8_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_8_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_9_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_9_PSEL;
  wire                apb3Router_1_io_outputs_9_PENABLE;
  wire                apb3Router_1_io_outputs_9_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_9_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_10_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_10_PSEL;
  wire                apb3Router_1_io_outputs_10_PENABLE;
  wire                apb3Router_1_io_outputs_10_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_10_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_11_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_11_PSEL;
  wire                apb3Router_1_io_outputs_11_PENABLE;
  wire                apb3Router_1_io_outputs_11_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_11_PWDATA;
  reg                 _zz_emif_emif_data;
  wire       [15:0]   _zz_emif_emif_data_read;
  wire       [15:0]   _zz_emif_emif_data_1;
  wire                _zz_1;

  EMIF32_Apb area_emif32_toapb (
    .emif_emif_addr                (emif_emif_addr[23:0]                          ), //i
    .emif_emif_data_read           (_zz_emif_emif_data_read[15:0]                 ), //i
    .emif_emif_data_write          (area_emif32_toapb_emif_emif_data_write[15:0]  ), //o
    .emif_emif_data_writeEnable    (area_emif32_toapb_emif_emif_data_writeEnable  ), //o
    .emif_emif_cs                  (emif_emif_cs                                  ), //i
    .emif_emif_we                  (emif_emif_we                                  ), //i
    .emif_emif_oe                  (emif_emif_oe                                  ), //i
    .apb_PADDR                     (area_emif32_toapb_apb_PADDR[23:0]             ), //o
    .apb_PSEL                      (area_emif32_toapb_apb_PSEL                    ), //o
    .apb_PENABLE                   (area_emif32_toapb_apb_PENABLE                 ), //o
    .apb_PREADY                    (apb_decoder_io_input_PREADY                   ), //i
    .apb_PWRITE                    (area_emif32_toapb_apb_PWRITE                  ), //o
    .apb_PWDATA                    (area_emif32_toapb_apb_PWDATA[31:0]            ), //o
    .apb_PRDATA                    (apb_decoder_io_input_PRDATA[31:0]             ), //i
    .apb_PSLVERROR                 (apb_decoder_io_input_PSLVERROR                ), //i
    .clk                           (clk                                           ), //i
    .reset                         (reset                                         )  //i
  );
  Apb_CsrReg area_hssl1_csr_reg (
    .apb_PADDR           (area_hssl1_csr_reg_apb_PADDR[3:0]       ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_0_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_0_PENABLE       ), //i
    .apb_PREADY          (area_hssl1_csr_reg_apb_PREADY           ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_0_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_0_PWDATA[31:0]  ), //i
    .apb_PRDATA          (area_hssl1_csr_reg_apb_PRDATA[31:0]     ), //o
    .apb_PSLVERROR       (area_hssl1_csr_reg_apb_PSLVERROR        ), //o
    .hssl_sts            (hssl_sts_0[31:0]                        ), //i
    .hssl_ctl_rst        (area_hssl1_csr_reg_hssl_ctl_rst         ), //o
    .hssl_ctl_send       (area_hssl1_csr_reg_hssl_ctl_send        ), //o
    .hssl_ctl_trigger    (area_hssl1_csr_reg_hssl_ctl_trigger     ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_CsrReg area_hssl2_csr_reg (
    .apb_PADDR           (area_hssl2_csr_reg_apb_PADDR[3:0]       ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_1_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_1_PENABLE       ), //i
    .apb_PREADY          (area_hssl2_csr_reg_apb_PREADY           ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_1_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_1_PWDATA[31:0]  ), //i
    .apb_PRDATA          (area_hssl2_csr_reg_apb_PRDATA[31:0]     ), //o
    .apb_PSLVERROR       (area_hssl2_csr_reg_apb_PSLVERROR        ), //o
    .hssl_sts            (hssl_sts_1[31:0]                        ), //i
    .hssl_ctl_rst        (area_hssl2_csr_reg_hssl_ctl_rst         ), //o
    .hssl_ctl_send       (area_hssl2_csr_reg_hssl_ctl_send        ), //o
    .hssl_ctl_trigger    (area_hssl2_csr_reg_hssl_ctl_trigger     ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_CsrReg area_hssl3_csr_reg (
    .apb_PADDR           (area_hssl3_csr_reg_apb_PADDR[3:0]       ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_2_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_2_PENABLE       ), //i
    .apb_PREADY          (area_hssl3_csr_reg_apb_PREADY           ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_2_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_2_PWDATA[31:0]  ), //i
    .apb_PRDATA          (area_hssl3_csr_reg_apb_PRDATA[31:0]     ), //o
    .apb_PSLVERROR       (area_hssl3_csr_reg_apb_PSLVERROR        ), //o
    .hssl_sts            (hssl_sts_2[31:0]                        ), //i
    .hssl_ctl_rst        (area_hssl3_csr_reg_hssl_ctl_rst         ), //o
    .hssl_ctl_send       (area_hssl3_csr_reg_hssl_ctl_send        ), //o
    .hssl_ctl_trigger    (area_hssl3_csr_reg_hssl_ctl_trigger     ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_CsrReg area_hssl4_csr_reg (
    .apb_PADDR           (area_hssl4_csr_reg_apb_PADDR[3:0]       ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_3_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_3_PENABLE       ), //i
    .apb_PREADY          (area_hssl4_csr_reg_apb_PREADY           ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_3_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_3_PWDATA[31:0]  ), //i
    .apb_PRDATA          (area_hssl4_csr_reg_apb_PRDATA[31:0]     ), //o
    .apb_PSLVERROR       (area_hssl4_csr_reg_apb_PSLVERROR        ), //o
    .hssl_sts            (hssl_sts_3[31:0]                        ), //i
    .hssl_ctl_rst        (area_hssl4_csr_reg_hssl_ctl_rst         ), //o
    .hssl_ctl_send       (area_hssl4_csr_reg_hssl_ctl_send        ), //o
    .hssl_ctl_trigger    (area_hssl4_csr_reg_hssl_ctl_trigger     ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_TxRam area_hssl1_txram (
    .apb_PADDR                  (area_hssl1_txram_apb_PADDR[9:0]                 ), //i
    .apb_PSEL                   (apb3Router_1_io_outputs_4_PSEL                  ), //i
    .apb_PENABLE                (apb3Router_1_io_outputs_4_PENABLE               ), //i
    .apb_PREADY                 (area_hssl1_txram_apb_PREADY                     ), //o
    .apb_PWRITE                 (apb3Router_1_io_outputs_4_PWRITE                ), //i
    .apb_PWDATA                 (apb3Router_1_io_outputs_4_PWDATA[31:0]          ), //i
    .apb_PRDATA                 (area_hssl1_txram_apb_PRDATA[31:0]               ), //o
    .apb_PSLVERROR              (area_hssl1_txram_apb_PSLVERROR                  ), //o
    .output_valid               (area_hssl1_txram_output_valid                   ), //o
    .output_ready               (hssl1_output_ready                              ), //i
    .output_payload_last        (area_hssl1_txram_output_payload_last            ), //o
    .output_payload_fragment    (area_hssl1_txram_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                             ), //i
    .tx_clk                     (hssl1_gtx_clk                                   ), //i
    .reset                      (reset                                           ), //i
    .tx_id                      (32'h000000b1                                    ), //i
    .tx_packet_req              (area_hssl1_csr_reg_hssl_ctl_send                )  //i
  );
  Apb_RxRAM area_hssl1_rxram (
    .apb_PADDR                 (area_hssl1_rxram_apb_PADDR[9:0]         ), //i
    .apb_PSEL                  (apb3Router_1_io_outputs_5_PSEL          ), //i
    .apb_PENABLE               (apb3Router_1_io_outputs_5_PENABLE       ), //i
    .apb_PREADY                (area_hssl1_rxram_apb_PREADY             ), //o
    .apb_PWRITE                (apb3Router_1_io_outputs_5_PWRITE        ), //i
    .apb_PWDATA                (apb3Router_1_io_outputs_5_PWDATA[31:0]  ), //i
    .apb_PRDATA                (area_hssl1_rxram_apb_PRDATA[31:0]       ), //o
    .apb_PSLVERROR             (area_hssl1_rxram_apb_PSLVERROR          ), //o
    .input_valid               (hssl1_input_valid                       ), //i
    .input_ready               (area_hssl1_rxram_input_ready            ), //o
    .input_payload_last        (hssl1_input_payload_last                ), //i
    .input_payload_fragment    (hssl1_input_payload_fragment[31:0]      ), //i
    .clk                       (clk                                     ), //i
    .rx_clk                    (hssl1_gtx_clk                           ), //i
    .reset                     (reset                                   ), //i
    .rx_id                     (32'h000000b1                            )  //i
  );
  Apb_TxRam_1 area_hssl2_txram (
    .apb_PADDR                  (area_hssl2_txram_apb_PADDR[9:0]                 ), //i
    .apb_PSEL                   (apb3Router_1_io_outputs_6_PSEL                  ), //i
    .apb_PENABLE                (apb3Router_1_io_outputs_6_PENABLE               ), //i
    .apb_PREADY                 (area_hssl2_txram_apb_PREADY                     ), //o
    .apb_PWRITE                 (apb3Router_1_io_outputs_6_PWRITE                ), //i
    .apb_PWDATA                 (apb3Router_1_io_outputs_6_PWDATA[31:0]          ), //i
    .apb_PRDATA                 (area_hssl2_txram_apb_PRDATA[31:0]               ), //o
    .apb_PSLVERROR              (area_hssl2_txram_apb_PSLVERROR                  ), //o
    .output_valid               (area_hssl2_txram_output_valid                   ), //o
    .output_ready               (hssl2_output_ready                              ), //i
    .output_payload_last        (area_hssl2_txram_output_payload_last            ), //o
    .output_payload_fragment    (area_hssl2_txram_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                             ), //i
    .tx_clk                     (hssl2_gtx_clk                                   ), //i
    .reset                      (reset                                           ), //i
    .tx_id                      (32'h000000b2                                    ), //i
    .tx_packet_req              (area_hssl2_csr_reg_hssl_ctl_send                )  //i
  );
  Apb_RxRAM area_hssl2_rxram (
    .apb_PADDR                 (area_hssl2_rxram_apb_PADDR[9:0]         ), //i
    .apb_PSEL                  (apb3Router_1_io_outputs_7_PSEL          ), //i
    .apb_PENABLE               (apb3Router_1_io_outputs_7_PENABLE       ), //i
    .apb_PREADY                (area_hssl2_rxram_apb_PREADY             ), //o
    .apb_PWRITE                (apb3Router_1_io_outputs_7_PWRITE        ), //i
    .apb_PWDATA                (apb3Router_1_io_outputs_7_PWDATA[31:0]  ), //i
    .apb_PRDATA                (area_hssl2_rxram_apb_PRDATA[31:0]       ), //o
    .apb_PSLVERROR             (area_hssl2_rxram_apb_PSLVERROR          ), //o
    .input_valid               (hssl2_input_valid                       ), //i
    .input_ready               (area_hssl2_rxram_input_ready            ), //o
    .input_payload_last        (hssl2_input_payload_last                ), //i
    .input_payload_fragment    (hssl2_input_payload_fragment[31:0]      ), //i
    .clk                       (clk                                     ), //i
    .rx_clk                    (hssl2_gtx_clk                           ), //i
    .reset                     (reset                                   ), //i
    .rx_id                     (32'h000000b2                            )  //i
  );
  Apb_TxRam_2 area_hssl3_txram (
    .apb_PADDR                  (area_hssl3_txram_apb_PADDR[9:0]                 ), //i
    .apb_PSEL                   (apb3Router_1_io_outputs_8_PSEL                  ), //i
    .apb_PENABLE                (apb3Router_1_io_outputs_8_PENABLE               ), //i
    .apb_PREADY                 (area_hssl3_txram_apb_PREADY                     ), //o
    .apb_PWRITE                 (apb3Router_1_io_outputs_8_PWRITE                ), //i
    .apb_PWDATA                 (apb3Router_1_io_outputs_8_PWDATA[31:0]          ), //i
    .apb_PRDATA                 (area_hssl3_txram_apb_PRDATA[31:0]               ), //o
    .apb_PSLVERROR              (area_hssl3_txram_apb_PSLVERROR                  ), //o
    .output_valid               (area_hssl3_txram_output_valid                   ), //o
    .output_ready               (hssl3_output_ready                              ), //i
    .output_payload_last        (area_hssl3_txram_output_payload_last            ), //o
    .output_payload_fragment    (area_hssl3_txram_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                             ), //i
    .tx_clk                     (hssl2_gtx_clk                                   ), //i
    .reset                      (reset                                           ), //i
    .tx_id                      (32'h000000b3                                    ), //i
    .tx_packet_req              (area_hssl3_csr_reg_hssl_ctl_send                )  //i
  );
  Apb_RxRAM area_hssl3_rxram (
    .apb_PADDR                 (area_hssl3_rxram_apb_PADDR[9:0]         ), //i
    .apb_PSEL                  (apb3Router_1_io_outputs_9_PSEL          ), //i
    .apb_PENABLE               (apb3Router_1_io_outputs_9_PENABLE       ), //i
    .apb_PREADY                (area_hssl3_rxram_apb_PREADY             ), //o
    .apb_PWRITE                (apb3Router_1_io_outputs_9_PWRITE        ), //i
    .apb_PWDATA                (apb3Router_1_io_outputs_9_PWDATA[31:0]  ), //i
    .apb_PRDATA                (area_hssl3_rxram_apb_PRDATA[31:0]       ), //o
    .apb_PSLVERROR             (area_hssl3_rxram_apb_PSLVERROR          ), //o
    .input_valid               (hssl3_input_valid                       ), //i
    .input_ready               (area_hssl3_rxram_input_ready            ), //o
    .input_payload_last        (hssl3_input_payload_last                ), //i
    .input_payload_fragment    (hssl3_input_payload_fragment[31:0]      ), //i
    .clk                       (clk                                     ), //i
    .rx_clk                    (hssl2_gtx_clk                           ), //i
    .reset                     (reset                                   ), //i
    .rx_id                     (32'h000000b3                            )  //i
  );
  Apb_TxRam_3 area_hssl4_txram (
    .apb_PADDR                  (area_hssl4_txram_apb_PADDR[9:0]                 ), //i
    .apb_PSEL                   (apb3Router_1_io_outputs_10_PSEL                 ), //i
    .apb_PENABLE                (apb3Router_1_io_outputs_10_PENABLE              ), //i
    .apb_PREADY                 (area_hssl4_txram_apb_PREADY                     ), //o
    .apb_PWRITE                 (apb3Router_1_io_outputs_10_PWRITE               ), //i
    .apb_PWDATA                 (apb3Router_1_io_outputs_10_PWDATA[31:0]         ), //i
    .apb_PRDATA                 (area_hssl4_txram_apb_PRDATA[31:0]               ), //o
    .apb_PSLVERROR              (area_hssl4_txram_apb_PSLVERROR                  ), //o
    .output_valid               (area_hssl4_txram_output_valid                   ), //o
    .output_ready               (hssl4_output_ready                              ), //i
    .output_payload_last        (area_hssl4_txram_output_payload_last            ), //o
    .output_payload_fragment    (area_hssl4_txram_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                             ), //i
    .tx_clk                     (hssl2_gtx_clk                                   ), //i
    .reset                      (reset                                           ), //i
    .tx_id                      (32'h000000b4                                    ), //i
    .tx_packet_req              (area_hssl4_csr_reg_hssl_ctl_send                )  //i
  );
  Apb_RxRAM area_hssl4_rxram (
    .apb_PADDR                 (area_hssl4_rxram_apb_PADDR[9:0]          ), //i
    .apb_PSEL                  (apb3Router_1_io_outputs_11_PSEL          ), //i
    .apb_PENABLE               (apb3Router_1_io_outputs_11_PENABLE       ), //i
    .apb_PREADY                (area_hssl4_rxram_apb_PREADY              ), //o
    .apb_PWRITE                (apb3Router_1_io_outputs_11_PWRITE        ), //i
    .apb_PWDATA                (apb3Router_1_io_outputs_11_PWDATA[31:0]  ), //i
    .apb_PRDATA                (area_hssl4_rxram_apb_PRDATA[31:0]        ), //o
    .apb_PSLVERROR             (area_hssl4_rxram_apb_PSLVERROR           ), //o
    .input_valid               (hssl4_input_valid                        ), //i
    .input_ready               (area_hssl4_rxram_input_ready             ), //o
    .input_payload_last        (hssl4_input_payload_last                 ), //i
    .input_payload_fragment    (hssl4_input_payload_fragment[31:0]       ), //i
    .clk                       (clk                                      ), //i
    .rx_clk                    (hssl2_gtx_clk                            ), //i
    .reset                     (reset                                    ), //i
    .rx_id                     (32'h000000b4                             )  //i
  );
  Apb3Decoder apb_decoder (
    .io_input_PADDR         (area_emif32_toapb_apb_PADDR[23:0]   ), //i
    .io_input_PSEL          (area_emif32_toapb_apb_PSEL          ), //i
    .io_input_PENABLE       (area_emif32_toapb_apb_PENABLE       ), //i
    .io_input_PREADY        (apb_decoder_io_input_PREADY         ), //o
    .io_input_PWRITE        (area_emif32_toapb_apb_PWRITE        ), //i
    .io_input_PWDATA        (area_emif32_toapb_apb_PWDATA[31:0]  ), //i
    .io_input_PRDATA        (apb_decoder_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (apb_decoder_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (apb_decoder_io_output_PADDR[23:0]   ), //o
    .io_output_PSEL         (apb_decoder_io_output_PSEL[11:0]    ), //o
    .io_output_PENABLE      (apb_decoder_io_output_PENABLE       ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY        ), //i
    .io_output_PWRITE       (apb_decoder_io_output_PWRITE        ), //o
    .io_output_PWDATA       (apb_decoder_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[31:0]  ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR     )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR             (apb_decoder_io_output_PADDR[23:0]        ), //i
    .io_input_PSEL              (apb_decoder_io_output_PSEL[11:0]         ), //i
    .io_input_PENABLE           (apb_decoder_io_output_PENABLE            ), //i
    .io_input_PREADY            (apb3Router_1_io_input_PREADY             ), //o
    .io_input_PWRITE            (apb_decoder_io_output_PWRITE             ), //i
    .io_input_PWDATA            (apb_decoder_io_output_PWDATA[31:0]       ), //i
    .io_input_PRDATA            (apb3Router_1_io_input_PRDATA[31:0]       ), //o
    .io_input_PSLVERROR         (apb3Router_1_io_input_PSLVERROR          ), //o
    .io_outputs_0_PADDR         (apb3Router_1_io_outputs_0_PADDR[23:0]    ), //o
    .io_outputs_0_PSEL          (apb3Router_1_io_outputs_0_PSEL           ), //o
    .io_outputs_0_PENABLE       (apb3Router_1_io_outputs_0_PENABLE        ), //o
    .io_outputs_0_PREADY        (area_hssl1_csr_reg_apb_PREADY            ), //i
    .io_outputs_0_PWRITE        (apb3Router_1_io_outputs_0_PWRITE         ), //o
    .io_outputs_0_PWDATA        (apb3Router_1_io_outputs_0_PWDATA[31:0]   ), //o
    .io_outputs_0_PRDATA        (area_hssl1_csr_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_0_PSLVERROR     (area_hssl1_csr_reg_apb_PSLVERROR         ), //i
    .io_outputs_1_PADDR         (apb3Router_1_io_outputs_1_PADDR[23:0]    ), //o
    .io_outputs_1_PSEL          (apb3Router_1_io_outputs_1_PSEL           ), //o
    .io_outputs_1_PENABLE       (apb3Router_1_io_outputs_1_PENABLE        ), //o
    .io_outputs_1_PREADY        (area_hssl2_csr_reg_apb_PREADY            ), //i
    .io_outputs_1_PWRITE        (apb3Router_1_io_outputs_1_PWRITE         ), //o
    .io_outputs_1_PWDATA        (apb3Router_1_io_outputs_1_PWDATA[31:0]   ), //o
    .io_outputs_1_PRDATA        (area_hssl2_csr_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_1_PSLVERROR     (area_hssl2_csr_reg_apb_PSLVERROR         ), //i
    .io_outputs_2_PADDR         (apb3Router_1_io_outputs_2_PADDR[23:0]    ), //o
    .io_outputs_2_PSEL          (apb3Router_1_io_outputs_2_PSEL           ), //o
    .io_outputs_2_PENABLE       (apb3Router_1_io_outputs_2_PENABLE        ), //o
    .io_outputs_2_PREADY        (area_hssl3_csr_reg_apb_PREADY            ), //i
    .io_outputs_2_PWRITE        (apb3Router_1_io_outputs_2_PWRITE         ), //o
    .io_outputs_2_PWDATA        (apb3Router_1_io_outputs_2_PWDATA[31:0]   ), //o
    .io_outputs_2_PRDATA        (area_hssl3_csr_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_2_PSLVERROR     (area_hssl3_csr_reg_apb_PSLVERROR         ), //i
    .io_outputs_3_PADDR         (apb3Router_1_io_outputs_3_PADDR[23:0]    ), //o
    .io_outputs_3_PSEL          (apb3Router_1_io_outputs_3_PSEL           ), //o
    .io_outputs_3_PENABLE       (apb3Router_1_io_outputs_3_PENABLE        ), //o
    .io_outputs_3_PREADY        (area_hssl4_csr_reg_apb_PREADY            ), //i
    .io_outputs_3_PWRITE        (apb3Router_1_io_outputs_3_PWRITE         ), //o
    .io_outputs_3_PWDATA        (apb3Router_1_io_outputs_3_PWDATA[31:0]   ), //o
    .io_outputs_3_PRDATA        (area_hssl4_csr_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_3_PSLVERROR     (area_hssl4_csr_reg_apb_PSLVERROR         ), //i
    .io_outputs_4_PADDR         (apb3Router_1_io_outputs_4_PADDR[23:0]    ), //o
    .io_outputs_4_PSEL          (apb3Router_1_io_outputs_4_PSEL           ), //o
    .io_outputs_4_PENABLE       (apb3Router_1_io_outputs_4_PENABLE        ), //o
    .io_outputs_4_PREADY        (area_hssl1_txram_apb_PREADY              ), //i
    .io_outputs_4_PWRITE        (apb3Router_1_io_outputs_4_PWRITE         ), //o
    .io_outputs_4_PWDATA        (apb3Router_1_io_outputs_4_PWDATA[31:0]   ), //o
    .io_outputs_4_PRDATA        (area_hssl1_txram_apb_PRDATA[31:0]        ), //i
    .io_outputs_4_PSLVERROR     (area_hssl1_txram_apb_PSLVERROR           ), //i
    .io_outputs_5_PADDR         (apb3Router_1_io_outputs_5_PADDR[23:0]    ), //o
    .io_outputs_5_PSEL          (apb3Router_1_io_outputs_5_PSEL           ), //o
    .io_outputs_5_PENABLE       (apb3Router_1_io_outputs_5_PENABLE        ), //o
    .io_outputs_5_PREADY        (area_hssl1_rxram_apb_PREADY              ), //i
    .io_outputs_5_PWRITE        (apb3Router_1_io_outputs_5_PWRITE         ), //o
    .io_outputs_5_PWDATA        (apb3Router_1_io_outputs_5_PWDATA[31:0]   ), //o
    .io_outputs_5_PRDATA        (area_hssl1_rxram_apb_PRDATA[31:0]        ), //i
    .io_outputs_5_PSLVERROR     (area_hssl1_rxram_apb_PSLVERROR           ), //i
    .io_outputs_6_PADDR         (apb3Router_1_io_outputs_6_PADDR[23:0]    ), //o
    .io_outputs_6_PSEL          (apb3Router_1_io_outputs_6_PSEL           ), //o
    .io_outputs_6_PENABLE       (apb3Router_1_io_outputs_6_PENABLE        ), //o
    .io_outputs_6_PREADY        (area_hssl2_txram_apb_PREADY              ), //i
    .io_outputs_6_PWRITE        (apb3Router_1_io_outputs_6_PWRITE         ), //o
    .io_outputs_6_PWDATA        (apb3Router_1_io_outputs_6_PWDATA[31:0]   ), //o
    .io_outputs_6_PRDATA        (area_hssl2_txram_apb_PRDATA[31:0]        ), //i
    .io_outputs_6_PSLVERROR     (area_hssl2_txram_apb_PSLVERROR           ), //i
    .io_outputs_7_PADDR         (apb3Router_1_io_outputs_7_PADDR[23:0]    ), //o
    .io_outputs_7_PSEL          (apb3Router_1_io_outputs_7_PSEL           ), //o
    .io_outputs_7_PENABLE       (apb3Router_1_io_outputs_7_PENABLE        ), //o
    .io_outputs_7_PREADY        (area_hssl2_rxram_apb_PREADY              ), //i
    .io_outputs_7_PWRITE        (apb3Router_1_io_outputs_7_PWRITE         ), //o
    .io_outputs_7_PWDATA        (apb3Router_1_io_outputs_7_PWDATA[31:0]   ), //o
    .io_outputs_7_PRDATA        (area_hssl2_rxram_apb_PRDATA[31:0]        ), //i
    .io_outputs_7_PSLVERROR     (area_hssl2_rxram_apb_PSLVERROR           ), //i
    .io_outputs_8_PADDR         (apb3Router_1_io_outputs_8_PADDR[23:0]    ), //o
    .io_outputs_8_PSEL          (apb3Router_1_io_outputs_8_PSEL           ), //o
    .io_outputs_8_PENABLE       (apb3Router_1_io_outputs_8_PENABLE        ), //o
    .io_outputs_8_PREADY        (area_hssl3_txram_apb_PREADY              ), //i
    .io_outputs_8_PWRITE        (apb3Router_1_io_outputs_8_PWRITE         ), //o
    .io_outputs_8_PWDATA        (apb3Router_1_io_outputs_8_PWDATA[31:0]   ), //o
    .io_outputs_8_PRDATA        (area_hssl3_txram_apb_PRDATA[31:0]        ), //i
    .io_outputs_8_PSLVERROR     (area_hssl3_txram_apb_PSLVERROR           ), //i
    .io_outputs_9_PADDR         (apb3Router_1_io_outputs_9_PADDR[23:0]    ), //o
    .io_outputs_9_PSEL          (apb3Router_1_io_outputs_9_PSEL           ), //o
    .io_outputs_9_PENABLE       (apb3Router_1_io_outputs_9_PENABLE        ), //o
    .io_outputs_9_PREADY        (area_hssl3_rxram_apb_PREADY              ), //i
    .io_outputs_9_PWRITE        (apb3Router_1_io_outputs_9_PWRITE         ), //o
    .io_outputs_9_PWDATA        (apb3Router_1_io_outputs_9_PWDATA[31:0]   ), //o
    .io_outputs_9_PRDATA        (area_hssl3_rxram_apb_PRDATA[31:0]        ), //i
    .io_outputs_9_PSLVERROR     (area_hssl3_rxram_apb_PSLVERROR           ), //i
    .io_outputs_10_PADDR        (apb3Router_1_io_outputs_10_PADDR[23:0]   ), //o
    .io_outputs_10_PSEL         (apb3Router_1_io_outputs_10_PSEL          ), //o
    .io_outputs_10_PENABLE      (apb3Router_1_io_outputs_10_PENABLE       ), //o
    .io_outputs_10_PREADY       (area_hssl4_txram_apb_PREADY              ), //i
    .io_outputs_10_PWRITE       (apb3Router_1_io_outputs_10_PWRITE        ), //o
    .io_outputs_10_PWDATA       (apb3Router_1_io_outputs_10_PWDATA[31:0]  ), //o
    .io_outputs_10_PRDATA       (area_hssl4_txram_apb_PRDATA[31:0]        ), //i
    .io_outputs_10_PSLVERROR    (area_hssl4_txram_apb_PSLVERROR           ), //i
    .io_outputs_11_PADDR        (apb3Router_1_io_outputs_11_PADDR[23:0]   ), //o
    .io_outputs_11_PSEL         (apb3Router_1_io_outputs_11_PSEL          ), //o
    .io_outputs_11_PENABLE      (apb3Router_1_io_outputs_11_PENABLE       ), //o
    .io_outputs_11_PREADY       (area_hssl4_rxram_apb_PREADY              ), //i
    .io_outputs_11_PWRITE       (apb3Router_1_io_outputs_11_PWRITE        ), //o
    .io_outputs_11_PWDATA       (apb3Router_1_io_outputs_11_PWDATA[31:0]  ), //o
    .io_outputs_11_PRDATA       (area_hssl4_rxram_apb_PRDATA[31:0]        ), //i
    .io_outputs_11_PSLVERROR    (area_hssl4_rxram_apb_PSLVERROR           ), //i
    .clk                        (clk                                      ), //i
    .reset                      (reset                                    )  //i
  );
  assign emif_emif_data = _zz_emif_emif_data ? _zz_emif_emif_data_1 : 16'bzzzzzzzzzzzzzzzz;
  always @(*) begin
    _zz_emif_emif_data = 1'b0;
    if(_zz_1) begin
      _zz_emif_emif_data = 1'b1;
    end
  end

  assign _zz_emif_emif_data_1 = area_emif32_toapb_emif_emif_data_write;
  assign _zz_1 = area_emif32_toapb_emif_emif_data_writeEnable;
  assign hssl1_output_valid = area_hssl1_txram_output_valid;
  assign hssl1_output_payload_last = area_hssl1_txram_output_payload_last;
  assign hssl1_output_payload_fragment = area_hssl1_txram_output_payload_fragment;
  assign hssl1_input_ready = area_hssl1_rxram_input_ready;
  assign hssl2_output_valid = area_hssl2_txram_output_valid;
  assign hssl2_output_payload_last = area_hssl2_txram_output_payload_last;
  assign hssl2_output_payload_fragment = area_hssl2_txram_output_payload_fragment;
  assign hssl2_input_ready = area_hssl2_rxram_input_ready;
  assign hssl3_output_valid = area_hssl3_txram_output_valid;
  assign hssl3_output_payload_last = area_hssl3_txram_output_payload_last;
  assign hssl3_output_payload_fragment = area_hssl3_txram_output_payload_fragment;
  assign hssl3_input_ready = area_hssl3_rxram_input_ready;
  assign hssl4_output_valid = area_hssl4_txram_output_valid;
  assign hssl4_output_payload_last = area_hssl4_txram_output_payload_last;
  assign hssl4_output_payload_fragment = area_hssl4_txram_output_payload_fragment;
  assign hssl4_input_ready = area_hssl4_rxram_input_ready;
  assign area_hssl1_csr_reg_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign area_hssl2_csr_reg_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign area_hssl3_csr_reg_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign area_hssl4_csr_reg_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[3:0];
  assign area_hssl1_txram_apb_PADDR = apb3Router_1_io_outputs_4_PADDR[9:0];
  assign area_hssl1_rxram_apb_PADDR = apb3Router_1_io_outputs_5_PADDR[9:0];
  assign area_hssl2_txram_apb_PADDR = apb3Router_1_io_outputs_6_PADDR[9:0];
  assign area_hssl2_rxram_apb_PADDR = apb3Router_1_io_outputs_7_PADDR[9:0];
  assign area_hssl3_txram_apb_PADDR = apb3Router_1_io_outputs_8_PADDR[9:0];
  assign area_hssl3_rxram_apb_PADDR = apb3Router_1_io_outputs_9_PADDR[9:0];
  assign area_hssl4_txram_apb_PADDR = apb3Router_1_io_outputs_10_PADDR[9:0];
  assign area_hssl4_rxram_apb_PADDR = apb3Router_1_io_outputs_11_PADDR[9:0];
  assign _zz_emif_emif_data_read = emif_emif_data;

endmodule

module Apb3Router (
  input      [23:0]   io_input_PADDR,
  input      [11:0]   io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [23:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [31:0]   io_outputs_0_PWDATA,
  input      [31:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [23:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [31:0]   io_outputs_1_PWDATA,
  input      [31:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [23:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [31:0]   io_outputs_2_PWDATA,
  input      [31:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  output     [23:0]   io_outputs_3_PADDR,
  output     [0:0]    io_outputs_3_PSEL,
  output              io_outputs_3_PENABLE,
  input               io_outputs_3_PREADY,
  output              io_outputs_3_PWRITE,
  output     [31:0]   io_outputs_3_PWDATA,
  input      [31:0]   io_outputs_3_PRDATA,
  input               io_outputs_3_PSLVERROR,
  output     [23:0]   io_outputs_4_PADDR,
  output     [0:0]    io_outputs_4_PSEL,
  output              io_outputs_4_PENABLE,
  input               io_outputs_4_PREADY,
  output              io_outputs_4_PWRITE,
  output     [31:0]   io_outputs_4_PWDATA,
  input      [31:0]   io_outputs_4_PRDATA,
  input               io_outputs_4_PSLVERROR,
  output     [23:0]   io_outputs_5_PADDR,
  output     [0:0]    io_outputs_5_PSEL,
  output              io_outputs_5_PENABLE,
  input               io_outputs_5_PREADY,
  output              io_outputs_5_PWRITE,
  output     [31:0]   io_outputs_5_PWDATA,
  input      [31:0]   io_outputs_5_PRDATA,
  input               io_outputs_5_PSLVERROR,
  output     [23:0]   io_outputs_6_PADDR,
  output     [0:0]    io_outputs_6_PSEL,
  output              io_outputs_6_PENABLE,
  input               io_outputs_6_PREADY,
  output              io_outputs_6_PWRITE,
  output     [31:0]   io_outputs_6_PWDATA,
  input      [31:0]   io_outputs_6_PRDATA,
  input               io_outputs_6_PSLVERROR,
  output     [23:0]   io_outputs_7_PADDR,
  output     [0:0]    io_outputs_7_PSEL,
  output              io_outputs_7_PENABLE,
  input               io_outputs_7_PREADY,
  output              io_outputs_7_PWRITE,
  output     [31:0]   io_outputs_7_PWDATA,
  input      [31:0]   io_outputs_7_PRDATA,
  input               io_outputs_7_PSLVERROR,
  output     [23:0]   io_outputs_8_PADDR,
  output     [0:0]    io_outputs_8_PSEL,
  output              io_outputs_8_PENABLE,
  input               io_outputs_8_PREADY,
  output              io_outputs_8_PWRITE,
  output     [31:0]   io_outputs_8_PWDATA,
  input      [31:0]   io_outputs_8_PRDATA,
  input               io_outputs_8_PSLVERROR,
  output     [23:0]   io_outputs_9_PADDR,
  output     [0:0]    io_outputs_9_PSEL,
  output              io_outputs_9_PENABLE,
  input               io_outputs_9_PREADY,
  output              io_outputs_9_PWRITE,
  output     [31:0]   io_outputs_9_PWDATA,
  input      [31:0]   io_outputs_9_PRDATA,
  input               io_outputs_9_PSLVERROR,
  output     [23:0]   io_outputs_10_PADDR,
  output     [0:0]    io_outputs_10_PSEL,
  output              io_outputs_10_PENABLE,
  input               io_outputs_10_PREADY,
  output              io_outputs_10_PWRITE,
  output     [31:0]   io_outputs_10_PWDATA,
  input      [31:0]   io_outputs_10_PRDATA,
  input               io_outputs_10_PSLVERROR,
  output     [23:0]   io_outputs_11_PADDR,
  output     [0:0]    io_outputs_11_PSEL,
  output              io_outputs_11_PENABLE,
  input               io_outputs_11_PREADY,
  output              io_outputs_11_PWRITE,
  output     [31:0]   io_outputs_11_PWDATA,
  input      [31:0]   io_outputs_11_PRDATA,
  input               io_outputs_11_PSLVERROR,
  input               clk,
  input               reset
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  wire                _zz_selIndex_3;
  wire                _zz_selIndex_4;
  wire                _zz_selIndex_5;
  wire                _zz_selIndex_6;
  wire                _zz_selIndex_7;
  wire                _zz_selIndex_8;
  wire                _zz_selIndex_9;
  wire                _zz_selIndex_10;
  reg        [3:0]    selIndex;

  always @(*) begin
    case(selIndex)
      4'b0000 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      4'b0001 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      4'b0010 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      4'b0011 : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
      4'b0100 : begin
        _zz_io_input_PREADY = io_outputs_4_PREADY;
        _zz_io_input_PRDATA = io_outputs_4_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_4_PSLVERROR;
      end
      4'b0101 : begin
        _zz_io_input_PREADY = io_outputs_5_PREADY;
        _zz_io_input_PRDATA = io_outputs_5_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_5_PSLVERROR;
      end
      4'b0110 : begin
        _zz_io_input_PREADY = io_outputs_6_PREADY;
        _zz_io_input_PRDATA = io_outputs_6_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_6_PSLVERROR;
      end
      4'b0111 : begin
        _zz_io_input_PREADY = io_outputs_7_PREADY;
        _zz_io_input_PRDATA = io_outputs_7_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_7_PSLVERROR;
      end
      4'b1000 : begin
        _zz_io_input_PREADY = io_outputs_8_PREADY;
        _zz_io_input_PRDATA = io_outputs_8_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_8_PSLVERROR;
      end
      4'b1001 : begin
        _zz_io_input_PREADY = io_outputs_9_PREADY;
        _zz_io_input_PRDATA = io_outputs_9_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_9_PSLVERROR;
      end
      4'b1010 : begin
        _zz_io_input_PREADY = io_outputs_10_PREADY;
        _zz_io_input_PRDATA = io_outputs_10_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_10_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_11_PREADY;
        _zz_io_input_PRDATA = io_outputs_11_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_11_PSLVERROR;
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
  assign io_outputs_8_PADDR = io_input_PADDR;
  assign io_outputs_8_PENABLE = io_input_PENABLE;
  assign io_outputs_8_PSEL[0] = io_input_PSEL[8];
  assign io_outputs_8_PWRITE = io_input_PWRITE;
  assign io_outputs_8_PWDATA = io_input_PWDATA;
  assign io_outputs_9_PADDR = io_input_PADDR;
  assign io_outputs_9_PENABLE = io_input_PENABLE;
  assign io_outputs_9_PSEL[0] = io_input_PSEL[9];
  assign io_outputs_9_PWRITE = io_input_PWRITE;
  assign io_outputs_9_PWDATA = io_input_PWDATA;
  assign io_outputs_10_PADDR = io_input_PADDR;
  assign io_outputs_10_PENABLE = io_input_PENABLE;
  assign io_outputs_10_PSEL[0] = io_input_PSEL[10];
  assign io_outputs_10_PWRITE = io_input_PWRITE;
  assign io_outputs_10_PWDATA = io_input_PWDATA;
  assign io_outputs_11_PADDR = io_input_PADDR;
  assign io_outputs_11_PENABLE = io_input_PENABLE;
  assign io_outputs_11_PSEL[0] = io_input_PSEL[11];
  assign io_outputs_11_PWRITE = io_input_PWRITE;
  assign io_outputs_11_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = io_input_PSEL[5];
  assign _zz_selIndex_2 = io_input_PSEL[6];
  assign _zz_selIndex_3 = io_input_PSEL[7];
  assign _zz_selIndex_4 = io_input_PSEL[9];
  assign _zz_selIndex_5 = io_input_PSEL[10];
  assign _zz_selIndex_6 = io_input_PSEL[11];
  assign _zz_selIndex_7 = (((((io_input_PSEL[1] || _zz_selIndex) || _zz_selIndex_1) || _zz_selIndex_3) || _zz_selIndex_4) || _zz_selIndex_6);
  assign _zz_selIndex_8 = (((((io_input_PSEL[2] || _zz_selIndex) || _zz_selIndex_2) || _zz_selIndex_3) || _zz_selIndex_5) || _zz_selIndex_6);
  assign _zz_selIndex_9 = (((io_input_PSEL[4] || _zz_selIndex_1) || _zz_selIndex_2) || _zz_selIndex_3);
  assign _zz_selIndex_10 = (((io_input_PSEL[8] || _zz_selIndex_4) || _zz_selIndex_5) || _zz_selIndex_6);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge clk) begin
    selIndex <= {_zz_selIndex_10,{_zz_selIndex_9,{_zz_selIndex_8,_zz_selIndex_7}}};
  end


endmodule

module Apb3Decoder (
  input      [23:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [23:0]   io_output_PADDR,
  output reg [11:0]   io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 24'h00000f)) == 24'h010000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 24'h00000f)) == 24'h010040) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 24'h00000f)) == 24'h010080) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 24'h00000f)) == 24'h0100c0) && io_input_PSEL[0]);
    io_output_PSEL[4] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h010c00) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h010800) && io_input_PSEL[0]);
    io_output_PSEL[6] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h011400) && io_input_PSEL[0]);
    io_output_PSEL[7] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h011000) && io_input_PSEL[0]);
    io_output_PSEL[8] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h011c00) && io_input_PSEL[0]);
    io_output_PSEL[9] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h011800) && io_input_PSEL[0]);
    io_output_PSEL[10] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h012400) && io_input_PSEL[0]);
    io_output_PSEL[11] = (((io_input_PADDR & (~ 24'h0003ff)) == 24'h012000) && io_input_PSEL[0]);
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

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 12'h0));

endmodule

//Apb_RxRAM replaced by Apb_RxRAM

module Apb_TxRam_3 (
  input      [9:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               tx_clk,
  input               reset,
  input      [31:0]   tx_id,
  input               tx_packet_req
);

  wire       [7:0]    xilinx_bram_1_wr_addr;
  wire                xilinx_bram_1_rd_en;
  wire       [31:0]   xilinx_bram_1_rd_data;
  wire       [31:0]   tx_area_hssl_tx_s_axi_tx_tdata;
  wire       [3:0]    tx_area_hssl_tx_s_axi_tx_tkeep;
  wire                tx_area_hssl_tx_s_axi_tx_tlast;
  wire                tx_area_hssl_tx_s_axi_tx_tvalid;
  wire       [31:0]   tx_area_hssl_tx_crc_data;
  wire       [7:0]    tx_area_hssl_tx_tx_packet_addra;
  wire                tx_area_hssl_tx_tx_packet_rden;
  wire       [9:0]    _zz_busarea_memAddress;
  wire       [9:0]    _zz_busarea_memAddress_1;
  (* async_reg = "true" *) reg        [31:0]   busarea_tx_frame;
  wire                busarea_busctrl_askWrite;
  wire                busarea_busctrl_askRead;
  wire                busarea_busctrl_doWrite;
  wire                busarea_busctrl_doRead;
  wire       [7:0]    busarea_memAddress;
  reg        [31:0]   busarea_tx_frame_driver;

  assign _zz_busarea_memAddress_1 = (apb_PADDR - 10'h0);
  assign _zz_busarea_memAddress = _zz_busarea_memAddress_1;
  Xilinx_Bram xilinx_bram_1 (
    .wr_clk     (clk                                   ), //i
    .wr_en      (busarea_busctrl_doWrite               ), //i
    .wr_addr    (xilinx_bram_1_wr_addr[7:0]            ), //i
    .wr_data    (apb_PWDATA[31:0]                      ), //i
    .wr_rst     (1'b0                                  ), //i
    .rd_clk     (tx_clk                                ), //i
    .rd_en      (xilinx_bram_1_rd_en                   ), //i
    .rd_addr    (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //i
    .rd_data    (xilinx_bram_1_rd_data[31:0]           ), //o
    .rd_rst     (1'b0                                  )  //i
  );
  gtp_tx_3 tx_area_hssl_tx (
    .log_rst_q            (reset                                 ), //i
    .log_clk              (tx_clk                                ), //i
    .s_axi_tx_tdata       (tx_area_hssl_tx_s_axi_tx_tdata[31:0]  ), //o
    .s_axi_tx_tkeep       (tx_area_hssl_tx_s_axi_tx_tkeep[3:0]   ), //o
    .s_axi_tx_tlast       (tx_area_hssl_tx_s_axi_tx_tlast        ), //o
    .s_axi_tx_tvalid      (tx_area_hssl_tx_s_axi_tx_tvalid       ), //o
    .s_axi_tx_tready      (output_ready                          ), //i
    .tx_packet_gtxid      (tx_id[31:0]                           ), //i
    .tx_packet_head       (busarea_tx_frame[31:0]                ), //i
    .tx_packet_req        (tx_packet_req                         ), //i
    .tx_packet_trigger    (1'b0                                  ), //i
    .crc_data             (tx_area_hssl_tx_crc_data[31:0]        ), //o
    .tx_packet_addra      (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //o
    .tx_packet_data       (xilinx_bram_1_rd_data[31:0]           ), //i
    .tx_packet_rden       (tx_area_hssl_tx_tx_packet_rden        )  //o
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      10'h3fc : begin
        apb_PRDATA[31 : 0] = busarea_tx_frame_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign busarea_busctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busarea_busctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busarea_busctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busarea_busctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign busarea_memAddress = (_zz_busarea_memAddress >>> 2);
  assign xilinx_bram_1_wr_addr = busarea_memAddress;
  assign output_payload_fragment = tx_area_hssl_tx_s_axi_tx_tdata;
  assign output_payload_last = tx_area_hssl_tx_s_axi_tx_tlast;
  assign output_valid = tx_area_hssl_tx_s_axi_tx_tvalid;
  assign xilinx_bram_1_rd_en = (! tx_area_hssl_tx_tx_packet_rden);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busarea_tx_frame <= 32'h0;
    end else begin
      busarea_tx_frame <= busarea_tx_frame_driver;
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      10'h3fc : begin
        if(busarea_busctrl_doWrite) begin
          busarea_tx_frame_driver <= apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

//Apb_RxRAM replaced by Apb_RxRAM

module Apb_TxRam_2 (
  input      [9:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               tx_clk,
  input               reset,
  input      [31:0]   tx_id,
  input               tx_packet_req
);

  wire       [7:0]    xilinx_bram_1_wr_addr;
  wire                xilinx_bram_1_rd_en;
  wire       [31:0]   xilinx_bram_1_rd_data;
  wire       [31:0]   tx_area_hssl_tx_s_axi_tx_tdata;
  wire       [3:0]    tx_area_hssl_tx_s_axi_tx_tkeep;
  wire                tx_area_hssl_tx_s_axi_tx_tlast;
  wire                tx_area_hssl_tx_s_axi_tx_tvalid;
  wire       [31:0]   tx_area_hssl_tx_crc_data;
  wire       [7:0]    tx_area_hssl_tx_tx_packet_addra;
  wire                tx_area_hssl_tx_tx_packet_rden;
  wire       [9:0]    _zz_busarea_memAddress;
  wire       [9:0]    _zz_busarea_memAddress_1;
  (* async_reg = "true" *) reg        [31:0]   busarea_tx_frame;
  wire                busarea_busctrl_askWrite;
  wire                busarea_busctrl_askRead;
  wire                busarea_busctrl_doWrite;
  wire                busarea_busctrl_doRead;
  wire       [7:0]    busarea_memAddress;
  reg        [31:0]   busarea_tx_frame_driver;

  assign _zz_busarea_memAddress_1 = (apb_PADDR - 10'h0);
  assign _zz_busarea_memAddress = _zz_busarea_memAddress_1;
  Xilinx_Bram xilinx_bram_1 (
    .wr_clk     (clk                                   ), //i
    .wr_en      (busarea_busctrl_doWrite               ), //i
    .wr_addr    (xilinx_bram_1_wr_addr[7:0]            ), //i
    .wr_data    (apb_PWDATA[31:0]                      ), //i
    .wr_rst     (1'b0                                  ), //i
    .rd_clk     (tx_clk                                ), //i
    .rd_en      (xilinx_bram_1_rd_en                   ), //i
    .rd_addr    (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //i
    .rd_data    (xilinx_bram_1_rd_data[31:0]           ), //o
    .rd_rst     (1'b0                                  )  //i
  );
  gtp_tx_2 tx_area_hssl_tx (
    .log_rst_q            (reset                                 ), //i
    .log_clk              (tx_clk                                ), //i
    .s_axi_tx_tdata       (tx_area_hssl_tx_s_axi_tx_tdata[31:0]  ), //o
    .s_axi_tx_tkeep       (tx_area_hssl_tx_s_axi_tx_tkeep[3:0]   ), //o
    .s_axi_tx_tlast       (tx_area_hssl_tx_s_axi_tx_tlast        ), //o
    .s_axi_tx_tvalid      (tx_area_hssl_tx_s_axi_tx_tvalid       ), //o
    .s_axi_tx_tready      (output_ready                          ), //i
    .tx_packet_gtxid      (tx_id[31:0]                           ), //i
    .tx_packet_head       (busarea_tx_frame[31:0]                ), //i
    .tx_packet_req        (tx_packet_req                         ), //i
    .tx_packet_trigger    (1'b0                                  ), //i
    .crc_data             (tx_area_hssl_tx_crc_data[31:0]        ), //o
    .tx_packet_addra      (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //o
    .tx_packet_data       (xilinx_bram_1_rd_data[31:0]           ), //i
    .tx_packet_rden       (tx_area_hssl_tx_tx_packet_rden        )  //o
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      10'h3fc : begin
        apb_PRDATA[31 : 0] = busarea_tx_frame_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign busarea_busctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busarea_busctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busarea_busctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busarea_busctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign busarea_memAddress = (_zz_busarea_memAddress >>> 2);
  assign xilinx_bram_1_wr_addr = busarea_memAddress;
  assign output_payload_fragment = tx_area_hssl_tx_s_axi_tx_tdata;
  assign output_payload_last = tx_area_hssl_tx_s_axi_tx_tlast;
  assign output_valid = tx_area_hssl_tx_s_axi_tx_tvalid;
  assign xilinx_bram_1_rd_en = (! tx_area_hssl_tx_tx_packet_rden);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busarea_tx_frame <= 32'h0;
    end else begin
      busarea_tx_frame <= busarea_tx_frame_driver;
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      10'h3fc : begin
        if(busarea_busctrl_doWrite) begin
          busarea_tx_frame_driver <= apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

//Apb_RxRAM replaced by Apb_RxRAM

module Apb_TxRam_1 (
  input      [9:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               tx_clk,
  input               reset,
  input      [31:0]   tx_id,
  input               tx_packet_req
);

  wire       [7:0]    xilinx_bram_1_wr_addr;
  wire                xilinx_bram_1_rd_en;
  wire       [31:0]   xilinx_bram_1_rd_data;
  wire       [31:0]   tx_area_hssl_tx_s_axi_tx_tdata;
  wire       [3:0]    tx_area_hssl_tx_s_axi_tx_tkeep;
  wire                tx_area_hssl_tx_s_axi_tx_tlast;
  wire                tx_area_hssl_tx_s_axi_tx_tvalid;
  wire       [31:0]   tx_area_hssl_tx_crc_data;
  wire       [7:0]    tx_area_hssl_tx_tx_packet_addra;
  wire                tx_area_hssl_tx_tx_packet_rden;
  wire       [9:0]    _zz_busarea_memAddress;
  wire       [9:0]    _zz_busarea_memAddress_1;
  (* async_reg = "true" *) reg        [31:0]   busarea_tx_frame;
  wire                busarea_busctrl_askWrite;
  wire                busarea_busctrl_askRead;
  wire                busarea_busctrl_doWrite;
  wire                busarea_busctrl_doRead;
  wire       [7:0]    busarea_memAddress;
  reg        [31:0]   busarea_tx_frame_driver;

  assign _zz_busarea_memAddress_1 = (apb_PADDR - 10'h0);
  assign _zz_busarea_memAddress = _zz_busarea_memAddress_1;
  Xilinx_Bram xilinx_bram_1 (
    .wr_clk     (clk                                   ), //i
    .wr_en      (busarea_busctrl_doWrite               ), //i
    .wr_addr    (xilinx_bram_1_wr_addr[7:0]            ), //i
    .wr_data    (apb_PWDATA[31:0]                      ), //i
    .wr_rst     (1'b0                                  ), //i
    .rd_clk     (tx_clk                                ), //i
    .rd_en      (xilinx_bram_1_rd_en                   ), //i
    .rd_addr    (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //i
    .rd_data    (xilinx_bram_1_rd_data[31:0]           ), //o
    .rd_rst     (1'b0                                  )  //i
  );
  gtp_tx_1 tx_area_hssl_tx (
    .log_rst_q            (reset                                 ), //i
    .log_clk              (tx_clk                                ), //i
    .s_axi_tx_tdata       (tx_area_hssl_tx_s_axi_tx_tdata[31:0]  ), //o
    .s_axi_tx_tkeep       (tx_area_hssl_tx_s_axi_tx_tkeep[3:0]   ), //o
    .s_axi_tx_tlast       (tx_area_hssl_tx_s_axi_tx_tlast        ), //o
    .s_axi_tx_tvalid      (tx_area_hssl_tx_s_axi_tx_tvalid       ), //o
    .s_axi_tx_tready      (output_ready                          ), //i
    .tx_packet_gtxid      (tx_id[31:0]                           ), //i
    .tx_packet_head       (busarea_tx_frame[31:0]                ), //i
    .tx_packet_req        (tx_packet_req                         ), //i
    .tx_packet_trigger    (1'b0                                  ), //i
    .crc_data             (tx_area_hssl_tx_crc_data[31:0]        ), //o
    .tx_packet_addra      (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //o
    .tx_packet_data       (xilinx_bram_1_rd_data[31:0]           ), //i
    .tx_packet_rden       (tx_area_hssl_tx_tx_packet_rden        )  //o
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      10'h3fc : begin
        apb_PRDATA[31 : 0] = busarea_tx_frame_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign busarea_busctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busarea_busctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busarea_busctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busarea_busctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign busarea_memAddress = (_zz_busarea_memAddress >>> 2);
  assign xilinx_bram_1_wr_addr = busarea_memAddress;
  assign output_payload_fragment = tx_area_hssl_tx_s_axi_tx_tdata;
  assign output_payload_last = tx_area_hssl_tx_s_axi_tx_tlast;
  assign output_valid = tx_area_hssl_tx_s_axi_tx_tvalid;
  assign xilinx_bram_1_rd_en = (! tx_area_hssl_tx_tx_packet_rden);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busarea_tx_frame <= 32'h0;
    end else begin
      busarea_tx_frame <= busarea_tx_frame_driver;
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      10'h3fc : begin
        if(busarea_busctrl_doWrite) begin
          busarea_tx_frame_driver <= apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb_RxRAM (
  input      [9:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  input               clk,
  input               rx_clk,
  input               reset,
  input      [31:0]   rx_id
);

  wire                xilinx_bram_1_rd_en;
  wire       [7:0]    xilinx_bram_1_rd_addr;
  wire       [31:0]   xilinx_bram_1_rd_data;
  wire                rx_area_hssl_rx_gtp_rx_done;
  wire                rx_area_hssl_rx_gtp_rx_trigger;
  wire       [7:0]    rx_area_hssl_rx_packet_data_addr;
  wire                rx_area_hssl_rx_packet_data_wr;
  wire       [31:0]   rx_area_hssl_rx_gtx_rd_id;
  wire                rx_area_hssl_rx_gtx_id_error;
  wire       [31:0]   rx_area_hssl_rx_packet_data_head;
  wire       [9:0]    _zz_busarea_memAddress;
  wire       [9:0]    _zz_busarea_memAddress_1;
  wire                busarea_busctrl_askWrite;
  wire                busarea_busctrl_askRead;
  wire                busarea_busctrl_doWrite;
  wire                busarea_busctrl_doRead;
  wire       [7:0]    busarea_memAddress;
  wire                when_Apb3SlaveFactory_l82;

  assign _zz_busarea_memAddress_1 = (apb_PADDR & 10'h3ff);
  assign _zz_busarea_memAddress = _zz_busarea_memAddress_1;
  Xilinx_Bram xilinx_bram_1 (
    .wr_clk     (rx_clk                                 ), //i
    .wr_en      (rx_area_hssl_rx_packet_data_wr         ), //i
    .wr_addr    (rx_area_hssl_rx_packet_data_addr[7:0]  ), //i
    .wr_data    (input_payload_fragment[31:0]           ), //i
    .wr_rst     (1'b0                                   ), //i
    .rd_clk     (clk                                    ), //i
    .rd_en      (xilinx_bram_1_rd_en                    ), //i
    .rd_addr    (xilinx_bram_1_rd_addr[7:0]             ), //i
    .rd_data    (xilinx_bram_1_rd_data[31:0]            ), //o
    .rd_rst     (1'b0                                   )  //i
  );
  gtp_rx rx_area_hssl_rx (
    .log_clk             (rx_clk                                  ), //i
    .log_rst_q           (reset                                   ), //i
    .m_axi_rx_tdata      (input_payload_fragment[31:0]            ), //i
    .m_axi_rx_tvalid     (input_valid                             ), //i
    .m_axi_rx_tlast      (input_payload_last                      ), //i
    .gtp_rx_done         (rx_area_hssl_rx_gtp_rx_done             ), //o
    .gtp_rx_trigger      (rx_area_hssl_rx_gtp_rx_trigger          ), //o
    .packet_data_addr    (rx_area_hssl_rx_packet_data_addr[7:0]   ), //o
    .packet_data_wr      (rx_area_hssl_rx_packet_data_wr          ), //o
    .gtx_id              (rx_id[31:0]                             ), //i
    .gtx_rd_id           (rx_area_hssl_rx_gtx_rd_id[31:0]         ), //o
    .gtx_id_error        (rx_area_hssl_rx_gtx_id_error            ), //o
    .packet_data_head    (rx_area_hssl_rx_packet_data_head[31:0]  )  //o
  );
  assign input_ready = 1'b1;
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    if(when_Apb3SlaveFactory_l82) begin
      apb_PRDATA[31 : 0] = xilinx_bram_1_rd_data;
    end
  end

  assign apb_PSLVERROR = 1'b0;
  assign busarea_busctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busarea_busctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busarea_busctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busarea_busctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign xilinx_bram_1_rd_en = apb_PSEL[0];
  assign busarea_memAddress = (_zz_busarea_memAddress >>> 2);
  assign xilinx_bram_1_rd_addr = busarea_memAddress;
  assign when_Apb3SlaveFactory_l82 = ((apb_PADDR & (~ 10'h3ff)) == 10'h0);

endmodule

module Apb_TxRam (
  input      [9:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               tx_clk,
  input               reset,
  input      [31:0]   tx_id,
  input               tx_packet_req
);

  wire       [7:0]    xilinx_bram_1_wr_addr;
  wire                xilinx_bram_1_rd_en;
  wire       [31:0]   xilinx_bram_1_rd_data;
  wire       [31:0]   tx_area_hssl_tx_s_axi_tx_tdata;
  wire       [3:0]    tx_area_hssl_tx_s_axi_tx_tkeep;
  wire                tx_area_hssl_tx_s_axi_tx_tlast;
  wire                tx_area_hssl_tx_s_axi_tx_tvalid;
  wire       [31:0]   tx_area_hssl_tx_crc_data;
  wire       [7:0]    tx_area_hssl_tx_tx_packet_addra;
  wire                tx_area_hssl_tx_tx_packet_rden;
  wire       [9:0]    _zz_busarea_memAddress;
  wire       [9:0]    _zz_busarea_memAddress_1;
  (* async_reg = "true" *) reg        [31:0]   busarea_tx_frame;
  wire                busarea_busctrl_askWrite;
  wire                busarea_busctrl_askRead;
  wire                busarea_busctrl_doWrite;
  wire                busarea_busctrl_doRead;
  wire       [7:0]    busarea_memAddress;
  reg        [31:0]   busarea_tx_frame_driver;

  assign _zz_busarea_memAddress_1 = (apb_PADDR - 10'h0);
  assign _zz_busarea_memAddress = _zz_busarea_memAddress_1;
  Xilinx_Bram xilinx_bram_1 (
    .wr_clk     (clk                                   ), //i
    .wr_en      (busarea_busctrl_doWrite               ), //i
    .wr_addr    (xilinx_bram_1_wr_addr[7:0]            ), //i
    .wr_data    (apb_PWDATA[31:0]                      ), //i
    .wr_rst     (1'b0                                  ), //i
    .rd_clk     (tx_clk                                ), //i
    .rd_en      (xilinx_bram_1_rd_en                   ), //i
    .rd_addr    (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //i
    .rd_data    (xilinx_bram_1_rd_data[31:0]           ), //o
    .rd_rst     (1'b0                                  )  //i
  );
  gtp_tx tx_area_hssl_tx (
    .log_rst_q            (reset                                 ), //i
    .log_clk              (tx_clk                                ), //i
    .s_axi_tx_tdata       (tx_area_hssl_tx_s_axi_tx_tdata[31:0]  ), //o
    .s_axi_tx_tkeep       (tx_area_hssl_tx_s_axi_tx_tkeep[3:0]   ), //o
    .s_axi_tx_tlast       (tx_area_hssl_tx_s_axi_tx_tlast        ), //o
    .s_axi_tx_tvalid      (tx_area_hssl_tx_s_axi_tx_tvalid       ), //o
    .s_axi_tx_tready      (output_ready                          ), //i
    .tx_packet_gtxid      (tx_id[31:0]                           ), //i
    .tx_packet_head       (busarea_tx_frame[31:0]                ), //i
    .tx_packet_req        (tx_packet_req                         ), //i
    .tx_packet_trigger    (1'b0                                  ), //i
    .crc_data             (tx_area_hssl_tx_crc_data[31:0]        ), //o
    .tx_packet_addra      (tx_area_hssl_tx_tx_packet_addra[7:0]  ), //o
    .tx_packet_data       (xilinx_bram_1_rd_data[31:0]           ), //i
    .tx_packet_rden       (tx_area_hssl_tx_tx_packet_rden        )  //o
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      10'h3fc : begin
        apb_PRDATA[31 : 0] = busarea_tx_frame_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign busarea_busctrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busarea_busctrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busarea_busctrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busarea_busctrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign busarea_memAddress = (_zz_busarea_memAddress >>> 2);
  assign xilinx_bram_1_wr_addr = busarea_memAddress;
  assign output_payload_fragment = tx_area_hssl_tx_s_axi_tx_tdata;
  assign output_payload_last = tx_area_hssl_tx_s_axi_tx_tlast;
  assign output_valid = tx_area_hssl_tx_s_axi_tx_tvalid;
  assign xilinx_bram_1_rd_en = (! tx_area_hssl_tx_tx_packet_rden);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busarea_tx_frame <= 32'h0;
    end else begin
      busarea_tx_frame <= busarea_tx_frame_driver;
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      10'h3fc : begin
        if(busarea_busctrl_doWrite) begin
          busarea_tx_frame_driver <= apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

//Apb_CsrReg replaced by Apb_CsrReg

//Apb_CsrReg replaced by Apb_CsrReg

//Apb_CsrReg replaced by Apb_CsrReg

module Apb_CsrReg (
  input      [3:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  input      [31:0]   hssl_sts,
  output              hssl_ctl_rst,
  output              hssl_ctl_send,
  output              hssl_ctl_trigger,
  input               clk,
  input               reset
);

  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [31:0]   hssl_sts_1;
  reg        [31:0]   hssl_ctl_reg;
  reg        [31:0]   hssl_sr_reg;
  reg        [0:0]    Hssl_CTL_RST_1;
  reg                 _zz_Hssl_CTL_RST;
  (* async_reg = "true" *) reg        [0:0]    Hssl_CTL_SEND_1;
  reg                 _zz_Hssl_CTL_SEND;
  reg        [0:0]    Hssl_CTL_TRIGGER_1;
  reg                 _zz_Hssl_CTL_TRIGGER;
  reg        [31:0]   hssl_ctl_reg_driver;
  reg        [31:0]   hssl_sr_reg_driver;
  reg        [0:0]    Hssl_CTL_RST_1_delay_1;
  reg        [0:0]    Hssl_CTL_RST_1_delay_1_1;
  reg        [0:0]    Hssl_CTL_RST_1_delay_2;
  reg        [0:0]    Hssl_CTL_SEND_1_delay_1;
  reg        [0:0]    Hssl_CTL_SEND_1_delay_1_1;
  reg        [0:0]    Hssl_CTL_SEND_1_delay_2;
  reg        [0:0]    Hssl_CTL_TRIGGER_1_delay_1;
  reg        [0:0]    Hssl_CTL_TRIGGER_1_delay_1_1;
  reg        [0:0]    Hssl_CTL_TRIGGER_1_delay_2;

  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      4'b0000 : begin
        apb_PRDATA[31 : 0] = hssl_sts_1;
      end
      4'b0100 : begin
        apb_PRDATA[31 : 0] = hssl_ctl_reg_driver;
      end
      4'b1000 : begin
        apb_PRDATA[31 : 0] = hssl_sr_reg_driver;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign busCtrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busCtrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busCtrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busCtrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(*) begin
    _zz_Hssl_CTL_RST = 1'b0;
    case(apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doWrite) begin
          _zz_Hssl_CTL_RST = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_Hssl_CTL_SEND = 1'b0;
    case(apb_PADDR)
      4'b0100 : begin
        if(busCtrl_doWrite) begin
          _zz_Hssl_CTL_SEND = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_Hssl_CTL_TRIGGER = 1'b0;
    case(apb_PADDR)
      4'b1000 : begin
        if(busCtrl_doWrite) begin
          _zz_Hssl_CTL_TRIGGER = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign hssl_ctl_rst = ((Hssl_CTL_RST_1[0] || Hssl_CTL_RST_1_delay_1[0]) || Hssl_CTL_RST_1_delay_2[0]);
  assign hssl_ctl_send = ((Hssl_CTL_SEND_1[0] || Hssl_CTL_SEND_1_delay_1[0]) || Hssl_CTL_SEND_1_delay_2[0]);
  assign hssl_ctl_trigger = ((Hssl_CTL_TRIGGER_1[0] || Hssl_CTL_TRIGGER_1_delay_1[0]) || Hssl_CTL_TRIGGER_1_delay_2[0]);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      hssl_sts_1 <= 32'h0;
      hssl_ctl_reg <= 32'h0;
      hssl_sr_reg <= 32'h0;
      Hssl_CTL_RST_1 <= 1'b0;
      Hssl_CTL_SEND_1 <= 1'b0;
      Hssl_CTL_TRIGGER_1 <= 1'b0;
      Hssl_CTL_RST_1_delay_1 <= 1'b0;
      Hssl_CTL_RST_1_delay_1_1 <= 1'b0;
      Hssl_CTL_RST_1_delay_2 <= 1'b0;
      Hssl_CTL_SEND_1_delay_1 <= 1'b0;
      Hssl_CTL_SEND_1_delay_1_1 <= 1'b0;
      Hssl_CTL_SEND_1_delay_2 <= 1'b0;
      Hssl_CTL_TRIGGER_1_delay_1 <= 1'b0;
      Hssl_CTL_TRIGGER_1_delay_1_1 <= 1'b0;
      Hssl_CTL_TRIGGER_1_delay_2 <= 1'b0;
    end else begin
      hssl_sts_1 <= hssl_sts;
      Hssl_CTL_RST_1 <= (hssl_ctl_reg[0] && _zz_Hssl_CTL_RST);
      Hssl_CTL_SEND_1 <= (hssl_ctl_reg[2] && _zz_Hssl_CTL_SEND);
      Hssl_CTL_TRIGGER_1 <= (hssl_ctl_reg[7] && _zz_Hssl_CTL_TRIGGER);
      hssl_ctl_reg <= hssl_ctl_reg_driver;
      hssl_sr_reg <= hssl_sr_reg_driver;
      Hssl_CTL_RST_1_delay_1 <= Hssl_CTL_RST_1;
      Hssl_CTL_RST_1_delay_1_1 <= Hssl_CTL_RST_1;
      Hssl_CTL_RST_1_delay_2 <= Hssl_CTL_RST_1_delay_1_1;
      Hssl_CTL_SEND_1_delay_1 <= Hssl_CTL_SEND_1;
      Hssl_CTL_SEND_1_delay_1_1 <= Hssl_CTL_SEND_1;
      Hssl_CTL_SEND_1_delay_2 <= Hssl_CTL_SEND_1_delay_1_1;
      Hssl_CTL_TRIGGER_1_delay_1 <= Hssl_CTL_TRIGGER_1;
      Hssl_CTL_TRIGGER_1_delay_1_1 <= Hssl_CTL_TRIGGER_1;
      Hssl_CTL_TRIGGER_1_delay_2 <= Hssl_CTL_TRIGGER_1_delay_1_1;
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      4'b0100 : begin
        if(busCtrl_doWrite) begin
          hssl_ctl_reg_driver <= apb_PWDATA[31 : 0];
        end
      end
      4'b1000 : begin
        if(busCtrl_doWrite) begin
          hssl_sr_reg_driver <= apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module EMIF32_Apb (
  input      [23:0]   emif_emif_addr,
  input      [15:0]   emif_emif_data_read,
  output     [15:0]   emif_emif_data_write,
  output              emif_emif_data_writeEnable,
  input               emif_emif_cs,
  input               emif_emif_we,
  input               emif_emif_oe,
  output     [23:0]   apb_PADDR,
  output     [0:0]    apb_PSEL,
  output              apb_PENABLE,
  input               apb_PREADY,
  output              apb_PWRITE,
  output     [31:0]   apb_PWDATA,
  input      [31:0]   apb_PRDATA,
  input               apb_PSLVERROR,
  input               clk,
  input               reset
);

  wire       [24:0]   _zz_apb_PADDR;
  reg                 penable;
  reg        [31:0]   wr_datatemp;
  wire       [15:0]   rd_datatemp;
  reg                 penable_regNext;
  wire                when_EMIF32_l34;
  wire                when_EMIF32_l36;

  assign _zz_apb_PADDR = ({2'd0,emif_emif_addr[22 : 0]} <<< 2);
  assign rd_datatemp = 16'h0;
  assign apb_PADDR = _zz_apb_PADDR[23:0];
  assign apb_PSEL = (~ emif_emif_cs);
  assign apb_PENABLE = ((penable && (! penable_regNext)) ? penable : 1'b0);
  assign apb_PWRITE = (((! emif_emif_we) && emif_emif_oe) && emif_emif_addr[23]);
  assign emif_emif_data_writeEnable = (! emif_emif_oe);
  assign emif_emif_data_write = ((! emif_emif_addr[23]) ? apb_PRDATA[15 : 0] : apb_PRDATA[31 : 16]);
  assign when_EMIF32_l34 = (((! emif_emif_we) && emif_emif_oe) && (! emif_emif_addr[23]));
  assign when_EMIF32_l36 = (((! emif_emif_we) && emif_emif_oe) && emif_emif_addr[23]);
  assign apb_PWDATA = wr_datatemp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      penable <= 1'b0;
      wr_datatemp <= 32'h0;
    end else begin
      penable <= ((! emif_emif_oe) || (! emif_emif_we));
      if(when_EMIF32_l34) begin
        wr_datatemp[15 : 0] <= emif_emif_data_read;
      end else begin
        if(when_EMIF32_l36) begin
          wr_datatemp[31 : 16] <= emif_emif_data_read;
        end
      end
    end
  end

  always @(posedge clk) begin
    penable_regNext <= penable;
  end


endmodule

module gtp_tx_3 (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output     [3:0]    s_axi_tx_tkeep,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready,
  input      [31:0]   tx_packet_gtxid,
  input      [31:0]   tx_packet_head,
  input               tx_packet_req,
  input               tx_packet_trigger,
  output     [31:0]   crc_data,
  output     [7:0]    tx_packet_addra,
  input      [31:0]   tx_packet_data,
  output              tx_packet_rden
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;
  localparam tx_area_fsm_enumDef_3_BOOT = 3'd0;
  localparam tx_area_fsm_enumDef_3_Wait_Start = 3'd1;
  localparam tx_area_fsm_enumDef_3_Send_Head = 3'd2;
  localparam tx_area_fsm_enumDef_3_Send_Id = 3'd3;
  localparam tx_area_fsm_enumDef_3_Send_Length = 3'd4;
  localparam tx_area_fsm_enumDef_3_Send_Data = 3'd5;
  localparam tx_area_fsm_enumDef_3_Send_Crc = 3'd6;
  localparam tx_area_fsm_enumDef_3_Send_End = 3'd7;

  reg        [0:0]    tx_area_crc32_io_cmd_payload_mode;
  wire       [31:0]   tx_area_crc32_io_crc;
  wire       [31:0]   tx_area_crc32_io_nextcrc;
  wire                tx_area_streamfifo_io_push_ready;
  wire                tx_area_streamfifo_io_pop_valid;
  wire       [31:0]   tx_area_streamfifo_io_pop_payload;
  wire       [6:0]    tx_area_streamfifo_io_occupancy;
  wire       [6:0]    tx_area_streamfifo_io_availability;
  wire       [7:0]    _zz_when_gtp_tx_l100;
  reg                 tx_area_valid;
  reg                 tx_area_last;
  reg        [31:0]   tx_area_data;
  reg        [7:0]    tx_area_rd_addr;
  reg                 tx_area_rd_rden;
  reg        [7:0]    tx_area_length;
  reg                 tx_area_mode;
  wire                when_gtp_tx_l41;
  (* async_reg = "true" *) reg                 tx_area_tx_packet_req;
  wire                tx_area_fsm_wantExit;
  reg                 tx_area_fsm_wantStart;
  wire                tx_area_fsm_wantKill;
  reg        [2:0]    tx_area_fsm_stateReg;
  reg        [2:0]    tx_area_fsm_stateNext;
  reg                 tx_area_tx_packet_req_regNext;
  wire                when_gtp_tx_l55;
  wire                when_gtp_tx_l75;
  wire                when_gtp_tx_l78;
  wire                when_gtp_tx_l100;
  `ifndef SYNTHESIS
  reg [87:0] tx_area_fsm_stateReg_string;
  reg [87:0] tx_area_fsm_stateNext_string;
  `endif


  assign _zz_when_gtp_tx_l100 = (tx_packet_head[7 : 0] - 8'h01);
  CRCCombinational tx_area_crc32 (
    .io_cmd_valid           (tx_area_valid                      ), //i
    .io_cmd_payload_mode    (tx_area_crc32_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (tx_area_data[31:0]                 ), //i
    .io_crc                 (tx_area_crc32_io_crc[31:0]         ), //o
    .io_nextcrc             (tx_area_crc32_io_nextcrc[31:0]     ), //o
    .log_clk                (log_clk                            ), //i
    .log_rst_q              (log_rst_q                          )  //i
  );
  StreamFifo tx_area_streamfifo (
    .io_push_valid      (tx_area_valid                            ), //i
    .io_push_ready      (tx_area_streamfifo_io_push_ready         ), //o
    .io_push_payload    (tx_area_data[31:0]                       ), //i
    .io_pop_valid       (tx_area_streamfifo_io_pop_valid          ), //o
    .io_pop_ready       (s_axi_tx_tready                          ), //i
    .io_pop_payload     (tx_area_streamfifo_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                                     ), //i
    .io_occupancy       (tx_area_streamfifo_io_occupancy[6:0]     ), //o
    .io_availability    (tx_area_streamfifo_io_availability[6:0]  ), //o
    .log_clk            (log_clk                                  ), //i
    .log_rst_q          (log_rst_q                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_3_BOOT : tx_area_fsm_stateReg_string = "BOOT       ";
      tx_area_fsm_enumDef_3_Wait_Start : tx_area_fsm_stateReg_string = "Wait_Start ";
      tx_area_fsm_enumDef_3_Send_Head : tx_area_fsm_stateReg_string = "Send_Head  ";
      tx_area_fsm_enumDef_3_Send_Id : tx_area_fsm_stateReg_string = "Send_Id    ";
      tx_area_fsm_enumDef_3_Send_Length : tx_area_fsm_stateReg_string = "Send_Length";
      tx_area_fsm_enumDef_3_Send_Data : tx_area_fsm_stateReg_string = "Send_Data  ";
      tx_area_fsm_enumDef_3_Send_Crc : tx_area_fsm_stateReg_string = "Send_Crc   ";
      tx_area_fsm_enumDef_3_Send_End : tx_area_fsm_stateReg_string = "Send_End   ";
      default : tx_area_fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(tx_area_fsm_stateNext)
      tx_area_fsm_enumDef_3_BOOT : tx_area_fsm_stateNext_string = "BOOT       ";
      tx_area_fsm_enumDef_3_Wait_Start : tx_area_fsm_stateNext_string = "Wait_Start ";
      tx_area_fsm_enumDef_3_Send_Head : tx_area_fsm_stateNext_string = "Send_Head  ";
      tx_area_fsm_enumDef_3_Send_Id : tx_area_fsm_stateNext_string = "Send_Id    ";
      tx_area_fsm_enumDef_3_Send_Length : tx_area_fsm_stateNext_string = "Send_Length";
      tx_area_fsm_enumDef_3_Send_Data : tx_area_fsm_stateNext_string = "Send_Data  ";
      tx_area_fsm_enumDef_3_Send_Crc : tx_area_fsm_stateNext_string = "Send_Crc   ";
      tx_area_fsm_enumDef_3_Send_End : tx_area_fsm_stateNext_string = "Send_End   ";
      default : tx_area_fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign when_gtp_tx_l41 = (! tx_area_mode);
  always @(*) begin
    if(when_gtp_tx_l41) begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_INIT;
    end else begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
    end
  end

  assign tx_area_fsm_wantExit = 1'b0;
  always @(*) begin
    tx_area_fsm_wantStart = 1'b0;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_3_Wait_Start : begin
      end
      tx_area_fsm_enumDef_3_Send_Head : begin
      end
      tx_area_fsm_enumDef_3_Send_Id : begin
      end
      tx_area_fsm_enumDef_3_Send_Length : begin
      end
      tx_area_fsm_enumDef_3_Send_Data : begin
      end
      tx_area_fsm_enumDef_3_Send_Crc : begin
      end
      tx_area_fsm_enumDef_3_Send_End : begin
      end
      default : begin
        tx_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign tx_area_fsm_wantKill = 1'b0;
  assign crc_data = tx_area_crc32_io_nextcrc;
  assign tx_packet_addra = tx_area_rd_addr;
  assign tx_packet_rden = tx_area_rd_rden;
  assign s_axi_tx_tkeep = 4'b1111;
  assign s_axi_tx_tdata = tx_area_streamfifo_io_pop_payload;
  assign s_axi_tx_tvalid = tx_area_streamfifo_io_pop_valid;
  assign s_axi_tx_tlast = (((tx_area_streamfifo_io_occupancy == 7'h01) && s_axi_tx_tready) && s_axi_tx_tvalid);
  always @(*) begin
    tx_area_fsm_stateNext = tx_area_fsm_stateReg;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_3_Wait_Start : begin
        if(when_gtp_tx_l55) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Send_Head;
        end else begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Wait_Start;
        end
      end
      tx_area_fsm_enumDef_3_Send_Head : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Send_Id;
      end
      tx_area_fsm_enumDef_3_Send_Id : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Send_Length;
      end
      tx_area_fsm_enumDef_3_Send_Length : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Send_Data;
      end
      tx_area_fsm_enumDef_3_Send_Data : begin
        if(!when_gtp_tx_l100) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Send_Crc;
        end
      end
      tx_area_fsm_enumDef_3_Send_Crc : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Send_End;
      end
      tx_area_fsm_enumDef_3_Send_End : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Wait_Start;
      end
      default : begin
      end
    endcase
    if(tx_area_fsm_wantStart) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_Wait_Start;
    end
    if(tx_area_fsm_wantKill) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_3_BOOT;
    end
  end

  assign when_gtp_tx_l55 = (tx_area_tx_packet_req && (! tx_area_tx_packet_req_regNext));
  assign when_gtp_tx_l75 = (tx_packet_head[15 : 0] == 16'h0001);
  assign when_gtp_tx_l78 = (tx_packet_head[15 : 8] == 8'h0);
  assign when_gtp_tx_l100 = (tx_area_length < _zz_when_gtp_tx_l100);
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      tx_area_valid <= 1'b0;
      tx_area_last <= 1'b0;
      tx_area_data <= 32'h0;
      tx_area_rd_addr <= 8'h0;
      tx_area_rd_rden <= 1'b1;
      tx_area_length <= 8'h0;
      tx_area_mode <= 1'b0;
      tx_area_tx_packet_req <= 1'b0;
      tx_area_fsm_stateReg <= tx_area_fsm_enumDef_3_BOOT;
    end else begin
      tx_area_tx_packet_req <= tx_packet_req;
      tx_area_fsm_stateReg <= tx_area_fsm_stateNext;
      case(tx_area_fsm_stateReg)
        tx_area_fsm_enumDef_3_Wait_Start : begin
          tx_area_valid <= 1'b0;
          tx_area_last <= 1'b0;
        end
        tx_area_fsm_enumDef_3_Send_Head : begin
          tx_area_mode <= 1'b0;
          tx_area_valid <= 1'b1;
          tx_area_data <= 32'h0000ffbc;
        end
        tx_area_fsm_enumDef_3_Send_Id : begin
          tx_area_valid <= 1'b1;
          tx_area_mode <= 1'b1;
          tx_area_data <= tx_packet_gtxid;
          if(when_gtp_tx_l75) begin
            tx_area_rd_addr <= 8'h0;
          end else begin
            if(when_gtp_tx_l78) begin
              tx_area_rd_addr <= 8'h01;
            end else begin
              tx_area_rd_addr <= tx_packet_head[15 : 8];
            end
          end
          tx_area_rd_rden <= 1'b0;
        end
        tx_area_fsm_enumDef_3_Send_Length : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_head;
          tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
        end
        tx_area_fsm_enumDef_3_Send_Data : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_data;
          if(when_gtp_tx_l100) begin
            tx_area_length <= (tx_area_length + 8'h01);
            tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
          end else begin
            tx_area_length <= 8'h0;
            tx_area_rd_addr <= 8'h0;
            tx_area_rd_rden <= 1'b1;
          end
        end
        tx_area_fsm_enumDef_3_Send_Crc : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_area_crc32_io_nextcrc;
        end
        tx_area_fsm_enumDef_3_Send_End : begin
          tx_area_valid <= 1'b1;
          tx_area_last <= 1'b1;
          tx_area_data <= 32'h0000ffbd;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge log_clk) begin
    tx_area_tx_packet_req_regNext <= tx_area_tx_packet_req;
  end


endmodule

module gtp_tx_2 (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output     [3:0]    s_axi_tx_tkeep,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready,
  input      [31:0]   tx_packet_gtxid,
  input      [31:0]   tx_packet_head,
  input               tx_packet_req,
  input               tx_packet_trigger,
  output     [31:0]   crc_data,
  output     [7:0]    tx_packet_addra,
  input      [31:0]   tx_packet_data,
  output              tx_packet_rden
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;
  localparam tx_area_fsm_enumDef_2_BOOT = 3'd0;
  localparam tx_area_fsm_enumDef_2_Wait_Start = 3'd1;
  localparam tx_area_fsm_enumDef_2_Send_Head = 3'd2;
  localparam tx_area_fsm_enumDef_2_Send_Id = 3'd3;
  localparam tx_area_fsm_enumDef_2_Send_Length = 3'd4;
  localparam tx_area_fsm_enumDef_2_Send_Data = 3'd5;
  localparam tx_area_fsm_enumDef_2_Send_Crc = 3'd6;
  localparam tx_area_fsm_enumDef_2_Send_End = 3'd7;

  reg        [0:0]    tx_area_crc32_io_cmd_payload_mode;
  wire       [31:0]   tx_area_crc32_io_crc;
  wire       [31:0]   tx_area_crc32_io_nextcrc;
  wire                tx_area_streamfifo_io_push_ready;
  wire                tx_area_streamfifo_io_pop_valid;
  wire       [31:0]   tx_area_streamfifo_io_pop_payload;
  wire       [6:0]    tx_area_streamfifo_io_occupancy;
  wire       [6:0]    tx_area_streamfifo_io_availability;
  wire       [7:0]    _zz_when_gtp_tx_l100;
  reg                 tx_area_valid;
  reg                 tx_area_last;
  reg        [31:0]   tx_area_data;
  reg        [7:0]    tx_area_rd_addr;
  reg                 tx_area_rd_rden;
  reg        [7:0]    tx_area_length;
  reg                 tx_area_mode;
  wire                when_gtp_tx_l41;
  (* async_reg = "true" *) reg                 tx_area_tx_packet_req;
  wire                tx_area_fsm_wantExit;
  reg                 tx_area_fsm_wantStart;
  wire                tx_area_fsm_wantKill;
  reg        [2:0]    tx_area_fsm_stateReg;
  reg        [2:0]    tx_area_fsm_stateNext;
  reg                 tx_area_tx_packet_req_regNext;
  wire                when_gtp_tx_l55;
  wire                when_gtp_tx_l75;
  wire                when_gtp_tx_l78;
  wire                when_gtp_tx_l100;
  `ifndef SYNTHESIS
  reg [87:0] tx_area_fsm_stateReg_string;
  reg [87:0] tx_area_fsm_stateNext_string;
  `endif


  assign _zz_when_gtp_tx_l100 = (tx_packet_head[7 : 0] - 8'h01);
  CRCCombinational tx_area_crc32 (
    .io_cmd_valid           (tx_area_valid                      ), //i
    .io_cmd_payload_mode    (tx_area_crc32_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (tx_area_data[31:0]                 ), //i
    .io_crc                 (tx_area_crc32_io_crc[31:0]         ), //o
    .io_nextcrc             (tx_area_crc32_io_nextcrc[31:0]     ), //o
    .log_clk                (log_clk                            ), //i
    .log_rst_q              (log_rst_q                          )  //i
  );
  StreamFifo tx_area_streamfifo (
    .io_push_valid      (tx_area_valid                            ), //i
    .io_push_ready      (tx_area_streamfifo_io_push_ready         ), //o
    .io_push_payload    (tx_area_data[31:0]                       ), //i
    .io_pop_valid       (tx_area_streamfifo_io_pop_valid          ), //o
    .io_pop_ready       (s_axi_tx_tready                          ), //i
    .io_pop_payload     (tx_area_streamfifo_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                                     ), //i
    .io_occupancy       (tx_area_streamfifo_io_occupancy[6:0]     ), //o
    .io_availability    (tx_area_streamfifo_io_availability[6:0]  ), //o
    .log_clk            (log_clk                                  ), //i
    .log_rst_q          (log_rst_q                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_2_BOOT : tx_area_fsm_stateReg_string = "BOOT       ";
      tx_area_fsm_enumDef_2_Wait_Start : tx_area_fsm_stateReg_string = "Wait_Start ";
      tx_area_fsm_enumDef_2_Send_Head : tx_area_fsm_stateReg_string = "Send_Head  ";
      tx_area_fsm_enumDef_2_Send_Id : tx_area_fsm_stateReg_string = "Send_Id    ";
      tx_area_fsm_enumDef_2_Send_Length : tx_area_fsm_stateReg_string = "Send_Length";
      tx_area_fsm_enumDef_2_Send_Data : tx_area_fsm_stateReg_string = "Send_Data  ";
      tx_area_fsm_enumDef_2_Send_Crc : tx_area_fsm_stateReg_string = "Send_Crc   ";
      tx_area_fsm_enumDef_2_Send_End : tx_area_fsm_stateReg_string = "Send_End   ";
      default : tx_area_fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(tx_area_fsm_stateNext)
      tx_area_fsm_enumDef_2_BOOT : tx_area_fsm_stateNext_string = "BOOT       ";
      tx_area_fsm_enumDef_2_Wait_Start : tx_area_fsm_stateNext_string = "Wait_Start ";
      tx_area_fsm_enumDef_2_Send_Head : tx_area_fsm_stateNext_string = "Send_Head  ";
      tx_area_fsm_enumDef_2_Send_Id : tx_area_fsm_stateNext_string = "Send_Id    ";
      tx_area_fsm_enumDef_2_Send_Length : tx_area_fsm_stateNext_string = "Send_Length";
      tx_area_fsm_enumDef_2_Send_Data : tx_area_fsm_stateNext_string = "Send_Data  ";
      tx_area_fsm_enumDef_2_Send_Crc : tx_area_fsm_stateNext_string = "Send_Crc   ";
      tx_area_fsm_enumDef_2_Send_End : tx_area_fsm_stateNext_string = "Send_End   ";
      default : tx_area_fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign when_gtp_tx_l41 = (! tx_area_mode);
  always @(*) begin
    if(when_gtp_tx_l41) begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_INIT;
    end else begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
    end
  end

  assign tx_area_fsm_wantExit = 1'b0;
  always @(*) begin
    tx_area_fsm_wantStart = 1'b0;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_2_Wait_Start : begin
      end
      tx_area_fsm_enumDef_2_Send_Head : begin
      end
      tx_area_fsm_enumDef_2_Send_Id : begin
      end
      tx_area_fsm_enumDef_2_Send_Length : begin
      end
      tx_area_fsm_enumDef_2_Send_Data : begin
      end
      tx_area_fsm_enumDef_2_Send_Crc : begin
      end
      tx_area_fsm_enumDef_2_Send_End : begin
      end
      default : begin
        tx_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign tx_area_fsm_wantKill = 1'b0;
  assign crc_data = tx_area_crc32_io_nextcrc;
  assign tx_packet_addra = tx_area_rd_addr;
  assign tx_packet_rden = tx_area_rd_rden;
  assign s_axi_tx_tkeep = 4'b1111;
  assign s_axi_tx_tdata = tx_area_streamfifo_io_pop_payload;
  assign s_axi_tx_tvalid = tx_area_streamfifo_io_pop_valid;
  assign s_axi_tx_tlast = (((tx_area_streamfifo_io_occupancy == 7'h01) && s_axi_tx_tready) && s_axi_tx_tvalid);
  always @(*) begin
    tx_area_fsm_stateNext = tx_area_fsm_stateReg;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_2_Wait_Start : begin
        if(when_gtp_tx_l55) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Send_Head;
        end else begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Wait_Start;
        end
      end
      tx_area_fsm_enumDef_2_Send_Head : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Send_Id;
      end
      tx_area_fsm_enumDef_2_Send_Id : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Send_Length;
      end
      tx_area_fsm_enumDef_2_Send_Length : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Send_Data;
      end
      tx_area_fsm_enumDef_2_Send_Data : begin
        if(!when_gtp_tx_l100) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Send_Crc;
        end
      end
      tx_area_fsm_enumDef_2_Send_Crc : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Send_End;
      end
      tx_area_fsm_enumDef_2_Send_End : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Wait_Start;
      end
      default : begin
      end
    endcase
    if(tx_area_fsm_wantStart) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_Wait_Start;
    end
    if(tx_area_fsm_wantKill) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_2_BOOT;
    end
  end

  assign when_gtp_tx_l55 = (tx_area_tx_packet_req && (! tx_area_tx_packet_req_regNext));
  assign when_gtp_tx_l75 = (tx_packet_head[15 : 0] == 16'h0001);
  assign when_gtp_tx_l78 = (tx_packet_head[15 : 8] == 8'h0);
  assign when_gtp_tx_l100 = (tx_area_length < _zz_when_gtp_tx_l100);
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      tx_area_valid <= 1'b0;
      tx_area_last <= 1'b0;
      tx_area_data <= 32'h0;
      tx_area_rd_addr <= 8'h0;
      tx_area_rd_rden <= 1'b1;
      tx_area_length <= 8'h0;
      tx_area_mode <= 1'b0;
      tx_area_tx_packet_req <= 1'b0;
      tx_area_fsm_stateReg <= tx_area_fsm_enumDef_2_BOOT;
    end else begin
      tx_area_tx_packet_req <= tx_packet_req;
      tx_area_fsm_stateReg <= tx_area_fsm_stateNext;
      case(tx_area_fsm_stateReg)
        tx_area_fsm_enumDef_2_Wait_Start : begin
          tx_area_valid <= 1'b0;
          tx_area_last <= 1'b0;
        end
        tx_area_fsm_enumDef_2_Send_Head : begin
          tx_area_mode <= 1'b0;
          tx_area_valid <= 1'b1;
          tx_area_data <= 32'h0000ffbc;
        end
        tx_area_fsm_enumDef_2_Send_Id : begin
          tx_area_valid <= 1'b1;
          tx_area_mode <= 1'b1;
          tx_area_data <= tx_packet_gtxid;
          if(when_gtp_tx_l75) begin
            tx_area_rd_addr <= 8'h0;
          end else begin
            if(when_gtp_tx_l78) begin
              tx_area_rd_addr <= 8'h01;
            end else begin
              tx_area_rd_addr <= tx_packet_head[15 : 8];
            end
          end
          tx_area_rd_rden <= 1'b0;
        end
        tx_area_fsm_enumDef_2_Send_Length : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_head;
          tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
        end
        tx_area_fsm_enumDef_2_Send_Data : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_data;
          if(when_gtp_tx_l100) begin
            tx_area_length <= (tx_area_length + 8'h01);
            tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
          end else begin
            tx_area_length <= 8'h0;
            tx_area_rd_addr <= 8'h0;
            tx_area_rd_rden <= 1'b1;
          end
        end
        tx_area_fsm_enumDef_2_Send_Crc : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_area_crc32_io_nextcrc;
        end
        tx_area_fsm_enumDef_2_Send_End : begin
          tx_area_valid <= 1'b1;
          tx_area_last <= 1'b1;
          tx_area_data <= 32'h0000ffbd;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge log_clk) begin
    tx_area_tx_packet_req_regNext <= tx_area_tx_packet_req;
  end


endmodule

module gtp_tx_1 (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output     [3:0]    s_axi_tx_tkeep,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready,
  input      [31:0]   tx_packet_gtxid,
  input      [31:0]   tx_packet_head,
  input               tx_packet_req,
  input               tx_packet_trigger,
  output     [31:0]   crc_data,
  output     [7:0]    tx_packet_addra,
  input      [31:0]   tx_packet_data,
  output              tx_packet_rden
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;
  localparam tx_area_fsm_enumDef_1_BOOT = 3'd0;
  localparam tx_area_fsm_enumDef_1_Wait_Start = 3'd1;
  localparam tx_area_fsm_enumDef_1_Send_Head = 3'd2;
  localparam tx_area_fsm_enumDef_1_Send_Id = 3'd3;
  localparam tx_area_fsm_enumDef_1_Send_Length = 3'd4;
  localparam tx_area_fsm_enumDef_1_Send_Data = 3'd5;
  localparam tx_area_fsm_enumDef_1_Send_Crc = 3'd6;
  localparam tx_area_fsm_enumDef_1_Send_End = 3'd7;

  reg        [0:0]    tx_area_crc32_io_cmd_payload_mode;
  wire       [31:0]   tx_area_crc32_io_crc;
  wire       [31:0]   tx_area_crc32_io_nextcrc;
  wire                tx_area_streamfifo_io_push_ready;
  wire                tx_area_streamfifo_io_pop_valid;
  wire       [31:0]   tx_area_streamfifo_io_pop_payload;
  wire       [6:0]    tx_area_streamfifo_io_occupancy;
  wire       [6:0]    tx_area_streamfifo_io_availability;
  wire       [7:0]    _zz_when_gtp_tx_l100;
  reg                 tx_area_valid;
  reg                 tx_area_last;
  reg        [31:0]   tx_area_data;
  reg        [7:0]    tx_area_rd_addr;
  reg                 tx_area_rd_rden;
  reg        [7:0]    tx_area_length;
  reg                 tx_area_mode;
  wire                when_gtp_tx_l41;
  (* async_reg = "true" *) reg                 tx_area_tx_packet_req;
  wire                tx_area_fsm_wantExit;
  reg                 tx_area_fsm_wantStart;
  wire                tx_area_fsm_wantKill;
  reg        [2:0]    tx_area_fsm_stateReg;
  reg        [2:0]    tx_area_fsm_stateNext;
  reg                 tx_area_tx_packet_req_regNext;
  wire                when_gtp_tx_l55;
  wire                when_gtp_tx_l75;
  wire                when_gtp_tx_l78;
  wire                when_gtp_tx_l100;
  `ifndef SYNTHESIS
  reg [87:0] tx_area_fsm_stateReg_string;
  reg [87:0] tx_area_fsm_stateNext_string;
  `endif


  assign _zz_when_gtp_tx_l100 = (tx_packet_head[7 : 0] - 8'h01);
  CRCCombinational tx_area_crc32 (
    .io_cmd_valid           (tx_area_valid                      ), //i
    .io_cmd_payload_mode    (tx_area_crc32_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (tx_area_data[31:0]                 ), //i
    .io_crc                 (tx_area_crc32_io_crc[31:0]         ), //o
    .io_nextcrc             (tx_area_crc32_io_nextcrc[31:0]     ), //o
    .log_clk                (log_clk                            ), //i
    .log_rst_q              (log_rst_q                          )  //i
  );
  StreamFifo tx_area_streamfifo (
    .io_push_valid      (tx_area_valid                            ), //i
    .io_push_ready      (tx_area_streamfifo_io_push_ready         ), //o
    .io_push_payload    (tx_area_data[31:0]                       ), //i
    .io_pop_valid       (tx_area_streamfifo_io_pop_valid          ), //o
    .io_pop_ready       (s_axi_tx_tready                          ), //i
    .io_pop_payload     (tx_area_streamfifo_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                                     ), //i
    .io_occupancy       (tx_area_streamfifo_io_occupancy[6:0]     ), //o
    .io_availability    (tx_area_streamfifo_io_availability[6:0]  ), //o
    .log_clk            (log_clk                                  ), //i
    .log_rst_q          (log_rst_q                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_1_BOOT : tx_area_fsm_stateReg_string = "BOOT       ";
      tx_area_fsm_enumDef_1_Wait_Start : tx_area_fsm_stateReg_string = "Wait_Start ";
      tx_area_fsm_enumDef_1_Send_Head : tx_area_fsm_stateReg_string = "Send_Head  ";
      tx_area_fsm_enumDef_1_Send_Id : tx_area_fsm_stateReg_string = "Send_Id    ";
      tx_area_fsm_enumDef_1_Send_Length : tx_area_fsm_stateReg_string = "Send_Length";
      tx_area_fsm_enumDef_1_Send_Data : tx_area_fsm_stateReg_string = "Send_Data  ";
      tx_area_fsm_enumDef_1_Send_Crc : tx_area_fsm_stateReg_string = "Send_Crc   ";
      tx_area_fsm_enumDef_1_Send_End : tx_area_fsm_stateReg_string = "Send_End   ";
      default : tx_area_fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(tx_area_fsm_stateNext)
      tx_area_fsm_enumDef_1_BOOT : tx_area_fsm_stateNext_string = "BOOT       ";
      tx_area_fsm_enumDef_1_Wait_Start : tx_area_fsm_stateNext_string = "Wait_Start ";
      tx_area_fsm_enumDef_1_Send_Head : tx_area_fsm_stateNext_string = "Send_Head  ";
      tx_area_fsm_enumDef_1_Send_Id : tx_area_fsm_stateNext_string = "Send_Id    ";
      tx_area_fsm_enumDef_1_Send_Length : tx_area_fsm_stateNext_string = "Send_Length";
      tx_area_fsm_enumDef_1_Send_Data : tx_area_fsm_stateNext_string = "Send_Data  ";
      tx_area_fsm_enumDef_1_Send_Crc : tx_area_fsm_stateNext_string = "Send_Crc   ";
      tx_area_fsm_enumDef_1_Send_End : tx_area_fsm_stateNext_string = "Send_End   ";
      default : tx_area_fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign when_gtp_tx_l41 = (! tx_area_mode);
  always @(*) begin
    if(when_gtp_tx_l41) begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_INIT;
    end else begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
    end
  end

  assign tx_area_fsm_wantExit = 1'b0;
  always @(*) begin
    tx_area_fsm_wantStart = 1'b0;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_1_Wait_Start : begin
      end
      tx_area_fsm_enumDef_1_Send_Head : begin
      end
      tx_area_fsm_enumDef_1_Send_Id : begin
      end
      tx_area_fsm_enumDef_1_Send_Length : begin
      end
      tx_area_fsm_enumDef_1_Send_Data : begin
      end
      tx_area_fsm_enumDef_1_Send_Crc : begin
      end
      tx_area_fsm_enumDef_1_Send_End : begin
      end
      default : begin
        tx_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign tx_area_fsm_wantKill = 1'b0;
  assign crc_data = tx_area_crc32_io_nextcrc;
  assign tx_packet_addra = tx_area_rd_addr;
  assign tx_packet_rden = tx_area_rd_rden;
  assign s_axi_tx_tkeep = 4'b1111;
  assign s_axi_tx_tdata = tx_area_streamfifo_io_pop_payload;
  assign s_axi_tx_tvalid = tx_area_streamfifo_io_pop_valid;
  assign s_axi_tx_tlast = (((tx_area_streamfifo_io_occupancy == 7'h01) && s_axi_tx_tready) && s_axi_tx_tvalid);
  always @(*) begin
    tx_area_fsm_stateNext = tx_area_fsm_stateReg;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_1_Wait_Start : begin
        if(when_gtp_tx_l55) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Send_Head;
        end else begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Wait_Start;
        end
      end
      tx_area_fsm_enumDef_1_Send_Head : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Send_Id;
      end
      tx_area_fsm_enumDef_1_Send_Id : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Send_Length;
      end
      tx_area_fsm_enumDef_1_Send_Length : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Send_Data;
      end
      tx_area_fsm_enumDef_1_Send_Data : begin
        if(!when_gtp_tx_l100) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Send_Crc;
        end
      end
      tx_area_fsm_enumDef_1_Send_Crc : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Send_End;
      end
      tx_area_fsm_enumDef_1_Send_End : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Wait_Start;
      end
      default : begin
      end
    endcase
    if(tx_area_fsm_wantStart) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_Wait_Start;
    end
    if(tx_area_fsm_wantKill) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_1_BOOT;
    end
  end

  assign when_gtp_tx_l55 = (tx_area_tx_packet_req && (! tx_area_tx_packet_req_regNext));
  assign when_gtp_tx_l75 = (tx_packet_head[15 : 0] == 16'h0001);
  assign when_gtp_tx_l78 = (tx_packet_head[15 : 8] == 8'h0);
  assign when_gtp_tx_l100 = (tx_area_length < _zz_when_gtp_tx_l100);
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      tx_area_valid <= 1'b0;
      tx_area_last <= 1'b0;
      tx_area_data <= 32'h0;
      tx_area_rd_addr <= 8'h0;
      tx_area_rd_rden <= 1'b1;
      tx_area_length <= 8'h0;
      tx_area_mode <= 1'b0;
      tx_area_tx_packet_req <= 1'b0;
      tx_area_fsm_stateReg <= tx_area_fsm_enumDef_1_BOOT;
    end else begin
      tx_area_tx_packet_req <= tx_packet_req;
      tx_area_fsm_stateReg <= tx_area_fsm_stateNext;
      case(tx_area_fsm_stateReg)
        tx_area_fsm_enumDef_1_Wait_Start : begin
          tx_area_valid <= 1'b0;
          tx_area_last <= 1'b0;
        end
        tx_area_fsm_enumDef_1_Send_Head : begin
          tx_area_mode <= 1'b0;
          tx_area_valid <= 1'b1;
          tx_area_data <= 32'h0000ffbc;
        end
        tx_area_fsm_enumDef_1_Send_Id : begin
          tx_area_valid <= 1'b1;
          tx_area_mode <= 1'b1;
          tx_area_data <= tx_packet_gtxid;
          if(when_gtp_tx_l75) begin
            tx_area_rd_addr <= 8'h0;
          end else begin
            if(when_gtp_tx_l78) begin
              tx_area_rd_addr <= 8'h01;
            end else begin
              tx_area_rd_addr <= tx_packet_head[15 : 8];
            end
          end
          tx_area_rd_rden <= 1'b0;
        end
        tx_area_fsm_enumDef_1_Send_Length : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_head;
          tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
        end
        tx_area_fsm_enumDef_1_Send_Data : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_data;
          if(when_gtp_tx_l100) begin
            tx_area_length <= (tx_area_length + 8'h01);
            tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
          end else begin
            tx_area_length <= 8'h0;
            tx_area_rd_addr <= 8'h0;
            tx_area_rd_rden <= 1'b1;
          end
        end
        tx_area_fsm_enumDef_1_Send_Crc : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_area_crc32_io_nextcrc;
        end
        tx_area_fsm_enumDef_1_Send_End : begin
          tx_area_valid <= 1'b1;
          tx_area_last <= 1'b1;
          tx_area_data <= 32'h0000ffbd;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge log_clk) begin
    tx_area_tx_packet_req_regNext <= tx_area_tx_packet_req;
  end


endmodule

module gtp_tx (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output     [3:0]    s_axi_tx_tkeep,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready,
  input      [31:0]   tx_packet_gtxid,
  input      [31:0]   tx_packet_head,
  input               tx_packet_req,
  input               tx_packet_trigger,
  output     [31:0]   crc_data,
  output     [7:0]    tx_packet_addra,
  input      [31:0]   tx_packet_data,
  output              tx_packet_rden
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;
  localparam tx_area_fsm_enumDef_BOOT = 3'd0;
  localparam tx_area_fsm_enumDef_Wait_Start = 3'd1;
  localparam tx_area_fsm_enumDef_Send_Head = 3'd2;
  localparam tx_area_fsm_enumDef_Send_Id = 3'd3;
  localparam tx_area_fsm_enumDef_Send_Length = 3'd4;
  localparam tx_area_fsm_enumDef_Send_Data = 3'd5;
  localparam tx_area_fsm_enumDef_Send_Crc = 3'd6;
  localparam tx_area_fsm_enumDef_Send_End = 3'd7;

  reg        [0:0]    tx_area_crc32_io_cmd_payload_mode;
  wire       [31:0]   tx_area_crc32_io_crc;
  wire       [31:0]   tx_area_crc32_io_nextcrc;
  wire                tx_area_streamfifo_io_push_ready;
  wire                tx_area_streamfifo_io_pop_valid;
  wire       [31:0]   tx_area_streamfifo_io_pop_payload;
  wire       [6:0]    tx_area_streamfifo_io_occupancy;
  wire       [6:0]    tx_area_streamfifo_io_availability;
  wire       [7:0]    _zz_when_gtp_tx_l100;
  reg                 tx_area_valid;
  reg                 tx_area_last;
  reg        [31:0]   tx_area_data;
  reg        [7:0]    tx_area_rd_addr;
  reg                 tx_area_rd_rden;
  reg        [7:0]    tx_area_length;
  reg                 tx_area_mode;
  wire                when_gtp_tx_l41;
  (* async_reg = "true" *) reg                 tx_area_tx_packet_req;
  wire                tx_area_fsm_wantExit;
  reg                 tx_area_fsm_wantStart;
  wire                tx_area_fsm_wantKill;
  reg        [2:0]    tx_area_fsm_stateReg;
  reg        [2:0]    tx_area_fsm_stateNext;
  reg                 tx_area_tx_packet_req_regNext;
  wire                when_gtp_tx_l55;
  wire                when_gtp_tx_l75;
  wire                when_gtp_tx_l78;
  wire                when_gtp_tx_l100;
  `ifndef SYNTHESIS
  reg [87:0] tx_area_fsm_stateReg_string;
  reg [87:0] tx_area_fsm_stateNext_string;
  `endif


  assign _zz_when_gtp_tx_l100 = (tx_packet_head[7 : 0] - 8'h01);
  CRCCombinational tx_area_crc32 (
    .io_cmd_valid           (tx_area_valid                      ), //i
    .io_cmd_payload_mode    (tx_area_crc32_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (tx_area_data[31:0]                 ), //i
    .io_crc                 (tx_area_crc32_io_crc[31:0]         ), //o
    .io_nextcrc             (tx_area_crc32_io_nextcrc[31:0]     ), //o
    .log_clk                (log_clk                            ), //i
    .log_rst_q              (log_rst_q                          )  //i
  );
  StreamFifo tx_area_streamfifo (
    .io_push_valid      (tx_area_valid                            ), //i
    .io_push_ready      (tx_area_streamfifo_io_push_ready         ), //o
    .io_push_payload    (tx_area_data[31:0]                       ), //i
    .io_pop_valid       (tx_area_streamfifo_io_pop_valid          ), //o
    .io_pop_ready       (s_axi_tx_tready                          ), //i
    .io_pop_payload     (tx_area_streamfifo_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                                     ), //i
    .io_occupancy       (tx_area_streamfifo_io_occupancy[6:0]     ), //o
    .io_availability    (tx_area_streamfifo_io_availability[6:0]  ), //o
    .log_clk            (log_clk                                  ), //i
    .log_rst_q          (log_rst_q                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_BOOT : tx_area_fsm_stateReg_string = "BOOT       ";
      tx_area_fsm_enumDef_Wait_Start : tx_area_fsm_stateReg_string = "Wait_Start ";
      tx_area_fsm_enumDef_Send_Head : tx_area_fsm_stateReg_string = "Send_Head  ";
      tx_area_fsm_enumDef_Send_Id : tx_area_fsm_stateReg_string = "Send_Id    ";
      tx_area_fsm_enumDef_Send_Length : tx_area_fsm_stateReg_string = "Send_Length";
      tx_area_fsm_enumDef_Send_Data : tx_area_fsm_stateReg_string = "Send_Data  ";
      tx_area_fsm_enumDef_Send_Crc : tx_area_fsm_stateReg_string = "Send_Crc   ";
      tx_area_fsm_enumDef_Send_End : tx_area_fsm_stateReg_string = "Send_End   ";
      default : tx_area_fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(tx_area_fsm_stateNext)
      tx_area_fsm_enumDef_BOOT : tx_area_fsm_stateNext_string = "BOOT       ";
      tx_area_fsm_enumDef_Wait_Start : tx_area_fsm_stateNext_string = "Wait_Start ";
      tx_area_fsm_enumDef_Send_Head : tx_area_fsm_stateNext_string = "Send_Head  ";
      tx_area_fsm_enumDef_Send_Id : tx_area_fsm_stateNext_string = "Send_Id    ";
      tx_area_fsm_enumDef_Send_Length : tx_area_fsm_stateNext_string = "Send_Length";
      tx_area_fsm_enumDef_Send_Data : tx_area_fsm_stateNext_string = "Send_Data  ";
      tx_area_fsm_enumDef_Send_Crc : tx_area_fsm_stateNext_string = "Send_Crc   ";
      tx_area_fsm_enumDef_Send_End : tx_area_fsm_stateNext_string = "Send_End   ";
      default : tx_area_fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign when_gtp_tx_l41 = (! tx_area_mode);
  always @(*) begin
    if(when_gtp_tx_l41) begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_INIT;
    end else begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
    end
  end

  assign tx_area_fsm_wantExit = 1'b0;
  always @(*) begin
    tx_area_fsm_wantStart = 1'b0;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_Wait_Start : begin
      end
      tx_area_fsm_enumDef_Send_Head : begin
      end
      tx_area_fsm_enumDef_Send_Id : begin
      end
      tx_area_fsm_enumDef_Send_Length : begin
      end
      tx_area_fsm_enumDef_Send_Data : begin
      end
      tx_area_fsm_enumDef_Send_Crc : begin
      end
      tx_area_fsm_enumDef_Send_End : begin
      end
      default : begin
        tx_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign tx_area_fsm_wantKill = 1'b0;
  assign crc_data = tx_area_crc32_io_nextcrc;
  assign tx_packet_addra = tx_area_rd_addr;
  assign tx_packet_rden = tx_area_rd_rden;
  assign s_axi_tx_tkeep = 4'b1111;
  assign s_axi_tx_tdata = tx_area_streamfifo_io_pop_payload;
  assign s_axi_tx_tvalid = tx_area_streamfifo_io_pop_valid;
  assign s_axi_tx_tlast = (((tx_area_streamfifo_io_occupancy == 7'h01) && s_axi_tx_tready) && s_axi_tx_tvalid);
  always @(*) begin
    tx_area_fsm_stateNext = tx_area_fsm_stateReg;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_Wait_Start : begin
        if(when_gtp_tx_l55) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Head;
        end else begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_Wait_Start;
        end
      end
      tx_area_fsm_enumDef_Send_Head : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Id;
      end
      tx_area_fsm_enumDef_Send_Id : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Length;
      end
      tx_area_fsm_enumDef_Send_Length : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Data;
      end
      tx_area_fsm_enumDef_Send_Data : begin
        if(!when_gtp_tx_l100) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Crc;
        end
      end
      tx_area_fsm_enumDef_Send_Crc : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_End;
      end
      tx_area_fsm_enumDef_Send_End : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Wait_Start;
      end
      default : begin
      end
    endcase
    if(tx_area_fsm_wantStart) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_Wait_Start;
    end
    if(tx_area_fsm_wantKill) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_BOOT;
    end
  end

  assign when_gtp_tx_l55 = (tx_area_tx_packet_req && (! tx_area_tx_packet_req_regNext));
  assign when_gtp_tx_l75 = (tx_packet_head[15 : 0] == 16'h0001);
  assign when_gtp_tx_l78 = (tx_packet_head[15 : 8] == 8'h0);
  assign when_gtp_tx_l100 = (tx_area_length < _zz_when_gtp_tx_l100);
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      tx_area_valid <= 1'b0;
      tx_area_last <= 1'b0;
      tx_area_data <= 32'h0;
      tx_area_rd_addr <= 8'h0;
      tx_area_rd_rden <= 1'b1;
      tx_area_length <= 8'h0;
      tx_area_mode <= 1'b0;
      tx_area_tx_packet_req <= 1'b0;
      tx_area_fsm_stateReg <= tx_area_fsm_enumDef_BOOT;
    end else begin
      tx_area_tx_packet_req <= tx_packet_req;
      tx_area_fsm_stateReg <= tx_area_fsm_stateNext;
      case(tx_area_fsm_stateReg)
        tx_area_fsm_enumDef_Wait_Start : begin
          tx_area_valid <= 1'b0;
          tx_area_last <= 1'b0;
        end
        tx_area_fsm_enumDef_Send_Head : begin
          tx_area_mode <= 1'b0;
          tx_area_valid <= 1'b1;
          tx_area_data <= 32'h0000ffbc;
        end
        tx_area_fsm_enumDef_Send_Id : begin
          tx_area_valid <= 1'b1;
          tx_area_mode <= 1'b1;
          tx_area_data <= tx_packet_gtxid;
          if(when_gtp_tx_l75) begin
            tx_area_rd_addr <= 8'h0;
          end else begin
            if(when_gtp_tx_l78) begin
              tx_area_rd_addr <= 8'h01;
            end else begin
              tx_area_rd_addr <= tx_packet_head[15 : 8];
            end
          end
          tx_area_rd_rden <= 1'b0;
        end
        tx_area_fsm_enumDef_Send_Length : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_head;
          tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
        end
        tx_area_fsm_enumDef_Send_Data : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_data;
          if(when_gtp_tx_l100) begin
            tx_area_length <= (tx_area_length + 8'h01);
            tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
          end else begin
            tx_area_length <= 8'h0;
            tx_area_rd_addr <= 8'h0;
            tx_area_rd_rden <= 1'b1;
          end
        end
        tx_area_fsm_enumDef_Send_Crc : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_area_crc32_io_nextcrc;
        end
        tx_area_fsm_enumDef_Send_End : begin
          tx_area_valid <= 1'b1;
          tx_area_last <= 1'b1;
          tx_area_data <= 32'h0000ffbd;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge log_clk) begin
    tx_area_tx_packet_req_regNext <= tx_area_tx_packet_req;
  end


endmodule

//StreamFifo replaced by StreamFifo

//CRCCombinational replaced by CRCCombinational

//StreamFifo replaced by StreamFifo

//CRCCombinational replaced by CRCCombinational

//StreamFifo replaced by StreamFifo

//CRCCombinational replaced by CRCCombinational

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
  input               log_clk,
  input               log_rst_q
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
  always @(posedge log_clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge log_clk) begin
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
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
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

module CRCCombinational (
  input               io_cmd_valid,
  input      [0:0]    io_cmd_payload_mode,
  input      [31:0]   io_cmd_payload_data,
  output     [31:0]   io_crc,
  output     [31:0]   io_nextcrc,
  input               log_clk,
  input               log_rst_q
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;

  wire                _zz_next_crc;
  wire                _zz_next_crc_1;
  wire                _zz_next_crc_2;
  wire                _zz_next_crc_3;
  wire                _zz_next_crc_4;
  wire                _zz_next_crc_5;
  wire                _zz_next_crc_6;
  wire                _zz_next_crc_7;
  wire                _zz_next_crc_8;
  wire                _zz_next_crc_9;
  wire                _zz_next_crc_10;
  wire                _zz_next_crc_11;
  wire                _zz_next_crc_12;
  wire                _zz_next_crc_13;
  wire                _zz_next_crc_14;
  wire                _zz_next_crc_15;
  wire                _zz_next_crc_16;
  wire                _zz_next_crc_17;
  wire                _zz_next_crc_18;
  wire                _zz_next_crc_19;
  wire                _zz_next_crc_20;
  wire                _zz_next_crc_21;
  wire                _zz_next_crc_22;
  wire                _zz_next_crc_23;
  wire                _zz_next_crc_24;
  wire                _zz_next_crc_25;
  wire                _zz_next_crc_26;
  wire                _zz_next_crc_27;
  wire                _zz_next_crc_28;
  wire                _zz_next_crc_29;
  wire                _zz_next_crc_30;
  wire                _zz_next_crc_31;
  wire                _zz_next_crc_32;
  wire                _zz_next_crc_33;
  wire                _zz_next_crc_34;
  wire                _zz_next_crc_35;
  wire                _zz_next_crc_36;
  wire                _zz_next_crc_37;
  wire                _zz_next_crc_38;
  wire                _zz_next_crc_39;
  wire                _zz_next_crc_40;
  wire                _zz_next_crc_41;
  wire                _zz_next_crc_42;
  wire                _zz_next_crc_43;
  wire                _zz_next_crc_44;
  wire                _zz_next_crc_45;
  wire                _zz_next_crc_46;
  wire                _zz_next_crc_47;
  wire                _zz_next_crc_48;
  wire                _zz_next_crc_49;
  wire                _zz_next_crc_50;
  wire                _zz_next_crc_51;
  wire                _zz_next_crc_52;
  wire                _zz_next_crc_53;
  wire                _zz_next_crc_54;
  wire                _zz_next_crc_55;
  wire                _zz_next_crc_56;
  wire                _zz_next_crc_57;
  wire                _zz_next_crc_58;
  wire                _zz_next_crc_59;
  wire                _zz_next_crc_60;
  wire                _zz_next_crc_61;
  wire                _zz_next_crc_62;
  wire                _zz_next_crc_63;
  wire                _zz_next_crc_64;
  wire                _zz_next_crc_65;
  wire                _zz_next_crc_66;
  wire                _zz_next_crc_67;
  wire                _zz_next_crc_68;
  wire                _zz_next_crc_69;
  reg        [31:0]   crc_reg;
  reg        [31:0]   next_crc;
  wire                when_CRCCombinational_l86;
  wire                when_CRCCombinational_l91;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_next_crc = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_1 = io_cmd_payload_data[29];
  assign _zz_next_crc_2 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]);
  assign _zz_next_crc_3 = io_cmd_payload_data[24];
  assign _zz_next_crc_4 = (((((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]);
  assign _zz_next_crc_5 = crc_reg[0];
  assign _zz_next_crc_6 = (((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_7 = io_cmd_payload_data[31];
  assign _zz_next_crc_8 = ((((((((((((((((_zz_next_crc_9 ^ _zz_next_crc_10) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_11 = crc_reg[2];
  assign _zz_next_crc_9 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[2]);
  assign _zz_next_crc_10 = io_cmd_payload_data[3];
  assign _zz_next_crc_12 = (((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_13 = io_cmd_payload_data[29];
  assign _zz_next_crc_14 = (((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[29]);
  assign _zz_next_crc_15 = io_cmd_payload_data[30];
  assign _zz_next_crc_16 = (((((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[29]);
  assign _zz_next_crc_17 = crc_reg[0];
  assign _zz_next_crc_18 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_19 = io_cmd_payload_data[23];
  assign _zz_next_crc_20 = (((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]);
  assign _zz_next_crc_21 = io_cmd_payload_data[18];
  assign _zz_next_crc_22 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_23 = io_cmd_payload_data[28];
  assign _zz_next_crc_24 = ((((((((((((((((_zz_next_crc_25 ^ _zz_next_crc_26) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_27 = crc_reg[1];
  assign _zz_next_crc_25 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[1]);
  assign _zz_next_crc_26 = io_cmd_payload_data[3];
  assign _zz_next_crc_28 = ((((((((((((((((_zz_next_crc_29 ^ _zz_next_crc_30) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_31 = crc_reg[1];
  assign _zz_next_crc_29 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[1]);
  assign _zz_next_crc_30 = io_cmd_payload_data[2];
  assign _zz_next_crc_32 = (((((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]);
  assign _zz_next_crc_33 = crc_reg[1];
  assign _zz_next_crc_34 = (((((((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_35 = io_cmd_payload_data[29];
  assign _zz_next_crc_36 = (((((((((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_37 = io_cmd_payload_data[30];
  assign _zz_next_crc_38 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_39 = io_cmd_payload_data[29];
  assign _zz_next_crc_40 = (((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_41 = io_cmd_payload_data[30];
  assign _zz_next_crc_42 = (((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]);
  assign _zz_next_crc_43 = io_cmd_payload_data[26];
  assign _zz_next_crc_44 = (((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_45 = io_cmd_payload_data[24];
  assign _zz_next_crc_46 = (((((((io_cmd_payload_data[4] ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]);
  assign _zz_next_crc_47 = io_cmd_payload_data[25];
  assign _zz_next_crc_48 = (((((((io_cmd_payload_data[5] ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]);
  assign _zz_next_crc_49 = io_cmd_payload_data[26];
  assign _zz_next_crc_50 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_51 = io_cmd_payload_data[29];
  assign _zz_next_crc_52 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_53 = io_cmd_payload_data[29];
  assign _zz_next_crc_54 = (((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]);
  assign _zz_next_crc_55 = io_cmd_payload_data[27];
  assign _zz_next_crc_56 = (((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_57 = io_cmd_payload_data[28];
  assign _zz_next_crc_58 = (((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_59 = io_cmd_payload_data[31];
  assign _zz_next_crc_60 = (((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_61 = io_cmd_payload_data[27];
  assign _zz_next_crc_62 = (((((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_63 = io_cmd_payload_data[28];
  assign _zz_next_crc_64 = (((((((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_65 = io_cmd_payload_data[29];
  assign _zz_next_crc_66 = (((((((((io_cmd_payload_data[4] ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_67 = io_cmd_payload_data[28];
  assign _zz_next_crc_68 = (((((((((io_cmd_payload_data[5] ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_69 = io_cmd_payload_data[29];
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CRCCombinationalCmdMode_INIT : io_cmd_payload_mode_string = "INIT  ";
      CRCCombinationalCmdMode_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    next_crc[0] = ((((((((((((((((_zz_next_crc ^ _zz_next_crc_1) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[1] = ((((((((((((((((_zz_next_crc_2 ^ _zz_next_crc_3) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[2] = ((((((((((((((((_zz_next_crc_4 ^ _zz_next_crc_5) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[3] = ((((((((((((((((_zz_next_crc_6 ^ _zz_next_crc_7) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[4] = ((((((((((((((((_zz_next_crc_8 ^ _zz_next_crc_11) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[5] = ((((((((((((((((_zz_next_crc_12 ^ _zz_next_crc_13) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[6] = ((((((((((((((((_zz_next_crc_14 ^ _zz_next_crc_15) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[7] = ((((((((((((((((_zz_next_crc_16 ^ _zz_next_crc_17) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[8] = ((((((((((((((((_zz_next_crc_18 ^ _zz_next_crc_19) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[17]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[9] = ((((((((((((((((_zz_next_crc_20 ^ _zz_next_crc_21) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[29]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[18]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[29]);
    next_crc[10] = ((((((((((((((((_zz_next_crc_22 ^ _zz_next_crc_23) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[19]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[11] = ((((((((((((((((_zz_next_crc_24 ^ _zz_next_crc_27) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[12] = ((((((((((((((((_zz_next_crc_28 ^ _zz_next_crc_31) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[13] = ((((((((((((((((_zz_next_crc_32 ^ _zz_next_crc_33) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[14] = ((((((((((((((((_zz_next_crc_34 ^ _zz_next_crc_35) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[23]) ^ crc_reg[26]) ^ crc_reg[29]);
    next_crc[15] = ((((((((((((((((_zz_next_crc_36 ^ _zz_next_crc_37) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]);
    next_crc[16] = ((((((((((((((((_zz_next_crc_38 ^ _zz_next_crc_39) ^ io_cmd_payload_data[30]) ^ crc_reg[0]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[17] = ((((((((((((((((_zz_next_crc_40 ^ _zz_next_crc_41) ^ io_cmd_payload_data[31]) ^ crc_reg[1]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[18] = ((((((((((((((((_zz_next_crc_42 ^ _zz_next_crc_43) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[19] = ((((((((((((((((_zz_next_crc_44 ^ _zz_next_crc_45) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[29]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[20] = ((((((((((((((((_zz_next_crc_46 ^ _zz_next_crc_47) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[30]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[21] = ((((((((((((((((_zz_next_crc_48 ^ _zz_next_crc_49) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[22] = ((((((((((((((((_zz_next_crc_50 ^ _zz_next_crc_51) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[23] = ((((((((((((((((_zz_next_crc_52 ^ _zz_next_crc_53) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[24] = ((((((((((((((((_zz_next_crc_54 ^ _zz_next_crc_55) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[30]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[25] = ((((((((((((((((_zz_next_crc_56 ^ _zz_next_crc_57) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[26] = ((((((((((((((((_zz_next_crc_58 ^ _zz_next_crc_59) ^ crc_reg[0]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[10]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[27] = ((((((((((((((((_zz_next_crc_60 ^ _zz_next_crc_61) ^ io_cmd_payload_data[29]) ^ crc_reg[1]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[11]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[28] = ((((((((((((((((_zz_next_crc_62 ^ _zz_next_crc_63) ^ io_cmd_payload_data[30]) ^ crc_reg[2]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[29] = ((((((((((((((((_zz_next_crc_64 ^ _zz_next_crc_65) ^ io_cmd_payload_data[31]) ^ crc_reg[3]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[30] = ((((((((((((((((_zz_next_crc_66 ^ _zz_next_crc_67) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[30]) ^ crc_reg[4]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[31] = ((((((((((((((((_zz_next_crc_68 ^ _zz_next_crc_69) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
  end

  assign when_CRCCombinational_l86 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_INIT));
  assign when_CRCCombinational_l91 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_UPDATE));
  assign io_crc = (crc_reg ^ 32'h0);
  assign io_nextcrc = next_crc;
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      crc_reg <= 32'hffffffff;
    end else begin
      if(when_CRCCombinational_l86) begin
        crc_reg <= 32'hffffffff;
      end
      if(when_CRCCombinational_l91) begin
        crc_reg <= next_crc;
      end
    end
  end


endmodule
