// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : GTP_TEST
// Git hash  : e12463ecd71b83aebd7d90cc6cfe530450f7b623

`timescale 1ns/1ps 

module GTP_TEST (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready
);

  reg                 gtx_area_timer_B_io_clear;
  wire                gtx_area_gtxtest_tx_packet_req;
  wire       [31:0]   gtx_area_gtxtest_tx_packet_data;
  reg        [31:0]   _zz_gtx_area_mem_port0;
  wire                gtx_area_timer_B_io_full;
  wire       [31:0]   gtx_area_timer_B_io_value;
  wire       [31:0]   gtx_area_gtxtest_s_axi_tx_tdata;
  wire       [3:0]    gtx_area_gtxtest_s_axi_tx_tkeep;
  wire                gtx_area_gtxtest_s_axi_tx_tlast;
  wire                gtx_area_gtxtest_s_axi_tx_tvalid;
  wire       [31:0]   gtx_area_gtxtest_crc_data;
  wire       [7:0]    gtx_area_gtxtest_tx_packet_addra;
  wire                gtx_area_gtxtest_tx_packet_rden;
  wire                when_GTX_TEST_l45;
  reg                 gtx_area_timer_B_io_full_delay_1;
  reg                 gtx_area_timer_B_io_full_delay_1_1;
  reg                 gtx_area_timer_B_io_full_delay_2;
  reg                 gtx_area_timer_B_io_full_delay_1_2;
  reg                 gtx_area_timer_B_io_full_delay_2_1;
  reg                 gtx_area_timer_B_io_full_delay_3;
  wire       [7:0]    _zz_tx_packet_data;
  wire                _zz_tx_packet_data_1;
  (* ram_style = "block" *) reg [31:0] gtx_area_mem [0:255];

  initial begin
    $readmemb("GTP_TEST.v_toplevel_gtx_area_mem.bin",gtx_area_mem);
  end
  always @(posedge log_clk) begin
    if(_zz_tx_packet_data_1) begin
      _zz_gtx_area_mem_port0 <= gtx_area_mem[_zz_tx_packet_data];
    end
  end

  Timer gtx_area_timer_B (
    .io_tick      (1'b1                             ), //i
    .io_clear     (gtx_area_timer_B_io_clear        ), //i
    .io_limit     (32'h000001f4                     ), //i
    .io_full      (gtx_area_timer_B_io_full         ), //o
    .io_value     (gtx_area_timer_B_io_value[31:0]  ), //o
    .log_clk      (log_clk                          ), //i
    .log_rst_q    (log_rst_q                        )  //i
  );
  gtp_tx gtx_area_gtxtest (
    .log_rst_q            (log_rst_q                              ), //i
    .log_clk              (log_clk                                ), //i
    .s_axi_tx_tdata       (gtx_area_gtxtest_s_axi_tx_tdata[31:0]  ), //o
    .s_axi_tx_tkeep       (gtx_area_gtxtest_s_axi_tx_tkeep[3:0]   ), //o
    .s_axi_tx_tlast       (gtx_area_gtxtest_s_axi_tx_tlast        ), //o
    .s_axi_tx_tvalid      (gtx_area_gtxtest_s_axi_tx_tvalid       ), //o
    .s_axi_tx_tready      (s_axi_tx_tready                        ), //i
    .tx_packet_gtxid      (32'h00000001                           ), //i
    .tx_packet_head       (32'h0000013b                           ), //i
    .tx_packet_req        (gtx_area_gtxtest_tx_packet_req         ), //i
    .tx_packet_trigger    (1'b0                                   ), //i
    .crc_data             (gtx_area_gtxtest_crc_data[31:0]        ), //o
    .tx_packet_addra      (gtx_area_gtxtest_tx_packet_addra[7:0]  ), //o
    .tx_packet_data       (gtx_area_gtxtest_tx_packet_data[31:0]  ), //i
    .tx_packet_rden       (gtx_area_gtxtest_tx_packet_rden        )  //o
  );
  assign when_GTX_TEST_l45 = (32'h000001f4 <= gtx_area_timer_B_io_value);
  always @(*) begin
    if(when_GTX_TEST_l45) begin
      gtx_area_timer_B_io_clear = 1'b1;
    end else begin
      gtx_area_timer_B_io_clear = 1'b0;
    end
  end

  assign gtx_area_gtxtest_tx_packet_req = (((gtx_area_timer_B_io_full || gtx_area_timer_B_io_full_delay_1) || gtx_area_timer_B_io_full_delay_2) || gtx_area_timer_B_io_full_delay_3);
  assign s_axi_tx_tlast = gtx_area_gtxtest_s_axi_tx_tlast;
  assign s_axi_tx_tdata = gtx_area_gtxtest_s_axi_tx_tdata;
  assign s_axi_tx_tvalid = gtx_area_gtxtest_s_axi_tx_tvalid;
  assign _zz_tx_packet_data = gtx_area_gtxtest_tx_packet_addra;
  assign _zz_tx_packet_data_1 = (! gtx_area_gtxtest_tx_packet_rden);
  assign gtx_area_gtxtest_tx_packet_data = _zz_gtx_area_mem_port0;
  always @(posedge log_clk) begin
    gtx_area_timer_B_io_full_delay_1 <= gtx_area_timer_B_io_full;
    gtx_area_timer_B_io_full_delay_1_1 <= gtx_area_timer_B_io_full;
    gtx_area_timer_B_io_full_delay_2 <= gtx_area_timer_B_io_full_delay_1_1;
    gtx_area_timer_B_io_full_delay_1_2 <= gtx_area_timer_B_io_full;
    gtx_area_timer_B_io_full_delay_2_1 <= gtx_area_timer_B_io_full_delay_1_2;
    gtx_area_timer_B_io_full_delay_3 <= gtx_area_timer_B_io_full_delay_2_1;
  end


endmodule

module gtp_tx (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output     [3:0]    s_axi_tx_tkeep,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready,
  input      [31:0]   tx_packet_gtxid,
  input      [31:0]   tx_packet_head,
  input               tx_packet_req,
  input               tx_packet_trigger,
  output     [31:0]   crc_data,
  output     [7:0]    tx_packet_addra,
  input      [31:0]   tx_packet_data,
  output              tx_packet_rden
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;
  localparam tx_area_fsm_enumDef_BOOT = 3'd0;
  localparam tx_area_fsm_enumDef_Wait_Start = 3'd1;
  localparam tx_area_fsm_enumDef_Send_Head = 3'd2;
  localparam tx_area_fsm_enumDef_Send_Id = 3'd3;
  localparam tx_area_fsm_enumDef_Send_Length = 3'd4;
  localparam tx_area_fsm_enumDef_Send_Data = 3'd5;
  localparam tx_area_fsm_enumDef_Send_Crc = 3'd6;
  localparam tx_area_fsm_enumDef_Send_End = 3'd7;

  reg        [0:0]    tx_area_crc32_io_cmd_payload_mode;
  wire       [31:0]   tx_area_crc32_io_crc;
  wire       [31:0]   tx_area_crc32_io_nextcrc;
  wire                tx_area_streamfifo_io_push_ready;
  wire                tx_area_streamfifo_io_pop_valid;
  wire       [31:0]   tx_area_streamfifo_io_pop_payload;
  wire       [6:0]    tx_area_streamfifo_io_occupancy;
  wire       [6:0]    tx_area_streamfifo_io_availability;
  wire       [7:0]    _zz_when_gtp_tx_l95;
  reg                 tx_area_valid;
  reg                 tx_area_last;
  reg        [31:0]   tx_area_data;
  reg        [7:0]    tx_area_rd_addr;
  reg                 tx_area_rd_rden;
  reg        [7:0]    tx_area_length;
  reg                 tx_area_mode;
  wire                when_gtp_tx_l41;
  wire                tx_area_fsm_wantExit;
  reg                 tx_area_fsm_wantStart;
  wire                tx_area_fsm_wantKill;
  reg        [2:0]    tx_area_fsm_stateReg;
  reg        [2:0]    tx_area_fsm_stateNext;
  wire                when_gtp_tx_l70;
  wire                when_gtp_tx_l73;
  wire                when_gtp_tx_l95;
  `ifndef SYNTHESIS
  reg [87:0] tx_area_fsm_stateReg_string;
  reg [87:0] tx_area_fsm_stateNext_string;
  `endif


  assign _zz_when_gtp_tx_l95 = (tx_packet_head[7 : 0] - 8'h01);
  CRCCombinational tx_area_crc32 (
    .io_cmd_valid           (tx_area_valid                      ), //i
    .io_cmd_payload_mode    (tx_area_crc32_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (tx_area_data[31:0]                 ), //i
    .io_crc                 (tx_area_crc32_io_crc[31:0]         ), //o
    .io_nextcrc             (tx_area_crc32_io_nextcrc[31:0]     ), //o
    .log_clk                (log_clk                            ), //i
    .log_rst_q              (log_rst_q                          )  //i
  );
  StreamFifo tx_area_streamfifo (
    .io_push_valid      (tx_area_valid                            ), //i
    .io_push_ready      (tx_area_streamfifo_io_push_ready         ), //o
    .io_push_payload    (tx_area_data[31:0]                       ), //i
    .io_pop_valid       (tx_area_streamfifo_io_pop_valid          ), //o
    .io_pop_ready       (s_axi_tx_tready                          ), //i
    .io_pop_payload     (tx_area_streamfifo_io_pop_payload[31:0]  ), //o
    .io_flush           (1'b0                                     ), //i
    .io_occupancy       (tx_area_streamfifo_io_occupancy[6:0]     ), //o
    .io_availability    (tx_area_streamfifo_io_availability[6:0]  ), //o
    .log_clk            (log_clk                                  ), //i
    .log_rst_q          (log_rst_q                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_BOOT : tx_area_fsm_stateReg_string = "BOOT       ";
      tx_area_fsm_enumDef_Wait_Start : tx_area_fsm_stateReg_string = "Wait_Start ";
      tx_area_fsm_enumDef_Send_Head : tx_area_fsm_stateReg_string = "Send_Head  ";
      tx_area_fsm_enumDef_Send_Id : tx_area_fsm_stateReg_string = "Send_Id    ";
      tx_area_fsm_enumDef_Send_Length : tx_area_fsm_stateReg_string = "Send_Length";
      tx_area_fsm_enumDef_Send_Data : tx_area_fsm_stateReg_string = "Send_Data  ";
      tx_area_fsm_enumDef_Send_Crc : tx_area_fsm_stateReg_string = "Send_Crc   ";
      tx_area_fsm_enumDef_Send_End : tx_area_fsm_stateReg_string = "Send_End   ";
      default : tx_area_fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(tx_area_fsm_stateNext)
      tx_area_fsm_enumDef_BOOT : tx_area_fsm_stateNext_string = "BOOT       ";
      tx_area_fsm_enumDef_Wait_Start : tx_area_fsm_stateNext_string = "Wait_Start ";
      tx_area_fsm_enumDef_Send_Head : tx_area_fsm_stateNext_string = "Send_Head  ";
      tx_area_fsm_enumDef_Send_Id : tx_area_fsm_stateNext_string = "Send_Id    ";
      tx_area_fsm_enumDef_Send_Length : tx_area_fsm_stateNext_string = "Send_Length";
      tx_area_fsm_enumDef_Send_Data : tx_area_fsm_stateNext_string = "Send_Data  ";
      tx_area_fsm_enumDef_Send_Crc : tx_area_fsm_stateNext_string = "Send_Crc   ";
      tx_area_fsm_enumDef_Send_End : tx_area_fsm_stateNext_string = "Send_End   ";
      default : tx_area_fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign when_gtp_tx_l41 = (! tx_area_mode);
  always @(*) begin
    if(when_gtp_tx_l41) begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_INIT;
    end else begin
      tx_area_crc32_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
    end
  end

  assign tx_area_fsm_wantExit = 1'b0;
  always @(*) begin
    tx_area_fsm_wantStart = 1'b0;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_Wait_Start : begin
      end
      tx_area_fsm_enumDef_Send_Head : begin
      end
      tx_area_fsm_enumDef_Send_Id : begin
      end
      tx_area_fsm_enumDef_Send_Length : begin
      end
      tx_area_fsm_enumDef_Send_Data : begin
      end
      tx_area_fsm_enumDef_Send_Crc : begin
      end
      tx_area_fsm_enumDef_Send_End : begin
      end
      default : begin
        tx_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign tx_area_fsm_wantKill = 1'b0;
  assign crc_data = 32'h00001234;
  assign tx_packet_addra = tx_area_rd_addr;
  assign tx_packet_rden = tx_area_rd_rden;
  assign s_axi_tx_tkeep = 4'b1111;
  assign s_axi_tx_tdata = tx_area_streamfifo_io_pop_payload;
  assign s_axi_tx_tvalid = tx_area_streamfifo_io_pop_valid;
  assign s_axi_tx_tlast = (((tx_area_streamfifo_io_occupancy == 7'h01) && s_axi_tx_tready) && s_axi_tx_tvalid);
  always @(*) begin
    tx_area_fsm_stateNext = tx_area_fsm_stateReg;
    case(tx_area_fsm_stateReg)
      tx_area_fsm_enumDef_Wait_Start : begin
        if(tx_packet_req) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Head;
        end
      end
      tx_area_fsm_enumDef_Send_Head : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Id;
      end
      tx_area_fsm_enumDef_Send_Id : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Length;
      end
      tx_area_fsm_enumDef_Send_Length : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Data;
      end
      tx_area_fsm_enumDef_Send_Data : begin
        if(!when_gtp_tx_l95) begin
          tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_Crc;
        end
      end
      tx_area_fsm_enumDef_Send_Crc : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Send_End;
      end
      tx_area_fsm_enumDef_Send_End : begin
        tx_area_fsm_stateNext = tx_area_fsm_enumDef_Wait_Start;
      end
      default : begin
      end
    endcase
    if(tx_area_fsm_wantStart) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_Wait_Start;
    end
    if(tx_area_fsm_wantKill) begin
      tx_area_fsm_stateNext = tx_area_fsm_enumDef_BOOT;
    end
  end

  assign when_gtp_tx_l70 = (tx_packet_head[15 : 0] == 16'h0001);
  assign when_gtp_tx_l73 = (tx_packet_head[15 : 8] == 8'h0);
  assign when_gtp_tx_l95 = (tx_area_length < _zz_when_gtp_tx_l95);
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      tx_area_valid <= 1'b0;
      tx_area_last <= 1'b0;
      tx_area_data <= 32'h0;
      tx_area_rd_addr <= 8'h0;
      tx_area_rd_rden <= 1'b1;
      tx_area_length <= 8'h0;
      tx_area_mode <= 1'b0;
      tx_area_fsm_stateReg <= tx_area_fsm_enumDef_BOOT;
    end else begin
      tx_area_fsm_stateReg <= tx_area_fsm_stateNext;
      case(tx_area_fsm_stateReg)
        tx_area_fsm_enumDef_Wait_Start : begin
          tx_area_valid <= 1'b0;
          tx_area_last <= 1'b0;
        end
        tx_area_fsm_enumDef_Send_Head : begin
          tx_area_mode <= 1'b0;
          tx_area_valid <= 1'b1;
          tx_area_data <= 32'h0000ffbc;
        end
        tx_area_fsm_enumDef_Send_Id : begin
          tx_area_valid <= 1'b1;
          tx_area_mode <= 1'b1;
          tx_area_data <= tx_packet_gtxid;
          if(when_gtp_tx_l70) begin
            tx_area_rd_addr <= 8'h0;
          end else begin
            if(when_gtp_tx_l73) begin
              tx_area_rd_addr <= 8'h01;
            end else begin
              tx_area_rd_addr <= tx_packet_head[15 : 8];
            end
          end
          tx_area_rd_rden <= 1'b0;
        end
        tx_area_fsm_enumDef_Send_Length : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_head;
          tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
        end
        tx_area_fsm_enumDef_Send_Data : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_packet_data;
          if(when_gtp_tx_l95) begin
            tx_area_length <= (tx_area_length + 8'h01);
            tx_area_rd_addr <= (tx_area_rd_addr + 8'h01);
          end else begin
            tx_area_length <= 8'h0;
            tx_area_rd_addr <= 8'h0;
            tx_area_rd_rden <= 1'b1;
          end
        end
        tx_area_fsm_enumDef_Send_Crc : begin
          tx_area_valid <= 1'b1;
          tx_area_data <= tx_area_crc32_io_nextcrc;
        end
        tx_area_fsm_enumDef_Send_End : begin
          tx_area_valid <= 1'b1;
          tx_area_last <= 1'b1;
          tx_area_data <= 32'h0000ffbd;
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               log_clk,
  input               log_rst_q
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
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
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

  always @(posedge log_clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
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
  output     [6:0]    io_occupancy,
  output     [6:0]    io_availability,
  input               log_clk,
  input               log_rst_q
);

  reg        [31:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [5:0]    _zz_io_availability;
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
  (* ram_style = "block" *) reg [31:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge log_clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge log_clk) begin
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h3f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h3f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
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
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
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

module CRCCombinational (
  input               io_cmd_valid,
  input      [0:0]    io_cmd_payload_mode,
  input      [31:0]   io_cmd_payload_data,
  output     [31:0]   io_crc,
  output     [31:0]   io_nextcrc,
  input               log_clk,
  input               log_rst_q
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;

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
  reg        [31:0]   next_crc;
  wire                when_CRCCombinational_l86;
  wire                when_CRCCombinational_l91;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_next_crc = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_1 = io_cmd_payload_data[29];
  assign _zz_next_crc_2 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]);
  assign _zz_next_crc_3 = io_cmd_payload_data[24];
  assign _zz_next_crc_4 = (((((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]);
  assign _zz_next_crc_5 = crc_reg[0];
  assign _zz_next_crc_6 = (((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_7 = io_cmd_payload_data[31];
  assign _zz_next_crc_8 = ((((((((((((((((_zz_next_crc_9 ^ _zz_next_crc_10) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_11 = crc_reg[2];
  assign _zz_next_crc_9 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[2]);
  assign _zz_next_crc_10 = io_cmd_payload_data[3];
  assign _zz_next_crc_12 = (((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_13 = io_cmd_payload_data[29];
  assign _zz_next_crc_14 = (((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[29]);
  assign _zz_next_crc_15 = io_cmd_payload_data[30];
  assign _zz_next_crc_16 = (((((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[29]);
  assign _zz_next_crc_17 = crc_reg[0];
  assign _zz_next_crc_18 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_19 = io_cmd_payload_data[23];
  assign _zz_next_crc_20 = (((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]);
  assign _zz_next_crc_21 = io_cmd_payload_data[18];
  assign _zz_next_crc_22 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_23 = io_cmd_payload_data[28];
  assign _zz_next_crc_24 = ((((((((((((((((_zz_next_crc_25 ^ _zz_next_crc_26) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_27 = crc_reg[1];
  assign _zz_next_crc_25 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[1]);
  assign _zz_next_crc_26 = io_cmd_payload_data[3];
  assign _zz_next_crc_28 = ((((((((((((((((_zz_next_crc_29 ^ _zz_next_crc_30) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_31 = crc_reg[1];
  assign _zz_next_crc_29 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[1]);
  assign _zz_next_crc_30 = io_cmd_payload_data[2];
  assign _zz_next_crc_32 = (((((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]);
  assign _zz_next_crc_33 = crc_reg[1];
  assign _zz_next_crc_34 = (((((((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_35 = io_cmd_payload_data[29];
  assign _zz_next_crc_36 = (((((((((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_37 = io_cmd_payload_data[30];
  assign _zz_next_crc_38 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_39 = io_cmd_payload_data[29];
  assign _zz_next_crc_40 = (((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_41 = io_cmd_payload_data[30];
  assign _zz_next_crc_42 = (((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]);
  assign _zz_next_crc_43 = io_cmd_payload_data[26];
  assign _zz_next_crc_44 = (((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_45 = io_cmd_payload_data[24];
  assign _zz_next_crc_46 = (((((((io_cmd_payload_data[4] ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]);
  assign _zz_next_crc_47 = io_cmd_payload_data[25];
  assign _zz_next_crc_48 = (((((((io_cmd_payload_data[5] ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]);
  assign _zz_next_crc_49 = io_cmd_payload_data[26];
  assign _zz_next_crc_50 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_51 = io_cmd_payload_data[29];
  assign _zz_next_crc_52 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_53 = io_cmd_payload_data[29];
  assign _zz_next_crc_54 = (((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]);
  assign _zz_next_crc_55 = io_cmd_payload_data[27];
  assign _zz_next_crc_56 = (((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_57 = io_cmd_payload_data[28];
  assign _zz_next_crc_58 = (((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_59 = io_cmd_payload_data[31];
  assign _zz_next_crc_60 = (((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_61 = io_cmd_payload_data[27];
  assign _zz_next_crc_62 = (((((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_63 = io_cmd_payload_data[28];
  assign _zz_next_crc_64 = (((((((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_65 = io_cmd_payload_data[29];
  assign _zz_next_crc_66 = (((((((((io_cmd_payload_data[4] ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_67 = io_cmd_payload_data[28];
  assign _zz_next_crc_68 = (((((((((io_cmd_payload_data[5] ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_69 = io_cmd_payload_data[29];
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CRCCombinationalCmdMode_INIT : io_cmd_payload_mode_string = "INIT  ";
      CRCCombinationalCmdMode_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    next_crc[0] = ((((((((((((((((_zz_next_crc ^ _zz_next_crc_1) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[1] = ((((((((((((((((_zz_next_crc_2 ^ _zz_next_crc_3) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[2] = ((((((((((((((((_zz_next_crc_4 ^ _zz_next_crc_5) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[3] = ((((((((((((((((_zz_next_crc_6 ^ _zz_next_crc_7) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[4] = ((((((((((((((((_zz_next_crc_8 ^ _zz_next_crc_11) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[5] = ((((((((((((((((_zz_next_crc_12 ^ _zz_next_crc_13) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[6] = ((((((((((((((((_zz_next_crc_14 ^ _zz_next_crc_15) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[7] = ((((((((((((((((_zz_next_crc_16 ^ _zz_next_crc_17) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[8] = ((((((((((((((((_zz_next_crc_18 ^ _zz_next_crc_19) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[17]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[9] = ((((((((((((((((_zz_next_crc_20 ^ _zz_next_crc_21) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[29]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[18]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[29]);
    next_crc[10] = ((((((((((((((((_zz_next_crc_22 ^ _zz_next_crc_23) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[19]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[11] = ((((((((((((((((_zz_next_crc_24 ^ _zz_next_crc_27) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[12] = ((((((((((((((((_zz_next_crc_28 ^ _zz_next_crc_31) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[13] = ((((((((((((((((_zz_next_crc_32 ^ _zz_next_crc_33) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[14] = ((((((((((((((((_zz_next_crc_34 ^ _zz_next_crc_35) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[23]) ^ crc_reg[26]) ^ crc_reg[29]);
    next_crc[15] = ((((((((((((((((_zz_next_crc_36 ^ _zz_next_crc_37) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]);
    next_crc[16] = ((((((((((((((((_zz_next_crc_38 ^ _zz_next_crc_39) ^ io_cmd_payload_data[30]) ^ crc_reg[0]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[17] = ((((((((((((((((_zz_next_crc_40 ^ _zz_next_crc_41) ^ io_cmd_payload_data[31]) ^ crc_reg[1]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[18] = ((((((((((((((((_zz_next_crc_42 ^ _zz_next_crc_43) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[19] = ((((((((((((((((_zz_next_crc_44 ^ _zz_next_crc_45) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[29]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[20] = ((((((((((((((((_zz_next_crc_46 ^ _zz_next_crc_47) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[30]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[21] = ((((((((((((((((_zz_next_crc_48 ^ _zz_next_crc_49) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[22] = ((((((((((((((((_zz_next_crc_50 ^ _zz_next_crc_51) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[23] = ((((((((((((((((_zz_next_crc_52 ^ _zz_next_crc_53) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[24] = ((((((((((((((((_zz_next_crc_54 ^ _zz_next_crc_55) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[30]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[25] = ((((((((((((((((_zz_next_crc_56 ^ _zz_next_crc_57) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[26] = ((((((((((((((((_zz_next_crc_58 ^ _zz_next_crc_59) ^ crc_reg[0]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[10]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[27] = ((((((((((((((((_zz_next_crc_60 ^ _zz_next_crc_61) ^ io_cmd_payload_data[29]) ^ crc_reg[1]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[11]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[28] = ((((((((((((((((_zz_next_crc_62 ^ _zz_next_crc_63) ^ io_cmd_payload_data[30]) ^ crc_reg[2]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[29] = ((((((((((((((((_zz_next_crc_64 ^ _zz_next_crc_65) ^ io_cmd_payload_data[31]) ^ crc_reg[3]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[30] = ((((((((((((((((_zz_next_crc_66 ^ _zz_next_crc_67) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[30]) ^ crc_reg[4]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[31] = ((((((((((((((((_zz_next_crc_68 ^ _zz_next_crc_69) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
  end

  assign when_CRCCombinational_l86 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_INIT));
  assign when_CRCCombinational_l91 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_UPDATE));
  assign io_crc = (crc_reg ^ 32'h0);
  assign io_nextcrc = next_crc;
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
      crc_reg <= 32'hffffffff;
    end else begin
      if(when_CRCCombinational_l86) begin
        crc_reg <= 32'hffffffff;
      end
      if(when_CRCCombinational_l91) begin
        crc_reg <= next_crc;
      end
    end
  end


endmodule
