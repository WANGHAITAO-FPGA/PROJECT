// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : ModusTop


`define fsm_enumDefinition_binary_sequential_type [3:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 4'b0000
`define fsm_enumDefinition_binary_sequential_fsm_SlaveId 4'b0001
`define fsm_enumDefinition_binary_sequential_fsm_FunctionCode 4'b0010
`define fsm_enumDefinition_binary_sequential_fsm_GetAddress 4'b0011
`define fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData 4'b0100
`define fsm_enumDefinition_binary_sequential_fsm_GetDataLength 4'b0101
`define fsm_enumDefinition_binary_sequential_fsm_WriteMultiData 4'b0110
`define fsm_enumDefinition_binary_sequential_fsm_GetCRC 4'b0111
`define fsm_enumDefinition_binary_sequential_fsm_End 4'b1000

`define UartParityType_binary_sequential_type [1:0]
`define UartParityType_binary_sequential_NONE 2'b00
`define UartParityType_binary_sequential_EVEN 2'b01
`define UartParityType_binary_sequential_ODD 2'b10

`define UartStopType_binary_sequential_type [0:0]
`define UartStopType_binary_sequential_ONE 1'b0
`define UartStopType_binary_sequential_TWO 1'b1

`define UartCtrlTxState_binary_sequential_type [2:0]
`define UartCtrlTxState_binary_sequential_IDLE 3'b000
`define UartCtrlTxState_binary_sequential_START 3'b001
`define UartCtrlTxState_binary_sequential_DATA 3'b010
`define UartCtrlTxState_binary_sequential_PARITY 3'b011
`define UartCtrlTxState_binary_sequential_STOP 3'b100

`define UartCtrlRxState_binary_sequential_type [2:0]
`define UartCtrlRxState_binary_sequential_IDLE 3'b000
`define UartCtrlRxState_binary_sequential_START 3'b001
`define UartCtrlRxState_binary_sequential_DATA 3'b010
`define UartCtrlRxState_binary_sequential_PARITY 3'b011
`define UartCtrlRxState_binary_sequential_STOP 3'b100


module ModusTop (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  input      [4:0]    reads_addr,
  output     [7:0]    reads_dataOut,
  input               reads_en,
  input               clk,
  input               reset
);
  reg                 uartarea_uartctrl_stream_stream_out_ready;
  reg                 uartarea_uartctrl_stream_rxfiforead;
  reg        [7:0]    _zz_uartarea_mem_port1;
  wire                uartarea_decoderxstream_input_ready;
  wire                uartarea_decoderxstream_output_valid;
  wire       [7:0]    uartarea_decoderxstream_output_payload;
  wire                uartarea_uartctrl_stream_stream_in_ready;
  wire                uartarea_uartctrl_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrl_stream_stream_out_payload;
  wire                uartarea_uartctrl_stream_uart_txd;
  wire                uartarea_uartctrl_stream_rxint;
  wire       [5:0]    uartarea_uartctrl_stream_rxfifooccupancy;
  reg        [4:0]    uartarea_mem_addr;
  wire                when_ModusTop_l44;
  wire                uartarea_uartctrl_stream_stream_out_fire;
  wire                uartarea_uartctrl_stream_stream_out_fire_1;
  (* ram_style = "block" *) reg [7:0] uartarea_mem [0:31];

  initial begin
    $readmemb("ModusTop.v_toplevel_uartarea_mem.bin",uartarea_mem);
  end
  always @(posedge clk) begin
    if(uartarea_uartctrl_stream_stream_out_fire_1) begin
      uartarea_mem[uartarea_mem_addr] <= uartarea_uartctrl_stream_stream_out_payload;
    end
  end

  always @(posedge clk) begin
    if(reads_en) begin
      _zz_uartarea_mem_port1 <= uartarea_mem[reads_addr];
    end
  end

  DecodeRxStream uartarea_decoderxstream (
    .input_valid       (input_valid                               ), //i
    .input_ready       (uartarea_decoderxstream_input_ready       ), //o
    .input_payload     (input_payload                             ), //i
    .output_valid      (uartarea_decoderxstream_output_valid      ), //o
    .output_ready      (uartarea_uartctrl_stream_stream_in_ready  ), //i
    .output_payload    (uartarea_decoderxstream_output_payload    ), //o
    .clk               (clk                                       ), //i
    .reset             (reset                                     )  //i
  );
  uartctrl_stream uartarea_uartctrl_stream (
    .stream_in_valid       (uartarea_decoderxstream_output_valid         ), //i
    .stream_in_ready       (uartarea_uartctrl_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_decoderxstream_output_payload       ), //i
    .stream_out_valid      (uartarea_uartctrl_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_uartctrl_stream_stream_out_ready    ), //i
    .stream_out_payload    (uartarea_uartctrl_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrl_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrl_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrl_stream_rxint               ), //o
    .rxfiforead            (uartarea_uartctrl_stream_rxfiforead          ), //i
    .rxfifooccupancy       (uartarea_uartctrl_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                          ), //i
    .reset                 (reset                                        )  //i
  );
  assign input_ready = uartarea_decoderxstream_input_ready;
  assign when_ModusTop_l44 = (uartarea_uartctrl_stream_rxint && (uartarea_uartctrl_stream_rxfifooccupancy != 6'h0));
  always @(*) begin
    if(when_ModusTop_l44) begin
      uartarea_uartctrl_stream_rxfiforead = 1'b1;
    end else begin
      uartarea_uartctrl_stream_rxfiforead = 1'b0;
    end
  end

  always @(*) begin
    if(when_ModusTop_l44) begin
      uartarea_uartctrl_stream_stream_out_ready = 1'b1;
    end else begin
      uartarea_uartctrl_stream_stream_out_ready = 1'b0;
    end
  end

  assign uartarea_uartctrl_stream_stream_out_fire = (uartarea_uartctrl_stream_stream_out_valid && uartarea_uartctrl_stream_stream_out_ready);
  assign uartarea_uartctrl_stream_stream_out_fire_1 = (uartarea_uartctrl_stream_stream_out_valid && uartarea_uartctrl_stream_stream_out_ready);
  assign reads_dataOut = _zz_uartarea_mem_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      uartarea_mem_addr <= 5'h0;
    end else begin
      if(when_ModusTop_l44) begin
        if(uartarea_uartctrl_stream_stream_out_fire) begin
          uartarea_mem_addr <= (uartarea_mem_addr + 5'h01);
        end
      end else begin
        uartarea_mem_addr <= 5'h0;
      end
    end
  end


endmodule

module uartctrl_stream (
  input               stream_in_valid,
  output              stream_in_ready,
  input      [7:0]    stream_in_payload,
  output              stream_out_valid,
  input               stream_out_ready,
  output     [7:0]    stream_out_payload,
  output              uart_txd,
  input               uart_rxd,
  output              rxint,
  input               rxfiforead,
  output     [5:0]    rxfifooccupancy,
  input               clk,
  input               reset
);
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                txfifo_io_push_ready;
  wire                txfifo_io_pop_valid;
  wire       [7:0]    txfifo_io_pop_payload;
  wire       [5:0]    txfifo_io_occupancy;
  wire       [5:0]    txfifo_io_availability;
  wire                rxfifo_io_push_ready;
  wire                rxfifo_io_pop_valid;
  wire       [7:0]    rxfifo_io_pop_payload;
  wire       [5:0]    rxfifo_io_occupancy;
  wire       [5:0]    rxfifo_io_availability;
  wire       [9:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 nodatareceive;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [9:0]    counter_valueNext;
  reg        [9:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 uartCtrl_1_io_read_valid_regNext;
  wire                when_UartStream_l37;
  wire                when_UartStream_l41;
  reg                 interrupt;
  reg                 nodatareceive_regNext;
  wire                when_UartStream_l49;
  wire                when_UartStream_l51;
  function  zz_counter_willIncrement(input dummy);
    begin
      zz_counter_willIncrement = 1'b0;
      zz_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {9'd0, _zz_counter_valueNext_1};
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (3'b111                                  ), //i
    .io_config_frame_stop          (`UartStopType_binary_sequential_ONE     ), //i
    .io_config_frame_parity        (`UartParityType_binary_sequential_NONE  ), //i
    .io_config_clockDivider        (20'h00003                               ), //i
    .io_write_valid                (txfifo_io_pop_valid                     ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready               ), //o
    .io_write_payload              (txfifo_io_pop_payload                   ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid                ), //o
    .io_read_ready                 (rxfifo_io_push_ready                    ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload              ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd                  ), //o
    .io_uart_rxd                   (uart_rxd                                ), //i
    .io_readError                  (uartCtrl_1_io_readError                 ), //o
    .io_writeBreak                 (1'b0                                    ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak                 ), //o
    .clk                           (clk                                     ), //i
    .reset                         (reset                                   )  //i
  );
  StreamFifo txfifo (
    .io_push_valid      (stream_in_valid            ), //i
    .io_push_ready      (txfifo_io_push_ready       ), //o
    .io_push_payload    (stream_in_payload          ), //i
    .io_pop_valid       (txfifo_io_pop_valid        ), //o
    .io_pop_ready       (uartCtrl_1_io_write_ready  ), //i
    .io_pop_payload     (txfifo_io_pop_payload      ), //o
    .io_flush           (1'b0                       ), //i
    .io_occupancy       (txfifo_io_occupancy        ), //o
    .io_availability    (txfifo_io_availability     ), //o
    .clk                (clk                        ), //i
    .reset              (reset                      )  //i
  );
  StreamFifo rxfifo (
    .io_push_valid      (uartCtrl_1_io_read_valid    ), //i
    .io_push_ready      (rxfifo_io_push_ready        ), //o
    .io_push_payload    (uartCtrl_1_io_read_payload  ), //i
    .io_pop_valid       (rxfifo_io_pop_valid         ), //o
    .io_pop_ready       (rxfiforead                  ), //i
    .io_pop_payload     (rxfifo_io_pop_payload       ), //o
    .io_flush           (1'b0                        ), //i
    .io_occupancy       (rxfifo_io_occupancy         ), //o
    .io_availability    (rxfifo_io_availability      ), //o
    .clk                (clk                         ), //i
    .reset              (reset                       )  //i
  );
  assign uart_txd = uartCtrl_1_io_uart_txd;
  assign stream_in_ready = txfifo_io_push_ready;
  assign _zz_1 = zz_counter_willIncrement(1'b0);
  always @(*) counter_willIncrement = _zz_1;
  always @(*) begin
    counter_willClear = 1'b0;
    if(when_UartStream_l37) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 10'h3e8);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    if(counter_willOverflow) begin
      counter_valueNext = 10'h0;
    end else begin
      counter_valueNext = (counter_value + _zz_counter_valueNext);
    end
    if(counter_willClear) begin
      counter_valueNext = 10'h0;
    end
  end

  assign when_UartStream_l37 = (uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_valid_regNext));
  assign when_UartStream_l41 = ((! nodatareceive) && counter_willOverflow);
  assign when_UartStream_l49 = ((nodatareceive && (! nodatareceive_regNext)) && (6'h0 < rxfifo_io_occupancy));
  assign when_UartStream_l51 = (rxfifo_io_occupancy == 6'h0);
  assign rxint = interrupt;
  assign stream_out_payload = rxfifo_io_pop_payload;
  assign stream_out_valid = (rxfifo_io_pop_valid && rxfiforead);
  assign rxfifooccupancy = rxfifo_io_occupancy;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      nodatareceive <= 1'b1;
      counter_value <= 10'h0;
      interrupt <= 1'b0;
    end else begin
      counter_value <= counter_valueNext;
      if(when_UartStream_l37) begin
        nodatareceive <= 1'b0;
      end
      if(when_UartStream_l41) begin
        nodatareceive <= 1'b1;
      end
      if(when_UartStream_l49) begin
        interrupt <= 1'b1;
      end else begin
        if(when_UartStream_l51) begin
          interrupt <= 1'b0;
        end else begin
          interrupt <= interrupt;
        end
      end
    end
  end

  always @(posedge clk) begin
    uartCtrl_1_io_read_valid_regNext <= uartCtrl_1_io_read_valid;
    nodatareceive_regNext <= nodatareceive;
  end


endmodule

module DecodeRxStream (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input               clk,
  input               reset
);
  wire       [7:0]    _zz_when_FiberRxStream_l125;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [7:0]    input_payload_regNext;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_FiberRxStream_l64;
  wire                when_FiberRxStream_l75;
  wire                when_FiberRxStream_l87;
  wire                when_FiberRxStream_l89;
  wire                when_FiberRxStream_l102;
  wire                when_FiberRxStream_l113;
  wire                when_FiberRxStream_l125;
  wire                when_FiberRxStream_l136;
  `ifndef SYNTHESIS
  reg [215:0] fsm_stateReg_string;
  reg [215:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l125 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT                   ";
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : fsm_stateReg_string = "fsm_SlaveId                ";
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : fsm_stateReg_string = "fsm_FunctionCode           ";
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : fsm_stateReg_string = "fsm_GetAddress             ";
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : fsm_stateReg_string = "fsm_ReadLength_WriteOneData";
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : fsm_stateReg_string = "fsm_GetDataLength          ";
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : fsm_stateReg_string = "fsm_WriteMultiData         ";
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : fsm_stateReg_string = "fsm_GetCRC                 ";
      `fsm_enumDefinition_binary_sequential_fsm_End : fsm_stateReg_string = "fsm_End                    ";
      default : fsm_stateReg_string = "???????????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT                   ";
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : fsm_stateNext_string = "fsm_SlaveId                ";
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : fsm_stateNext_string = "fsm_FunctionCode           ";
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : fsm_stateNext_string = "fsm_GetAddress             ";
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : fsm_stateNext_string = "fsm_ReadLength_WriteOneData";
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : fsm_stateNext_string = "fsm_GetDataLength          ";
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : fsm_stateNext_string = "fsm_WriteMultiData         ";
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : fsm_stateNext_string = "fsm_GetCRC                 ";
      `fsm_enumDefinition_binary_sequential_fsm_End : fsm_stateNext_string = "fsm_End                    ";
      default : fsm_stateNext_string = "???????????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
        if(when_FiberRxStream_l64) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_FunctionCode;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
        if(when_FiberRxStream_l75) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetAddress;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SlaveId;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l87) begin
            if(when_FiberRxStream_l89) begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetDataLength;
            end
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l102) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetCRC;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l113) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l125) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetCRC;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l136) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_End;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
        fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign when_FiberRxStream_l64 = (input_valid && (input_payload == 8'h01));
  assign when_FiberRxStream_l75 = (input_valid && (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10)));
  assign when_FiberRxStream_l87 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l89 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l102 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l113 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l125 = (rec_cnt == _zz_when_FiberRxStream_l125);
  assign when_FiberRxStream_l136 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
          if(when_FiberRxStream_l64) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
        end
        `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l87) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l102) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l113) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l125) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l136) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_End : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
        if(when_FiberRxStream_l75) begin
          functioncode <= input_payload;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
      end
      default : begin
      end
    endcase
  end


endmodule

//StreamFifo replaced by StreamFifo

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [7:0]    _zz_logic_ram_port0;
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
  wire                when_Stream_l933;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

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
  assign when_Stream_l933 = (logic_pushing != logic_popping);
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
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_binary_sequential_type io_config_frame_stop,
  input      `UartParityType_binary_sequential_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               clk,
  input               reset
);
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength  ), //i
    .io_configFrame_stop          (io_config_frame_stop        ), //i
    .io_configFrame_parity        (io_config_frame_parity      ), //i
    .io_samplingTick              (clockDivider_tick           ), //i
    .io_write_valid               (io_write_thrown_valid       ), //i
    .io_write_ready               (tx_io_write_ready           ), //o
    .io_write_payload             (io_write_thrown_payload     ), //i
    .io_cts                       (1'b0                        ), //i
    .io_txd                       (tx_io_txd                   ), //o
    .io_break                     (io_writeBreak               ), //i
    .clk                          (clk                         ), //i
    .reset                        (reset                       )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength  ), //i
    .io_configFrame_stop          (io_config_frame_stop        ), //i
    .io_configFrame_parity        (io_config_frame_parity      ), //i
    .io_samplingTick              (clockDivider_tick           ), //i
    .io_read_valid                (rx_io_read_valid            ), //o
    .io_read_ready                (io_read_ready               ), //i
    .io_read_payload              (rx_io_read_payload          ), //o
    .io_rxd                       (io_uart_rxd                 ), //i
    .io_rts                       (rx_io_rts                   ), //o
    .io_error                     (rx_io_error                 ), //o
    .io_break                     (rx_io_break                 ), //o
    .clk                          (clk                         ), //i
    .reset                        (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_binary_sequential_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_binary_sequential_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_binary_sequential_type io_configFrame_stop,
  input      `UartParityType_binary_sequential_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               clk,
  input               reset
);
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        `UartCtrlRxState_binary_sequential_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == `UartStopType_binary_sequential_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  BufferCC io_rxd_buffercc (
    .io_dataIn     (io_rxd                      ), //i
    .io_dataOut    (io_rxd_buffercc_io_dataOut  ), //o
    .clk           (clk                         ), //i
    .reset         (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_binary_sequential_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_binary_sequential_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_binary_sequential_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_binary_sequential_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_binary_sequential_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_binary_sequential_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : begin
      end
      `UartCtrlRxState_binary_sequential_START : begin
      end
      `UartCtrlRxState_binary_sequential_DATA : begin
      end
      `UartCtrlRxState_binary_sequential_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == `UartParityType_binary_sequential_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_binary_sequential_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= `UartCtrlRxState_binary_sequential_START;
          end
        end
        `UartCtrlRxState_binary_sequential_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= `UartCtrlRxState_binary_sequential_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end
          end
        end
        `UartCtrlRxState_binary_sequential_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_binary_sequential_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      `UartCtrlRxState_binary_sequential_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequential_ODD);
        end
      end
      `UartCtrlRxState_binary_sequential_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlRxState_binary_sequential_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_binary_sequential_type io_configFrame_stop,
  input      `UartParityType_binary_sequential_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               clk,
  input               reset
);
  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_binary_sequential_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == `UartStopType_binary_sequential_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_binary_sequential_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_binary_sequential_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_binary_sequential_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_binary_sequential_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_binary_sequential_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_binary_sequential_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == `UartParityType_binary_sequential_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign io_txd = _zz_io_txd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= `UartCtrlTxState_binary_sequential_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_binary_sequential_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_START;
          end
        end
        `UartCtrlTxState_binary_sequential_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_DATA;
          end
        end
        `UartCtrlTxState_binary_sequential_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= `UartCtrlTxState_binary_sequential_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_binary_sequential_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_binary_sequential_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_binary_sequential_START : `UartCtrlTxState_binary_sequential_IDLE);
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge clk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequential_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
