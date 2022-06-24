// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Runing
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Runing (
  input               tick,
  output              led,
  input               clk,
  input               reset
);

  wire       [15:0]   _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 ledtemp;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [15:0]   counter_valueNext;
  reg        [15:0]   counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 tick_regNext;
  wire                when_Runing_l15;
  wire                when_Runing_l18;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {15'd0, _zz_counter_valueNext_1};
  always @(*) begin
    counter_willIncrement = 1'b0;
    if(when_Runing_l15) begin
      counter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    counter_willClear = 1'b0;
    if(when_Runing_l18) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 16'hc350);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 16'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 16'h0;
    end
  end

  assign when_Runing_l15 = (tick && (! tick_regNext));
  assign when_Runing_l18 = (16'h2710 < counter_value);
  assign led = ledtemp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ledtemp <= 1'b0;
      counter_value <= 16'h0;
    end else begin
      counter_value <= counter_valueNext;
      if(when_Runing_l18) begin
        ledtemp <= (! ledtemp);
      end
    end
  end

  always @(posedge clk) begin
    tick_regNext <= tick;
  end


endmodule
