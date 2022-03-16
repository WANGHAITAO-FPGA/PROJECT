// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : FiberTxSimpleBus


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_Wait_Start 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_Send_Data 2'b10
`define fsm_enumDefinition_binary_sequential_fsm_End 2'b11


module FiberTxSimpleBus (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  output              RENABLE,
  output     [9:0]    RADDR,
  input      [31:0]   RDATA,
  input               timer_tick,
  input               clk,
  input               reset
);
  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  reg                 RENABLE_1;
  reg        [9:0]    RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [9:0]    send_length;
  wire                when_FiberTxSimpleBus_l29;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_FiberTxSimpleBus_l50;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif


  Timer timer_1 (
    .io_tick     (timer_tick        ), //i
    .io_clear    (timer_1_io_clear  ), //i
    .io_limit    (32'h00000032      ), //i
    .io_full     (timer_1_io_full   ), //o
    .io_value    (timer_1_io_value  ), //o
    .clk         (clk               ), //i
    .reset       (reset             )  //i
  );
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

  assign when_FiberTxSimpleBus_l29 = (32'h00000032 <= timer_1_io_value);
  always @(*) begin
    if(when_FiberTxSimpleBus_l29) begin
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
  assign RADDR = RADDR_1;
  assign RENABLE = RENABLE_1;
  assign output_payload_fragment = RDATA;
  assign output_valid = RENABLE_1_regNext;
  assign output_payload_last = (send_length == 10'h032);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Send_Data;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Send_Data : begin
        if(when_FiberTxSimpleBus_l50) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_End;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
        fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Wait_Start;
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

  assign when_FiberTxSimpleBus_l50 = (send_length == 10'h032);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 10'h0;
      send_length <= 10'h0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 10'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 10'h0;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 10'h004);
          send_length <= (send_length + 10'h001);
        end
        `fsm_enumDefinition_binary_sequential_fsm_End : begin
          RENABLE_1 <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    RENABLE_1_regNext <= RENABLE_1;
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
