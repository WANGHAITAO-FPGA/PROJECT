// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Uart_Test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Uart_Test (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input      [31:0]   slave_id,
  input               clk,
  input               reset
);

  wire                tx_simplebus_output_valid;
  wire                tx_simplebus_output_payload_last;
  wire       [31:0]   tx_simplebus_output_payload_fragment;
  wire                tx_simplebus_RENABLE;
  wire       [11:0]   tx_simplebus_RADDR;
  wire       [31:0]   fiberTest_rom_1_simplebus_RDATA;

  Test_TxSimpleBus tx_simplebus (
    .output_valid               (tx_simplebus_output_valid                   ), //o
    .output_ready               (output_ready                                ), //i
    .output_payload_last        (tx_simplebus_output_payload_last            ), //o
    .output_payload_fragment    (tx_simplebus_output_payload_fragment[31:0]  ), //o
    .RENABLE                    (tx_simplebus_RENABLE                        ), //o
    .RADDR                      (tx_simplebus_RADDR[11:0]                    ), //o
    .RDATA                      (fiberTest_rom_1_simplebus_RDATA[31:0]       ), //i
    .timer_tick                 (1'b1                                        ), //i
    .clk                        (clk                                         ), //i
    .reset                      (reset                                       )  //i
  );
  FiberTest_Rom fiberTest_rom_1 (
    .simplebus_RADDR      (tx_simplebus_RADDR[11:0]               ), //i
    .simplebus_RDATA      (fiberTest_rom_1_simplebus_RDATA[31:0]  ), //o
    .simplebus_RENABLE    (tx_simplebus_RENABLE                   ), //i
    .simplebus_WADDR      (12'h0                                  ), //i
    .simplebus_WDATA      (32'h0                                  ), //i
    .simplebus_WENABLE    (1'b0                                   ), //i
    .slave_id             (slave_id[31:0]                         ), //i
    .clk                  (clk                                    ), //i
    .reset                (reset                                  )  //i
  );
  assign output_valid = tx_simplebus_output_valid;
  assign output_payload_last = tx_simplebus_output_payload_last;
  assign output_payload_fragment = tx_simplebus_output_payload_fragment;

endmodule

module FiberTest_Rom (
  input      [11:0]   simplebus_RADDR,
  output     [31:0]   simplebus_RDATA,
  input               simplebus_RENABLE,
  input      [11:0]   simplebus_WADDR,
  input      [31:0]   simplebus_WDATA,
  input               simplebus_WENABLE,
  input      [31:0]   slave_id,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire       [31:0]   HEADER;
  wire       [31:0]   Slaveid;
  wire                when_RegInst_l153;
  reg        [31:0]   _zz_busslave_readData;
  wire                when_RegInst_l153_1;
  reg        [31:0]   _zz_busslave_readData_1;
  wire                when_RegInst_l153_2;
  reg        [31:0]   _zz_busslave_readData_2;
  wire                when_RegInst_l153_3;
  reg        [31:0]   _zz_busslave_readData_3;
  wire                when_RegInst_l153_4;
  reg        [31:0]   _zz_busslave_readData_4;
  wire                when_RegInst_l153_5;
  reg        [31:0]   _zz_busslave_readData_5;
  wire                when_RegInst_l153_6;
  reg        [31:0]   _zz_busslave_readData_6;
  wire                when_RegInst_l153_7;
  reg        [31:0]   _zz_busslave_readData_7;
  wire                when_RegInst_l153_8;
  reg        [31:0]   _zz_busslave_readData_8;
  wire                when_RegInst_l153_9;
  reg        [31:0]   _zz_busslave_readData_9;
  wire                when_RegInst_l153_10;
  reg        [31:0]   _zz_busslave_readData_10;
  wire                when_RegInst_l153_11;
  reg        [31:0]   _zz_busslave_readData_11;
  wire                when_RegInst_l153_12;
  reg        [31:0]   _zz_busslave_readData_12;
  wire                when_RegInst_l153_13;
  reg        [31:0]   _zz_busslave_readData_13;
  wire                when_RegInst_l153_14;
  reg        [31:0]   _zz_busslave_readData_14;
  wire                when_RegInst_l153_15;
  reg        [31:0]   _zz_busslave_readData_15;
  wire                when_RegInst_l153_16;
  reg        [31:0]   _zz_busslave_readData_16;
  wire                when_RegInst_l153_17;
  reg        [31:0]   _zz_busslave_readData_17;
  wire                when_RegInst_l153_18;
  reg        [31:0]   _zz_busslave_readData_18;
  wire                when_RegInst_l153_19;
  reg        [31:0]   _zz_busslave_readData_19;
  wire                when_RegInst_l153_20;
  reg        [31:0]   _zz_busslave_readData_20;
  wire                when_RegInst_l153_21;
  reg        [31:0]   _zz_busslave_readData_21;
  wire                when_RegInst_l153_22;
  reg        [31:0]   _zz_busslave_readData_22;
  wire                when_RegInst_l153_23;
  reg        [31:0]   _zz_busslave_readData_23;
  wire                when_RegInst_l153_24;
  reg        [31:0]   _zz_busslave_readData_24;
  wire                when_RegInst_l153_25;
  reg        [31:0]   _zz_busslave_readData_25;
  wire                when_RegInst_l153_26;
  reg        [31:0]   _zz_busslave_readData_26;
  wire                when_RegInst_l153_27;
  reg        [31:0]   _zz_busslave_readData_27;
  wire                when_RegInst_l153_28;
  reg        [31:0]   _zz_busslave_readData_28;
  wire                when_RegInst_l153_29;
  reg        [31:0]   _zz_busslave_readData_29;
  wire                when_RegInst_l153_30;
  reg        [31:0]   _zz_busslave_readData_30;
  wire                when_RegInst_l153_31;
  reg        [31:0]   _zz_busslave_readData_31;
  wire                when_RegInst_l153_32;
  reg        [31:0]   _zz_busslave_readData_32;
  wire                when_RegInst_l153_33;
  reg        [31:0]   _zz_busslave_readData_33;
  wire                when_RegInst_l153_34;
  reg        [31:0]   _zz_busslave_readData_34;
  wire                when_RegInst_l153_35;
  reg        [31:0]   _zz_busslave_readData_35;
  wire                when_RegInst_l153_36;
  reg        [31:0]   _zz_busslave_readData_36;
  wire                when_RegInst_l153_37;
  reg        [31:0]   _zz_busslave_readData_37;
  wire                when_RegInst_l153_38;
  reg        [31:0]   _zz_busslave_readData_38;
  wire                when_RegInst_l153_39;
  reg        [31:0]   _zz_busslave_readData_39;
  wire                when_RegInst_l153_40;
  reg        [31:0]   _zz_busslave_readData_40;
  wire                when_RegInst_l153_41;
  reg        [31:0]   _zz_busslave_readData_41;

  assign simplebus_RDATA = busslave_readData;
  assign HEADER = 32'h00f1f2f3;
  assign Slaveid = slave_id;
  assign when_RegInst_l153 = ((simplebus_WADDR == 12'h010) && simplebus_WENABLE);
  assign when_RegInst_l153_1 = ((simplebus_WADDR == 12'h014) && simplebus_WENABLE);
  assign when_RegInst_l153_2 = ((simplebus_WADDR == 12'h018) && simplebus_WENABLE);
  assign when_RegInst_l153_3 = ((simplebus_WADDR == 12'h01c) && simplebus_WENABLE);
  assign when_RegInst_l153_4 = ((simplebus_WADDR == 12'h020) && simplebus_WENABLE);
  assign when_RegInst_l153_5 = ((simplebus_WADDR == 12'h024) && simplebus_WENABLE);
  assign when_RegInst_l153_6 = ((simplebus_WADDR == 12'h030) && simplebus_WENABLE);
  assign when_RegInst_l153_7 = ((simplebus_WADDR == 12'h034) && simplebus_WENABLE);
  assign when_RegInst_l153_8 = ((simplebus_WADDR == 12'h038) && simplebus_WENABLE);
  assign when_RegInst_l153_9 = ((simplebus_WADDR == 12'h03c) && simplebus_WENABLE);
  assign when_RegInst_l153_10 = ((simplebus_WADDR == 12'h040) && simplebus_WENABLE);
  assign when_RegInst_l153_11 = ((simplebus_WADDR == 12'h044) && simplebus_WENABLE);
  assign when_RegInst_l153_12 = ((simplebus_WADDR == 12'h050) && simplebus_WENABLE);
  assign when_RegInst_l153_13 = ((simplebus_WADDR == 12'h054) && simplebus_WENABLE);
  assign when_RegInst_l153_14 = ((simplebus_WADDR == 12'h058) && simplebus_WENABLE);
  assign when_RegInst_l153_15 = ((simplebus_WADDR == 12'h05c) && simplebus_WENABLE);
  assign when_RegInst_l153_16 = ((simplebus_WADDR == 12'h060) && simplebus_WENABLE);
  assign when_RegInst_l153_17 = ((simplebus_WADDR == 12'h064) && simplebus_WENABLE);
  assign when_RegInst_l153_18 = ((simplebus_WADDR == 12'h070) && simplebus_WENABLE);
  assign when_RegInst_l153_19 = ((simplebus_WADDR == 12'h074) && simplebus_WENABLE);
  assign when_RegInst_l153_20 = ((simplebus_WADDR == 12'h078) && simplebus_WENABLE);
  assign when_RegInst_l153_21 = ((simplebus_WADDR == 12'h07c) && simplebus_WENABLE);
  assign when_RegInst_l153_22 = ((simplebus_WADDR == 12'h080) && simplebus_WENABLE);
  assign when_RegInst_l153_23 = ((simplebus_WADDR == 12'h084) && simplebus_WENABLE);
  assign when_RegInst_l153_24 = ((simplebus_WADDR == 12'h090) && simplebus_WENABLE);
  assign when_RegInst_l153_25 = ((simplebus_WADDR == 12'h094) && simplebus_WENABLE);
  assign when_RegInst_l153_26 = ((simplebus_WADDR == 12'h098) && simplebus_WENABLE);
  assign when_RegInst_l153_27 = ((simplebus_WADDR == 12'h09c) && simplebus_WENABLE);
  assign when_RegInst_l153_28 = ((simplebus_WADDR == 12'h0a0) && simplebus_WENABLE);
  assign when_RegInst_l153_29 = ((simplebus_WADDR == 12'h0a4) && simplebus_WENABLE);
  assign when_RegInst_l153_30 = ((simplebus_WADDR == 12'h0b0) && simplebus_WENABLE);
  assign when_RegInst_l153_31 = ((simplebus_WADDR == 12'h0b4) && simplebus_WENABLE);
  assign when_RegInst_l153_32 = ((simplebus_WADDR == 12'h0b8) && simplebus_WENABLE);
  assign when_RegInst_l153_33 = ((simplebus_WADDR == 12'h0bc) && simplebus_WENABLE);
  assign when_RegInst_l153_34 = ((simplebus_WADDR == 12'h0c0) && simplebus_WENABLE);
  assign when_RegInst_l153_35 = ((simplebus_WADDR == 12'h0c4) && simplebus_WENABLE);
  assign when_RegInst_l153_36 = ((simplebus_WADDR == 12'h0d0) && simplebus_WENABLE);
  assign when_RegInst_l153_37 = ((simplebus_WADDR == 12'h0d4) && simplebus_WENABLE);
  assign when_RegInst_l153_38 = ((simplebus_WADDR == 12'h0d8) && simplebus_WENABLE);
  assign when_RegInst_l153_39 = ((simplebus_WADDR == 12'h0dc) && simplebus_WENABLE);
  assign when_RegInst_l153_40 = ((simplebus_WADDR == 12'h0e0) && simplebus_WENABLE);
  assign when_RegInst_l153_41 = ((simplebus_WADDR == 12'h0e4) && simplebus_WENABLE);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
      _zz_busslave_readData <= 32'h0;
      _zz_busslave_readData_1 <= 32'h0;
      _zz_busslave_readData_2 <= 32'h0;
      _zz_busslave_readData_3 <= 32'h0;
      _zz_busslave_readData_4 <= 32'h0;
      _zz_busslave_readData_5 <= 32'h0;
      _zz_busslave_readData_6 <= 32'h0;
      _zz_busslave_readData_7 <= 32'h0;
      _zz_busslave_readData_8 <= 32'h0;
      _zz_busslave_readData_9 <= 32'h0;
      _zz_busslave_readData_10 <= 32'h0;
      _zz_busslave_readData_11 <= 32'h0;
      _zz_busslave_readData_12 <= 32'h0;
      _zz_busslave_readData_13 <= 32'h0;
      _zz_busslave_readData_14 <= 32'h0;
      _zz_busslave_readData_15 <= 32'h0;
      _zz_busslave_readData_16 <= 32'h0;
      _zz_busslave_readData_17 <= 32'h0;
      _zz_busslave_readData_18 <= 32'h0;
      _zz_busslave_readData_19 <= 32'h0;
      _zz_busslave_readData_20 <= 32'h0;
      _zz_busslave_readData_21 <= 32'h0;
      _zz_busslave_readData_22 <= 32'h0;
      _zz_busslave_readData_23 <= 32'h0;
      _zz_busslave_readData_24 <= 32'h0;
      _zz_busslave_readData_25 <= 32'h0;
      _zz_busslave_readData_26 <= 32'h0;
      _zz_busslave_readData_27 <= 32'h0;
      _zz_busslave_readData_28 <= 32'h0;
      _zz_busslave_readData_29 <= 32'h0;
      _zz_busslave_readData_30 <= 32'h0;
      _zz_busslave_readData_31 <= 32'h0;
      _zz_busslave_readData_32 <= 32'h0;
      _zz_busslave_readData_33 <= 32'h0;
      _zz_busslave_readData_34 <= 32'h0;
      _zz_busslave_readData_35 <= 32'h0;
      _zz_busslave_readData_36 <= 32'h0;
      _zz_busslave_readData_37 <= 32'h0;
      _zz_busslave_readData_38 <= 32'h0;
      _zz_busslave_readData_39 <= 32'h0;
      _zz_busslave_readData_40 <= 32'h0;
      _zz_busslave_readData_41 <= 32'h0;
    end else begin
      if(when_RegInst_l153) begin
        _zz_busslave_readData <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_1) begin
        _zz_busslave_readData_1 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_2) begin
        _zz_busslave_readData_2 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_3) begin
        _zz_busslave_readData_3 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_4) begin
        _zz_busslave_readData_4 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_5) begin
        _zz_busslave_readData_5 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_6) begin
        _zz_busslave_readData_6 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_7) begin
        _zz_busslave_readData_7 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_8) begin
        _zz_busslave_readData_8 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_9) begin
        _zz_busslave_readData_9 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_10) begin
        _zz_busslave_readData_10 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_11) begin
        _zz_busslave_readData_11 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_12) begin
        _zz_busslave_readData_12 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_13) begin
        _zz_busslave_readData_13 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_14) begin
        _zz_busslave_readData_14 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_15) begin
        _zz_busslave_readData_15 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_16) begin
        _zz_busslave_readData_16 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_17) begin
        _zz_busslave_readData_17 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_18) begin
        _zz_busslave_readData_18 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_19) begin
        _zz_busslave_readData_19 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_20) begin
        _zz_busslave_readData_20 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_21) begin
        _zz_busslave_readData_21 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_22) begin
        _zz_busslave_readData_22 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_23) begin
        _zz_busslave_readData_23 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_24) begin
        _zz_busslave_readData_24 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_25) begin
        _zz_busslave_readData_25 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_26) begin
        _zz_busslave_readData_26 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_27) begin
        _zz_busslave_readData_27 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_28) begin
        _zz_busslave_readData_28 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_29) begin
        _zz_busslave_readData_29 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_30) begin
        _zz_busslave_readData_30 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_31) begin
        _zz_busslave_readData_31 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_32) begin
        _zz_busslave_readData_32 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_33) begin
        _zz_busslave_readData_33 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_34) begin
        _zz_busslave_readData_34 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_35) begin
        _zz_busslave_readData_35 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_36) begin
        _zz_busslave_readData_36 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_37) begin
        _zz_busslave_readData_37 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_38) begin
        _zz_busslave_readData_38 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_39) begin
        _zz_busslave_readData_39 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_40) begin
        _zz_busslave_readData_40 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_41) begin
        _zz_busslave_readData_41 <= simplebus_WDATA[31 : 0];
      end
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          12'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          12'h004 : begin
            busslave_readData <= Slaveid;
            busslave_readError <= 1'b0;
          end
          12'h008 : begin
            busslave_readData <= {8'h01,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h00c : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h010 : begin
            busslave_readData <= _zz_busslave_readData;
            busslave_readError <= 1'b0;
          end
          12'h014 : begin
            busslave_readData <= _zz_busslave_readData_1;
            busslave_readError <= 1'b0;
          end
          12'h018 : begin
            busslave_readData <= _zz_busslave_readData_2;
            busslave_readError <= 1'b0;
          end
          12'h01c : begin
            busslave_readData <= _zz_busslave_readData_3;
            busslave_readError <= 1'b0;
          end
          12'h020 : begin
            busslave_readData <= _zz_busslave_readData_4;
            busslave_readError <= 1'b0;
          end
          12'h024 : begin
            busslave_readData <= _zz_busslave_readData_5;
            busslave_readError <= 1'b0;
          end
          12'h028 : begin
            busslave_readData <= {8'h02,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h02c : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h030 : begin
            busslave_readData <= _zz_busslave_readData_6;
            busslave_readError <= 1'b0;
          end
          12'h034 : begin
            busslave_readData <= _zz_busslave_readData_7;
            busslave_readError <= 1'b0;
          end
          12'h038 : begin
            busslave_readData <= _zz_busslave_readData_8;
            busslave_readError <= 1'b0;
          end
          12'h03c : begin
            busslave_readData <= _zz_busslave_readData_9;
            busslave_readError <= 1'b0;
          end
          12'h040 : begin
            busslave_readData <= _zz_busslave_readData_10;
            busslave_readError <= 1'b0;
          end
          12'h044 : begin
            busslave_readData <= _zz_busslave_readData_11;
            busslave_readError <= 1'b0;
          end
          12'h048 : begin
            busslave_readData <= {8'h03,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h04c : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h050 : begin
            busslave_readData <= _zz_busslave_readData_12;
            busslave_readError <= 1'b0;
          end
          12'h054 : begin
            busslave_readData <= _zz_busslave_readData_13;
            busslave_readError <= 1'b0;
          end
          12'h058 : begin
            busslave_readData <= _zz_busslave_readData_14;
            busslave_readError <= 1'b0;
          end
          12'h05c : begin
            busslave_readData <= _zz_busslave_readData_15;
            busslave_readError <= 1'b0;
          end
          12'h060 : begin
            busslave_readData <= _zz_busslave_readData_16;
            busslave_readError <= 1'b0;
          end
          12'h064 : begin
            busslave_readData <= _zz_busslave_readData_17;
            busslave_readError <= 1'b0;
          end
          12'h068 : begin
            busslave_readData <= {8'h04,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h06c : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h070 : begin
            busslave_readData <= _zz_busslave_readData_18;
            busslave_readError <= 1'b0;
          end
          12'h074 : begin
            busslave_readData <= _zz_busslave_readData_19;
            busslave_readError <= 1'b0;
          end
          12'h078 : begin
            busslave_readData <= _zz_busslave_readData_20;
            busslave_readError <= 1'b0;
          end
          12'h07c : begin
            busslave_readData <= _zz_busslave_readData_21;
            busslave_readError <= 1'b0;
          end
          12'h080 : begin
            busslave_readData <= _zz_busslave_readData_22;
            busslave_readError <= 1'b0;
          end
          12'h084 : begin
            busslave_readData <= _zz_busslave_readData_23;
            busslave_readError <= 1'b0;
          end
          12'h088 : begin
            busslave_readData <= {8'h05,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h08c : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h090 : begin
            busslave_readData <= _zz_busslave_readData_24;
            busslave_readError <= 1'b0;
          end
          12'h094 : begin
            busslave_readData <= _zz_busslave_readData_25;
            busslave_readError <= 1'b0;
          end
          12'h098 : begin
            busslave_readData <= _zz_busslave_readData_26;
            busslave_readError <= 1'b0;
          end
          12'h09c : begin
            busslave_readData <= _zz_busslave_readData_27;
            busslave_readError <= 1'b0;
          end
          12'h0a0 : begin
            busslave_readData <= _zz_busslave_readData_28;
            busslave_readError <= 1'b0;
          end
          12'h0a4 : begin
            busslave_readData <= _zz_busslave_readData_29;
            busslave_readError <= 1'b0;
          end
          12'h0a8 : begin
            busslave_readData <= {8'h06,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h0ac : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h0b0 : begin
            busslave_readData <= _zz_busslave_readData_30;
            busslave_readError <= 1'b0;
          end
          12'h0b4 : begin
            busslave_readData <= _zz_busslave_readData_31;
            busslave_readError <= 1'b0;
          end
          12'h0b8 : begin
            busslave_readData <= _zz_busslave_readData_32;
            busslave_readError <= 1'b0;
          end
          12'h0bc : begin
            busslave_readData <= _zz_busslave_readData_33;
            busslave_readError <= 1'b0;
          end
          12'h0c0 : begin
            busslave_readData <= _zz_busslave_readData_34;
            busslave_readError <= 1'b0;
          end
          12'h0c4 : begin
            busslave_readData <= _zz_busslave_readData_35;
            busslave_readError <= 1'b0;
          end
          12'h0c8 : begin
            busslave_readData <= {8'h07,{8'h03,16'h0001}};
            busslave_readError <= 1'b0;
          end
          12'h0cc : begin
            busslave_readData <= {16'h0002,16'h95cb};
            busslave_readError <= 1'b0;
          end
          12'h0d0 : begin
            busslave_readData <= _zz_busslave_readData_36;
            busslave_readError <= 1'b0;
          end
          12'h0d4 : begin
            busslave_readData <= _zz_busslave_readData_37;
            busslave_readError <= 1'b0;
          end
          12'h0d8 : begin
            busslave_readData <= _zz_busslave_readData_38;
            busslave_readError <= 1'b0;
          end
          12'h0dc : begin
            busslave_readData <= _zz_busslave_readData_39;
            busslave_readError <= 1'b0;
          end
          12'h0e0 : begin
            busslave_readData <= _zz_busslave_readData_40;
            busslave_readError <= 1'b0;
          end
          12'h0e4 : begin
            busslave_readData <= _zz_busslave_readData_41;
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

module Test_TxSimpleBus (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  output              RENABLE,
  output     [11:0]   RADDR,
  input      [31:0]   RDATA,
  input               timer_tick,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Wait_Start = 2'd1;
  localparam fsm_enumDef_Send_Data = 2'd2;
  localparam fsm_enumDef_End_1 = 2'd3;

  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire                streamfifo_1_io_push_ready;
  wire                streamfifo_1_io_pop_valid;
  wire       [31:0]   streamfifo_1_io_pop_payload;
  wire       [6:0]    streamfifo_1_io_occupancy;
  wire       [6:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [11:0]   RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [11:0]   send_length;
  wire                when_Gssl_Test_l31;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_Gssl_Test_l55;
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
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_Send_Data : fsm_stateReg_string = "Send_Data ";
      fsm_enumDef_End_1 : fsm_stateReg_string = "End_1     ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_Send_Data : fsm_stateNext_string = "Send_Data ";
      fsm_enumDef_End_1 : fsm_stateNext_string = "End_1     ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign when_Gssl_Test_l31 = (32'h000001f4 <= timer_1_io_value);
  always @(*) begin
    if(when_Gssl_Test_l31) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Send_Data : begin
      end
      fsm_enumDef_End_1 : begin
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
      fsm_enumDef_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = fsm_enumDef_Send_Data;
        end
      end
      fsm_enumDef_Send_Data : begin
        if(when_Gssl_Test_l55) begin
          fsm_stateNext = fsm_enumDef_End_1;
        end
      end
      fsm_enumDef_End_1 : begin
        fsm_stateNext = fsm_enumDef_Wait_Start;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_Gssl_Test_l55 = (send_length == 12'h03f);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 12'h0;
      send_length <= 12'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 12'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 12'h0;
          end
        end
        fsm_enumDef_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 12'h004);
          send_length <= (send_length + 12'h001);
          if(when_Gssl_Test_l55) begin
            RENABLE_1 <= 1'b0;
          end
        end
        fsm_enumDef_End_1 : begin
          send_length <= 12'h0;
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
