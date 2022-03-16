// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Tx_Header
// Git hash  : c174ea6407642157543b0d5d61d63095d2618929



module Tx_Header (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output reg          io_output_payload_last,
  output reg [31:0]   io_output_payload_fragment,
  input               clk,
  input               reset
);
  reg        [31:0]   _zz_io_output_payload_fragment;
  wire       [0:0]    _zz_io_output_payload_fragment_1;
  wire       [63:0]   header;
  reg        [1:0]    state;
  wire                when_Tx_Crc_l65;
  wire                io_output_fire;
  wire                io_input_fire;
  wire                when_Tx_Crc_l74;

  assign _zz_io_output_payload_fragment_1 = state[0:0];
  always @(*) begin
    case(_zz_io_output_payload_fragment_1)
      1'b0 : begin
        _zz_io_output_payload_fragment = header[63 : 32];
      end
      default : begin
        _zz_io_output_payload_fragment = header[31 : 0];
      end
    endcase
  end

  assign header = 64'h0000ffbc00000012;
  assign io_output_valid = io_input_valid;
  always @(*) begin
    io_output_payload_last = 1'b0;
    if(when_Tx_Crc_l65) begin
      io_output_payload_last = io_input_payload_last;
    end
  end

  always @(*) begin
    io_input_ready = 1'b0;
    if(when_Tx_Crc_l65) begin
      io_input_ready = io_output_ready;
    end
  end

  assign when_Tx_Crc_l65 = (state == 2'b10);
  always @(*) begin
    if(when_Tx_Crc_l65) begin
      io_output_payload_fragment = io_input_payload_fragment;
    end else begin
      io_output_payload_fragment = _zz_io_output_payload_fragment;
    end
  end

  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign when_Tx_Crc_l74 = (io_input_fire && io_input_payload_last);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 2'b00;
    end else begin
      if(!when_Tx_Crc_l65) begin
        if(io_output_fire) begin
          state <= (state + 2'b01);
        end
      end
      if(when_Tx_Crc_l74) begin
        state <= 2'b00;
      end
    end
  end


endmodule
