// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Freq_Div
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

module Freq_Div (
  input               io_clkIn,
  input               io_rst,
  output              io_clkOut
);

  wire       [2:0]    _zz_risingArea_risingCounter_valueNext;
  wire       [0:0]    _zz_risingArea_risingCounter_valueNext_1;
  wire       [2:0]    _zz_fallingArea_fallingCounter_valueNext;
  wire       [0:0]    _zz_fallingArea_fallingCounter_valueNext_1;
  wire                risingArea_risingCounter_willIncrement;
  wire                risingArea_risingCounter_willClear;
  reg        [2:0]    risingArea_risingCounter_valueNext;
  reg        [2:0]    risingArea_risingCounter_value;
  wire                risingArea_risingCounter_willOverflowIfInc;
  wire                risingArea_risingCounter_willOverflow;
  wire                risingArea_clkP;
  wire                fallingArea_fallingCounter_willIncrement;
  wire                fallingArea_fallingCounter_willClear;
  reg        [2:0]    fallingArea_fallingCounter_valueNext;
  reg        [2:0]    fallingArea_fallingCounter_value;
  wire                fallingArea_fallingCounter_willOverflowIfInc;
  wire                fallingArea_fallingCounter_willOverflow;
  wire                fallingArea_clkN;

  assign _zz_risingArea_risingCounter_valueNext_1 = risingArea_risingCounter_willIncrement;
  assign _zz_risingArea_risingCounter_valueNext = {2'd0, _zz_risingArea_risingCounter_valueNext_1};
  assign _zz_fallingArea_fallingCounter_valueNext_1 = fallingArea_fallingCounter_willIncrement;
  assign _zz_fallingArea_fallingCounter_valueNext = {2'd0, _zz_fallingArea_fallingCounter_valueNext_1};
  assign risingArea_risingCounter_willClear = 1'b0;
  assign risingArea_risingCounter_willOverflowIfInc = (risingArea_risingCounter_value == 3'b100);
  assign risingArea_risingCounter_willOverflow = (risingArea_risingCounter_willOverflowIfInc && risingArea_risingCounter_willIncrement);
  always @(*) begin
    if(risingArea_risingCounter_willOverflow) begin
      risingArea_risingCounter_valueNext = 3'b000;
    end else begin
      risingArea_risingCounter_valueNext = (risingArea_risingCounter_value + _zz_risingArea_risingCounter_valueNext);
    end
    if(risingArea_risingCounter_willClear) begin
      risingArea_risingCounter_valueNext = 3'b000;
    end
  end

  assign risingArea_risingCounter_willIncrement = 1'b1;
  assign risingArea_clkP = (risingArea_risingCounter_value < 3'b010);
  assign fallingArea_fallingCounter_willClear = 1'b0;
  assign fallingArea_fallingCounter_willOverflowIfInc = (fallingArea_fallingCounter_value == 3'b100);
  assign fallingArea_fallingCounter_willOverflow = (fallingArea_fallingCounter_willOverflowIfInc && fallingArea_fallingCounter_willIncrement);
  always @(*) begin
    if(fallingArea_fallingCounter_willOverflow) begin
      fallingArea_fallingCounter_valueNext = 3'b000;
    end else begin
      fallingArea_fallingCounter_valueNext = (fallingArea_fallingCounter_value + _zz_fallingArea_fallingCounter_valueNext);
    end
    if(fallingArea_fallingCounter_willClear) begin
      fallingArea_fallingCounter_valueNext = 3'b000;
    end
  end

  assign fallingArea_fallingCounter_willIncrement = 1'b1;
  assign fallingArea_clkN = (fallingArea_fallingCounter_value < 3'b010);
  assign io_clkOut = (risingArea_clkP || fallingArea_clkN);
  always @(posedge io_clkIn or posedge io_rst) begin
    if(io_rst) begin
      risingArea_risingCounter_value <= 3'b000;
    end else begin
      risingArea_risingCounter_value <= risingArea_risingCounter_valueNext;
    end
  end

  always @(negedge io_clkIn or posedge io_rst) begin
    if(io_rst) begin
      fallingArea_fallingCounter_value <= 3'b000;
    end else begin
      fallingArea_fallingCounter_value <= fallingArea_fallingCounter_valueNext;
    end
  end


endmodule
