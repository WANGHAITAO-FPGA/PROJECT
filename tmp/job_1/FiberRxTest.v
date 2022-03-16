// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : FiberRxTest


`define CRCCombinationalCmdMode_binary_sequential_type [0:0]
`define CRCCombinationalCmdMode_binary_sequential_INIT 1'b0
`define CRCCombinationalCmdMode_binary_sequential_UPDATE 1'b1

`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_Get_Header 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_Get_Data 2'b10

`define fsm_enumDefinition_1_binary_sequential_type [1:0]
`define fsm_enumDefinition_1_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start 2'b01
`define fsm_enumDefinition_1_binary_sequential_fsm_Send_Data 2'b10
`define fsm_enumDefinition_1_binary_sequential_fsm_End 2'b11


module FiberRxTest (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  input               clk,
  input               reset,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment
);
  wire       [15:0]   area_ad5544_ctrl_AD5544_DATA_IN1;
  wire       [15:0]   area_ad5544_ctrl_AD5544_DATA_IN2;
  wire       [15:0]   area_ad5544_ctrl_AD5544_DATA_IN3;
  wire       [15:0]   area_ad5544_ctrl_AD5544_DATA_IN4;
  wire                area_fiberrxpreamble_input_ready;
  wire                area_fiberrxpreamble_output_valid;
  wire                area_fiberrxpreamble_output_payload_last;
  wire       [31:0]   area_fiberrxpreamble_output_payload_fragment;
  wire                area_fiberrxchecker_input_ready;
  wire                area_fiberrxchecker_output_valid;
  wire                area_fiberrxchecker_output_payload_last;
  wire       [31:0]   area_fiberrxchecker_output_payload_fragment;
  wire                area_fiberrxchecker_output_enable;
  wire                area_fiberrxchecker_recieve_done;
  wire                area_fibersimplebus_input_ready;
  wire       [15:0]   area_fibersimplebus_waddr;
  wire       [31:0]   area_fibersimplebus_wdata;
  wire                area_fibersimplebus_wenable;
  wire       [31:0]   area_fiberregif_simplebus_RDATA;
  wire       [15:0]   area_fiberregif_AD5544_DATA_0;
  wire       [15:0]   area_fiberregif_AD5544_DATA_1;
  wire       [15:0]   area_fiberregif_AD5544_DATA_2;
  wire       [15:0]   area_fiberregif_AD5544_DATA_3;
  wire                area_fiberregif_AD5544_0_Triger;
  wire                area_fibertxsimplebus_output_valid;
  wire                area_fibertxsimplebus_output_payload_last;
  wire       [31:0]   area_fibertxsimplebus_output_payload_fragment;
  wire                area_fibertxsimplebus_RENABLE;
  wire       [15:0]   area_fibertxsimplebus_RADDR;
  wire                area_ad5544_ctrl_AD5544_CS;
  wire                area_ad5544_ctrl_AD5544_LDAC;
  wire                area_ad5544_ctrl_AD5544_MSB;
  wire                area_ad5544_ctrl_AD5544_RS;
  wire                area_ad5544_ctrl_AD5544_SCLK;
  wire                area_ad5544_ctrl_AD5544_SDIN;

  FiberRxPreamble area_fiberrxpreamble (
    .input_valid                (input_valid                                   ), //i
    .input_ready                (area_fiberrxpreamble_input_ready              ), //o
    .input_payload_last         (input_payload_last                            ), //i
    .input_payload_fragment     (input_payload_fragment                        ), //i
    .output_valid               (area_fiberrxpreamble_output_valid             ), //o
    .output_ready               (area_fiberrxchecker_input_ready               ), //i
    .output_payload_last        (area_fiberrxpreamble_output_payload_last      ), //o
    .output_payload_fragment    (area_fiberrxpreamble_output_payload_fragment  ), //o
    .clk                        (clk                                           ), //i
    .reset                      (reset                                         )  //i
  );
  FiberRxChecker area_fiberrxchecker (
    .input_valid                (area_fiberrxpreamble_output_valid             ), //i
    .input_ready                (area_fiberrxchecker_input_ready               ), //o
    .input_payload_last         (area_fiberrxpreamble_output_payload_last      ), //i
    .input_payload_fragment     (area_fiberrxpreamble_output_payload_fragment  ), //i
    .output_valid               (area_fiberrxchecker_output_valid              ), //o
    .output_ready               (area_fibersimplebus_input_ready               ), //i
    .output_payload_last        (area_fiberrxchecker_output_payload_last       ), //o
    .output_payload_fragment    (area_fiberrxchecker_output_payload_fragment   ), //o
    .output_enable              (area_fiberrxchecker_output_enable             ), //o
    .recieve_done               (area_fiberrxchecker_recieve_done              ), //o
    .clk                        (clk                                           ), //i
    .reset                      (reset                                         )  //i
  );
  FiberRxSimpleBus area_fibersimplebus (
    .input_valid               (area_fiberrxchecker_output_valid             ), //i
    .input_ready               (area_fibersimplebus_input_ready              ), //o
    .input_payload_last        (area_fiberrxchecker_output_payload_last      ), //i
    .input_payload_fragment    (area_fiberrxchecker_output_payload_fragment  ), //i
    .waddr                     (area_fibersimplebus_waddr                    ), //o
    .wdata                     (area_fibersimplebus_wdata                    ), //o
    .wenable                   (area_fibersimplebus_wenable                  ), //o
    .clk                       (clk                                          ), //i
    .reset                     (reset                                        )  //i
  );
  FiberRegif area_fiberregif (
    .simplebus_RADDR      (area_fibertxsimplebus_RADDR        ), //i
    .simplebus_RDATA      (area_fiberregif_simplebus_RDATA    ), //o
    .simplebus_RENABLE    (area_fibertxsimplebus_RENABLE      ), //i
    .simplebus_WADDR      (area_fibersimplebus_waddr          ), //i
    .simplebus_WDATA      (area_fibersimplebus_wdata          ), //i
    .simplebus_WENABLE    (area_fibersimplebus_wenable        ), //i
    .output_enable        (area_fiberrxchecker_output_enable  ), //i
    .receive_done         (area_fiberrxchecker_recieve_done   ), //i
    .AD5544_DATA_0        (area_fiberregif_AD5544_DATA_0      ), //o
    .AD5544_DATA_1        (area_fiberregif_AD5544_DATA_1      ), //o
    .AD5544_DATA_2        (area_fiberregif_AD5544_DATA_2      ), //o
    .AD5544_DATA_3        (area_fiberregif_AD5544_DATA_3      ), //o
    .AD5544_0_Triger      (area_fiberregif_AD5544_0_Triger    ), //o
    .clk                  (clk                                ), //i
    .reset                (reset                              )  //i
  );
  FiberTxSimpleBus area_fibertxsimplebus (
    .output_valid               (area_fibertxsimplebus_output_valid             ), //o
    .output_ready               (output_ready                                   ), //i
    .output_payload_last        (area_fibertxsimplebus_output_payload_last      ), //o
    .output_payload_fragment    (area_fibertxsimplebus_output_payload_fragment  ), //o
    .RENABLE                    (area_fibertxsimplebus_RENABLE                  ), //o
    .RADDR                      (area_fibertxsimplebus_RADDR                    ), //o
    .RDATA                      (area_fiberregif_simplebus_RDATA                ), //i
    .timer_tick                 (1'b1                                           ), //i
    .clk                        (clk                                            ), //i
    .reset                      (reset                                          )  //i
  );
  dac_ad5544 area_ad5544_ctrl (
    .clk                (clk                               ), //i
    .reset              (reset                             ), //i
    .AD5544_CS          (area_ad5544_ctrl_AD5544_CS        ), //o
    .AD5544_LDAC        (area_ad5544_ctrl_AD5544_LDAC      ), //o
    .AD5544_MSB         (area_ad5544_ctrl_AD5544_MSB       ), //o
    .AD5544_RS          (area_ad5544_ctrl_AD5544_RS        ), //o
    .AD5544_SCLK        (area_ad5544_ctrl_AD5544_SCLK      ), //o
    .AD5544_SDIN        (area_ad5544_ctrl_AD5544_SDIN      ), //o
    .ad5544_trig        (area_fiberregif_AD5544_0_Triger   ), //i
    .AD5544_DATA_IN1    (area_ad5544_ctrl_AD5544_DATA_IN1  ), //i
    .AD5544_DATA_IN2    (area_ad5544_ctrl_AD5544_DATA_IN2  ), //i
    .AD5544_DATA_IN3    (area_ad5544_ctrl_AD5544_DATA_IN3  ), //i
    .AD5544_DATA_IN4    (area_ad5544_ctrl_AD5544_DATA_IN4  )  //i
  );
  assign input_ready = area_fiberrxpreamble_input_ready;
  assign output_valid = area_fibertxsimplebus_output_valid;
  assign output_payload_last = area_fibertxsimplebus_output_payload_last;
  assign output_payload_fragment = area_fibertxsimplebus_output_payload_fragment;
  assign area_ad5544_ctrl_AD5544_DATA_IN1 = area_fiberregif_AD5544_DATA_0;
  assign area_ad5544_ctrl_AD5544_DATA_IN2 = area_fiberregif_AD5544_DATA_1;
  assign area_ad5544_ctrl_AD5544_DATA_IN3 = area_fiberregif_AD5544_DATA_2;
  assign area_ad5544_ctrl_AD5544_DATA_IN4 = area_fiberregif_AD5544_DATA_3;

endmodule

module FiberTxSimpleBus (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  output              RENABLE,
  output     [15:0]   RADDR,
  input      [31:0]   RDATA,
  input               timer_tick,
  input               clk,
  input               reset
);
  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire                streamfifo_1_io_push_ready;
  wire                streamfifo_1_io_pop_valid;
  wire       [31:0]   streamfifo_1_io_pop_payload;
  wire       [1:0]    streamfifo_1_io_occupancy;
  wire       [1:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [15:0]   RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [15:0]   send_length;
  wire                when_FiberTxSimpleBus_l30;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_1_binary_sequential_type fsm_stateNext;
  wire                when_FiberTxSimpleBus_l53;
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
  StreamFifo streamfifo_1 (
    .io_push_valid      (RENABLE_1_regNext             ), //i
    .io_push_ready      (streamfifo_1_io_push_ready    ), //o
    .io_push_payload    (RDATA                         ), //i
    .io_pop_valid       (streamfifo_1_io_pop_valid     ), //o
    .io_pop_ready       (output_ready                  ), //i
    .io_pop_payload     (streamfifo_1_io_pop_payload   ), //o
    .io_flush           (1'b0                          ), //i
    .io_occupancy       (streamfifo_1_io_occupancy     ), //o
    .io_availability    (streamfifo_1_io_availability  ), //o
    .clk                (clk                           ), //i
    .reset              (reset                         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT      ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start : fsm_stateReg_string = "fsm_Wait_Start";
      `fsm_enumDefinition_1_binary_sequential_fsm_Send_Data : fsm_stateReg_string = "fsm_Send_Data ";
      `fsm_enumDefinition_1_binary_sequential_fsm_End : fsm_stateReg_string = "fsm_End       ";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_1_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT      ";
      `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start : fsm_stateNext_string = "fsm_Wait_Start";
      `fsm_enumDefinition_1_binary_sequential_fsm_Send_Data : fsm_stateNext_string = "fsm_Send_Data ";
      `fsm_enumDefinition_1_binary_sequential_fsm_End : fsm_stateNext_string = "fsm_End       ";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign when_FiberTxSimpleBus_l30 = (32'h000001f4 <= timer_1_io_value);
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
      `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Send_Data : begin
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_End : begin
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
      `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Send_Data;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_Send_Data : begin
        if(when_FiberTxSimpleBus_l53) begin
          fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_End;
        end
      end
      `fsm_enumDefinition_1_binary_sequential_fsm_End : begin
        fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end
  end

  assign when_FiberTxSimpleBus_l53 = (send_length == 16'h0002);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 16'h0;
      send_length <= 16'h0;
      fsm_stateReg <= `fsm_enumDefinition_1_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_1_binary_sequential_fsm_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 16'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 16'h0;
          end
        end
        `fsm_enumDefinition_1_binary_sequential_fsm_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 16'h0004);
          send_length <= (send_length + 16'h0001);
          if(when_FiberTxSimpleBus_l53) begin
            RENABLE_1 <= 1'b0;
          end
        end
        `fsm_enumDefinition_1_binary_sequential_fsm_End : begin
          send_length <= 16'h0;
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
  input      [15:0]   simplebus_RADDR,
  output     [31:0]   simplebus_RDATA,
  input               simplebus_RENABLE,
  input      [15:0]   simplebus_WADDR,
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
  assign when_RegInst_l153 = ((simplebus_WADDR == 16'h0014) && simplebus_WENABLE);
  assign when_RegInst_l153_1 = ((simplebus_WADDR == 16'h0018) && simplebus_WENABLE);
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
          16'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          16'h0004 : begin
            busslave_readData <= VERSION;
            busslave_readError <= 1'b0;
          end
          16'h0008 : begin
            busslave_readData <= SEND_CNT;
            busslave_readError <= 1'b0;
          end
          16'h0014 : begin
            busslave_readData <= {AD5544_DATA_1_TEMP,AD5544_DATA_0_TEMP};
            busslave_readError <= 1'b0;
          end
          16'h0018 : begin
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

module FiberRxSimpleBus (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output     [15:0]   waddr,
  output     [31:0]   wdata,
  output              wenable,
  input               clk,
  input               reset
);
  wire       [17:0]   _zz_waddr;
  wire       [7:0]    _zz_waddr_1;
  reg        [15:0]   waddr_1;
  reg        [31:0]   wdata_1;
  reg                 wenable_1;
  reg                 flag;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_FiberRxSimpleBus_l34;
  wire                when_FiberRxSimpleBus_l40;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif


  assign _zz_waddr = ({2'd0,waddr_1} <<< 2);
  assign _zz_waddr_1 = input_payload_fragment[15 : 8];
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT      ";
      `fsm_enumDefinition_binary_sequential_fsm_Get_Header : fsm_stateReg_string = "fsm_Get_Header";
      `fsm_enumDefinition_binary_sequential_fsm_Get_Data : fsm_stateReg_string = "fsm_Get_Data  ";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT      ";
      `fsm_enumDefinition_binary_sequential_fsm_Get_Header : fsm_stateNext_string = "fsm_Get_Header";
      `fsm_enumDefinition_binary_sequential_fsm_Get_Data : fsm_stateNext_string = "fsm_Get_Data  ";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Get_Header : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_Get_Data : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign waddr = _zz_waddr[15:0];
  assign wenable = wenable_1;
  assign wdata = wdata_1;
  assign input_ready = 1'b1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Get_Header : begin
        if(input_valid) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Get_Data;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Get_Data : begin
        if(when_FiberRxSimpleBus_l34) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Get_Header;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_Get_Header;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign when_FiberRxSimpleBus_l34 = (input_valid && input_payload_last);
  assign when_FiberRxSimpleBus_l40 = (! flag);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      wenable_1 <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_Get_Header : begin
        end
        `fsm_enumDefinition_binary_sequential_fsm_Get_Data : begin
          if(when_FiberRxSimpleBus_l34) begin
            wenable_1 <= 1'b0;
          end else begin
            if(input_valid) begin
              wenable_1 <= 1'b1;
            end else begin
              wenable_1 <= 1'b0;
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_Get_Header : begin
        if(input_valid) begin
          waddr_1 <= {8'd0, _zz_waddr_1};
          flag <= 1'b0;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_Get_Data : begin
        if(!when_FiberRxSimpleBus_l34) begin
          if(input_valid) begin
            wdata_1 <= input_payload_fragment;
            if(when_FiberRxSimpleBus_l40) begin
              flag <= 1'b1;
            end else begin
              waddr_1 <= (waddr_1 + 16'h0001);
            end
          end
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module FiberRxChecker (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  output              output_enable,
  output              recieve_done,
  input               clk,
  input               reset
);
  reg        `CRCCombinationalCmdMode_binary_sequential_type crc32_io_cmd_payload_mode;
  wire       [31:0]   crc32_io_crc;
  wire                crc_error;
  reg                 output_enable_1;
  wire                when_FiberRxPreamble_l63;
  reg                 input_payload_last_regNext;

  CRCCombinational crc32 (
    .io_cmd_valid           (input_valid                ), //i
    .io_cmd_payload_mode    (crc32_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (input_payload_fragment     ), //i
    .io_crc                 (crc32_io_crc               ), //o
    .clk                    (clk                        ), //i
    .reset                  (reset                      )  //i
  );
  assign crc_error = 1'b0;
  always @(*) begin
    crc32_io_cmd_payload_mode = `CRCCombinationalCmdMode_binary_sequential_UPDATE;
    if(when_FiberRxPreamble_l63) begin
      crc32_io_cmd_payload_mode = `CRCCombinationalCmdMode_binary_sequential_INIT;
    end
  end

  assign when_FiberRxPreamble_l63 = (input_valid && input_payload_last);
  assign output_valid = input_valid;
  assign output_payload_last = input_payload_last;
  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = output_ready;
  assign output_enable = output_enable_1;
  assign recieve_done = input_payload_last_regNext;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      output_enable_1 <= 1'b0;
    end else begin
      if(when_FiberRxPreamble_l63) begin
        output_enable_1 <= (input_payload_fragment == crc32_io_crc);
      end else begin
        output_enable_1 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    input_payload_last_regNext <= input_payload_last;
  end


endmodule

module FiberRxPreamble (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output reg          output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               reset
);
  wire       [31:0]   startDelimiter;
  wire                input_fire;
  wire                history_0_valid;
  wire                history_0_ready;
  wire                history_0_payload_last;
  wire       [31:0]   history_0_payload_fragment;
  wire       [31:0]   historyDataCat;
  wire                hit;
  reg                 inFrame;
  wire                when_FiberRxPreamble_l31;
  wire                when_FiberRxPreamble_l38;

  assign startDelimiter = 32'h00f1f2f3;
  assign input_fire = (input_valid && input_ready);
  assign history_0_valid = input_valid;
  assign history_0_ready = input_ready;
  assign history_0_payload_last = input_payload_last;
  assign history_0_payload_fragment = input_payload_fragment;
  assign historyDataCat = history_0_payload_fragment;
  assign hit = (history_0_valid && (historyDataCat == startDelimiter));
  always @(*) begin
    output_valid = 1'b0;
    if(!when_FiberRxPreamble_l31) begin
      if(input_valid) begin
        output_valid = 1'b1;
      end
    end
  end

  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = ((! inFrame) || output_ready);
  assign output_payload_last = input_payload_last;
  assign when_FiberRxPreamble_l31 = (! inFrame);
  assign when_FiberRxPreamble_l38 = (output_ready && input_payload_last);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_FiberRxPreamble_l31) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(input_valid) begin
          if(when_FiberRxPreamble_l38) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
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
  wire                when_Stream_l933;
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
  assign when_Stream_l933 = (logic_pushing != logic_popping);
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
      if(when_Stream_l933) begin
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

module CRCCombinational (
  input               io_cmd_valid,
  input      `CRCCombinationalCmdMode_binary_sequential_type io_cmd_payload_mode,
  input      [31:0]   io_cmd_payload_data,
  output     [31:0]   io_crc,
  input               clk,
  input               reset
);
  wire                _zz_next_crc;
  wire                _zz_next_crc_1;
  wire                _zz_next_crc_2;
  wire                _zz_next_crc_3;
  wire                _zz_next_crc_4;
  wire                _zz_next_crc_5;
  wire                _zz_next_crc_6;
  wire                _zz_next_crc_7;
  wire                _zz_next_crc_8;
  wire                _zz_next_crc_9;
  wire                _zz_next_crc_10;
  wire                _zz_next_crc_11;
  wire                _zz_next_crc_12;
  wire                _zz_next_crc_13;
  wire                _zz_next_crc_14;
  wire                _zz_next_crc_15;
  wire                _zz_next_crc_16;
  wire                _zz_next_crc_17;
  wire                _zz_next_crc_18;
  wire                _zz_next_crc_19;
  wire                _zz_next_crc_20;
  wire                _zz_next_crc_21;
  wire                _zz_next_crc_22;
  wire                _zz_next_crc_23;
  wire                _zz_next_crc_24;
  wire                _zz_next_crc_25;
  wire                _zz_next_crc_26;
  wire                _zz_next_crc_27;
  wire                _zz_next_crc_28;
  wire                _zz_next_crc_29;
  wire                _zz_next_crc_30;
  wire                _zz_next_crc_31;
  wire                _zz_next_crc_32;
  wire                _zz_next_crc_33;
  wire                _zz_next_crc_34;
  wire                _zz_next_crc_35;
  wire                _zz_next_crc_36;
  wire                _zz_next_crc_37;
  wire                _zz_next_crc_38;
  wire                _zz_next_crc_39;
  wire                _zz_next_crc_40;
  wire                _zz_next_crc_41;
  wire                _zz_next_crc_42;
  wire                _zz_next_crc_43;
  wire                _zz_next_crc_44;
  wire                _zz_next_crc_45;
  wire                _zz_next_crc_46;
  wire                _zz_next_crc_47;
  wire                _zz_next_crc_48;
  wire                _zz_next_crc_49;
  wire                _zz_next_crc_50;
  wire                _zz_next_crc_51;
  wire                _zz_next_crc_52;
  wire                _zz_next_crc_53;
  wire                _zz_next_crc_54;
  wire                _zz_next_crc_55;
  wire                _zz_next_crc_56;
  wire                _zz_next_crc_57;
  wire                _zz_next_crc_58;
  wire                _zz_next_crc_59;
  wire                _zz_next_crc_60;
  wire                _zz_next_crc_61;
  wire                _zz_next_crc_62;
  wire                _zz_next_crc_63;
  wire                _zz_next_crc_64;
  wire                _zz_next_crc_65;
  wire                _zz_next_crc_66;
  wire                _zz_next_crc_67;
  wire                _zz_next_crc_68;
  wire                _zz_next_crc_69;
  reg        [31:0]   crc_reg;
  reg        [31:0]   _zz_dataIn;
  reg        [31:0]   dataIn;
  reg        [31:0]   next_crc;
  wire                when_CRCCombinational_l83;
  wire                when_CRCCombinational_l88;
  reg        [31:0]   result_reflected;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_next_crc = (((((((((dataIn[0] ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[10]) ^ dataIn[12]) ^ dataIn[16]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[28]);
  assign _zz_next_crc_1 = dataIn[29];
  assign _zz_next_crc_2 = (((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[13]) ^ dataIn[16]) ^ dataIn[17]);
  assign _zz_next_crc_3 = dataIn[24];
  assign _zz_next_crc_4 = (((((((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[2]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[24]) ^ dataIn[26]) ^ dataIn[30]) ^ dataIn[31]);
  assign _zz_next_crc_5 = crc_reg[0];
  assign _zz_next_crc_6 = (((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[25]) ^ dataIn[27]);
  assign _zz_next_crc_7 = dataIn[31];
  assign _zz_next_crc_8 = ((((((((((((((((_zz_next_crc_9 ^ _zz_next_crc_10) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[15]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[29]) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[0]);
  assign _zz_next_crc_11 = crc_reg[2];
  assign _zz_next_crc_9 = (dataIn[0] ^ dataIn[2]);
  assign _zz_next_crc_10 = dataIn[3];
  assign _zz_next_crc_12 = (((((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[13]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[24]) ^ dataIn[28]);
  assign _zz_next_crc_13 = dataIn[29];
  assign _zz_next_crc_14 = (((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[14]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[25]) ^ dataIn[29]);
  assign _zz_next_crc_15 = dataIn[30];
  assign _zz_next_crc_16 = (((((((((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[10]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[28]) ^ dataIn[29]);
  assign _zz_next_crc_17 = crc_reg[0];
  assign _zz_next_crc_18 = (((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[8]) ^ dataIn[10]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[17]) ^ dataIn[22]);
  assign _zz_next_crc_19 = dataIn[23];
  assign _zz_next_crc_20 = (((((((dataIn[1] ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[13]);
  assign _zz_next_crc_21 = dataIn[18];
  assign _zz_next_crc_22 = (((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[19]) ^ dataIn[26]);
  assign _zz_next_crc_23 = dataIn[28];
  assign _zz_next_crc_24 = ((((((((((((((((_zz_next_crc_25 ^ _zz_next_crc_26) ^ dataIn[4]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[20]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[27]) ^ dataIn[28]) ^ dataIn[31]) ^ crc_reg[0]);
  assign _zz_next_crc_27 = crc_reg[1];
  assign _zz_next_crc_25 = (dataIn[0] ^ dataIn[1]);
  assign _zz_next_crc_26 = dataIn[3];
  assign _zz_next_crc_28 = ((((((((((((((((_zz_next_crc_29 ^ _zz_next_crc_30) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[13]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[21]) ^ dataIn[24]) ^ dataIn[27]) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[0]);
  assign _zz_next_crc_31 = crc_reg[1];
  assign _zz_next_crc_29 = (dataIn[0] ^ dataIn[1]);
  assign _zz_next_crc_30 = dataIn[2];
  assign _zz_next_crc_32 = (((((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[22]) ^ dataIn[25]) ^ dataIn[28]) ^ dataIn[31]);
  assign _zz_next_crc_33 = crc_reg[1];
  assign _zz_next_crc_34 = (((((((((((((dataIn[2] ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[23]) ^ dataIn[26]);
  assign _zz_next_crc_35 = dataIn[29];
  assign _zz_next_crc_36 = (((((((((((((dataIn[3] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[18]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[24]) ^ dataIn[27]);
  assign _zz_next_crc_37 = dataIn[30];
  assign _zz_next_crc_38 = (((((((((((dataIn[0] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[8]) ^ dataIn[12]) ^ dataIn[13]) ^ dataIn[17]) ^ dataIn[19]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[24]) ^ dataIn[26]);
  assign _zz_next_crc_39 = dataIn[29];
  assign _zz_next_crc_40 = (((((((((((dataIn[1] ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[18]) ^ dataIn[20]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[25]) ^ dataIn[27]);
  assign _zz_next_crc_41 = dataIn[30];
  assign _zz_next_crc_42 = (((((((((dataIn[2] ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[19]) ^ dataIn[21]) ^ dataIn[23]) ^ dataIn[24]);
  assign _zz_next_crc_43 = dataIn[26];
  assign _zz_next_crc_44 = (((((((dataIn[3] ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[20]) ^ dataIn[22]);
  assign _zz_next_crc_45 = dataIn[24];
  assign _zz_next_crc_46 = (((((((dataIn[4] ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[21]) ^ dataIn[23]);
  assign _zz_next_crc_47 = dataIn[25];
  assign _zz_next_crc_48 = (((((((dataIn[5] ^ dataIn[9]) ^ dataIn[10]) ^ dataIn[13]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[22]) ^ dataIn[24]);
  assign _zz_next_crc_49 = dataIn[26];
  assign _zz_next_crc_50 = (((((((((((dataIn[0] ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_51 = dataIn[29];
  assign _zz_next_crc_52 = (((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_53 = dataIn[29];
  assign _zz_next_crc_54 = (((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[20]) ^ dataIn[21]);
  assign _zz_next_crc_55 = dataIn[27];
  assign _zz_next_crc_56 = (((((((((dataIn[2] ^ dataIn[3]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[21]) ^ dataIn[22]);
  assign _zz_next_crc_57 = dataIn[28];
  assign _zz_next_crc_58 = (((((((((((((dataIn[0] ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[10]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[28]);
  assign _zz_next_crc_59 = dataIn[31];
  assign _zz_next_crc_60 = (((((((((((dataIn[1] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[7]) ^ dataIn[11]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]);
  assign _zz_next_crc_61 = dataIn[27];
  assign _zz_next_crc_62 = (((((((((((dataIn[2] ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[8]) ^ dataIn[12]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_63 = dataIn[28];
  assign _zz_next_crc_64 = (((((((((((dataIn[3] ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[27]) ^ dataIn[28]);
  assign _zz_next_crc_65 = dataIn[29];
  assign _zz_next_crc_66 = (((((((((dataIn[4] ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_67 = dataIn[28];
  assign _zz_next_crc_68 = (((((((((dataIn[5] ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[15]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[27]) ^ dataIn[28]);
  assign _zz_next_crc_69 = dataIn[29];
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      `CRCCombinationalCmdMode_binary_sequential_INIT : io_cmd_payload_mode_string = "INIT  ";
      `CRCCombinationalCmdMode_binary_sequential_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_dataIn[0] = io_cmd_payload_data[31];
    _zz_dataIn[1] = io_cmd_payload_data[30];
    _zz_dataIn[2] = io_cmd_payload_data[29];
    _zz_dataIn[3] = io_cmd_payload_data[28];
    _zz_dataIn[4] = io_cmd_payload_data[27];
    _zz_dataIn[5] = io_cmd_payload_data[26];
    _zz_dataIn[6] = io_cmd_payload_data[25];
    _zz_dataIn[7] = io_cmd_payload_data[24];
    _zz_dataIn[8] = io_cmd_payload_data[23];
    _zz_dataIn[9] = io_cmd_payload_data[22];
    _zz_dataIn[10] = io_cmd_payload_data[21];
    _zz_dataIn[11] = io_cmd_payload_data[20];
    _zz_dataIn[12] = io_cmd_payload_data[19];
    _zz_dataIn[13] = io_cmd_payload_data[18];
    _zz_dataIn[14] = io_cmd_payload_data[17];
    _zz_dataIn[15] = io_cmd_payload_data[16];
    _zz_dataIn[16] = io_cmd_payload_data[15];
    _zz_dataIn[17] = io_cmd_payload_data[14];
    _zz_dataIn[18] = io_cmd_payload_data[13];
    _zz_dataIn[19] = io_cmd_payload_data[12];
    _zz_dataIn[20] = io_cmd_payload_data[11];
    _zz_dataIn[21] = io_cmd_payload_data[10];
    _zz_dataIn[22] = io_cmd_payload_data[9];
    _zz_dataIn[23] = io_cmd_payload_data[8];
    _zz_dataIn[24] = io_cmd_payload_data[7];
    _zz_dataIn[25] = io_cmd_payload_data[6];
    _zz_dataIn[26] = io_cmd_payload_data[5];
    _zz_dataIn[27] = io_cmd_payload_data[4];
    _zz_dataIn[28] = io_cmd_payload_data[3];
    _zz_dataIn[29] = io_cmd_payload_data[2];
    _zz_dataIn[30] = io_cmd_payload_data[1];
    _zz_dataIn[31] = io_cmd_payload_data[0];
  end

  always @(*) begin
    dataIn[31 : 24] = _zz_dataIn[7 : 0];
    dataIn[23 : 16] = _zz_dataIn[15 : 8];
    dataIn[15 : 8] = _zz_dataIn[23 : 16];
    dataIn[7 : 0] = _zz_dataIn[31 : 24];
  end

  always @(*) begin
    next_crc[0] = ((((((((((((((((_zz_next_crc ^ _zz_next_crc_1) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[1] = ((((((((((((((((_zz_next_crc_2 ^ _zz_next_crc_3) ^ dataIn[27]) ^ dataIn[28]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[2] = ((((((((((((((((_zz_next_crc_4 ^ _zz_next_crc_5) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[3] = ((((((((((((((((_zz_next_crc_6 ^ _zz_next_crc_7) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[4] = ((((((((((((((((_zz_next_crc_8 ^ _zz_next_crc_11) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[5] = ((((((((((((((((_zz_next_crc_12 ^ _zz_next_crc_13) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[6] = ((((((((((((((((_zz_next_crc_14 ^ _zz_next_crc_15) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[7] = ((((((((((((((((_zz_next_crc_16 ^ _zz_next_crc_17) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[8] = ((((((((((((((((_zz_next_crc_18 ^ _zz_next_crc_19) ^ dataIn[28]) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[17]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[9] = ((((((((((((((((_zz_next_crc_20 ^ _zz_next_crc_21) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[29]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[18]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[29]);
    next_crc[10] = ((((((((((((((((_zz_next_crc_22 ^ _zz_next_crc_23) ^ dataIn[29]) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[19]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[11] = ((((((((((((((((_zz_next_crc_24 ^ _zz_next_crc_27) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[12] = ((((((((((((((((_zz_next_crc_28 ^ _zz_next_crc_31) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[13] = ((((((((((((((((_zz_next_crc_32 ^ _zz_next_crc_33) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[14] = ((((((((((((((((_zz_next_crc_34 ^ _zz_next_crc_35) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[23]) ^ crc_reg[26]) ^ crc_reg[29]);
    next_crc[15] = ((((((((((((((((_zz_next_crc_36 ^ _zz_next_crc_37) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]);
    next_crc[16] = ((((((((((((((((_zz_next_crc_38 ^ _zz_next_crc_39) ^ dataIn[30]) ^ crc_reg[0]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[17] = ((((((((((((((((_zz_next_crc_40 ^ _zz_next_crc_41) ^ dataIn[31]) ^ crc_reg[1]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[18] = ((((((((((((((((_zz_next_crc_42 ^ _zz_next_crc_43) ^ dataIn[28]) ^ dataIn[31]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[19] = ((((((((((((((((_zz_next_crc_44 ^ _zz_next_crc_45) ^ dataIn[25]) ^ dataIn[27]) ^ dataIn[29]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[20] = ((((((((((((((((_zz_next_crc_46 ^ _zz_next_crc_47) ^ dataIn[26]) ^ dataIn[28]) ^ dataIn[30]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[21] = ((((((((((((((((_zz_next_crc_48 ^ _zz_next_crc_49) ^ dataIn[27]) ^ dataIn[29]) ^ dataIn[31]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[22] = ((((((((((((((((_zz_next_crc_50 ^ _zz_next_crc_51) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[23] = ((((((((((((((((_zz_next_crc_52 ^ _zz_next_crc_53) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[24] = ((((((((((((((((_zz_next_crc_54 ^ _zz_next_crc_55) ^ dataIn[28]) ^ dataIn[30]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[25] = ((((((((((((((((_zz_next_crc_56 ^ _zz_next_crc_57) ^ dataIn[29]) ^ dataIn[31]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[26] = ((((((((((((((((_zz_next_crc_58 ^ _zz_next_crc_59) ^ crc_reg[0]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[10]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[27] = ((((((((((((((((_zz_next_crc_60 ^ _zz_next_crc_61) ^ dataIn[29]) ^ crc_reg[1]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[11]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[28] = ((((((((((((((((_zz_next_crc_62 ^ _zz_next_crc_63) ^ dataIn[30]) ^ crc_reg[2]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[29] = ((((((((((((((((_zz_next_crc_64 ^ _zz_next_crc_65) ^ dataIn[31]) ^ crc_reg[3]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[30] = ((((((((((((((((_zz_next_crc_66 ^ _zz_next_crc_67) ^ dataIn[29]) ^ dataIn[30]) ^ crc_reg[4]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[31] = ((((((((((((((((_zz_next_crc_68 ^ _zz_next_crc_69) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
  end

  assign when_CRCCombinational_l83 = (io_cmd_valid && (io_cmd_payload_mode == `CRCCombinationalCmdMode_binary_sequential_INIT));
  assign when_CRCCombinational_l88 = (io_cmd_valid && (io_cmd_payload_mode == `CRCCombinationalCmdMode_binary_sequential_UPDATE));
  always @(*) begin
    result_reflected[0] = crc_reg[31];
    result_reflected[1] = crc_reg[30];
    result_reflected[2] = crc_reg[29];
    result_reflected[3] = crc_reg[28];
    result_reflected[4] = crc_reg[27];
    result_reflected[5] = crc_reg[26];
    result_reflected[6] = crc_reg[25];
    result_reflected[7] = crc_reg[24];
    result_reflected[8] = crc_reg[23];
    result_reflected[9] = crc_reg[22];
    result_reflected[10] = crc_reg[21];
    result_reflected[11] = crc_reg[20];
    result_reflected[12] = crc_reg[19];
    result_reflected[13] = crc_reg[18];
    result_reflected[14] = crc_reg[17];
    result_reflected[15] = crc_reg[16];
    result_reflected[16] = crc_reg[15];
    result_reflected[17] = crc_reg[14];
    result_reflected[18] = crc_reg[13];
    result_reflected[19] = crc_reg[12];
    result_reflected[20] = crc_reg[11];
    result_reflected[21] = crc_reg[10];
    result_reflected[22] = crc_reg[9];
    result_reflected[23] = crc_reg[8];
    result_reflected[24] = crc_reg[7];
    result_reflected[25] = crc_reg[6];
    result_reflected[26] = crc_reg[5];
    result_reflected[27] = crc_reg[4];
    result_reflected[28] = crc_reg[3];
    result_reflected[29] = crc_reg[2];
    result_reflected[30] = crc_reg[1];
    result_reflected[31] = crc_reg[0];
  end

  assign io_crc = (result_reflected ^ 32'hffffffff);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      crc_reg <= 32'hffffffff;
    end else begin
      if(when_CRCCombinational_l83) begin
        crc_reg <= 32'hffffffff;
      end
      if(when_CRCCombinational_l88) begin
        crc_reg <= next_crc;
      end
    end
  end


endmodule
