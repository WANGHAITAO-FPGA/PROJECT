// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Apb_Spi_Test
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module Apb_Spi_Test (
  output     [0:0]    spi_ss,
  output              spi_sclk,
  output              spi_mosi,
  input               spi_miso,
  input      [7:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  input               clk,
  input               reset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

  reg                 spictrl_io_rsp_queueWithOccupancy_io_pop_ready;
  wire                spictrl_io_cmd_ready;
  wire                spictrl_io_rsp_valid;
  wire       [15:0]   spictrl_io_rsp_payload;
  wire                spictrl_io_spi_sclk;
  wire                spictrl_io_spi_mosi;
  wire       [0:0]    spictrl_io_spi_ss;
  wire                streamFifo_2_io_push_ready;
  wire                streamFifo_2_io_pop_valid;
  wire       [0:0]    streamFifo_2_io_pop_payload_mode;
  wire       [16:0]   streamFifo_2_io_pop_payload_args;
  wire       [5:0]    streamFifo_2_io_occupancy;
  wire       [5:0]    streamFifo_2_io_availability;
  wire                spictrl_io_rsp_queueWithOccupancy_io_push_ready;
  wire                spictrl_io_rsp_queueWithOccupancy_io_pop_valid;
  wire       [15:0]   spictrl_io_rsp_queueWithOccupancy_io_pop_payload;
  wire       [5:0]    spictrl_io_rsp_queueWithOccupancy_io_occupancy;
  wire       [5:0]    spictrl_io_rsp_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz__zz_io_push_payload_args;
  wire                factory_askWrite;
  wire                factory_askRead;
  wire                factory_doWrite;
  wire                factory_doRead;
  wire       [0:0]    _zz_io_push_payload_mode;
  reg        [16:0]   _zz_io_push_payload_args;
  reg                 _zz_io_push_valid;
  wire                spictrl_io_rsp_toStream_valid;
  wire                spictrl_io_rsp_toStream_ready;
  wire       [15:0]   spictrl_io_rsp_toStream_payload;
  reg                 _zz_apb_PRDATA;
  reg                 _zz_apb_PRDATA_1;
  reg                 _zz_io_config_kind_cpol;
  reg                 _zz_io_config_kind_cpha;
  reg        [9:0]    _zz_io_config_sclkToogle;
  reg        [0:0]    _zz_io_config_ss_activeHigh;
  reg        [9:0]    _zz_io_config_ss_setup;
  reg        [9:0]    _zz_io_config_ss_hold;
  reg        [9:0]    _zz_io_config_ss_disable;
  wire       [0:0]    _zz_io_push_payload_mode_1;
  wire       [1:0]    _zz_io_config_kind_cpol_1;
  `ifndef SYNTHESIS
  reg [31:0] _zz_io_push_payload_mode_string;
  reg [31:0] _zz_io_push_payload_mode_1_string;
  `endif


  assign _zz__zz_io_push_payload_args = apb_PWDATA[24];
  SpiMasterCtrl spictrl (
    .io_config_kind_cpol     (_zz_io_config_kind_cpol               ), //i
    .io_config_kind_cpha     (_zz_io_config_kind_cpha               ), //i
    .io_config_sclkToogle    (_zz_io_config_sclkToogle[9:0]         ), //i
    .io_config_ss_activeHigh (_zz_io_config_ss_activeHigh           ), //i
    .io_config_ss_setup      (_zz_io_config_ss_setup[9:0]           ), //i
    .io_config_ss_hold       (_zz_io_config_ss_hold[9:0]            ), //i
    .io_config_ss_disable    (_zz_io_config_ss_disable[9:0]         ), //i
    .io_cmd_valid            (streamFifo_2_io_pop_valid             ), //i
    .io_cmd_ready            (spictrl_io_cmd_ready                  ), //o
    .io_cmd_payload_mode     (streamFifo_2_io_pop_payload_mode      ), //i
    .io_cmd_payload_args     (streamFifo_2_io_pop_payload_args[16:0]), //i
    .io_rsp_valid            (spictrl_io_rsp_valid                  ), //o
    .io_rsp_payload          (spictrl_io_rsp_payload[15:0]          ), //o
    .io_spi_ss               (spictrl_io_spi_ss                     ), //o
    .io_spi_sclk             (spictrl_io_spi_sclk                   ), //o
    .io_spi_mosi             (spictrl_io_spi_mosi                   ), //o
    .io_spi_miso             (spi_miso                              ), //i
    .clk                     (clk                                   ), //i
    .reset                   (reset                                 )  //i
  );
  StreamFifo streamFifo_2 (
    .io_push_valid        (_zz_io_push_valid                     ), //i
    .io_push_ready        (streamFifo_2_io_push_ready            ), //o
    .io_push_payload_mode (_zz_io_push_payload_mode              ), //i
    .io_push_payload_args (_zz_io_push_payload_args[16:0]        ), //i
    .io_pop_valid         (streamFifo_2_io_pop_valid             ), //o
    .io_pop_ready         (spictrl_io_cmd_ready                  ), //i
    .io_pop_payload_mode  (streamFifo_2_io_pop_payload_mode      ), //o
    .io_pop_payload_args  (streamFifo_2_io_pop_payload_args[16:0]), //o
    .io_flush             (1'b0                                  ), //i
    .io_occupancy         (streamFifo_2_io_occupancy[5:0]        ), //o
    .io_availability      (streamFifo_2_io_availability[5:0]     ), //o
    .clk                  (clk                                   ), //i
    .reset                (reset                                 )  //i
  );
  StreamFifo_1 spictrl_io_rsp_queueWithOccupancy (
    .io_push_valid   (spictrl_io_rsp_toStream_valid                         ), //i
    .io_push_ready   (spictrl_io_rsp_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (spictrl_io_rsp_toStream_payload[15:0]                 ), //i
    .io_pop_valid    (spictrl_io_rsp_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (spictrl_io_rsp_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload  (spictrl_io_rsp_queueWithOccupancy_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                                                  ), //i
    .io_occupancy    (spictrl_io_rsp_queueWithOccupancy_io_occupancy[5:0]   ), //o
    .io_availability (spictrl_io_rsp_queueWithOccupancy_io_availability[5:0]), //o
    .clk             (clk                                                   ), //i
    .reset           (reset                                                 )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_io_push_payload_mode)
      SpiMasterCtrlCmdMode_DATA : _zz_io_push_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_io_push_payload_mode_string = "SS  ";
      default : _zz_io_push_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_push_payload_mode_1)
      SpiMasterCtrlCmdMode_DATA : _zz_io_push_payload_mode_1_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_io_push_payload_mode_1_string = "SS  ";
      default : _zz_io_push_payload_mode_1_string = "????";
    endcase
  end
  `endif

  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      8'h0 : begin
        apb_PRDATA[31 : 31] = (spictrl_io_rsp_queueWithOccupancy_io_pop_valid ^ 1'b0);
        apb_PRDATA[15 : 0] = spictrl_io_rsp_queueWithOccupancy_io_pop_payload;
        apb_PRDATA[21 : 16] = spictrl_io_rsp_queueWithOccupancy_io_occupancy;
      end
      8'h04 : begin
        apb_PRDATA[21 : 16] = streamFifo_2_io_availability;
        apb_PRDATA[0 : 0] = _zz_apb_PRDATA;
        apb_PRDATA[1 : 1] = _zz_apb_PRDATA_1;
        apb_PRDATA[8 : 8] = (_zz_apb_PRDATA && (! streamFifo_2_io_pop_valid));
        apb_PRDATA[9 : 9] = (_zz_apb_PRDATA_1 && spictrl_io_rsp_queueWithOccupancy_io_pop_valid);
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign factory_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign factory_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign factory_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign factory_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(*) begin
    _zz_io_push_valid = 1'b0;
    case(apb_PADDR)
      8'h0 : begin
        if(factory_doWrite) begin
          _zz_io_push_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_push_payload_mode)
      SpiMasterCtrlCmdMode_DATA : begin
        _zz_io_push_payload_args = {apb_PWDATA[24],apb_PWDATA[15 : 0]};
      end
      default : begin
        _zz_io_push_payload_args = {16'd0, _zz__zz_io_push_payload_args};
      end
    endcase
  end

  assign spictrl_io_rsp_toStream_valid = spictrl_io_rsp_valid;
  assign spictrl_io_rsp_toStream_payload = spictrl_io_rsp_payload;
  assign spictrl_io_rsp_toStream_ready = spictrl_io_rsp_queueWithOccupancy_io_push_ready;
  always @(*) begin
    spictrl_io_rsp_queueWithOccupancy_io_pop_ready = 1'b0;
    case(apb_PADDR)
      8'h0 : begin
        if(factory_doRead) begin
          spictrl_io_rsp_queueWithOccupancy_io_pop_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign spi_ss = spictrl_io_spi_ss;
  assign spi_sclk = spictrl_io_spi_sclk;
  assign spi_mosi = spictrl_io_spi_mosi;
  assign _zz_io_push_payload_mode_1 = apb_PWDATA[28 : 28];
  assign _zz_io_push_payload_mode = _zz_io_push_payload_mode_1;
  assign _zz_io_config_kind_cpol_1 = apb_PWDATA[1 : 0];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_apb_PRDATA <= 1'b0;
      _zz_apb_PRDATA_1 <= 1'b0;
      _zz_io_config_ss_activeHigh <= 1'b0;
    end else begin
      case(apb_PADDR)
        8'h04 : begin
          if(factory_doWrite) begin
            _zz_apb_PRDATA <= apb_PWDATA[0];
            _zz_apb_PRDATA_1 <= apb_PWDATA[1];
          end
        end
        8'h08 : begin
          if(factory_doWrite) begin
            _zz_io_config_ss_activeHigh <= apb_PWDATA[4 : 4];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(apb_PADDR)
      8'h08 : begin
        if(factory_doWrite) begin
          _zz_io_config_kind_cpol <= _zz_io_config_kind_cpol_1[0];
          _zz_io_config_kind_cpha <= _zz_io_config_kind_cpol_1[1];
        end
      end
      8'h0c : begin
        if(factory_doWrite) begin
          _zz_io_config_sclkToogle <= apb_PWDATA[9 : 0];
        end
      end
      8'h10 : begin
        if(factory_doWrite) begin
          _zz_io_config_ss_setup <= apb_PWDATA[9 : 0];
        end
      end
      8'h14 : begin
        if(factory_doWrite) begin
          _zz_io_config_ss_hold <= apb_PWDATA[9 : 0];
        end
      end
      8'h18 : begin
        if(factory_doWrite) begin
          _zz_io_config_ss_disable <= apb_PWDATA[9 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module StreamFifo_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [15:0]   io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [15:0]   _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
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
  wire       [4:0]    logic_ptrDif;
  reg [15:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
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
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
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

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [0:0]    io_push_payload_mode,
  input      [16:0]   io_push_payload_args,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [0:0]    io_pop_payload_mode,
  output     [16:0]   io_pop_payload_args,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk,
  input               reset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

  reg        [17:0]   _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz__zz_io_pop_payload_mode_1;
  wire       [17:0]   _zz_logic_ram_port_1;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire       [0:0]    _zz_io_pop_payload_mode;
  wire       [17:0]   _zz_io_pop_payload_mode_1;
  wire       [0:0]    _zz_io_pop_payload_mode_2;
  wire                when_Stream_l1078;
  wire       [4:0]    logic_ptrDif;
  `ifndef SYNTHESIS
  reg [31:0] io_push_payload_mode_string;
  reg [31:0] io_pop_payload_mode_string;
  reg [31:0] _zz_io_pop_payload_mode_string;
  reg [31:0] _zz_io_pop_payload_mode_2_string;
  `endif

  reg [17:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz__zz_io_pop_payload_mode_1 = 1'b1;
  assign _zz_logic_ram_port_1 = {io_push_payload_args,io_push_payload_mode};
  always @(posedge clk) begin
    if(_zz__zz_io_pop_payload_mode_1) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_push_payload_mode)
      SpiMasterCtrlCmdMode_DATA : io_push_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : io_push_payload_mode_string = "SS  ";
      default : io_push_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(io_pop_payload_mode)
      SpiMasterCtrlCmdMode_DATA : io_pop_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : io_pop_payload_mode_string = "SS  ";
      default : io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_mode)
      SpiMasterCtrlCmdMode_DATA : _zz_io_pop_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_io_pop_payload_mode_string = "SS  ";
      default : _zz_io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_mode_2)
      SpiMasterCtrlCmdMode_DATA : _zz_io_pop_payload_mode_2_string = "DATA";
      SpiMasterCtrlCmdMode_SS : _zz_io_pop_payload_mode_2_string = "SS  ";
      default : _zz_io_pop_payload_mode_2_string = "????";
    endcase
  end
  `endif

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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign _zz_io_pop_payload_mode_1 = _zz_logic_ram_port0;
  assign _zz_io_pop_payload_mode_2 = _zz_io_pop_payload_mode_1[0 : 0];
  assign _zz_io_pop_payload_mode = _zz_io_pop_payload_mode_2;
  assign io_pop_payload_mode = _zz_io_pop_payload_mode;
  assign io_pop_payload_args = _zz_io_pop_payload_mode_1[17 : 1];
  assign when_Stream_l1078 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
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

module SpiMasterCtrl (
  input               io_config_kind_cpol,
  input               io_config_kind_cpha,
  input      [9:0]    io_config_sclkToogle,
  input      [0:0]    io_config_ss_activeHigh,
  input      [9:0]    io_config_ss_setup,
  input      [9:0]    io_config_ss_hold,
  input      [9:0]    io_config_ss_disable,
  input               io_cmd_valid,
  output reg          io_cmd_ready,
  input      [0:0]    io_cmd_payload_mode,
  input      [16:0]   io_cmd_payload_args,
  output              io_rsp_valid,
  output     [15:0]   io_rsp_payload,
  output     [0:0]    io_spi_ss,
  output              io_spi_sclk,
  output              io_spi_mosi,
  input               io_spi_miso,
  input               clk,
  input               reset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

  wire       [4:0]    _zz_fsm_counter_valueNext;
  wire       [0:0]    _zz_fsm_counter_valueNext_1;
  wire       [16:0]   _zz_fsm_buffer;
  wire                _zz_when;
  wire       [15:0]   _zz__zz_io_spi_mosi;
  wire       [3:0]    _zz__zz_io_spi_mosi_1;
  wire       [3:0]    _zz__zz_io_spi_mosi_2;
  reg        [9:0]    timer_counter;
  reg                 timer_reset;
  wire                timer_ss_setupHit;
  wire                timer_ss_holdHit;
  wire                timer_ss_disableHit;
  wire                timer_sclkToogleHit;
  reg                 fsm_counter_willIncrement;
  wire                fsm_counter_willClear;
  reg        [4:0]    fsm_counter_valueNext;
  reg        [4:0]    fsm_counter_value;
  wire                fsm_counter_willOverflowIfInc;
  wire                fsm_counter_willOverflow;
  reg        [15:0]   fsm_buffer;
  reg        [0:0]    fsm_ss;
  wire                when_SpiMasterCtrl_l194;
  wire                when_SpiMasterCtrl_l199;
  wire                when_SpiMasterCtrl_l211;
  wire                io_cmd_fire;
  reg                 _zz_io_rsp_valid;
  wire                when_SpiMasterCtrl_l232;
  reg                 _zz_io_spi_sclk;
  reg                 _zz_io_spi_mosi;
  `ifndef SYNTHESIS
  reg [31:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_when = io_cmd_payload_args[0];
  assign _zz_fsm_counter_valueNext_1 = fsm_counter_willIncrement;
  assign _zz_fsm_counter_valueNext = {4'd0, _zz_fsm_counter_valueNext_1};
  assign _zz_fsm_buffer = {fsm_buffer,io_spi_miso};
  assign _zz__zz_io_spi_mosi = io_cmd_payload_args[15 : 0];
  assign _zz__zz_io_spi_mosi_1 = (4'b1111 - _zz__zz_io_spi_mosi_2);
  assign _zz__zz_io_spi_mosi_2 = (fsm_counter_value >>> 1);
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      SpiMasterCtrlCmdMode_DATA : io_cmd_payload_mode_string = "DATA";
      SpiMasterCtrlCmdMode_SS : io_cmd_payload_mode_string = "SS  ";
      default : io_cmd_payload_mode_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          timer_reset = 1'b1;
        end
      end else begin
        if(!_zz_when) begin
          if(when_SpiMasterCtrl_l211) begin
            if(timer_ss_holdHit) begin
              timer_reset = 1'b1;
            end
          end
        end
      end
    end
    if(when_SpiMasterCtrl_l232) begin
      timer_reset = 1'b1;
    end
  end

  assign timer_ss_setupHit = (timer_counter == io_config_ss_setup);
  assign timer_ss_holdHit = (timer_counter == io_config_ss_hold);
  assign timer_ss_disableHit = (timer_counter == io_config_ss_disable);
  assign timer_sclkToogleHit = (timer_counter == io_config_sclkToogle);
  always @(*) begin
    fsm_counter_willIncrement = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          fsm_counter_willIncrement = 1'b1;
        end
      end else begin
        if(!_zz_when) begin
          if(when_SpiMasterCtrl_l211) begin
            if(timer_ss_holdHit) begin
              fsm_counter_willIncrement = 1'b1;
            end
          end
        end
      end
    end
  end

  assign fsm_counter_willClear = 1'b0;
  assign fsm_counter_willOverflowIfInc = (fsm_counter_value == 5'h1f);
  assign fsm_counter_willOverflow = (fsm_counter_willOverflowIfInc && fsm_counter_willIncrement);
  always @(*) begin
    fsm_counter_valueNext = (fsm_counter_value + _zz_fsm_counter_valueNext);
    if(fsm_counter_willClear) begin
      fsm_counter_valueNext = 5'h0;
    end
  end

  always @(*) begin
    io_cmd_ready = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          io_cmd_ready = fsm_counter_willOverflowIfInc;
        end
      end else begin
        if(_zz_when) begin
          if(timer_ss_setupHit) begin
            io_cmd_ready = 1'b1;
          end
        end else begin
          if(!when_SpiMasterCtrl_l211) begin
            if(timer_ss_disableHit) begin
              io_cmd_ready = 1'b1;
            end
          end
        end
      end
    end
  end

  assign when_SpiMasterCtrl_l194 = (io_cmd_payload_mode == SpiMasterCtrlCmdMode_DATA);
  assign when_SpiMasterCtrl_l199 = fsm_counter_value[0];
  assign when_SpiMasterCtrl_l211 = (! fsm_counter_value[0]);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign io_rsp_valid = _zz_io_rsp_valid;
  assign io_rsp_payload = fsm_buffer;
  assign when_SpiMasterCtrl_l232 = ((! io_cmd_valid) || io_cmd_ready);
  assign io_spi_ss = (fsm_ss ^ io_config_ss_activeHigh);
  assign io_spi_sclk = _zz_io_spi_sclk;
  assign io_spi_mosi = _zz_io_spi_mosi;
  always @(posedge clk) begin
    timer_counter <= (timer_counter + 10'h001);
    if(timer_reset) begin
      timer_counter <= 10'h0;
    end
    if(io_cmd_valid) begin
      if(when_SpiMasterCtrl_l194) begin
        if(timer_sclkToogleHit) begin
          if(when_SpiMasterCtrl_l199) begin
            fsm_buffer <= _zz_fsm_buffer[15:0];
          end
        end
      end
    end
    _zz_io_spi_sclk <= (((io_cmd_valid && (io_cmd_payload_mode == SpiMasterCtrlCmdMode_DATA)) && (fsm_counter_value[0] ^ io_config_kind_cpha)) ^ io_config_kind_cpol);
    _zz_io_spi_mosi <= _zz__zz_io_spi_mosi[_zz__zz_io_spi_mosi_1];
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_counter_value <= 5'h0;
      fsm_ss <= 1'b1;
      _zz_io_rsp_valid <= 1'b0;
    end else begin
      fsm_counter_value <= fsm_counter_valueNext;
      if(io_cmd_valid) begin
        if(!when_SpiMasterCtrl_l194) begin
          if(_zz_when) begin
            fsm_ss[0] <= 1'b0;
          end else begin
            if(!when_SpiMasterCtrl_l211) begin
              fsm_ss[0] <= 1'b1;
            end
          end
        end
      end
      _zz_io_rsp_valid <= ((io_cmd_fire && (io_cmd_payload_mode == SpiMasterCtrlCmdMode_DATA)) && io_cmd_payload_args[16]);
      if(when_SpiMasterCtrl_l232) begin
        fsm_counter_value <= 5'h0;
      end
    end
  end


endmodule
