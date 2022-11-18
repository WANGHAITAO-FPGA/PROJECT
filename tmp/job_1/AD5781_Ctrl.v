// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : AD5781_Ctrl
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module AD5781_Ctrl (
  output              AD5781_CS,
  output              AD5781_SCLK,
  input               AD5781_MISO,
  output              AD5781_MOSI,
  output              AD5781_LDAC,
  output              AD5781_RSTN,
  output              AD5781_CLRN,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_Reset_Start = 3'd1;
  localparam fsm_enumDef_Reset = 3'd2;
  localparam fsm_enumDef_SoftInstruction = 3'd3;
  localparam fsm_enumDef_Get_CtrlReg = 3'd4;
  localparam fsm_enumDef_Check_Reg = 3'd5;
  localparam fsm_enumDef_Read_Reg = 3'd6;
  localparam fsm_enumDef_Dummy = 3'd7;

  wire                spi_ctrl_rsp_valid;
  wire       [23:0]   spi_ctrl_rsp_payload;
  wire                spi_ctrl_spi_sclk;
  wire                spi_ctrl_spi_mosi;
  wire       [0:0]    spi_ctrl_spi_ss;
  wire       [8:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 resetn;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [8:0]    counter_valueNext;
  reg        [8:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 spi_cmd_valid;
  reg        [23:0]   spi_cmd_payload;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_AD5781_l71;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {8'd0, _zz_counter_valueNext_1};
  Spi_Master spi_ctrl (
    .cmd_valid   (spi_cmd_valid             ), //i
    .cmd_payload (spi_cmd_payload[23:0]     ), //i
    .rsp_valid   (spi_ctrl_rsp_valid        ), //o
    .rsp_payload (spi_ctrl_rsp_payload[23:0]), //o
    .spi_ss      (spi_ctrl_spi_ss           ), //o
    .spi_sclk    (spi_ctrl_spi_sclk         ), //o
    .spi_mosi    (spi_ctrl_spi_mosi         ), //o
    .spi_miso    (AD5781_MISO               ), //i
    .config_cpol (1'b0                      ), //i
    .config_cpha (1'b1                      ), //i
    .clk         (clk                       ), //i
    .reset       (reset                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT           ";
      fsm_enumDef_Reset_Start : fsm_stateReg_string = "Reset_Start    ";
      fsm_enumDef_Reset : fsm_stateReg_string = "Reset          ";
      fsm_enumDef_SoftInstruction : fsm_stateReg_string = "SoftInstruction";
      fsm_enumDef_Get_CtrlReg : fsm_stateReg_string = "Get_CtrlReg    ";
      fsm_enumDef_Check_Reg : fsm_stateReg_string = "Check_Reg      ";
      fsm_enumDef_Read_Reg : fsm_stateReg_string = "Read_Reg       ";
      fsm_enumDef_Dummy : fsm_stateReg_string = "Dummy          ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT           ";
      fsm_enumDef_Reset_Start : fsm_stateNext_string = "Reset_Start    ";
      fsm_enumDef_Reset : fsm_stateNext_string = "Reset          ";
      fsm_enumDef_SoftInstruction : fsm_stateNext_string = "SoftInstruction";
      fsm_enumDef_Get_CtrlReg : fsm_stateNext_string = "Get_CtrlReg    ";
      fsm_enumDef_Check_Reg : fsm_stateNext_string = "Check_Reg      ";
      fsm_enumDef_Read_Reg : fsm_stateNext_string = "Read_Reg       ";
      fsm_enumDef_Dummy : fsm_stateNext_string = "Dummy          ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  always @(*) begin
    counter_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
      end
      fsm_enumDef_Reset : begin
        counter_willIncrement = 1'b1;
      end
      fsm_enumDef_SoftInstruction : begin
      end
      fsm_enumDef_Get_CtrlReg : begin
        counter_willIncrement = 1'b1;
      end
      fsm_enumDef_Check_Reg : begin
      end
      fsm_enumDef_Read_Reg : begin
      end
      fsm_enumDef_Dummy : begin
        counter_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    counter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
        counter_willClear = 1'b1;
      end
      fsm_enumDef_Reset : begin
        if(!when_AD5781_l71) begin
          if(counter_willOverflowIfInc) begin
            counter_willClear = 1'b1;
          end
        end
      end
      fsm_enumDef_SoftInstruction : begin
      end
      fsm_enumDef_Get_CtrlReg : begin
        if(counter_willOverflowIfInc) begin
          counter_willClear = 1'b1;
        end
      end
      fsm_enumDef_Check_Reg : begin
      end
      fsm_enumDef_Read_Reg : begin
      end
      fsm_enumDef_Dummy : begin
        if(counter_willOverflowIfInc) begin
          counter_willClear = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign counter_willOverflowIfInc = (counter_value == 9'h1f3);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 9'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 9'h0;
    end
  end

  assign AD5781_CS = spi_ctrl_spi_ss[0];
  assign AD5781_SCLK = spi_ctrl_spi_sclk;
  assign AD5781_MOSI = spi_ctrl_spi_mosi;
  assign AD5781_RSTN = resetn;
  assign AD5781_LDAC = 1'b1;
  assign AD5781_CLRN = 1'b1;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
      end
      fsm_enumDef_Reset : begin
      end
      fsm_enumDef_SoftInstruction : begin
      end
      fsm_enumDef_Get_CtrlReg : begin
      end
      fsm_enumDef_Check_Reg : begin
      end
      fsm_enumDef_Read_Reg : begin
      end
      fsm_enumDef_Dummy : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
        fsm_stateNext = fsm_enumDef_Reset;
      end
      fsm_enumDef_Reset : begin
        if(!when_AD5781_l71) begin
          if(counter_willOverflowIfInc) begin
            fsm_stateNext = fsm_enumDef_SoftInstruction;
          end
        end
      end
      fsm_enumDef_SoftInstruction : begin
        if(spi_ctrl_rsp_valid) begin
          fsm_stateNext = fsm_enumDef_Get_CtrlReg;
        end
      end
      fsm_enumDef_Get_CtrlReg : begin
        if(counter_willOverflowIfInc) begin
          fsm_stateNext = fsm_enumDef_Check_Reg;
        end
      end
      fsm_enumDef_Check_Reg : begin
        if(spi_ctrl_rsp_valid) begin
          fsm_stateNext = fsm_enumDef_Read_Reg;
        end
      end
      fsm_enumDef_Read_Reg : begin
        if(spi_ctrl_rsp_valid) begin
          fsm_stateNext = fsm_enumDef_Dummy;
        end
      end
      fsm_enumDef_Dummy : begin
        if(counter_willOverflowIfInc) begin
          fsm_stateNext = fsm_enumDef_Get_CtrlReg;
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

  assign when_AD5781_l71 = (counter_value == 9'h00a);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      resetn <= 1'b1;
      counter_value <= 9'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      counter_value <= counter_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Reset_Start : begin
          resetn <= 1'b0;
        end
        fsm_enumDef_Reset : begin
          if(when_AD5781_l71) begin
            resetn <= 1'b1;
          end
        end
        fsm_enumDef_SoftInstruction : begin
        end
        fsm_enumDef_Get_CtrlReg : begin
        end
        fsm_enumDef_Check_Reg : begin
        end
        fsm_enumDef_Read_Reg : begin
        end
        fsm_enumDef_Dummy : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    spi_cmd_valid <= 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Reset_Start : begin
      end
      fsm_enumDef_Reset : begin
        if(!when_AD5781_l71) begin
          if(counter_willOverflowIfInc) begin
            spi_cmd_valid <= 1'b1;
            spi_cmd_payload <= 24'h400004;
          end
        end
      end
      fsm_enumDef_SoftInstruction : begin
      end
      fsm_enumDef_Get_CtrlReg : begin
        if(counter_willOverflowIfInc) begin
          spi_cmd_valid <= 1'b1;
          spi_cmd_payload <= 24'ha00000;
        end
      end
      fsm_enumDef_Check_Reg : begin
        if(spi_ctrl_rsp_valid) begin
          spi_cmd_valid <= 1'b1;
          spi_cmd_payload <= 24'h0;
        end
      end
      fsm_enumDef_Read_Reg : begin
      end
      fsm_enumDef_Dummy : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Spi_Master (
  input               cmd_valid,
  input      [23:0]   cmd_payload,
  output              rsp_valid,
  output     [23:0]   rsp_payload,
  output     [0:0]    spi_ss,
  output              spi_sclk,
  output              spi_mosi,
  input               spi_miso,
  input               config_cpol,
  input               config_cpha,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_1_BOOT = 3'd0;
  localparam fsm_enumDef_1_Wait_Cmd = 3'd1;
  localparam fsm_enumDef_1_Active_CS = 3'd2;
  localparam fsm_enumDef_1_Send_Data = 3'd3;
  localparam fsm_enumDef_1_End_1 = 3'd4;

  wire       [5:0]    _zz_fsm_counter_valueNext;
  wire       [0:0]    _zz_fsm_counter_valueNext_1;
  wire       [24:0]   _zz_fsm_buffer;
  wire       [4:0]    _zz__zz_spi_mosi;
  wire       [4:0]    _zz__zz_spi_mosi_1;
  reg        [9:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_sclkToogleHit;
  reg                 valid;
  reg        [23:0]   data_temp;
  reg                 rsp_valid_1;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 fsm_counter_willIncrement;
  reg                 fsm_counter_willClear;
  reg        [5:0]    fsm_counter_valueNext;
  reg        [5:0]    fsm_counter_value;
  wire                fsm_counter_willOverflowIfInc;
  wire                fsm_counter_willOverflow;
  reg        [23:0]   fsm_buffer;
  reg                 fsm_cs;
  reg        [9:0]    fsm_cs_counter;
  wire                when_AD5781_l203;
  reg                 rsp_valid_1_regNext;
  reg                 _zz_spi_sclk;
  reg                 _zz_spi_mosi;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_AD5781_l170;
  wire                when_AD5781_l189;
  `ifndef SYNTHESIS
  reg [71:0] fsm_stateReg_string;
  reg [71:0] fsm_stateNext_string;
  `endif


  assign _zz_fsm_counter_valueNext_1 = fsm_counter_willIncrement;
  assign _zz_fsm_counter_valueNext = {5'd0, _zz_fsm_counter_valueNext_1};
  assign _zz_fsm_buffer = {fsm_buffer,spi_miso};
  assign _zz__zz_spi_mosi = (5'h17 - _zz__zz_spi_mosi_1);
  assign _zz__zz_spi_mosi_1 = (fsm_counter_value >>> 1);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT     ";
      fsm_enumDef_1_Wait_Cmd : fsm_stateReg_string = "Wait_Cmd ";
      fsm_enumDef_1_Active_CS : fsm_stateReg_string = "Active_CS";
      fsm_enumDef_1_Send_Data : fsm_stateReg_string = "Send_Data";
      fsm_enumDef_1_End_1 : fsm_stateReg_string = "End_1    ";
      default : fsm_stateReg_string = "?????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT     ";
      fsm_enumDef_1_Wait_Cmd : fsm_stateNext_string = "Wait_Cmd ";
      fsm_enumDef_1_Active_CS : fsm_stateNext_string = "Active_CS";
      fsm_enumDef_1_Send_Data : fsm_stateNext_string = "Send_Data";
      fsm_enumDef_1_End_1 : fsm_stateNext_string = "End_1    ";
      default : fsm_stateNext_string = "?????????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    if(valid) begin
      if(timer_sclkToogleHit) begin
        timer_reset = 1'b1;
      end
    end
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Cmd : begin
      end
      fsm_enumDef_1_Active_CS : begin
        if(when_AD5781_l170) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_1_Send_Data : begin
      end
      fsm_enumDef_1_End_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign timer_sclkToogleHit = (timer_counter == 10'h032);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Cmd : begin
      end
      fsm_enumDef_1_Active_CS : begin
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
  always @(*) begin
    fsm_counter_willIncrement = 1'b0;
    if(valid) begin
      if(timer_sclkToogleHit) begin
        fsm_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    fsm_counter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Cmd : begin
      end
      fsm_enumDef_1_Active_CS : begin
      end
      fsm_enumDef_1_Send_Data : begin
      end
      fsm_enumDef_1_End_1 : begin
        if(when_AD5781_l189) begin
          fsm_counter_willClear = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fsm_counter_willOverflowIfInc = (fsm_counter_value == 6'h2f);
  assign fsm_counter_willOverflow = (fsm_counter_willOverflowIfInc && fsm_counter_willIncrement);
  always @(*) begin
    if(fsm_counter_willOverflow) begin
      fsm_counter_valueNext = 6'h0;
    end else begin
      fsm_counter_valueNext = (fsm_counter_value + _zz_fsm_counter_valueNext);
    end
    if(fsm_counter_willClear) begin
      fsm_counter_valueNext = 6'h0;
    end
  end

  assign when_AD5781_l203 = fsm_counter_value[0];
  assign rsp_valid = rsp_valid_1_regNext;
  assign rsp_payload = fsm_buffer;
  assign spi_ss = fsm_cs;
  assign spi_sclk = _zz_spi_sclk;
  assign spi_mosi = _zz_spi_mosi;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Cmd : begin
        if(cmd_valid) begin
          fsm_stateNext = fsm_enumDef_1_Active_CS;
        end
      end
      fsm_enumDef_1_Active_CS : begin
        if(when_AD5781_l170) begin
          fsm_stateNext = fsm_enumDef_1_Send_Data;
        end
      end
      fsm_enumDef_1_Send_Data : begin
        if(fsm_counter_willOverflowIfInc) begin
          fsm_stateNext = fsm_enumDef_1_End_1;
        end
      end
      fsm_enumDef_1_End_1 : begin
        if(when_AD5781_l189) begin
          fsm_stateNext = fsm_enumDef_1_Wait_Cmd;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_Wait_Cmd;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_AD5781_l170 = (10'h032 < fsm_cs_counter);
  assign when_AD5781_l189 = (10'h032 < fsm_cs_counter);
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 10'h001);
    if(timer_reset) begin
      timer_counter <= 10'h0;
    end
    rsp_valid_1 <= 1'b0;
    if(valid) begin
      if(timer_sclkToogleHit) begin
        if(when_AD5781_l203) begin
          fsm_buffer <= _zz_fsm_buffer[23:0];
        end
      end
    end
    _zz_spi_sclk <= ((valid && (fsm_counter_value[0] ^ config_cpha)) ^ config_cpol);
    _zz_spi_mosi <= data_temp[_zz__zz_spi_mosi];
    case(fsm_stateReg)
      fsm_enumDef_1_Wait_Cmd : begin
      end
      fsm_enumDef_1_Active_CS : begin
      end
      fsm_enumDef_1_Send_Data : begin
      end
      fsm_enumDef_1_End_1 : begin
        if(when_AD5781_l189) begin
          rsp_valid_1 <= 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      valid <= 1'b0;
      data_temp <= 24'h0;
      fsm_counter_value <= 6'h0;
      fsm_cs <= 1'b1;
      fsm_cs_counter <= 10'h0;
      rsp_valid_1_regNext <= 1'b0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      fsm_counter_value <= fsm_counter_valueNext;
      rsp_valid_1_regNext <= rsp_valid_1;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_Wait_Cmd : begin
          if(cmd_valid) begin
            fsm_cs <= 1'b0;
            fsm_cs_counter <= 10'h0;
            data_temp <= cmd_payload;
          end
        end
        fsm_enumDef_1_Active_CS : begin
          fsm_cs_counter <= (fsm_cs_counter + 10'h001);
          if(when_AD5781_l170) begin
            valid <= 1'b1;
            fsm_cs_counter <= 10'h0;
          end
        end
        fsm_enumDef_1_Send_Data : begin
        end
        fsm_enumDef_1_End_1 : begin
          valid <= 1'b0;
          fsm_cs_counter <= (fsm_cs_counter + 10'h001);
          if(when_AD5781_l189) begin
            fsm_cs <= 1'b1;
            fsm_cs_counter <= 10'h0;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule
