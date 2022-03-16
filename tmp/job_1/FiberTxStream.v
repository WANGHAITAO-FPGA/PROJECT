// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : FiberTxStream


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_Wait_Start 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_Send_Data 2'b10
`define fsm_enumDefinition_binary_sequential_fsm_End 2'b11


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
  input               timer_tick,
  input               clk,
  input               reset
);
  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  reg        [7:0]    _zz_rd_data;
  wire                when_FiberTxStream_l22;
  reg        [7:0]    send_length;
  reg        [4:0]    rd_addr;
  reg        [1:0]    portcnt;
  reg        [7:0]    rd_data;
  reg                 valid;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_FiberTxStream_l53;
  wire                when_FiberTxStream_l60;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif


  Timer timer_1 (
    .io_tick     (timer_tick        ), //i
    .io_clear    (timer_1_io_clear  ), //i
    .io_limit    (32'h000001f4      ), //i
    .io_full     (timer_1_io_full   ), //o
    .io_value    (timer_1_io_value  ), //o
    .clk         (clk               ), //i
    .reset       (reset             )  //i
  );
  always @(*) begin
    case(portcnt)
      2'b00 : begin
        _zz_rd_data = reads_0_dataOut;
      end
      2'b01 : begin
        _zz_rd_data = reads_1_dataOut;
      end
      default : begin
        _zz_rd_data = reads_2_dataOut;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT      ";
      `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : fsm_stateReg_string = "fsm_Wait_Start";
      `fsm_enumDefinition_binary_sequential_fsm_Send_Data : fsm_stateReg_string = "fsm_Send_Data ";
      `fsm_enumDefinition_binary_sequential_fsm_End : fsm_stateReg_string = "fsm_End       ";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT      ";
      `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : fsm_stateNext_string = "fsm_Wait_Start";
      `fsm_enumDefinition_binary_sequential_fsm_Send_Data : fsm_stateNext_string = "fsm_Send_Data ";
      `fsm_enumDefinition_binary_sequential_fsm_End : fsm_stateNext_string = "fsm_End       ";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign when_FiberTxStream_l22 = (32'h000001f4 <= timer_1_io_value);
  always @(*) begin
    if(when_FiberTxStream_l22) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Send_Data : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign reads_0_en = (portcnt == 2'b00);
  assign reads_0_addr = rd_addr;
  assign reads_1_en = (portcnt == 2'b01);
  assign reads_1_addr = rd_addr;
  assign reads_2_en = (portcnt == 2'b10);
  assign reads_2_addr = rd_addr;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Send_Data;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Send_Data : begin
        if(when_FiberTxStream_l53) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_End;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
        if(when_FiberTxStream_l60) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait_Start;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Send_Data;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign when_FiberTxStream_l53 = (send_length == 8'h09);
  assign when_FiberTxStream_l60 = (portcnt == 2'b10);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      send_length <= 8'h0;
      rd_addr <= 5'h0;
      portcnt <= 2'b00;
      valid <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : begin
          if(timer_1_io_full) begin
            valid <= 1'b1;
          end else begin
            rd_addr <= 5'h0;
            send_length <= 8'h0;
            portcnt <= 2'b00;
            valid <= 1'b0;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_Send_Data : begin
          send_length <= (send_length + 8'h01);
          rd_addr <= (rd_addr + 5'h01);
        end
        `fsm_enumDefinition_binary_sequential_fsm_End : begin
          if(when_FiberTxStream_l60) begin
            portcnt <= 2'b00;
          end else begin
            portcnt <= (portcnt + 2'b01);
            send_length <= 8'h0;
            rd_addr <= 5'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Send_Data : begin
        rd_data <= _zz_rd_data;
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
      end
      default : begin
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
