// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : SSI
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module SSI (
  input               ssi_clk,
  input               ssi_en,
  input               ssi_data,
  input               kind_cpol,
  input               kind_cpha,
  output     [31:0]   postion,
  output     [6:0]    clk_counter,
  output     [5:0]    counter,
  input               clk,
  input               reset
);

  wire       [5:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  wire       [6:0]    _zz_clk_counter_valueNext;
  wire       [0:0]    _zz_clk_counter_valueNext_1;
  wire       [32:0]   _zz_buffer_1;
  wire                _zz_normalizedSclkEdges_rise;
  wire                normalizedSclkEdges_rise;
  wire                normalizedSclkEdges_fall;
  wire                normalizedSclkEdges_toggle;
  reg                 _zz_normalizedSclkEdges_rise_1;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [5:0]    counter_valueNext;
  reg        [5:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg        [31:0]   buffer_1;
  reg                 clk_counter_willIncrement;
  reg                 clk_counter_willClear;
  reg        [6:0]    clk_counter_valueNext;
  reg        [6:0]    clk_counter_value;
  wire                clk_counter_willOverflowIfInc;
  wire                clk_counter_willOverflow;
  wire                when_SSI_l35;
  reg        [31:0]   buffer_1_regNextWhen;
  reg        [31:0]   _zz_postion;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {5'd0, _zz_counter_valueNext_1};
  assign _zz_clk_counter_valueNext_1 = clk_counter_willIncrement;
  assign _zz_clk_counter_valueNext = {6'd0, _zz_clk_counter_valueNext_1};
  assign _zz_buffer_1 = {buffer_1,ssi_data};
  assign _zz_normalizedSclkEdges_rise = ((ssi_clk ^ kind_cpol) ^ kind_cpha);
  assign normalizedSclkEdges_rise = ((! _zz_normalizedSclkEdges_rise_1) && _zz_normalizedSclkEdges_rise);
  assign normalizedSclkEdges_fall = (_zz_normalizedSclkEdges_rise_1 && (! _zz_normalizedSclkEdges_rise));
  assign normalizedSclkEdges_toggle = (_zz_normalizedSclkEdges_rise_1 != _zz_normalizedSclkEdges_rise);
  always @(*) begin
    counter_willIncrement = 1'b0;
    if(!clk_counter_willOverflow) begin
      if(normalizedSclkEdges_toggle) begin
        counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    counter_willClear = 1'b0;
    if(clk_counter_willOverflow) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 6'h3f);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    counter_valueNext = (counter_value + _zz_counter_valueNext);
    if(counter_willClear) begin
      counter_valueNext = 6'h0;
    end
  end

  always @(*) begin
    clk_counter_willIncrement = 1'b0;
    if(when_SSI_l35) begin
      clk_counter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    clk_counter_willClear = 1'b0;
    if(!when_SSI_l35) begin
      clk_counter_willClear = 1'b1;
    end
  end

  assign clk_counter_willOverflowIfInc = (clk_counter_value == 7'h63);
  assign clk_counter_willOverflow = (clk_counter_willOverflowIfInc && clk_counter_willIncrement);
  always @(*) begin
    if(clk_counter_willOverflow) begin
      clk_counter_valueNext = 7'h0;
    end else begin
      clk_counter_valueNext = (clk_counter_value + _zz_clk_counter_valueNext);
    end
    if(clk_counter_willClear) begin
      clk_counter_valueNext = 7'h0;
    end
  end

  assign when_SSI_l35 = (! ssi_clk);
  always @(*) begin
    _zz_postion[31 : 24] = buffer_1_regNextWhen[7 : 0];
    _zz_postion[23 : 16] = buffer_1_regNextWhen[15 : 8];
    _zz_postion[15 : 8] = buffer_1_regNextWhen[23 : 16];
    _zz_postion[7 : 0] = buffer_1_regNextWhen[31 : 24];
  end

  assign postion = _zz_postion;
  assign counter = counter_value;
  assign clk_counter = clk_counter_value;
  always @(posedge clk) begin
    _zz_normalizedSclkEdges_rise_1 <= _zz_normalizedSclkEdges_rise;
    if(counter_willOverflow) begin
      buffer_1_regNextWhen <= buffer_1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 6'h0;
      buffer_1 <= 32'h0;
      clk_counter_value <= 7'h0;
    end else begin
      counter_value <= counter_valueNext;
      clk_counter_value <= clk_counter_valueNext;
      if(!clk_counter_willOverflow) begin
        if(normalizedSclkEdges_rise) begin
          buffer_1 <= _zz_buffer_1[31:0];
        end
      end
    end
  end


endmodule
