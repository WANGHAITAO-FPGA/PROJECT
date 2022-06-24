// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : spi_test
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module spi_test (
  output     [0:0]    spi_ss,
  output              spi_sclk,
  output              spi_mosi,
  input               spi_miso,
  input               clk,
  input               reset
);
  localparam SpiMasterCtrlCmdMode_DATA = 1'd0;
  localparam SpiMasterCtrlCmdMode_SS = 1'd1;

  wire                spictrl_io_cmd_ready;
  wire                spictrl_io_rsp_valid;
  wire       [15:0]   spictrl_io_rsp_payload;
  wire                spictrl_io_spi_sclk;
  wire                spictrl_io_spi_mosi;
  wire       [0:0]    spictrl_io_spi_ss;
  wire       [12:0]   _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  wire                counter_willIncrement;
  reg                 counter_willClear;
  reg        [12:0]   counter_valueNext;
  reg        [12:0]   counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {12'd0, _zz_counter_valueNext_1};
  SpiMasterCtrl spictrl (
    .io_config_kind_cpol        (1'b0                          ), //i
    .io_config_kind_cpha        (1'b1                          ), //i
    .io_config_sclkToogle       (10'h064                       ), //i
    .io_config_ss_activeHigh    (1'b0                          ), //i
    .io_config_ss_setup         (10'h064                       ), //i
    .io_config_ss_hold          (10'h064                       ), //i
    .io_config_ss_disable       (10'h064                       ), //i
    .io_cmd_valid               (1'b1                          ), //i
    .io_cmd_ready               (spictrl_io_cmd_ready          ), //o
    .io_cmd_payload_mode        (SpiMasterCtrlCmdMode_DATA     ), //i
    .io_cmd_payload_args        (17'h05555                     ), //i
    .io_rsp_valid               (spictrl_io_rsp_valid          ), //o
    .io_rsp_payload             (spictrl_io_rsp_payload[15:0]  ), //o
    .io_spi_ss                  (spictrl_io_spi_ss             ), //o
    .io_spi_sclk                (spictrl_io_spi_sclk           ), //o
    .io_spi_mosi                (spictrl_io_spi_mosi           ), //o
    .io_spi_miso                (spi_miso                      ), //i
    .clk                        (clk                           ), //i
    .reset                      (reset                         )  //i
  );
  assign spi_ss = spictrl_io_spi_ss;
  assign spi_sclk = spictrl_io_spi_sclk;
  assign spi_mosi = spictrl_io_spi_mosi;
  always @(*) begin
    counter_willClear = 1'b0;
    if(counter_willOverflow) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 13'h1387);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 13'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 13'h0;
    end
  end

  assign counter_willIncrement = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 13'h0;
    end else begin
      counter_value <= counter_valueNext;
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
