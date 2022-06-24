// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Led_Test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Led_Test (
  output              led,
  input               clk,
  input               reset
);

  wire       [8:0]    _zz_counter1_valueNext;
  wire       [0:0]    _zz_counter1_valueNext_1;
  reg                 ledtemp;
  wire                counter1_willIncrement;
  reg                 counter1_willClear;
  reg        [8:0]    counter1_valueNext;
  reg        [8:0]    counter1_value;
  wire                counter1_willOverflowIfInc;
  wire                counter1_willOverflow;

  assign _zz_counter1_valueNext_1 = counter1_willIncrement;
  assign _zz_counter1_valueNext = {8'd0, _zz_counter1_valueNext_1};
  always @(*) begin
    counter1_willClear = 1'b0;
    if(counter1_willOverflow) begin
      counter1_willClear = 1'b1;
    end
  end

  assign counter1_willOverflowIfInc = (counter1_value == 9'h1f3);
  assign counter1_willOverflow = (counter1_willOverflowIfInc && counter1_willIncrement);
  always @(*) begin
    if(counter1_willOverflow) begin
      counter1_valueNext = 9'h0;
    end else begin
      counter1_valueNext = (counter1_value + _zz_counter1_valueNext);
    end
    if(counter1_willClear) begin
      counter1_valueNext = 9'h0;
    end
  end

  assign counter1_willIncrement = 1'b1;
  assign led = ledtemp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ledtemp <= 1'b0;
      counter1_value <= 9'h0;
    end else begin
      counter1_value <= counter1_valueNext;
      if(counter1_willOverflow) begin
        ledtemp <= (! ledtemp);
      end
    end
  end


endmodule
