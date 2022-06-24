// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : FiberTest
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module FiberTest (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               timer_tick,
  input               clk,
  input               reset,
  output              led,
  input      [31:0]   slave_id
);

  wire                fiberarea_fiberrxpreamble_input_ready;
  wire                fiberarea_fiberrxpreamble_output_valid;
  wire                fiberarea_fiberrxpreamble_output_payload_last;
  wire       [31:0]   fiberarea_fiberrxpreamble_output_payload_fragment;
  wire                fiberarea_fiberrxbuffer_push_stream_ready;
  wire                fiberarea_fiberrxbuffer_pop_stream_valid;
  wire                fiberarea_fiberrxbuffer_pop_stream_payload_last;
  wire       [7:0]    fiberarea_fiberrxbuffer_pop_stream_payload_fragment;
  wire                fiberarea_fiberrxstream_input_ready;
  wire                fiberarea_fiberrxstream_output_0_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_0_payload;
  wire                fiberarea_fiberrxstream_output_1_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_1_payload;
  wire                fiberarea_fiberrxstream_output_2_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_2_payload;
  wire                fiberarea_fiberrxstream_output_3_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_3_payload;
  wire                fiberarea_fiberrxstream_output_4_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_4_payload;
  wire                fiberarea_fiberrxstream_output_5_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_5_payload;
  wire                fiberarea_fiberrxstream_output_6_valid;
  wire       [7:0]    fiberarea_fiberrxstream_output_6_payload;
  wire                fiberarea_modbus_0_input_ready;
  wire       [7:0]    fiberarea_modbus_0_reads_dataOut;
  wire                fiberarea_modbus_1_input_ready;
  wire       [7:0]    fiberarea_modbus_1_reads_dataOut;
  wire                fiberarea_modbus_2_input_ready;
  wire       [7:0]    fiberarea_modbus_2_reads_dataOut;
  wire                fiberarea_modbus_3_input_ready;
  wire       [7:0]    fiberarea_modbus_3_reads_dataOut;
  wire                fiberarea_modbus_4_input_ready;
  wire       [7:0]    fiberarea_modbus_4_reads_dataOut;
  wire                fiberarea_modbus_5_input_ready;
  wire       [7:0]    fiberarea_modbus_5_reads_dataOut;
  wire                fiberarea_modbus_6_input_ready;
  wire       [7:0]    fiberarea_modbus_6_reads_dataOut;
  wire       [4:0]    fiberarea_fibertxstream_reads_0_addr;
  wire                fiberarea_fibertxstream_reads_0_en;
  wire       [4:0]    fiberarea_fibertxstream_reads_1_addr;
  wire                fiberarea_fibertxstream_reads_1_en;
  wire       [4:0]    fiberarea_fibertxstream_reads_2_addr;
  wire                fiberarea_fibertxstream_reads_2_en;
  wire       [4:0]    fiberarea_fibertxstream_reads_3_addr;
  wire                fiberarea_fibertxstream_reads_3_en;
  wire       [4:0]    fiberarea_fibertxstream_reads_4_addr;
  wire                fiberarea_fibertxstream_reads_4_en;
  wire       [4:0]    fiberarea_fibertxstream_reads_5_addr;
  wire                fiberarea_fibertxstream_reads_5_en;
  wire       [4:0]    fiberarea_fibertxstream_reads_6_addr;
  wire                fiberarea_fibertxstream_reads_6_en;
  wire                fiberarea_fibertxstream_output_valid;
  wire                fiberarea_fibertxstream_output_payload_last;
  wire       [31:0]   fiberarea_fibertxstream_output_payload_fragment;
  wire                fiberarea_fibertxheader_io_input_ready;
  wire                fiberarea_fibertxheader_io_output_valid;
  wire                fiberarea_fibertxheader_io_output_payload_last;
  wire       [31:0]   fiberarea_fibertxheader_io_output_payload_fragment;
  wire                fiberarea_fibertxpadder_input_ready;
  wire                fiberarea_fibertxpadder_output_valid;
  wire                fiberarea_fibertxpadder_output_payload_last;
  wire       [31:0]   fiberarea_fibertxpadder_output_payload_fragment;
  wire       [25:0]   _zz_fiberarea_counter_valueNext;
  wire       [0:0]    _zz_fiberarea_counter_valueNext_1;
  reg                 fiberarea_ledtemp;
  wire                fiberarea_counter_willIncrement;
  reg                 fiberarea_counter_willClear;
  reg        [25:0]   fiberarea_counter_valueNext;
  reg        [25:0]   fiberarea_counter_value;
  wire                fiberarea_counter_willOverflowIfInc;
  wire                fiberarea_counter_willOverflow;

  assign _zz_fiberarea_counter_valueNext_1 = fiberarea_counter_willIncrement;
  assign _zz_fiberarea_counter_valueNext = {25'd0, _zz_fiberarea_counter_valueNext_1};
  FiberRxPreamble fiberarea_fiberrxpreamble (
    .input_valid                (input_valid                                              ), //i
    .input_ready                (fiberarea_fiberrxpreamble_input_ready                    ), //o
    .input_payload_last         (input_payload_last                                       ), //i
    .input_payload_fragment     (input_payload_fragment[31:0]                             ), //i
    .slave_id                   (slave_id[31:0]                                           ), //i
    .output_valid               (fiberarea_fiberrxpreamble_output_valid                   ), //o
    .output_ready               (fiberarea_fiberrxbuffer_push_stream_ready                ), //i
    .output_payload_last        (fiberarea_fiberrxpreamble_output_payload_last            ), //o
    .output_payload_fragment    (fiberarea_fiberrxpreamble_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                                      ), //i
    .reset                      (reset                                                    )  //i
  );
  FiberRxBuffer fiberarea_fiberrxbuffer (
    .push_stream_valid               (fiberarea_fiberrxpreamble_output_valid                    ), //i
    .push_stream_ready               (fiberarea_fiberrxbuffer_push_stream_ready                 ), //o
    .push_stream_payload_last        (fiberarea_fiberrxpreamble_output_payload_last             ), //i
    .push_stream_payload_fragment    (fiberarea_fiberrxpreamble_output_payload_fragment[31:0]   ), //i
    .pop_stream_valid                (fiberarea_fiberrxbuffer_pop_stream_valid                  ), //o
    .pop_stream_ready                (fiberarea_fiberrxstream_input_ready                       ), //i
    .pop_stream_payload_last         (fiberarea_fiberrxbuffer_pop_stream_payload_last           ), //o
    .pop_stream_payload_fragment     (fiberarea_fiberrxbuffer_pop_stream_payload_fragment[7:0]  ), //o
    .clk                             (clk                                                       ), //i
    .reset                           (reset                                                     )  //i
  );
  FiberRxStream fiberarea_fiberrxstream (
    .input_valid               (fiberarea_fiberrxbuffer_pop_stream_valid                  ), //i
    .input_ready               (fiberarea_fiberrxstream_input_ready                       ), //o
    .input_payload_last        (fiberarea_fiberrxbuffer_pop_stream_payload_last           ), //i
    .input_payload_fragment    (fiberarea_fiberrxbuffer_pop_stream_payload_fragment[7:0]  ), //i
    .output_0_valid            (fiberarea_fiberrxstream_output_0_valid                    ), //o
    .output_0_ready            (fiberarea_modbus_0_input_ready                            ), //i
    .output_0_payload          (fiberarea_fiberrxstream_output_0_payload[7:0]             ), //o
    .output_1_valid            (fiberarea_fiberrxstream_output_1_valid                    ), //o
    .output_1_ready            (fiberarea_modbus_1_input_ready                            ), //i
    .output_1_payload          (fiberarea_fiberrxstream_output_1_payload[7:0]             ), //o
    .output_2_valid            (fiberarea_fiberrxstream_output_2_valid                    ), //o
    .output_2_ready            (fiberarea_modbus_2_input_ready                            ), //i
    .output_2_payload          (fiberarea_fiberrxstream_output_2_payload[7:0]             ), //o
    .output_3_valid            (fiberarea_fiberrxstream_output_3_valid                    ), //o
    .output_3_ready            (fiberarea_modbus_3_input_ready                            ), //i
    .output_3_payload          (fiberarea_fiberrxstream_output_3_payload[7:0]             ), //o
    .output_4_valid            (fiberarea_fiberrxstream_output_4_valid                    ), //o
    .output_4_ready            (fiberarea_modbus_4_input_ready                            ), //i
    .output_4_payload          (fiberarea_fiberrxstream_output_4_payload[7:0]             ), //o
    .output_5_valid            (fiberarea_fiberrxstream_output_5_valid                    ), //o
    .output_5_ready            (fiberarea_modbus_5_input_ready                            ), //i
    .output_5_payload          (fiberarea_fiberrxstream_output_5_payload[7:0]             ), //o
    .output_6_valid            (fiberarea_fiberrxstream_output_6_valid                    ), //o
    .output_6_ready            (fiberarea_modbus_6_input_ready                            ), //i
    .output_6_payload          (fiberarea_fiberrxstream_output_6_payload[7:0]             ), //o
    .clk                       (clk                                                       ), //i
    .reset                     (reset                                                     )  //i
  );
  ModusTop fiberarea_modbus_0 (
    .input_valid      (fiberarea_fiberrxstream_output_0_valid         ), //i
    .input_ready      (fiberarea_modbus_0_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_0_payload[7:0]  ), //i
    .slaveid          (8'h01                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_0_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_0_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_0_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  ModusTop_1 fiberarea_modbus_1 (
    .input_valid      (fiberarea_fiberrxstream_output_1_valid         ), //i
    .input_ready      (fiberarea_modbus_1_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_1_payload[7:0]  ), //i
    .slaveid          (8'h02                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_1_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_1_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_1_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  ModusTop_2 fiberarea_modbus_2 (
    .input_valid      (fiberarea_fiberrxstream_output_2_valid         ), //i
    .input_ready      (fiberarea_modbus_2_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_2_payload[7:0]  ), //i
    .slaveid          (8'h03                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_2_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_2_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_2_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  ModusTop_3 fiberarea_modbus_3 (
    .input_valid      (fiberarea_fiberrxstream_output_3_valid         ), //i
    .input_ready      (fiberarea_modbus_3_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_3_payload[7:0]  ), //i
    .slaveid          (8'h04                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_3_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_3_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_3_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  ModusTop_4 fiberarea_modbus_4 (
    .input_valid      (fiberarea_fiberrxstream_output_4_valid         ), //i
    .input_ready      (fiberarea_modbus_4_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_4_payload[7:0]  ), //i
    .slaveid          (8'h05                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_4_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_4_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_4_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  ModusTop_5 fiberarea_modbus_5 (
    .input_valid      (fiberarea_fiberrxstream_output_5_valid         ), //i
    .input_ready      (fiberarea_modbus_5_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_5_payload[7:0]  ), //i
    .slaveid          (8'h06                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_5_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_5_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_5_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  ModusTop_6 fiberarea_modbus_6 (
    .input_valid      (fiberarea_fiberrxstream_output_6_valid         ), //i
    .input_ready      (fiberarea_modbus_6_input_ready                 ), //o
    .input_payload    (fiberarea_fiberrxstream_output_6_payload[7:0]  ), //i
    .slaveid          (8'h07                                          ), //i
    .reads_addr       (fiberarea_fibertxstream_reads_6_addr[4:0]      ), //i
    .reads_dataOut    (fiberarea_modbus_6_reads_dataOut[7:0]          ), //o
    .reads_en         (fiberarea_fibertxstream_reads_6_en             ), //i
    .clk              (clk                                            ), //i
    .reset            (reset                                          )  //i
  );
  FiberTxStream fiberarea_fibertxstream (
    .reads_0_addr               (fiberarea_fibertxstream_reads_0_addr[4:0]              ), //o
    .reads_0_dataOut            (fiberarea_modbus_0_reads_dataOut[7:0]                  ), //i
    .reads_0_en                 (fiberarea_fibertxstream_reads_0_en                     ), //o
    .reads_1_addr               (fiberarea_fibertxstream_reads_1_addr[4:0]              ), //o
    .reads_1_dataOut            (fiberarea_modbus_1_reads_dataOut[7:0]                  ), //i
    .reads_1_en                 (fiberarea_fibertxstream_reads_1_en                     ), //o
    .reads_2_addr               (fiberarea_fibertxstream_reads_2_addr[4:0]              ), //o
    .reads_2_dataOut            (fiberarea_modbus_2_reads_dataOut[7:0]                  ), //i
    .reads_2_en                 (fiberarea_fibertxstream_reads_2_en                     ), //o
    .reads_3_addr               (fiberarea_fibertxstream_reads_3_addr[4:0]              ), //o
    .reads_3_dataOut            (fiberarea_modbus_3_reads_dataOut[7:0]                  ), //i
    .reads_3_en                 (fiberarea_fibertxstream_reads_3_en                     ), //o
    .reads_4_addr               (fiberarea_fibertxstream_reads_4_addr[4:0]              ), //o
    .reads_4_dataOut            (fiberarea_modbus_4_reads_dataOut[7:0]                  ), //i
    .reads_4_en                 (fiberarea_fibertxstream_reads_4_en                     ), //o
    .reads_5_addr               (fiberarea_fibertxstream_reads_5_addr[4:0]              ), //o
    .reads_5_dataOut            (fiberarea_modbus_5_reads_dataOut[7:0]                  ), //i
    .reads_5_en                 (fiberarea_fibertxstream_reads_5_en                     ), //o
    .reads_6_addr               (fiberarea_fibertxstream_reads_6_addr[4:0]              ), //o
    .reads_6_dataOut            (fiberarea_modbus_6_reads_dataOut[7:0]                  ), //i
    .reads_6_en                 (fiberarea_fibertxstream_reads_6_en                     ), //o
    .output_valid               (fiberarea_fibertxstream_output_valid                   ), //o
    .output_ready               (fiberarea_fibertxheader_io_input_ready                 ), //i
    .output_payload_last        (fiberarea_fibertxstream_output_payload_last            ), //o
    .output_payload_fragment    (fiberarea_fibertxstream_output_payload_fragment[31:0]  ), //o
    .timer_tick                 (timer_tick                                             ), //i
    .clk                        (clk                                                    ), //i
    .reset                      (reset                                                  )  //i
  );
  FiberTxHeader fiberarea_fibertxheader (
    .io_input_valid                (fiberarea_fibertxstream_output_valid                      ), //i
    .io_input_ready                (fiberarea_fibertxheader_io_input_ready                    ), //o
    .io_input_payload_last         (fiberarea_fibertxstream_output_payload_last               ), //i
    .io_input_payload_fragment     (fiberarea_fibertxstream_output_payload_fragment[31:0]     ), //i
    .io_output_valid               (fiberarea_fibertxheader_io_output_valid                   ), //o
    .io_output_ready               (fiberarea_fibertxpadder_input_ready                       ), //i
    .io_output_payload_last        (fiberarea_fibertxheader_io_output_payload_last            ), //o
    .io_output_payload_fragment    (fiberarea_fibertxheader_io_output_payload_fragment[31:0]  ), //o
    .io_slave_id                   (slave_id[31:0]                                            ), //i
    .clk                           (clk                                                       ), //i
    .reset                         (reset                                                     )  //i
  );
  FiberTxPadder fiberarea_fibertxpadder (
    .input_valid                (fiberarea_fibertxheader_io_output_valid                   ), //i
    .input_ready                (fiberarea_fibertxpadder_input_ready                       ), //o
    .input_payload_last         (fiberarea_fibertxheader_io_output_payload_last            ), //i
    .input_payload_fragment     (fiberarea_fibertxheader_io_output_payload_fragment[31:0]  ), //i
    .output_valid               (fiberarea_fibertxpadder_output_valid                      ), //o
    .output_ready               (output_ready                                              ), //i
    .output_payload_last        (fiberarea_fibertxpadder_output_payload_last               ), //o
    .output_payload_fragment    (fiberarea_fibertxpadder_output_payload_fragment[31:0]     ), //o
    .clk                        (clk                                                       ), //i
    .reset                      (reset                                                     )  //i
  );
  assign input_ready = fiberarea_fiberrxpreamble_input_ready;
  assign output_valid = fiberarea_fibertxpadder_output_valid;
  assign output_payload_last = fiberarea_fibertxpadder_output_payload_last;
  assign output_payload_fragment = fiberarea_fibertxpadder_output_payload_fragment;
  always @(*) begin
    fiberarea_counter_willClear = 1'b0;
    if(fiberarea_counter_willOverflow) begin
      fiberarea_counter_willClear = 1'b1;
    end
  end

  assign fiberarea_counter_willOverflowIfInc = (fiberarea_counter_value == 26'h3b9ac9f);
  assign fiberarea_counter_willOverflow = (fiberarea_counter_willOverflowIfInc && fiberarea_counter_willIncrement);
  always @(*) begin
    if(fiberarea_counter_willOverflow) begin
      fiberarea_counter_valueNext = 26'h0;
    end else begin
      fiberarea_counter_valueNext = (fiberarea_counter_value + _zz_fiberarea_counter_valueNext);
    end
    if(fiberarea_counter_willClear) begin
      fiberarea_counter_valueNext = 26'h0;
    end
  end

  assign fiberarea_counter_willIncrement = 1'b1;
  assign led = fiberarea_ledtemp;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fiberarea_ledtemp <= 1'b0;
      fiberarea_counter_value <= 26'h0;
    end else begin
      fiberarea_counter_value <= fiberarea_counter_valueNext;
      if(fiberarea_counter_willOverflow) begin
        fiberarea_ledtemp <= (! fiberarea_ledtemp);
      end
    end
  end


endmodule

module FiberTxPadder (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output reg          output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               clk,
  input               reset
);

  reg        [5:0]    counter;
  wire                ok;
  wire                input_fire;
  reg                 input_payload_first;
  wire                fill;
  wire                output_fire;
  wire                when_FiberTxPadder_l18;
  wire                output_fire_1;
  wire                when_FiberTxPadder_l21;
  wire                _zz_input_ready;
  wire                when_FiberTxPadder_l25;

  assign ok = (counter == 6'h3f);
  assign input_fire = (input_valid && input_ready);
  assign fill = ((counter != 6'h0) && input_payload_first);
  assign output_fire = (output_valid && output_ready);
  assign when_FiberTxPadder_l18 = ((! ok) && output_fire);
  assign output_fire_1 = (output_valid && output_ready);
  assign when_FiberTxPadder_l21 = (output_fire_1 && output_payload_last);
  assign _zz_input_ready = (! fill);
  assign input_ready = (output_ready && _zz_input_ready);
  always @(*) begin
    output_valid = (input_valid && _zz_input_ready);
    if(fill) begin
      output_valid = 1'b1;
    end
  end

  always @(*) begin
    output_payload_last = input_payload_last;
    if(when_FiberTxPadder_l25) begin
      output_payload_last = 1'b0;
    end
    if(fill) begin
      output_payload_last = ok;
    end
  end

  always @(*) begin
    output_payload_fragment = input_payload_fragment;
    if(fill) begin
      output_payload_fragment = 32'h0;
    end
  end

  assign when_FiberTxPadder_l25 = (! ok);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter <= 6'h0;
      input_payload_first <= 1'b1;
    end else begin
      if(input_fire) begin
        input_payload_first <= input_payload_last;
      end
      if(when_FiberTxPadder_l18) begin
        counter <= (counter + 6'h01);
      end
      if(when_FiberTxPadder_l21) begin
        counter <= 6'h0;
      end
    end
  end


endmodule

module FiberTxHeader (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output reg [31:0]   io_output_payload_fragment,
  input      [31:0]   io_slave_id,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_io_output_payload_fragment;
  wire       [0:0]    _zz_io_output_payload_fragment_1;
  wire       [63:0]   header;
  reg        [1:0]    state;
  wire                when_FiberTxHeader_l19;
  wire                io_output_fire;
  wire                io_input_fire;
  wire                when_FiberTxHeader_l31;

  assign _zz_io_output_payload_fragment_1 = state[0:0];
  always @(*) begin
    case(_zz_io_output_payload_fragment_1)
      1'b0 : begin
        _zz_io_output_payload_fragment = header[63 : 32];
      end
      default : begin
        _zz_io_output_payload_fragment = header[31 : 0];
      end
    endcase
  end

  assign header = {32'h00f1f2f3,io_slave_id};
  assign io_output_valid = io_input_valid;
  assign io_output_payload_last = io_input_payload_last;
  always @(*) begin
    io_input_ready = 1'b0;
    if(when_FiberTxHeader_l19) begin
      io_input_ready = io_output_ready;
    end
  end

  assign when_FiberTxHeader_l19 = (state == 2'b10);
  always @(*) begin
    if(when_FiberTxHeader_l19) begin
      io_output_payload_fragment = io_input_payload_fragment;
    end else begin
      io_output_payload_fragment = _zz_io_output_payload_fragment;
    end
  end

  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign when_FiberTxHeader_l31 = (io_input_fire && io_input_payload_last);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 2'b00;
    end else begin
      if(!when_FiberTxHeader_l19) begin
        if(io_output_fire) begin
          state <= (state + 2'b01);
        end
      end
      if(when_FiberTxHeader_l31) begin
        state <= 2'b00;
      end
    end
  end


endmodule

module FiberTxStream (
  output     [4:0]    reads_0_addr,
  input      [7:0]    reads_0_dataOut,
  output              reads_0_en,
  output     [4:0]    reads_1_addr,
  input      [7:0]    reads_1_dataOut,
  output              reads_1_en,
  output     [4:0]    reads_2_addr,
  input      [7:0]    reads_2_dataOut,
  output              reads_2_en,
  output     [4:0]    reads_3_addr,
  input      [7:0]    reads_3_dataOut,
  output              reads_3_en,
  output     [4:0]    reads_4_addr,
  input      [7:0]    reads_4_dataOut,
  output              reads_4_en,
  output     [4:0]    reads_5_addr,
  input      [7:0]    reads_5_dataOut,
  output              reads_5_en,
  output     [4:0]    reads_6_addr,
  input      [7:0]    reads_6_dataOut,
  output              reads_6_en,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               timer_tick,
  input               clk,
  input               reset
);
  localparam push_fsm_enumDef_BOOT = 2'd0;
  localparam push_fsm_enumDef_Wait_Start = 2'd1;
  localparam push_fsm_enumDef_Send_Data = 2'd2;
  localparam push_fsm_enumDef_End_1 = 2'd3;

  reg                 push_timer_io_clear;
  wire                push_timer_io_full;
  wire       [31:0]   push_timer_io_value;
  wire                push_fibertxbuffer_io_push_stream_ready;
  wire                push_fibertxbuffer_io_pop_stream_valid;
  wire       [31:0]   push_fibertxbuffer_io_pop_stream_payload;
  wire                push_fibertxbuffer_io_pop_last;
  reg        [7:0]    _zz_push_rd_data;
  wire       [2:0]    _zz_push_rd_data_1;
  reg        [7:0]    _zz_push_rd_data_2;
  reg        [7:0]    _zz_push_rd_data_3;
  wire       [2:0]    _zz_push_rd_data_4;
  reg        [7:0]    _zz_push_rd_data_5;
  reg        [7:0]    _zz_push_rd_data_6;
  wire       [2:0]    _zz_push_rd_data_7;
  reg        [7:0]    _zz_push_rd_data_8;
  reg        [7:0]    _zz_push_rd_data_9;
  wire       [2:0]    _zz_push_rd_data_10;
  reg        [7:0]    _zz_push_rd_data_11;
  reg        [7:0]    _zz_push_rd_data_12;
  wire       [2:0]    _zz_push_rd_data_13;
  reg        [7:0]    _zz_push_rd_data_14;
  reg        [7:0]    _zz_push_rd_data_15;
  wire       [2:0]    _zz_push_rd_data_16;
  reg        [7:0]    _zz_push_rd_data_17;
  reg        [7:0]    _zz_push_rd_data_18;
  wire       [2:0]    _zz_push_rd_data_19;
  reg        [7:0]    _zz_push_rd_data_20;
  wire                when_FiberTxStream_l24;
  reg        [7:0]    push_send_length;
  reg        [4:0]    push_rd_addr;
  reg        [2:0]    push_portcnt;
  reg        [7:0]    push_rd_data;
  reg                 push_valid;
  reg                 push_last;
  wire                push_fsm_wantExit;
  reg                 push_fsm_wantStart;
  wire                push_fsm_wantKill;
  wire                when_FiberTxStream_l82;
  wire                when_FiberTxStream_l82_1;
  wire                when_FiberTxStream_l82_2;
  wire                when_FiberTxStream_l82_3;
  wire                when_FiberTxStream_l82_4;
  wire                when_FiberTxStream_l82_5;
  wire                when_FiberTxStream_l82_6;
  reg                 push_valid_regNext;
  reg                 push_last_regNext;
  reg        [1:0]    push_fsm_stateReg;
  reg        [1:0]    push_fsm_stateNext;
  wire                when_FiberTxStream_l58;
  wire                when_FiberTxStream_l65;
  `ifndef SYNTHESIS
  reg [79:0] push_fsm_stateReg_string;
  reg [79:0] push_fsm_stateNext_string;
  `endif


  assign _zz_push_rd_data_1 = (push_portcnt - 3'b001);
  assign _zz_push_rd_data_4 = (push_portcnt - 3'b001);
  assign _zz_push_rd_data_7 = (push_portcnt - 3'b001);
  assign _zz_push_rd_data_10 = (push_portcnt - 3'b001);
  assign _zz_push_rd_data_13 = (push_portcnt - 3'b001);
  assign _zz_push_rd_data_16 = (push_portcnt - 3'b001);
  assign _zz_push_rd_data_19 = (push_portcnt - 3'b001);
  Timer push_timer (
    .io_tick     (timer_tick                 ), //i
    .io_clear    (push_timer_io_clear        ), //i
    .io_limit    (32'h00001770               ), //i
    .io_full     (push_timer_io_full         ), //o
    .io_value    (push_timer_io_value[31:0]  ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  FiberTxBuffer push_fibertxbuffer (
    .io_push_stream_valid               (push_valid_regNext                              ), //i
    .io_push_stream_ready               (push_fibertxbuffer_io_push_stream_ready         ), //o
    .io_push_stream_payload_last        (push_last_regNext                               ), //i
    .io_push_stream_payload_fragment    (push_rd_data[7:0]                               ), //i
    .io_pop_stream_valid                (push_fibertxbuffer_io_pop_stream_valid          ), //o
    .io_pop_stream_ready                (output_ready                                    ), //i
    .io_pop_stream_payload              (push_fibertxbuffer_io_pop_stream_payload[31:0]  ), //o
    .io_pop_last                        (push_fibertxbuffer_io_pop_last                  ), //o
    .clk                                (clk                                             ), //i
    .reset                              (reset                                           )  //i
  );
  always @(*) begin
    case(_zz_push_rd_data_1)
      3'b000 : begin
        _zz_push_rd_data = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(push_portcnt)
      3'b000 : begin
        _zz_push_rd_data_2 = reads_0_dataOut;
        _zz_push_rd_data_5 = reads_0_dataOut;
        _zz_push_rd_data_8 = reads_0_dataOut;
        _zz_push_rd_data_11 = reads_0_dataOut;
        _zz_push_rd_data_14 = reads_0_dataOut;
        _zz_push_rd_data_17 = reads_0_dataOut;
        _zz_push_rd_data_20 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_2 = reads_1_dataOut;
        _zz_push_rd_data_5 = reads_1_dataOut;
        _zz_push_rd_data_8 = reads_1_dataOut;
        _zz_push_rd_data_11 = reads_1_dataOut;
        _zz_push_rd_data_14 = reads_1_dataOut;
        _zz_push_rd_data_17 = reads_1_dataOut;
        _zz_push_rd_data_20 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_2 = reads_2_dataOut;
        _zz_push_rd_data_5 = reads_2_dataOut;
        _zz_push_rd_data_8 = reads_2_dataOut;
        _zz_push_rd_data_11 = reads_2_dataOut;
        _zz_push_rd_data_14 = reads_2_dataOut;
        _zz_push_rd_data_17 = reads_2_dataOut;
        _zz_push_rd_data_20 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_2 = reads_3_dataOut;
        _zz_push_rd_data_5 = reads_3_dataOut;
        _zz_push_rd_data_8 = reads_3_dataOut;
        _zz_push_rd_data_11 = reads_3_dataOut;
        _zz_push_rd_data_14 = reads_3_dataOut;
        _zz_push_rd_data_17 = reads_3_dataOut;
        _zz_push_rd_data_20 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_2 = reads_4_dataOut;
        _zz_push_rd_data_5 = reads_4_dataOut;
        _zz_push_rd_data_8 = reads_4_dataOut;
        _zz_push_rd_data_11 = reads_4_dataOut;
        _zz_push_rd_data_14 = reads_4_dataOut;
        _zz_push_rd_data_17 = reads_4_dataOut;
        _zz_push_rd_data_20 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_2 = reads_5_dataOut;
        _zz_push_rd_data_5 = reads_5_dataOut;
        _zz_push_rd_data_8 = reads_5_dataOut;
        _zz_push_rd_data_11 = reads_5_dataOut;
        _zz_push_rd_data_14 = reads_5_dataOut;
        _zz_push_rd_data_17 = reads_5_dataOut;
        _zz_push_rd_data_20 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_2 = reads_6_dataOut;
        _zz_push_rd_data_5 = reads_6_dataOut;
        _zz_push_rd_data_8 = reads_6_dataOut;
        _zz_push_rd_data_11 = reads_6_dataOut;
        _zz_push_rd_data_14 = reads_6_dataOut;
        _zz_push_rd_data_17 = reads_6_dataOut;
        _zz_push_rd_data_20 = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(_zz_push_rd_data_4)
      3'b000 : begin
        _zz_push_rd_data_3 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_3 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_3 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_3 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_3 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_3 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_3 = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(_zz_push_rd_data_7)
      3'b000 : begin
        _zz_push_rd_data_6 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_6 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_6 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_6 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_6 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_6 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_6 = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(_zz_push_rd_data_10)
      3'b000 : begin
        _zz_push_rd_data_9 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_9 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_9 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_9 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_9 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_9 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_9 = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(_zz_push_rd_data_13)
      3'b000 : begin
        _zz_push_rd_data_12 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_12 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_12 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_12 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_12 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_12 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_12 = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(_zz_push_rd_data_16)
      3'b000 : begin
        _zz_push_rd_data_15 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_15 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_15 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_15 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_15 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_15 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_15 = reads_6_dataOut;
      end
    endcase
  end

  always @(*) begin
    case(_zz_push_rd_data_19)
      3'b000 : begin
        _zz_push_rd_data_18 = reads_0_dataOut;
      end
      3'b001 : begin
        _zz_push_rd_data_18 = reads_1_dataOut;
      end
      3'b010 : begin
        _zz_push_rd_data_18 = reads_2_dataOut;
      end
      3'b011 : begin
        _zz_push_rd_data_18 = reads_3_dataOut;
      end
      3'b100 : begin
        _zz_push_rd_data_18 = reads_4_dataOut;
      end
      3'b101 : begin
        _zz_push_rd_data_18 = reads_5_dataOut;
      end
      default : begin
        _zz_push_rd_data_18 = reads_6_dataOut;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(push_fsm_stateReg)
      push_fsm_enumDef_BOOT : push_fsm_stateReg_string = "BOOT      ";
      push_fsm_enumDef_Wait_Start : push_fsm_stateReg_string = "Wait_Start";
      push_fsm_enumDef_Send_Data : push_fsm_stateReg_string = "Send_Data ";
      push_fsm_enumDef_End_1 : push_fsm_stateReg_string = "End_1     ";
      default : push_fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(push_fsm_stateNext)
      push_fsm_enumDef_BOOT : push_fsm_stateNext_string = "BOOT      ";
      push_fsm_enumDef_Wait_Start : push_fsm_stateNext_string = "Wait_Start";
      push_fsm_enumDef_Send_Data : push_fsm_stateNext_string = "Send_Data ";
      push_fsm_enumDef_End_1 : push_fsm_stateNext_string = "End_1     ";
      default : push_fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign when_FiberTxStream_l24 = (32'h00001770 <= push_timer_io_value);
  always @(*) begin
    if(when_FiberTxStream_l24) begin
      push_timer_io_clear = 1'b1;
    end else begin
      push_timer_io_clear = 1'b0;
    end
  end

  assign push_fsm_wantExit = 1'b0;
  always @(*) begin
    push_fsm_wantStart = 1'b0;
    case(push_fsm_stateReg)
      push_fsm_enumDef_Wait_Start : begin
      end
      push_fsm_enumDef_Send_Data : begin
      end
      push_fsm_enumDef_End_1 : begin
      end
      default : begin
        push_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign push_fsm_wantKill = 1'b0;
  assign reads_0_en = (push_portcnt == 3'b000);
  assign reads_0_addr = push_rd_addr;
  assign when_FiberTxStream_l82 = (push_send_length == 8'h0);
  assign reads_1_en = (push_portcnt == 3'b001);
  assign reads_1_addr = push_rd_addr;
  assign when_FiberTxStream_l82_1 = (push_send_length == 8'h0);
  assign reads_2_en = (push_portcnt == 3'b010);
  assign reads_2_addr = push_rd_addr;
  assign when_FiberTxStream_l82_2 = (push_send_length == 8'h0);
  assign reads_3_en = (push_portcnt == 3'b011);
  assign reads_3_addr = push_rd_addr;
  assign when_FiberTxStream_l82_3 = (push_send_length == 8'h0);
  assign reads_4_en = (push_portcnt == 3'b100);
  assign reads_4_addr = push_rd_addr;
  assign when_FiberTxStream_l82_4 = (push_send_length == 8'h0);
  assign reads_5_en = (push_portcnt == 3'b101);
  assign reads_5_addr = push_rd_addr;
  assign when_FiberTxStream_l82_5 = (push_send_length == 8'h0);
  assign reads_6_en = (push_portcnt == 3'b110);
  assign reads_6_addr = push_rd_addr;
  assign when_FiberTxStream_l82_6 = (push_send_length == 8'h0);
  assign output_valid = push_fibertxbuffer_io_pop_stream_valid;
  assign output_payload_fragment = push_fibertxbuffer_io_pop_stream_payload;
  assign output_payload_last = push_fibertxbuffer_io_pop_last;
  always @(*) begin
    push_fsm_stateNext = push_fsm_stateReg;
    case(push_fsm_stateReg)
      push_fsm_enumDef_Wait_Start : begin
        if(push_timer_io_full) begin
          push_fsm_stateNext = push_fsm_enumDef_Send_Data;
        end
      end
      push_fsm_enumDef_Send_Data : begin
        if(when_FiberTxStream_l58) begin
          push_fsm_stateNext = push_fsm_enumDef_End_1;
        end
      end
      push_fsm_enumDef_End_1 : begin
        if(when_FiberTxStream_l65) begin
          push_fsm_stateNext = push_fsm_enumDef_Wait_Start;
        end else begin
          push_fsm_stateNext = push_fsm_enumDef_Send_Data;
        end
      end
      default : begin
      end
    endcase
    if(push_fsm_wantStart) begin
      push_fsm_stateNext = push_fsm_enumDef_Wait_Start;
    end
    if(push_fsm_wantKill) begin
      push_fsm_stateNext = push_fsm_enumDef_BOOT;
    end
  end

  assign when_FiberTxStream_l58 = (push_send_length == 8'h1e);
  assign when_FiberTxStream_l65 = (push_portcnt == 3'b110);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      push_send_length <= 8'h0;
      push_rd_addr <= 5'h0;
      push_portcnt <= 3'b000;
      push_valid <= 1'b0;
      push_last <= 1'b0;
      push_valid_regNext <= 1'b0;
      push_last_regNext <= 1'b0;
      push_fsm_stateReg <= push_fsm_enumDef_BOOT;
    end else begin
      push_valid_regNext <= push_valid;
      push_last_regNext <= push_last;
      push_fsm_stateReg <= push_fsm_stateNext;
      case(push_fsm_stateReg)
        push_fsm_enumDef_Wait_Start : begin
          if(push_timer_io_full) begin
            push_valid <= 1'b0;
            push_last <= 1'b0;
          end else begin
            push_valid <= 1'b0;
            push_last <= 1'b0;
            push_rd_addr <= 5'h0;
            push_send_length <= 8'h0;
            push_portcnt <= 3'b000;
          end
        end
        push_fsm_enumDef_Send_Data : begin
          push_send_length <= (push_send_length + 8'h01);
          push_rd_addr <= (push_rd_addr + 5'h01);
          push_valid <= 1'b1;
        end
        push_fsm_enumDef_End_1 : begin
          if(when_FiberTxStream_l65) begin
            push_portcnt <= 3'b000;
            push_last <= 1'b1;
          end else begin
            push_portcnt <= (push_portcnt + 3'b001);
            push_send_length <= 8'h0;
            push_rd_addr <= 5'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reads_0_en) begin
      if(when_FiberTxStream_l82) begin
        push_rd_data <= _zz_push_rd_data;
      end else begin
        push_rd_data <= _zz_push_rd_data_2;
      end
    end
    if(reads_1_en) begin
      if(when_FiberTxStream_l82_1) begin
        push_rd_data <= _zz_push_rd_data_3;
      end else begin
        push_rd_data <= _zz_push_rd_data_5;
      end
    end
    if(reads_2_en) begin
      if(when_FiberTxStream_l82_2) begin
        push_rd_data <= _zz_push_rd_data_6;
      end else begin
        push_rd_data <= _zz_push_rd_data_8;
      end
    end
    if(reads_3_en) begin
      if(when_FiberTxStream_l82_3) begin
        push_rd_data <= _zz_push_rd_data_9;
      end else begin
        push_rd_data <= _zz_push_rd_data_11;
      end
    end
    if(reads_4_en) begin
      if(when_FiberTxStream_l82_4) begin
        push_rd_data <= _zz_push_rd_data_12;
      end else begin
        push_rd_data <= _zz_push_rd_data_14;
      end
    end
    if(reads_5_en) begin
      if(when_FiberTxStream_l82_5) begin
        push_rd_data <= _zz_push_rd_data_15;
      end else begin
        push_rd_data <= _zz_push_rd_data_17;
      end
    end
    if(reads_6_en) begin
      if(when_FiberTxStream_l82_6) begin
        push_rd_data <= _zz_push_rd_data_18;
      end else begin
        push_rd_data <= _zz_push_rd_data_20;
      end
    end
  end


endmodule

module ModusTop_6 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_6_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream_6 decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module ModusTop_5 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_5_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream_5 decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module ModusTop_4 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_4_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream_4 decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module ModusTop_3 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_3_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream_3 decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module ModusTop_2 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_2_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream_2 decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module ModusTop_1 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_1_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream_1 decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module ModusTop (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [7:0]    slaveid,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);

  reg                 uartctrl_stream_7_stream_out_ready;
  reg                 uartctrl_stream_7_rxfiforead;
  reg        [7:0]    _zz_mem_port1;
  wire                decoderxstream_7_input_ready;
  wire                decoderxstream_7_output_valid;
  wire       [7:0]    decoderxstream_7_output_payload;
  wire                uartctrl_stream_7_stream_in_ready;
  wire                uartctrl_stream_7_stream_out_valid;
  wire       [7:0]    uartctrl_stream_7_stream_out_payload;
  wire                uartctrl_stream_7_uart_txd;
  wire                uartctrl_stream_7_rxint;
  wire       [5:0]    uartctrl_stream_7_rxfifooccupancy;
  reg        [4:0]    mem_addr;
  wire                when_ModusTop_l40;
  wire                uartctrl_stream_7_stream_out_fire;
  wire                uartctrl_stream_7_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] mem [0:31];

  initial begin
    $readmemb("FiberTest.v_toplevel_fiberarea_modbus_0_mem.bin",mem);
  end
  always @(posedge clk) begin
    if(uartctrl_stream_7_stream_out_fire_1) begin
      mem[mem_addr] <= uartctrl_stream_7_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_mem_port1 <= mem[reads_addr];
    end
  end

  DecodeRxStream decoderxstream_7 (
    .input_valid       (input_valid                           ), //i
    .input_ready       (decoderxstream_7_input_ready          ), //o
    .input_payload     (input_payload[7:0]                    ), //i
    .output_valid      (decoderxstream_7_output_valid         ), //o
    .output_ready      (uartctrl_stream_7_stream_in_ready     ), //i
    .output_payload    (decoderxstream_7_output_payload[7:0]  ), //o
    .slaveid           (slaveid[7:0]                          ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  uartctrl_stream uartctrl_stream_7 (
    .stream_in_valid       (decoderxstream_7_output_valid              ), //i
    .stream_in_ready       (uartctrl_stream_7_stream_in_ready          ), //o
    .stream_in_payload     (decoderxstream_7_output_payload[7:0]       ), //i
    .stream_out_valid      (uartctrl_stream_7_stream_out_valid         ), //o
    .stream_out_ready      (uartctrl_stream_7_stream_out_ready         ), //i
    .stream_out_payload    (uartctrl_stream_7_stream_out_payload[7:0]  ), //o
    .uart_txd              (uartctrl_stream_7_uart_txd                 ), //o
    .uart_rxd              (uartctrl_stream_7_uart_txd                 ), //i
    .rxint                 (uartctrl_stream_7_rxint                    ), //o
    .rxfiforead            (uartctrl_stream_7_rxfiforead               ), //i
    .rxfifooccupancy       (uartctrl_stream_7_rxfifooccupancy[5:0]     ), //o
    .clk                   (clk                                        ), //i
    .reset                 (reset                                      )  //i
  );
  assign input_ready = decoderxstream_7_input_ready;
  assign when_ModusTop_l40 = (uartctrl_stream_7_rxint && (uartctrl_stream_7_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_rxfiforead = 1'b1;
    end else begin
      uartctrl_stream_7_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l40) begin
      uartctrl_stream_7_stream_out_ready = 1'b1;
    end else begin
      uartctrl_stream_7_stream_out_ready = 1'b0;
    end
  end

  assign uartctrl_stream_7_stream_out_fire = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign uartctrl_stream_7_stream_out_fire_1 = (uartctrl_stream_7_stream_out_valid && uartctrl_stream_7_stream_out_ready);
  assign reads_dataOut = _zz_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l40) begin
        if(uartctrl_stream_7_stream_out_fire) begin
          mem_addr <= (mem_addr + 5'h01);
        end
      end else begin
        mem_addr <= 5'h0;
      end
    end
  end


endmodule

module FiberRxStream (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [7:0]    input_payload_fragment,
  output              output_0_valid,
  input               output_0_ready,
  output     [7:0]    output_0_payload,
  output              output_1_valid,
  input               output_1_ready,
  output     [7:0]    output_1_payload,
  output              output_2_valid,
  input               output_2_ready,
  output     [7:0]    output_2_payload,
  output              output_3_valid,
  input               output_3_ready,
  output     [7:0]    output_3_payload,
  output              output_4_valid,
  input               output_4_ready,
  output     [7:0]    output_4_payload,
  output              output_5_valid,
  input               output_5_ready,
  output     [7:0]    output_5_payload,
  output              output_6_valid,
  input               output_6_ready,
  output     [7:0]    output_6_payload,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_IDLE = 2'd1;
  localparam fsm_enumDef_DATA_RECIEVE = 2'd2;

  reg        [8:0]    rec_cnt;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                input_fire;
  wire                input_fire_1;
  `ifndef SYNTHESIS
  reg [95:0] fsm_stateReg_string;
  reg [95:0] fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT        ";
      fsm_enumDef_IDLE : fsm_stateReg_string = "IDLE        ";
      fsm_enumDef_DATA_RECIEVE : fsm_stateReg_string = "DATA_RECIEVE";
      default : fsm_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT        ";
      fsm_enumDef_IDLE : fsm_stateNext_string = "IDLE        ";
      fsm_enumDef_DATA_RECIEVE : fsm_stateNext_string = "DATA_RECIEVE";
      default : fsm_stateNext_string = "????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_DATA_RECIEVE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign output_0_valid = ((input_valid && (9'h0 <= rec_cnt)) && (rec_cnt < 9'h020));
  assign output_0_payload = input_payload_fragment;
  assign output_1_valid = ((input_valid && (9'h020 <= rec_cnt)) && (rec_cnt < 9'h040));
  assign output_1_payload = input_payload_fragment;
  assign output_2_valid = ((input_valid && (9'h040 <= rec_cnt)) && (rec_cnt < 9'h060));
  assign output_2_payload = input_payload_fragment;
  assign output_3_valid = ((input_valid && (9'h060 <= rec_cnt)) && (rec_cnt < 9'h080));
  assign output_3_payload = input_payload_fragment;
  assign output_4_valid = ((input_valid && (9'h080 <= rec_cnt)) && (rec_cnt < 9'h0a0));
  assign output_4_payload = input_payload_fragment;
  assign output_5_valid = ((input_valid && (9'h0a0 <= rec_cnt)) && (rec_cnt < 9'h0c0));
  assign output_5_payload = input_payload_fragment;
  assign output_6_valid = ((input_valid && (9'h0c0 <= rec_cnt)) && (rec_cnt < 9'h0e0));
  assign output_6_payload = input_payload_fragment;
  assign input_ready = 1'b1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        if(input_fire) begin
          fsm_stateNext = fsm_enumDef_DATA_RECIEVE;
        end
      end
      fsm_enumDef_DATA_RECIEVE : begin
        if(input_fire_1) begin
          if(input_payload_last) begin
            fsm_stateNext = fsm_enumDef_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign input_fire = (input_valid && input_ready);
  assign input_fire_1 = (input_valid && input_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 9'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_IDLE : begin
          if(input_fire) begin
            rec_cnt <= (rec_cnt + 9'h001);
          end else begin
            rec_cnt <= 9'h0;
          end
        end
        fsm_enumDef_DATA_RECIEVE : begin
          if(input_fire_1) begin
            rec_cnt <= (rec_cnt + 9'h001);
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module FiberRxBuffer (
  input               push_stream_valid,
  output              push_stream_ready,
  input               push_stream_payload_last,
  input      [31:0]   push_stream_payload_fragment,
  output reg          pop_stream_valid,
  input               pop_stream_ready,
  output reg          pop_stream_payload_last,
  output     [7:0]    pop_stream_payload_fragment,
  input               clk,
  input               reset
);
  localparam pop_State_START = 2'd0;
  localparam pop_State_WAIT_1 = 2'd1;
  localparam pop_State_DATA = 2'd2;

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [31:0]   fifo_io_pop_payload;
  wire       [6:0]    fifo_io_pushOccupancy;
  wire       [6:0]    fifo_io_popOccupancy;
  reg        [7:0]    _zz_pop_stream_payload_fragment;
  reg        [1:0]    pop_state_2;
  reg        [1:0]    pop_spliter;
  reg                 pop_fifo_pop_ready;
  reg        [31:0]   pop_fif_payload_temp;
  wire                when_FiberRxBuffer_l50;
  wire                when_FiberRxBuffer_l60;
  wire                when_FiberRxBuffer_l66;
  `ifndef SYNTHESIS
  reg [47:0] pop_state_2_string;
  `endif


  StreamFifoCC fifo (
    .io_push_valid       (push_stream_valid                   ), //i
    .io_push_ready       (fifo_io_push_ready                  ), //o
    .io_push_payload     (push_stream_payload_fragment[31:0]  ), //i
    .io_pop_valid        (fifo_io_pop_valid                   ), //o
    .io_pop_ready        (pop_fifo_pop_ready                  ), //i
    .io_pop_payload      (fifo_io_pop_payload[31:0]           ), //o
    .io_pushOccupancy    (fifo_io_pushOccupancy[6:0]          ), //o
    .io_popOccupancy     (fifo_io_popOccupancy[6:0]           ), //o
    .clk                 (clk                                 ), //i
    .reset               (reset                               )  //i
  );
  always @(*) begin
    case(pop_spliter)
      2'b00 : begin
        _zz_pop_stream_payload_fragment = pop_fif_payload_temp[7 : 0];
      end
      2'b01 : begin
        _zz_pop_stream_payload_fragment = pop_fif_payload_temp[15 : 8];
      end
      2'b10 : begin
        _zz_pop_stream_payload_fragment = pop_fif_payload_temp[23 : 16];
      end
      default : begin
        _zz_pop_stream_payload_fragment = pop_fif_payload_temp[31 : 24];
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(pop_state_2)
      pop_State_START : pop_state_2_string = "START ";
      pop_State_WAIT_1 : pop_state_2_string = "WAIT_1";
      pop_State_DATA : pop_state_2_string = "DATA  ";
      default : pop_state_2_string = "??????";
    endcase
  end
  `endif

  assign push_stream_ready = fifo_io_push_ready;
  always @(*) begin
    pop_stream_valid = 1'b0;
    case(pop_state_2)
      pop_State_START : begin
      end
      pop_State_WAIT_1 : begin
      end
      default : begin
        pop_stream_valid = 1'b1;
      end
    endcase
  end

  always @(*) begin
    pop_stream_payload_last = 1'b0;
    case(pop_state_2)
      pop_State_START : begin
      end
      pop_State_WAIT_1 : begin
      end
      default : begin
        if(pop_stream_ready) begin
          if(when_FiberRxBuffer_l66) begin
            pop_stream_payload_last = 1'b1;
          end
        end
      end
    endcase
  end

  assign when_FiberRxBuffer_l50 = (! push_stream_payload_last);
  assign when_FiberRxBuffer_l60 = (pop_spliter == 2'b00);
  assign when_FiberRxBuffer_l66 = ((fifo_io_popOccupancy == 7'h0) && (pop_spliter == 2'b00));
  assign pop_stream_payload_fragment = _zz_pop_stream_payload_fragment;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pop_state_2 <= pop_State_START;
      pop_spliter <= 2'b11;
      pop_fifo_pop_ready <= 1'b0;
    end else begin
      case(pop_state_2)
        pop_State_START : begin
          if(push_stream_payload_last) begin
            pop_state_2 <= pop_State_WAIT_1;
          end
        end
        pop_State_WAIT_1 : begin
          if(when_FiberRxBuffer_l50) begin
            pop_fifo_pop_ready <= 1'b1;
            pop_state_2 <= pop_State_DATA;
          end
        end
        default : begin
          if(pop_stream_ready) begin
            pop_spliter <= (pop_spliter - 2'b01);
            if(when_FiberRxBuffer_l60) begin
              pop_fifo_pop_ready <= 1'b1;
            end else begin
              pop_fifo_pop_ready <= 1'b0;
            end
            if(when_FiberRxBuffer_l66) begin
              pop_state_2 <= pop_State_START;
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(pop_state_2)
      pop_State_START : begin
      end
      pop_State_WAIT_1 : begin
        if(when_FiberRxBuffer_l50) begin
          pop_fif_payload_temp <= fifo_io_pop_payload;
        end
      end
      default : begin
        if(pop_stream_ready) begin
          if(when_FiberRxBuffer_l60) begin
            pop_fif_payload_temp <= fifo_io_pop_payload;
          end
        end
      end
    endcase
  end


endmodule

module FiberRxPreamble (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  input      [31:0]   slave_id,
  output reg          output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               reset
);

  wire       [63:0]   startDelimiter;
  wire                input_fire;
  wire                history_0_valid;
  wire                history_0_ready;
  wire                history_0_payload_last;
  wire       [31:0]   history_0_payload_fragment;
  wire                history_1_valid;
  wire                history_1_ready;
  wire                history_1_payload_last;
  wire       [31:0]   history_1_payload_fragment;
  wire                _zz_history_0_valid;
  wire                _zz_history_0_ready;
  wire                _zz_history_0_payload_last;
  wire       [31:0]   _zz_history_0_payload_fragment;
  reg                 _zz_history_1_valid;
  reg                 _zz_history_1_ready;
  reg                 _zz_history_1_payload_last;
  reg        [31:0]   _zz_history_1_payload_fragment;
  wire       [63:0]   historyDataCat;
  wire                hit;
  reg                 inFrame;
  wire                when_FiberRxPreamble_l26;
  wire                when_FiberRxPreamble_l33;

  assign startDelimiter = {slave_id,32'h00f1f2f3};
  assign input_fire = (input_valid && input_ready);
  assign _zz_history_0_valid = input_valid;
  assign _zz_history_0_ready = input_ready;
  assign _zz_history_0_payload_last = input_payload_last;
  assign _zz_history_0_payload_fragment = input_payload_fragment;
  assign history_0_valid = _zz_history_0_valid;
  assign history_0_ready = _zz_history_0_ready;
  assign history_0_payload_last = _zz_history_0_payload_last;
  assign history_0_payload_fragment = _zz_history_0_payload_fragment;
  assign history_1_valid = _zz_history_1_valid;
  assign history_1_ready = _zz_history_1_ready;
  assign history_1_payload_last = _zz_history_1_payload_last;
  assign history_1_payload_fragment = _zz_history_1_payload_fragment;
  assign historyDataCat = {history_0_payload_fragment,history_1_payload_fragment};
  assign hit = ((history_0_valid && history_1_valid) && (historyDataCat == startDelimiter));
  always @(*) begin
    output_valid = 1'b0;
    if(!when_FiberRxPreamble_l26) begin
      if(input_valid) begin
        output_valid = 1'b1;
      end
    end
  end

  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = ((! inFrame) || output_ready);
  assign output_payload_last = input_payload_last;
  assign when_FiberRxPreamble_l26 = (! inFrame);
  assign when_FiberRxPreamble_l33 = (output_ready && input_payload_last);
  always @(posedge clk) begin
    if(input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_FiberRxPreamble_l26) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(input_valid) begin
          if(when_FiberRxPreamble_l33) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule

module FiberTxBuffer (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input               io_push_stream_payload_last,
  input      [7:0]    io_push_stream_payload_fragment,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  output              io_pop_last,
  input               clk,
  input               reset
);
  localparam pop_State_1_START = 1'd0;
  localparam pop_State_1_DATA = 1'd1;

  reg        [31:0]   _zz_ram_port1;
  wire                popToPush_io_input_ready;
  wire                popToPush_io_output_valid;
  wire       [6:0]    popToPush_io_output_payload;
  wire                pushToPop_io_input_ready;
  wire                pushToPop_io_output_valid;
  wire       [6:0]    pushToPop_io_output_payload;
  reg                 _zz_1;
  reg        [6:0]    push_currentPtr;
  reg        [6:0]    push_popPtr;
  (* async_reg = "true" *) reg        [6:0]    push_length;
  reg        [23:0]   push_buffer;
  reg        [1:0]    push_state;
  reg                 push_port_valid;
  reg        [5:0]    push_port_payload_address;
  reg        [31:0]   push_port_payload_data;
  reg                 push_drop;
  reg                 push_doWrite;
  wire                io_push_stream_fire;
  wire                when_FiberTxBuffer_l61;
  wire                when_FiberTxBuffer_l61_1;
  wire                when_FiberTxBuffer_l61_2;
  wire                when_FiberTxBuffer_l64;
  wire                push_full;
  wire                io_push_stream_fire_1;
  (* async_reg = "true" *) reg                 push_cleanup;
  reg                 push_commit;
  wire                when_FiberTxBuffer_l86;
  reg        [6:0]    pop_currentPtr;
  reg        [6:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [5:0]    pop_cmd_payload;
  reg        [0:0]    pop_state_2;
  reg        [6:0]    pop_send_number;
  wire                io_push_stream_fire_2;
  wire                when_FiberTxBuffer_l109;
  wire                pop_cmd_fire;
  wire                when_FiberTxBuffer_l119;
  wire                _zz_io_pop_stream_valid;
  wire                _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  `ifndef SYNTHESIS
  reg [39:0] pop_state_2_string;
  `endif

  reg [31:0] ram [0:63];

  always @(posedge clk) begin
    if(_zz_1) begin
      ram[push_port_payload_address] <= push_port_payload_data;
    end
  end

  always @(posedge clk) begin
    if(pop_cmd_ready) begin
      _zz_ram_port1 <= ram[pop_cmd_payload];
    end
  end

  StreamCCByToggle popToPush (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (popToPush_io_input_ready          ), //o
    .io_input_payload     (pop_currentPtr[6:0]               ), //i
    .io_output_valid      (popToPush_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (popToPush_io_output_payload[6:0]  ), //o
    .clk                  (clk                               ), //i
    .reset                (reset                             )  //i
  );
  StreamCCByToggle pushToPop (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (pushToPop_io_input_ready          ), //o
    .io_input_payload     (push_currentPtr[6:0]              ), //i
    .io_output_valid      (pushToPop_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (pushToPop_io_output_payload[6:0]  ), //o
    .clk                  (clk                               ), //i
    .reset                (reset                             )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(pop_state_2)
      pop_State_1_START : pop_state_2_string = "START";
      pop_State_1_DATA : pop_state_2_string = "DATA ";
      default : pop_state_2_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    if(push_port_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    push_port_valid = 1'b0;
    if(push_doWrite) begin
      if(!push_full) begin
        push_port_valid = 1'b1;
      end
    end
  end

  always @(*) begin
    push_port_payload_address = 6'bxxxxxx;
    if(push_doWrite) begin
      if(!push_full) begin
        push_port_payload_address = push_currentPtr[5:0];
      end
    end
  end

  always @(*) begin
    push_port_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(push_doWrite) begin
      if(!push_full) begin
        push_port_payload_data = {push_buffer,io_push_stream_payload_fragment};
      end
    end
  end

  always @(*) begin
    push_doWrite = 1'b0;
    if(io_push_stream_fire) begin
      if(when_FiberTxBuffer_l64) begin
        push_doWrite = 1'b1;
      end
    end
    if(when_FiberTxBuffer_l86) begin
      push_doWrite = 1'b1;
    end
  end

  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign when_FiberTxBuffer_l61 = (push_state == 2'b00);
  assign when_FiberTxBuffer_l61_1 = (push_state == 2'b01);
  assign when_FiberTxBuffer_l61_2 = (push_state == 2'b10);
  assign when_FiberTxBuffer_l64 = (push_state == 2'b11);
  assign push_full = ((push_currentPtr[6] != push_popPtr[6]) && (push_currentPtr[5 : 0] == push_popPtr[5 : 0]));
  assign io_push_stream_fire_1 = (io_push_stream_valid && io_push_stream_ready);
  assign io_push_stream_ready = ((! push_cleanup) && (! push_commit));
  assign when_FiberTxBuffer_l86 = (push_cleanup && (push_state != 2'b00));
  assign io_push_stream_fire_2 = (io_push_stream_valid && io_push_stream_ready);
  assign when_FiberTxBuffer_l109 = (io_push_stream_fire_2 && io_push_stream_payload_last);
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  assign when_FiberTxBuffer_l119 = (pop_send_number == 7'h38);
  assign pop_cmd_valid = ((! (pop_currentPtr == pop_pushPtr)) && (pop_state_2 == pop_State_1_DATA));
  assign pop_cmd_payload = pop_currentPtr[5:0];
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  assign io_pop_stream_valid = _zz_io_pop_stream_valid;
  assign _zz_pop_cmd_ready = io_pop_stream_ready;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign io_pop_last = ((pop_send_number == 7'h38) && (pop_state_2 == pop_State_1_DATA));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      push_currentPtr <= 7'h0;
      push_popPtr <= 7'h0;
      push_length <= 7'h0;
      push_state <= 2'b00;
      push_drop <= 1'b0;
      push_cleanup <= 1'b0;
      push_commit <= 1'b0;
      pop_currentPtr <= 7'h0;
      pop_pushPtr <= 7'h0;
      pop_state_2 <= pop_State_1_START;
      _zz_io_pop_stream_valid_1 <= 1'b0;
    end else begin
      if(popToPush_io_output_valid) begin
        push_popPtr <= popToPush_io_output_payload;
      end
      if(io_push_stream_fire) begin
        push_state <= (push_state + 2'b01);
        if(when_FiberTxBuffer_l64) begin
          push_length <= (push_length + 7'h01);
        end
      end
      if(push_doWrite) begin
        if(push_full) begin
          push_drop <= 1'b1;
        end else begin
          push_currentPtr <= (push_currentPtr + 7'h01);
        end
      end
      push_cleanup <= (io_push_stream_fire_1 && io_push_stream_payload_last);
      push_commit <= push_cleanup;
      if(when_FiberTxBuffer_l86) begin
        push_length <= 7'h0;
        push_currentPtr <= 7'h0;
        push_popPtr <= 7'h0;
        push_state <= 2'b00;
      end
      if(pushToPop_io_output_valid) begin
        pop_pushPtr <= pushToPop_io_output_payload;
      end
      case(pop_state_2)
        pop_State_1_START : begin
          if(when_FiberTxBuffer_l109) begin
            pop_state_2 <= pop_State_1_DATA;
          end
        end
        default : begin
          if(pop_cmd_fire) begin
            pop_currentPtr <= (pop_currentPtr + 7'h01);
          end
          if(when_FiberTxBuffer_l119) begin
            pop_state_2 <= pop_State_1_START;
          end
        end
      endcase
      if(_zz_pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= 1'b0;
      end
      if(pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= pop_cmd_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(io_push_stream_fire) begin
      if(when_FiberTxBuffer_l61) begin
        push_buffer[23 : 16] <= io_push_stream_payload_fragment;
      end
      if(when_FiberTxBuffer_l61_1) begin
        push_buffer[15 : 8] <= io_push_stream_payload_fragment;
      end
      if(when_FiberTxBuffer_l61_2) begin
        push_buffer[7 : 0] <= io_push_stream_payload_fragment;
      end
    end
    case(pop_state_2)
      pop_State_1_START : begin
        if(when_FiberTxBuffer_l109) begin
          pop_send_number <= 7'h0;
        end
      end
      default : begin
        if(pop_cmd_fire) begin
          pop_send_number <= (pop_send_number + 7'h01);
        end
      end
    endcase
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

//uartctrl_stream replaced by uartctrl_stream

module DecodeRxStream_6 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_7_BOOT = 4'd0;
  localparam fsm_enumDef_7_SlaveId = 4'd1;
  localparam fsm_enumDef_7_FunctionCode = 4'd2;
  localparam fsm_enumDef_7_GetAddress = 4'd3;
  localparam fsm_enumDef_7_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_7_GetDataLength = 4'd5;
  localparam fsm_enumDef_7_WriteMultiData = 4'd6;
  localparam fsm_enumDef_7_GetCRC = 4'd7;
  localparam fsm_enumDef_7_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_7_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_7_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_7_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_7_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_7_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_7_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_7_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_7_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_7_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_7_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_7_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_7_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_7_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_7_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_7_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_7_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_7_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_7_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_7_SlaveId : begin
      end
      fsm_enumDef_7_FunctionCode : begin
      end
      fsm_enumDef_7_GetAddress : begin
      end
      fsm_enumDef_7_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_7_GetDataLength : begin
      end
      fsm_enumDef_7_WriteMultiData : begin
      end
      fsm_enumDef_7_GetCRC : begin
      end
      fsm_enumDef_7_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_7_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_7_FunctionCode;
        end
      end
      fsm_enumDef_7_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_7_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_7_SlaveId;
          end
        end
      end
      fsm_enumDef_7_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_7_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_7_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_7_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_7_GetCRC;
          end
        end
      end
      fsm_enumDef_7_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_7_WriteMultiData;
          end
        end
      end
      fsm_enumDef_7_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_7_GetCRC;
          end
        end
      end
      fsm_enumDef_7_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_7_End_1;
          end
        end
      end
      fsm_enumDef_7_End_1 : begin
        fsm_stateNext = fsm_enumDef_7_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_7_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_7_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_7_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_7_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_7_FunctionCode : begin
        end
        fsm_enumDef_7_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_7_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_7_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_7_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_7_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_7_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_7_SlaveId : begin
      end
      fsm_enumDef_7_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_7_GetAddress : begin
      end
      fsm_enumDef_7_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_7_GetDataLength : begin
      end
      fsm_enumDef_7_WriteMultiData : begin
      end
      fsm_enumDef_7_GetCRC : begin
      end
      fsm_enumDef_7_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//uartctrl_stream replaced by uartctrl_stream

module DecodeRxStream_5 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_6_BOOT = 4'd0;
  localparam fsm_enumDef_6_SlaveId = 4'd1;
  localparam fsm_enumDef_6_FunctionCode = 4'd2;
  localparam fsm_enumDef_6_GetAddress = 4'd3;
  localparam fsm_enumDef_6_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_6_GetDataLength = 4'd5;
  localparam fsm_enumDef_6_WriteMultiData = 4'd6;
  localparam fsm_enumDef_6_GetCRC = 4'd7;
  localparam fsm_enumDef_6_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_6_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_6_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_6_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_6_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_6_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_6_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_6_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_6_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_6_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_6_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_6_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_6_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_6_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_6_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_6_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_6_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_6_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_6_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_6_SlaveId : begin
      end
      fsm_enumDef_6_FunctionCode : begin
      end
      fsm_enumDef_6_GetAddress : begin
      end
      fsm_enumDef_6_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_6_GetDataLength : begin
      end
      fsm_enumDef_6_WriteMultiData : begin
      end
      fsm_enumDef_6_GetCRC : begin
      end
      fsm_enumDef_6_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_6_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_6_FunctionCode;
        end
      end
      fsm_enumDef_6_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_6_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_6_SlaveId;
          end
        end
      end
      fsm_enumDef_6_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_6_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_6_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_6_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_6_GetCRC;
          end
        end
      end
      fsm_enumDef_6_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_6_WriteMultiData;
          end
        end
      end
      fsm_enumDef_6_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_6_GetCRC;
          end
        end
      end
      fsm_enumDef_6_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_6_End_1;
          end
        end
      end
      fsm_enumDef_6_End_1 : begin
        fsm_stateNext = fsm_enumDef_6_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_6_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_6_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_6_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_6_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_6_FunctionCode : begin
        end
        fsm_enumDef_6_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_6_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_6_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_6_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_6_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_6_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_6_SlaveId : begin
      end
      fsm_enumDef_6_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_6_GetAddress : begin
      end
      fsm_enumDef_6_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_6_GetDataLength : begin
      end
      fsm_enumDef_6_WriteMultiData : begin
      end
      fsm_enumDef_6_GetCRC : begin
      end
      fsm_enumDef_6_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//uartctrl_stream replaced by uartctrl_stream

module DecodeRxStream_4 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_5_BOOT = 4'd0;
  localparam fsm_enumDef_5_SlaveId = 4'd1;
  localparam fsm_enumDef_5_FunctionCode = 4'd2;
  localparam fsm_enumDef_5_GetAddress = 4'd3;
  localparam fsm_enumDef_5_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_5_GetDataLength = 4'd5;
  localparam fsm_enumDef_5_WriteMultiData = 4'd6;
  localparam fsm_enumDef_5_GetCRC = 4'd7;
  localparam fsm_enumDef_5_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_5_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_5_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_5_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_5_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_5_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_5_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_5_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_5_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_5_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_5_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_5_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_5_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_5_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_5_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_5_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_5_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_5_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_5_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_5_SlaveId : begin
      end
      fsm_enumDef_5_FunctionCode : begin
      end
      fsm_enumDef_5_GetAddress : begin
      end
      fsm_enumDef_5_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_5_GetDataLength : begin
      end
      fsm_enumDef_5_WriteMultiData : begin
      end
      fsm_enumDef_5_GetCRC : begin
      end
      fsm_enumDef_5_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_5_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_5_FunctionCode;
        end
      end
      fsm_enumDef_5_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_5_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_5_SlaveId;
          end
        end
      end
      fsm_enumDef_5_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_5_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_5_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_5_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_5_GetCRC;
          end
        end
      end
      fsm_enumDef_5_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_5_WriteMultiData;
          end
        end
      end
      fsm_enumDef_5_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_5_GetCRC;
          end
        end
      end
      fsm_enumDef_5_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_5_End_1;
          end
        end
      end
      fsm_enumDef_5_End_1 : begin
        fsm_stateNext = fsm_enumDef_5_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_5_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_5_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_5_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_5_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_5_FunctionCode : begin
        end
        fsm_enumDef_5_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_5_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_5_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_5_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_5_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_5_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_5_SlaveId : begin
      end
      fsm_enumDef_5_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_5_GetAddress : begin
      end
      fsm_enumDef_5_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_5_GetDataLength : begin
      end
      fsm_enumDef_5_WriteMultiData : begin
      end
      fsm_enumDef_5_GetCRC : begin
      end
      fsm_enumDef_5_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//uartctrl_stream replaced by uartctrl_stream

module DecodeRxStream_3 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_4_BOOT = 4'd0;
  localparam fsm_enumDef_4_SlaveId = 4'd1;
  localparam fsm_enumDef_4_FunctionCode = 4'd2;
  localparam fsm_enumDef_4_GetAddress = 4'd3;
  localparam fsm_enumDef_4_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_4_GetDataLength = 4'd5;
  localparam fsm_enumDef_4_WriteMultiData = 4'd6;
  localparam fsm_enumDef_4_GetCRC = 4'd7;
  localparam fsm_enumDef_4_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_4_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_4_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_4_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_4_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_4_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_4_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_4_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_4_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_4_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_4_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_4_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_4_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_4_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_4_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_4_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_4_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_4_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_4_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_4_SlaveId : begin
      end
      fsm_enumDef_4_FunctionCode : begin
      end
      fsm_enumDef_4_GetAddress : begin
      end
      fsm_enumDef_4_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_4_GetDataLength : begin
      end
      fsm_enumDef_4_WriteMultiData : begin
      end
      fsm_enumDef_4_GetCRC : begin
      end
      fsm_enumDef_4_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_4_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_4_FunctionCode;
        end
      end
      fsm_enumDef_4_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_4_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_4_SlaveId;
          end
        end
      end
      fsm_enumDef_4_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_4_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_4_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_4_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_4_GetCRC;
          end
        end
      end
      fsm_enumDef_4_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_4_WriteMultiData;
          end
        end
      end
      fsm_enumDef_4_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_4_GetCRC;
          end
        end
      end
      fsm_enumDef_4_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_4_End_1;
          end
        end
      end
      fsm_enumDef_4_End_1 : begin
        fsm_stateNext = fsm_enumDef_4_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_4_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_4_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_4_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_4_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_4_FunctionCode : begin
        end
        fsm_enumDef_4_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_4_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_4_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_4_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_4_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_4_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_4_SlaveId : begin
      end
      fsm_enumDef_4_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_4_GetAddress : begin
      end
      fsm_enumDef_4_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_4_GetDataLength : begin
      end
      fsm_enumDef_4_WriteMultiData : begin
      end
      fsm_enumDef_4_GetCRC : begin
      end
      fsm_enumDef_4_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//uartctrl_stream replaced by uartctrl_stream

module DecodeRxStream_2 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_3_BOOT = 4'd0;
  localparam fsm_enumDef_3_SlaveId = 4'd1;
  localparam fsm_enumDef_3_FunctionCode = 4'd2;
  localparam fsm_enumDef_3_GetAddress = 4'd3;
  localparam fsm_enumDef_3_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_3_GetDataLength = 4'd5;
  localparam fsm_enumDef_3_WriteMultiData = 4'd6;
  localparam fsm_enumDef_3_GetCRC = 4'd7;
  localparam fsm_enumDef_3_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_3_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_3_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_3_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_3_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_3_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_3_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_3_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_3_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_3_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_3_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_3_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_3_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_3_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_3_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_3_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_3_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_3_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_3_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_3_SlaveId : begin
      end
      fsm_enumDef_3_FunctionCode : begin
      end
      fsm_enumDef_3_GetAddress : begin
      end
      fsm_enumDef_3_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_3_GetDataLength : begin
      end
      fsm_enumDef_3_WriteMultiData : begin
      end
      fsm_enumDef_3_GetCRC : begin
      end
      fsm_enumDef_3_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_3_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_3_FunctionCode;
        end
      end
      fsm_enumDef_3_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_3_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_3_SlaveId;
          end
        end
      end
      fsm_enumDef_3_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_3_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_3_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_3_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_3_GetCRC;
          end
        end
      end
      fsm_enumDef_3_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_3_WriteMultiData;
          end
        end
      end
      fsm_enumDef_3_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_3_GetCRC;
          end
        end
      end
      fsm_enumDef_3_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_3_End_1;
          end
        end
      end
      fsm_enumDef_3_End_1 : begin
        fsm_stateNext = fsm_enumDef_3_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_3_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_3_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_3_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_3_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_3_FunctionCode : begin
        end
        fsm_enumDef_3_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_3_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_3_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_3_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_3_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_3_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_3_SlaveId : begin
      end
      fsm_enumDef_3_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_3_GetAddress : begin
      end
      fsm_enumDef_3_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_3_GetDataLength : begin
      end
      fsm_enumDef_3_WriteMultiData : begin
      end
      fsm_enumDef_3_GetCRC : begin
      end
      fsm_enumDef_3_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//uartctrl_stream replaced by uartctrl_stream

module DecodeRxStream_1 (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_2_BOOT = 4'd0;
  localparam fsm_enumDef_2_SlaveId = 4'd1;
  localparam fsm_enumDef_2_FunctionCode = 4'd2;
  localparam fsm_enumDef_2_GetAddress = 4'd3;
  localparam fsm_enumDef_2_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_2_GetDataLength = 4'd5;
  localparam fsm_enumDef_2_WriteMultiData = 4'd6;
  localparam fsm_enumDef_2_GetCRC = 4'd7;
  localparam fsm_enumDef_2_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_2_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_2_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_2_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_2_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_2_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_2_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_2_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_2_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_2_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_2_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_2_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_2_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_2_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_2_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_2_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_2_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_2_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_2_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_2_SlaveId : begin
      end
      fsm_enumDef_2_FunctionCode : begin
      end
      fsm_enumDef_2_GetAddress : begin
      end
      fsm_enumDef_2_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_2_GetDataLength : begin
      end
      fsm_enumDef_2_WriteMultiData : begin
      end
      fsm_enumDef_2_GetCRC : begin
      end
      fsm_enumDef_2_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_2_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_2_FunctionCode;
        end
      end
      fsm_enumDef_2_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_2_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_2_SlaveId;
          end
        end
      end
      fsm_enumDef_2_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_2_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_2_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_2_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_2_GetCRC;
          end
        end
      end
      fsm_enumDef_2_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_2_WriteMultiData;
          end
        end
      end
      fsm_enumDef_2_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_2_GetCRC;
          end
        end
      end
      fsm_enumDef_2_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_2_End_1;
          end
        end
      end
      fsm_enumDef_2_End_1 : begin
        fsm_stateNext = fsm_enumDef_2_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_2_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_2_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_2_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_2_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_2_FunctionCode : begin
        end
        fsm_enumDef_2_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_2_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_2_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_2_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_2_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_2_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_2_SlaveId : begin
      end
      fsm_enumDef_2_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_2_GetAddress : begin
      end
      fsm_enumDef_2_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_2_GetDataLength : begin
      end
      fsm_enumDef_2_WriteMultiData : begin
      end
      fsm_enumDef_2_GetCRC : begin
      end
      fsm_enumDef_2_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module uartctrl_stream (
  input               stream_in_valid,
  output              stream_in_ready,
  input      [7:0]    stream_in_payload,
  output              stream_out_valid,
  input               stream_out_ready,
  output     [7:0]    stream_out_payload,
  output              uart_txd,
  input               uart_rxd,
  output              rxint,
  input               rxfiforead,
  output     [5:0]    rxfifooccupancy,
  input               clk,
  input               reset
);
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;

  wire                uartCtrl_7_io_write_ready;
  wire                uartCtrl_7_io_read_valid;
  wire       [7:0]    uartCtrl_7_io_read_payload;
  wire                uartCtrl_7_io_uart_txd;
  wire                uartCtrl_7_io_readError;
  wire                uartCtrl_7_io_readBreak;
  wire                txfifo_io_push_ready;
  wire                txfifo_io_pop_valid;
  wire       [7:0]    txfifo_io_pop_payload;
  wire       [5:0]    txfifo_io_occupancy;
  wire       [5:0]    txfifo_io_availability;
  wire                rxfifo_io_push_ready;
  wire                rxfifo_io_pop_valid;
  wire       [7:0]    rxfifo_io_pop_payload;
  wire       [5:0]    rxfifo_io_occupancy;
  wire       [5:0]    rxfifo_io_availability;
  wire       [11:0]   _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 nodatareceive;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [11:0]   counter_valueNext;
  reg        [11:0]   counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 uartCtrl_7_io_read_valid_regNext;
  wire                when_UartStream_l37;
  wire                when_UartStream_l41;
  reg                 interrupt;
  reg                 nodatareceive_regNext;
  wire                when_UartStream_l49;
  wire                when_UartStream_l51;
  wire                counter_willIncrement_const;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {11'd0, _zz_counter_valueNext_1};
  UartCtrl uartCtrl_7 (
    .io_config_frame_dataLength    (3'b111                           ), //i
    .io_config_frame_stop          (UartStopType_ONE                 ), //i
    .io_config_frame_parity        (UartParityType_NONE              ), //i
    .io_config_clockDivider        (20'h00010                        ), //i
    .io_write_valid                (txfifo_io_pop_valid              ), //i
    .io_write_ready                (uartCtrl_7_io_write_ready        ), //o
    .io_write_payload              (txfifo_io_pop_payload[7:0]       ), //i
    .io_read_valid                 (uartCtrl_7_io_read_valid         ), //o
    .io_read_ready                 (rxfifo_io_push_ready             ), //i
    .io_read_payload               (uartCtrl_7_io_read_payload[7:0]  ), //o
    .io_uart_txd                   (uartCtrl_7_io_uart_txd           ), //o
    .io_uart_rxd                   (uart_rxd                         ), //i
    .io_readError                  (uartCtrl_7_io_readError          ), //o
    .io_writeBreak                 (1'b0                             ), //i
    .io_readBreak                  (uartCtrl_7_io_readBreak          ), //o
    .clk                           (clk                              ), //i
    .reset                         (reset                            )  //i
  );
  StreamFifo txfifo (
    .io_push_valid      (stream_in_valid              ), //i
    .io_push_ready      (txfifo_io_push_ready         ), //o
    .io_push_payload    (stream_in_payload[7:0]       ), //i
    .io_pop_valid       (txfifo_io_pop_valid          ), //o
    .io_pop_ready       (uartCtrl_7_io_write_ready    ), //i
    .io_pop_payload     (txfifo_io_pop_payload[7:0]   ), //o
    .io_flush           (1'b0                         ), //i
    .io_occupancy       (txfifo_io_occupancy[5:0]     ), //o
    .io_availability    (txfifo_io_availability[5:0]  ), //o
    .clk                (clk                          ), //i
    .reset              (reset                        )  //i
  );
  StreamFifo rxfifo (
    .io_push_valid      (uartCtrl_7_io_read_valid         ), //i
    .io_push_ready      (rxfifo_io_push_ready             ), //o
    .io_push_payload    (uartCtrl_7_io_read_payload[7:0]  ), //i
    .io_pop_valid       (rxfifo_io_pop_valid              ), //o
    .io_pop_ready       (rxfiforead                       ), //i
    .io_pop_payload     (rxfifo_io_pop_payload[7:0]       ), //o
    .io_flush           (1'b0                             ), //i
    .io_occupancy       (rxfifo_io_occupancy[5:0]         ), //o
    .io_availability    (rxfifo_io_availability[5:0]      ), //o
    .clk                (clk                              ), //i
    .reset              (reset                            )  //i
  );
  assign uart_txd = uartCtrl_7_io_uart_txd;
  assign stream_in_ready = txfifo_io_push_ready;
  assign counter_willIncrement_const = 1'b0;
  always @(*) begin
      counter_willIncrement = counter_willIncrement_const;
      counter_willIncrement = 1'b1;
  end

  always @(*) begin
    counter_willClear = 1'b0;
    if(when_UartStream_l37) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 12'hfa0);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 12'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 12'h0;
    end
  end

  assign when_UartStream_l37 = (uartCtrl_7_io_read_valid && (! uartCtrl_7_io_read_valid_regNext));
  assign when_UartStream_l41 = ((! nodatareceive) && counter_willOverflow);
  assign when_UartStream_l49 = ((nodatareceive && (! nodatareceive_regNext)) && (6'h0 < rxfifo_io_occupancy));
  assign when_UartStream_l51 = (rxfifo_io_occupancy == 6'h0);
  assign rxint = interrupt;
  assign stream_out_payload = rxfifo_io_pop_payload;
  assign stream_out_valid = (rxfifo_io_pop_valid && rxfiforead);
  assign rxfifooccupancy = rxfifo_io_occupancy;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      nodatareceive <= 1'b1;
      counter_value <= 12'h0;
      interrupt <= 1'b0;
    end else begin
      counter_value <= counter_valueNext;
      if(when_UartStream_l37) begin
        nodatareceive <= 1'b0;
      end
      if(when_UartStream_l41) begin
        nodatareceive <= 1'b1;
      end
      if(when_UartStream_l49) begin
        interrupt <= 1'b1;
      end else begin
        if(when_UartStream_l51) begin
          interrupt <= 1'b0;
        end else begin
          interrupt <= interrupt;
        end
      end
    end
  end

  always @(posedge clk) begin
    uartCtrl_7_io_read_valid_regNext <= uartCtrl_7_io_read_valid;
    nodatareceive_regNext <= nodatareceive;
  end


endmodule

module DecodeRxStream (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input      [7:0]    slaveid,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_1_BOOT = 4'd0;
  localparam fsm_enumDef_1_SlaveId = 4'd1;
  localparam fsm_enumDef_1_FunctionCode = 4'd2;
  localparam fsm_enumDef_1_GetAddress = 4'd3;
  localparam fsm_enumDef_1_ReadLength_WriteOneData = 4'd4;
  localparam fsm_enumDef_1_GetDataLength = 4'd5;
  localparam fsm_enumDef_1_WriteMultiData = 4'd6;
  localparam fsm_enumDef_1_GetCRC = 4'd7;
  localparam fsm_enumDef_1_End_1 = 4'd8;

  wire       [7:0]    _zz_when_FiberRxStream_l128;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 input_valid_regNext;
  reg        [7:0]    input_payload_regNext;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_FiberRxStream_l65;
  wire                when_FiberRxStream_l77;
  wire                when_FiberRxStream_l90;
  wire                when_FiberRxStream_l92;
  wire                when_FiberRxStream_l105;
  wire                when_FiberRxStream_l116;
  wire                when_FiberRxStream_l128;
  wire                when_FiberRxStream_l139;
  `ifndef SYNTHESIS
  reg [183:0] fsm_stateReg_string;
  reg [183:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l128 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT                   ";
      fsm_enumDef_1_SlaveId : fsm_stateReg_string = "SlaveId                ";
      fsm_enumDef_1_FunctionCode : fsm_stateReg_string = "FunctionCode           ";
      fsm_enumDef_1_GetAddress : fsm_stateReg_string = "GetAddress             ";
      fsm_enumDef_1_ReadLength_WriteOneData : fsm_stateReg_string = "ReadLength_WriteOneData";
      fsm_enumDef_1_GetDataLength : fsm_stateReg_string = "GetDataLength          ";
      fsm_enumDef_1_WriteMultiData : fsm_stateReg_string = "WriteMultiData         ";
      fsm_enumDef_1_GetCRC : fsm_stateReg_string = "GetCRC                 ";
      fsm_enumDef_1_End_1 : fsm_stateReg_string = "End_1                  ";
      default : fsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT                   ";
      fsm_enumDef_1_SlaveId : fsm_stateNext_string = "SlaveId                ";
      fsm_enumDef_1_FunctionCode : fsm_stateNext_string = "FunctionCode           ";
      fsm_enumDef_1_GetAddress : fsm_stateNext_string = "GetAddress             ";
      fsm_enumDef_1_ReadLength_WriteOneData : fsm_stateNext_string = "ReadLength_WriteOneData";
      fsm_enumDef_1_GetDataLength : fsm_stateNext_string = "GetDataLength          ";
      fsm_enumDef_1_WriteMultiData : fsm_stateNext_string = "WriteMultiData         ";
      fsm_enumDef_1_GetCRC : fsm_stateNext_string = "GetCRC                 ";
      fsm_enumDef_1_End_1 : fsm_stateNext_string = "End_1                  ";
      default : fsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_SlaveId : begin
      end
      fsm_enumDef_1_FunctionCode : begin
      end
      fsm_enumDef_1_GetAddress : begin
      end
      fsm_enumDef_1_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_1_GetDataLength : begin
      end
      fsm_enumDef_1_WriteMultiData : begin
      end
      fsm_enumDef_1_GetCRC : begin
      end
      fsm_enumDef_1_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid_regNext && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_SlaveId : begin
        if(when_FiberRxStream_l65) begin
          fsm_stateNext = fsm_enumDef_1_FunctionCode;
        end
      end
      fsm_enumDef_1_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            fsm_stateNext = fsm_enumDef_1_GetAddress;
          end else begin
            fsm_stateNext = fsm_enumDef_1_SlaveId;
          end
        end
      end
      fsm_enumDef_1_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l90) begin
            if(when_FiberRxStream_l92) begin
              fsm_stateNext = fsm_enumDef_1_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = fsm_enumDef_1_GetDataLength;
            end
          end
        end
      end
      fsm_enumDef_1_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l105) begin
            fsm_stateNext = fsm_enumDef_1_GetCRC;
          end
        end
      end
      fsm_enumDef_1_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l116) begin
            fsm_stateNext = fsm_enumDef_1_WriteMultiData;
          end
        end
      end
      fsm_enumDef_1_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l128) begin
            fsm_stateNext = fsm_enumDef_1_GetCRC;
          end
        end
      end
      fsm_enumDef_1_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l139) begin
            fsm_stateNext = fsm_enumDef_1_End_1;
          end
        end
      end
      fsm_enumDef_1_End_1 : begin
        fsm_stateNext = fsm_enumDef_1_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_FiberRxStream_l65 = (input_valid && (input_payload == slaveid));
  assign when_FiberRxStream_l77 = (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10));
  assign when_FiberRxStream_l90 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l92 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l105 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l116 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l128 = (rec_cnt == _zz_when_FiberRxStream_l128);
  assign when_FiberRxStream_l139 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_SlaveId : begin
          if(when_FiberRxStream_l65) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        fsm_enumDef_1_FunctionCode : begin
        end
        fsm_enumDef_1_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l90) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_1_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l105) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_1_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l116) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        fsm_enumDef_1_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l128) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_1_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l139) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        fsm_enumDef_1_End_1 : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_valid_regNext <= input_valid;
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      fsm_enumDef_1_SlaveId : begin
      end
      fsm_enumDef_1_FunctionCode : begin
        if(input_valid) begin
          if(when_FiberRxStream_l77) begin
            functioncode <= input_payload;
          end
        end
      end
      fsm_enumDef_1_GetAddress : begin
      end
      fsm_enumDef_1_ReadLength_WriteOneData : begin
      end
      fsm_enumDef_1_GetDataLength : begin
      end
      fsm_enumDef_1_WriteMultiData : begin
      end
      fsm_enumDef_1_GetCRC : begin
      end
      fsm_enumDef_1_End_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  output     [6:0]    io_pushOccupancy,
  output     [6:0]    io_popOccupancy,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_ram_port1;
  wire       [6:0]    popToPushGray_buffercc_io_dataOut;
  wire       [6:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [6:0]    _zz_pushCC_pushPtrGray;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_popCC_popPtrGray;
  wire       [5:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [5:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [6:0]    popToPushGray;
  wire       [6:0]    pushToPopGray;
  reg        [6:0]    pushCC_pushPtr;
  wire       [6:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [6:0]    pushCC_pushPtrGray;
  wire       [6:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  reg        [6:0]    popCC_popPtr;
  wire       [6:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [6:0]    popCC_popPtrGray;
  wire       [6:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [6:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  reg [31:0] ram [0:63];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[5:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[5:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_11 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[6:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[6:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  BufferCC_11 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray[6:0]                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut[6:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 7'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[6 : 5] == (~ pushCC_popPtrGray[6 : 5])) && (pushCC_pushPtrGray[4 : 0] == pushCC_popPtrGray[4 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = pushCC_popPtrGray[6];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 7'h01);
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
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = popCC_pushPtrGray[6];
  assign io_popOccupancy = ({_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

//StreamCCByToggle replaced by StreamCCByToggle

module StreamCCByToggle (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               clk,
  input               reset
);

  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC outHitSignal_buffercc (
    .io_dataIn     (outHitSignal                      ), //i
    .io_dataOut    (outHitSignal_buffercc_io_dataOut  ), //o
    .clk           (clk                               ), //i
    .reset         (reset                             )  //i
  );
  BufferCC pushArea_target_buffercc (
    .io_dataIn     (pushArea_target                      ), //i
    .io_dataOut    (pushArea_target_buffercc_io_dataOut  ), //o
    .clk           (clk                                  ), //i
    .reset         (reset                                )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushArea_target <= 1'b0;
      popArea_hit <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [7:0]    _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l946;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
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
  assign when_Stream_l946 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l946) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      [0:0]    io_config_frame_stop,
  input      [1:0]    io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               clk,
  input               reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;

  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tickReg             ), //i
    .io_write_valid               (io_write_thrown_valid            ), //i
    .io_write_ready               (tx_io_write_ready                ), //o
    .io_write_payload             (io_write_thrown_payload[7:0]     ), //i
    .io_cts                       (1'b0                             ), //i
    .io_txd                       (tx_io_txd                        ), //o
    .io_break                     (io_writeBreak                    ), //i
    .clk                          (clk                              ), //i
    .reset                        (reset                            )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tickReg             ), //i
    .io_read_valid                (rx_io_read_valid                 ), //o
    .io_read_ready                (io_read_ready                    ), //i
    .io_read_payload              (rx_io_read_payload[7:0]          ), //o
    .io_rxd                       (io_uart_rxd                      ), //i
    .io_rts                       (rx_io_rts                        ), //o
    .io_error                     (rx_io_error                      ), //o
    .io_break                     (rx_io_break                      ), //o
    .clk                          (clk                              ), //i
    .reset                        (reset                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      UartStopType_ONE : io_config_frame_stop_string = "ONE";
      UartStopType_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      UartParityType_NONE : io_config_frame_parity_string = "NONE";
      UartParityType_EVEN : io_config_frame_parity_string = "EVEN";
      UartParityType_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter <= 20'h0;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

//BufferCC_11 replaced by BufferCC_11

module BufferCC_11 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               clk,
  input               reset
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      [0:0]    io_configFrame_stop,
  input      [1:0]    io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               clk,
  input               reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlRxState_IDLE = 3'd0;
  localparam UartCtrlRxState_START = 3'd1;
  localparam UartCtrlRxState_DATA = 3'd2;
  localparam UartCtrlRxState_PARITY = 3'd3;
  localparam UartCtrlRxState_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  BufferCC io_rxd_buffercc (
    .io_dataIn     (io_rxd                      ), //i
    .io_dataOut    (io_rxd_buffercc_io_dataOut  ), //o
    .clk           (clk                         ), //i
    .reset         (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlRxState_START : stateMachine_state_string = "START ";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlRxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= UartCtrlRxState_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        UartCtrlRxState_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= UartCtrlRxState_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= UartCtrlRxState_PARITY;
              end
            end
          end
        end
        UartCtrlRxState_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= UartCtrlRxState_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= UartCtrlRxState_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= UartCtrlRxState_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
        end
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlRxState_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      [0:0]    io_configFrame_stop,
  input      [1:0]    io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               clk,
  input               reset
);
  localparam UartStopType_ONE = 1'd0;
  localparam UartStopType_TWO = 1'd1;
  localparam UartParityType_NONE = 2'd0;
  localparam UartParityType_EVEN = 2'd1;
  localparam UartParityType_ODD = 2'd2;
  localparam UartCtrlTxState_IDLE = 3'd0;
  localparam UartCtrlTxState_START = 3'd1;
  localparam UartCtrlTxState_DATA = 3'd2;
  localparam UartCtrlTxState_PARITY = 3'd3;
  localparam UartCtrlTxState_STOP = 3'd4;

  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == UartStopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      UartStopType_ONE : io_configFrame_stop_string = "ONE";
      UartStopType_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      UartParityType_NONE : io_configFrame_parity_string = "NONE";
      UartParityType_EVEN : io_configFrame_parity_string = "EVEN";
      UartParityType_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      UartCtrlTxState_IDLE : stateMachine_state_string = "IDLE  ";
      UartCtrlTxState_START : stateMachine_state_string = "START ";
      UartCtrlTxState_DATA : stateMachine_state_string = "DATA  ";
      UartCtrlTxState_PARITY : stateMachine_state_string = "PARITY";
      UartCtrlTxState_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        stateMachine_txd = 1'b0;
      end
      UartCtrlTxState_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      UartCtrlTxState_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == UartParityType_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign io_txd = _zz_io_txd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= UartCtrlTxState_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        UartCtrlTxState_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= UartCtrlTxState_START;
          end
        end
        UartCtrlTxState_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_DATA;
          end
        end
        UartCtrlTxState_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= UartCtrlTxState_STOP;
              end else begin
                stateMachine_state <= UartCtrlTxState_PARITY;
              end
            end
          end
        end
        UartCtrlTxState_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= UartCtrlTxState_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= (io_write_valid ? UartCtrlTxState_START : UartCtrlTxState_IDLE);
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge clk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      UartCtrlTxState_IDLE : begin
      end
      UartCtrlTxState_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == UartParityType_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      UartCtrlTxState_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      UartCtrlTxState_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
