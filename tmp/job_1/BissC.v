// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : BissC

`timescale 1ns/1ps 

module BissC (
  input               s_bissc_clk,
  output              s_bissc_data,
  input      [39:0]   m_postion,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_Wait_Start = 3'd1;
  localparam fsm_enumDef_Slo = 3'd2;
  localparam fsm_enumDef_Ack = 3'd3;
  localparam fsm_enumDef_Start = 3'd4;
  localparam fsm_enumDef_Zero = 3'd5;
  localparam fsm_enumDef_PostionOut = 3'd6;
  localparam fsm_enumDef_TimeOut = 3'd7;

  wire       [5:0]    _zz_bisscdata;
  wire       [5:0]    _zz_bisscdata_1;
  wire       [5:0]    _zz_bisscdata_2;
  wire       [5:0]    _zz_bisscdata_3;
  reg                 bisscdata;
  reg        [5:0]    clkrise_cnt;
  reg        [7:0]    timeout_cnt;
  reg        [39:0]   postion_reg;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 s_bissc_clk_regNext;
  wire                when_BissC_l32;
  reg                 s_bissc_clk_regNext_1;
  wire                when_BissC_l42;
  wire                when_BissC_l44;
  reg                 s_bissc_clk_regNext_2;
  wire                when_BissC_l54;
  wire                when_BissC_l56;
  reg                 s_bissc_clk_regNext_3;
  wire                when_BissC_l66;
  reg                 s_bissc_clk_regNext_4;
  wire                when_BissC_l74;
  reg                 s_bissc_clk_regNext_5;
  wire                when_BissC_l83;
  wire                when_BissC_l86;
  wire                when_BissC_l96;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_bisscdata = (_zz_bisscdata_1 - 6'h01);
  assign _zz_bisscdata_1 = (6'h28 - clkrise_cnt);
  assign _zz_bisscdata_2 = (_zz_bisscdata_3 - 6'h01);
  assign _zz_bisscdata_3 = (6'h28 - clkrise_cnt);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_Slo : fsm_stateReg_string = "Slo       ";
      fsm_enumDef_Ack : fsm_stateReg_string = "Ack       ";
      fsm_enumDef_Start : fsm_stateReg_string = "Start     ";
      fsm_enumDef_Zero : fsm_stateReg_string = "Zero      ";
      fsm_enumDef_PostionOut : fsm_stateReg_string = "PostionOut";
      fsm_enumDef_TimeOut : fsm_stateReg_string = "TimeOut   ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_Slo : fsm_stateNext_string = "Slo       ";
      fsm_enumDef_Ack : fsm_stateNext_string = "Ack       ";
      fsm_enumDef_Start : fsm_stateNext_string = "Start     ";
      fsm_enumDef_Zero : fsm_stateNext_string = "Zero      ";
      fsm_enumDef_PostionOut : fsm_stateNext_string = "PostionOut";
      fsm_enumDef_TimeOut : fsm_stateNext_string = "TimeOut   ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Slo : begin
      end
      fsm_enumDef_Ack : begin
      end
      fsm_enumDef_Start : begin
      end
      fsm_enumDef_Zero : begin
      end
      fsm_enumDef_PostionOut : begin
      end
      fsm_enumDef_TimeOut : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign s_bissc_data = bisscdata;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(when_BissC_l32) begin
          fsm_stateNext = fsm_enumDef_Slo;
        end
      end
      fsm_enumDef_Slo : begin
        if(when_BissC_l42) begin
          if(when_BissC_l44) begin
            fsm_stateNext = fsm_enumDef_Ack;
          end
        end
      end
      fsm_enumDef_Ack : begin
        if(when_BissC_l54) begin
          if(when_BissC_l56) begin
            fsm_stateNext = fsm_enumDef_Start;
          end
        end
      end
      fsm_enumDef_Start : begin
        if(when_BissC_l66) begin
          fsm_stateNext = fsm_enumDef_Zero;
        end
      end
      fsm_enumDef_Zero : begin
        if(when_BissC_l74) begin
          fsm_stateNext = fsm_enumDef_PostionOut;
        end
      end
      fsm_enumDef_PostionOut : begin
        if(when_BissC_l83) begin
          if(when_BissC_l86) begin
            fsm_stateNext = fsm_enumDef_TimeOut;
          end
        end
      end
      fsm_enumDef_TimeOut : begin
        if(when_BissC_l96) begin
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

  assign when_BissC_l32 = ((! s_bissc_clk) && s_bissc_clk_regNext);
  assign when_BissC_l42 = (s_bissc_clk && (! s_bissc_clk_regNext_1));
  assign when_BissC_l44 = (clkrise_cnt == 6'h01);
  assign when_BissC_l54 = (s_bissc_clk && (! s_bissc_clk_regNext_2));
  assign when_BissC_l56 = (clkrise_cnt == 6'h02);
  assign when_BissC_l66 = (s_bissc_clk && (! s_bissc_clk_regNext_3));
  assign when_BissC_l74 = (s_bissc_clk && (! s_bissc_clk_regNext_4));
  assign when_BissC_l83 = (s_bissc_clk && (! s_bissc_clk_regNext_5));
  assign when_BissC_l86 = (clkrise_cnt == 6'h28);
  assign when_BissC_l96 = (timeout_cnt == 8'h64);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bisscdata <= 1'b1;
      clkrise_cnt <= 6'h0;
      timeout_cnt <= 8'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(when_BissC_l32) begin
            bisscdata <= 1'b1;
            clkrise_cnt <= 6'h0;
          end
        end
        fsm_enumDef_Slo : begin
          if(when_BissC_l42) begin
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l44) begin
              bisscdata <= 1'b0;
              clkrise_cnt <= 6'h0;
            end
          end
        end
        fsm_enumDef_Ack : begin
          if(when_BissC_l54) begin
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            if(when_BissC_l56) begin
              bisscdata <= 1'b1;
              clkrise_cnt <= 6'h0;
            end
          end
        end
        fsm_enumDef_Start : begin
          if(when_BissC_l66) begin
            bisscdata <= 1'b0;
          end
        end
        fsm_enumDef_Zero : begin
          if(when_BissC_l74) begin
            bisscdata <= postion_reg[_zz_bisscdata];
            clkrise_cnt <= (clkrise_cnt + 6'h01);
          end
        end
        fsm_enumDef_PostionOut : begin
          if(when_BissC_l83) begin
            clkrise_cnt <= (clkrise_cnt + 6'h01);
            bisscdata <= postion_reg[_zz_bisscdata_2];
            if(when_BissC_l86) begin
              bisscdata <= 1'b0;
            end
          end
        end
        fsm_enumDef_TimeOut : begin
          timeout_cnt <= (timeout_cnt + 8'h01);
          if(when_BissC_l96) begin
            bisscdata <= 1'b1;
            timeout_cnt <= 8'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    s_bissc_clk_regNext <= s_bissc_clk;
  end

  always @(posedge clk) begin
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(when_BissC_l32) begin
          postion_reg <= m_postion;
        end
      end
      fsm_enumDef_Slo : begin
      end
      fsm_enumDef_Ack : begin
      end
      fsm_enumDef_Start : begin
      end
      fsm_enumDef_Zero : begin
      end
      fsm_enumDef_PostionOut : begin
      end
      fsm_enumDef_TimeOut : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk) begin
    s_bissc_clk_regNext_1 <= s_bissc_clk;
  end

  always @(posedge clk) begin
    s_bissc_clk_regNext_2 <= s_bissc_clk;
  end

  always @(posedge clk) begin
    s_bissc_clk_regNext_3 <= s_bissc_clk;
  end

  always @(posedge clk) begin
    s_bissc_clk_regNext_4 <= s_bissc_clk;
  end

  always @(posedge clk) begin
    s_bissc_clk_regNext_5 <= s_bissc_clk;
  end


endmodule
