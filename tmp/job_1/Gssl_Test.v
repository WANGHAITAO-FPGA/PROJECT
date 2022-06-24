// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Gssl_Test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Gssl_Test (
  input               intput_valid,
  output              intput_ready,
  input               intput_payload_last,
  input      [31:0]   intput_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               clk,
  input               reset
);

  wire                tx_simplebus_output_valid;
  wire                tx_simplebus_output_payload_last;
  wire       [31:0]   tx_simplebus_output_payload_fragment;
  wire                tx_simplebus_RENABLE;
  wire       [7:0]    tx_simplebus_RADDR;
  wire                rx_simplebus_input_ready;
  wire       [7:0]    rx_simplebus_waddr;
  wire       [31:0]   rx_simplebus_wdata;
  wire                rx_simplebus_wenable;
  wire       [31:0]   test_regif_1_simplebus_RDATA;

  Test_TxSimpleBus tx_simplebus (
    .output_valid               (tx_simplebus_output_valid                   ), //o
    .output_ready               (output_ready                                ), //i
    .output_payload_last        (tx_simplebus_output_payload_last            ), //o
    .output_payload_fragment    (tx_simplebus_output_payload_fragment[31:0]  ), //o
    .RENABLE                    (tx_simplebus_RENABLE                        ), //o
    .RADDR                      (tx_simplebus_RADDR[7:0]                     ), //o
    .RDATA                      (test_regif_1_simplebus_RDATA[31:0]          ), //i
    .timer_tick                 (1'b1                                        ), //i
    .clk                        (clk                                         ), //i
    .reset                      (reset                                       )  //i
  );
  SdacRxSimpleBus rx_simplebus (
    .input_valid               (intput_valid                   ), //i
    .input_ready               (rx_simplebus_input_ready       ), //o
    .input_payload_last        (intput_payload_last            ), //i
    .input_payload_fragment    (intput_payload_fragment[31:0]  ), //i
    .waddr                     (rx_simplebus_waddr[7:0]        ), //o
    .wdata                     (rx_simplebus_wdata[31:0]       ), //o
    .wenable                   (rx_simplebus_wenable           ), //o
    .clk                       (clk                            ), //i
    .reset                     (reset                          )  //i
  );
  Test_Regif test_regif_1 (
    .simplebus_RADDR      (tx_simplebus_RADDR[7:0]             ), //i
    .simplebus_RDATA      (test_regif_1_simplebus_RDATA[31:0]  ), //o
    .simplebus_RENABLE    (tx_simplebus_RENABLE                ), //i
    .simplebus_WADDR      (rx_simplebus_waddr[7:0]             ), //i
    .simplebus_WDATA      (rx_simplebus_wdata[31:0]            ), //i
    .simplebus_WENABLE    (rx_simplebus_wenable                ), //i
    .clk                  (clk                                 ), //i
    .reset                (reset                               )  //i
  );
  assign output_valid = tx_simplebus_output_valid;
  assign output_payload_last = tx_simplebus_output_payload_last;
  assign output_payload_fragment = tx_simplebus_output_payload_fragment;
  assign intput_ready = rx_simplebus_input_ready;

endmodule

module Test_Regif (
  input      [7:0]    simplebus_RADDR,
  output     [31:0]   simplebus_RDATA,
  input               simplebus_RENABLE,
  input      [7:0]    simplebus_WADDR,
  input      [31:0]   simplebus_WDATA,
  input               simplebus_WENABLE,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire       [31:0]   HEADER;
  wire       [31:0]   Slaveid;
  wire       [31:0]   Address;
  wire       [31:0]   Data1;
  wire       [31:0]   Data2;
  wire       [31:0]   Data3;
  wire       [31:0]   Data4;
  wire       [31:0]   Data5;
  wire       [31:0]   Data6;
  wire       [31:0]   E_Data1;
  wire       [31:0]   E_Data2;
  wire       [31:0]   E_Data3;
  wire       [31:0]   E_Data4;
  wire       [31:0]   E_Data5;
  wire       [31:0]   E_Data6;
  wire       [31:0]   Crc;
  wire       [31:0]   End_1;

  assign simplebus_RDATA = busslave_readData;
  assign HEADER = 32'h0000ffbc;
  assign Slaveid = 32'h00000001;
  assign Address = 32'h0000001c;
  assign Data1 = 32'h01030000;
  assign Data2 = 32'h0001840a;
  assign Data3 = 32'h0;
  assign Data4 = 32'h0;
  assign Data5 = 32'h0;
  assign Data6 = 32'h000000b1;
  assign E_Data1 = 32'h01030000;
  assign E_Data2 = 32'h0001840a;
  assign E_Data3 = 32'h0;
  assign E_Data4 = 32'h0;
  assign E_Data5 = 32'h0;
  assign E_Data6 = 32'h000000b1;
  assign Crc = 32'h01a2a3a4;
  assign End_1 = 32'h0000ffbd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
    end else begin
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          8'h0 : begin
            busslave_readData <= HEADER;
            busslave_readError <= 1'b0;
          end
          8'h04 : begin
            busslave_readData <= Slaveid;
            busslave_readError <= 1'b0;
          end
          8'h08 : begin
            busslave_readData <= Address;
            busslave_readError <= 1'b0;
          end
          8'h28 : begin
            busslave_readData <= Data1;
            busslave_readError <= 1'b0;
          end
          8'h2c : begin
            busslave_readData <= Data2;
            busslave_readError <= 1'b0;
          end
          8'h30 : begin
            busslave_readData <= Data3;
            busslave_readError <= 1'b0;
          end
          8'h34 : begin
            busslave_readData <= Data4;
            busslave_readError <= 1'b0;
          end
          8'h38 : begin
            busslave_readData <= Data5;
            busslave_readError <= 1'b0;
          end
          8'h3c : begin
            busslave_readData <= Data6;
            busslave_readError <= 1'b0;
          end
          8'h68 : begin
            busslave_readData <= E_Data1;
            busslave_readError <= 1'b0;
          end
          8'h6c : begin
            busslave_readData <= E_Data2;
            busslave_readError <= 1'b0;
          end
          8'h70 : begin
            busslave_readData <= E_Data3;
            busslave_readError <= 1'b0;
          end
          8'h74 : begin
            busslave_readData <= E_Data4;
            busslave_readError <= 1'b0;
          end
          8'h78 : begin
            busslave_readData <= E_Data5;
            busslave_readError <= 1'b0;
          end
          8'h7c : begin
            busslave_readData <= E_Data6;
            busslave_readError <= 1'b0;
          end
          8'h80 : begin
            busslave_readData <= Crc;
            busslave_readError <= 1'b0;
          end
          8'h84 : begin
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

module SdacRxSimpleBus (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output     [7:0]    waddr,
  output     [31:0]   wdata,
  output              wenable,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_1_BOOT = 2'd0;
  localparam fsm_enumDef_1_Get_Header = 2'd1;
  localparam fsm_enumDef_1_Get_Data = 2'd2;

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
  wire                when_SdacRxPreamble_l67;
  wire                when_SdacRxPreamble_l73;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_waddr = ({2'd0,waddr_1} <<< 2);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_1_Get_Header : fsm_stateReg_string = "Get_Header";
      fsm_enumDef_1_Get_Data : fsm_stateReg_string = "Get_Data  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_1_Get_Header : fsm_stateNext_string = "Get_Header";
      fsm_enumDef_1_Get_Data : fsm_stateNext_string = "Get_Data  ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Get_Header : begin
      end
      fsm_enumDef_1_Get_Data : begin
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
      fsm_enumDef_1_Get_Header : begin
        if(input_valid) begin
          fsm_stateNext = fsm_enumDef_1_Get_Data;
        end
      end
      fsm_enumDef_1_Get_Data : begin
        if(when_SdacRxPreamble_l67) begin
          fsm_stateNext = fsm_enumDef_1_Get_Header;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_Get_Header;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_SdacRxPreamble_l67 = (input_valid && input_payload_last);
  assign when_SdacRxPreamble_l73 = (! flag);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      wenable_1 <= 1'b0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Get_Header : begin
        end
        fsm_enumDef_1_Get_Data : begin
          if(when_SdacRxPreamble_l67) begin
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
      fsm_enumDef_1_Get_Header : begin
        if(input_valid) begin
          waddr_1 <= 8'h03;
          flag <= 1'b0;
        end
      end
      fsm_enumDef_1_Get_Data : begin
        if(!when_SdacRxPreamble_l67) begin
          if(input_valid) begin
            wdata_1 <= input_payload_fragment;
            if(when_SdacRxPreamble_l73) begin
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

module Test_TxSimpleBus (
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  output              RENABLE,
  output     [7:0]    RADDR,
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
  wire       [5:0]    streamfifo_1_io_occupancy;
  wire       [5:0]    streamfifo_1_io_availability;
  reg                 RENABLE_1;
  reg        [7:0]    RADDR_1;
  reg        [31:0]   RDATA_1;
  reg        [7:0]    send_length;
  wire                when_Gssl_Test_l31;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_1_regNext;
  wire                output_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_Gssl_Test_l55;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  Timer timer_1 (
    .io_tick     (timer_tick              ), //i
    .io_clear    (timer_1_io_clear        ), //i
    .io_limit    (32'h000003e8            ), //i
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
    .io_occupancy       (streamfifo_1_io_occupancy[5:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[5:0]  ), //o
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

  assign when_Gssl_Test_l31 = (32'h000003e8 <= timer_1_io_value);
  always @(*) begin
    if(when_Gssl_Test_l31) begin
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
  assign output_payload_last = ((streamfifo_1_io_occupancy == 6'h01) && output_fire);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(timer_1_io_full) begin
          fsm_stateNext = fsm_enumDef_Send_Data;
        end
      end
      fsm_enumDef_Send_Data : begin
        if(when_Gssl_Test_l55) begin
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

  assign when_Gssl_Test_l55 = (send_length == 8'h21);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      RENABLE_1 <= 1'b0;
      RADDR_1 <= 8'h0;
      send_length <= 8'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(timer_1_io_full) begin
            RADDR_1 <= 8'h0;
            RENABLE_1 <= 1'b1;
            send_length <= 8'h0;
          end
        end
        fsm_enumDef_Send_Data : begin
          RADDR_1 <= (RADDR_1 + 8'h04);
          send_length <= (send_length + 8'h01);
          if(when_Gssl_Test_l55) begin
            RENABLE_1 <= 1'b0;
          end
        end
        fsm_enumDef_End_1 : begin
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

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  input               io_flush,
  output reg [5:0]    io_occupancy,
  output reg [5:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [5:0]    _zz_io_occupancy;
  wire       [5:0]    _zz_io_availability;
  wire       [5:0]    _zz_io_availability_1;
  wire       [5:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
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
  wire       [5:0]    logic_ptrDif;
  (* ram_style = "block" *) reg [31:0] logic_ram [0:33];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (6'h22 + logic_ptrDif);
  assign _zz_io_availability = (6'h22 + _zz_io_availability_1);
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h21);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 6'h0;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h21);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 6'h0;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
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
      io_occupancy = (logic_risingOccupancy ? 6'h22 : 6'h0);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 6'h0 : 6'h22);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
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
