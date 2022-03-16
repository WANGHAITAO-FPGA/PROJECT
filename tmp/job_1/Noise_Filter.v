// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Noise_Filter

`timescale 1ns/1ps 

module Noise_Filter (
  input               data_in,
  output              data_out,
  input               clk,
  input               reset
);

  reg        [3:0]    data_delayed;
  reg                 temp;

  assign data_out = temp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      data_delayed <= 4'b0000;
      temp <= data_in;
    end else begin
      data_delayed <= {data_delayed[2],{data_delayed[1],{data_delayed[0],data_in}}};
      temp <= ((((data_delayed[1] && data_delayed[2]) && data_delayed[3]) && (! temp)) || ((! (((! data_delayed[1]) && (! data_delayed[2])) && (! data_delayed[3]))) && temp));
    end
  end


endmodule
