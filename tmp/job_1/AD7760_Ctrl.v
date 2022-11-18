// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : AD7760_Ctrl
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module AD7760_Ctrl (
  output              AD7760_CS,
  input               AD7760_DRDY,
  output              AD7760_RD_WR,
  output              AD7760_RESETN,
  output              AD7760_MCLK,
  input      [15:0]   AD7760_DATA_read,
  output     [15:0]   AD7760_DATA_write,
  output              AD7760_DATA_writeEnable,
  output              ad_data_valid,
  output     [31:0]   ad_data_payload,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_Reset_Start = 3'd1;
  localparam fsm_enumDef_Reset = 3'd2;
  localparam fsm_enumDef_WriteReg1_Start = 3'd3;
  localparam fsm_enumDef_WriteReg2_Start = 3'd4;
  localparam fsm_enumDef_Wait_DRDY = 3'd5;
  localparam fsm_enumDef_Read_Data = 3'd6;

  wire       [10:0]   _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 resetn;
  reg                 cs;
  reg                 rd_wr;
  reg                 drdy;
  reg        [15:0]   write_data_temp;
  wire       [31:0]   read_data_temp;
  reg                 write_enable;
  reg                 valid;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [10:0]   counter_valueNext;
  reg        [10:0]   counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 mclk;
  reg        [3:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_clkToogleHit;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg                 mclk_regNext;
  wire                when_AD7760_l223;
  reg                 mclk_regNext_1;
  wire                when_AD7760_l233;
  wire                when_AD7760_l235;
  wire                when_AD7760_l237;
  reg                 mclk_regNext_2;
  wire                when_AD7760_l249;
  wire                when_AD7760_l251;
  wire                when_AD7760_l254;
  wire                when_AD7760_l256;
  wire                when_AD7760_l259;
  reg                 mclk_regNext_3;
  wire                when_AD7760_l268;
  wire                when_AD7760_l271;
  wire                when_AD7760_l274;
  wire                when_AD7760_l276;
  reg                 drdy_regNext;
  wire                when_AD7760_l287;
  reg                 mclk_regNext_4;
  wire                when_AD7760_l296;
  wire                when_AD7760_l298;
  wire                when_AD7760_l300;
  wire                when_AD7760_l303;
  wire                when_AD7760_l305;
  wire                when_AD7760_l307;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {10'd0, _zz_counter_valueNext_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT           ";
      fsm_enumDef_Reset_Start : fsm_stateReg_string = "Reset_Start    ";
      fsm_enumDef_Reset : fsm_stateReg_string = "Reset          ";
      fsm_enumDef_WriteReg1_Start : fsm_stateReg_string = "WriteReg1_Start";
      fsm_enumDef_WriteReg2_Start : fsm_stateReg_string = "WriteReg2_Start";
      fsm_enumDef_Wait_DRDY : fsm_stateReg_string = "Wait_DRDY      ";
      fsm_enumDef_Read_Data : fsm_stateReg_string = "Read_Data      ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT           ";
      fsm_enumDef_Reset_Start : fsm_stateNext_string = "Reset_Start    ";
      fsm_enumDef_Reset : fsm_stateNext_string = "Reset          ";
      fsm_enumDef_WriteReg1_Start : fsm_stateNext_string = "WriteReg1_Start";
      fsm_enumDef_WriteReg2_Start : fsm_stateNext_string = "WriteReg2_Start";
      fsm_enumDef_Wait_DRDY : fsm_stateNext_string = "Wait_DRDY      ";
      fsm_enumDef_Read_Data : fsm_stateNext_string = "Read_Data      ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  assign read_data_temp = 32'h0;
  always @(*) begin
    counter_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
      end
      fsm_enumDef_Reset : begin
        if(when_AD7760_l233) begin
          counter_willIncrement = 1'b1;
        end
      end
      fsm_enumDef_WriteReg1_Start : begin
        if(when_AD7760_l249) begin
          counter_willIncrement = 1'b1;
        end
      end
      fsm_enumDef_WriteReg2_Start : begin
        if(when_AD7760_l268) begin
          counter_willIncrement = 1'b1;
        end
      end
      fsm_enumDef_Wait_DRDY : begin
      end
      fsm_enumDef_Read_Data : begin
        if(when_AD7760_l296) begin
          counter_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    counter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
        if(when_AD7760_l223) begin
          counter_willClear = 1'b1;
        end
      end
      fsm_enumDef_Reset : begin
        if(when_AD7760_l233) begin
          if(!when_AD7760_l235) begin
            if(when_AD7760_l237) begin
              counter_willClear = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_WriteReg1_Start : begin
        if(when_AD7760_l249) begin
          if(!when_AD7760_l251) begin
            if(!when_AD7760_l254) begin
              if(!when_AD7760_l256) begin
                if(when_AD7760_l259) begin
                  counter_willClear = 1'b1;
                end
              end
            end
          end
        end
      end
      fsm_enumDef_WriteReg2_Start : begin
        if(when_AD7760_l268) begin
          if(!when_AD7760_l271) begin
            if(!when_AD7760_l274) begin
              if(when_AD7760_l276) begin
                counter_willClear = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_Wait_DRDY : begin
        if(when_AD7760_l287) begin
          counter_willClear = 1'b1;
        end
      end
      fsm_enumDef_Read_Data : begin
        if(when_AD7760_l296) begin
          if(!when_AD7760_l298) begin
            if(!when_AD7760_l300) begin
              if(!when_AD7760_l303) begin
                if(!when_AD7760_l305) begin
                  if(when_AD7760_l307) begin
                    counter_willClear = 1'b1;
                  end
                end
              end
            end
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign counter_willOverflowIfInc = (counter_value == 11'h7d0);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 11'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 11'h0;
    end
  end

  always @(*) begin
    timer_reset = 1'b0;
    if(timer_clkToogleHit) begin
      timer_reset = 1'b1;
    end
  end

  assign timer_clkToogleHit = (timer_counter == 4'b0101);
  assign AD7760_MCLK = mclk;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
      end
      fsm_enumDef_Reset : begin
      end
      fsm_enumDef_WriteReg1_Start : begin
      end
      fsm_enumDef_WriteReg2_Start : begin
      end
      fsm_enumDef_Wait_DRDY : begin
      end
      fsm_enumDef_Read_Data : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign AD7760_CS = cs;
  assign AD7760_RD_WR = rd_wr;
  assign AD7760_DATA_write = write_data_temp;
  assign AD7760_DATA_writeEnable = write_enable;
  assign AD7760_RESETN = resetn;
  assign ad_data_valid = valid;
  assign ad_data_payload = read_data_temp;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
        if(when_AD7760_l223) begin
          fsm_stateNext = fsm_enumDef_Reset;
        end
      end
      fsm_enumDef_Reset : begin
        if(when_AD7760_l233) begin
          if(!when_AD7760_l235) begin
            if(when_AD7760_l237) begin
              fsm_stateNext = fsm_enumDef_WriteReg1_Start;
            end
          end
        end
      end
      fsm_enumDef_WriteReg1_Start : begin
        if(when_AD7760_l249) begin
          if(!when_AD7760_l251) begin
            if(!when_AD7760_l254) begin
              if(!when_AD7760_l256) begin
                if(when_AD7760_l259) begin
                  fsm_stateNext = fsm_enumDef_WriteReg2_Start;
                end
              end
            end
          end
        end
      end
      fsm_enumDef_WriteReg2_Start : begin
        if(when_AD7760_l268) begin
          if(!when_AD7760_l271) begin
            if(!when_AD7760_l274) begin
              if(when_AD7760_l276) begin
                fsm_stateNext = fsm_enumDef_Wait_DRDY;
              end
            end
          end
        end
      end
      fsm_enumDef_Wait_DRDY : begin
        if(when_AD7760_l287) begin
          fsm_stateNext = fsm_enumDef_Read_Data;
        end
      end
      fsm_enumDef_Read_Data : begin
        if(when_AD7760_l296) begin
          if(!when_AD7760_l298) begin
            if(!when_AD7760_l300) begin
              if(!when_AD7760_l303) begin
                if(!when_AD7760_l305) begin
                  if(when_AD7760_l307) begin
                    fsm_stateNext = fsm_enumDef_Wait_DRDY;
                  end
                end
              end
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Reset_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_AD7760_l223 = ((! mclk) && mclk_regNext);
  assign when_AD7760_l233 = ((! mclk) && mclk_regNext_1);
  assign when_AD7760_l235 = ((11'h014 <= counter_value) && (counter_value < 11'h028));
  assign when_AD7760_l237 = (11'h028 < counter_value);
  assign when_AD7760_l249 = ((! mclk) && mclk_regNext_2);
  assign when_AD7760_l251 = ((11'h002 <= counter_value) && (counter_value < 11'h004));
  assign when_AD7760_l254 = ((11'h004 <= counter_value) && (counter_value < 11'h006));
  assign when_AD7760_l256 = ((11'h006 <= counter_value) && (counter_value < 11'h00a));
  assign when_AD7760_l259 = (11'h00a < counter_value);
  assign when_AD7760_l268 = ((! mclk) && mclk_regNext_3);
  assign when_AD7760_l271 = ((11'h002 <= counter_value) && (counter_value < 11'h004));
  assign when_AD7760_l274 = ((11'h004 <= counter_value) && (counter_value < 11'h006));
  assign when_AD7760_l276 = (11'h006 <= counter_value);
  assign when_AD7760_l287 = ((! drdy) && drdy_regNext);
  assign when_AD7760_l296 = ((! mclk) && mclk_regNext_4);
  assign when_AD7760_l298 = (counter_value == 11'h001);
  assign when_AD7760_l300 = ((11'h001 < counter_value) && (counter_value < 11'h003));
  assign when_AD7760_l303 = (counter_value == 11'h003);
  assign when_AD7760_l305 = (counter_value == 11'h004);
  assign when_AD7760_l307 = (11'h004 < counter_value);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      resetn <= 1'b1;
      cs <= 1'b1;
      rd_wr <= 1'b0;
      drdy <= 1'b1;
      write_data_temp <= 16'h0;
      write_enable <= 1'b0;
      valid <= 1'b0;
      counter_value <= 11'h0;
      mclk <= 1'b0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      drdy <= AD7760_DRDY;
      valid <= 1'b0;
      counter_value <= counter_valueNext;
      if(timer_clkToogleHit) begin
        mclk <= (! mclk);
      end
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Reset_Start : begin
          if(when_AD7760_l223) begin
            resetn <= 1'b0;
          end
        end
        fsm_enumDef_Reset : begin
          write_data_temp <= 16'h0002;
          if(when_AD7760_l233) begin
            if(when_AD7760_l235) begin
              resetn <= 1'b1;
            end else begin
              if(when_AD7760_l237) begin
                cs <= 1'b0;
                rd_wr <= 1'b1;
                write_enable <= 1'b1;
              end
            end
          end
        end
        fsm_enumDef_WriteReg1_Start : begin
          if(when_AD7760_l249) begin
            if(when_AD7760_l251) begin
              cs <= 1'b1;
              write_data_temp <= 16'h0027;
            end else begin
              if(when_AD7760_l254) begin
                cs <= 1'b0;
              end else begin
                if(when_AD7760_l256) begin
                  cs <= 1'b1;
                  write_data_temp <= 16'h0001;
                end
              end
            end
          end
        end
        fsm_enumDef_WriteReg2_Start : begin
          if(when_AD7760_l268) begin
            cs <= 1'b0;
            if(when_AD7760_l271) begin
              cs <= 1'b1;
              write_data_temp <= 16'h001a;
            end else begin
              if(when_AD7760_l274) begin
                cs <= 1'b0;
              end else begin
                if(when_AD7760_l276) begin
                  cs <= 1'b1;
                  write_enable <= 1'b0;
                end
              end
            end
          end
        end
        fsm_enumDef_Wait_DRDY : begin
          if(when_AD7760_l287) begin
            rd_wr <= 1'b0;
          end
        end
        fsm_enumDef_Read_Data : begin
          if(when_AD7760_l296) begin
            if(when_AD7760_l298) begin
              cs <= 1'b0;
            end else begin
              if(when_AD7760_l300) begin
                cs <= 1'b1;
                rd_wr <= 1'b1;
              end else begin
                if(when_AD7760_l303) begin
                  rd_wr <= 1'b0;
                end else begin
                  if(when_AD7760_l305) begin
                    cs <= 1'b0;
                  end else begin
                    if(when_AD7760_l307) begin
                      cs <= 1'b1;
                      rd_wr <= 1'b1;
                      valid <= 1'b1;
                    end
                  end
                end
              end
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    timer_counter <= (timer_counter + 4'b0001);
    if(timer_reset) begin
      timer_counter <= 4'b0000;
    end
  end

  always @(posedge clk) begin
    mclk_regNext <= mclk;
  end

  always @(posedge clk) begin
    mclk_regNext_1 <= mclk;
  end

  always @(posedge clk) begin
    mclk_regNext_2 <= mclk;
  end

  always @(posedge clk) begin
    mclk_regNext_3 <= mclk;
  end

  always @(posedge clk) begin
    drdy_regNext <= drdy;
  end

  always @(posedge clk) begin
    mclk_regNext_4 <= mclk;
  end


endmodule
