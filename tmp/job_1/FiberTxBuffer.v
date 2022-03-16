// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : FiberTxBuffer

`timescale 1ns/1ps 

module FiberTxBuffer (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input               io_push_stream_payload_last,
  input      [7:0]    io_push_stream_payload_fragment,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  output              io_pop_last,
  input               pushclk_clk,
  input               pushclk_reset,
  input               popclk_clk,
  input               popclk_reset
);

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
  reg                 push_cleanup;
  reg                 push_commit;
  wire                when_FiberTxBuffer_l86;
  reg        [6:0]    pop_currentPtr;
  reg        [6:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [5:0]    pop_cmd_payload;
  wire                _zz_io_pop_stream_valid;
  wire                _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  reg                 pop_cleanup;
  wire                pop_cmd_fire;
  reg [31:0] ram [0:63];

  always @(posedge pushclk_clk) begin
    if(_zz_1) begin
      ram[push_port_payload_address] <= push_port_payload_data;
    end
  end

  always @(posedge popclk_clk) begin
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
    .popclk_clk           (popclk_clk                        ), //i
    .popclk_reset         (popclk_reset                      ), //i
    .pushclk_clk          (pushclk_clk                       ), //i
    .pushclk_reset        (pushclk_reset                     )  //i
  );
  StreamCCByToggle_1 pushToPop (
    .io_input_valid       (1'b1                              ), //i
    .io_input_ready       (pushToPop_io_input_ready          ), //o
    .io_input_payload     (push_currentPtr[6:0]              ), //i
    .io_output_valid      (pushToPop_io_output_valid         ), //o
    .io_output_ready      (1'b1                              ), //i
    .io_output_payload    (pushToPop_io_output_payload[6:0]  ), //o
    .pushclk_clk          (pushclk_clk                       ), //i
    .pushclk_reset        (pushclk_reset                     ), //i
    .popclk_clk           (popclk_clk                        ), //i
    .popclk_reset         (popclk_reset                      )  //i
  );
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
  assign pop_cmd_valid = (! (pop_currentPtr == pop_pushPtr));
  assign pop_cmd_payload = pop_currentPtr[5:0];
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  assign io_pop_stream_valid = _zz_io_pop_stream_valid;
  assign _zz_pop_cmd_ready = io_pop_stream_ready;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign io_pop_last = (((pop_currentPtr == push_length) && io_pop_stream_valid) && (! io_push_stream_valid));
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
      push_currentPtr <= 7'h0;
      push_popPtr <= 7'h0;
      push_length <= 7'h0;
      push_state <= 2'b00;
      push_drop <= 1'b0;
      push_cleanup <= 1'b0;
      push_commit <= 1'b0;
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
      end
    end
  end

  always @(posedge pushclk_clk) begin
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
  end

  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      pop_currentPtr <= 7'h0;
      pop_pushPtr <= 7'h0;
      _zz_io_pop_stream_valid_1 <= 1'b0;
      pop_cleanup <= 1'b0;
    end else begin
      if(pushToPop_io_output_valid) begin
        pop_pushPtr <= pushToPop_io_output_payload;
      end
      if(_zz_pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= 1'b0;
      end
      if(pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= pop_cmd_valid;
      end
      pop_cleanup <= io_pop_last;
      if(pop_cmd_fire) begin
        pop_currentPtr <= (pop_currentPtr + 7'h01);
      end
    end
  end


endmodule

module StreamCCByToggle_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               pushclk_clk,
  input               pushclk_reset,
  input               popclk_clk,
  input               popclk_reset
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

  BufferCC_1 outHitSignal_buffercc (
    .io_dataIn        (outHitSignal                      ), //i
    .io_dataOut       (outHitSignal_buffercc_io_dataOut  ), //o
    .pushclk_clk      (pushclk_clk                       ), //i
    .pushclk_reset    (pushclk_reset                     )  //i
  );
  BufferCC pushArea_target_buffercc (
    .io_dataIn       (pushArea_target                      ), //i
    .io_dataOut      (pushArea_target_buffercc_io_dataOut  ), //o
    .popclk_clk      (popclk_clk                           ), //i
    .popclk_reset    (popclk_reset                         )  //i
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
  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
    end
  end

  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      popArea_hit <= 1'b0;
    end else begin
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

module StreamCCByToggle (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               popclk_clk,
  input               popclk_reset,
  input               pushclk_clk,
  input               pushclk_reset
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
    .io_dataIn       (outHitSignal                      ), //i
    .io_dataOut      (outHitSignal_buffercc_io_dataOut  ), //o
    .popclk_clk      (popclk_clk                        ), //i
    .popclk_reset    (popclk_reset                      )  //i
  );
  BufferCC_1 pushArea_target_buffercc (
    .io_dataIn        (pushArea_target                      ), //i
    .io_dataOut       (pushArea_target_buffercc_io_dataOut  ), //o
    .pushclk_clk      (pushclk_clk                          ), //i
    .pushclk_reset    (pushclk_reset                        )  //i
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
  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
    end
  end

  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
      popArea_hit <= 1'b0;
    end else begin
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC_1 replaced by BufferCC_1

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               pushclk_clk,
  input               pushclk_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               popclk_clk,
  input               popclk_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
