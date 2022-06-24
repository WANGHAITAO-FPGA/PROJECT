// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Emif32_test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Emif32_test (
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

  reg                 penable;
  reg        [31:0]   wr_datatemp;
  reg        [15:0]   rd_datatemp;
  reg                 penable_regNext;
  wire                when_EMIF32_l31;
  wire                when_EMIF32_l36;
  reg        [15:0]   rd_datatemp_regNextWhen;
  wire                when_EMIF32_l38;
  wire                when_EMIF32_l40;

  assign apb_PADDR = emif_emif_addr;
  assign apb_PSEL = (~ emif_emif_cs);
  assign apb_PENABLE = ((penable && (! penable_regNext)) ? penable : 1'b0);
  assign apb_PWRITE = (((! emif_emif_we) && emif_emif_oe) && emif_emif_addr[23]);
  assign emif_emif_data_writeEnable = (! emif_emif_oe);
  assign when_EMIF32_l31 = (! emif_emif_addr[23]);
  assign when_EMIF32_l36 = (! emif_emif_oe);
  assign emif_emif_data_write = rd_datatemp_regNextWhen;
  assign when_EMIF32_l38 = (((! emif_emif_we) && emif_emif_oe) && (! emif_emif_addr[23]));
  assign when_EMIF32_l40 = (((! emif_emif_we) && emif_emif_oe) && emif_emif_addr[23]);
  assign apb_PWDATA = wr_datatemp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      penable <= 1'b0;
      wr_datatemp <= 32'h0;
      rd_datatemp <= 16'h0;
    end else begin
      penable <= ((! emif_emif_oe) || (! emif_emif_we));
      if(when_EMIF32_l31) begin
        rd_datatemp <= apb_PRDATA[15 : 0];
      end else begin
        rd_datatemp <= apb_PRDATA[31 : 16];
      end
      if(when_EMIF32_l38) begin
        wr_datatemp[15 : 0] <= emif_emif_data_read;
      end else begin
        if(when_EMIF32_l40) begin
          wr_datatemp[31 : 16] <= emif_emif_data_read;
        end
      end
    end
  end

  always @(posedge clk) begin
    penable_regNext <= penable;
    if(when_EMIF32_l36) begin
      rd_datatemp_regNextWhen <= rd_datatemp;
    end
  end


endmodule
