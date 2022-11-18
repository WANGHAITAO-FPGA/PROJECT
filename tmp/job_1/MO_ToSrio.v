// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : MO_ToSrio
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module MO_ToSrio (
  input               hssl_input_valid,
  output              hssl_input_ready,
  input               hssl_input_payload_last,
  input      [31:0]   hssl_input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [63:0]   output_payload_fragment,
  input      [63:0]   header,
  input      [31:0]   slave_id,
  input      [63:0]   doorbell_Info,
  input               tick_in,
  output              tick_out,
  input               srio_clk,
  input               srio_reset,
  input               hssl_clk,
  input               hssl_reset
);
  localparam srio_area_fsm_enumDef_BOOT = 3'd0;
  localparam srio_area_fsm_enumDef_Wait_Start = 3'd1;
  localparam srio_area_fsm_enumDef_Send_HsslData = 3'd2;
  localparam srio_area_fsm_enumDef_Wait_SendDoorbell = 3'd3;
  localparam srio_area_fsm_enumDef_SendDoorbell = 3'd4;
  localparam srio_area_fsm_enumDef_End_1 = 3'd5;

  wire                hssl_area_hssl_fbrx_output_ready;
  wire                hssl_area_hssl_fbrx_hssl_input_ready;
  wire                hssl_area_hssl_fbrx_output_valid;
  wire                hssl_area_hssl_fbrx_output_payload_last;
  wire       [63:0]   hssl_area_hssl_fbrx_output_payload_fragment;
  wire                hssl_area_hssl_fbrx_pulse_out;
  reg                 srio_area_tick_in;
  reg                 srio_area_tick_out;
  reg                 srio_area_hssl_trigger;
  reg                 srio_area_swrite_trigger;
  reg                 srio_area_doorbell_trigger;
  wire                srio_area_fsm_wantExit;
  reg                 srio_area_fsm_wantStart;
  wire                srio_area_fsm_wantKill;
  reg        [2:0]    srio_area_fsm_stateReg;
  reg        [2:0]    srio_area_fsm_stateNext;
  reg                 srio_area_tick_in_regNext;
  wire                when_MO_FbRx_l118;
  `ifndef SYNTHESIS
  reg [135:0] srio_area_fsm_stateReg_string;
  reg [135:0] srio_area_fsm_stateNext_string;
  `endif


  MO_FbRx hssl_area_hssl_fbrx (
    .hssl_input_valid            (hssl_input_valid                                 ), //i
    .hssl_input_ready            (hssl_area_hssl_fbrx_hssl_input_ready             ), //o
    .hssl_input_payload_last     (hssl_input_payload_last                          ), //i
    .hssl_input_payload_fragment (hssl_input_payload_fragment[31:0]                ), //i
    .output_valid                (hssl_area_hssl_fbrx_output_valid                 ), //o
    .output_ready                (hssl_area_hssl_fbrx_output_ready                 ), //i
    .output_payload_last         (hssl_area_hssl_fbrx_output_payload_last          ), //o
    .output_payload_fragment     (hssl_area_hssl_fbrx_output_payload_fragment[63:0]), //o
    .slave_id                    (slave_id[31:0]                                   ), //i
    .pulse_out                   (hssl_area_hssl_fbrx_pulse_out                    ), //o
    .hssl_clk                    (hssl_clk                                         ), //i
    .hssl_reset                  (hssl_reset                                       ), //i
    .srio_clk                    (srio_clk                                         ), //i
    .srio_reset                  (srio_reset                                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(srio_area_fsm_stateReg)
      srio_area_fsm_enumDef_BOOT : srio_area_fsm_stateReg_string = "BOOT             ";
      srio_area_fsm_enumDef_Wait_Start : srio_area_fsm_stateReg_string = "Wait_Start       ";
      srio_area_fsm_enumDef_Send_HsslData : srio_area_fsm_stateReg_string = "Send_HsslData    ";
      srio_area_fsm_enumDef_Wait_SendDoorbell : srio_area_fsm_stateReg_string = "Wait_SendDoorbell";
      srio_area_fsm_enumDef_SendDoorbell : srio_area_fsm_stateReg_string = "SendDoorbell     ";
      srio_area_fsm_enumDef_End_1 : srio_area_fsm_stateReg_string = "End_1            ";
      default : srio_area_fsm_stateReg_string = "?????????????????";
    endcase
  end
  always @(*) begin
    case(srio_area_fsm_stateNext)
      srio_area_fsm_enumDef_BOOT : srio_area_fsm_stateNext_string = "BOOT             ";
      srio_area_fsm_enumDef_Wait_Start : srio_area_fsm_stateNext_string = "Wait_Start       ";
      srio_area_fsm_enumDef_Send_HsslData : srio_area_fsm_stateNext_string = "Send_HsslData    ";
      srio_area_fsm_enumDef_Wait_SendDoorbell : srio_area_fsm_stateNext_string = "Wait_SendDoorbell";
      srio_area_fsm_enumDef_SendDoorbell : srio_area_fsm_stateNext_string = "SendDoorbell     ";
      srio_area_fsm_enumDef_End_1 : srio_area_fsm_stateNext_string = "End_1            ";
      default : srio_area_fsm_stateNext_string = "?????????????????";
    endcase
  end
  `endif

  assign hssl_input_ready = hssl_area_hssl_fbrx_hssl_input_ready;
  assign srio_area_fsm_wantExit = 1'b0;
  always @(*) begin
    srio_area_fsm_wantStart = 1'b0;
    case(srio_area_fsm_stateReg)
      srio_area_fsm_enumDef_Wait_Start : begin
      end
      srio_area_fsm_enumDef_Send_HsslData : begin
      end
      srio_area_fsm_enumDef_Wait_SendDoorbell : begin
      end
      srio_area_fsm_enumDef_SendDoorbell : begin
      end
      srio_area_fsm_enumDef_End_1 : begin
      end
      default : begin
        srio_area_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign srio_area_fsm_wantKill = 1'b0;
  assign output_valid = (srio_area_swrite_trigger ? hssl_area_hssl_fbrx_output_valid : (srio_area_doorbell_trigger ? output_ready : 1'b0));
  assign output_payload_fragment = (srio_area_swrite_trigger ? hssl_area_hssl_fbrx_output_payload_fragment : (srio_area_doorbell_trigger ? doorbell_Info : 64'h0));
  assign output_payload_last = (srio_area_swrite_trigger ? hssl_area_hssl_fbrx_output_payload_last : (srio_area_doorbell_trigger ? output_ready : 1'b0));
  assign hssl_area_hssl_fbrx_output_ready = (srio_area_swrite_trigger ? output_ready : 1'b0);
  assign tick_out = srio_area_tick_out;
  always @(*) begin
    srio_area_fsm_stateNext = srio_area_fsm_stateReg;
    case(srio_area_fsm_stateReg)
      srio_area_fsm_enumDef_Wait_Start : begin
        if(when_MO_FbRx_l118) begin
          if(srio_area_hssl_trigger) begin
            srio_area_fsm_stateNext = srio_area_fsm_enumDef_Send_HsslData;
          end else begin
            srio_area_fsm_stateNext = srio_area_fsm_enumDef_End_1;
          end
        end
      end
      srio_area_fsm_enumDef_Send_HsslData : begin
        if(output_payload_last) begin
          srio_area_fsm_stateNext = srio_area_fsm_enumDef_Wait_SendDoorbell;
        end
      end
      srio_area_fsm_enumDef_Wait_SendDoorbell : begin
        srio_area_fsm_stateNext = srio_area_fsm_enumDef_SendDoorbell;
      end
      srio_area_fsm_enumDef_SendDoorbell : begin
        if(output_payload_last) begin
          srio_area_fsm_stateNext = srio_area_fsm_enumDef_End_1;
        end
      end
      srio_area_fsm_enumDef_End_1 : begin
        srio_area_fsm_stateNext = srio_area_fsm_enumDef_Wait_Start;
      end
      default : begin
      end
    endcase
    if(srio_area_fsm_wantStart) begin
      srio_area_fsm_stateNext = srio_area_fsm_enumDef_Wait_Start;
    end
    if(srio_area_fsm_wantKill) begin
      srio_area_fsm_stateNext = srio_area_fsm_enumDef_BOOT;
    end
  end

  assign when_MO_FbRx_l118 = (srio_area_tick_in && (! srio_area_tick_in_regNext));
  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      srio_area_tick_in <= 1'b0;
      srio_area_tick_out <= 1'b0;
      srio_area_hssl_trigger <= 1'b0;
      srio_area_swrite_trigger <= 1'b0;
      srio_area_doorbell_trigger <= 1'b0;
      srio_area_fsm_stateReg <= srio_area_fsm_enumDef_BOOT;
    end else begin
      srio_area_tick_in <= tick_in;
      srio_area_tick_out <= 1'b0;
      srio_area_hssl_trigger <= hssl_area_hssl_fbrx_pulse_out;
      srio_area_swrite_trigger <= 1'b0;
      srio_area_doorbell_trigger <= 1'b0;
      srio_area_fsm_stateReg <= srio_area_fsm_stateNext;
      case(srio_area_fsm_stateReg)
        srio_area_fsm_enumDef_Wait_Start : begin
        end
        srio_area_fsm_enumDef_Send_HsslData : begin
          srio_area_swrite_trigger <= 1'b1;
        end
        srio_area_fsm_enumDef_Wait_SendDoorbell : begin
        end
        srio_area_fsm_enumDef_SendDoorbell : begin
          srio_area_doorbell_trigger <= 1'b1;
          if(output_payload_last) begin
            srio_area_doorbell_trigger <= 1'b0;
          end
        end
        srio_area_fsm_enumDef_End_1 : begin
          srio_area_tick_out <= 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge srio_clk) begin
    srio_area_tick_in_regNext <= srio_area_tick_in;
  end


endmodule

module MO_FbRx (
  input               hssl_input_valid,
  output              hssl_input_ready,
  input               hssl_input_payload_last,
  input      [31:0]   hssl_input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [63:0]   output_payload_fragment,
  input      [31:0]   slave_id,
  output              pulse_out,
  input               hssl_clk,
  input               hssl_reset,
  input               srio_clk,
  input               srio_reset
);

  wire                hssl_pusharea_hssl_rxpadder_output_ready;
  wire       [63:0]   srio_area_streamfifo_io_push_payload;
  reg        [63:0]   _zz_hssl_pusharea_ram_port0;
  wire       [63:0]   _zz_hssl_pusharea_ram_port1;
  wire                hssl_pusharea_hssl_rxpreamble_input_ready;
  wire                hssl_pusharea_hssl_rxpreamble_output_valid;
  wire                hssl_pusharea_hssl_rxpreamble_output_payload_last;
  wire       [31:0]   hssl_pusharea_hssl_rxpreamble_output_payload_fragment;
  wire                hssl_pusharea_hssl_rxpadder_input_ready;
  wire                hssl_pusharea_hssl_rxpadder_output_valid;
  wire                hssl_pusharea_hssl_rxpadder_output_payload_last;
  wire       [31:0]   hssl_pusharea_hssl_rxpadder_output_payload_fragment;
  wire                hssl_pusharea_pulse_io_pulseOut;
  wire                srio_area_streamfifo_io_push_ready;
  wire                srio_area_streamfifo_io_pop_valid;
  wire       [63:0]   srio_area_streamfifo_io_pop_payload;
  wire       [6:0]    srio_area_streamfifo_io_occupancy;
  wire       [6:0]    srio_area_streamfifo_io_availability;
  wire       [63:0]   _zz_hssl_pusharea_hssl_stream_payload_fragment_2;
  wire       [6:0]    _zz_hssl_pusharea_wcounter_valueNext;
  wire       [0:0]    _zz_hssl_pusharea_wcounter_valueNext_1;
  wire       [5:0]    _zz_hssl_pusharea_ram_port;
  wire                _zz_hssl_pusharea_ram_port_1;
  wire       [6:0]    _zz_srio_area_counter_valueNext;
  wire       [0:0]    _zz_srio_area_counter_valueNext_1;
  wire       [5:0]    _zz_hssl_pusharea_ram_port_2;
  wire       [5:0]    _zz_io_push_payload_1;
  wire                hssl_pusharea_hssl_stream_valid;
  wire                hssl_pusharea_hssl_stream_ready;
  wire                hssl_pusharea_hssl_stream_payload_last;
  wire       [63:0]   hssl_pusharea_hssl_stream_payload_fragment;
  wire                hssl_pusharea_hssl_rxpadder_output_fire;
  reg                 _zz_hssl_pusharea_hssl_stream_valid;
  reg        [0:0]    _zz_hssl_pusharea_hssl_stream_valid_1;
  reg        [0:0]    _zz_hssl_pusharea_hssl_stream_valid_2;
  wire                _zz_hssl_pusharea_hssl_stream_valid_3;
  reg        [31:0]   _zz_hssl_pusharea_hssl_stream_payload_fragment;
  wire                hssl_pusharea_hssl_rxpadder_output_fire_1;
  wire       [63:0]   _zz_hssl_pusharea_hssl_stream_payload_fragment_1;
  reg                 hssl_pusharea_wcounter_willIncrement;
  reg                 hssl_pusharea_wcounter_willClear;
  reg        [6:0]    hssl_pusharea_wcounter_valueNext;
  reg        [6:0]    hssl_pusharea_wcounter_value;
  wire                hssl_pusharea_wcounter_willOverflowIfInc;
  wire                hssl_pusharea_wcounter_willOverflow;
  wire                hssl_pusharea_hssl_stream_fire;
  wire                hssl_pusharea_hssl_stream_fire_1;
  reg                 srio_area_pulse_out;
  reg                 srio_area_valid;
  reg                 srio_area_counter_willIncrement;
  reg                 srio_area_counter_willClear;
  reg        [6:0]    srio_area_counter_valueNext;
  reg        [6:0]    srio_area_counter_value;
  wire                srio_area_counter_willOverflowIfInc;
  wire                srio_area_counter_willOverflow;
  wire                when_MO_FbRx_l60;
  wire                when_MO_FbRx_l62;
  wire       [6:0]    _zz_io_push_payload;
  wire                srio_area_streamfifo_io_pop_fire;
  (* ram_style = "block" , ram_style = "distributed" *) reg [63:0] hssl_pusharea_ram [0:63];

  assign _zz_hssl_pusharea_hssl_stream_payload_fragment_2 = {_zz_hssl_pusharea_hssl_stream_payload_fragment_1[31 : 0],_zz_hssl_pusharea_hssl_stream_payload_fragment_1[63 : 32]};
  assign _zz_hssl_pusharea_wcounter_valueNext_1 = hssl_pusharea_wcounter_willIncrement;
  assign _zz_hssl_pusharea_wcounter_valueNext = {6'd0, _zz_hssl_pusharea_wcounter_valueNext_1};
  assign _zz_hssl_pusharea_ram_port = hssl_pusharea_wcounter_value[5:0];
  assign _zz_srio_area_counter_valueNext_1 = srio_area_counter_willIncrement;
  assign _zz_srio_area_counter_valueNext = {6'd0, _zz_srio_area_counter_valueNext_1};
  assign _zz_io_push_payload_1 = _zz_io_push_payload[5:0];
  assign _zz_hssl_pusharea_ram_port_1 = 1'b1;
  always @(posedge hssl_clk) begin
    if(_zz_hssl_pusharea_ram_port_1) begin
      _zz_hssl_pusharea_ram_port0 <= hssl_pusharea_ram[_zz_hssl_pusharea_ram_port];
    end
  end

  always @(posedge hssl_clk) begin
    if(_zz_hssl_pusharea_ram_port_1 && hssl_pusharea_hssl_stream_fire_1 ) begin
      hssl_pusharea_ram[_zz_hssl_pusharea_ram_port] <= hssl_pusharea_hssl_stream_payload_fragment;
    end
  end

  assign _zz_hssl_pusharea_ram_port1 = hssl_pusharea_ram[_zz_io_push_payload_1];
  FiberRxPreamble hssl_pusharea_hssl_rxpreamble (
    .input_valid             (hssl_input_valid                                           ), //i
    .input_ready             (hssl_pusharea_hssl_rxpreamble_input_ready                  ), //o
    .input_payload_last      (hssl_input_payload_last                                    ), //i
    .input_payload_fragment  (hssl_input_payload_fragment[31:0]                          ), //i
    .slave_id                (slave_id[31:0]                                             ), //i
    .output_valid            (hssl_pusharea_hssl_rxpreamble_output_valid                 ), //o
    .output_ready            (hssl_pusharea_hssl_rxpadder_input_ready                    ), //i
    .output_payload_last     (hssl_pusharea_hssl_rxpreamble_output_payload_last          ), //o
    .output_payload_fragment (hssl_pusharea_hssl_rxpreamble_output_payload_fragment[31:0]), //o
    .hssl_clk                (hssl_clk                                                   ), //i
    .hssl_reset              (hssl_reset                                                 )  //i
  );
  FiberTxPadder hssl_pusharea_hssl_rxpadder (
    .input_valid             (hssl_pusharea_hssl_rxpreamble_output_valid                 ), //i
    .input_ready             (hssl_pusharea_hssl_rxpadder_input_ready                    ), //o
    .input_payload_last      (hssl_pusharea_hssl_rxpreamble_output_payload_last          ), //i
    .input_payload_fragment  (hssl_pusharea_hssl_rxpreamble_output_payload_fragment[31:0]), //i
    .output_valid            (hssl_pusharea_hssl_rxpadder_output_valid                   ), //o
    .output_ready            (hssl_pusharea_hssl_rxpadder_output_ready                   ), //i
    .output_payload_last     (hssl_pusharea_hssl_rxpadder_output_payload_last            ), //o
    .output_payload_fragment (hssl_pusharea_hssl_rxpadder_output_payload_fragment[31:0]  ), //o
    .hssl_clk                (hssl_clk                                                   ), //i
    .hssl_reset              (hssl_reset                                                 )  //i
  );
  PulseCCByToggle hssl_pusharea_pulse (
    .io_pulseIn  (hssl_pusharea_hssl_rxpadder_output_payload_last), //i
    .io_pulseOut (hssl_pusharea_pulse_io_pulseOut                ), //o
    .hssl_clk    (hssl_clk                                       ), //i
    .hssl_reset  (hssl_reset                                     ), //i
    .srio_clk    (srio_clk                                       )  //i
  );
  StreamFifo srio_area_streamfifo (
    .io_push_valid   (srio_area_valid                           ), //i
    .io_push_ready   (srio_area_streamfifo_io_push_ready        ), //o
    .io_push_payload (srio_area_streamfifo_io_push_payload[63:0]), //i
    .io_pop_valid    (srio_area_streamfifo_io_pop_valid         ), //o
    .io_pop_ready    (output_ready                              ), //i
    .io_pop_payload  (srio_area_streamfifo_io_pop_payload[63:0] ), //o
    .io_flush        (1'b0                                      ), //i
    .io_occupancy    (srio_area_streamfifo_io_occupancy[6:0]    ), //o
    .io_availability (srio_area_streamfifo_io_availability[6:0] ), //o
    .srio_clk        (srio_clk                                  ), //i
    .srio_reset      (srio_reset                                )  //i
  );
  assign hssl_input_ready = hssl_pusharea_hssl_rxpreamble_input_ready;
  assign hssl_pusharea_hssl_rxpadder_output_fire = (hssl_pusharea_hssl_rxpadder_output_valid && hssl_pusharea_hssl_rxpadder_output_ready);
  always @(*) begin
    _zz_hssl_pusharea_hssl_stream_valid = 1'b0;
    if(hssl_pusharea_hssl_rxpadder_output_fire) begin
      _zz_hssl_pusharea_hssl_stream_valid = 1'b1;
    end
  end

  assign _zz_hssl_pusharea_hssl_stream_valid_3 = (_zz_hssl_pusharea_hssl_stream_valid_2 == 1'b1);
  always @(*) begin
    _zz_hssl_pusharea_hssl_stream_valid_1 = (_zz_hssl_pusharea_hssl_stream_valid_2 + _zz_hssl_pusharea_hssl_stream_valid);
    if(1'b0) begin
      _zz_hssl_pusharea_hssl_stream_valid_1 = 1'b0;
    end
  end

  assign hssl_pusharea_hssl_rxpadder_output_fire_1 = (hssl_pusharea_hssl_rxpadder_output_valid && hssl_pusharea_hssl_rxpadder_output_ready);
  assign hssl_pusharea_hssl_stream_valid = (hssl_pusharea_hssl_rxpadder_output_valid && _zz_hssl_pusharea_hssl_stream_valid_3);
  assign _zz_hssl_pusharea_hssl_stream_payload_fragment_1 = {hssl_pusharea_hssl_rxpadder_output_payload_fragment,_zz_hssl_pusharea_hssl_stream_payload_fragment};
  assign hssl_pusharea_hssl_stream_payload_fragment = _zz_hssl_pusharea_hssl_stream_payload_fragment_2;
  assign hssl_pusharea_hssl_stream_payload_last = hssl_pusharea_hssl_rxpadder_output_payload_last;
  assign hssl_pusharea_hssl_rxpadder_output_ready = (! ((! hssl_pusharea_hssl_stream_ready) && _zz_hssl_pusharea_hssl_stream_valid_3));
  assign hssl_pusharea_hssl_stream_ready = 1'b1;
  always @(*) begin
    hssl_pusharea_wcounter_willIncrement = 1'b0;
    if(hssl_pusharea_hssl_stream_fire) begin
      hssl_pusharea_wcounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    hssl_pusharea_wcounter_willClear = 1'b0;
    if(hssl_pusharea_hssl_stream_fire) begin
      if(hssl_pusharea_hssl_stream_payload_last) begin
        hssl_pusharea_wcounter_willClear = 1'b1;
      end
    end
  end

  assign hssl_pusharea_wcounter_willOverflowIfInc = (hssl_pusharea_wcounter_value == 7'h40);
  assign hssl_pusharea_wcounter_willOverflow = (hssl_pusharea_wcounter_willOverflowIfInc && hssl_pusharea_wcounter_willIncrement);
  always @(*) begin
    if(hssl_pusharea_wcounter_willOverflow) begin
      hssl_pusharea_wcounter_valueNext = 7'h0;
    end else begin
      hssl_pusharea_wcounter_valueNext = (hssl_pusharea_wcounter_value + _zz_hssl_pusharea_wcounter_valueNext);
    end
    if(hssl_pusharea_wcounter_willClear) begin
      hssl_pusharea_wcounter_valueNext = 7'h0;
    end
  end

  assign hssl_pusharea_hssl_stream_fire = (hssl_pusharea_hssl_stream_valid && hssl_pusharea_hssl_stream_ready);
  assign hssl_pusharea_hssl_stream_fire_1 = (hssl_pusharea_hssl_stream_valid && hssl_pusharea_hssl_stream_ready);
  always @(*) begin
    srio_area_counter_willIncrement = 1'b0;
    if(srio_area_valid) begin
      srio_area_counter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    srio_area_counter_willClear = 1'b0;
    if(!when_MO_FbRx_l60) begin
      if(when_MO_FbRx_l62) begin
        srio_area_counter_willClear = 1'b1;
      end
    end
  end

  assign srio_area_counter_willOverflowIfInc = (srio_area_counter_value == 7'h40);
  assign srio_area_counter_willOverflow = (srio_area_counter_willOverflowIfInc && srio_area_counter_willIncrement);
  always @(*) begin
    if(srio_area_counter_willOverflow) begin
      srio_area_counter_valueNext = 7'h0;
    end else begin
      srio_area_counter_valueNext = (srio_area_counter_value + _zz_srio_area_counter_valueNext);
    end
    if(srio_area_counter_willClear) begin
      srio_area_counter_valueNext = 7'h0;
    end
  end

  assign when_MO_FbRx_l60 = (srio_area_pulse_out && (srio_area_streamfifo_io_occupancy == 7'h0));
  assign when_MO_FbRx_l62 = (srio_area_counter_value == 7'h1f);
  assign _zz_io_push_payload = srio_area_counter_value;
  assign srio_area_streamfifo_io_push_payload = _zz_hssl_pusharea_ram_port1;
  assign output_valid = srio_area_streamfifo_io_pop_valid;
  assign output_payload_fragment = srio_area_streamfifo_io_pop_payload;
  assign srio_area_streamfifo_io_pop_fire = (srio_area_streamfifo_io_pop_valid && output_ready);
  assign output_payload_last = ((srio_area_streamfifo_io_occupancy == 7'h01) && srio_area_streamfifo_io_pop_fire);
  assign pulse_out = (7'h1e < srio_area_streamfifo_io_occupancy);
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      _zz_hssl_pusharea_hssl_stream_valid_2 <= 1'b0;
      hssl_pusharea_wcounter_value <= 7'h0;
    end else begin
      _zz_hssl_pusharea_hssl_stream_valid_2 <= _zz_hssl_pusharea_hssl_stream_valid_1;
      hssl_pusharea_wcounter_value <= hssl_pusharea_wcounter_valueNext;
    end
  end

  always @(posedge hssl_clk) begin
    if(hssl_pusharea_hssl_rxpadder_output_fire_1) begin
      _zz_hssl_pusharea_hssl_stream_payload_fragment <= hssl_pusharea_hssl_rxpadder_output_payload_fragment;
    end
  end

  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      srio_area_pulse_out <= 1'b0;
      srio_area_valid <= 1'b0;
      srio_area_counter_value <= 7'h0;
    end else begin
      srio_area_pulse_out <= hssl_pusharea_pulse_io_pulseOut;
      srio_area_counter_value <= srio_area_counter_valueNext;
      if(when_MO_FbRx_l60) begin
        srio_area_valid <= 1'b1;
      end else begin
        if(when_MO_FbRx_l62) begin
          srio_area_valid <= 1'b0;
        end else begin
          srio_area_valid <= srio_area_valid;
        end
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  input               io_flush,
  output     [6:0]    io_occupancy,
  output     [6:0]    io_availability,
  input               srio_clk,
  input               srio_reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [5:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
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
  wire       [5:0]    logic_ptrDif;
  reg [63:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge srio_clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge srio_clk) begin
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h3f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h3f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
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
  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
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

module PulseCCByToggle (
  input               io_pulseIn,
  output              io_pulseOut,
  input               hssl_clk,
  input               hssl_reset,
  input               srio_clk
);

  wire                bufferCC_2_io_dataOut;
  wire                inArea_target_buffercc_io_dataOut;
  reg                 inArea_target;
  wire                hssl_reset_syncronized;
  wire                outArea_target;
  reg                 outArea_target_regNext;

  BufferCC bufferCC_2 (
    .io_dataIn  (1'b0                 ), //i
    .io_dataOut (bufferCC_2_io_dataOut), //o
    .srio_clk   (srio_clk             ), //i
    .hssl_reset (hssl_reset           )  //i
  );
  BufferCC_1 inArea_target_buffercc (
    .io_dataIn              (inArea_target                    ), //i
    .io_dataOut             (inArea_target_buffercc_io_dataOut), //o
    .srio_clk               (srio_clk                         ), //i
    .hssl_reset_syncronized (hssl_reset_syncronized           )  //i
  );
  assign hssl_reset_syncronized = bufferCC_2_io_dataOut;
  assign outArea_target = inArea_target_buffercc_io_dataOut;
  assign io_pulseOut = (outArea_target ^ outArea_target_regNext);
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      inArea_target <= 1'b0;
    end else begin
      if(io_pulseIn) begin
        inArea_target <= (! inArea_target);
      end
    end
  end

  always @(posedge srio_clk or posedge hssl_reset_syncronized) begin
    if(hssl_reset_syncronized) begin
      outArea_target_regNext <= 1'b0;
    end else begin
      outArea_target_regNext <= outArea_target;
    end
  end


endmodule

module FiberTxPadder (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output reg          output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               hssl_clk,
  input               hssl_reset
);

  reg        [5:0]    counter;
  wire                ok;
  wire                input_fire;
  reg                 input_payload_first;
  wire                fill;
  wire                output_fire;
  wire                when_FiberTxPadder_l18;
  wire                output_fire_1;
  wire                when_FiberTxPadder_l21;
  wire                _zz_input_ready;
  wire                when_FiberTxPadder_l25;

  assign ok = (counter == 6'h3f);
  assign input_fire = (input_valid && input_ready);
  assign fill = ((counter != 6'h0) && input_payload_first);
  assign output_fire = (output_valid && output_ready);
  assign when_FiberTxPadder_l18 = ((! ok) && output_fire);
  assign output_fire_1 = (output_valid && output_ready);
  assign when_FiberTxPadder_l21 = (output_fire_1 && output_payload_last);
  assign _zz_input_ready = (! fill);
  assign input_ready = (output_ready && _zz_input_ready);
  always @(*) begin
    output_valid = (input_valid && _zz_input_ready);
    if(fill) begin
      output_valid = 1'b1;
    end
  end

  always @(*) begin
    output_payload_last = input_payload_last;
    if(when_FiberTxPadder_l25) begin
      output_payload_last = 1'b0;
    end
    if(fill) begin
      output_payload_last = ok;
    end
  end

  always @(*) begin
    output_payload_fragment = input_payload_fragment;
    if(fill) begin
      output_payload_fragment = 32'h0;
    end
  end

  assign when_FiberTxPadder_l25 = (! ok);
  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      counter <= 6'h0;
      input_payload_first <= 1'b1;
    end else begin
      if(input_fire) begin
        input_payload_first <= input_payload_last;
      end
      if(when_FiberTxPadder_l18) begin
        counter <= (counter + 6'h01);
      end
      if(when_FiberTxPadder_l21) begin
        counter <= 6'h0;
      end
    end
  end


endmodule

module FiberRxPreamble (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  input      [31:0]   slave_id,
  output reg          output_valid,
  input               output_ready,
  output              output_payload_last,
  output     [31:0]   output_payload_fragment,
  input               hssl_clk,
  input               hssl_reset
);

  wire       [63:0]   startDelimiter;
  wire                input_fire;
  wire                history_0_valid;
  wire                history_0_ready;
  wire                history_0_payload_last;
  wire       [31:0]   history_0_payload_fragment;
  wire                history_1_valid;
  wire                history_1_ready;
  wire                history_1_payload_last;
  wire       [31:0]   history_1_payload_fragment;
  wire                _zz_history_0_valid;
  wire                _zz_history_0_ready;
  wire                _zz_history_0_payload_last;
  wire       [31:0]   _zz_history_0_payload_fragment;
  reg                 _zz_history_1_valid;
  reg                 _zz_history_1_ready;
  reg                 _zz_history_1_payload_last;
  reg        [31:0]   _zz_history_1_payload_fragment;
  wire       [63:0]   historyDataCat;
  wire                hit;
  reg                 inFrame;
  wire                when_FiberRxPreamble_l26;
  wire                when_FiberRxPreamble_l33;

  assign startDelimiter = {slave_id,32'h0000ffbc};
  assign input_fire = (input_valid && input_ready);
  assign _zz_history_0_valid = input_valid;
  assign _zz_history_0_ready = input_ready;
  assign _zz_history_0_payload_last = input_payload_last;
  assign _zz_history_0_payload_fragment = input_payload_fragment;
  assign history_0_valid = _zz_history_0_valid;
  assign history_0_ready = _zz_history_0_ready;
  assign history_0_payload_last = _zz_history_0_payload_last;
  assign history_0_payload_fragment = _zz_history_0_payload_fragment;
  assign history_1_valid = _zz_history_1_valid;
  assign history_1_ready = _zz_history_1_ready;
  assign history_1_payload_last = _zz_history_1_payload_last;
  assign history_1_payload_fragment = _zz_history_1_payload_fragment;
  assign historyDataCat = {history_0_payload_fragment,history_1_payload_fragment};
  assign hit = ((history_0_valid && history_1_valid) && (historyDataCat == startDelimiter));
  always @(*) begin
    output_valid = 1'b0;
    if(!when_FiberRxPreamble_l26) begin
      if(input_valid) begin
        output_valid = 1'b1;
      end
    end
  end

  assign output_payload_fragment = input_payload_fragment;
  assign input_ready = ((! inFrame) || output_ready);
  assign output_payload_last = input_payload_last;
  assign when_FiberRxPreamble_l26 = (! inFrame);
  assign when_FiberRxPreamble_l33 = (output_ready && input_payload_last);
  always @(posedge hssl_clk) begin
    if(input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge hssl_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_FiberRxPreamble_l26) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(input_valid) begin
          if(when_FiberRxPreamble_l33) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               srio_clk,
  input               hssl_reset_syncronized
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk or posedge hssl_reset_syncronized) begin
    if(hssl_reset_syncronized) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               srio_clk,
  input               hssl_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk or posedge hssl_reset) begin
    if(hssl_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
