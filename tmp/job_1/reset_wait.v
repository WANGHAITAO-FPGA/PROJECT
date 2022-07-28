// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : reset_wait
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

module reset_wait (
  output              reset_out,
  input               clk,
  input               reset
);

  reg                 reset_out_1;
  reg        [29:0]   ResetCounter;
  wire       [29:0]   _zz_when_test_l40;
  wire                when_test_l40;

  assign _zz_when_test_l40[29 : 0] = 30'h3fffffff;
  assign when_test_l40 = (ResetCounter != _zz_when_test_l40);
  assign reset_out = reset_out_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reset_out_1 <= 1'b1;
      ResetCounter <= 30'h0;
    end else begin
      if(when_test_l40) begin
        ResetCounter <= (ResetCounter + 30'h00000001);
        reset_out_1 <= 1'b1;
      end else begin
        reset_out_1 <= 1'b0;
      end
    end
  end


endmodule
