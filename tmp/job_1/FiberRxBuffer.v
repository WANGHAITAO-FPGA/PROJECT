// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : FiberRxBuffer

`timescale 1ns/1ps 

module FiberRxBuffer (
  input               push_stream_valid,
  output              push_stream_ready,
  input               push_stream_payload_last,
  input      [31:0]   push_stream_payload_fragment,
  output reg          pop_stream_valid,
  input               pop_stream_ready,
  output reg          pop_stream_payload_last,
  output     [7:0]    pop_stream_payload_fragment,
  input               popclk_clk,
  input               popclk_reset,
  input               pushclk_clk,
  input               pushclk_reset
);
  localparam pop_State_START = 2'd0;
  localparam pop_State_WAIT_1 = 2'd1;
  localparam pop_State_DATA = 2'd2;

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [31:0]   fifo_io_pop_payload;
  wire       [4:0]    fifo_io_pushOccupancy;
  wire       [4:0]    fifo_io_popOccupancy;
  reg        [7:0]    _zz_pop_stream_payload_fragment;
  reg        [1:0]    pop_state_1;
  reg        [1:0]    pop_spliter;
  reg                 pop_fifo_pop_ready;
  reg        [31:0]   pop_fif_payload_temp;
  wire                when_FiberRxBuffer_l50;
  wire                when_FiberRxBuffer_l60;
  wire                when_FiberRxBuffer_l66;
  `ifndef SYNTHESIS
  reg [47:0] pop_state_1_string;
  `endif


  StreamFifoCC fifo (
    .io_push_valid       (push_stream_valid                   ), //i
    .io_push_ready       (fifo_io_push_ready                  ), //o
    .io_push_payload     (push_stream_payload_fragment[31:0]  ), //i
    .io_pop_valid        (fifo_io_pop_valid                   ), //o
    .io_pop_ready        (pop_fifo_pop_ready                  ), //i
    .io_pop_payload      (fifo_io_pop_payload[31:0]           ), //o
    .io_pushOccupancy    (fifo_io_pushOccupancy[4:0]          ), //o
    .io_popOccupancy     (fifo_io_popOccupancy[4:0]           ), //o
    .pushclk_clk         (pushclk_clk                         ), //i
    .pushclk_reset       (pushclk_reset                       ), //i
    .popclk_clk          (popclk_clk                          ), //i
    .popclk_reset        (popclk_reset                        )  //i
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
    case(pop_state_1)
      pop_State_START : pop_state_1_string = "START ";
      pop_State_WAIT_1 : pop_state_1_string = "WAIT_1";
      pop_State_DATA : pop_state_1_string = "DATA  ";
      default : pop_state_1_string = "??????";
    endcase
  end
  `endif

  assign push_stream_ready = fifo_io_push_ready;
  always @(*) begin
    pop_stream_valid = 1'b0;
    case(pop_state_1)
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
    case(pop_state_1)
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
  assign when_FiberRxBuffer_l66 = ((fifo_io_popOccupancy == 5'h0) && (pop_spliter == 2'b00));
  assign pop_stream_payload_fragment = _zz_pop_stream_payload_fragment;
  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      pop_state_1 <= pop_State_START;
      pop_spliter <= 2'b11;
      pop_fifo_pop_ready <= 1'b0;
    end else begin
      case(pop_state_1)
        pop_State_START : begin
          if(push_stream_payload_last) begin
            pop_state_1 <= pop_State_WAIT_1;
          end
        end
        pop_State_WAIT_1 : begin
          if(when_FiberRxBuffer_l50) begin
            pop_fifo_pop_ready <= 1'b1;
            pop_state_1 <= pop_State_DATA;
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
              pop_state_1 <= pop_State_START;
            end
          end
        end
      endcase
    end
  end

  always @(posedge popclk_clk) begin
    case(pop_state_1)
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

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               pushclk_clk,
  input               pushclk_reset,
  input               popclk_clk,
  input               popclk_reset
);

  reg        [31:0]   _zz_ram_port1;
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
  reg [31:0] ram [0:15];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[3:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[3:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge pushclk_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge popclk_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn        (popToPushGray[4:0]                      ), //i
    .io_dataOut       (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .pushclk_clk      (pushclk_clk                             ), //i
    .pushclk_reset    (pushclk_reset                           )  //i
  );
  BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn       (pushToPopGray[4:0]                      ), //i
    .io_dataOut      (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .popclk_clk      (popclk_clk                              ), //i
    .popclk_reset    (popclk_reset                            )  //i
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
  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
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

  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
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

module BufferCC_1 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               popclk_clk,
  input               popclk_reset
);

  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               pushclk_clk,
  input               pushclk_reset
);

  (* async_reg = "true" *) reg        [4:0]    buffers_0;
  (* async_reg = "true" *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
