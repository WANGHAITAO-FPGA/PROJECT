// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Mo_Top_Test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Mo_Top_Test (
  input      [23:0]   emif_emif_addr,
  input      [15:0]   emif_emif_data_read,
  output     [15:0]   emif_emif_data_write,
  output              emif_emif_data_writeEnable,
  input               emif_emif_cs,
  input               emif_emif_we,
  input               emif_emif_oe,
  input      [31:0]   hssl_sts_0,
  input      [31:0]   hssl_sts_1,
  input      [31:0]   hssl_sts_2,
  input      [31:0]   hssl_sts_3,
  output     [31:0]   hssl_txframe_0,
  output     [31:0]   hssl_txframe_1,
  output     [31:0]   hssl_txframe_2,
  output     [31:0]   hssl_txframe_3,
  input               clk,
  input               reset
);

  wire       [3:0]    hssl1_csr_reg_apb_PADDR;
  wire       [3:0]    hssl2_csr_reg_apb_PADDR;
  wire       [3:0]    hssl3_csr_reg_apb_PADDR;
  wire       [3:0]    hssl4_csr_reg_apb_PADDR;
  wire       [1:0]    hssl1_txframe_reg_apb_PADDR;
  wire       [1:0]    hssl2_txframe_reg_apb_PADDR;
  wire       [1:0]    hssl3_txframe_reg_apb_PADDR;
  wire       [1:0]    hssl4_txframe_reg_apb_PADDR;
  wire       [15:0]   emif32_toapb_emif_emif_data_write;
  wire                emif32_toapb_emif_emif_data_writeEnable;
  wire       [23:0]   emif32_toapb_apb_PADDR;
  wire       [0:0]    emif32_toapb_apb_PSEL;
  wire                emif32_toapb_apb_PENABLE;
  wire                emif32_toapb_apb_PWRITE;
  wire       [31:0]   emif32_toapb_apb_PWDATA;
  wire                hssl1_csr_reg_apb_PREADY;
  wire       [31:0]   hssl1_csr_reg_apb_PRDATA;
  wire                hssl1_csr_reg_apb_PSLVERROR;
  wire                hssl1_csr_reg_hssl_ctl_rst;
  wire                hssl1_csr_reg_hssl_ctl_send;
  wire                hssl1_csr_reg_hssl_ctl_trigger;
  wire                hssl2_csr_reg_apb_PREADY;
  wire       [31:0]   hssl2_csr_reg_apb_PRDATA;
  wire                hssl2_csr_reg_apb_PSLVERROR;
  wire                hssl2_csr_reg_hssl_ctl_rst;
  wire                hssl2_csr_reg_hssl_ctl_send;
  wire                hssl2_csr_reg_hssl_ctl_trigger;
  wire                hssl3_csr_reg_apb_PREADY;
  wire       [31:0]   hssl3_csr_reg_apb_PRDATA;
  wire                hssl3_csr_reg_apb_PSLVERROR;
  wire                hssl3_csr_reg_hssl_ctl_rst;
  wire                hssl3_csr_reg_hssl_ctl_send;
  wire                hssl3_csr_reg_hssl_ctl_trigger;
  wire                hssl4_csr_reg_apb_PREADY;
  wire       [31:0]   hssl4_csr_reg_apb_PRDATA;
  wire                hssl4_csr_reg_apb_PSLVERROR;
  wire                hssl4_csr_reg_hssl_ctl_rst;
  wire                hssl4_csr_reg_hssl_ctl_send;
  wire                hssl4_csr_reg_hssl_ctl_trigger;
  wire                hssl1_txframe_reg_apb_PREADY;
  wire       [31:0]   hssl1_txframe_reg_apb_PRDATA;
  wire                hssl1_txframe_reg_apb_PSLVERROR;
  wire       [31:0]   hssl1_txframe_reg_hssl_txframe;
  wire                hssl2_txframe_reg_apb_PREADY;
  wire       [31:0]   hssl2_txframe_reg_apb_PRDATA;
  wire                hssl2_txframe_reg_apb_PSLVERROR;
  wire       [31:0]   hssl2_txframe_reg_hssl_txframe;
  wire                hssl3_txframe_reg_apb_PREADY;
  wire       [31:0]   hssl3_txframe_reg_apb_PRDATA;
  wire                hssl3_txframe_reg_apb_PSLVERROR;
  wire       [31:0]   hssl3_txframe_reg_hssl_txframe;
  wire                hssl4_txframe_reg_apb_PREADY;
  wire       [31:0]   hssl4_txframe_reg_apb_PRDATA;
  wire                hssl4_txframe_reg_apb_PSLVERROR;
  wire       [31:0]   hssl4_txframe_reg_hssl_txframe;
  wire                apb_decoder_io_input_PREADY;
  wire       [31:0]   apb_decoder_io_input_PRDATA;
  wire                apb_decoder_io_input_PSLVERROR;
  wire       [23:0]   apb_decoder_io_output_PADDR;
  wire       [7:0]    apb_decoder_io_output_PSEL;
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

  EMIF32_Apb emif32_toapb (
    .emif_emif_addr                (emif_emif_addr[23:0]                     ), //i
    .emif_emif_data_read           (emif_emif_data_read[15:0]                ), //i
    .emif_emif_data_write          (emif32_toapb_emif_emif_data_write[15:0]  ), //o
    .emif_emif_data_writeEnable    (emif32_toapb_emif_emif_data_writeEnable  ), //o
    .emif_emif_cs                  (emif_emif_cs                             ), //i
    .emif_emif_we                  (emif_emif_we                             ), //i
    .emif_emif_oe                  (emif_emif_oe                             ), //i
    .apb_PADDR                     (emif32_toapb_apb_PADDR[23:0]             ), //o
    .apb_PSEL                      (emif32_toapb_apb_PSEL                    ), //o
    .apb_PENABLE                   (emif32_toapb_apb_PENABLE                 ), //o
    .apb_PREADY                    (apb_decoder_io_input_PREADY              ), //i
    .apb_PWRITE                    (emif32_toapb_apb_PWRITE                  ), //o
    .apb_PWDATA                    (emif32_toapb_apb_PWDATA[31:0]            ), //o
    .apb_PRDATA                    (apb_decoder_io_input_PRDATA[31:0]        ), //i
    .apb_PSLVERROR                 (apb_decoder_io_input_PSLVERROR           ), //i
    .clk                           (clk                                      ), //i
    .reset                         (reset                                    )  //i
  );
  Apb_CsrReg hssl1_csr_reg (
    .apb_PADDR           (hssl1_csr_reg_apb_PADDR[3:0]            ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_0_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_0_PENABLE       ), //i
    .apb_PREADY          (hssl1_csr_reg_apb_PREADY                ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_0_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_0_PWDATA[31:0]  ), //i
    .apb_PRDATA          (hssl1_csr_reg_apb_PRDATA[31:0]          ), //o
    .apb_PSLVERROR       (hssl1_csr_reg_apb_PSLVERROR             ), //o
    .hssl_sts            (hssl_sts_0[31:0]                        ), //i
    .hssl_ctl_rst        (hssl1_csr_reg_hssl_ctl_rst              ), //o
    .hssl_ctl_send       (hssl1_csr_reg_hssl_ctl_send             ), //o
    .hssl_ctl_trigger    (hssl1_csr_reg_hssl_ctl_trigger          ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_CsrReg hssl2_csr_reg (
    .apb_PADDR           (hssl2_csr_reg_apb_PADDR[3:0]            ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_1_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_1_PENABLE       ), //i
    .apb_PREADY          (hssl2_csr_reg_apb_PREADY                ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_1_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_1_PWDATA[31:0]  ), //i
    .apb_PRDATA          (hssl2_csr_reg_apb_PRDATA[31:0]          ), //o
    .apb_PSLVERROR       (hssl2_csr_reg_apb_PSLVERROR             ), //o
    .hssl_sts            (hssl_sts_1[31:0]                        ), //i
    .hssl_ctl_rst        (hssl2_csr_reg_hssl_ctl_rst              ), //o
    .hssl_ctl_send       (hssl2_csr_reg_hssl_ctl_send             ), //o
    .hssl_ctl_trigger    (hssl2_csr_reg_hssl_ctl_trigger          ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_CsrReg hssl3_csr_reg (
    .apb_PADDR           (hssl3_csr_reg_apb_PADDR[3:0]            ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_2_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_2_PENABLE       ), //i
    .apb_PREADY          (hssl3_csr_reg_apb_PREADY                ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_2_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_2_PWDATA[31:0]  ), //i
    .apb_PRDATA          (hssl3_csr_reg_apb_PRDATA[31:0]          ), //o
    .apb_PSLVERROR       (hssl3_csr_reg_apb_PSLVERROR             ), //o
    .hssl_sts            (hssl_sts_2[31:0]                        ), //i
    .hssl_ctl_rst        (hssl3_csr_reg_hssl_ctl_rst              ), //o
    .hssl_ctl_send       (hssl3_csr_reg_hssl_ctl_send             ), //o
    .hssl_ctl_trigger    (hssl3_csr_reg_hssl_ctl_trigger          ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_CsrReg hssl4_csr_reg (
    .apb_PADDR           (hssl4_csr_reg_apb_PADDR[3:0]            ), //i
    .apb_PSEL            (apb3Router_1_io_outputs_3_PSEL          ), //i
    .apb_PENABLE         (apb3Router_1_io_outputs_3_PENABLE       ), //i
    .apb_PREADY          (hssl4_csr_reg_apb_PREADY                ), //o
    .apb_PWRITE          (apb3Router_1_io_outputs_3_PWRITE        ), //i
    .apb_PWDATA          (apb3Router_1_io_outputs_3_PWDATA[31:0]  ), //i
    .apb_PRDATA          (hssl4_csr_reg_apb_PRDATA[31:0]          ), //o
    .apb_PSLVERROR       (hssl4_csr_reg_apb_PSLVERROR             ), //o
    .hssl_sts            (hssl_sts_3[31:0]                        ), //i
    .hssl_ctl_rst        (hssl4_csr_reg_hssl_ctl_rst              ), //o
    .hssl_ctl_send       (hssl4_csr_reg_hssl_ctl_send             ), //o
    .hssl_ctl_trigger    (hssl4_csr_reg_hssl_ctl_trigger          ), //o
    .clk                 (clk                                     ), //i
    .reset               (reset                                   )  //i
  );
  Apb_TxFrameReg hssl1_txframe_reg (
    .apb_PADDR        (hssl1_txframe_reg_apb_PADDR[1:0]        ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_4_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_4_PENABLE       ), //i
    .apb_PREADY       (hssl1_txframe_reg_apb_PREADY            ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_4_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_4_PWDATA[31:0]  ), //i
    .apb_PRDATA       (hssl1_txframe_reg_apb_PRDATA[31:0]      ), //o
    .apb_PSLVERROR    (hssl1_txframe_reg_apb_PSLVERROR         ), //o
    .hssl_txframe     (hssl1_txframe_reg_hssl_txframe[31:0]    ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  Apb_TxFrameReg hssl2_txframe_reg (
    .apb_PADDR        (hssl2_txframe_reg_apb_PADDR[1:0]        ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_5_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_5_PENABLE       ), //i
    .apb_PREADY       (hssl2_txframe_reg_apb_PREADY            ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_5_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_5_PWDATA[31:0]  ), //i
    .apb_PRDATA       (hssl2_txframe_reg_apb_PRDATA[31:0]      ), //o
    .apb_PSLVERROR    (hssl2_txframe_reg_apb_PSLVERROR         ), //o
    .hssl_txframe     (hssl2_txframe_reg_hssl_txframe[31:0]    ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  Apb_TxFrameReg hssl3_txframe_reg (
    .apb_PADDR        (hssl3_txframe_reg_apb_PADDR[1:0]        ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_6_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_6_PENABLE       ), //i
    .apb_PREADY       (hssl3_txframe_reg_apb_PREADY            ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_6_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_6_PWDATA[31:0]  ), //i
    .apb_PRDATA       (hssl3_txframe_reg_apb_PRDATA[31:0]      ), //o
    .apb_PSLVERROR    (hssl3_txframe_reg_apb_PSLVERROR         ), //o
    .hssl_txframe     (hssl3_txframe_reg_hssl_txframe[31:0]    ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  Apb_TxFrameReg hssl4_txframe_reg (
    .apb_PADDR        (hssl4_txframe_reg_apb_PADDR[1:0]        ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_7_PSEL          ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_7_PENABLE       ), //i
    .apb_PREADY       (hssl4_txframe_reg_apb_PREADY            ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_7_PWRITE        ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_7_PWDATA[31:0]  ), //i
    .apb_PRDATA       (hssl4_txframe_reg_apb_PRDATA[31:0]      ), //o
    .apb_PSLVERROR    (hssl4_txframe_reg_apb_PSLVERROR         ), //o
    .hssl_txframe     (hssl4_txframe_reg_hssl_txframe[31:0]    ), //o
    .clk              (clk                                     ), //i
    .reset            (reset                                   )  //i
  );
  Apb3Decoder apb_decoder (
    .io_input_PADDR         (emif32_toapb_apb_PADDR[23:0]        ), //i
    .io_input_PSEL          (emif32_toapb_apb_PSEL               ), //i
    .io_input_PENABLE       (emif32_toapb_apb_PENABLE            ), //i
    .io_input_PREADY        (apb_decoder_io_input_PREADY         ), //o
    .io_input_PWRITE        (emif32_toapb_apb_PWRITE             ), //i
    .io_input_PWDATA        (emif32_toapb_apb_PWDATA[31:0]       ), //i
    .io_input_PRDATA        (apb_decoder_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (apb_decoder_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (apb_decoder_io_output_PADDR[23:0]   ), //o
    .io_output_PSEL         (apb_decoder_io_output_PSEL[7:0]     ), //o
    .io_output_PENABLE      (apb_decoder_io_output_PENABLE       ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY        ), //i
    .io_output_PWRITE       (apb_decoder_io_output_PWRITE        ), //o
    .io_output_PWDATA       (apb_decoder_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[31:0]  ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR     )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR            (apb_decoder_io_output_PADDR[23:0]       ), //i
    .io_input_PSEL             (apb_decoder_io_output_PSEL[7:0]         ), //i
    .io_input_PENABLE          (apb_decoder_io_output_PENABLE           ), //i
    .io_input_PREADY           (apb3Router_1_io_input_PREADY            ), //o
    .io_input_PWRITE           (apb_decoder_io_output_PWRITE            ), //i
    .io_input_PWDATA           (apb_decoder_io_output_PWDATA[31:0]      ), //i
    .io_input_PRDATA           (apb3Router_1_io_input_PRDATA[31:0]      ), //o
    .io_input_PSLVERROR        (apb3Router_1_io_input_PSLVERROR         ), //o
    .io_outputs_0_PADDR        (apb3Router_1_io_outputs_0_PADDR[23:0]   ), //o
    .io_outputs_0_PSEL         (apb3Router_1_io_outputs_0_PSEL          ), //o
    .io_outputs_0_PENABLE      (apb3Router_1_io_outputs_0_PENABLE       ), //o
    .io_outputs_0_PREADY       (hssl1_csr_reg_apb_PREADY                ), //i
    .io_outputs_0_PWRITE       (apb3Router_1_io_outputs_0_PWRITE        ), //o
    .io_outputs_0_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[31:0]  ), //o
    .io_outputs_0_PRDATA       (hssl1_csr_reg_apb_PRDATA[31:0]          ), //i
    .io_outputs_0_PSLVERROR    (hssl1_csr_reg_apb_PSLVERROR             ), //i
    .io_outputs_1_PADDR        (apb3Router_1_io_outputs_1_PADDR[23:0]   ), //o
    .io_outputs_1_PSEL         (apb3Router_1_io_outputs_1_PSEL          ), //o
    .io_outputs_1_PENABLE      (apb3Router_1_io_outputs_1_PENABLE       ), //o
    .io_outputs_1_PREADY       (hssl2_csr_reg_apb_PREADY                ), //i
    .io_outputs_1_PWRITE       (apb3Router_1_io_outputs_1_PWRITE        ), //o
    .io_outputs_1_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[31:0]  ), //o
    .io_outputs_1_PRDATA       (hssl2_csr_reg_apb_PRDATA[31:0]          ), //i
    .io_outputs_1_PSLVERROR    (hssl2_csr_reg_apb_PSLVERROR             ), //i
    .io_outputs_2_PADDR        (apb3Router_1_io_outputs_2_PADDR[23:0]   ), //o
    .io_outputs_2_PSEL         (apb3Router_1_io_outputs_2_PSEL          ), //o
    .io_outputs_2_PENABLE      (apb3Router_1_io_outputs_2_PENABLE       ), //o
    .io_outputs_2_PREADY       (hssl3_csr_reg_apb_PREADY                ), //i
    .io_outputs_2_PWRITE       (apb3Router_1_io_outputs_2_PWRITE        ), //o
    .io_outputs_2_PWDATA       (apb3Router_1_io_outputs_2_PWDATA[31:0]  ), //o
    .io_outputs_2_PRDATA       (hssl3_csr_reg_apb_PRDATA[31:0]          ), //i
    .io_outputs_2_PSLVERROR    (hssl3_csr_reg_apb_PSLVERROR             ), //i
    .io_outputs_3_PADDR        (apb3Router_1_io_outputs_3_PADDR[23:0]   ), //o
    .io_outputs_3_PSEL         (apb3Router_1_io_outputs_3_PSEL          ), //o
    .io_outputs_3_PENABLE      (apb3Router_1_io_outputs_3_PENABLE       ), //o
    .io_outputs_3_PREADY       (hssl4_csr_reg_apb_PREADY                ), //i
    .io_outputs_3_PWRITE       (apb3Router_1_io_outputs_3_PWRITE        ), //o
    .io_outputs_3_PWDATA       (apb3Router_1_io_outputs_3_PWDATA[31:0]  ), //o
    .io_outputs_3_PRDATA       (hssl4_csr_reg_apb_PRDATA[31:0]          ), //i
    .io_outputs_3_PSLVERROR    (hssl4_csr_reg_apb_PSLVERROR             ), //i
    .io_outputs_4_PADDR        (apb3Router_1_io_outputs_4_PADDR[23:0]   ), //o
    .io_outputs_4_PSEL         (apb3Router_1_io_outputs_4_PSEL          ), //o
    .io_outputs_4_PENABLE      (apb3Router_1_io_outputs_4_PENABLE       ), //o
    .io_outputs_4_PREADY       (hssl1_txframe_reg_apb_PREADY            ), //i
    .io_outputs_4_PWRITE       (apb3Router_1_io_outputs_4_PWRITE        ), //o
    .io_outputs_4_PWDATA       (apb3Router_1_io_outputs_4_PWDATA[31:0]  ), //o
    .io_outputs_4_PRDATA       (hssl1_txframe_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_4_PSLVERROR    (hssl1_txframe_reg_apb_PSLVERROR         ), //i
    .io_outputs_5_PADDR        (apb3Router_1_io_outputs_5_PADDR[23:0]   ), //o
    .io_outputs_5_PSEL         (apb3Router_1_io_outputs_5_PSEL          ), //o
    .io_outputs_5_PENABLE      (apb3Router_1_io_outputs_5_PENABLE       ), //o
    .io_outputs_5_PREADY       (hssl2_txframe_reg_apb_PREADY            ), //i
    .io_outputs_5_PWRITE       (apb3Router_1_io_outputs_5_PWRITE        ), //o
    .io_outputs_5_PWDATA       (apb3Router_1_io_outputs_5_PWDATA[31:0]  ), //o
    .io_outputs_5_PRDATA       (hssl2_txframe_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_5_PSLVERROR    (hssl2_txframe_reg_apb_PSLVERROR         ), //i
    .io_outputs_6_PADDR        (apb3Router_1_io_outputs_6_PADDR[23:0]   ), //o
    .io_outputs_6_PSEL         (apb3Router_1_io_outputs_6_PSEL          ), //o
    .io_outputs_6_PENABLE      (apb3Router_1_io_outputs_6_PENABLE       ), //o
    .io_outputs_6_PREADY       (hssl3_txframe_reg_apb_PREADY            ), //i
    .io_outputs_6_PWRITE       (apb3Router_1_io_outputs_6_PWRITE        ), //o
    .io_outputs_6_PWDATA       (apb3Router_1_io_outputs_6_PWDATA[31:0]  ), //o
    .io_outputs_6_PRDATA       (hssl3_txframe_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_6_PSLVERROR    (hssl3_txframe_reg_apb_PSLVERROR         ), //i
    .io_outputs_7_PADDR        (apb3Router_1_io_outputs_7_PADDR[23:0]   ), //o
    .io_outputs_7_PSEL         (apb3Router_1_io_outputs_7_PSEL          ), //o
    .io_outputs_7_PENABLE      (apb3Router_1_io_outputs_7_PENABLE       ), //o
    .io_outputs_7_PREADY       (hssl4_txframe_reg_apb_PREADY            ), //i
    .io_outputs_7_PWRITE       (apb3Router_1_io_outputs_7_PWRITE        ), //o
    .io_outputs_7_PWDATA       (apb3Router_1_io_outputs_7_PWDATA[31:0]  ), //o
    .io_outputs_7_PRDATA       (hssl4_txframe_reg_apb_PRDATA[31:0]      ), //i
    .io_outputs_7_PSLVERROR    (hssl4_txframe_reg_apb_PSLVERROR         ), //i
    .clk                       (clk                                     ), //i
    .reset                     (reset                                   )  //i
  );
  assign emif_emif_data_write = emif32_toapb_emif_emif_data_write;
  assign emif_emif_data_writeEnable = emif32_toapb_emif_emif_data_writeEnable;
  assign hssl_txframe_0 = hssl1_txframe_reg_hssl_txframe;
  assign hssl_txframe_1 = hssl2_txframe_reg_hssl_txframe;
  assign hssl_txframe_2 = hssl3_txframe_reg_hssl_txframe;
  assign hssl_txframe_3 = hssl4_txframe_reg_hssl_txframe;
  assign hssl1_csr_reg_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign hssl2_csr_reg_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign hssl3_csr_reg_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign hssl4_csr_reg_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[3:0];
  assign hssl1_txframe_reg_apb_PADDR = apb3Router_1_io_outputs_4_PADDR[1:0];
  assign hssl2_txframe_reg_apb_PADDR = apb3Router_1_io_outputs_5_PADDR[1:0];
  assign hssl3_txframe_reg_apb_PADDR = apb3Router_1_io_outputs_6_PADDR[1:0];
  assign hssl4_txframe_reg_apb_PADDR = apb3Router_1_io_outputs_7_PADDR[1:0];

endmodule

module Apb3Router (
  input      [23:0]   io_input_PADDR,
  input      [7:0]    io_input_PSEL,
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
  input      [23:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [23:0]   io_output_PADDR,
  output reg [7:0]    io_output_PSEL,
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
    io_output_PSEL[4] = (((io_input_PADDR & (~ 24'h000003)) == 24'h010ffc) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 24'h000003)) == 24'h0117fc) && io_input_PSEL[0]);
    io_output_PSEL[6] = (((io_input_PADDR & (~ 24'h000003)) == 24'h011ffc) && io_input_PSEL[0]);
    io_output_PSEL[7] = (((io_input_PADDR & (~ 24'h000003)) == 24'h0127fc) && io_input_PSEL[0]);
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

//Apb_TxFrameReg replaced by Apb_TxFrameReg

//Apb_TxFrameReg replaced by Apb_TxFrameReg

//Apb_TxFrameReg replaced by Apb_TxFrameReg

module Apb_TxFrameReg (
  input      [1:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output     [31:0]   hssl_txframe,
  input               clk,
  input               reset
);

  reg        [31:0]   hssl_txframe_1;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [31:0]   hssl_txframe_1_driver;

  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      2'b00 : begin
        apb_PRDATA[31 : 0] = hssl_txframe_1_driver;
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
  assign hssl_txframe = hssl_txframe_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      hssl_txframe_1 <= 32'h0;
    end else begin
      hssl_txframe_1 <= hssl_txframe_1_driver;
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      2'b00 : begin
        if(busCtrl_doWrite) begin
          hssl_txframe_1_driver <= apb_PWDATA[31 : 0];
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

  reg        [31:0]   hssl_sts_1;
  reg        [31:0]   hssl_ctl_reg;
  reg        [31:0]   hssl_sr_reg;
  reg        [0:0]    Hssl_CTL_RST_1;
  reg        [0:0]    Hssl_CTL_SEND_1;
  reg        [0:0]    Hssl_CTL_TRIGGER_1;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
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
      Hssl_CTL_RST_1 <= hssl_ctl_reg[0];
      Hssl_CTL_SEND_1 <= hssl_ctl_reg[2];
      Hssl_CTL_TRIGGER_1 <= hssl_ctl_reg[7];
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
  reg        [31:0]   wr_datatemp;
  wire       [15:0]   rd_datatemp;
  wire                when_EMIF32_l34;
  wire                when_EMIF32_l36;

  assign _zz_apb_PADDR = ({2'd0,emif_emif_addr[22 : 0]} <<< 2);
  assign rd_datatemp = 16'h0;
  assign apb_PADDR = _zz_apb_PADDR[23:0];
  assign apb_PSEL = (~ emif_emif_cs);
  assign apb_PENABLE = ((! emif_emif_oe) || (! emif_emif_we));
  assign apb_PWRITE = (((! emif_emif_we) && emif_emif_oe) && emif_emif_addr[23]);
  assign emif_emif_data_writeEnable = (! emif_emif_oe);
  assign emif_emif_data_write = ((! emif_emif_addr[23]) ? apb_PRDATA[15 : 0] : apb_PRDATA[31 : 16]);
  assign when_EMIF32_l34 = (((! emif_emif_we) && emif_emif_oe) && (! emif_emif_addr[23]));
  assign when_EMIF32_l36 = (((! emif_emif_we) && emif_emif_oe) && emif_emif_addr[23]);
  assign apb_PWDATA = wr_datatemp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      wr_datatemp <= 32'h0;
    end else begin
      if(when_EMIF32_l34) begin
        wr_datatemp[15 : 0] <= emif_emif_data_read;
      end else begin
        if(when_EMIF32_l36) begin
          wr_datatemp[31 : 16] <= emif_emif_data_read;
        end
      end
    end
  end


endmodule
