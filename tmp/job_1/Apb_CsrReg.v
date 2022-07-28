// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Apb_CsrReg
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

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
  reg                 Bus_isWrite4_delay_3;
  reg                 Bus_isWrite4_delay_4;
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
      Bus_isWrite4_delay_3 <= 1'b0;
      Bus_isWrite4_delay_4 <= 1'b0;
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
      Bus_isWrite4_delay_3 <= Bus_isWrite4_delay_2;
      Bus_isWrite4_delay_4 <= Bus_isWrite4_delay_3;
      Write4_Delay <= Bus_isWrite4_delay_4;
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
