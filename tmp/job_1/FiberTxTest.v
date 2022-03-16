// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : FiberTxTest

`timescale 1ns/1ps 

module FiberTxTest (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               reset
);

  wire                fiberregif_1_output_enable;
  wire                fiberregif_1_receive_done;
  wire       [31:0]   fiberregif_1_simplebus_RDATA;
  wire       [15:0]   fiberregif_1_AD5544_DATA_0;
  wire       [15:0]   fiberregif_1_AD5544_DATA_1;
  wire       [15:0]   fiberregif_1_AD5544_DATA_2;
  wire       [15:0]   fiberregif_1_AD5544_DATA_3;
  wire                fiberregif_1_AD5544_0_Triger;
  wire                fibertxsimplebus_1_output_valid;
  wire                fibertxsimplebus_1_output_payload_last;
  wire       [31:0]   fibertxsimplebus_1_output_payload_fragment;
  wire                fibertxsimplebus_1_RENABLE;
  wire       [9:0]    fibertxsimplebus_1_RADDR;

  FiberRegif fiberregif_1 (
    .simplebus_RADDR      (fibertxsimplebus_1_RADDR[9:0]       ), //i
    .simplebus_RDATA      (fiberregif_1_simplebus_RDATA[31:0]  ), //o
    .simplebus_RENABLE    (fibertxsimplebus_1_RENABLE          ), //i
    .simplebus_WADDR      (10'h0                               ), //i
    .simplebus_WDATA      (32'h0                               ), //i
    .simplebus_WENABLE    (1'b0                                ), //i
    .output_enable        (fiberregif_1_output_enable          ), //i
    .receive_done         (fiberregif_1_receive_done           ), //i
    .AD5544_DATA_0        (fiberregif_1_AD5544_DATA_0[15:0]    ), //o
    .AD5544_DATA_1        (fiberregif_1_AD5544_DATA_1[15:0]    ), //o
    .AD5544_DATA_2        (fiberregif_1_AD5544_DATA_2[15:0]    ), //o
    .AD5544_DATA_3        (fiberregif_1_AD5544_DATA_3[15:0]    ), //o
    .AD5544_0_Triger      (fiberregif_1_AD5544_0_Triger        ), //o
    .clk                  (clk                                 ), //i
    .reset                (reset                               )  //i
  );
  FiberTxSimpleBus fibertxsimplebus_1 (
    .output_valid               (fibertxsimplebus_1_output_valid                   ), //o
    .output_ready               (output_ready                                      ), //i
    .output_payload_last        (fibertxsimplebus_1_output_payload_last            ), //o
    .output_payload_fragment    (fibertxsimplebus_1_output_payload_fragment[31:0]  ), //o
    .RENABLE                    (fibertxsimplebus_1_RENABLE                        ), //o
    .RADDR                      (fibertxsimplebus_1_RADDR[9:0]                     ), //o
    .RDATA                      (fiberregif_1_simplebus_RDATA[31:0]                ), //i
    .timer_tick                 (1'b1                                              ), //i
    .clk                        (clk                                               ), //i
    .reset                      (reset                                             )  //i
  );
  assign output_valid = fibertxsimplebus_1_output_valid;
  assign output_payload_last = fibertxsimplebus_1_output_payload_last;
  assign output_payload_fragment = fibertxsimplebus_1_output_payload_fragment;

endmodule

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
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Wait_Start = 2'd1;
  localparam fsm_enumDef_Send_Data = 2'd2;
  localparam fsm_enumDef_End_1 = 2'd3;

  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire                streamfifo_1_io_push_ready;
  wire                streamfifo_1_io_pop_valid;
  wire       [31:0]   streamfifo_1_io_pop_payload;
  wire       [1:0]    streamfifo_1_io_occupancy;
  wire       [1:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [9:0]    RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [9:0]    send_length;
  wire                when_FiberTxSimpleBus_l30;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_FiberTxSimpleBus_l53;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  Timer timer_1 (
    .io_tick     (timer_tick              ), //i
    .io_clear    (timer_1_io_clear        ), //i
    .io_limit    (32'h00000032            ), //i
    .io_full     (timer_1_io_full         ), //o
    .io_value    (timer_1_io_value[31:0]  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
  );
  StreamFifo streamfifo_1 (
    .io_push_valid      (RENABLE_1_regNext                  ), //i
    .io_push_ready      (streamfifo_1_io_push_ready         ), //o
    .io_push_payload    (RDATA[31:0]                        ), //i
    .io_pop_valid       (streamfifo_1_io_pop_valid          ), //o
    .io_pop_ready       (output_ready                       ), //i
    .io_pop_payload     (streamfifo_1_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                               ), //i
    .io_occupancy       (streamfifo_1_io_occupancy[1:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[1:0]  ), //o
    .clk                (clk                                ), //i
    .reset              (reset                              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_Send_Data : fsm_stateReg_string = "Send_Data ";
      fsm_enumDef_End_1 : fsm_stateReg_string = "End_1     ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_Send_Data : fsm_stateNext_string = "Send_Data ";
      fsm_enumDef_End_1 : fsm_stateNext_string = "End_1     ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign when_FiberTxSimpleBus_l30 = (32'h00000032 <= timer_1_io_value);
  always @(*) begin
    if(when_FiberTxSimpleBus_l30) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Send_Data : begin
      end
      fsm_enumDef_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign RADDR = RADDR_1;
  assign RENABLE = RENABLE_1;
  assign output_payload_fragment = streamfifo_1_io_pop_payload;
  assign output_valid = streamfifo_1_io_pop_valid;
  assign output_fire = (output_valid && output_ready);
  assign output_payload_last = ((streamfifo_1_io_occupancy == 2'b01) && output_fire);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = fsm_enumDef_Send_Data;
        end
      end
      fsm_enumDef_Send_Data : begin
        if(when_FiberTxSimpleBus_l53) begin
          fsm_stateNext = fsm_enumDef_End_1;
        end
      end
      fsm_enumDef_End_1 : begin
        fsm_stateNext = fsm_enumDef_Wait_Start;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_FiberTxSimpleBus_l53 = (send_length == 10'h002);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 10'h0;
      send_length <= 10'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 10'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 10'h0;
          end
        end
        fsm_enumDef_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 10'h004);
          send_length <= (send_length + 10'h001);
          if(when_FiberTxSimpleBus_l53) begin
            RENABLE_1 <= 1'b0;
          end
        end
        fsm_enumDef_End_1 : begin
          send_length <= 10'h0;
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

module FiberRegif (
  input      [9:0]    simplebus_RADDR,
  output     [31:0]   simplebus_RDATA,
  input               simplebus_RENABLE,
  input      [9:0]    simplebus_WADDR,
  input      [31:0]   simplebus_WDATA,
  input               simplebus_WENABLE,
  input               output_enable,
  input               receive_done,
  output reg [15:0]   AD5544_DATA_0,
  output reg [15:0]   AD5544_DATA_1,
  output reg [15:0]   AD5544_DATA_2,
  output reg [15:0]   AD5544_DATA_3,
  output              AD5544_0_Triger,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire       [31:0]   HEADER;
  wire       [31:0]   VERSION;
  wire       [31:0]   SEND_CNT;
  wire                when_RegInst_l153;
  reg        [15:0]   AD5544_DATA_0_TEMP;
  reg        [15:0]   AD5544_DATA_1_TEMP;
  reg                 DATA_TEMP0_isWriting;
  wire                when_RegInst_l153_1;
  reg        [15:0]   AD5544_DATA_2_TEMP;
  reg        [15:0]   AD5544_DATA_3_TEMP;
  reg                 DATA_TEMP1_isWriting;
  reg                 Triger_0;
  reg                 Triger_0_delay_1;
  reg                 Triger_0_delay_1_1;
  reg                 Triger_0_delay_2;
  reg                 Triger_0_delay_1_2;
  reg                 Triger_0_delay_2_1;
  reg                 Triger_0_delay_3;

  assign simplebus_RDATA = busslave_readData;
  assign HEADER = 32'h00f1f2f3;
  assign VERSION = 32'h20211224;
  assign SEND_CNT = 32'h00102034;
  assign when_RegInst_l153 = ((simplebus_WADDR == 10'h014) && simplebus_WENABLE);
  assign when_RegInst_l153_1 = ((simplebus_WADDR == 10'h018) && simplebus_WENABLE);
  assign AD5544_0_Triger = (((Triger_0 || Triger_0_delay_1) || Triger_0_delay_2) || Triger_0_delay_3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
      AD5544_DATA_0_TEMP <= 16'h0;
      AD5544_DATA_0 <= 16'h0;
      AD5544_DATA_1_TEMP <= 16'h0;
      AD5544_DATA_1 <= 16'h0;
      DATA_TEMP0_isWriting <= 1'b0;
      AD5544_DATA_2_TEMP <= 16'h0;
      AD5544_DATA_2 <= 16'h0;
      AD5544_DATA_3_TEMP <= 16'h0;
      AD5544_DATA_3 <= 16'h0;
      DATA_TEMP1_isWriting <= 1'b0;
      Triger_0 <= 1'b0;
    end else begin
      if(when_RegInst_l153) begin
        AD5544_DATA_0_TEMP <= simplebus_WDATA[15 : 0];
      end
      if(output_enable) begin
        AD5544_DATA_0 <= AD5544_DATA_0_TEMP;
      end
      if(when_RegInst_l153) begin
        AD5544_DATA_1_TEMP <= simplebus_WDATA[31 : 16];
      end
      if(output_enable) begin
        AD5544_DATA_1 <= AD5544_DATA_1_TEMP;
      end
      if(when_RegInst_l153) begin
        DATA_TEMP0_isWriting <= 1'b1;
      end else begin
        if(receive_done) begin
          DATA_TEMP0_isWriting <= 1'b0;
        end
      end
      if(when_RegInst_l153_1) begin
        AD5544_DATA_2_TEMP <= simplebus_WDATA[15 : 0];
      end
      if(output_enable) begin
        AD5544_DATA_2 <= AD5544_DATA_2_TEMP;
      end
      if(when_RegInst_l153_1) begin
        AD5544_DATA_3_TEMP <= simplebus_WDATA[31 : 16];
      end
      if(output_enable) begin
        AD5544_DATA_3 <= AD5544_DATA_3_TEMP;
      end
      if(when_RegInst_l153_1) begin
        DATA_TEMP1_isWriting <= 1'b1;
      end else begin
        if(receive_done) begin
          DATA_TEMP1_isWriting <= 1'b0;
        end
      end
      Triger_0 <= ((DATA_TEMP0_isWriting || DATA_TEMP1_isWriting) && output_enable);
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          10'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          10'h004 : begin
            busslave_readData <= VERSION;
            busslave_readError <= 1'b0;
          end
          10'h008 : begin
            busslave_readData <= SEND_CNT;
            busslave_readError <= 1'b0;
          end
          10'h014 : begin
            busslave_readData <= {AD5544_DATA_1_TEMP,AD5544_DATA_0_TEMP};
            busslave_readError <= 1'b0;
          end
          10'h018 : begin
            busslave_readData <= {AD5544_DATA_3_TEMP,AD5544_DATA_2_TEMP};
            busslave_readError <= 1'b0;
          end
          default : begin
            busslave_readData <= 32'h0;
            busslave_readError <= 1'b1;
          end
        endcase
      end
    end
  end

  always @(posedge clk) begin
    Triger_0_delay_1 <= Triger_0;
    Triger_0_delay_1_1 <= Triger_0;
    Triger_0_delay_2 <= Triger_0_delay_1_1;
    Triger_0_delay_1_2 <= Triger_0;
    Triger_0_delay_2_1 <= Triger_0_delay_1_2;
    Triger_0_delay_3 <= Triger_0_delay_2_1;
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  input               io_flush,
  output reg [1:0]    io_occupancy,
  output reg [1:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_logic_ram_port0;
  wire       [1:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [1:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [1:0]    _zz_io_occupancy;
  wire       [1:0]    _zz_io_availability;
  wire       [1:0]    _zz_io_availability_1;
  wire       [1:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [1:0]    logic_pushPtr_valueNext;
  reg        [1:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [1:0]    logic_popPtr_valueNext;
  reg        [1:0]    logic_popPtr_value;
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
  wire       [1:0]    logic_ptrDif;
  reg [31:0] logic_ram [0:2];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {1'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {1'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (2'b11 + logic_ptrDif);
  assign _zz_io_availability = (2'b11 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 2'b10);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 2'b00;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 2'b00;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 2'b10);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 2'b00;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 2'b00;
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
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 2'b11 : 2'b00);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 2'b00 : 2'b11);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 2'b00;
      logic_popPtr_value <= 2'b00;
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
