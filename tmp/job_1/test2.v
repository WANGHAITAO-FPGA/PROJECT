// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : test2

`timescale 1ns/1ps 

module test2 (
  input               in_valid,
  output              in_ready,
  input      [31:0]   in_payload,
  output              out_valid,
  input               out_ready,
  output     [7:0]    out_payload,
  input               clk,
  input               reset
);

  wire       [1:0]    _zz__zz_in_ready_1;
  wire       [0:0]    _zz__zz_in_ready_1_1;
  reg        [7:0]    _zz_out_payload_1;
  wire                out_fire;
  reg                 _zz_in_ready;
  reg        [1:0]    _zz_in_ready_1;
  reg        [1:0]    _zz_in_ready_2;
  wire                _zz_in_ready_3;
  wire       [31:0]   _zz_out_payload;

  assign _zz__zz_in_ready_1_1 = _zz_in_ready;
  assign _zz__zz_in_ready_1 = {1'd0, _zz__zz_in_ready_1_1};
  always @(*) begin
    case(_zz_in_ready_2)
      2'b00 : begin
        _zz_out_payload_1 = _zz_out_payload[7 : 0];
      end
      2'b01 : begin
        _zz_out_payload_1 = _zz_out_payload[15 : 8];
      end
      2'b10 : begin
        _zz_out_payload_1 = _zz_out_payload[23 : 16];
      end
      default : begin
        _zz_out_payload_1 = _zz_out_payload[31 : 24];
      end
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
  assign _zz_out_payload = in_payload;
  assign out_payload = _zz_out_payload_1;
  assign in_ready = (out_ready && _zz_in_ready_3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_in_ready_2 <= 2'b00;
    end else begin
      _zz_in_ready_2 <= _zz_in_ready_1;
    end
  end


endmodule
