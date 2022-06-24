// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Phpa_Hssl
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Phpa_Hssl (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  input      [31:0]   slaveid,
  input      [31:0]   endcoder_value_in_0,
  input      [31:0]   endcoder_value_in_1,
  output     [31:0]   endcoder_value_out_0,
  output     [31:0]   endcoder_value_out_1,
  input               clk,
  input               reset
);

  wire                phpaRxPreamble_input_ready;
  wire                phpaRxPreamble_output_valid;
  wire                phpaRxPreamble_output_payload_last;
  wire       [31:0]   phpaRxPreamble_output_payload_fragment;
  wire                phparxsimplebus_1_input_ready;
  wire       [7:0]    phparxsimplebus_1_waddr;
  wire       [31:0]   phparxsimplebus_1_wdata;
  wire                phparxsimplebus_1_wenable;
  wire                phpatxsimplebus_output_valid;
  wire                phpatxsimplebus_output_payload_last;
  wire       [31:0]   phpatxsimplebus_output_payload_fragment;
  wire                phpatxsimplebus_RENABLE;
  wire       [7:0]    phpatxsimplebus_RADDR;
  wire       [31:0]   phparegif_simplebus_RDATA;
  wire       [31:0]   phparegif_endcoder_value_out_0;
  wire       [31:0]   phparegif_endcoder_value_out_1;

  SdacRxPreamble phpaRxPreamble (
    .input_valid                (input_valid                                   ), //i
    .input_ready                (phpaRxPreamble_input_ready                    ), //o
    .input_payload_last         (input_payload_last                            ), //i
    .input_payload_fragment     (input_payload_fragment[31:0]                  ), //i
    .slave_id                   (slaveid[31:0]                                 ), //i
    .output_valid               (phpaRxPreamble_output_valid                   ), //o
    .output_ready               (phparxsimplebus_1_input_ready                 ), //i
    .output_payload_last        (phpaRxPreamble_output_payload_last            ), //o
    .output_payload_fragment    (phpaRxPreamble_output_payload_fragment[31:0]  ), //o
    .clk                        (clk                                           ), //i
    .reset                      (reset                                         )  //i
  );
  PhpaRxSimpleBus phparxsimplebus_1 (
    .input_valid               (phpaRxPreamble_output_valid                   ), //i
    .input_ready               (phparxsimplebus_1_input_ready                 ), //o
    .input_payload_last        (phpaRxPreamble_output_payload_last            ), //i
    .input_payload_fragment    (phpaRxPreamble_output_payload_fragment[31:0]  ), //i
    .waddr                     (phparxsimplebus_1_waddr[7:0]                  ), //o
    .wdata                     (phparxsimplebus_1_wdata[31:0]                 ), //o
    .wenable                   (phparxsimplebus_1_wenable                     ), //o
    .clk                       (clk                                           ), //i
    .reset                     (reset                                         )  //i
  );
  SdacTxSimpleBus phpatxsimplebus (
    .output_valid               (phpatxsimplebus_output_valid                   ), //o
    .output_ready               (output_ready                                   ), //i
    .output_payload_last        (phpatxsimplebus_output_payload_last            ), //o
    .output_payload_fragment    (phpatxsimplebus_output_payload_fragment[31:0]  ), //o
    .RENABLE                    (phpatxsimplebus_RENABLE                        ), //o
    .RADDR                      (phpatxsimplebus_RADDR[7:0]                     ), //o
    .RDATA                      (phparegif_simplebus_RDATA[31:0]                ), //i
    .timer_tick                 (1'b1                                           ), //i
    .clk                        (clk                                            ), //i
    .reset                      (reset                                          )  //i
  );
  Phpa_Reg phparegif (
    .simplebus_RADDR         (phpatxsimplebus_RADDR[7:0]            ), //i
    .simplebus_RDATA         (phparegif_simplebus_RDATA[31:0]       ), //o
    .simplebus_RENABLE       (phpatxsimplebus_RENABLE               ), //i
    .simplebus_WADDR         (phparxsimplebus_1_waddr[7:0]          ), //i
    .simplebus_WDATA         (phparxsimplebus_1_wdata[31:0]         ), //i
    .simplebus_WENABLE       (phparxsimplebus_1_wenable             ), //i
    .slaveid                 (slaveid[31:0]                         ), //i
    .endcoder_value_in_0     (endcoder_value_in_0[31:0]             ), //i
    .endcoder_value_in_1     (endcoder_value_in_1[31:0]             ), //i
    .endcoder_value_out_0    (phparegif_endcoder_value_out_0[31:0]  ), //o
    .endcoder_value_out_1    (phparegif_endcoder_value_out_1[31:0]  ), //o
    .clk                     (clk                                   ), //i
    .reset                   (reset                                 )  //i
  );
  assign input_ready = phpaRxPreamble_input_ready;
  assign output_valid = phpatxsimplebus_output_valid;
  assign output_payload_last = phpatxsimplebus_output_payload_last;
  assign output_payload_fragment = phpatxsimplebus_output_payload_fragment;
  assign endcoder_value_out_0 = phparegif_endcoder_value_out_0;
  assign endcoder_value_out_1 = phparegif_endcoder_value_out_1;

endmodule

module Phpa_Reg (
  (* keep = "true" *) input      [7:0]    simplebus_RADDR,
  (* keep = "true" *) output     [31:0]   simplebus_RDATA,
  (* keep = "true" *) input               simplebus_RENABLE,
  (* keep = "true" *) input      [7:0]    simplebus_WADDR,
  (* keep = "true" *) input      [31:0]   simplebus_WDATA,
  (* keep = "true" *) input               simplebus_WENABLE,
  (* keep = "true" *) input      [31:0]   slaveid,
  (* keep = "true" *) input      [31:0]   endcoder_value_in_0,
  (* keep = "true" *) input      [31:0]   endcoder_value_in_1,
  (* keep = "true" *) output     [31:0]   endcoder_value_out_0,
  (* keep = "true" *) output     [31:0]   endcoder_value_out_1,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire       [31:0]   HEADER;
  wire       [31:0]   Slaveid_1;
  wire       [31:0]   VERSION;
  wire       [31:0]   Encoder1;
  wire       [31:0]   Encoder2;
  wire                when_RegInst_l153;
  reg        [31:0]   Encoder3;
  wire                when_RegInst_l153_1;
  reg        [31:0]   Encoder4;
  wire       [31:0]   End_1;

  assign simplebus_RDATA = busslave_readData;
  assign HEADER = 32'h00f1f2f3;
  assign Slaveid_1 = slaveid;
  assign VERSION = 32'h07e6060d;
  assign Encoder1 = endcoder_value_in_0;
  assign Encoder2 = endcoder_value_in_1;
  assign when_RegInst_l153 = ((simplebus_WADDR == 8'h14) && simplebus_WENABLE);
  assign endcoder_value_out_0 = Encoder3;
  assign when_RegInst_l153_1 = ((simplebus_WADDR == 8'h18) && simplebus_WENABLE);
  assign endcoder_value_out_1 = Encoder4;
  assign End_1 = 32'h0000ffbd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
      Encoder3 <= 32'h0;
      Encoder4 <= 32'h0;
    end else begin
      if(when_RegInst_l153) begin
        Encoder3 <= simplebus_WDATA[31 : 0];
      end
      if(when_RegInst_l153_1) begin
        Encoder4 <= simplebus_WDATA[31 : 0];
      end
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          8'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          8'h04 : begin
            busslave_readData <= Slaveid_1;
            busslave_readError <= 1'b0;
          end
          8'h08 : begin
            busslave_readData <= VERSION;
            busslave_readError <= 1'b0;
          end
          8'h0c : begin
            busslave_readData <= Encoder1;
            busslave_readError <= 1'b0;
          end
          8'h10 : begin
            busslave_readData <= Encoder2;
            busslave_readError <= 1'b0;
          end
          8'h14 : begin
            busslave_readData <= Encoder3;
            busslave_readError <= 1'b0;
          end
          8'h18 : begin
            busslave_readData <= Encoder4;
            busslave_readError <= 1'b0;
          end
          8'h1c : begin
            busslave_readData <= End_1;
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


endmodule

module SdacTxSimpleBus (
  (* keep = "true" *) output              output_valid,
  (* keep = "true" *) input               output_ready,
  (* keep = "true" *) output              output_payload_last,
  (* keep = "true" *) output     [31:0]   output_payload_fragment,
  (* keep = "true" *) output              RENABLE,
  (* keep = "true" *) output     [7:0]    RADDR,
  (* keep = "true" *) input      [31:0]   RDATA,
  (* keep = "true" *) input               timer_tick,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_1_BOOT = 2'd0;
  localparam fsm_enumDef_1_Wait_Start = 2'd1;
  localparam fsm_enumDef_1_Send_Data = 2'd2;
  localparam fsm_enumDef_1_End_1 = 2'd3;

  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire                streamfifo_1_io_push_ready;
  wire                streamfifo_1_io_pop_valid;
  wire       [31:0]   streamfifo_1_io_pop_payload;
  wire       [3:0]    streamfifo_1_io_occupancy;
  wire       [3:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [7:0]    RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [7:0]    send_length;
  wire                when_SdacTxSimpleBus_l30;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_SdacTxSimpleBus_l54;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  Timer timer_1 (
    .io_tick     (timer_tick              ), //i
    .io_clear    (timer_1_io_clear        ), //i
    .io_limit    (32'h000001f4            ), //i
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
    .io_occupancy       (streamfifo_1_io_occupancy[3:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[3:0]  ), //o
    .clk                (clk                                ), //i
    .reset              (reset                              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_1_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_1_Send_Data : fsm_stateReg_string = "Send_Data ";
      fsm_enumDef_1_End_1 : fsm_stateReg_string = "End_1     ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_1_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_1_Send_Data : fsm_stateNext_string = "Send_Data ";
      fsm_enumDef_1_End_1 : fsm_stateNext_string = "End_1     ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign when_SdacTxSimpleBus_l30 = (32'h000001f4 <= timer_1_io_value);
  always @(*) begin
    if(when_SdacTxSimpleBus_l30) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
      end
      fsm_enumDef_1_Send_Data : begin
      end
      fsm_enumDef_1_End_1 : begin
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
  assign output_payload_last = ((streamfifo_1_io_occupancy == 4'b0001) && output_fire);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = fsm_enumDef_1_Send_Data;
        end
      end
      fsm_enumDef_1_Send_Data : begin
        if(when_SdacTxSimpleBus_l54) begin
          fsm_stateNext = fsm_enumDef_1_End_1;
        end
      end
      fsm_enumDef_1_End_1 : begin
        fsm_stateNext = fsm_enumDef_1_Wait_Start;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_SdacTxSimpleBus_l54 = (send_length == 8'h07);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 8'h0;
      send_length <= 8'h0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 8'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 8'h0;
          end
        end
        fsm_enumDef_1_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 8'h04);
          send_length <= (send_length + 8'h01);
          if(when_SdacTxSimpleBus_l54) begin
            RENABLE_1 <= 1'b0;
          end
        end
        fsm_enumDef_1_End_1 : begin
          send_length <= 8'h0;
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

module PhpaRxSimpleBus (
  (* keep = "true" *) input               input_valid,
  (* keep = "true" *) output              input_ready,
  (* keep = "true" *) input               input_payload_last,
  (* keep = "true" *) input      [31:0]   input_payload_fragment,
  (* keep = "true" *) output     [7:0]    waddr,
  (* keep = "true" *) output     [31:0]   wdata,
  (* keep = "true" *) output              wenable,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Get_Version = 2'd1;
  localparam fsm_enumDef_Get_Data = 2'd2;

  wire       [9:0]    _zz_waddr;
  reg        [7:0]    waddr_1;
  reg        [31:0]   wdata_1;
  reg                 wenable_1;
  reg                 flag;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_Phpa_Reg_l83;
  wire                when_Phpa_Reg_l89;
  `ifndef SYNTHESIS
  reg [87:0] fsm_stateReg_string;
  reg [87:0] fsm_stateNext_string;
  `endif


  assign _zz_waddr = ({2'd0,waddr_1} <<< 2);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT       ";
      fsm_enumDef_Get_Version : fsm_stateReg_string = "Get_Version";
      fsm_enumDef_Get_Data : fsm_stateReg_string = "Get_Data   ";
      default : fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT       ";
      fsm_enumDef_Get_Version : fsm_stateNext_string = "Get_Version";
      fsm_enumDef_Get_Data : fsm_stateNext_string = "Get_Data   ";
      default : fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Get_Version : begin
      end
      fsm_enumDef_Get_Data : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign waddr = _zz_waddr[7:0];
  assign wenable = wenable_1;
  assign wdata = wdata_1;
  assign input_ready = 1'b1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Get_Version : begin
        if(input_valid) begin
          fsm_stateNext = fsm_enumDef_Get_Data;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(when_Phpa_Reg_l83) begin
          fsm_stateNext = fsm_enumDef_Get_Version;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Get_Version;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_Phpa_Reg_l83 = (input_valid && input_payload_last);
  assign when_Phpa_Reg_l89 = (! flag);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      wenable_1 <= 1'b0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Get_Version : begin
        end
        fsm_enumDef_Get_Data : begin
          if(when_Phpa_Reg_l83) begin
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
      fsm_enumDef_Get_Version : begin
        if(input_valid) begin
          waddr_1 <= 8'h05;
          flag <= 1'b0;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(!when_Phpa_Reg_l83) begin
          if(input_valid) begin
            wdata_1 <= input_payload_fragment;
            if(when_Phpa_Reg_l89) begin
              flag <= 1'b1;
            end else begin
              waddr_1 <= (waddr_1 + 8'h01);
            end
          end
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module SdacRxPreamble (
  (* keep = "true" *) input               input_valid,
  (* keep = "true" *) output              input_ready,
  (* keep = "true" *) input               input_payload_last,
  (* keep = "true" *) input      [31:0]   input_payload_fragment,
  (* keep = "true" *) input      [31:0]   slave_id,
  (* keep = "true" *) output reg          output_valid,
  (* keep = "true" *) input               output_ready,
  (* keep = "true" *) output              output_payload_last,
  (* keep = "true" *) output     [31:0]   output_payload_fragment,
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
  wire                when_SdacRxPreamble_l27;
  wire                when_SdacRxPreamble_l34;

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
    if(!when_SdacRxPreamble_l27) begin
      if(input_valid) begin
        output_valid = 1'b1;
      end
    end
  end

  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = ((! inFrame) || output_ready);
  assign output_payload_last = input_payload_last;
  assign when_SdacRxPreamble_l27 = (! inFrame);
  assign when_SdacRxPreamble_l34 = (output_ready && input_payload_last);
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
      if(when_SdacRxPreamble_l27) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(input_valid) begin
          if(when_SdacRxPreamble_l34) begin
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
  output     [3:0]    io_occupancy,
  output     [3:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [2:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
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
  wire       [2:0]    logic_ptrDif;
  (* ram_style = "block" *) reg [31:0] logic_ram [0:7];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
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
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
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
