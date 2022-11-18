// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : AD7606_Ctrl
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module AD7606_Ctrl (
  input      [15:0]   AD7606_data,
  input               AD7606_busy,
  input               AD7606_frstdata,
  output              AD7606_cs,
  output              AD7606_rd,
  output              ad_7606_reset,
  output              AD7606_convsta,
  output              AD7606_convstb,
  input               sample_en,
  output              adc_data_valid,
  output     [15:0]   adc_data_payload_0,
  output     [15:0]   adc_data_payload_1,
  output     [15:0]   adc_data_payload_2,
  output     [15:0]   adc_data_payload_3,
  output     [15:0]   adc_data_payload_4,
  output     [15:0]   adc_data_payload_5,
  output     [15:0]   adc_data_payload_6,
  output     [15:0]   adc_data_payload_7,
  input               clk,
  input               reset
);
  localparam sample_area_fsm_enumDef_BOOT = 4'd0;
  localparam sample_area_fsm_enumDef_Reset_Start = 4'd1;
  localparam sample_area_fsm_enumDef_Wait_Start = 4'd2;
  localparam sample_area_fsm_enumDef_Convst_State = 4'd3;
  localparam sample_area_fsm_enumDef_Wait_Busy = 4'd4;
  localparam sample_area_fsm_enumDef_CsRd_State = 4'd5;
  localparam sample_area_fsm_enumDef_Wait_Frstdata = 4'd6;
  localparam sample_area_fsm_enumDef_Rd_Data_Low = 4'd7;
  localparam sample_area_fsm_enumDef_Rd_Data_High = 4'd8;
  localparam sample_area_fsm_enumDef_Wait_Dummy = 4'd9;

  wire       [2:0]    _zz__zz_1;
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
  reg                 sample_area_valid;
  reg                 sample_area_reset;
  wire                sample_area_fsm_wantExit;
  reg                 sample_area_fsm_wantStart;
  wire                sample_area_fsm_wantKill;
  reg        [3:0]    sample_area_fsm_stateReg;
  reg        [3:0]    sample_area_fsm_stateNext;
  wire                when_AD7606_B_l81;
  wire                when_AD7606_B_l100;
  wire                when_AD7606_B_l102;
  wire                when_AD7606_B_l104;
  wire                when_AD7606_B_l112;
  wire                when_AD7606_B_l143;
  wire       [7:0]    _zz_1;
  wire                when_AD7606_B_l158;
  `ifndef SYNTHESIS
  reg [103:0] sample_area_fsm_stateReg_string;
  reg [103:0] sample_area_fsm_stateNext_string;
  `endif


  assign _zz__zz_1 = sample_area_i[2:0];
  `ifndef SYNTHESIS
  always @(*) begin
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_BOOT : sample_area_fsm_stateReg_string = "BOOT         ";
      sample_area_fsm_enumDef_Reset_Start : sample_area_fsm_stateReg_string = "Reset_Start  ";
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
      sample_area_fsm_enumDef_Reset_Start : sample_area_fsm_stateNext_string = "Reset_Start  ";
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
      sample_area_fsm_enumDef_Reset_Start : begin
      end
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
  assign AD7606_cs = sample_area_cs;
  assign AD7606_rd = sample_area_rd;
  assign AD7606_convsta = sample_area_convst;
  assign AD7606_convstb = sample_area_convst;
  assign ad_7606_reset = sample_area_reset;
  assign adc_data_payload_0 = sample_area_data_0;
  assign adc_data_payload_1 = sample_area_data_1;
  assign adc_data_payload_2 = sample_area_data_2;
  assign adc_data_payload_3 = sample_area_data_3;
  assign adc_data_payload_4 = sample_area_data_4;
  assign adc_data_payload_5 = sample_area_data_5;
  assign adc_data_payload_6 = sample_area_data_6;
  assign adc_data_payload_7 = sample_area_data_7;
  assign adc_data_valid = sample_area_valid;
  always @(*) begin
    sample_area_fsm_stateNext = sample_area_fsm_stateReg;
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_Reset_Start : begin
        if(when_AD7606_B_l81) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Start;
        end
      end
      sample_area_fsm_enumDef_Wait_Start : begin
        if(sample_en) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Convst_State;
        end
      end
      sample_area_fsm_enumDef_Convst_State : begin
        if(!when_AD7606_B_l100) begin
          if(!when_AD7606_B_l102) begin
            if(when_AD7606_B_l104) begin
              sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Busy;
            end
          end
        end
      end
      sample_area_fsm_enumDef_Wait_Busy : begin
        if(when_AD7606_B_l112) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_CsRd_State;
        end
      end
      sample_area_fsm_enumDef_CsRd_State : begin
        sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Frstdata;
      end
      sample_area_fsm_enumDef_Wait_Frstdata : begin
        if(AD7606_frstdata) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Rd_Data_Low;
        end
      end
      sample_area_fsm_enumDef_Rd_Data_Low : begin
        sample_area_fsm_stateNext = sample_area_fsm_enumDef_Rd_Data_High;
      end
      sample_area_fsm_enumDef_Rd_Data_High : begin
        if(when_AD7606_B_l143) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Rd_Data_Low;
        end else begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Dummy;
        end
      end
      sample_area_fsm_enumDef_Wait_Dummy : begin
        if(when_AD7606_B_l158) begin
          sample_area_fsm_stateNext = sample_area_fsm_enumDef_Wait_Start;
        end
      end
      default : begin
      end
    endcase
    if(sample_area_fsm_wantStart) begin
      sample_area_fsm_stateNext = sample_area_fsm_enumDef_Reset_Start;
    end
    if(sample_area_fsm_wantKill) begin
      sample_area_fsm_stateNext = sample_area_fsm_enumDef_BOOT;
    end
  end

  assign when_AD7606_B_l81 = (6'h05 < sample_area_counter);
  assign when_AD7606_B_l100 = (sample_area_counter == 6'h05);
  assign when_AD7606_B_l102 = (sample_area_counter == 6'h07);
  assign when_AD7606_B_l104 = (sample_area_counter == 6'h0c);
  assign when_AD7606_B_l112 = (! AD7606_busy);
  assign when_AD7606_B_l143 = (sample_area_i < 4'b1000);
  assign _zz_1 = ({7'd0,1'b1} <<< _zz__zz_1);
  assign when_AD7606_B_l158 = (6'h14 <= sample_area_counter);
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
      sample_area_reset <= 1'b0;
      sample_area_fsm_stateReg <= sample_area_fsm_enumDef_BOOT;
    end else begin
      sample_area_fsm_stateReg <= sample_area_fsm_stateNext;
      case(sample_area_fsm_stateReg)
        sample_area_fsm_enumDef_Reset_Start : begin
          sample_area_counter <= (sample_area_counter + 6'h01);
          sample_area_reset <= 1'b1;
          if(when_AD7606_B_l81) begin
            sample_area_counter <= 6'h0;
            sample_area_reset <= 1'b0;
          end
        end
        sample_area_fsm_enumDef_Wait_Start : begin
          if(sample_en) begin
            sample_area_counter <= 6'h0;
          end
        end
        sample_area_fsm_enumDef_Convst_State : begin
          sample_area_counter <= (sample_area_counter + 6'h01);
          if(when_AD7606_B_l100) begin
            sample_area_convst <= 1'b0;
          end else begin
            if(when_AD7606_B_l102) begin
              sample_area_convst <= 1'b1;
            end else begin
              if(when_AD7606_B_l104) begin
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
          if(AD7606_frstdata) begin
            sample_area_rd <= 1'b1;
            sample_area_i <= (sample_area_i + 4'b0001);
          end
        end
        sample_area_fsm_enumDef_Rd_Data_Low : begin
          sample_area_rd <= 1'b0;
        end
        sample_area_fsm_enumDef_Rd_Data_High : begin
          sample_area_rd <= 1'b1;
          if(when_AD7606_B_l143) begin
            sample_area_i <= (sample_area_i + 4'b0001);
          end else begin
            sample_area_i <= 4'b0000;
          end
        end
        sample_area_fsm_enumDef_Wait_Dummy : begin
          sample_area_cs <= 1'b1;
          sample_area_counter <= (sample_area_counter + 6'h01);
          if(when_AD7606_B_l158) begin
            sample_area_counter <= 6'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge sample_clk) begin
    sample_area_valid <= 1'b0;
    case(sample_area_fsm_stateReg)
      sample_area_fsm_enumDef_Reset_Start : begin
      end
      sample_area_fsm_enumDef_Wait_Start : begin
      end
      sample_area_fsm_enumDef_Convst_State : begin
      end
      sample_area_fsm_enumDef_Wait_Busy : begin
      end
      sample_area_fsm_enumDef_CsRd_State : begin
      end
      sample_area_fsm_enumDef_Wait_Frstdata : begin
        if(AD7606_frstdata) begin
          sample_area_data_0 <= AD7606_data;
        end
      end
      sample_area_fsm_enumDef_Rd_Data_Low : begin
      end
      sample_area_fsm_enumDef_Rd_Data_High : begin
        if(when_AD7606_B_l143) begin
          if(_zz_1[0]) begin
            sample_area_data_0 <= AD7606_data;
          end
          if(_zz_1[1]) begin
            sample_area_data_1 <= AD7606_data;
          end
          if(_zz_1[2]) begin
            sample_area_data_2 <= AD7606_data;
          end
          if(_zz_1[3]) begin
            sample_area_data_3 <= AD7606_data;
          end
          if(_zz_1[4]) begin
            sample_area_data_4 <= AD7606_data;
          end
          if(_zz_1[5]) begin
            sample_area_data_5 <= AD7606_data;
          end
          if(_zz_1[6]) begin
            sample_area_data_6 <= AD7606_data;
          end
          if(_zz_1[7]) begin
            sample_area_data_7 <= AD7606_data;
          end
        end else begin
          sample_area_valid <= 1'b1;
        end
      end
      sample_area_fsm_enumDef_Wait_Dummy : begin
      end
      default : begin
      end
    endcase
  end


endmodule
