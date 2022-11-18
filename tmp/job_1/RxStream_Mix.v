// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : RxStream_Mix
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module RxStream_Mix (
  input               hssl_inputs1_valid,
  output              hssl_inputs1_ready,
  input               hssl_inputs1_payload_last,
  input      [63:0]   hssl_inputs1_payload_fragment,
  input               hssl_inputs2_valid,
  output              hssl_inputs2_ready,
  input               hssl_inputs2_payload_last,
  input      [63:0]   hssl_inputs2_payload_fragment,
  input               hssl_inputs3_valid,
  output              hssl_inputs3_ready,
  input               hssl_inputs3_payload_last,
  input      [63:0]   hssl_inputs3_payload_fragment,
  input               hssl_inputs4_valid,
  output              hssl_inputs4_ready,
  input               hssl_inputs4_payload_last,
  input      [63:0]   hssl_inputs4_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [63:0]   output_payload_fragment,
  input               tick,
  input      [63:0]   header,
  input               pop_clk,
  input               pop_reset,
  input               hssl1_clk,
  input               hssl1_reset,
  input               hssl2_clk,
  input               hssl2_reset
);

  wire                poparea_tx_header_io_input_payload_last;
  wire                hssl1_pusharea_hssl1_stream_fifo_input_ready;
  wire                hssl1_pusharea_hssl1_stream_fifo_output_valid;
  wire       [63:0]   hssl1_pusharea_hssl1_stream_fifo_output_payload;
  wire                hssl2_pusharea_hssl2_stream_fifo_input_ready;
  wire                hssl2_pusharea_hssl2_stream_fifo_output_valid;
  wire       [63:0]   hssl2_pusharea_hssl2_stream_fifo_output_payload;
  wire                hssl2_pusharea_hssl2_stream_fifo_hssl2_reset_syncronized_1;
  wire                hssl2_pusharea_hssl3_stream_fifo_input_ready;
  wire                hssl2_pusharea_hssl3_stream_fifo_output_valid;
  wire       [63:0]   hssl2_pusharea_hssl3_stream_fifo_output_payload;
  wire                hssl2_pusharea_hssl4_stream_fifo_input_ready;
  wire                hssl2_pusharea_hssl4_stream_fifo_output_valid;
  wire       [63:0]   hssl2_pusharea_hssl4_stream_fifo_output_payload;
  wire                poparea_streammux_io_inputs_0_ready;
  wire                poparea_streammux_io_inputs_1_ready;
  wire                poparea_streammux_io_inputs_2_ready;
  wire                poparea_streammux_io_inputs_3_ready;
  wire                poparea_streammux_io_output_valid;
  wire       [63:0]   poparea_streammux_io_output_payload;
  wire                poparea_mix_stream_io_push_ready;
  wire                poparea_mix_stream_io_pop_valid;
  wire       [63:0]   poparea_mix_stream_io_pop_payload;
  wire       [6:0]    poparea_mix_stream_io_occupancy;
  wire       [6:0]    poparea_mix_stream_io_availability;
  wire                poparea_tx_header_io_input_ready;
  wire                poparea_tx_header_io_output_valid;
  wire                poparea_tx_header_io_output_payload_last;
  wire       [63:0]   poparea_tx_header_io_output_payload_fragment;
  wire       [4:0]    _zz_poparea_counter_valueNext;
  wire       [0:0]    _zz_poparea_counter_valueNext_1;
  reg                 poparea_ready;
  reg                 poparea_tick;
  reg                 poparea_last;
  reg                 poparea_start;
  reg                 poparea_counter_willIncrement;
  reg                 poparea_counter_willClear;
  reg        [4:0]    poparea_counter_valueNext;
  reg        [4:0]    poparea_counter_value;
  wire                poparea_counter_willOverflowIfInc;
  wire                poparea_counter_willOverflow;
  reg                 poparea_tick_regNext;
  wire                when_RxStream_Mix_l96;
  wire                when_RxStream_Mix_l103;
  wire                when_RxStream_Mix_l106;
  reg        [1:0]    poparea_select;
  wire                when_RxStream_Mix_l113;
  wire                when_RxStream_Mix_l113_1;
  wire                when_RxStream_Mix_l113_2;
  wire                when_RxStream_Mix_l113_3;
  reg                 poparea_ready_regNext;
  wire                poparea_tx_header_io_input_fire;

  assign _zz_poparea_counter_valueNext_1 = poparea_counter_willIncrement;
  assign _zz_poparea_counter_valueNext = {4'd0, _zz_poparea_counter_valueNext_1};
  RxStream_Fifo hssl1_pusharea_hssl1_stream_fifo (
    .input_valid            (hssl_inputs1_valid                                   ), //i
    .input_ready            (hssl1_pusharea_hssl1_stream_fifo_input_ready         ), //o
    .input_payload_last     (hssl_inputs1_payload_last                            ), //i
    .input_payload_fragment (hssl_inputs1_payload_fragment[63:0]                  ), //i
    .output_valid           (hssl1_pusharea_hssl1_stream_fifo_output_valid        ), //o
    .output_ready           (poparea_streammux_io_inputs_0_ready                  ), //i
    .output_payload         (hssl1_pusharea_hssl1_stream_fifo_output_payload[63:0]), //o
    .tick                   (tick                                                 ), //i
    .pop_clk                (pop_clk                                              ), //i
    .pop_reset              (pop_reset                                            ), //i
    .hssl1_clk              (hssl1_clk                                            ), //i
    .hssl1_reset            (hssl1_reset                                          )  //i
  );
  RxStream_Fifo_1 hssl2_pusharea_hssl2_stream_fifo (
    .input_valid               (hssl_inputs2_valid                                        ), //i
    .input_ready               (hssl2_pusharea_hssl2_stream_fifo_input_ready              ), //o
    .input_payload_last        (hssl_inputs2_payload_last                                 ), //i
    .input_payload_fragment    (hssl_inputs2_payload_fragment[63:0]                       ), //i
    .output_valid              (hssl2_pusharea_hssl2_stream_fifo_output_valid             ), //o
    .output_ready              (poparea_streammux_io_inputs_1_ready                       ), //i
    .output_payload            (hssl2_pusharea_hssl2_stream_fifo_output_payload[63:0]     ), //o
    .tick                      (tick                                                      ), //i
    .pop_clk                   (pop_clk                                                   ), //i
    .pop_reset                 (pop_reset                                                 ), //i
    .hssl2_clk                 (hssl2_clk                                                 ), //i
    .hssl2_reset               (hssl2_reset                                               ), //i
    .hssl2_reset_syncronized_1 (hssl2_pusharea_hssl2_stream_fifo_hssl2_reset_syncronized_1)  //o
  );
  RxStream_Fifo_2 hssl2_pusharea_hssl3_stream_fifo (
    .input_valid               (hssl_inputs3_valid                                        ), //i
    .input_ready               (hssl2_pusharea_hssl3_stream_fifo_input_ready              ), //o
    .input_payload_last        (hssl_inputs3_payload_last                                 ), //i
    .input_payload_fragment    (hssl_inputs3_payload_fragment[63:0]                       ), //i
    .output_valid              (hssl2_pusharea_hssl3_stream_fifo_output_valid             ), //o
    .output_ready              (poparea_streammux_io_inputs_2_ready                       ), //i
    .output_payload            (hssl2_pusharea_hssl3_stream_fifo_output_payload[63:0]     ), //o
    .tick                      (tick                                                      ), //i
    .pop_clk                   (pop_clk                                                   ), //i
    .pop_reset                 (pop_reset                                                 ), //i
    .hssl2_clk                 (hssl2_clk                                                 ), //i
    .hssl2_reset               (hssl2_reset                                               ), //i
    .hssl2_reset_syncronized_1 (hssl2_pusharea_hssl2_stream_fifo_hssl2_reset_syncronized_1)  //i
  );
  RxStream_Fifo_2 hssl2_pusharea_hssl4_stream_fifo (
    .input_valid               (hssl_inputs4_valid                                        ), //i
    .input_ready               (hssl2_pusharea_hssl4_stream_fifo_input_ready              ), //o
    .input_payload_last        (hssl_inputs4_payload_last                                 ), //i
    .input_payload_fragment    (hssl_inputs4_payload_fragment[63:0]                       ), //i
    .output_valid              (hssl2_pusharea_hssl4_stream_fifo_output_valid             ), //o
    .output_ready              (poparea_streammux_io_inputs_3_ready                       ), //i
    .output_payload            (hssl2_pusharea_hssl4_stream_fifo_output_payload[63:0]     ), //o
    .tick                      (tick                                                      ), //i
    .pop_clk                   (pop_clk                                                   ), //i
    .pop_reset                 (pop_reset                                                 ), //i
    .hssl2_clk                 (hssl2_clk                                                 ), //i
    .hssl2_reset               (hssl2_reset                                               ), //i
    .hssl2_reset_syncronized_1 (hssl2_pusharea_hssl2_stream_fifo_hssl2_reset_syncronized_1)  //i
  );
  StreamMux poparea_streammux (
    .io_select           (poparea_select[1:0]                                  ), //i
    .io_inputs_0_valid   (hssl1_pusharea_hssl1_stream_fifo_output_valid        ), //i
    .io_inputs_0_ready   (poparea_streammux_io_inputs_0_ready                  ), //o
    .io_inputs_0_payload (hssl1_pusharea_hssl1_stream_fifo_output_payload[63:0]), //i
    .io_inputs_1_valid   (hssl2_pusharea_hssl2_stream_fifo_output_valid        ), //i
    .io_inputs_1_ready   (poparea_streammux_io_inputs_1_ready                  ), //o
    .io_inputs_1_payload (hssl2_pusharea_hssl2_stream_fifo_output_payload[63:0]), //i
    .io_inputs_2_valid   (hssl2_pusharea_hssl3_stream_fifo_output_valid        ), //i
    .io_inputs_2_ready   (poparea_streammux_io_inputs_2_ready                  ), //o
    .io_inputs_2_payload (hssl2_pusharea_hssl3_stream_fifo_output_payload[63:0]), //i
    .io_inputs_3_valid   (hssl2_pusharea_hssl4_stream_fifo_output_valid        ), //i
    .io_inputs_3_ready   (poparea_streammux_io_inputs_3_ready                  ), //o
    .io_inputs_3_payload (hssl2_pusharea_hssl4_stream_fifo_output_payload[63:0]), //i
    .io_output_valid     (poparea_streammux_io_output_valid                    ), //o
    .io_output_ready     (poparea_ready_regNext                                ), //i
    .io_output_payload   (poparea_streammux_io_output_payload[63:0]            )  //o
  );
  StreamFifo poparea_mix_stream (
    .io_push_valid   (poparea_streammux_io_output_valid        ), //i
    .io_push_ready   (poparea_mix_stream_io_push_ready         ), //o
    .io_push_payload (poparea_streammux_io_output_payload[63:0]), //i
    .io_pop_valid    (poparea_mix_stream_io_pop_valid          ), //o
    .io_pop_ready    (poparea_tx_header_io_input_ready         ), //i
    .io_pop_payload  (poparea_mix_stream_io_pop_payload[63:0]  ), //o
    .io_flush        (1'b0                                     ), //i
    .io_occupancy    (poparea_mix_stream_io_occupancy[6:0]     ), //o
    .io_availability (poparea_mix_stream_io_availability[6:0]  ), //o
    .pop_clk         (pop_clk                                  ), //i
    .pop_reset       (pop_reset                                )  //i
  );
  TxHeader poparea_tx_header (
    .io_input_valid             (poparea_mix_stream_io_pop_valid                   ), //i
    .io_input_ready             (poparea_tx_header_io_input_ready                  ), //o
    .io_input_payload_last      (poparea_tx_header_io_input_payload_last           ), //i
    .io_input_payload_fragment  (poparea_mix_stream_io_pop_payload[63:0]           ), //i
    .io_output_valid            (poparea_tx_header_io_output_valid                 ), //o
    .io_output_ready            (output_ready                                      ), //i
    .io_output_payload_last     (poparea_tx_header_io_output_payload_last          ), //o
    .io_output_payload_fragment (poparea_tx_header_io_output_payload_fragment[63:0]), //o
    .io_header                  (header[63:0]                                      ), //i
    .pop_clk                    (pop_clk                                           ), //i
    .pop_reset                  (pop_reset                                         )  //i
  );
  assign hssl_inputs1_ready = hssl1_pusharea_hssl1_stream_fifo_input_ready;
  assign hssl_inputs2_ready = hssl2_pusharea_hssl2_stream_fifo_input_ready;
  assign hssl_inputs3_ready = hssl2_pusharea_hssl3_stream_fifo_input_ready;
  assign hssl_inputs4_ready = hssl2_pusharea_hssl4_stream_fifo_input_ready;
  always @(*) begin
    poparea_counter_willIncrement = 1'b0;
    if(poparea_start) begin
      poparea_counter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    poparea_counter_willClear = 1'b0;
    if(when_RxStream_Mix_l103) begin
      poparea_counter_willClear = 1'b1;
    end
  end

  assign poparea_counter_willOverflowIfInc = (poparea_counter_value == 5'h10);
  assign poparea_counter_willOverflow = (poparea_counter_willOverflowIfInc && poparea_counter_willIncrement);
  always @(*) begin
    if(poparea_counter_willOverflow) begin
      poparea_counter_valueNext = 5'h0;
    end else begin
      poparea_counter_valueNext = (poparea_counter_value + _zz_poparea_counter_valueNext);
    end
    if(poparea_counter_willClear) begin
      poparea_counter_valueNext = 5'h0;
    end
  end

  assign when_RxStream_Mix_l96 = (poparea_tick && (! poparea_tick_regNext));
  assign when_RxStream_Mix_l103 = (poparea_counter_value == 5'h10);
  assign when_RxStream_Mix_l106 = (poparea_counter_value == 5'h0f);
  assign when_RxStream_Mix_l113 = ((5'h0 <= poparea_counter_value) && (poparea_counter_value < 5'h04));
  assign when_RxStream_Mix_l113_1 = ((5'h04 <= poparea_counter_value) && (poparea_counter_value < 5'h08));
  assign when_RxStream_Mix_l113_2 = ((5'h08 <= poparea_counter_value) && (poparea_counter_value < 5'h0c));
  assign when_RxStream_Mix_l113_3 = ((5'h0c <= poparea_counter_value) && (poparea_counter_value < 5'h10));
  assign poparea_tx_header_io_input_fire = (poparea_mix_stream_io_pop_valid && poparea_tx_header_io_input_ready);
  assign poparea_tx_header_io_input_payload_last = ((poparea_mix_stream_io_occupancy == 7'h01) && poparea_tx_header_io_input_fire);
  assign output_valid = poparea_tx_header_io_output_valid;
  assign output_payload_last = poparea_tx_header_io_output_payload_last;
  assign output_payload_fragment = poparea_tx_header_io_output_payload_fragment;
  always @(posedge pop_clk or posedge pop_reset) begin
    if(pop_reset) begin
      poparea_ready <= 1'b0;
      poparea_tick <= 1'b0;
      poparea_last <= 1'b0;
      poparea_start <= 1'b0;
      poparea_counter_value <= 5'h0;
      poparea_select <= 2'b00;
    end else begin
      poparea_tick <= tick;
      poparea_counter_value <= poparea_counter_valueNext;
      poparea_last <= 1'b0;
      if(when_RxStream_Mix_l96) begin
        poparea_start <= 1'b1;
        poparea_ready <= 1'b1;
      end
      if(when_RxStream_Mix_l103) begin
        poparea_start <= 1'b0;
      end else begin
        if(when_RxStream_Mix_l106) begin
          poparea_ready <= 1'b0;
          poparea_last <= 1'b1;
        end
      end
      if(when_RxStream_Mix_l113) begin
        poparea_select <= 2'b00;
      end
      if(when_RxStream_Mix_l113_1) begin
        poparea_select <= 2'b01;
      end
      if(when_RxStream_Mix_l113_2) begin
        poparea_select <= 2'b10;
      end
      if(when_RxStream_Mix_l113_3) begin
        poparea_select <= 2'b11;
      end
    end
  end

  always @(posedge pop_clk) begin
    poparea_tick_regNext <= poparea_tick;
    poparea_ready_regNext <= poparea_ready;
  end


endmodule

module TxHeader (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [63:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output reg          io_output_payload_last,
  output reg [63:0]   io_output_payload_fragment,
  input      [63:0]   io_header,
  input               pop_clk,
  input               pop_reset
);

  reg        [0:0]    state;
  wire                when_RxStream_Mix_l149;
  wire                io_output_fire;
  wire                io_input_fire;
  wire                when_RxStream_Mix_l158;

  assign io_output_valid = io_input_valid;
  always @(*) begin
    io_output_payload_last = io_input_payload_last;
    if(when_RxStream_Mix_l149) begin
      io_output_payload_last = io_input_payload_last;
    end
  end

  always @(*) begin
    io_input_ready = 1'b0;
    if(when_RxStream_Mix_l149) begin
      io_input_ready = io_output_ready;
    end
  end

  assign when_RxStream_Mix_l149 = (state == 1'b1);
  always @(*) begin
    if(when_RxStream_Mix_l149) begin
      io_output_payload_fragment = io_input_payload_fragment;
    end else begin
      io_output_payload_fragment = io_header[63 : 0];
    end
  end

  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign when_RxStream_Mix_l158 = (io_input_fire && io_input_payload_last);
  always @(posedge pop_clk or posedge pop_reset) begin
    if(pop_reset) begin
      state <= 1'b0;
    end else begin
      if(!when_RxStream_Mix_l149) begin
        if(io_output_fire) begin
          state <= (state + 1'b1);
        end
      end
      if(when_RxStream_Mix_l158) begin
        state <= 1'b0;
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  input               io_flush,
  output     [6:0]    io_occupancy,
  output     [6:0]    io_availability,
  input               pop_clk,
  input               pop_reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [5:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1078;
  wire       [5:0]    logic_ptrDif;
  reg [63:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge pop_clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge pop_clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h3f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h3f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1078 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge pop_clk or posedge pop_reset) begin
    if(pop_reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1078) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamMux (
  input      [1:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [63:0]   io_inputs_0_payload,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [63:0]   io_inputs_1_payload,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [63:0]   io_inputs_2_payload,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input      [63:0]   io_inputs_3_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [63:0]   io_output_payload
);

  reg                 _zz_io_output_valid;
  reg        [63:0]   _zz_io_output_payload;

  always @(*) begin
    case(io_select)
      2'b00 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload = io_inputs_0_payload;
      end
      2'b01 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload = io_inputs_1_payload;
      end
      2'b10 : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload = io_inputs_2_payload;
      end
      default : begin
        _zz_io_output_valid = io_inputs_3_valid;
        _zz_io_output_payload = io_inputs_3_payload;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 2'b00) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 2'b01) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 2'b10) && io_output_ready);
  assign io_inputs_3_ready = ((io_select == 2'b11) && io_output_ready);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload = _zz_io_output_payload;

endmodule

//RxStream_Fifo_2 replaced by RxStream_Fifo_2

module RxStream_Fifo_2 (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [63:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output     [63:0]   output_payload,
  input               tick,
  input               pop_clk,
  input               pop_reset,
  input               hssl2_clk,
  input               hssl2_reset,
  input               hssl2_reset_syncronized_1
);

  wire                push_area_stream_fifo_io_pop_ready;
  wire                push_area_stream_fifo_io_push_ready;
  wire                push_area_stream_fifo_io_pop_valid;
  wire       [63:0]   push_area_stream_fifo_io_pop_payload;
  wire       [4:0]    push_area_stream_fifo_io_pushOccupancy;
  wire       [4:0]    push_area_stream_fifo_io_popOccupancy;
  wire                push_area_pulse_io_pulseOut;
  reg                 pop_area_data_trigger;
  reg                 pop_area_trigger;
  wire                when_RxStream_Mix_l31;
  reg                 pop_area_tick;
  reg                 pop_area_tick_regNext;
  wire                when_RxStream_Mix_l38;
  wire                when_RxStream_Mix_l40;

  StreamFifoCC_2 push_area_stream_fifo (
    .io_push_valid             (input_valid                                ), //i
    .io_push_ready             (push_area_stream_fifo_io_push_ready        ), //o
    .io_push_payload           (input_payload_fragment[63:0]               ), //i
    .io_pop_valid              (push_area_stream_fifo_io_pop_valid         ), //o
    .io_pop_ready              (push_area_stream_fifo_io_pop_ready         ), //i
    .io_pop_payload            (push_area_stream_fifo_io_pop_payload[63:0] ), //o
    .io_pushOccupancy          (push_area_stream_fifo_io_pushOccupancy[4:0]), //o
    .io_popOccupancy           (push_area_stream_fifo_io_popOccupancy[4:0] ), //o
    .hssl2_clk                 (hssl2_clk                                  ), //i
    .hssl2_reset               (hssl2_reset                                ), //i
    .pop_clk                   (pop_clk                                    ), //i
    .hssl2_reset_syncronized_1 (hssl2_reset_syncronized_1                  )  //i
  );
  PulseCCByToggle_1 push_area_pulse (
    .io_pulseIn                (input_payload_last         ), //i
    .io_pulseOut               (push_area_pulse_io_pulseOut), //o
    .hssl2_clk                 (hssl2_clk                  ), //i
    .hssl2_reset               (hssl2_reset                ), //i
    .pop_clk                   (pop_clk                    ), //i
    .hssl2_reset_syncronized_1 (hssl2_reset_syncronized_1  )  //i
  );
  assign input_ready = push_area_stream_fifo_io_push_ready;
  assign when_RxStream_Mix_l31 = (push_area_stream_fifo_io_popOccupancy == 5'h0);
  assign when_RxStream_Mix_l38 = (pop_area_tick && (! pop_area_tick_regNext));
  assign when_RxStream_Mix_l40 = (push_area_stream_fifo_io_popOccupancy == 5'h0);
  assign push_area_stream_fifo_io_pop_ready = (output_ready && pop_area_trigger);
  assign output_payload = (pop_area_trigger ? push_area_stream_fifo_io_pop_payload : 64'h0);
  assign output_valid = output_ready;
  always @(posedge pop_clk or posedge pop_reset) begin
    if(pop_reset) begin
      pop_area_data_trigger <= 1'b0;
      pop_area_trigger <= 1'b0;
      pop_area_tick <= 1'b0;
    end else begin
      if(push_area_pulse_io_pulseOut) begin
        pop_area_data_trigger <= 1'b1;
      end else begin
        if(when_RxStream_Mix_l31) begin
          pop_area_data_trigger <= 1'b0;
        end else begin
          pop_area_data_trigger <= pop_area_data_trigger;
        end
      end
      pop_area_tick <= tick;
      if(when_RxStream_Mix_l38) begin
        pop_area_trigger <= pop_area_data_trigger;
      end else begin
        if(when_RxStream_Mix_l40) begin
          pop_area_trigger <= 1'b0;
        end else begin
          pop_area_trigger <= pop_area_trigger;
        end
      end
    end
  end

  always @(posedge pop_clk) begin
    pop_area_tick_regNext <= pop_area_tick;
  end


endmodule

module RxStream_Fifo_1 (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [63:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output     [63:0]   output_payload,
  input               tick,
  input               pop_clk,
  input               pop_reset,
  input               hssl2_clk,
  input               hssl2_reset,
  output              hssl2_reset_syncronized_1
);

  wire                push_area_stream_fifo_io_pop_ready;
  wire                push_area_stream_fifo_io_push_ready;
  wire                push_area_stream_fifo_io_pop_valid;
  wire       [63:0]   push_area_stream_fifo_io_pop_payload;
  wire       [4:0]    push_area_stream_fifo_io_pushOccupancy;
  wire       [4:0]    push_area_stream_fifo_io_popOccupancy;
  wire                push_area_stream_fifo_hssl2_reset_syncronized_1;
  wire                push_area_pulse_io_pulseOut;
  reg                 pop_area_data_trigger;
  reg                 pop_area_trigger;
  wire                when_RxStream_Mix_l31;
  reg                 pop_area_tick;
  reg                 pop_area_tick_regNext;
  wire                when_RxStream_Mix_l38;
  wire                when_RxStream_Mix_l40;

  StreamFifoCC_1 push_area_stream_fifo (
    .io_push_valid             (input_valid                                    ), //i
    .io_push_ready             (push_area_stream_fifo_io_push_ready            ), //o
    .io_push_payload           (input_payload_fragment[63:0]                   ), //i
    .io_pop_valid              (push_area_stream_fifo_io_pop_valid             ), //o
    .io_pop_ready              (push_area_stream_fifo_io_pop_ready             ), //i
    .io_pop_payload            (push_area_stream_fifo_io_pop_payload[63:0]     ), //o
    .io_pushOccupancy          (push_area_stream_fifo_io_pushOccupancy[4:0]    ), //o
    .io_popOccupancy           (push_area_stream_fifo_io_popOccupancy[4:0]     ), //o
    .hssl2_clk                 (hssl2_clk                                      ), //i
    .hssl2_reset               (hssl2_reset                                    ), //i
    .pop_clk                   (pop_clk                                        ), //i
    .hssl2_reset_syncronized_1 (push_area_stream_fifo_hssl2_reset_syncronized_1)  //o
  );
  PulseCCByToggle_1 push_area_pulse (
    .io_pulseIn                (input_payload_last                             ), //i
    .io_pulseOut               (push_area_pulse_io_pulseOut                    ), //o
    .hssl2_clk                 (hssl2_clk                                      ), //i
    .hssl2_reset               (hssl2_reset                                    ), //i
    .pop_clk                   (pop_clk                                        ), //i
    .hssl2_reset_syncronized_1 (push_area_stream_fifo_hssl2_reset_syncronized_1)  //i
  );
  assign input_ready = push_area_stream_fifo_io_push_ready;
  assign when_RxStream_Mix_l31 = (push_area_stream_fifo_io_popOccupancy == 5'h0);
  assign when_RxStream_Mix_l38 = (pop_area_tick && (! pop_area_tick_regNext));
  assign when_RxStream_Mix_l40 = (push_area_stream_fifo_io_popOccupancy == 5'h0);
  assign push_area_stream_fifo_io_pop_ready = (output_ready && pop_area_trigger);
  assign output_payload = (pop_area_trigger ? push_area_stream_fifo_io_pop_payload : 64'h0);
  assign output_valid = output_ready;
  assign hssl2_reset_syncronized_1 = push_area_stream_fifo_hssl2_reset_syncronized_1;
  always @(posedge pop_clk or posedge pop_reset) begin
    if(pop_reset) begin
      pop_area_data_trigger <= 1'b0;
      pop_area_trigger <= 1'b0;
      pop_area_tick <= 1'b0;
    end else begin
      if(push_area_pulse_io_pulseOut) begin
        pop_area_data_trigger <= 1'b1;
      end else begin
        if(when_RxStream_Mix_l31) begin
          pop_area_data_trigger <= 1'b0;
        end else begin
          pop_area_data_trigger <= pop_area_data_trigger;
        end
      end
      pop_area_tick <= tick;
      if(when_RxStream_Mix_l38) begin
        pop_area_trigger <= pop_area_data_trigger;
      end else begin
        if(when_RxStream_Mix_l40) begin
          pop_area_trigger <= 1'b0;
        end else begin
          pop_area_trigger <= pop_area_trigger;
        end
      end
    end
  end

  always @(posedge pop_clk) begin
    pop_area_tick_regNext <= pop_area_tick;
  end


endmodule

module RxStream_Fifo (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [63:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output     [63:0]   output_payload,
  input               tick,
  input               pop_clk,
  input               pop_reset,
  input               hssl1_clk,
  input               hssl1_reset
);

  wire                push_area_stream_fifo_io_pop_ready;
  wire                push_area_stream_fifo_io_push_ready;
  wire                push_area_stream_fifo_io_pop_valid;
  wire       [63:0]   push_area_stream_fifo_io_pop_payload;
  wire       [4:0]    push_area_stream_fifo_io_pushOccupancy;
  wire       [4:0]    push_area_stream_fifo_io_popOccupancy;
  wire                push_area_stream_fifo_hssl1_reset_syncronized_1;
  wire                push_area_pulse_io_pulseOut;
  reg                 pop_area_data_trigger;
  reg                 pop_area_trigger;
  wire                when_RxStream_Mix_l31;
  reg                 pop_area_tick;
  reg                 pop_area_tick_regNext;
  wire                when_RxStream_Mix_l38;
  wire                when_RxStream_Mix_l40;

  StreamFifoCC push_area_stream_fifo (
    .io_push_valid             (input_valid                                    ), //i
    .io_push_ready             (push_area_stream_fifo_io_push_ready            ), //o
    .io_push_payload           (input_payload_fragment[63:0]                   ), //i
    .io_pop_valid              (push_area_stream_fifo_io_pop_valid             ), //o
    .io_pop_ready              (push_area_stream_fifo_io_pop_ready             ), //i
    .io_pop_payload            (push_area_stream_fifo_io_pop_payload[63:0]     ), //o
    .io_pushOccupancy          (push_area_stream_fifo_io_pushOccupancy[4:0]    ), //o
    .io_popOccupancy           (push_area_stream_fifo_io_popOccupancy[4:0]     ), //o
    .hssl1_clk                 (hssl1_clk                                      ), //i
    .hssl1_reset               (hssl1_reset                                    ), //i
    .pop_clk                   (pop_clk                                        ), //i
    .hssl1_reset_syncronized_1 (push_area_stream_fifo_hssl1_reset_syncronized_1)  //o
  );
  PulseCCByToggle push_area_pulse (
    .io_pulseIn                (input_payload_last                             ), //i
    .io_pulseOut               (push_area_pulse_io_pulseOut                    ), //o
    .hssl1_clk                 (hssl1_clk                                      ), //i
    .hssl1_reset               (hssl1_reset                                    ), //i
    .pop_clk                   (pop_clk                                        ), //i
    .hssl1_reset_syncronized_1 (push_area_stream_fifo_hssl1_reset_syncronized_1)  //i
  );
  assign input_ready = push_area_stream_fifo_io_push_ready;
  assign when_RxStream_Mix_l31 = (push_area_stream_fifo_io_popOccupancy == 5'h0);
  assign when_RxStream_Mix_l38 = (pop_area_tick && (! pop_area_tick_regNext));
  assign when_RxStream_Mix_l40 = (push_area_stream_fifo_io_popOccupancy == 5'h0);
  assign push_area_stream_fifo_io_pop_ready = (output_ready && pop_area_trigger);
  assign output_payload = (pop_area_trigger ? push_area_stream_fifo_io_pop_payload : 64'h0);
  assign output_valid = output_ready;
  always @(posedge pop_clk or posedge pop_reset) begin
    if(pop_reset) begin
      pop_area_data_trigger <= 1'b0;
      pop_area_trigger <= 1'b0;
      pop_area_tick <= 1'b0;
    end else begin
      if(push_area_pulse_io_pulseOut) begin
        pop_area_data_trigger <= 1'b1;
      end else begin
        if(when_RxStream_Mix_l31) begin
          pop_area_data_trigger <= 1'b0;
        end else begin
          pop_area_data_trigger <= pop_area_data_trigger;
        end
      end
      pop_area_tick <= tick;
      if(when_RxStream_Mix_l38) begin
        pop_area_trigger <= pop_area_data_trigger;
      end else begin
        if(when_RxStream_Mix_l40) begin
          pop_area_trigger <= 1'b0;
        end else begin
          pop_area_trigger <= pop_area_trigger;
        end
      end
    end
  end

  always @(posedge pop_clk) begin
    pop_area_tick_regNext <= pop_area_tick;
  end


endmodule

//PulseCCByToggle_1 replaced by PulseCCByToggle_1

//StreamFifoCC_2 replaced by StreamFifoCC_2

//PulseCCByToggle_1 replaced by PulseCCByToggle_1

module StreamFifoCC_2 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               hssl2_clk,
  input               hssl2_reset,
  input               pop_clk,
  input               hssl2_reset_syncronized_1
);

  reg        [63:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [3:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [63:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[3:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge hssl2_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge pop_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_4 popToPushGray_buffercc (
    .io_dataIn   (popToPushGray[4:0]                    ), //i
    .io_dataOut  (popToPushGray_buffercc_io_dataOut[4:0]), //o
    .hssl2_clk   (hssl2_clk                             ), //i
    .hssl2_reset (hssl2_reset                           )  //i
  );
  BufferCC_6 pushToPopGray_buffercc (
    .io_dataIn               (pushToPopGray[4:0]                    ), //i
    .io_dataOut              (pushToPopGray_buffercc_io_dataOut[4:0]), //o
    .pop_clk                 (pop_clk                               ), //i
    .hssl2_reset_syncronized (hssl2_reset_syncronized_1             )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge hssl2_clk or posedge hssl2_reset) begin
    if(hssl2_reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge pop_clk or posedge hssl2_reset_syncronized_1) begin
    if(hssl2_reset_syncronized_1) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module PulseCCByToggle_1 (
  input               io_pulseIn,
  output              io_pulseOut,
  input               hssl2_clk,
  input               hssl2_reset,
  input               pop_clk,
  input               hssl2_reset_syncronized_1
);

  wire                inArea_target_buffercc_io_dataOut;
  reg                 inArea_target;
  wire                outArea_target;
  reg                 outArea_target_regNext;

  BufferCC_7 inArea_target_buffercc (
    .io_dataIn               (inArea_target                    ), //i
    .io_dataOut              (inArea_target_buffercc_io_dataOut), //o
    .pop_clk                 (pop_clk                          ), //i
    .hssl2_reset_syncronized (hssl2_reset_syncronized_1        )  //i
  );
  assign outArea_target = inArea_target_buffercc_io_dataOut;
  assign io_pulseOut = (outArea_target ^ outArea_target_regNext);
  always @(posedge hssl2_clk or posedge hssl2_reset) begin
    if(hssl2_reset) begin
      inArea_target <= 1'b0;
    end else begin
      if(io_pulseIn) begin
        inArea_target <= (! inArea_target);
      end
    end
  end

  always @(posedge pop_clk or posedge hssl2_reset_syncronized_1) begin
    if(hssl2_reset_syncronized_1) begin
      outArea_target_regNext <= 1'b0;
    end else begin
      outArea_target_regNext <= outArea_target;
    end
  end


endmodule

module StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               hssl2_clk,
  input               hssl2_reset,
  input               pop_clk,
  output              hssl2_reset_syncronized_1
);

  reg        [63:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_14_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [3:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                hssl2_reset_syncronized;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [63:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[3:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge hssl2_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge pop_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_4 popToPushGray_buffercc (
    .io_dataIn   (popToPushGray[4:0]                    ), //i
    .io_dataOut  (popToPushGray_buffercc_io_dataOut[4:0]), //o
    .hssl2_clk   (hssl2_clk                             ), //i
    .hssl2_reset (hssl2_reset                           )  //i
  );
  BufferCC_5 bufferCC_14 (
    .io_dataIn   (1'b0                  ), //i
    .io_dataOut  (bufferCC_14_io_dataOut), //o
    .pop_clk     (pop_clk               ), //i
    .hssl2_reset (hssl2_reset           )  //i
  );
  BufferCC_6 pushToPopGray_buffercc (
    .io_dataIn               (pushToPopGray[4:0]                    ), //i
    .io_dataOut              (pushToPopGray_buffercc_io_dataOut[4:0]), //o
    .pop_clk                 (pop_clk                               ), //i
    .hssl2_reset_syncronized (hssl2_reset_syncronized               )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign hssl2_reset_syncronized = bufferCC_14_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  assign hssl2_reset_syncronized_1 = hssl2_reset_syncronized;
  always @(posedge hssl2_clk or posedge hssl2_reset) begin
    if(hssl2_reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge pop_clk or posedge hssl2_reset_syncronized) begin
    if(hssl2_reset_syncronized) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module PulseCCByToggle (
  input               io_pulseIn,
  output              io_pulseOut,
  input               hssl1_clk,
  input               hssl1_reset,
  input               pop_clk,
  input               hssl1_reset_syncronized_1
);

  wire                inArea_target_buffercc_io_dataOut;
  reg                 inArea_target;
  wire                outArea_target;
  reg                 outArea_target_regNext;

  BufferCC_3 inArea_target_buffercc (
    .io_dataIn               (inArea_target                    ), //i
    .io_dataOut              (inArea_target_buffercc_io_dataOut), //o
    .pop_clk                 (pop_clk                          ), //i
    .hssl1_reset_syncronized (hssl1_reset_syncronized_1        )  //i
  );
  assign outArea_target = inArea_target_buffercc_io_dataOut;
  assign io_pulseOut = (outArea_target ^ outArea_target_regNext);
  always @(posedge hssl1_clk or posedge hssl1_reset) begin
    if(hssl1_reset) begin
      inArea_target <= 1'b0;
    end else begin
      if(io_pulseIn) begin
        inArea_target <= (! inArea_target);
      end
    end
  end

  always @(posedge pop_clk or posedge hssl1_reset_syncronized_1) begin
    if(hssl1_reset_syncronized_1) begin
      outArea_target_regNext <= 1'b0;
    end else begin
      outArea_target_regNext <= outArea_target;
    end
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               hssl1_clk,
  input               hssl1_reset,
  input               pop_clk,
  output              hssl1_reset_syncronized_1
);

  reg        [63:0]   _zz_ram_port1;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_14_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [4:0]    _zz_pushCC_pushPtrGray;
  wire       [3:0]    _zz_ram_port;
  wire       [4:0]    _zz_popCC_popPtrGray;
  wire       [3:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [3:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                hssl1_reset_syncronized;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [4:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  reg [63:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[3:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge hssl1_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge pop_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn   (popToPushGray[4:0]                    ), //i
    .io_dataOut  (popToPushGray_buffercc_io_dataOut[4:0]), //o
    .hssl1_clk   (hssl1_clk                             ), //i
    .hssl1_reset (hssl1_reset                           )  //i
  );
  BufferCC_1 bufferCC_14 (
    .io_dataIn   (1'b0                  ), //i
    .io_dataOut  (bufferCC_14_io_dataOut), //o
    .pop_clk     (pop_clk               ), //i
    .hssl1_reset (hssl1_reset           )  //i
  );
  BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn               (pushToPopGray[4:0]                    ), //i
    .io_dataOut              (pushToPopGray_buffercc_io_dataOut[4:0]), //o
    .pop_clk                 (pop_clk                               ), //i
    .hssl1_reset_syncronized (hssl1_reset_syncronized               )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}});
  assign hssl1_reset_syncronized = bufferCC_14_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  assign hssl1_reset_syncronized_1 = hssl1_reset_syncronized;
  always @(posedge hssl1_clk or posedge hssl1_reset) begin
    if(hssl1_reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge pop_clk or posedge hssl1_reset_syncronized) begin
    if(hssl1_reset_syncronized) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

//BufferCC_7 replaced by BufferCC_7

//BufferCC_6 replaced by BufferCC_6

//BufferCC_4 replaced by BufferCC_4

//BufferCC_7 replaced by BufferCC_7

//BufferCC_6 replaced by BufferCC_6

//BufferCC_4 replaced by BufferCC_4

module BufferCC_7 (
  input               io_dataIn,
  output              io_dataOut,
  input               pop_clk,
  input               hssl2_reset_syncronized
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pop_clk or posedge hssl2_reset_syncronized) begin
    if(hssl2_reset_syncronized) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_6 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               pop_clk,
  input               hssl2_reset_syncronized
);

  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pop_clk or posedge hssl2_reset_syncronized) begin
    if(hssl2_reset_syncronized) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_5 (
  input               io_dataIn,
  output              io_dataOut,
  input               pop_clk,
  input               hssl2_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pop_clk or posedge hssl2_reset) begin
    if(hssl2_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_4 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               hssl2_clk,
  input               hssl2_reset
);

  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge hssl2_clk or posedge hssl2_reset) begin
    if(hssl2_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_3 (
  input               io_dataIn,
  output              io_dataOut,
  input               pop_clk,
  input               hssl1_reset_syncronized
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pop_clk or posedge hssl1_reset_syncronized) begin
    if(hssl1_reset_syncronized) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_2 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               pop_clk,
  input               hssl1_reset_syncronized
);

  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pop_clk or posedge hssl1_reset_syncronized) begin
    if(hssl1_reset_syncronized) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               pop_clk,
  input               hssl1_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pop_clk or posedge hssl1_reset) begin
    if(hssl1_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               hssl1_clk,
  input               hssl1_reset
);

  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge hssl1_clk or posedge hssl1_reset) begin
    if(hssl1_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
