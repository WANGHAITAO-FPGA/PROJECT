// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : SSI
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module SSI (
  output              ssi_clk,
  output              ssi_ss,
  input               ssi_data,
  input               ssi_en,
  input               sample,
  output     [31:0]   postion,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_Wait_Start = 3'd1;
  localparam fsm_enumDef_Dummy_State = 3'd2;
  localparam fsm_enumDef_Get_Data = 3'd3;
  localparam fsm_enumDef_Wait_State = 3'd4;
  localparam fsm_enumDef_Wait_Time = 3'd5;

  wire       [32:0]   _zz_buffer_1;
  reg        [2:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_ssi_clkToogleHit;
  reg                 ssi_clk_1;
  reg                 ss;
  reg        [31:0]   buffer_1;
  reg        [31:0]   postion_1;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [9:0]    fsm_counter;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_SSI_l75;
  wire                when_SSI_l78;
  wire                when_SSI_l100;
  `ifndef SYNTHESIS
  reg [87:0] fsm_stateReg_string;
  reg [87:0] fsm_stateNext_string;
  `endif


  assign _zz_buffer_1 = {buffer_1,ssi_data};
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT       ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start ";
      fsm_enumDef_Dummy_State : fsm_stateReg_string = "Dummy_State";
      fsm_enumDef_Get_Data : fsm_stateReg_string = "Get_Data   ";
      fsm_enumDef_Wait_State : fsm_stateReg_string = "Wait_State ";
      fsm_enumDef_Wait_Time : fsm_stateReg_string = "Wait_Time  ";
      default : fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT       ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start ";
      fsm_enumDef_Dummy_State : fsm_stateNext_string = "Dummy_State";
      fsm_enumDef_Get_Data : fsm_stateNext_string = "Get_Data   ";
      fsm_enumDef_Wait_State : fsm_stateNext_string = "Wait_State ";
      fsm_enumDef_Wait_Time : fsm_stateNext_string = "Wait_Time  ";
      default : fsm_stateNext_string = "???????????";
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
        if(timer_ssi_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(timer_ssi_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Wait_State : begin
        if(timer_ssi_clkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Wait_Time : begin
      end
      default : begin
      end
    endcase
  end

  assign timer_ssi_clkToogleHit = (timer_counter == 3'b100);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Dummy_State : begin
      end
      fsm_enumDef_Get_Data : begin
      end
      fsm_enumDef_Wait_State : begin
      end
      fsm_enumDef_Wait_Time : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign ssi_clk = ssi_clk_1;
  assign postion = postion_1;
  assign ssi_ss = ss;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(sample) begin
          fsm_stateNext = fsm_enumDef_Dummy_State;
        end
      end
      fsm_enumDef_Dummy_State : begin
        if(timer_ssi_clkToogleHit) begin
          fsm_stateNext = fsm_enumDef_Get_Data;
        end
      end
      fsm_enumDef_Get_Data : begin
        if(timer_ssi_clkToogleHit) begin
          if(when_SSI_l78) begin
            fsm_stateNext = fsm_enumDef_Wait_State;
          end
        end
      end
      fsm_enumDef_Wait_State : begin
        if(timer_ssi_clkToogleHit) begin
          fsm_stateNext = fsm_enumDef_Wait_Time;
        end
      end
      fsm_enumDef_Wait_Time : begin
        if(when_SSI_l100) begin
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

  assign when_SSI_l75 = fsm_counter[0];
  assign when_SSI_l78 = (fsm_counter == 10'h03f);
  assign when_SSI_l100 = (fsm_counter == 10'h1f4);
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 3'b001);
    if(timer_reset) begin
      timer_counter <= 3'b000;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ssi_clk_1 <= 1'b1;
      ss <= 1'b1;
      buffer_1 <= 32'h0;
      postion_1 <= 32'h0;
      fsm_counter <= 10'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(sample) begin
            ssi_clk_1 <= 1'b1;
            fsm_counter <= 10'h0;
            buffer_1 <= 32'h0;
            ss <= 1'b0;
          end else begin
            ss <= 1'b1;
          end
        end
        fsm_enumDef_Dummy_State : begin
          if(timer_ssi_clkToogleHit) begin
            ssi_clk_1 <= (! ssi_clk_1);
          end
        end
        fsm_enumDef_Get_Data : begin
          if(timer_ssi_clkToogleHit) begin
            fsm_counter <= (fsm_counter + 10'h001);
            ssi_clk_1 <= (! ssi_clk_1);
            if(when_SSI_l75) begin
              buffer_1 <= _zz_buffer_1[31:0];
            end
            if(when_SSI_l78) begin
              fsm_counter <= 10'h0;
            end
          end
        end
        fsm_enumDef_Wait_State : begin
          if(timer_ssi_clkToogleHit) begin
            ssi_clk_1 <= (! ssi_clk_1);
            postion_1 <= buffer_1;
          end
        end
        fsm_enumDef_Wait_Time : begin
          ssi_clk_1 <= 1'b1;
          fsm_counter <= (fsm_counter + 10'h001);
          ss <= 1'b1;
          if(when_SSI_l100) begin
            fsm_counter <= 10'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule
