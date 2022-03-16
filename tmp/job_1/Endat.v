// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Endat

`timescale 1ns/1ps 

module Endat (
  output              endat_clk,
  input               endat_data_read,
  output              endat_data_write,
  output              endat_data_writeEnable,
  input               sample,
  input      [7:0]    endat_mode,
  output     [3:0]    currentState,
  output     [7:0]    postion,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 4'd0;
  localparam fsm_enumDef_Wait_Start = 4'd1;
  localparam fsm_enumDef_Dummy_State = 4'd2;
  localparam fsm_enumDef_Send_Mode = 4'd3;
  localparam fsm_enumDef_Wait_Mode = 4'd4;
  localparam fsm_enumDef_Read_Start = 4'd5;
  localparam fsm_enumDef_Read_postion = 4'd6;
  localparam fsm_enumDef_Read_Crc = 4'd7;
  localparam fsm_enumDef_Wait_Reset = 4'd8;

  reg                 crc5_cal_io_flush;
  reg                 crc5_cal_io_input_valid;
  reg        [0:0]    crc5_cal_io_input_payload;
  wire       [4:0]    crc5_cal_io_result;
  wire       [4:0]    crc5_cal_io_resultNext;
  wire       [2:0]    _zz_mode_out;
  wire       [8:0]    _zz_mode_out_1;
  reg        [2:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_endat_clkToogleHit;
  reg                 endat_clk_1;
  reg                 mode_out;
  reg                 write_enable;
  reg        [7:0]    buffer_1;
  reg        [4:0]    crc_1;
  reg        [4:0]    crc_caldata;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [9:0]    fsm_counter;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                when_Endat_l76;
  wire                when_Endat_l89;
  wire                when_Endat_l107;
  wire                when_Endat_l119;
  wire                when_Endat_l133;
  wire                when_Endat_l138;
  wire                when_Endat_l151;
  wire                when_Endat_l154;
  wire                when_Endat_l163;
  `ifndef SYNTHESIS
  reg [95:0] fsm_stateReg_string;
  reg [95:0] fsm_stateNext_string;
  `endif


  assign _zz_mode_out_1 = (fsm_counter >>> 1);
  assign _zz_mode_out = _zz_mode_out_1[2:0];
  Crc crc5_cal (
    .io_flush            (crc5_cal_io_flush            ), //i
    .io_input_valid      (crc5_cal_io_input_valid      ), //i
    .io_input_payload    (crc5_cal_io_input_payload    ), //i
    .io_result           (crc5_cal_io_result[4:0]      ), //o
    .io_resultNext       (crc5_cal_io_resultNext[4:0]  ), //o
    .clk                 (clk                          ), //i
    .reset               (reset                        )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT        ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start  ";
      fsm_enumDef_Dummy_State : fsm_stateReg_string = "Dummy_State ";
      fsm_enumDef_Send_Mode : fsm_stateReg_string = "Send_Mode   ";
      fsm_enumDef_Wait_Mode : fsm_stateReg_string = "Wait_Mode   ";
      fsm_enumDef_Read_Start : fsm_stateReg_string = "Read_Start  ";
      fsm_enumDef_Read_postion : fsm_stateReg_string = "Read_postion";
      fsm_enumDef_Read_Crc : fsm_stateReg_string = "Read_Crc    ";
      fsm_enumDef_Wait_Reset : fsm_stateReg_string = "Wait_Reset  ";
      default : fsm_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT        ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start  ";
      fsm_enumDef_Dummy_State : fsm_stateNext_string = "Dummy_State ";
      fsm_enumDef_Send_Mode : fsm_stateNext_string = "Send_Mode   ";
      fsm_enumDef_Wait_Mode : fsm_stateNext_string = "Wait_Mode   ";
      fsm_enumDef_Read_Start : fsm_stateNext_string = "Read_Start  ";
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
  always @(*) begin
    crc5_cal_io_flush = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(sample) begin
          crc5_cal_io_flush = 1'b1;
        end
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
      end
      fsm_enumDef_Wait_Mode : begin
      end
      fsm_enumDef_Read_Start : begin
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

  always @(*) begin
    crc5_cal_io_input_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
      end
      fsm_enumDef_Wait_Mode : begin
      end
      fsm_enumDef_Read_Start : begin
      end
      fsm_enumDef_Read_postion : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l133) begin
            crc5_cal_io_input_valid = 1'b1;
          end
        end
      end
      fsm_enumDef_Read_Crc : begin
      end
      fsm_enumDef_Wait_Reset : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    crc5_cal_io_input_payload = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
      end
      fsm_enumDef_Wait_Mode : begin
      end
      fsm_enumDef_Read_Start : begin
      end
      fsm_enumDef_Read_postion : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l133) begin
            crc5_cal_io_input_payload = endat_data_read;
          end
        end
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
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Send_Mode : begin
      end
      fsm_enumDef_Wait_Mode : begin
      end
      fsm_enumDef_Read_Start : begin
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
  assign postion = buffer_1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(sample) begin
          fsm_stateNext = fsm_enumDef_Dummy_State;
        end
      end
      fsm_enumDef_Dummy_State : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l76) begin
            fsm_stateNext = fsm_enumDef_Send_Mode;
          end
        end
      end
      fsm_enumDef_Send_Mode : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l89) begin
            fsm_stateNext = fsm_enumDef_Wait_Mode;
          end
        end
      end
      fsm_enumDef_Wait_Mode : begin
        if(when_Endat_l107) begin
          fsm_stateNext = fsm_enumDef_Read_Start;
        end
      end
      fsm_enumDef_Read_Start : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l119) begin
            fsm_stateNext = fsm_enumDef_Read_postion;
          end
        end
      end
      fsm_enumDef_Read_postion : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l138) begin
            fsm_stateNext = fsm_enumDef_Read_Crc;
          end
        end
      end
      fsm_enumDef_Read_Crc : begin
        if(timer_endat_clkToogleHit) begin
          if(when_Endat_l154) begin
            fsm_stateNext = fsm_enumDef_Wait_Reset;
          end
        end
      end
      fsm_enumDef_Wait_Reset : begin
        if(when_Endat_l163) begin
          fsm_stateNext = fsm_enumDef_Wait_Start;
        end
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

  assign when_Endat_l76 = (fsm_counter == 10'h004);
  assign when_Endat_l89 = (fsm_counter == 10'h00f);
  assign when_Endat_l107 = (endat_data_read && endat_clk_1);
  assign when_Endat_l119 = (fsm_counter == 10'h001);
  assign when_Endat_l133 = fsm_counter[0];
  assign when_Endat_l138 = (fsm_counter == 10'h00f);
  assign when_Endat_l151 = fsm_counter[0];
  assign when_Endat_l154 = (fsm_counter == 10'h009);
  assign when_Endat_l163 = (! endat_data_read);
  assign currentState = fsm_stateReg;
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 3'b001);
    if(timer_reset) begin
      timer_counter <= 3'b000;
    end
    crc_caldata <= crc5_cal_io_result;
    case(fsm_stateReg)
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
      fsm_enumDef_Wait_Mode : begin
        if(timer_endat_clkToogleHit) begin
          mode_out <= 1'b0;
        end
      end
      fsm_enumDef_Read_Start : begin
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
      endat_clk_1 <= 1'b1;
      write_enable <= 1'b0;
      buffer_1 <= 8'h0;
      crc_1 <= 5'h0;
      fsm_counter <= 10'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(sample) begin
            endat_clk_1 <= 1'b1;
            write_enable <= 1'b1;
          end
        end
        fsm_enumDef_Dummy_State : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l76) begin
              fsm_counter <= 10'h0;
            end
          end
        end
        fsm_enumDef_Send_Mode : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l89) begin
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
          if(when_Endat_l107) begin
            fsm_counter <= 10'h0;
          end
        end
        fsm_enumDef_Read_Start : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l119) begin
              fsm_counter <= 10'h0;
              write_enable <= 1'b0;
            end
          end
        end
        fsm_enumDef_Read_postion : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l133) begin
              buffer_1 <= ({endat_data_read,buffer_1} >>> 1);
            end
            if(when_Endat_l138) begin
              fsm_counter <= 10'h0;
            end
          end
        end
        fsm_enumDef_Read_Crc : begin
          if(timer_endat_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            endat_clk_1 <= (! endat_clk_1);
            if(when_Endat_l151) begin
              crc_1 <= ({endat_data_read,crc_1} >>> 1);
            end
            if(when_Endat_l154) begin
              fsm_counter <= 10'h0;
            end
          end
        end
        fsm_enumDef_Wait_Reset : begin
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Crc (
  input               io_flush,
  input               io_input_valid,
  input      [0:0]    io_input_payload,
  output     [4:0]    io_result,
  output     [4:0]    io_resultNext,
  input               clk,
  input               reset
);

  wire       [4:0]    _zz_state_1;
  reg        [4:0]    state_1;
  reg        [4:0]    state;
  wire       [4:0]    stateXor;
  wire       [4:0]    accXor;

  assign _zz_state_1 = (state <<< 1);
  always @(*) begin
    state_1 = state;
    state_1 = (_zz_state_1 ^ ((io_input_payload[0] ^ state[4]) ? 5'h05 : 5'h0));
  end

  assign stateXor = (state ^ 5'h1f);
  assign accXor = (state_1 ^ 5'h1f);
  assign io_result = {stateXor[0],{stateXor[1],{stateXor[2],{stateXor[3],stateXor[4]}}}};
  assign io_resultNext = {accXor[0],{accXor[1],{accXor[2],{accXor[3],accXor[4]}}}};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 5'h1f;
    end else begin
      if(io_input_valid) begin
        state <= state_1;
      end
      if(io_flush) begin
        state <= 5'h1f;
      end
    end
  end


endmodule
