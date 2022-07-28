// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Endat
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps 

module Endat (
  output              endat_clk,
  input               endat_data_read,
  output              endat_data_write,
  output              endat_data_writeEnable,
  input               sample,
  input      [5:0]    endat_mode,
  output     [3:0]    currentState,
  output     [7:0]    postion,
  output     [4:0]    crc,
  input               clk,
  input               reset
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;
  localparam fsm_enumDef_BOOT = 4'd0;
  localparam fsm_enumDef_Init_Start = 4'd1;
  localparam fsm_enumDef_Endat_Init = 4'd2;
  localparam fsm_enumDef_Init_Done = 4'd3;
  localparam fsm_enumDef_Wait_Start = 4'd4;
  localparam fsm_enumDef_Dummy_State = 4'd5;
  localparam fsm_enumDef_Send_Mode = 4'd6;
  localparam fsm_enumDef_Two_Cycle = 4'd7;
  localparam fsm_enumDef_Wait_Mode = 4'd8;
  localparam fsm_enumDef_Read_Start = 4'd9;
  localparam fsm_enumDef_Read_F1 = 4'd10;
  localparam fsm_enumDef_Read_postion = 4'd11;
  localparam fsm_enumDef_Read_Crc = 4'd12;
  localparam fsm_enumDef_Wait_Reset = 4'd13;

  reg                 init_timer_io_clear;
  reg        [0:0]    crc_cal_io_cmd_payload_mode;
  wire                init_timer_io_full;
  wire       [31:0]   init_timer_io_value;
  wire       [4:0]    crc_cal_io_crc;
  wire       [4:0]    crc_cal_io_nextcrc;
  wire       [2:0]    _zz_mode_out;
  wire       [2:0]    _zz_mode_out_1;
  wire       [8:0]    _zz_mode_out_2;
  wire       [5:0]    _zz_crc_1;
  reg        [2:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_endat_clkToogleHit;
  reg                 init_timer_tick;
  reg        [31:0]   init_timer_limit;
  wire                when_Endat_l49;
  reg                 endat_clk_1;
  reg                 mode_out;
  reg                 write_enable;
  reg        [7:0]    buffer_1;
  reg        [7:0]    postion_1;
  reg        [4:0]    crc_1;
  reg                 endat_rddata;
  reg        [4:0]    crc_caldata;
  reg                 crc_valid;
  reg        [0:0]    crc_payload;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [9:0]    fsm_counter;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_Endat_l96;
  wire                when_Endat_l132;
  wire                when_Endat_l147;
  wire                when_Endat_l164;
  reg                 endat_rddata_regNext;
  wire                when_Endat_l180;
  wire                when_Endat_l192;
  wire                when_Endat_l211;
  wire                when_Endat_l230;
  wire                when_Endat_l235;
  wire                when_Endat_l252;
  wire                when_Endat_l255;
  wire                when_Endat_l265;
  `ifndef SYNTHESIS
  reg [95:0] fsm_stateReg_string;
  reg [95:0] fsm_stateNext_string;
  `endif


  assign _zz_mode_out = (3'b101 - _zz_mode_out_1);
  assign _zz_mode_out_2 = (fsm_counter >>> 1);
  assign _zz_mode_out_1 = _zz_mode_out_2[2:0];
  assign _zz_crc_1 = {crc_1,endat_rddata};
  Timer init_timer (
    .io_tick     (init_timer_tick            ), //i
    .io_clear    (init_timer_io_clear        ), //i
    .io_limit    (init_timer_limit[31:0]     ), //i
    .io_full     (init_timer_io_full         ), //o
    .io_value    (init_timer_io_value[31:0]  ), //o
    .clk         (clk                        ), //i
    .reset       (reset                      )  //i
  );
  CRCCombinational crc_cal (
    .io_cmd_valid           (crc_valid                    ), //i
    .io_cmd_payload_mode    (crc_cal_io_cmd_payload_mode  ), //i
    .io_cmd_payload_data    (crc_payload                  ), //i
    .io_crc                 (crc_cal_io_crc[4:0]          ), //o
    .io_nextcrc             (crc_cal_io_nextcrc[4:0]      ), //o
    .clk                    (clk                          ), //i
    .reset                  (reset                        )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT        ";
      fsm_enumDef_Init_Start : fsm_stateReg_string = "Init_Start  ";
      fsm_enumDef_Endat_Init : fsm_stateReg_string = "Endat_Init  ";
      fsm_enumDef_Init_Done : fsm_stateReg_string = "Init_Done   ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start  ";
      fsm_enumDef_Dummy_State : fsm_stateReg_string = "Dummy_State ";
      fsm_enumDef_Send_Mode : fsm_stateReg_string = "Send_Mode   ";
      fsm_enumDef_Two_Cycle : fsm_stateReg_string = "Two_Cycle   ";
      fsm_enumDef_Wait_Mode : fsm_stateReg_string = "Wait_Mode   ";
      fsm_enumDef_Read_Start : fsm_stateReg_string = "Read_Start  ";
      fsm_enumDef_Read_F1 : fsm_stateReg_string = "Read_F1     ";
      fsm_enumDef_Read_postion : fsm_stateReg_string = "Read_postion";
      fsm_enumDef_Read_Crc : fsm_stateReg_string = "Read_Crc    ";
      fsm_enumDef_Wait_Reset : fsm_stateReg_string = "Wait_Reset  ";
      default : fsm_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT        ";
      fsm_enumDef_Init_Start : fsm_stateNext_string = "Init_Start  ";
      fsm_enumDef_Endat_Init : fsm_stateNext_string = "Endat_Init  ";
      fsm_enumDef_Init_Done : fsm_stateNext_string = "Init_Done   ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start  ";
      fsm_enumDef_Dummy_State : fsm_stateNext_string = "Dummy_State ";
      fsm_enumDef_Send_Mode : fsm_stateNext_string = "Send_Mode   ";
      fsm_enumDef_Two_Cycle : fsm_stateNext_string = "Two_Cycle   ";
      fsm_enumDef_Wait_Mode : fsm_stateNext_string = "Wait_Mode   ";
      fsm_enumDef_Read_Start : fsm_stateNext_string = "Read_Start  ";
      fsm_enumDef_Read_F1 : fsm_stateNext_string = "Read_F1     ";
      fsm_enumDef_Read_postion : fsm_stateNext_string = "Read_postion";
      fsm_enumDef_Read_Crc : fsm_stateNext_string = "Read_Crc    ";
      fsm_enumDef_Wait_Reset : fsm_stateNext_string = "Wait_Reset  ";
      default : fsm_stateNext_string = "????????????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init_Start : begin
      end
      fsm_enumDef_Endat_Init : begin
      end
      fsm_enumDef_Init_Done : begin
      end
      fsm_enumDef_Wait_Start : begin
        if(sample) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Dummy_State : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Send_Mode : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Two_Cycle : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Wait_Mode : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Read_Start : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Read_F1 : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Read_postion : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Read_Crc : begin
        if(timer_endat_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Wait_Reset : begin
      end
      default : begin
      end
    endcase
  end

  assign timer_endat_clkToogleHit = (timer_counter == 3'b100);
  assign when_Endat_l49 = (init_timer_limit <= init_timer_io_value);
  always @(*) begin
    if(when_Endat_l49) begin
      init_timer_io_clear = 1'b1;
    end else begin
      init_timer_io_clear = 1'b0;
    end
  end

  always @(*) begin
    crc_cal_io_cmd_payload_mode = CRCCombinationalCmdMode_INIT;
    case(fsm_stateReg)
      fsm_enumDef_Init_Start : begin
      end
      fsm_enumDef_Endat_Init : begin
      end
      fsm_enumDef_Init_Done : begin
      end
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
      end
      fsm_enumDef_Two_Cycle : begin
      end
      fsm_enumDef_Wait_Mode : begin
      end
      fsm_enumDef_Read_Start : begin
      end
      fsm_enumDef_Read_F1 : begin
        crc_cal_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
      end
      fsm_enumDef_Read_postion : begin
        crc_cal_io_cmd_payload_mode = CRCCombinationalCmdMode_UPDATE;
      end
      fsm_enumDef_Read_Crc : begin
      end
      fsm_enumDef_Wait_Reset : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Init_Start : begin
      end
      fsm_enumDef_Endat_Init : begin
      end
      fsm_enumDef_Init_Done : begin
      end
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
      end
      fsm_enumDef_Two_Cycle : begin
      end
      fsm_enumDef_Wait_Mode : begin
      end
      fsm_enumDef_Read_Start : begin
      end
      fsm_enumDef_Read_F1 : begin
      end
      fsm_enumDef_Read_postion : begin
      end
      fsm_enumDef_Read_Crc : begin
      end
      fsm_enumDef_Wait_Reset : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign endat_clk = endat_clk_1;
  assign endat_data_write = mode_out;
  assign endat_data_writeEnable = write_enable;
  assign postion = postion_1;
  assign crc = crc_1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Init_Start : begin
        if(init_timer_io_full) begin
          fsm_stateNext = fsm_enumDef_Endat_Init;
        end
      end
      fsm_enumDef_Endat_Init : begin
        if(when_Endat_l96) begin
          fsm_stateNext = fsm_enumDef_Init_Done;
        end
      end
      fsm_enumDef_Init_Done : begin
        if(init_timer_io_full) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      fsm_enumDef_Wait_Start : begin
        if(sample) begin
          fsm_stateNext = fsm_enumDef_Dummy_State;
        end
      end
      fsm_enumDef_Dummy_State : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l132) begin
            fsm_stateNext = fsm_enumDef_Send_Mode;
          end
        end
      end
      fsm_enumDef_Send_Mode : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l147) begin
            fsm_stateNext = fsm_enumDef_Two_Cycle;
          end
        end
      end
      fsm_enumDef_Two_Cycle : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l164) begin
            fsm_stateNext = fsm_enumDef_Wait_Mode;
          end
        end
      end
      fsm_enumDef_Wait_Mode : begin
        if(when_Endat_l180) begin
          fsm_stateNext = fsm_enumDef_Read_Start;
        end
      end
      fsm_enumDef_Read_Start : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l192) begin
            fsm_stateNext = fsm_enumDef_Read_F1;
          end
        end
      end
      fsm_enumDef_Read_F1 : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l211) begin
            fsm_stateNext = fsm_enumDef_Read_postion;
          end
        end
      end
      fsm_enumDef_Read_postion : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l235) begin
            fsm_stateNext = fsm_enumDef_Read_Crc;
          end
        end
      end
      fsm_enumDef_Read_Crc : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l255) begin
            fsm_stateNext = fsm_enumDef_Wait_Reset;
          end
        end
      end
      fsm_enumDef_Wait_Reset : begin
        if(when_Endat_l265) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Init_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_Endat_l96 = (10'h00a < fsm_counter);
  assign when_Endat_l132 = (fsm_counter == 10'h004);
  assign when_Endat_l147 = (fsm_counter == 10'h00b);
  assign when_Endat_l164 = (fsm_counter == 10'h003);
  assign when_Endat_l180 = ((endat_rddata && (! endat_rddata_regNext)) && endat_clk_1);
  assign when_Endat_l192 = (fsm_counter == 10'h001);
  assign when_Endat_l211 = (fsm_counter == 10'h001);
  assign when_Endat_l230 = (! fsm_counter[0]);
  assign when_Endat_l235 = (fsm_counter == 10'h00f);
  assign when_Endat_l252 = fsm_counter[0];
  assign when_Endat_l255 = (fsm_counter == 10'h009);
  assign when_Endat_l265 = (10'h1f4 < fsm_counter);
  assign currentState = fsm_stateReg;
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 3'b001);
    if(timer_reset) begin
      timer_counter <= 3'b000;
    end
    case(fsm_stateReg)
      fsm_enumDef_Init_Start : begin
      end
      fsm_enumDef_Endat_Init : begin
      end
      fsm_enumDef_Init_Done : begin
      end
      fsm_enumDef_Wait_Start : begin
        if(sample) begin
          mode_out <= 1'b0;
        end
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
        mode_out <= endat_mode[_zz_mode_out];
      end
      fsm_enumDef_Two_Cycle : begin
        mode_out <= 1'b0;
      end
      fsm_enumDef_Wait_Mode : begin
        if(timer_endat_clkToogleHit) begin
          mode_out <= 1'b0;
        end
      end
      fsm_enumDef_Read_Start : begin
      end
      fsm_enumDef_Read_F1 : begin
      end
      fsm_enumDef_Read_postion : begin
      end
      fsm_enumDef_Read_Crc : begin
      end
      fsm_enumDef_Wait_Reset : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      init_timer_tick <= 1'b0;
      init_timer_limit <= 32'h0;
      endat_clk_1 <= 1'b1;
      write_enable <= 1'b0;
      buffer_1 <= 8'h0;
      postion_1 <= 8'h0;
      crc_1 <= 5'h0;
      endat_rddata <= 1'b0;
      crc_valid <= 1'b0;
      crc_payload <= 1'b0;
      fsm_counter <= 10'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      endat_rddata <= endat_data_read;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Init_Start : begin
          init_timer_tick <= 1'b1;
          init_timer_limit <= 32'h00000014;
          endat_clk_1 <= 1'b1;
          fsm_counter <= 10'h0;
          if(init_timer_io_full) begin
            init_timer_tick <= 1'b0;
            endat_clk_1 <= 1'b0;
          end
        end
        fsm_enumDef_Endat_Init : begin
          fsm_counter <= (fsm_counter + 10'h001);
          if(when_Endat_l96) begin
            endat_clk_1 <= 1'b1;
            fsm_counter <= 10'h0;
            init_timer_tick <= 1'b1;
            init_timer_limit <= 32'h00000014;
          end
        end
        fsm_enumDef_Init_Done : begin
          if(init_timer_io_full) begin
            init_timer_tick <= 1'b0;
          end
        end
        fsm_enumDef_Wait_Start : begin
          if(sample) begin
            endat_clk_1 <= 1'b1;
            write_enable <= 1'b0;
            crc_valid <= 1'b0;
          end
        end
        fsm_enumDef_Dummy_State : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l132) begin
              write_enable <= 1'b1;
              fsm_counter <= 10'h0;
            end
          end
        end
        fsm_enumDef_Send_Mode : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            buffer_1 <= 8'h0;
            if(when_Endat_l147) begin
              fsm_counter <= 10'h0;
              write_enable <= 1'b0;
            end
          end
        end
        fsm_enumDef_Two_Cycle : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l164) begin
              fsm_counter <= 10'h0;
              write_enable <= 1'b0;
            end
          end
        end
        fsm_enumDef_Wait_Mode : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
          end
          if(when_Endat_l180) begin
            fsm_counter <= 10'h0;
          end
        end
        fsm_enumDef_Read_Start : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l192) begin
              fsm_counter <= 10'h0;
              write_enable <= 1'b0;
            end else begin
              crc_valid <= 1'b1;
            end
          end else begin
            crc_valid <= 1'b0;
          end
        end
        fsm_enumDef_Read_F1 : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l211) begin
              fsm_counter <= 10'h0;
              write_enable <= 1'b0;
            end else begin
              crc_valid <= 1'b1;
            end
          end else begin
            crc_valid <= 1'b0;
          end
        end
        fsm_enumDef_Read_postion : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l230) begin
              buffer_1 <= ({endat_rddata,buffer_1} >>> 1);
              crc_valid <= 1'b1;
              crc_payload <= endat_rddata;
            end
            if(when_Endat_l235) begin
              fsm_counter <= 10'h0;
              crc_1 <= 5'h0;
            end
          end else begin
            crc_valid <= 1'b0;
          end
        end
        fsm_enumDef_Read_Crc : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            postion_1 <= buffer_1;
            if(when_Endat_l252) begin
              crc_1 <= _zz_crc_1[4:0];
            end
            if(when_Endat_l255) begin
              fsm_counter <= 10'h0;
            end
          end
        end
        fsm_enumDef_Wait_Reset : begin
          fsm_counter <= (fsm_counter + 10'h001);
          if(when_Endat_l265) begin
            fsm_counter <= 10'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      endat_rddata_regNext <= 1'b0;
    end else begin
      endat_rddata_regNext <= endat_rddata;
    end
  end


endmodule

module CRCCombinational (
  input               io_cmd_valid,
  input      [0:0]    io_cmd_payload_mode,
  input      [0:0]    io_cmd_payload_data,
  output     [4:0]    io_crc,
  output     [4:0]    io_nextcrc,
  input               clk,
  input               reset
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;

  reg        [4:0]    crc_reg;
  reg        [4:0]    next_crc;
  wire                when_CRCCombinational_l86;
  wire                when_CRCCombinational_l91;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


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
    next_crc[0] = (io_cmd_payload_data[0] ^ crc_reg[4]);
    next_crc[1] = ((io_cmd_payload_data[0] ^ crc_reg[0]) ^ crc_reg[4]);
    next_crc[2] = crc_reg[1];
    next_crc[3] = ((io_cmd_payload_data[0] ^ crc_reg[2]) ^ crc_reg[4]);
    next_crc[4] = crc_reg[3];
  end

  assign when_CRCCombinational_l86 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_INIT));
  assign when_CRCCombinational_l91 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_UPDATE));
  assign io_crc = (crc_reg ^ 5'h1f);
  assign io_nextcrc = next_crc;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      crc_reg <= 5'h1f;
    end else begin
      if(when_CRCCombinational_l86) begin
        crc_reg <= 5'h1f;
      end
      if(when_CRCCombinational_l91) begin
        crc_reg <= next_crc;
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
