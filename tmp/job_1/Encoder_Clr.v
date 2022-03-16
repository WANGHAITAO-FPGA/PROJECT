// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Encoder_Clr

`timescale 1ns/1ps 

module Encoder_Clr (
  input               encoder_clr_in,
  output              encoder_clr_out,
  input               clk,
  input               reset
);

  reg                 encoder_clr_out_1;
  reg                 encoder_clr_in_regNext;
  wire                when_Encoder_Clr_l14;
  reg                 encoder_clr_out_1_delay_1;
  reg                 encoder_clr_out_1_delay_1_1;
  reg                 encoder_clr_out_1_delay_2;

  assign when_Encoder_Clr_l14 = (encoder_clr_in && (! encoder_clr_in_regNext));
  assign encoder_clr_out = (! ((encoder_clr_out_1 || encoder_clr_out_1_delay_1) || encoder_clr_out_1_delay_2));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      encoder_clr_out_1 <= 1'b0;
    end else begin
      if(when_Encoder_Clr_l14) begin
        encoder_clr_out_1 <= 1'b1;
      end else begin
        encoder_clr_out_1 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    encoder_clr_in_regNext <= encoder_clr_in;
    encoder_clr_out_1_delay_1 <= encoder_clr_out_1;
    encoder_clr_out_1_delay_1_1 <= encoder_clr_out_1;
    encoder_clr_out_1_delay_2 <= encoder_clr_out_1_delay_1_1;
  end


endmodule
