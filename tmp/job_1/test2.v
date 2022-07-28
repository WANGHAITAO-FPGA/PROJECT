// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : test2
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

module test2 (
  input               in_valid,
  output              in_ready,
  input               in_payload_last,
  input      [31:0]   in_payload_fragment,
  output              out_valid,
  input               out_ready,
  output              out_payload_last,
  output     [7:0]    out_payload_fragment,
  input               clk,
  input               reset
);

  wire       [1:0]    _zz__zz_in_ready_1;
  wire       [0:0]    _zz__zz_in_ready_1_1;
  reg        [7:0]    _zz_out_payload_fragment_1;
  wire                out_fire;
  reg                 _zz_in_ready;
  reg        [1:0]    _zz_in_ready_1;
  reg        [1:0]    _zz_in_ready_2;
  wire                _zz_in_ready_3;
  wire       [31:0]   _zz_out_payload_fragment;

  assign _zz__zz_in_ready_1_1 = _zz_in_ready;
  assign _zz__zz_in_ready_1 = {1'd0, _zz__zz_in_ready_1_1};
  always @(*) begin
    case(_zz_in_ready_2)
      2'b00 : _zz_out_payload_fragment_1 = _zz_out_payload_fragment[7 : 0];
      2'b01 : _zz_out_payload_fragment_1 = _zz_out_payload_fragment[15 : 8];
      2'b10 : _zz_out_payload_fragment_1 = _zz_out_payload_fragment[23 : 16];
      default : _zz_out_payload_fragment_1 = _zz_out_payload_fragment[31 : 24];
    endcase
  end

  assign out_fire = (out_valid && out_ready);
  always @(*) begin
    _zz_in_ready = 1'b0;
    if(out_fire) begin
      _zz_in_ready = 1'b1;
    end
  end

  assign _zz_in_ready_3 = (_zz_in_ready_2 == 2'b11);
  always @(*) begin
    _zz_in_ready_1 = (_zz_in_ready_2 + _zz__zz_in_ready_1);
    if(1'b0) begin
      _zz_in_ready_1 = 2'b00;
    end
  end

  assign out_valid = in_valid;
  assign _zz_out_payload_fragment = in_payload_fragment;
  assign out_payload_fragment = _zz_out_payload_fragment_1;
  assign out_payload_last = (in_payload_last && _zz_in_ready_3);
  assign in_ready = (out_ready && _zz_in_ready_3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_in_ready_2 <= 2'b00;
    end else begin
      _zz_in_ready_2 <= _zz_in_ready_1;
    end
  end


endmodule
