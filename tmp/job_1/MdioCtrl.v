// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : MdioCtrl
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module MdioCtrl (
  input      [7:0]    config_sclkToogle,
  input      [31:0]   config_preamble,
  input      [1:0]    config_frame_start,
  input      [1:0]    config_opCode,
  input      [4:0]    config_phy_device_addr,
  input      [4:0]    config_phy_reg_addr,
  (* MARK_DEBUG = "TRUE" *) input               cmd_valid,
  (* MARK_DEBUG = "TRUE" *) input      [15:0]   cmd_payload,
  (* MARK_DEBUG = "TRUE" *) output              rsp_valid,
  (* MARK_DEBUG = "TRUE" *) output     [15:0]   rsp_payload,
  output              mdio_MDC,
  input               mdio_MDIO_read,
  output              mdio_MDIO_write,
  output              mdio_MDIO_writeEnable,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 4'd0;
  localparam fsm_enumDef_IDLE = 4'd1;
  localparam fsm_enumDef_Preamble = 4'd2;
  localparam fsm_enumDef_Frame_start = 4'd3;
  localparam fsm_enumDef_OpCode = 4'd4;
  localparam fsm_enumDef_Phy_device_addr = 4'd5;
  localparam fsm_enumDef_Phy_reg_addr = 4'd6;
  localparam fsm_enumDef_Write_Data = 4'd7;
  localparam fsm_enumDef_Turn_around = 4'd8;
  localparam fsm_enumDef_Register_data = 4'd9;
  localparam fsm_enumDef_END_1 = 4'd10;
  localparam MdioCtrlCmdMode_READ = 2'd2;
  localparam MdioCtrlCmdMode_WRITE = 2'd1;

  wire       [4:0]    _zz_mdio_out;
  wire       [4:0]    _zz_mdio_out_1;
  wire       [0:0]    _zz_mdio_out_2;
  wire       [0:0]    _zz_mdio_out_3;
  wire       [0:0]    _zz_mdio_out_4;
  wire       [0:0]    _zz_mdio_out_5;
  wire       [2:0]    _zz_mdio_out_6;
  wire       [2:0]    _zz_mdio_out_7;
  wire       [2:0]    _zz_mdio_out_8;
  wire       [2:0]    _zz_mdio_out_9;
  wire       [17:0]   _zz_mdio_out_10;
  wire       [4:0]    _zz_mdio_out_11;
  wire       [4:0]    _zz_mdio_out_12;
  wire       [16:0]   _zz_rsp_data;
  reg        [7:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_sclkToogleHit;
  reg                 mdc;
  reg                 start_flag;
  wire                when_MdioCtrl_l80;
  reg                 mdio_out;
  reg                 mdio_write_enable;
  reg        [15:0]   cmd_reg_data;
  reg        [15:0]   rsp_data;
  reg                 rsp_valid_1;
  reg                 mdio_rddata;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [7:0]    fsm_counter;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  reg                 mdc_regNext;
  wire                when_MdioCtrl_l120;
  wire                when_MdioCtrl_l122;
  reg                 mdc_regNext_1;
  wire                when_MdioCtrl_l133;
  wire                when_MdioCtrl_l135;
  reg                 mdc_regNext_2;
  wire                when_MdioCtrl_l146;
  wire                when_MdioCtrl_l148;
  reg                 mdc_regNext_3;
  wire                when_MdioCtrl_l159;
  wire                when_MdioCtrl_l161;
  reg                 mdc_regNext_4;
  wire                when_MdioCtrl_l172;
  wire                when_MdioCtrl_l174;
  wire                when_MdioCtrl_l176;
  reg                 mdc_regNext_5;
  wire                when_MdioCtrl_l189;
  wire                when_MdioCtrl_l191;
  reg                 mdc_regNext_6;
  wire                when_MdioCtrl_l202;
  wire                when_MdioCtrl_l204;
  reg                 mdc_regNext_7;
  wire                when_MdioCtrl_l213;
  wire                when_MdioCtrl_l216;
  wire                when_MdioCtrl_l225;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_mdio_out = (5'h1f - _zz_mdio_out_1);
  assign _zz_mdio_out_1 = fsm_counter[4:0];
  assign _zz_mdio_out_2 = (1'b1 - _zz_mdio_out_3);
  assign _zz_mdio_out_3 = fsm_counter[0:0];
  assign _zz_mdio_out_4 = (1'b1 - _zz_mdio_out_5);
  assign _zz_mdio_out_5 = fsm_counter[0:0];
  assign _zz_mdio_out_6 = (3'b100 - _zz_mdio_out_7);
  assign _zz_mdio_out_7 = fsm_counter[2:0];
  assign _zz_mdio_out_8 = (3'b100 - _zz_mdio_out_9);
  assign _zz_mdio_out_9 = fsm_counter[2:0];
  assign _zz_mdio_out_10 = {2'b10,cmd_reg_data};
  assign _zz_mdio_out_11 = (5'h11 - _zz_mdio_out_12);
  assign _zz_mdio_out_12 = fsm_counter[4:0];
  assign _zz_rsp_data = {rsp_data,mdio_rddata};
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT           ";
      fsm_enumDef_IDLE : fsm_stateReg_string = "IDLE           ";
      fsm_enumDef_Preamble : fsm_stateReg_string = "Preamble       ";
      fsm_enumDef_Frame_start : fsm_stateReg_string = "Frame_start    ";
      fsm_enumDef_OpCode : fsm_stateReg_string = "OpCode         ";
      fsm_enumDef_Phy_device_addr : fsm_stateReg_string = "Phy_device_addr";
      fsm_enumDef_Phy_reg_addr : fsm_stateReg_string = "Phy_reg_addr   ";
      fsm_enumDef_Write_Data : fsm_stateReg_string = "Write_Data     ";
      fsm_enumDef_Turn_around : fsm_stateReg_string = "Turn_around    ";
      fsm_enumDef_Register_data : fsm_stateReg_string = "Register_data  ";
      fsm_enumDef_END_1 : fsm_stateReg_string = "END_1          ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT           ";
      fsm_enumDef_IDLE : fsm_stateNext_string = "IDLE           ";
      fsm_enumDef_Preamble : fsm_stateNext_string = "Preamble       ";
      fsm_enumDef_Frame_start : fsm_stateNext_string = "Frame_start    ";
      fsm_enumDef_OpCode : fsm_stateNext_string = "OpCode         ";
      fsm_enumDef_Phy_device_addr : fsm_stateNext_string = "Phy_device_addr";
      fsm_enumDef_Phy_reg_addr : fsm_stateNext_string = "Phy_reg_addr   ";
      fsm_enumDef_Write_Data : fsm_stateNext_string = "Write_Data     ";
      fsm_enumDef_Turn_around : fsm_stateNext_string = "Turn_around    ";
      fsm_enumDef_Register_data : fsm_stateNext_string = "Register_data  ";
      fsm_enumDef_END_1 : fsm_stateNext_string = "END_1          ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    if(when_MdioCtrl_l80) begin
      timer_reset = 1'b1;
    end
  end

  assign timer_sclkToogleHit = (timer_counter == config_sclkToogle);
  assign when_MdioCtrl_l80 = (timer_sclkToogleHit && start_flag);
  assign mdio_MDC = mdc;
  assign mdio_MDIO_write = mdio_out;
  assign mdio_MDIO_writeEnable = mdio_write_enable;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_Preamble : begin
      end
      fsm_enumDef_Frame_start : begin
      end
      fsm_enumDef_OpCode : begin
      end
      fsm_enumDef_Phy_device_addr : begin
      end
      fsm_enumDef_Phy_reg_addr : begin
      end
      fsm_enumDef_Write_Data : begin
      end
      fsm_enumDef_Turn_around : begin
      end
      fsm_enumDef_Register_data : begin
      end
      fsm_enumDef_END_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign rsp_valid = rsp_valid_1;
  assign rsp_payload = rsp_data;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        if(cmd_valid) begin
          fsm_stateNext = fsm_enumDef_Preamble;
        end
      end
      fsm_enumDef_Preamble : begin
        if(when_MdioCtrl_l120) begin
          if(when_MdioCtrl_l122) begin
            fsm_stateNext = fsm_enumDef_Frame_start;
          end
        end
      end
      fsm_enumDef_Frame_start : begin
        if(when_MdioCtrl_l133) begin
          if(when_MdioCtrl_l135) begin
            fsm_stateNext = fsm_enumDef_OpCode;
          end
        end
      end
      fsm_enumDef_OpCode : begin
        if(when_MdioCtrl_l146) begin
          if(when_MdioCtrl_l148) begin
            fsm_stateNext = fsm_enumDef_Phy_device_addr;
          end
        end
      end
      fsm_enumDef_Phy_device_addr : begin
        if(when_MdioCtrl_l159) begin
          if(when_MdioCtrl_l161) begin
            fsm_stateNext = fsm_enumDef_Phy_reg_addr;
          end
        end
      end
      fsm_enumDef_Phy_reg_addr : begin
        if(when_MdioCtrl_l172) begin
          if(when_MdioCtrl_l174) begin
            if(when_MdioCtrl_l176) begin
              fsm_stateNext = fsm_enumDef_Turn_around;
            end else begin
              fsm_stateNext = fsm_enumDef_Write_Data;
            end
          end
        end
      end
      fsm_enumDef_Write_Data : begin
        if(when_MdioCtrl_l189) begin
          if(when_MdioCtrl_l191) begin
            fsm_stateNext = fsm_enumDef_IDLE;
          end
        end
      end
      fsm_enumDef_Turn_around : begin
        if(when_MdioCtrl_l202) begin
          if(when_MdioCtrl_l204) begin
            fsm_stateNext = fsm_enumDef_Register_data;
          end
        end
      end
      fsm_enumDef_Register_data : begin
        if(when_MdioCtrl_l213) begin
          if(when_MdioCtrl_l216) begin
            fsm_stateNext = fsm_enumDef_END_1;
          end
        end
      end
      fsm_enumDef_END_1 : begin
        fsm_stateNext = fsm_enumDef_IDLE;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_MdioCtrl_l120 = ((! mdc) && mdc_regNext);
  assign when_MdioCtrl_l122 = (fsm_counter == 8'h1f);
  assign when_MdioCtrl_l133 = ((! mdc) && mdc_regNext_1);
  assign when_MdioCtrl_l135 = (fsm_counter == 8'h01);
  assign when_MdioCtrl_l146 = ((! mdc) && mdc_regNext_2);
  assign when_MdioCtrl_l148 = (fsm_counter == 8'h01);
  assign when_MdioCtrl_l159 = ((! mdc) && mdc_regNext_3);
  assign when_MdioCtrl_l161 = (fsm_counter == 8'h04);
  assign when_MdioCtrl_l172 = ((! mdc) && mdc_regNext_4);
  assign when_MdioCtrl_l174 = (fsm_counter == 8'h04);
  assign when_MdioCtrl_l176 = (config_opCode == MdioCtrlCmdMode_READ);
  assign when_MdioCtrl_l189 = ((! mdc) && mdc_regNext_5);
  assign when_MdioCtrl_l191 = (fsm_counter == 8'h11);
  assign when_MdioCtrl_l202 = (mdc && (! mdc_regNext_6));
  assign when_MdioCtrl_l204 = (fsm_counter == 8'h01);
  assign when_MdioCtrl_l213 = ((! mdc) && mdc_regNext_7);
  assign when_MdioCtrl_l216 = (fsm_counter == 8'h0f);
  assign when_MdioCtrl_l225 = (config_opCode == MdioCtrlCmdMode_READ);
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 8'h01);
    if(timer_reset) begin
      timer_counter <= 8'h0;
    end
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        if(cmd_valid) begin
          cmd_reg_data <= cmd_payload;
        end
      end
      fsm_enumDef_Preamble : begin
      end
      fsm_enumDef_Frame_start : begin
      end
      fsm_enumDef_OpCode : begin
      end
      fsm_enumDef_Phy_device_addr : begin
      end
      fsm_enumDef_Phy_reg_addr : begin
      end
      fsm_enumDef_Write_Data : begin
      end
      fsm_enumDef_Turn_around : begin
      end
      fsm_enumDef_Register_data : begin
        if(when_MdioCtrl_l213) begin
          rsp_data <= _zz_rsp_data[15:0];
        end
      end
      fsm_enumDef_END_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mdc <= 1'b1;
      start_flag <= 1'b0;
      mdio_out <= 1'b1;
      mdio_write_enable <= 1'b1;
      rsp_valid_1 <= 1'b0;
      mdio_rddata <= 1'b1;
      fsm_counter <= 8'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      if(when_MdioCtrl_l80) begin
        mdc <= (! mdc);
      end
      mdio_out <= 1'b1;
      mdio_write_enable <= 1'b1;
      rsp_valid_1 <= 1'b0;
      mdio_rddata <= mdio_MDIO_read;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_IDLE : begin
          if(cmd_valid) begin
            fsm_counter <= 8'h0;
            start_flag <= 1'b1;
            mdio_write_enable <= 1'b0;
          end
        end
        fsm_enumDef_Preamble : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l120) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l122) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_preamble[_zz_mdio_out];
        end
        fsm_enumDef_Frame_start : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l133) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l135) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_frame_start[_zz_mdio_out_2];
        end
        fsm_enumDef_OpCode : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l146) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l148) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_opCode[_zz_mdio_out_4];
        end
        fsm_enumDef_Phy_device_addr : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l159) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l161) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_phy_device_addr[_zz_mdio_out_6];
        end
        fsm_enumDef_Phy_reg_addr : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l172) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l174) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_phy_reg_addr[_zz_mdio_out_8];
        end
        fsm_enumDef_Write_Data : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l189) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l191) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= _zz_mdio_out_10[_zz_mdio_out_11];
        end
        fsm_enumDef_Turn_around : begin
          mdio_out <= 1'b1;
          if(when_MdioCtrl_l202) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l204) begin
              fsm_counter <= 8'h0;
            end
          end
        end
        fsm_enumDef_Register_data : begin
          if(when_MdioCtrl_l213) begin
            fsm_counter <= (fsm_counter + 8'h01);
            if(when_MdioCtrl_l216) begin
              fsm_counter <= 8'h0;
            end
          end
        end
        fsm_enumDef_END_1 : begin
          if(when_MdioCtrl_l225) begin
            rsp_valid_1 <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    mdc_regNext <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_1 <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_2 <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_3 <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_4 <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_5 <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_6 <= mdc;
  end

  always @(posedge clk) begin
    mdc_regNext_7 <= mdc;
  end


endmodule
