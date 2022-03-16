// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Muli_Mem



module Muli_Mem (
  input      [11:0]   reads_addr,
  output     [31:0]   reads_dataOut,
  input               reads_en,
  input      [11:0]   writes_0_addr,
  input      [31:0]   writes_0_dataIn,
  input               writes_0_en,
  input               writes_0_we,
  input      [11:0]   writes_1_addr,
  input      [31:0]   writes_1_dataIn,
  input               writes_1_en,
  input               writes_1_we,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_rams_0_port1;
  wire       [31:0]   _zz_rams_1_port1;
  wire       [7:0]    _zz_rams_0_port;
  wire                _zz_rams_0_port_1;
  wire       [7:0]    _zz_rams_1_port;
  wire                _zz_rams_1_port_1;
  reg        [31:0]   datatemp;
  wire       [11:0]   readport_0_addr;
  wire       [31:0]   readport_0_dataOut;
  wire                readport_0_en;
  wire       [11:0]   readport_1_addr;
  wire       [31:0]   readport_1_dataOut;
  wire                readport_1_en;
  wire       [7:0]    _zz_readport_0_dataOut;
  wire       [7:0]    _zz_readport_1_dataOut;
  wire                when_Mem_l41;
  wire                when_Mem_l41_1;
  (* ram_style = "block" , ram_style = "distributed" *) reg [31:0] rams_0 [0:255];
  (* ram_style = "block" , ram_style = "distributed" *) reg [31:0] rams_1 [0:255];

  assign _zz_rams_0_port = writes_0_addr[7:0];
  assign _zz_rams_1_port = writes_1_addr[7:0];
  assign _zz_rams_0_port_1 = (writes_0_en && writes_0_we);
  assign _zz_rams_1_port_1 = (writes_1_en && writes_1_we);
  always @(posedge clk) begin
    if(_zz_rams_0_port_1) begin
      rams_0[_zz_rams_0_port] <= writes_0_dataIn;
    end
  end

  assign _zz_rams_0_port1 = rams_0[_zz_readport_0_dataOut];
  always @(posedge clk) begin
    if(_zz_rams_1_port_1) begin
      rams_1[_zz_rams_1_port] <= writes_1_dataIn;
    end
  end

  assign _zz_rams_1_port1 = rams_1[_zz_readport_1_dataOut];
  assign _zz_readport_0_dataOut = readport_0_addr[7:0];
  assign readport_0_dataOut = _zz_rams_0_port1;
  assign readport_0_addr = reads_addr;
  assign _zz_readport_1_dataOut = readport_1_addr[7:0];
  assign readport_1_dataOut = _zz_rams_1_port1;
  assign readport_1_addr = reads_addr;
  assign when_Mem_l41 = ((reads_addr & (~ 12'h03f)) == 12'h0);
  assign when_Mem_l41_1 = ((reads_addr & (~ 12'h03f)) == 12'h100);
  assign reads_dataOut = datatemp;
  always @(posedge clk) begin
    if(when_Mem_l41) begin
      datatemp <= readport_0_dataOut;
    end
    if(when_Mem_l41_1) begin
      datatemp <= readport_1_dataOut;
    end
  end


endmodule
