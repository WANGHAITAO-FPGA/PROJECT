// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Mo_Top_Test
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

module Mo_Top_Test (
  input      [23:0]   emif_emif_addr,
  input      [15:0]   emif_emif_data_read,
  output     [15:0]   emif_emif_data_write,
  output              emif_emif_data_writeEnable,
  input               emif_emif_cs,
  input               emif_emif_we,
  input               emif_emif_oe,
  input               clk,
  input               reset,
  input      [31:0]   hssl_sts_0,
  input      [31:0]   hssl_sts_1,
  input      [31:0]   hssl_sts_2,
  input      [31:0]   hssl_sts_3
);

  wire       [3:0]    area_hssl1_csr_reg_apb_PADDR;
  wire       [3:0]    area_hssl2_csr_reg_apb_PADDR;
  wire       [3:0]    area_hssl3_csr_reg_apb_PADDR;
  wire       [3:0]    area_hssl4_csr_reg_apb_PADDR;
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
  wire                apb_decoder_io_input_PREADY;
  wire       [31:0]   apb_decoder_io_input_PRDATA;
  wire                apb_decoder_io_input_PSLVERROR;
  wire       [23:0]   apb_decoder_io_output_PADDR;
  wire       [3:0]    apb_decoder_io_output_PSEL;
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

  EMIF32_Apb area_emif32_toapb (
    .emif_emif_addr             (emif_emif_addr[23:0]                        ), //i
    .emif_emif_data_read        (emif_emif_data_read[15:0]                   ), //i
    .emif_emif_data_write       (area_emif32_toapb_emif_emif_data_write[15:0]), //o
    .emif_emif_data_writeEnable (area_emif32_toapb_emif_emif_data_writeEnable), //o
    .emif_emif_cs               (emif_emif_cs                                ), //i
    .emif_emif_we               (emif_emif_we                                ), //i
    .emif_emif_oe               (emif_emif_oe                                ), //i
    .apb_PADDR                  (area_emif32_toapb_apb_PADDR[23:0]           ), //o
    .apb_PSEL                   (area_emif32_toapb_apb_PSEL                  ), //o
    .apb_PENABLE                (area_emif32_toapb_apb_PENABLE               ), //o
    .apb_PREADY                 (apb_decoder_io_input_PREADY                 ), //i
    .apb_PWRITE                 (area_emif32_toapb_apb_PWRITE                ), //o
    .apb_PWDATA                 (area_emif32_toapb_apb_PWDATA[31:0]          ), //o
    .apb_PRDATA                 (apb_decoder_io_input_PRDATA[31:0]           ), //i
    .apb_PSLVERROR              (apb_decoder_io_input_PSLVERROR              ), //i
    .clk                        (clk                                         ), //i
    .reset                      (reset                                       )  //i
  );
  Apb_CsrReg area_hssl1_csr_reg (
    .apb_PADDR        (area_hssl1_csr_reg_apb_PADDR[3:0]     ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_0_PSEL        ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_0_PENABLE     ), //i
    .apb_PREADY       (area_hssl1_csr_reg_apb_PREADY         ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_0_PWRITE      ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_0_PWDATA[31:0]), //i
    .apb_PRDATA       (area_hssl1_csr_reg_apb_PRDATA[31:0]   ), //o
    .apb_PSLVERROR    (area_hssl1_csr_reg_apb_PSLVERROR      ), //o
    .hssl_sts         (hssl_sts_0[31:0]                      ), //i
    .hssl_ctl_rst     (area_hssl1_csr_reg_hssl_ctl_rst       ), //o
    .hssl_ctl_send    (area_hssl1_csr_reg_hssl_ctl_send      ), //o
    .hssl_ctl_trigger (area_hssl1_csr_reg_hssl_ctl_trigger   ), //o
    .clk              (clk                                   ), //i
    .reset            (reset                                 )  //i
  );
  Apb_CsrReg area_hssl2_csr_reg (
    .apb_PADDR        (area_hssl2_csr_reg_apb_PADDR[3:0]     ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_1_PSEL        ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_1_PENABLE     ), //i
    .apb_PREADY       (area_hssl2_csr_reg_apb_PREADY         ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_1_PWRITE      ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[31:0]), //i
    .apb_PRDATA       (area_hssl2_csr_reg_apb_PRDATA[31:0]   ), //o
    .apb_PSLVERROR    (area_hssl2_csr_reg_apb_PSLVERROR      ), //o
    .hssl_sts         (hssl_sts_1[31:0]                      ), //i
    .hssl_ctl_rst     (area_hssl2_csr_reg_hssl_ctl_rst       ), //o
    .hssl_ctl_send    (area_hssl2_csr_reg_hssl_ctl_send      ), //o
    .hssl_ctl_trigger (area_hssl2_csr_reg_hssl_ctl_trigger   ), //o
    .clk              (clk                                   ), //i
    .reset            (reset                                 )  //i
  );
  Apb_CsrReg area_hssl3_csr_reg (
    .apb_PADDR        (area_hssl3_csr_reg_apb_PADDR[3:0]     ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_2_PSEL        ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_2_PENABLE     ), //i
    .apb_PREADY       (area_hssl3_csr_reg_apb_PREADY         ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_2_PWRITE      ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_2_PWDATA[31:0]), //i
    .apb_PRDATA       (area_hssl3_csr_reg_apb_PRDATA[31:0]   ), //o
    .apb_PSLVERROR    (area_hssl3_csr_reg_apb_PSLVERROR      ), //o
    .hssl_sts         (hssl_sts_2[31:0]                      ), //i
    .hssl_ctl_rst     (area_hssl3_csr_reg_hssl_ctl_rst       ), //o
    .hssl_ctl_send    (area_hssl3_csr_reg_hssl_ctl_send      ), //o
    .hssl_ctl_trigger (area_hssl3_csr_reg_hssl_ctl_trigger   ), //o
    .clk              (clk                                   ), //i
    .reset            (reset                                 )  //i
  );
  Apb_CsrReg area_hssl4_csr_reg (
    .apb_PADDR        (area_hssl4_csr_reg_apb_PADDR[3:0]     ), //i
    .apb_PSEL         (apb3Router_1_io_outputs_3_PSEL        ), //i
    .apb_PENABLE      (apb3Router_1_io_outputs_3_PENABLE     ), //i
    .apb_PREADY       (area_hssl4_csr_reg_apb_PREADY         ), //o
    .apb_PWRITE       (apb3Router_1_io_outputs_3_PWRITE      ), //i
    .apb_PWDATA       (apb3Router_1_io_outputs_3_PWDATA[31:0]), //i
    .apb_PRDATA       (area_hssl4_csr_reg_apb_PRDATA[31:0]   ), //o
    .apb_PSLVERROR    (area_hssl4_csr_reg_apb_PSLVERROR      ), //o
    .hssl_sts         (hssl_sts_3[31:0]                      ), //i
    .hssl_ctl_rst     (area_hssl4_csr_reg_hssl_ctl_rst       ), //o
    .hssl_ctl_send    (area_hssl4_csr_reg_hssl_ctl_send      ), //o
    .hssl_ctl_trigger (area_hssl4_csr_reg_hssl_ctl_trigger   ), //o
    .clk              (clk                                   ), //i
    .reset            (reset                                 )  //i
  );
  Apb3Decoder apb_decoder (
    .io_input_PADDR      (area_emif32_toapb_apb_PADDR[23:0] ), //i
    .io_input_PSEL       (area_emif32_toapb_apb_PSEL        ), //i
    .io_input_PENABLE    (area_emif32_toapb_apb_PENABLE     ), //i
    .io_input_PREADY     (apb_decoder_io_input_PREADY       ), //o
    .io_input_PWRITE     (area_emif32_toapb_apb_PWRITE      ), //i
    .io_input_PWDATA     (area_emif32_toapb_apb_PWDATA[31:0]), //i
    .io_input_PRDATA     (apb_decoder_io_input_PRDATA[31:0] ), //o
    .io_input_PSLVERROR  (apb_decoder_io_input_PSLVERROR    ), //o
    .io_output_PADDR     (apb_decoder_io_output_PADDR[23:0] ), //o
    .io_output_PSEL      (apb_decoder_io_output_PSEL[3:0]   ), //o
    .io_output_PENABLE   (apb_decoder_io_output_PENABLE     ), //o
    .io_output_PREADY    (apb3Router_1_io_input_PREADY      ), //i
    .io_output_PWRITE    (apb_decoder_io_output_PWRITE      ), //o
    .io_output_PWDATA    (apb_decoder_io_output_PWDATA[31:0]), //o
    .io_output_PRDATA    (apb3Router_1_io_input_PRDATA[31:0]), //i
    .io_output_PSLVERROR (apb3Router_1_io_input_PSLVERROR   )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR         (apb_decoder_io_output_PADDR[23:0]     ), //i
    .io_input_PSEL          (apb_decoder_io_output_PSEL[3:0]       ), //i
    .io_input_PENABLE       (apb_decoder_io_output_PENABLE         ), //i
    .io_input_PREADY        (apb3Router_1_io_input_PREADY          ), //o
    .io_input_PWRITE        (apb_decoder_io_output_PWRITE          ), //i
    .io_input_PWDATA        (apb_decoder_io_output_PWDATA[31:0]    ), //i
    .io_input_PRDATA        (apb3Router_1_io_input_PRDATA[31:0]    ), //o
    .io_input_PSLVERROR     (apb3Router_1_io_input_PSLVERROR       ), //o
    .io_outputs_0_PADDR     (apb3Router_1_io_outputs_0_PADDR[23:0] ), //o
    .io_outputs_0_PSEL      (apb3Router_1_io_outputs_0_PSEL        ), //o
    .io_outputs_0_PENABLE   (apb3Router_1_io_outputs_0_PENABLE     ), //o
    .io_outputs_0_PREADY    (area_hssl1_csr_reg_apb_PREADY         ), //i
    .io_outputs_0_PWRITE    (apb3Router_1_io_outputs_0_PWRITE      ), //o
    .io_outputs_0_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]), //o
    .io_outputs_0_PRDATA    (area_hssl1_csr_reg_apb_PRDATA[31:0]   ), //i
    .io_outputs_0_PSLVERROR (area_hssl1_csr_reg_apb_PSLVERROR      ), //i
    .io_outputs_1_PADDR     (apb3Router_1_io_outputs_1_PADDR[23:0] ), //o
    .io_outputs_1_PSEL      (apb3Router_1_io_outputs_1_PSEL        ), //o
    .io_outputs_1_PENABLE   (apb3Router_1_io_outputs_1_PENABLE     ), //o
    .io_outputs_1_PREADY    (area_hssl2_csr_reg_apb_PREADY         ), //i
    .io_outputs_1_PWRITE    (apb3Router_1_io_outputs_1_PWRITE      ), //o
    .io_outputs_1_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]), //o
    .io_outputs_1_PRDATA    (area_hssl2_csr_reg_apb_PRDATA[31:0]   ), //i
    .io_outputs_1_PSLVERROR (area_hssl2_csr_reg_apb_PSLVERROR      ), //i
    .io_outputs_2_PADDR     (apb3Router_1_io_outputs_2_PADDR[23:0] ), //o
    .io_outputs_2_PSEL      (apb3Router_1_io_outputs_2_PSEL        ), //o
    .io_outputs_2_PENABLE   (apb3Router_1_io_outputs_2_PENABLE     ), //o
    .io_outputs_2_PREADY    (area_hssl3_csr_reg_apb_PREADY         ), //i
    .io_outputs_2_PWRITE    (apb3Router_1_io_outputs_2_PWRITE      ), //o
    .io_outputs_2_PWDATA    (apb3Router_1_io_outputs_2_PWDATA[31:0]), //o
    .io_outputs_2_PRDATA    (area_hssl3_csr_reg_apb_PRDATA[31:0]   ), //i
    .io_outputs_2_PSLVERROR (area_hssl3_csr_reg_apb_PSLVERROR      ), //i
    .io_outputs_3_PADDR     (apb3Router_1_io_outputs_3_PADDR[23:0] ), //o
    .io_outputs_3_PSEL      (apb3Router_1_io_outputs_3_PSEL        ), //o
    .io_outputs_3_PENABLE   (apb3Router_1_io_outputs_3_PENABLE     ), //o
    .io_outputs_3_PREADY    (area_hssl4_csr_reg_apb_PREADY         ), //i
    .io_outputs_3_PWRITE    (apb3Router_1_io_outputs_3_PWRITE      ), //o
    .io_outputs_3_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]), //o
    .io_outputs_3_PRDATA    (area_hssl4_csr_reg_apb_PRDATA[31:0]   ), //i
    .io_outputs_3_PSLVERROR (area_hssl4_csr_reg_apb_PSLVERROR      ), //i
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  assign emif_emif_data_write = area_emif32_toapb_emif_emif_data_write;
  assign emif_emif_data_writeEnable = area_emif32_toapb_emif_emif_data_writeEnable;
  assign area_hssl1_csr_reg_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[3:0];
  assign area_hssl2_csr_reg_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign area_hssl3_csr_reg_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign area_hssl4_csr_reg_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[3:0];

endmodule

module Apb3Router (
  input      [23:0]   io_input_PADDR,
  input      [3:0]    io_input_PSEL,
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
  input               clk,
  input               reset
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      2'b10 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
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
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = (io_input_PSEL[1] || _zz_selIndex);
  assign _zz_selIndex_2 = (io_input_PSEL[2] || _zz_selIndex);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge clk) begin
    selIndex <= {_zz_selIndex_2,_zz_selIndex_1};
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
  output reg [3:0]    io_output_PSEL,
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

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 4'b0000));

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
  reg                 Bus_isWrite4;
  reg                 _zz_Bus_isWrite4;
  reg                 Write4_Delay;
  reg                 Bus_isWrite4_delay_1;
  reg                 Bus_isWrite4_delay_2;
  reg        [0:0]    Hssl_CTL_RST_1;
  (* async_reg = "true" *) reg        [0:0]    Hssl_CTL_SEND_1;
  reg        [0:0]    Hssl_CTL_TRIGGER_1;
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
      4'b0100 : begin
        apb_PRDATA[31 : 0] = hssl_ctl_reg_driver;
      end
      4'b0000 : begin
        apb_PRDATA[31 : 0] = hssl_sts_1;
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
    _zz_Bus_isWrite4 = 1'b0;
    case(apb_PADDR)
      4'b0100 : begin
        if(busCtrl_doWrite) begin
          _zz_Bus_isWrite4 = 1'b1;
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
      Bus_isWrite4 <= 1'b0;
      Write4_Delay <= 1'b0;
      Bus_isWrite4_delay_1 <= 1'b0;
      Bus_isWrite4_delay_2 <= 1'b0;
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
      Bus_isWrite4 <= _zz_Bus_isWrite4;
      Bus_isWrite4_delay_1 <= Bus_isWrite4;
      Bus_isWrite4_delay_2 <= Bus_isWrite4_delay_1;
      Write4_Delay <= Bus_isWrite4_delay_2;
      Hssl_CTL_RST_1 <= (hssl_ctl_reg[0] && Write4_Delay);
      Hssl_CTL_SEND_1 <= (hssl_ctl_reg[2] && Write4_Delay);
      Hssl_CTL_TRIGGER_1 <= (hssl_ctl_reg[7] && Write4_Delay);
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
  assign emif_emif_data_writeEnable = ((! emif_emif_oe) && (! emif_emif_cs));
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
