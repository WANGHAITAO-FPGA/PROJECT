// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : TxHeader
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module TxHeader (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output reg          io_output_payload_last,
  output reg [31:0]   io_output_payload_fragment,
  input      [31:0]   io_header,
  input               clk,
  input               reset
);

  reg        [1:0]    state;
  wire                when_RxStream_Mix_l136;
  wire                io_output_fire;
  wire                io_input_fire;
  wire                when_RxStream_Mix_l145;

  assign io_output_valid = io_input_valid;
  always @(*) begin
    io_output_payload_last = io_input_payload_last;
    if(when_RxStream_Mix_l136) begin
      io_output_payload_last = io_input_payload_last;
    end
  end

  always @(*) begin
    io_input_ready = 1'b0;
    if(when_RxStream_Mix_l136) begin
      io_input_ready = io_output_ready;
    end
  end

  assign when_RxStream_Mix_l136 = (state == 2'b10);
  always @(*) begin
    if(when_RxStream_Mix_l136) begin
      io_output_payload_fragment = io_input_payload_fragment;
    end else begin
      io_output_payload_fragment = io_header[31 : 0];
    end
  end

  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign when_RxStream_Mix_l145 = (io_input_fire && io_input_payload_last);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 2'b00;
    end else begin
      if(!when_RxStream_Mix_l136) begin
        if(io_output_fire) begin
          state <= (state + 2'b01);
        end
      end
      if(when_RxStream_Mix_l145) begin
        state <= 2'b00;
      end
    end
  end


endmodule
