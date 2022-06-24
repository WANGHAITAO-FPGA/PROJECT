// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Quard_Test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Quard_Test (
  output              aphase,
  output              bphase,
  input               clk,
  input               reset
);

  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire       [31:0]   _zz_when_Quard_Test_l30;
  wire                when_Quard_Test_l16;
  reg                 aphase_1;
  reg                 bphase_1;
  wire                when_Quard_Test_l30;

  assign _zz_when_Quard_Test_l30 = (32'h000186a0 / 2'b10);
  Timer timer_1 (
    .io_tick     (1'b1                    ), //i
    .io_clear    (timer_1_io_clear        ), //i
    .io_limit    (32'h000186a0            ), //i
    .io_full     (timer_1_io_full         ), //o
    .io_value    (timer_1_io_value[31:0]  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  assign when_Quard_Test_l16 = (32'h000186a0 <= timer_1_io_value);
  always @(*) begin
    if(when_Quard_Test_l16) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign aphase = aphase_1;
  assign when_Quard_Test_l30 = (timer_1_io_value == _zz_when_Quard_Test_l30);
  assign bphase = bphase_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      aphase_1 <= 1'b0;
      bphase_1 <= 1'b0;
    end else begin
      if(timer_1_io_full) begin
        aphase_1 <= (! aphase_1);
      end
      if(when_Quard_Test_l30) begin
        bphase_1 <= (! bphase_1);
      end
    end
  end


endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               clk,
  input               reset
);

  wire       [31:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [31:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {31'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
    end
  end


endmodule
