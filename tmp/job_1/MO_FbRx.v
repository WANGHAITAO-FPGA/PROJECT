// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : MO_FbRx
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module MO_FbRx (
  input               hssl_input_valid,
  output              hssl_input_ready,
  input               hssl_input_payload_last,
  input      [31:0]   hssl_input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [63:0]   output_payload_fragment,
  input      [63:0]   header,
  input      [31:0]   slave_id,
  output              pulse_out,
  input               hssl_clk,
  input               hssl_reset,
  input               srio_clk,
  input               srio_reset
);

  wire                hssl_pusharea_hssl_rxpadder_output_ready;
  wire                srio_area_tx_header_io_input_payload_last;
  wire                hssl_pusharea_hssl_rxpreamble_input_ready;
  wire                hssl_pusharea_hssl_rxpreamble_output_valid;
  wire                hssl_pusharea_hssl_rxpreamble_output_payload_last;
  wire       [31:0]   hssl_pusharea_hssl_rxpreamble_output_payload_fragment;
  wire                hssl_pusharea_hssl_rxpadder_input_ready;
  wire                hssl_pusharea_hssl_rxpadder_output_valid;
  wire                hssl_pusharea_hssl_rxpadder_output_payload_last;
  wire       [31:0]   hssl_pusharea_hssl_rxpadder_output_payload_fragment;
  wire                hssl_pusharea_stream_fifo_io_push_ready;
  wire                hssl_pusharea_stream_fifo_io_pop_valid;
  wire       [63:0]   hssl_pusharea_stream_fifo_io_pop_payload;
  wire       [6:0]    hssl_pusharea_stream_fifo_io_pushOccupancy;
  wire       [6:0]    hssl_pusharea_stream_fifo_io_popOccupancy;
  wire                hssl_pusharea_stream_fifo_hssl_reset_syncronized_1;
  wire                hssl_pusharea_pulse_io_pulseOut;
  wire                srio_area_tx_header_io_input_ready;
  wire                srio_area_tx_header_io_output_valid;
  wire                srio_area_tx_header_io_output_payload_last;
  wire       [63:0]   srio_area_tx_header_io_output_payload_fragment;
  wire       [63:0]   _zz_hssl_pusharea_hssl_stream_payload_fragment_2;
  wire                hssl_pusharea_hssl_stream_valid;
  wire                hssl_pusharea_hssl_stream_ready;
  wire                hssl_pusharea_hssl_stream_payload_last;
  wire       [63:0]   hssl_pusharea_hssl_stream_payload_fragment;
  wire                hssl_pusharea_hssl_rxpadder_output_fire;
  reg                 _zz_hssl_pusharea_hssl_stream_valid;
  reg        [0:0]    _zz_hssl_pusharea_hssl_stream_valid_1;
  reg        [0:0]    _zz_hssl_pusharea_hssl_stream_valid_2;
  wire                _zz_hssl_pusharea_hssl_stream_valid_3;
  reg        [31:0]   _zz_hssl_pusharea_hssl_stream_payload_fragment;
  wire                hssl_pusharea_hssl_rxpadder_output_fire_1;
  wire       [63:0]   _zz_hssl_pusharea_hssl_stream_payload_fragment_1;
  reg                 srio_area_pulse_out;
  wire                srio_area_tx_header_io_input_fire;

  assign _zz_hssl_pusharea_hssl_stream_payload_fragment_2 = {_zz_hssl_pusharea_hssl_stream_payload_fragment_1[31 : 0],_zz_hssl_pusharea_hssl_stream_payload_fragment_1[63 : 32]};
  FiberRxPreamble hssl_pusharea_hssl_rxpreamble (
    .input_valid             (hssl_input_valid                                           ), //i
    .input_ready             (hssl_pusharea_hssl_rxpreamble_input_ready                  ), //o
    .input_payload_last      (hssl_input_payload_last                                    ), //i
    .input_payload_fragment  (hssl_input_payload_fragment[31:0]                          ), //i
    .slave_id                (slave_id[31:0]                                             ), //i
    .output_valid            (hssl_pusharea_hssl_rxpreamble_output_valid                 ), //o
    .output_ready            (hssl_pusharea_hssl_rxpadder_input_ready                    ), //i
    .output_payload_last     (hssl_pusharea_hssl_rxpreamble_output_payload_last          ), //o
    .output_payload_fragment (hssl_pusharea_hssl_rxpreamble_output_payload_fragment[31:0]), //o
    .hssl_clk                (hssl_clk                                                   ), //i
    .hssl_reset              (hssl_reset                                                 )  //i
  );
  FiberTxPadder hssl_pusharea_hssl_rxpadder (
    .input_valid             (hssl_pusharea_hssl_rxpreamble_output_valid                 ), //i
    .input_ready             (hssl_pusharea_hssl_rxpadder_input_ready                    ), //o
    .input_payload_last      (hssl_pusharea_hssl_rxpreamble_output_payload_last          ), //i
    .input_payload_fragment  (hssl_pusharea_hssl_rxpreamble_output_payload_fragment[31:0]), //i
    .output_valid            (hssl_pusharea_hssl_rxpadder_output_valid                   ), //o
    .output_ready            (hssl_pusharea_hssl_rxpadder_output_ready                   ), //i
    .output_payload_last     (hssl_pusharea_hssl_rxpadder_output_payload_last            ), //o
    .output_payload_fragment (hssl_pusharea_hssl_rxpadder_output_payload_fragment[31:0]  ), //o
    .hssl_clk                (hssl_clk                                                   ), //i
    .hssl_reset              (hssl_reset                                                 )  //i
  );
  StreamFifoCC hssl_pusharea_stream_fifo (
    .io_push_valid            (hssl_pusharea_hssl_stream_valid                   ), //i
    .io_push_ready            (hssl_pusharea_stream_fifo_io_push_ready           ), //o
    .io_push_payload          (hssl_pusharea_hssl_stream_payload_fragment[63:0]  ), //i
    .io_pop_valid             (hssl_pusharea_stream_fifo_io_pop_valid            ), //o
    .io_pop_ready             (srio_area_tx_header_io_input_ready                ), //i
    .io_pop_payload           (hssl_pusharea_stream_fifo_io_pop_payload[63:0]    ), //o
    .io_pushOccupancy         (hssl_pusharea_stream_fifo_io_pushOccupancy[6:0]   ), //o
    .io_popOccupancy          (hssl_pusharea_stream_fifo_io_popOccupancy[6:0]    ), //o
    .hssl_clk                 (hssl_clk                                          ), //i
    .hssl_reset               (hssl_reset                                        ), //i
    .srio_clk                 (srio_clk                                          ), //i
    .hssl_reset_syncronized_1 (hssl_pusharea_stream_fifo_hssl_reset_syncronized_1)  //o
  );
  PulseCCByToggle hssl_pusharea_pulse (
    .io_pulseIn               (hssl_pusharea_hssl_stream_payload_last            ), //i
    .io_pulseOut              (hssl_pusharea_pulse_io_pulseOut                   ), //o
    .hssl_clk                 (hssl_clk                                          ), //i
    .hssl_reset               (hssl_reset                                        ), //i
    .srio_clk                 (srio_clk                                          ), //i
    .hssl_reset_syncronized_1 (hssl_pusharea_stream_fifo_hssl_reset_syncronized_1)  //i
  );
  TxHeader srio_area_tx_header (
    .io_input_valid             (hssl_pusharea_stream_fifo_io_pop_valid              ), //i
    .io_input_ready             (srio_area_tx_header_io_input_ready                  ), //o
    .io_input_payload_last      (srio_area_tx_header_io_input_payload_last           ), //i
    .io_input_payload_fragment  (hssl_pusharea_stream_fifo_io_pop_payload[63:0]      ), //i
    .io_output_valid            (srio_area_tx_header_io_output_valid                 ), //o
    .io_output_ready            (output_ready                                        ), //i
    .io_output_payload_last     (srio_area_tx_header_io_output_payload_last          ), //o
    .io_output_payload_fragment (srio_area_tx_header_io_output_payload_fragment[63:0]), //o
    .io_header                  (header[63:0]                                        ), //i
    .srio_clk                   (srio_clk                                            ), //i
    .srio_reset                 (srio_reset                                          )  //i
  );
  assign hssl_input_ready = hssl_pusharea_hssl_rxpreamble_input_ready;
  assign hssl_pusharea_hssl_rxpadder_output_fire = (hssl_pusharea_hssl_rxpadder_output_valid && hssl_pusharea_hssl_rxpadder_output_ready);
  always @(*) begin
    _zz_hssl_pusharea_hssl_stream_valid = 1'b0;
    if(hssl_pusharea_hssl_rxpadder_output_fire) begin
      _zz_hssl_pusharea_hssl_stream_valid = 1'b1;
    end
  end

  assign _zz_hssl_pusharea_hssl_stream_valid_3 = (_zz_hssl_pusharea_hssl_stream_valid_2 == 1'b1);
  always @(*) begin
    _zz_hssl_pusharea_hssl_stream_valid_1 = (_zz_hssl_pusharea_hssl_stream_valid_2 + _zz_hssl_pusharea_hssl_stream_valid);
    if(1'b0) begin
      _zz_hssl_pusharea_hssl_stream_valid_1 = 1'b0;
    end
  end

  assign hssl_pusharea_hssl_rxpadder_output_fire_1 = (hssl_pusharea_hssl_rxpadder_output_valid && hssl_pusharea_hssl_rxpadder_output_ready);
  assign hssl_pusharea_hssl_stream_valid = (hssl_pusharea_hssl_rxpadder_output_valid && _zz_hssl_pusharea_hssl_stream_valid_3);
  assign _zz_hssl_pusharea_hssl_stream_payload_fragment_1 = {hssl_pusharea_hssl_rxpadder_output_payload_fragment,_zz_hssl_pusharea_hssl_stream_payload_fragment};
  assign hssl_pusharea_hssl_stream_payload_fragment = _zz_hssl_pusharea_hssl_stream_payload_fragment_2;
  assign hssl_pusharea_hssl_stream_payload_last = hssl_pusharea_hssl_rxpadder_output_payload_last;
  assign hssl_pusharea_hssl_rxpadder_output_ready = (! ((! hssl_pusharea_hssl_stream_ready) && _zz_hssl_pusharea_hssl_stream_valid_3));
  assign hssl_pusharea_hssl_stream_ready = hssl_pusharea_stream_fifo_io_push_ready;
  assign pulse_out = srio_area_pulse_out;
  assign srio_area_tx_header_io_input_fire = (hssl_pusharea_stream_fifo_io_pop_valid && srio_area_tx_header_io_input_ready);
  assign srio_area_tx_header_io_input_payload_last = ((hssl_pusharea_stream_fifo_io_popOccupancy == 7'h01) && srio_area_tx_header_io_input_fire);
  assign output_valid = srio_area_tx_header_io_output_valid;
  assign output_payload_last = srio_area_tx_header_io_output_payload_last;
  assign output_payload_fragment = srio_area_tx_header_io_output_payload_fragment;
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      _zz_hssl_pusharea_hssl_stream_valid_2 <= 1'b0;
    end else begin
      _zz_hssl_pusharea_hssl_stream_valid_2 <= _zz_hssl_pusharea_hssl_stream_valid_1;
    end
  end

  always @(posedge hssl_clk) begin
    if(hssl_pusharea_hssl_rxpadder_output_fire_1) begin
      _zz_hssl_pusharea_hssl_stream_payload_fragment <= hssl_pusharea_hssl_rxpadder_output_payload_fragment;
    end
  end

  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      srio_area_pulse_out <= 1'b0;
    end else begin
      srio_area_pulse_out <= hssl_pusharea_pulse_io_pulseOut;
    end
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
  input               srio_clk,
  input               srio_reset
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
  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
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

module PulseCCByToggle (
  input               io_pulseIn,
  output              io_pulseOut,
  input               hssl_clk,
  input               hssl_reset,
  input               srio_clk,
  input               hssl_reset_syncronized_1
);

  wire                inArea_target_buffercc_io_dataOut;
  reg                 inArea_target;
  wire                outArea_target;
  reg                 outArea_target_regNext;

  BufferCC_3 inArea_target_buffercc (
    .io_dataIn              (inArea_target                    ), //i
    .io_dataOut             (inArea_target_buffercc_io_dataOut), //o
    .srio_clk               (srio_clk                         ), //i
    .hssl_reset_syncronized (hssl_reset_syncronized_1         )  //i
  );
  assign outArea_target = inArea_target_buffercc_io_dataOut;
  assign io_pulseOut = (outArea_target ^ outArea_target_regNext);
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      inArea_target <= 1'b0;
    end else begin
      if(io_pulseIn) begin
        inArea_target <= (! inArea_target);
      end
    end
  end

  always @(posedge srio_clk or posedge hssl_reset_syncronized_1) begin
    if(hssl_reset_syncronized_1) begin
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
  output     [6:0]    io_pushOccupancy,
  output     [6:0]    io_popOccupancy,
  input               hssl_clk,
  input               hssl_reset,
  input               srio_clk,
  output              hssl_reset_syncronized_1
);

  reg        [63:0]   _zz_ram_port1;
  wire       [6:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_4_io_dataOut;
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
  wire                hssl_reset_syncronized;
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
  reg [63:0] ram [0:63];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[5:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[5:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge hssl_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge srio_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[6:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[6:0]), //o
    .hssl_clk   (hssl_clk                              ), //i
    .hssl_reset (hssl_reset                            )  //i
  );
  BufferCC_1 bufferCC_4 (
    .io_dataIn  (1'b0                 ), //i
    .io_dataOut (bufferCC_4_io_dataOut), //o
    .srio_clk   (srio_clk             ), //i
    .hssl_reset (hssl_reset           )  //i
  );
  BufferCC_2 pushToPopGray_buffercc (
    .io_dataIn              (pushToPopGray[6:0]                    ), //i
    .io_dataOut             (pushToPopGray_buffercc_io_dataOut[6:0]), //o
    .srio_clk               (srio_clk                              ), //i
    .hssl_reset_syncronized (hssl_reset_syncronized                )  //i
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
  assign hssl_reset_syncronized = bufferCC_4_io_dataOut;
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
  assign hssl_reset_syncronized_1 = hssl_reset_syncronized;
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge srio_clk or posedge hssl_reset_syncronized) begin
    if(hssl_reset_syncronized) begin
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
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

module FiberTxPadder (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output reg          output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               hssl_clk,
  input               hssl_reset
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
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
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
  input               hssl_clk,
  input               hssl_reset
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
  always @(posedge hssl_clk) begin
    if(input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
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

module BufferCC_3 (
  input               io_dataIn,
  output              io_dataOut,
  input               srio_clk,
  input               hssl_reset_syncronized
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk or posedge hssl_reset_syncronized) begin
    if(hssl_reset_syncronized) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_2 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               srio_clk,
  input               hssl_reset_syncronized
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk or posedge hssl_reset_syncronized) begin
    if(hssl_reset_syncronized) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               srio_clk,
  input               hssl_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               hssl_clk,
  input               hssl_reset
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
