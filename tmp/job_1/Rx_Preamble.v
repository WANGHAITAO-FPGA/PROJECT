// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Rx_Preamble
// Git hash  : c174ea6407642157543b0d5d61d63095d2618929



module Rx_Preamble (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output reg          io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  input               clk,
  input               reset
);
  wire       [63:0]   startDelimiter;
  wire                io_input_fire;
  wire                history_0_valid;
  wire                history_0_ready;
  wire                history_0_payload_last;
  wire       [31:0]   history_0_payload_fragment;
  wire                history_1_valid;
  wire                history_1_ready;
  wire                history_1_payload_last;
  wire       [31:0]   history_1_payload_fragment;
  wire                _zz_history_0_valid;
  wire                _zz_history_0_ready;
  wire                _zz_history_0_payload_last;
  wire       [31:0]   _zz_history_0_payload_fragment;
  reg                 _zz_history_1_valid;
  reg                 _zz_history_1_ready;
  reg                 _zz_history_1_payload_last;
  reg        [31:0]   _zz_history_1_payload_fragment;
  wire       [63:0]   historyDataCat;
  wire                hit;
  reg                 inFrame;
  wire                when_Rx_Crc_l25;
  wire                when_Rx_Crc_l32;

  assign startDelimiter = 64'h000000120000ffbc;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign _zz_history_0_valid = io_input_valid;
  assign _zz_history_0_ready = io_input_ready;
  assign _zz_history_0_payload_last = io_input_payload_last;
  assign _zz_history_0_payload_fragment = io_input_payload_fragment;
  assign history_0_valid = _zz_history_0_valid;
  assign history_0_ready = _zz_history_0_ready;
  assign history_0_payload_last = _zz_history_0_payload_last;
  assign history_0_payload_fragment = _zz_history_0_payload_fragment;
  assign history_1_valid = _zz_history_1_valid;
  assign history_1_ready = _zz_history_1_ready;
  assign history_1_payload_last = _zz_history_1_payload_last;
  assign history_1_payload_fragment = _zz_history_1_payload_fragment;
  assign historyDataCat = {history_0_payload_fragment,history_1_payload_fragment};
  assign hit = ((history_0_valid && history_1_valid) && (historyDataCat == startDelimiter));
  always @(*) begin
    io_output_valid = 1'b0;
    if(!when_Rx_Crc_l25) begin
      if(io_input_valid) begin
        io_output_valid = 1'b1;
      end
    end
  end

  assign io_output_payload_fragment = io_input_payload_fragment;
  assign io_input_ready = ((! inFrame) || io_output_ready);
  assign io_output_payload_last = io_input_payload_last;
  assign when_Rx_Crc_l25 = (! inFrame);
  assign when_Rx_Crc_l32 = (io_output_ready && io_input_payload_last);
  always @(posedge clk) begin
    if(io_input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_Rx_Crc_l25) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(io_input_valid) begin
          if(when_Rx_Crc_l32) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule
