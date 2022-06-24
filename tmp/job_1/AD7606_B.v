// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : AD7606_B
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module AD7606_B (
  input      [15:0]   ad_port_data,
  input               ad_port_busy,
  input               ad_port_frstdata,
  output     [2:0]    ad_port_os,
  output              ad_port_cs,
  output              ad_port_rd,
  output              ad_port_reset,
  output              ad_port_convst,
  output              ad_port_range,
  output              ad_port_wr,
  input               sample_en,
  output     [15:0]   sample_data_0,
  output     [15:0]   sample_data_1,
  output     [15:0]   sample_data_2,
  output     [15:0]   sample_data_3,
  output     [15:0]   sample_data_4,
  output     [15:0]   sample_data_5,
  output     [15:0]   sample_data_6,
  output     [15:0]   sample_data_7,
  input               clk,
  input               reset
);
  localparam sample_area_fsm_enumDef_BOOT = 4'd0;
  localparam sample_area_fsm_enumDef_Wait_Start = 4'd1;
  localparam sample_area_fsm_enumDef_Convst_State = 4'd2;
  localparam sample_area_fsm_enumDef_Wait_Busy = 4'd3;
  localparam sample_area_fsm_enumDef_CsRd_State = 4'd4;
  localparam sample_area_fsm_enumDef_Wait_Frstdata = 4'd5;
  localparam sample_area_fsm_enumDef_Rd_Data_Low = 4'd6;
  localparam sample_area_fsm_enumDef_Rd_Data_High = 4'd7;
  localparam sample_area_fsm_enumDef_Wait_Dummy = 4'd8;

  wire       [2:0]    _zz__zz_1;
  wire       [2:0]    _zz__zz_2;
  reg                 sample_clk;
  reg        [2:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_sample_clkToogleHit;
  reg                 sample_area_cs;
  reg                 sample_area_rd;
  reg                 sample_area_convst;
  reg        [5:0]    sample_area_counter;
  reg        [15:0]   sample_area_data_0;
  reg        [15:0]   sample_area_data_1;
  reg        [15:0]   sample_area_data_2;
  reg        [15:0]   sample_area_data_3;
  reg        [15:0]   sample_area_data_4;
  reg        [15:0]   sample_area_data_5;
  reg        [15:0]   sample_area_data_6;
  reg        [15:0]   sample_area_data_7;
  reg        [3:0]    sample_area_i;
  wire                sample_area_fsm_wantExit;
  reg                 sample_area_fsm_wantStart;
  wire                sample_area_fsm_wantKill;
  reg        [3:0]    sample_area_fsm_stateReg;
  reg        [3:0]    sample_area_fsm_stateNext;
  wire                when_AD7606_B_l69;
  wire                when_AD7606_B_l71;
  wire                when_AD7606_B_l73;
  wire                when_AD7606_B_l81;
  wire       [7:0]    _zz_1;
  wire                when_AD7606_B_l112;
  wire       [7:0]    _zz_2;
  wire                when_AD7606_B_l126;
  `ifndef SYNTHESIS
  reg [103:0] sample_area_fsm_stateReg_string;
  reg [103:0] sample_area_fsm_stateNext_string;
  `endif


  assign _zz__zz_1 = sample_area_i[2:0];
  assign _zz__zz_2 = sample_area_i[2:0];
  `ifndef SYNTHESIS
  always @(*) begin
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_BOOT : sample_area_fsm_stateReg_string = "BOOT         ";
      sample_area_fsm_enumDef_Wait_Start : sample_area_fsm_stateReg_string = "Wait_Start   ";
      sample_area_fsm_enumDef_Convst_State : sample_area_fsm_stateReg_string = "Convst_State ";
      sample_area_fsm_enumDef_Wait_Busy : sample_area_fsm_stateReg_string = "Wait_Busy    ";
      sample_area_fsm_enumDef_CsRd_State : sample_area_fsm_stateReg_string = "CsRd_State   ";
      sample_area_fsm_enumDef_Wait_Frstdata : sample_area_fsm_stateReg_string = "Wait_Frstdata";
      sample_area_fsm_enumDef_Rd_Data_Low : sample_area_fsm_stateReg_string = "Rd_Data_Low  ";
      sample_area_fsm_enumDef_Rd_Data_High : sample_area_fsm_stateReg_string = "Rd_Data_High ";
      sample_area_fsm_enumDef_Wait_Dummy : sample_area_fsm_stateReg_string = "Wait_Dummy   ";
      default : sample_area_fsm_stateReg_string = "?????????????";
    endcase
  end
  always @(*) begin
    case(sample_area_fsm_stateNext)
      sample_area_fsm_enumDef_BOOT : sample_area_fsm_stateNext_string = "BOOT         ";
      sample_area_fsm_enumDef_Wait_Start : sample_area_fsm_stateNext_string = "Wait_Start   ";
      sample_area_fsm_enumDef_Convst_State : sample_area_fsm_stateNext_string = "Convst_State ";
      sample_area_fsm_enumDef_Wait_Busy : sample_area_fsm_stateNext_string = "Wait_Busy    ";
      sample_area_fsm_enumDef_CsRd_State : sample_area_fsm_stateNext_string = "CsRd_State   ";
      sample_area_fsm_enumDef_Wait_Frstdata : sample_area_fsm_stateNext_string = "Wait_Frstdata";
      sample_area_fsm_enumDef_Rd_Data_Low : sample_area_fsm_stateNext_string = "Rd_Data_Low  ";
      sample_area_fsm_enumDef_Rd_Data_High : sample_area_fsm_stateNext_string = "Rd_Data_High ";
      sample_area_fsm_enumDef_Wait_Dummy : sample_area_fsm_stateNext_string = "Wait_Dummy   ";
      default : sample_area_fsm_stateNext_string = "?????????????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    if(timer_sample_clkToogleHit) begin
      timer_reset = 1'b1;
    end
  end

  assign timer_sample_clkToogleHit = (timer_counter == 3'b100);
  assign sample_area_fsm_wantExit = 1'b0;
  always @(*) begin
    sample_area_fsm_wantStart = 1'b0;
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_Wait_Start : begin
      end
      sample_area_fsm_enumDef_Convst_State : begin
      end
      sample_area_fsm_enumDef_Wait_Busy : begin
      end
      sample_area_fsm_enumDef_CsRd_State : begin
      end
      sample_area_fsm_enumDef_Wait_Frstdata : begin
      end
      sample_area_fsm_enumDef_Rd_Data_Low : begin
      end
      sample_area_fsm_enumDef_Rd_Data_High : begin
      end
      sample_area_fsm_enumDef_Wait_Dummy : begin
      end
      default : begin
        sample_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign sample_area_fsm_wantKill = 1'b0;
  assign ad_port_cs = sample_area_cs;
  assign ad_port_rd = sample_area_rd;
  assign ad_port_convst = sample_area_convst;
  assign sample_data_0 = sample_area_data_0;
  assign sample_data_1 = sample_area_data_1;
  assign sample_data_2 = sample_area_data_2;
  assign sample_data_3 = sample_area_data_3;
  assign sample_data_4 = sample_area_data_4;
  assign sample_data_5 = sample_area_data_5;
  assign sample_data_6 = sample_area_data_6;
  assign sample_data_7 = sample_area_data_7;
  assign ad_port_os = 3'b000;
  assign ad_port_wr = 1'b1;
  assign ad_port_range = 1'b1;
  assign ad_port_reset = 1'b0;
  always @(*) begin
    sample_area_fsm_stateNext = sample_area_fsm_stateReg;
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_Wait_Start : begin
        if(sample_en) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Convst_State;
        end
      end
      sample_area_fsm_enumDef_Convst_State : begin
        if(!when_AD7606_B_l69) begin
          if(!when_AD7606_B_l71) begin
            if(when_AD7606_B_l73) begin
              sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Busy;
            end
          end
        end
      end
      sample_area_fsm_enumDef_Wait_Busy : begin
        if(when_AD7606_B_l81) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_CsRd_State;
        end
      end
      sample_area_fsm_enumDef_CsRd_State : begin
        sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Frstdata;
      end
      sample_area_fsm_enumDef_Wait_Frstdata : begin
        if(ad_port_frstdata) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Rd_Data_Low;
        end
      end
      sample_area_fsm_enumDef_Rd_Data_Low : begin
        sample_area_fsm_stateNext = sample_area_fsm_enumDef_Rd_Data_High;
      end
      sample_area_fsm_enumDef_Rd_Data_High : begin
        if(when_AD7606_B_l112) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Rd_Data_Low;
        end else begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Dummy;
        end
      end
      sample_area_fsm_enumDef_Wait_Dummy : begin
        if(when_AD7606_B_l126) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Start;
        end
      end
      default : begin
      end
    endcase
    if(sample_area_fsm_wantStart) begin
      sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Start;
    end
    if(sample_area_fsm_wantKill) begin
      sample_area_fsm_stateNext = sample_area_fsm_enumDef_BOOT;
    end
  end

  assign when_AD7606_B_l69 = (sample_area_counter == 6'h05);
  assign when_AD7606_B_l71 = (sample_area_counter == 6'h07);
  assign when_AD7606_B_l73 = (sample_area_counter == 6'h0c);
  assign when_AD7606_B_l81 = (! ad_port_busy);
  assign _zz_1 = ({7'd0,1'b1} <<< _zz__zz_1);
  assign when_AD7606_B_l112 = (sample_area_i < 4'b1000);
  assign _zz_2 = ({7'd0,1'b1} <<< _zz__zz_2);
  assign when_AD7606_B_l126 = (6'h14 <= sample_area_counter);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      sample_clk <= 1'b0;
      timer_counter <= 3'b000;
    end else begin
      timer_counter <= (timer_counter + 3'b001);
      if(timer_reset) begin
        timer_counter <= 3'b000;
      end
      if(timer_sample_clkToogleHit) begin
        sample_clk <= (! sample_clk);
      end
    end
  end

  always @(posedge sample_clk or posedge reset) begin
    if(reset) begin
      sample_area_cs <= 1'b1;
      sample_area_rd <= 1'b1;
      sample_area_convst <= 1'b1;
      sample_area_counter <= 6'h0;
      sample_area_i <= 4'b0000;
      sample_area_fsm_stateReg <= sample_area_fsm_enumDef_BOOT;
    end else begin
      sample_area_fsm_stateReg <= sample_area_fsm_stateNext;
      case(sample_area_fsm_stateReg)
        sample_area_fsm_enumDef_Wait_Start : begin
          if(sample_en) begin
            sample_area_counter <= 6'h0;
          end
        end
        sample_area_fsm_enumDef_Convst_State : begin
          sample_area_counter <= (sample_area_counter + 6'h01);
          if(when_AD7606_B_l69) begin
            sample_area_convst <= 1'b0;
          end else begin
            if(when_AD7606_B_l71) begin
              sample_area_convst <= 1'b1;
            end else begin
              if(when_AD7606_B_l73) begin
                sample_area_counter <= 6'h0;
              end
            end
          end
        end
        sample_area_fsm_enumDef_Wait_Busy : begin
        end
        sample_area_fsm_enumDef_CsRd_State : begin
          sample_area_cs <= 1'b0;
          sample_area_rd <= 1'b0;
        end
        sample_area_fsm_enumDef_Wait_Frstdata : begin
          if(ad_port_frstdata) begin
            sample_area_rd <= 1'b1;
            sample_area_i <= (sample_area_i + 4'b0001);
          end
        end
        sample_area_fsm_enumDef_Rd_Data_Low : begin
          sample_area_rd <= 1'b0;
        end
        sample_area_fsm_enumDef_Rd_Data_High : begin
          sample_area_rd <= 1'b1;
          if(when_AD7606_B_l112) begin
            sample_area_i <= (sample_area_i + 4'b0001);
          end else begin
            sample_area_i <= 4'b0000;
          end
        end
        sample_area_fsm_enumDef_Wait_Dummy : begin
          sample_area_cs <= 1'b1;
          sample_area_counter <= (sample_area_counter + 6'h01);
          if(when_AD7606_B_l126) begin
            sample_area_counter <= 6'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge sample_clk) begin
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_Wait_Start : begin
      end
      sample_area_fsm_enumDef_Convst_State : begin
      end
      sample_area_fsm_enumDef_Wait_Busy : begin
      end
      sample_area_fsm_enumDef_CsRd_State : begin
      end
      sample_area_fsm_enumDef_Wait_Frstdata : begin
        if(ad_port_frstdata) begin
          if(_zz_1[0]) begin
            sample_area_data_0 <= ad_port_data;
          end
          if(_zz_1[1]) begin
            sample_area_data_1 <= ad_port_data;
          end
          if(_zz_1[2]) begin
            sample_area_data_2 <= ad_port_data;
          end
          if(_zz_1[3]) begin
            sample_area_data_3 <= ad_port_data;
          end
          if(_zz_1[4]) begin
            sample_area_data_4 <= ad_port_data;
          end
          if(_zz_1[5]) begin
            sample_area_data_5 <= ad_port_data;
          end
          if(_zz_1[6]) begin
            sample_area_data_6 <= ad_port_data;
          end
          if(_zz_1[7]) begin
            sample_area_data_7 <= ad_port_data;
          end
        end
      end
      sample_area_fsm_enumDef_Rd_Data_Low : begin
      end
      sample_area_fsm_enumDef_Rd_Data_High : begin
        if(when_AD7606_B_l112) begin
          if(_zz_2[0]) begin
            sample_area_data_0 <= ad_port_data;
          end
          if(_zz_2[1]) begin
            sample_area_data_1 <= ad_port_data;
          end
          if(_zz_2[2]) begin
            sample_area_data_2 <= ad_port_data;
          end
          if(_zz_2[3]) begin
            sample_area_data_3 <= ad_port_data;
          end
          if(_zz_2[4]) begin
            sample_area_data_4 <= ad_port_data;
          end
          if(_zz_2[5]) begin
            sample_area_data_5 <= ad_port_data;
          end
          if(_zz_2[6]) begin
            sample_area_data_6 <= ad_port_data;
          end
          if(_zz_2[7]) begin
            sample_area_data_7 <= ad_port_data;
          end
        end
      end
      sample_area_fsm_enumDef_Wait_Dummy : begin
      end
      default : begin
      end
    endcase
  end


endmodule
