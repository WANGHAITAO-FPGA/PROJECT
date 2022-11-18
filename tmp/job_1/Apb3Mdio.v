// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Apb3Mdio
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module Apb3Mdio (
  input      [7:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              mdio_MDC,
  input               mdio_MDIO_read,
  output              mdio_MDIO_write,
  output              mdio_MDIO_writeEnable,
  input               clk,
  input               reset
);

  wire       [15:0]   mdioctrl_1_cmd_payload;
  reg                 mdioctrl_1_rsp_queueWithOccupancy_io_pop_ready;
  wire                mdioctrl_1_rsp_valid;
  wire       [15:0]   mdioctrl_1_rsp_payload;
  wire                mdioctrl_1_mdio_MDC;
  wire                mdioctrl_1_mdio_MDIO_write;
  wire                mdioctrl_1_mdio_MDIO_writeEnable;
  wire                mdioctrl_1_rsp_queueWithOccupancy_io_push_ready;
  wire                mdioctrl_1_rsp_queueWithOccupancy_io_pop_valid;
  wire       [15:0]   mdioctrl_1_rsp_queueWithOccupancy_io_pop_payload;
  wire       [3:0]    mdioctrl_1_rsp_queueWithOccupancy_io_occupancy;
  wire       [3:0]    mdioctrl_1_rsp_queueWithOccupancy_io_availability;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 _zz_cmd_valid;
  wire                mdioctrl_1_rsp_toStream_valid;
  wire                mdioctrl_1_rsp_toStream_ready;
  wire       [15:0]   mdioctrl_1_rsp_toStream_payload;
  reg        [9:0]    _zz_config_sclkToogle;
  reg        [31:0]   _zz_config_preamble;
  reg        [1:0]    _zz_config_frame_start;
  reg        [1:0]    _zz_config_opCode;
  reg        [4:0]    _zz_config_phy_device_addr;
  reg        [4:0]    _zz_config_phy_reg_addr;

  MdioCtrl mdioctrl_1 (
    .config_sclkToogle      (_zz_config_sclkToogle[9:0]      ), //i
    .config_preamble        (_zz_config_preamble[31:0]       ), //i
    .config_frame_start     (_zz_config_frame_start[1:0]     ), //i
    .config_opCode          (_zz_config_opCode[1:0]          ), //i
    .config_phy_device_addr (_zz_config_phy_device_addr[4:0] ), //i
    .config_phy_reg_addr    (_zz_config_phy_reg_addr[4:0]    ), //i
    .cmd_valid              (_zz_cmd_valid                   ), //i
    .cmd_payload            (mdioctrl_1_cmd_payload[15:0]    ), //i
    .rsp_valid              (mdioctrl_1_rsp_valid            ), //o
    .rsp_payload            (mdioctrl_1_rsp_payload[15:0]    ), //o
    .mdio_MDC               (mdioctrl_1_mdio_MDC             ), //o
    .mdio_MDIO_read         (mdio_MDIO_read                  ), //i
    .mdio_MDIO_write        (mdioctrl_1_mdio_MDIO_write      ), //o
    .mdio_MDIO_writeEnable  (mdioctrl_1_mdio_MDIO_writeEnable), //o
    .clk                    (clk                             ), //i
    .reset                  (reset                           )  //i
  );
  StreamFifo mdioctrl_1_rsp_queueWithOccupancy (
    .io_push_valid   (mdioctrl_1_rsp_toStream_valid                         ), //i
    .io_push_ready   (mdioctrl_1_rsp_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (mdioctrl_1_rsp_toStream_payload[15:0]                 ), //i
    .io_pop_valid    (mdioctrl_1_rsp_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (mdioctrl_1_rsp_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload  (mdioctrl_1_rsp_queueWithOccupancy_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                                                  ), //i
    .io_occupancy    (mdioctrl_1_rsp_queueWithOccupancy_io_occupancy[3:0]   ), //o
    .io_availability (mdioctrl_1_rsp_queueWithOccupancy_io_availability[3:0]), //o
    .clk             (clk                                                   ), //i
    .reset           (reset                                                 )  //i
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      8'h0 : begin
        apb_PRDATA[19 : 16] = mdioctrl_1_rsp_queueWithOccupancy_io_occupancy;
      end
      8'h04 : begin
        apb_PRDATA[31 : 31] = (mdioctrl_1_rsp_queueWithOccupancy_io_pop_valid ^ 1'b0);
        apb_PRDATA[15 : 0] = mdioctrl_1_rsp_queueWithOccupancy_io_pop_payload;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busCtrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busCtrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busCtrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(*) begin
    _zz_cmd_valid = 1'b0;
    case(apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_cmd_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign mdioctrl_1_cmd_payload = apb_PWDATA[15 : 0];
  assign mdioctrl_1_rsp_toStream_valid = mdioctrl_1_rsp_valid;
  assign mdioctrl_1_rsp_toStream_payload = mdioctrl_1_rsp_payload;
  assign mdioctrl_1_rsp_toStream_ready = mdioctrl_1_rsp_queueWithOccupancy_io_push_ready;
  always @(*) begin
    mdioctrl_1_rsp_queueWithOccupancy_io_pop_ready = 1'b0;
    case(apb_PADDR)
      8'h04 : begin
        if(busCtrl_doRead) begin
          mdioctrl_1_rsp_queueWithOccupancy_io_pop_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign mdio_MDC = mdioctrl_1_mdio_MDC;
  assign mdio_MDIO_write = mdioctrl_1_mdio_MDIO_write;
  assign mdio_MDIO_writeEnable = mdioctrl_1_mdio_MDIO_writeEnable;
  always @(posedge clk) begin
    case(apb_PADDR)
      8'h08 : begin
        if(busCtrl_doWrite) begin
          _zz_config_sclkToogle <= apb_PWDATA[9 : 0];
        end
      end
      8'h0c : begin
        if(busCtrl_doWrite) begin
          _zz_config_preamble <= apb_PWDATA[31 : 0];
        end
      end
      8'h10 : begin
        if(busCtrl_doWrite) begin
          _zz_config_frame_start <= apb_PWDATA[1 : 0];
        end
      end
      8'h14 : begin
        if(busCtrl_doWrite) begin
          _zz_config_opCode <= apb_PWDATA[1 : 0];
        end
      end
      8'h18 : begin
        if(busCtrl_doWrite) begin
          _zz_config_phy_device_addr <= apb_PWDATA[4 : 0];
        end
      end
      8'h1c : begin
        if(busCtrl_doWrite) begin
          _zz_config_phy_reg_addr <= apb_PWDATA[4 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [15:0]   io_pop_payload,
  input               io_flush,
  output     [3:0]    io_occupancy,
  output     [3:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [15:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [2:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1078;
  wire       [2:0]    logic_ptrDif;
  reg [15:0] logic_ram [0:7];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
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
  assign when_Stream_l1078 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1078) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module MdioCtrl (
  input      [9:0]    config_sclkToogle,
  input      [31:0]   config_preamble,
  input      [1:0]    config_frame_start,
  input      [1:0]    config_opCode,
  input      [4:0]    config_phy_device_addr,
  input      [4:0]    config_phy_reg_addr,
  input               cmd_valid,
  input      [15:0]   cmd_payload,
  output              rsp_valid,
  output     [15:0]   rsp_payload,
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
  localparam fsm_enumDef_Turn_around = 4'd7;
  localparam fsm_enumDef_Register_data = 4'd8;
  localparam fsm_enumDef_END_1 = 4'd9;
  localparam MdioCtrlCmdMode_READ = 2'd2;
  localparam MdioCtrlCmdMode_WRITE = 2'd1;

  wire       [4:0]    _zz_mdio_out;
  wire       [4:0]    _zz_mdio_out_1;
  wire       [6:0]    _zz_mdio_out_2;
  wire       [0:0]    _zz_mdio_out_3;
  wire       [0:0]    _zz_mdio_out_4;
  wire       [6:0]    _zz_mdio_out_5;
  wire       [0:0]    _zz_mdio_out_6;
  wire       [0:0]    _zz_mdio_out_7;
  wire       [6:0]    _zz_mdio_out_8;
  wire       [2:0]    _zz_mdio_out_9;
  wire       [2:0]    _zz_mdio_out_10;
  wire       [6:0]    _zz_mdio_out_11;
  wire       [2:0]    _zz_mdio_out_12;
  wire       [2:0]    _zz_mdio_out_13;
  wire       [6:0]    _zz_mdio_out_14;
  wire       [0:0]    _zz_mdio_out_15;
  wire       [0:0]    _zz_mdio_out_16;
  wire       [6:0]    _zz_mdio_out_17;
  wire       [16:0]   _zz_rsp_data;
  wire       [3:0]    _zz_mdio_out_18;
  wire       [3:0]    _zz_mdio_out_19;
  wire       [6:0]    _zz_mdio_out_20;
  reg        [9:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_sclkToogleHit;
  reg                 mdc;
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
  wire                when_MdioCtrl_l111;
  wire                when_MdioCtrl_l125;
  wire                when_MdioCtrl_l139;
  wire                when_MdioCtrl_l153;
  wire                when_MdioCtrl_l167;
  wire                when_MdioCtrl_l169;
  wire                when_MdioCtrl_l184;
  wire                when_MdioCtrl_l189;
  wire                when_MdioCtrl_l201;
  wire                when_MdioCtrl_l204;
  wire                when_MdioCtrl_l209;
  wire                when_MdioCtrl_l217;
  `ifndef SYNTHESIS
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_mdio_out = (5'h1f - _zz_mdio_out_1);
  assign _zz_mdio_out_2 = (fsm_counter >>> 1);
  assign _zz_mdio_out_1 = _zz_mdio_out_2[4:0];
  assign _zz_mdio_out_3 = (1'b1 - _zz_mdio_out_4);
  assign _zz_mdio_out_5 = (fsm_counter >>> 1);
  assign _zz_mdio_out_4 = _zz_mdio_out_5[0:0];
  assign _zz_mdio_out_6 = (1'b1 - _zz_mdio_out_7);
  assign _zz_mdio_out_8 = (fsm_counter >>> 1);
  assign _zz_mdio_out_7 = _zz_mdio_out_8[0:0];
  assign _zz_mdio_out_9 = (3'b100 - _zz_mdio_out_10);
  assign _zz_mdio_out_11 = (fsm_counter >>> 1);
  assign _zz_mdio_out_10 = _zz_mdio_out_11[2:0];
  assign _zz_mdio_out_12 = (3'b100 - _zz_mdio_out_13);
  assign _zz_mdio_out_14 = (fsm_counter >>> 1);
  assign _zz_mdio_out_13 = _zz_mdio_out_14[2:0];
  assign _zz_mdio_out_15 = (1'b1 - _zz_mdio_out_16);
  assign _zz_mdio_out_17 = (fsm_counter >>> 1);
  assign _zz_mdio_out_16 = _zz_mdio_out_17[0:0];
  assign _zz_rsp_data = {rsp_data,mdio_rddata};
  assign _zz_mdio_out_18 = (4'b1111 - _zz_mdio_out_19);
  assign _zz_mdio_out_20 = (fsm_counter >>> 1);
  assign _zz_mdio_out_19 = _zz_mdio_out_20[3:0];
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
      fsm_enumDef_Turn_around : fsm_stateNext_string = "Turn_around    ";
      fsm_enumDef_Register_data : fsm_stateNext_string = "Register_data  ";
      fsm_enumDef_END_1 : fsm_stateNext_string = "END_1          ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        if(cmd_valid) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Preamble : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Frame_start : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_OpCode : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Phy_device_addr : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Phy_reg_addr : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Turn_around : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_Register_data : begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end
      fsm_enumDef_END_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign timer_sclkToogleHit = (timer_counter == config_sclkToogle);
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
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l111) begin
            fsm_stateNext = fsm_enumDef_Frame_start;
          end
        end
      end
      fsm_enumDef_Frame_start : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l125) begin
            fsm_stateNext = fsm_enumDef_OpCode;
          end
        end
      end
      fsm_enumDef_OpCode : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l139) begin
            fsm_stateNext = fsm_enumDef_Phy_device_addr;
          end
        end
      end
      fsm_enumDef_Phy_device_addr : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l153) begin
            fsm_stateNext = fsm_enumDef_Phy_reg_addr;
          end
        end
      end
      fsm_enumDef_Phy_reg_addr : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l167) begin
            fsm_stateNext = fsm_enumDef_Turn_around;
          end
        end
      end
      fsm_enumDef_Turn_around : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l184) begin
            fsm_stateNext = fsm_enumDef_Register_data;
          end
        end
      end
      fsm_enumDef_Register_data : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l204) begin
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

  assign when_MdioCtrl_l111 = (fsm_counter == 8'h3f);
  assign when_MdioCtrl_l125 = (fsm_counter == 8'h03);
  assign when_MdioCtrl_l139 = (fsm_counter == 8'h03);
  assign when_MdioCtrl_l153 = (fsm_counter == 8'h09);
  assign when_MdioCtrl_l167 = (fsm_counter == 8'h09);
  assign when_MdioCtrl_l169 = (config_opCode == MdioCtrlCmdMode_READ);
  assign when_MdioCtrl_l184 = (fsm_counter == 8'h03);
  assign when_MdioCtrl_l189 = (config_opCode != MdioCtrlCmdMode_READ);
  assign when_MdioCtrl_l201 = fsm_counter[0];
  assign when_MdioCtrl_l204 = (fsm_counter == 8'h1f);
  assign when_MdioCtrl_l209 = (config_opCode != MdioCtrlCmdMode_READ);
  assign when_MdioCtrl_l217 = (config_opCode == MdioCtrlCmdMode_READ);
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 10'h001);
    if(timer_reset) begin
      timer_counter <= 10'h0;
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
      fsm_enumDef_Turn_around : begin
      end
      fsm_enumDef_Register_data : begin
        if(timer_sclkToogleHit) begin
          if(when_MdioCtrl_l201) begin
            rsp_data <= _zz_rsp_data[15:0];
          end
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
      mdc <= 1'b0;
      mdio_out <= 1'b0;
      mdio_write_enable <= 1'b0;
      rsp_valid_1 <= 1'b0;
      mdio_rddata <= 1'b0;
      fsm_counter <= 8'h0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      rsp_valid_1 <= 1'b0;
      mdio_rddata <= mdio_MDIO_read;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_IDLE : begin
          if(cmd_valid) begin
            fsm_counter <= 8'h0;
            mdc <= 1'b0;
            mdio_out <= 1'b0;
            mdio_write_enable <= 1'b1;
          end
        end
        fsm_enumDef_Preamble : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l111) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_preamble[_zz_mdio_out];
        end
        fsm_enumDef_Frame_start : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l125) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_frame_start[_zz_mdio_out_3];
        end
        fsm_enumDef_OpCode : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l139) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_opCode[_zz_mdio_out_6];
        end
        fsm_enumDef_Phy_device_addr : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l153) begin
              fsm_counter <= 8'h0;
            end
          end
          mdio_out <= config_phy_device_addr[_zz_mdio_out_9];
        end
        fsm_enumDef_Phy_reg_addr : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l167) begin
              fsm_counter <= 8'h0;
              if(when_MdioCtrl_l169) begin
                mdio_write_enable <= 1'b0;
              end
            end
          end
          mdio_out <= config_phy_reg_addr[_zz_mdio_out_12];
        end
        fsm_enumDef_Turn_around : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l184) begin
              fsm_counter <= 8'h0;
            end
          end
          if(when_MdioCtrl_l189) begin
            mdio_out <= config_opCode[_zz_mdio_out_15];
          end
        end
        fsm_enumDef_Register_data : begin
          if(timer_sclkToogleHit) begin
            fsm_counter <= (fsm_counter + 8'h01);
            mdc <= (! mdc);
            if(when_MdioCtrl_l204) begin
              fsm_counter <= 8'h0;
            end
          end
          if(when_MdioCtrl_l209) begin
            mdio_out <= cmd_reg_data[_zz_mdio_out_18];
          end
        end
        fsm_enumDef_END_1 : begin
          mdio_write_enable <= 1'b0;
          if(when_MdioCtrl_l217) begin
            rsp_valid_1 <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule
