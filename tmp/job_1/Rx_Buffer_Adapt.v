// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Rx_Buffer_Adapt
// Git hash  : c174ea6407642157543b0d5d61d63095d2618929



module Rx_Buffer_Adapt (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input               io_push_stream_payload_last,
  input      [31:0]   io_push_stream_payload_fragment,
  output     [5:0]    io_push_availability,
  output reg          io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [15:0]   io_pop_stream_payload,
  input               io_pop_redo,
  input               io_pop_commit,
  input               pushclk_clk,
  input               pushclk_reset,
  input               popclk_clk,
  input               popclk_reset
);
  reg                 fifo_io_pop_stream_ready;
  wire                fifo_io_push_stream_ready;
  wire       [5:0]    fifo_io_push_availability;
  wire                fifo_io_pop_stream_valid;
  wire       [31:0]   fifo_io_pop_stream_payload;
  reg        [15:0]   _zz_io_pop_stream_payload;
  reg                 push_commit;
  reg        [0:0]    pop_spliter;
  wire                when_Rx_Crc_l281;

  MacTxManagedStreamFifoCc fifo (
    .io_push_stream_valid      (io_push_stream_valid             ), //i
    .io_push_stream_ready      (fifo_io_push_stream_ready        ), //o
    .io_push_stream_payload    (io_push_stream_payload_fragment  ), //i
    .io_push_commit            (push_commit                      ), //i
    .io_push_availability      (fifo_io_push_availability        ), //o
    .io_pop_stream_valid       (fifo_io_pop_stream_valid         ), //o
    .io_pop_stream_ready       (fifo_io_pop_stream_ready         ), //i
    .io_pop_stream_payload     (fifo_io_pop_stream_payload       ), //o
    .io_pop_redo               (io_pop_redo                      ), //i
    .io_pop_commit             (io_pop_commit                    ), //i
    .pushclk_clk               (pushclk_clk                      ), //i
    .pushclk_reset             (pushclk_reset                    ), //i
    .popclk_clk                (popclk_clk                       ), //i
    .popclk_reset              (popclk_reset                     )  //i
  );
  always @(*) begin
    case(pop_spliter)
      1'b0 : begin
        _zz_io_pop_stream_payload = fifo_io_pop_stream_payload[15 : 0];
      end
      default : begin
        _zz_io_pop_stream_payload = fifo_io_pop_stream_payload[31 : 16];
      end
    endcase
  end

  assign io_push_availability = fifo_io_push_availability;
  assign io_push_stream_ready = fifo_io_push_stream_ready;
  always @(*) begin
    fifo_io_pop_stream_ready = 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        if(io_pop_stream_ready) begin
          if(when_Rx_Crc_l281) begin
            fifo_io_pop_stream_ready = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    io_pop_stream_valid = 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        io_pop_stream_valid = 1'b1;
      end
    end
  end

  assign io_pop_stream_payload = _zz_io_pop_stream_payload;
  assign when_Rx_Crc_l281 = (pop_spliter == 1'b1);
  always @(posedge pushclk_clk) begin
    push_commit <= 1'b0;
    if(io_push_stream_payload_last) begin
      push_commit <= 1'b1;
    end
  end

  always @(posedge popclk_clk) begin
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        if(io_pop_stream_ready) begin
          pop_spliter <= (pop_spliter + 1'b1);
        end
      end
    end
  end


endmodule

module MacTxManagedStreamFifoCc (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  input               io_push_commit,
  output     [5:0]    io_push_availability,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  input               io_pop_redo,
  input               io_pop_commit,
  input               pushclk_clk,
  input               pushclk_reset,
  input               popclk_clk,
  input               popclk_reset
);
  reg        [31:0]   _zz_ram_port1;
  wire                popToPush_io_input_ready;
  wire                popToPush_io_output_valid;
  wire       [5:0]    popToPush_io_output_payload;
  wire                pushToPop_io_input_ready;
  wire                pushToPop_io_output_valid;
  wire       [5:0]    pushToPop_io_output_payload;
  wire       [4:0]    _zz_ram_port;
  wire       [5:0]    _zz_io_push_availability;
  reg                 _zz_1;
  reg        [5:0]    push_currentPtr;
  reg        [5:0]    push_oldPtr;
  reg        [5:0]    push_popPtr;
  wire                io_push_stream_fire;
  reg        [5:0]    pop_currentPtr;
  reg        [5:0]    pop_oldPtr;
  reg        [5:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [4:0]    pop_cmd_payload;
  wire                io_pop_stream_fire;
  reg        [5:0]    pop_commitPtr;
  wire                _zz_io_pop_stream_valid;
  reg                 _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  reg                 _zz_io_pop_stream_valid_2;
  wire                pop_cmd_fire;
  reg [31:0] ram [0:31];

  assign _zz_ram_port = push_currentPtr[4:0];
  assign _zz_io_push_availability = (push_currentPtr - push_popPtr);
  always @(posedge pushclk_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_stream_payload;
    end
  end

  always @(posedge popclk_clk) begin
    if(pop_cmd_ready) begin
      _zz_ram_port1 <= ram[pop_cmd_payload];
    end
  end

  StreamCCByToggle popToPush (
    .io_input_valid       (1'b1                         ), //i
    .io_input_ready       (popToPush_io_input_ready     ), //o
    .io_input_payload     (pop_oldPtr                   ), //i
    .io_output_valid      (popToPush_io_output_valid    ), //o
    .io_output_ready      (1'b1                         ), //i
    .io_output_payload    (popToPush_io_output_payload  ), //o
    .popclk_clk           (popclk_clk                   ), //i
    .popclk_reset         (popclk_reset                 ), //i
    .pushclk_clk          (pushclk_clk                  ), //i
    .pushclk_reset        (pushclk_reset                )  //i
  );
  StreamCCByToggle_1 pushToPop (
    .io_input_valid       (1'b1                         ), //i
    .io_input_ready       (pushToPop_io_input_ready     ), //o
    .io_input_payload     (push_oldPtr                  ), //i
    .io_output_valid      (pushToPop_io_output_valid    ), //o
    .io_output_ready      (1'b1                         ), //i
    .io_output_payload    (pushToPop_io_output_payload  ), //o
    .pushclk_clk          (pushclk_clk                  ), //i
    .pushclk_reset        (pushclk_reset                ), //i
    .popclk_clk           (popclk_clk                   ), //i
    .popclk_reset         (popclk_reset                 )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_stream_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign io_push_stream_ready = (! ((push_currentPtr[5] != push_popPtr[5]) && (push_currentPtr[4 : 0] == push_popPtr[4 : 0])));
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign io_push_availability = (6'h20 - _zz_io_push_availability);
  assign pop_cmd_valid = ((! (pop_currentPtr == pop_pushPtr)) && (! io_pop_redo));
  assign pop_cmd_payload = pop_currentPtr[4:0];
  assign io_pop_stream_fire = (io_pop_stream_valid && io_pop_stream_ready);
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  always @(*) begin
    _zz_io_pop_stream_valid_2 = _zz_io_pop_stream_valid;
    if(io_pop_redo) begin
      _zz_io_pop_stream_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    _zz_pop_cmd_ready = io_pop_stream_ready;
    if(io_pop_redo) begin
      _zz_pop_cmd_ready = 1'b1;
    end
  end

  assign io_pop_stream_valid = _zz_io_pop_stream_valid_2;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  always @(posedge pushclk_clk or posedge pushclk_reset) begin
    if(pushclk_reset) begin
      push_currentPtr <= 6'h0;
      push_oldPtr <= 6'h0;
      push_popPtr <= 6'h0;
    end else begin
      if(popToPush_io_output_valid) begin
        push_popPtr <= popToPush_io_output_payload;
      end
      if(io_push_stream_fire) begin
        push_currentPtr <= (push_currentPtr + 6'h01);
      end
      if(io_push_commit) begin
        push_oldPtr <= push_currentPtr;
      end
    end
  end

  always @(posedge popclk_clk or posedge popclk_reset) begin
    if(popclk_reset) begin
      pop_currentPtr <= 6'h0;
      pop_oldPtr <= 6'h0;
      pop_pushPtr <= 6'h0;
      _zz_io_pop_stream_valid_1 <= 1'b0;
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
      if(pop_cmd_fire) begin
        pop_currentPtr <= (pop_currentPtr + 6'h01);
      end
      if(io_pop_redo) begin
        pop_currentPtr <= pop_oldPtr;
      end
      if(io_pop_commit) begin
        pop_oldPtr <= pop_commitPtr;
      end
    end
  end

  always @(posedge popclk_clk) begin
    if(io_pop_stream_fire) begin
      pop_commitPtr <= pop_currentPtr;
    end
  end


endmodule

module StreamCCByToggle_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [5:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [5:0]    io_output_payload,
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
  reg        [5:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [5:0]    popArea_stream_payload;
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
      pushArea_data <= 6'h0;
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
  input      [5:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [5:0]    io_output_payload,
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
  reg        [5:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [5:0]    popArea_stream_payload;
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
      pushArea_data <= 6'h0;
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
