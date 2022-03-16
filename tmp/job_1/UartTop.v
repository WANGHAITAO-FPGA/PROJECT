// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : UartTop
// Git hash  : 1d7d59401b86b42deedb807f9591ae65cc74e9dc


`define StreamState_binary_sequential_type [0:0]
`define StreamState_binary_sequential_IDLE 1'b0
`define StreamState_binary_sequential_WAIT_1 1'b1

`define StreamSequentialState_binary_sequential_type [2:0]
`define StreamSequentialState_binary_sequential_ONE 3'b000
`define StreamSequentialState_binary_sequential_TWO 3'b001
`define StreamSequentialState_binary_sequential_THREE 3'b010
`define StreamSequentialState_binary_sequential_FOUR 3'b011
`define StreamSequentialState_binary_sequential_FIVE 3'b100
`define StreamSequentialState_binary_sequential_SIX 3'b101
`define StreamSequentialState_binary_sequential_SEVEN 3'b110

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


module UartTop (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [7:0]    input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input               clk,
  input               reset
);
  wire                uartarea_streamfragmentfork_input_ready;
  wire                uartarea_streamfragmentfork_output_0_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_0_payload;
  wire                uartarea_streamfragmentfork_output_1_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_1_payload;
  wire                uartarea_streamfragmentfork_output_2_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_2_payload;
  wire                uartarea_streamfragmentfork_output_3_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_3_payload;
  wire                uartarea_streamfragmentfork_output_4_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_4_payload;
  wire                uartarea_streamfragmentfork_output_5_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_5_payload;
  wire                uartarea_streamfragmentfork_output_6_valid;
  wire       [7:0]    uartarea_streamfragmentfork_output_6_payload;
  wire                uartarea_streamsequential_input_0_ready;
  wire                uartarea_streamsequential_input_1_ready;
  wire                uartarea_streamsequential_input_2_ready;
  wire                uartarea_streamsequential_input_3_ready;
  wire                uartarea_streamsequential_input_4_ready;
  wire                uartarea_streamsequential_input_5_ready;
  wire                uartarea_streamsequential_input_6_ready;
  wire                uartarea_streamsequential_output_valid;
  wire       [7:0]    uartarea_streamsequential_output_payload;
  wire                uartarea_streamsequential_readfifo_0;
  wire                uartarea_streamsequential_readfifo_1;
  wire                uartarea_streamsequential_readfifo_2;
  wire                uartarea_streamsequential_readfifo_3;
  wire                uartarea_streamsequential_readfifo_4;
  wire                uartarea_streamsequential_readfifo_5;
  wire                uartarea_streamsequential_readfifo_6;
  wire                uartarea_uartctrlA_stream_stream_in_ready;
  wire                uartarea_uartctrlA_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlA_stream_stream_out_payload;
  wire                uartarea_uartctrlA_stream_uart_txd;
  wire                uartarea_uartctrlA_stream_rxint;
  wire       [4:0]    uartarea_uartctrlA_stream_rxfifooccupancy;
  wire                uartarea_uartctrlB_stream_stream_in_ready;
  wire                uartarea_uartctrlB_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlB_stream_stream_out_payload;
  wire                uartarea_uartctrlB_stream_uart_txd;
  wire                uartarea_uartctrlB_stream_rxint;
  wire       [4:0]    uartarea_uartctrlB_stream_rxfifooccupancy;
  wire                uartarea_uartctrlC_stream_stream_in_ready;
  wire                uartarea_uartctrlC_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlC_stream_stream_out_payload;
  wire                uartarea_uartctrlC_stream_uart_txd;
  wire                uartarea_uartctrlC_stream_rxint;
  wire       [4:0]    uartarea_uartctrlC_stream_rxfifooccupancy;
  wire                uartarea_uartctrlD_stream_stream_in_ready;
  wire                uartarea_uartctrlD_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlD_stream_stream_out_payload;
  wire                uartarea_uartctrlD_stream_uart_txd;
  wire                uartarea_uartctrlD_stream_rxint;
  wire       [4:0]    uartarea_uartctrlD_stream_rxfifooccupancy;
  wire                uartarea_uartctrlE_stream_stream_in_ready;
  wire                uartarea_uartctrlE_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlE_stream_stream_out_payload;
  wire                uartarea_uartctrlE_stream_uart_txd;
  wire                uartarea_uartctrlE_stream_rxint;
  wire       [4:0]    uartarea_uartctrlE_stream_rxfifooccupancy;
  wire                uartarea_uartctrlF_stream_stream_in_ready;
  wire                uartarea_uartctrlF_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlF_stream_stream_out_payload;
  wire                uartarea_uartctrlF_stream_uart_txd;
  wire                uartarea_uartctrlF_stream_rxint;
  wire       [4:0]    uartarea_uartctrlF_stream_rxfifooccupancy;
  wire                uartarea_uartctrlG_stream_stream_in_ready;
  wire                uartarea_uartctrlG_stream_stream_out_valid;
  wire       [7:0]    uartarea_uartctrlG_stream_stream_out_payload;
  wire                uartarea_uartctrlG_stream_uart_txd;
  wire                uartarea_uartctrlG_stream_rxint;
  wire       [4:0]    uartarea_uartctrlG_stream_rxfifooccupancy;

  StreamFragmentFork uartarea_streamfragmentfork (
    .input_valid               (input_valid                                   ), //i
    .input_ready               (uartarea_streamfragmentfork_input_ready       ), //o
    .input_payload_last        (input_payload_last                            ), //i
    .input_payload_fragment    (input_payload_fragment                        ), //i
    .output_0_valid            (uartarea_streamfragmentfork_output_0_valid    ), //o
    .output_0_ready            (uartarea_uartctrlA_stream_stream_in_ready     ), //i
    .output_0_payload          (uartarea_streamfragmentfork_output_0_payload  ), //o
    .output_1_valid            (uartarea_streamfragmentfork_output_1_valid    ), //o
    .output_1_ready            (uartarea_uartctrlB_stream_stream_in_ready     ), //i
    .output_1_payload          (uartarea_streamfragmentfork_output_1_payload  ), //o
    .output_2_valid            (uartarea_streamfragmentfork_output_2_valid    ), //o
    .output_2_ready            (uartarea_uartctrlC_stream_stream_in_ready     ), //i
    .output_2_payload          (uartarea_streamfragmentfork_output_2_payload  ), //o
    .output_3_valid            (uartarea_streamfragmentfork_output_3_valid    ), //o
    .output_3_ready            (uartarea_uartctrlD_stream_stream_in_ready     ), //i
    .output_3_payload          (uartarea_streamfragmentfork_output_3_payload  ), //o
    .output_4_valid            (uartarea_streamfragmentfork_output_4_valid    ), //o
    .output_4_ready            (uartarea_uartctrlE_stream_stream_in_ready     ), //i
    .output_4_payload          (uartarea_streamfragmentfork_output_4_payload  ), //o
    .output_5_valid            (uartarea_streamfragmentfork_output_5_valid    ), //o
    .output_5_ready            (uartarea_uartctrlF_stream_stream_in_ready     ), //i
    .output_5_payload          (uartarea_streamfragmentfork_output_5_payload  ), //o
    .output_6_valid            (uartarea_streamfragmentfork_output_6_valid    ), //o
    .output_6_ready            (uartarea_uartctrlG_stream_stream_in_ready     ), //i
    .output_6_payload          (uartarea_streamfragmentfork_output_6_payload  ), //o
    .clk                       (clk                                           ), //i
    .reset                     (reset                                         )  //i
  );
  StreamSequential uartarea_streamsequential (
    .input_0_valid      (uartarea_uartctrlA_stream_stream_out_valid    ), //i
    .input_0_ready      (uartarea_streamsequential_input_0_ready       ), //o
    .input_0_payload    (uartarea_uartctrlA_stream_stream_out_payload  ), //i
    .input_1_valid      (uartarea_uartctrlB_stream_stream_out_valid    ), //i
    .input_1_ready      (uartarea_streamsequential_input_1_ready       ), //o
    .input_1_payload    (uartarea_uartctrlB_stream_stream_out_payload  ), //i
    .input_2_valid      (uartarea_uartctrlC_stream_stream_out_valid    ), //i
    .input_2_ready      (uartarea_streamsequential_input_2_ready       ), //o
    .input_2_payload    (uartarea_uartctrlC_stream_stream_out_payload  ), //i
    .input_3_valid      (uartarea_uartctrlD_stream_stream_out_valid    ), //i
    .input_3_ready      (uartarea_streamsequential_input_3_ready       ), //o
    .input_3_payload    (uartarea_uartctrlD_stream_stream_out_payload  ), //i
    .input_4_valid      (uartarea_uartctrlE_stream_stream_out_valid    ), //i
    .input_4_ready      (uartarea_streamsequential_input_4_ready       ), //o
    .input_4_payload    (uartarea_uartctrlE_stream_stream_out_payload  ), //i
    .input_5_valid      (uartarea_uartctrlF_stream_stream_out_valid    ), //i
    .input_5_ready      (uartarea_streamsequential_input_5_ready       ), //o
    .input_5_payload    (uartarea_uartctrlF_stream_stream_out_payload  ), //i
    .input_6_valid      (uartarea_uartctrlG_stream_stream_out_valid    ), //i
    .input_6_ready      (uartarea_streamsequential_input_6_ready       ), //o
    .input_6_payload    (uartarea_uartctrlG_stream_stream_out_payload  ), //i
    .interrupt_0        (uartarea_uartctrlA_stream_rxint               ), //i
    .interrupt_1        (uartarea_uartctrlB_stream_rxint               ), //i
    .interrupt_2        (uartarea_uartctrlC_stream_rxint               ), //i
    .interrupt_3        (uartarea_uartctrlD_stream_rxint               ), //i
    .interrupt_4        (uartarea_uartctrlE_stream_rxint               ), //i
    .interrupt_5        (uartarea_uartctrlF_stream_rxint               ), //i
    .interrupt_6        (uartarea_uartctrlG_stream_rxint               ), //i
    .occupancy_0        (uartarea_uartctrlA_stream_rxfifooccupancy     ), //i
    .occupancy_1        (uartarea_uartctrlB_stream_rxfifooccupancy     ), //i
    .occupancy_2        (uartarea_uartctrlC_stream_rxfifooccupancy     ), //i
    .occupancy_3        (uartarea_uartctrlD_stream_rxfifooccupancy     ), //i
    .occupancy_4        (uartarea_uartctrlE_stream_rxfifooccupancy     ), //i
    .occupancy_5        (uartarea_uartctrlF_stream_rxfifooccupancy     ), //i
    .occupancy_6        (uartarea_uartctrlG_stream_rxfifooccupancy     ), //i
    .output_valid       (uartarea_streamsequential_output_valid        ), //o
    .output_ready       (output_ready                                  ), //i
    .output_payload     (uartarea_streamsequential_output_payload      ), //o
    .readfifo_0         (uartarea_streamsequential_readfifo_0          ), //o
    .readfifo_1         (uartarea_streamsequential_readfifo_1          ), //o
    .readfifo_2         (uartarea_streamsequential_readfifo_2          ), //o
    .readfifo_3         (uartarea_streamsequential_readfifo_3          ), //o
    .readfifo_4         (uartarea_streamsequential_readfifo_4          ), //o
    .readfifo_5         (uartarea_streamsequential_readfifo_5          ), //o
    .readfifo_6         (uartarea_streamsequential_readfifo_6          ), //o
    .clk                (clk                                           ), //i
    .reset              (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlA_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_0_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlA_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_0_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlA_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_0_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlA_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlA_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlA_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlA_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_0          ), //i
    .rxfifooccupancy       (uartarea_uartctrlA_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlB_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_1_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlB_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_1_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlB_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_1_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlB_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlB_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlB_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlB_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_1          ), //i
    .rxfifooccupancy       (uartarea_uartctrlB_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlC_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_2_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlC_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_2_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlC_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_2_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlC_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlC_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlC_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlC_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_2          ), //i
    .rxfifooccupancy       (uartarea_uartctrlC_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlD_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_3_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlD_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_3_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlD_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_3_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlD_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlD_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlD_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlD_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_3          ), //i
    .rxfifooccupancy       (uartarea_uartctrlD_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlE_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_4_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlE_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_4_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlE_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_4_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlE_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlE_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlE_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlE_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_4          ), //i
    .rxfifooccupancy       (uartarea_uartctrlE_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlF_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_5_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlF_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_5_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlF_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_5_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlF_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlF_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlF_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlF_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_5          ), //i
    .rxfifooccupancy       (uartarea_uartctrlF_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  uartctrl_stream uartarea_uartctrlG_stream (
    .stream_in_valid       (uartarea_streamfragmentfork_output_6_valid    ), //i
    .stream_in_ready       (uartarea_uartctrlG_stream_stream_in_ready     ), //o
    .stream_in_payload     (uartarea_streamfragmentfork_output_6_payload  ), //i
    .stream_out_valid      (uartarea_uartctrlG_stream_stream_out_valid    ), //o
    .stream_out_ready      (uartarea_streamsequential_input_6_ready       ), //i
    .stream_out_payload    (uartarea_uartctrlG_stream_stream_out_payload  ), //o
    .uart_txd              (uartarea_uartctrlG_stream_uart_txd            ), //o
    .uart_rxd              (uartarea_uartctrlG_stream_uart_txd            ), //i
    .rxint                 (uartarea_uartctrlG_stream_rxint               ), //o
    .rxfiforead            (uartarea_streamsequential_readfifo_6          ), //i
    .rxfifooccupancy       (uartarea_uartctrlG_stream_rxfifooccupancy     ), //o
    .clk                   (clk                                           ), //i
    .reset                 (reset                                         )  //i
  );
  assign input_ready = uartarea_streamfragmentfork_input_ready;
  assign output_valid = uartarea_streamsequential_output_valid;
  assign output_payload = uartarea_streamsequential_output_payload;

endmodule

//uartctrl_stream replaced by uartctrl_stream

//uartctrl_stream replaced by uartctrl_stream

//uartctrl_stream replaced by uartctrl_stream

//uartctrl_stream replaced by uartctrl_stream

//uartctrl_stream replaced by uartctrl_stream

//uartctrl_stream replaced by uartctrl_stream

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
  output     [4:0]    rxfifooccupancy,
  input               clk,
  input               reset
);
  wire                uartCtrl_7_io_write_ready;
  wire                uartCtrl_7_io_read_valid;
  wire       [7:0]    uartCtrl_7_io_read_payload;
  wire                uartCtrl_7_io_uart_txd;
  wire                uartCtrl_7_io_readError;
  wire                uartCtrl_7_io_readBreak;
  wire                txfifo_io_push_ready;
  wire                txfifo_io_pop_valid;
  wire       [7:0]    txfifo_io_pop_payload;
  wire       [4:0]    txfifo_io_occupancy;
  wire       [4:0]    txfifo_io_availability;
  wire                rxfifo_io_push_ready;
  wire                rxfifo_io_pop_valid;
  wire       [7:0]    rxfifo_io_pop_payload;
  wire       [4:0]    rxfifo_io_occupancy;
  wire       [4:0]    rxfifo_io_availability;
  wire       [8:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 nodatareceive;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [8:0]    counter_valueNext;
  reg        [8:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg                 uartCtrl_7_io_read_valid_regNext;
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
  assign _zz_counter_valueNext = {8'd0, _zz_counter_valueNext_1};
  UartCtrl uartCtrl_7 (
    .io_config_frame_dataLength    (3'b111                                  ), //i
    .io_config_frame_stop          (`UartStopType_binary_sequential_ONE     ), //i
    .io_config_frame_parity        (`UartParityType_binary_sequential_NONE  ), //i
    .io_config_clockDivider        (20'h00003                               ), //i
    .io_write_valid                (txfifo_io_pop_valid                     ), //i
    .io_write_ready                (uartCtrl_7_io_write_ready               ), //o
    .io_write_payload              (txfifo_io_pop_payload                   ), //i
    .io_read_valid                 (uartCtrl_7_io_read_valid                ), //o
    .io_read_ready                 (rxfifo_io_push_ready                    ), //i
    .io_read_payload               (uartCtrl_7_io_read_payload              ), //o
    .io_uart_txd                   (uartCtrl_7_io_uart_txd                  ), //o
    .io_uart_rxd                   (uart_rxd                                ), //i
    .io_readError                  (uartCtrl_7_io_readError                 ), //o
    .io_writeBreak                 (1'b0                                    ), //i
    .io_readBreak                  (uartCtrl_7_io_readBreak                 ), //o
    .clk                           (clk                                     ), //i
    .reset                         (reset                                   )  //i
  );
  StreamFifo txfifo (
    .io_push_valid      (stream_in_valid            ), //i
    .io_push_ready      (txfifo_io_push_ready       ), //o
    .io_push_payload    (stream_in_payload          ), //i
    .io_pop_valid       (txfifo_io_pop_valid        ), //o
    .io_pop_ready       (uartCtrl_7_io_write_ready  ), //i
    .io_pop_payload     (txfifo_io_pop_payload      ), //o
    .io_flush           (1'b0                       ), //i
    .io_occupancy       (txfifo_io_occupancy        ), //o
    .io_availability    (txfifo_io_availability     ), //o
    .clk                (clk                        ), //i
    .reset              (reset                      )  //i
  );
  StreamFifo rxfifo (
    .io_push_valid      (uartCtrl_7_io_read_valid    ), //i
    .io_push_ready      (rxfifo_io_push_ready        ), //o
    .io_push_payload    (uartCtrl_7_io_read_payload  ), //i
    .io_pop_valid       (rxfifo_io_pop_valid         ), //o
    .io_pop_ready       (rxfiforead                  ), //i
    .io_pop_payload     (rxfifo_io_pop_payload       ), //o
    .io_flush           (1'b0                        ), //i
    .io_occupancy       (rxfifo_io_occupancy         ), //o
    .io_availability    (rxfifo_io_availability      ), //o
    .clk                (clk                         ), //i
    .reset              (reset                       )  //i
  );
  assign uart_txd = uartCtrl_7_io_uart_txd;
  assign stream_in_ready = txfifo_io_push_ready;
  assign _zz_1 = zz_counter_willIncrement(1'b0);
  always @(*) counter_willIncrement = _zz_1;
  always @(*) begin
    counter_willClear = 1'b0;
    if(when_UartStream_l37) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 9'h1f4);
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

  assign when_UartStream_l37 = (uartCtrl_7_io_read_valid && (! uartCtrl_7_io_read_valid_regNext));
  assign when_UartStream_l41 = ((! nodatareceive) && counter_willOverflow);
  assign when_UartStream_l49 = ((nodatareceive && (! nodatareceive_regNext)) && (5'h0 < rxfifo_io_occupancy));
  assign when_UartStream_l51 = (rxfifo_io_occupancy == 5'h0);
  assign rxint = interrupt;
  assign stream_out_payload = rxfifo_io_pop_payload;
  assign stream_out_valid = (rxfifo_io_pop_valid && rxfiforead);
  assign rxfifooccupancy = rxfifo_io_occupancy;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      nodatareceive <= 1'b1;
      counter_value <= 9'h0;
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
    uartCtrl_7_io_read_valid_regNext <= uartCtrl_7_io_read_valid;
    nodatareceive_regNext <= nodatareceive;
  end


endmodule

module StreamSequential (
  input               input_0_valid,
  output              input_0_ready,
  input      [7:0]    input_0_payload,
  input               input_1_valid,
  output              input_1_ready,
  input      [7:0]    input_1_payload,
  input               input_2_valid,
  output              input_2_ready,
  input      [7:0]    input_2_payload,
  input               input_3_valid,
  output              input_3_ready,
  input      [7:0]    input_3_payload,
  input               input_4_valid,
  output              input_4_ready,
  input      [7:0]    input_4_payload,
  input               input_5_valid,
  output              input_5_ready,
  input      [7:0]    input_5_payload,
  input               input_6_valid,
  output              input_6_ready,
  input      [7:0]    input_6_payload,
  input               interrupt_0,
  input               interrupt_1,
  input               interrupt_2,
  input               interrupt_3,
  input               interrupt_4,
  input               interrupt_5,
  input               interrupt_6,
  input      [4:0]    occupancy_0,
  input      [4:0]    occupancy_1,
  input      [4:0]    occupancy_2,
  input      [4:0]    occupancy_3,
  input      [4:0]    occupancy_4,
  input      [4:0]    occupancy_5,
  input      [4:0]    occupancy_6,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  output              readfifo_0,
  output              readfifo_1,
  output              readfifo_2,
  output              readfifo_3,
  output              readfifo_4,
  output              readfifo_5,
  output              readfifo_6,
  input               clk,
  input               reset
);
  wire                streammux_1_io_inputs_0_ready;
  wire                streammux_1_io_inputs_1_ready;
  wire                streammux_1_io_inputs_2_ready;
  wire                streammux_1_io_inputs_3_ready;
  wire                streammux_1_io_inputs_4_ready;
  wire                streammux_1_io_inputs_5_ready;
  wire                streammux_1_io_inputs_6_ready;
  wire                streammux_1_io_output_valid;
  wire       [7:0]    streammux_1_io_output_payload;
  reg                 rdfifo_0;
  reg                 rdfifo_1;
  reg                 rdfifo_2;
  reg                 rdfifo_3;
  reg                 rdfifo_4;
  reg                 rdfifo_5;
  reg                 rdfifo_6;
  reg        [2:0]    select_1;
  reg        `StreamSequentialState_binary_sequential_type stateMachine_state;
  wire                when_StreamSequential_l33;
  wire                when_StreamSequential_l36;
  wire                when_StreamSequential_l44;
  wire                when_StreamSequential_l47;
  wire                when_StreamSequential_l55;
  wire                when_StreamSequential_l58;
  wire                when_StreamSequential_l66;
  wire                when_StreamSequential_l69;
  wire                when_StreamSequential_l77;
  wire                when_StreamSequential_l80;
  wire                when_StreamSequential_l88;
  wire                when_StreamSequential_l91;
  wire                when_StreamSequential_l99;
  wire                when_StreamSequential_l102;
  `ifndef SYNTHESIS
  reg [39:0] stateMachine_state_string;
  `endif


  StreamMux streammux_1 (
    .io_select              (select_1                       ), //i
    .io_inputs_0_valid      (input_0_valid                  ), //i
    .io_inputs_0_ready      (streammux_1_io_inputs_0_ready  ), //o
    .io_inputs_0_payload    (input_0_payload                ), //i
    .io_inputs_1_valid      (input_1_valid                  ), //i
    .io_inputs_1_ready      (streammux_1_io_inputs_1_ready  ), //o
    .io_inputs_1_payload    (input_1_payload                ), //i
    .io_inputs_2_valid      (input_2_valid                  ), //i
    .io_inputs_2_ready      (streammux_1_io_inputs_2_ready  ), //o
    .io_inputs_2_payload    (input_2_payload                ), //i
    .io_inputs_3_valid      (input_3_valid                  ), //i
    .io_inputs_3_ready      (streammux_1_io_inputs_3_ready  ), //o
    .io_inputs_3_payload    (input_3_payload                ), //i
    .io_inputs_4_valid      (input_4_valid                  ), //i
    .io_inputs_4_ready      (streammux_1_io_inputs_4_ready  ), //o
    .io_inputs_4_payload    (input_4_payload                ), //i
    .io_inputs_5_valid      (input_5_valid                  ), //i
    .io_inputs_5_ready      (streammux_1_io_inputs_5_ready  ), //o
    .io_inputs_5_payload    (input_5_payload                ), //i
    .io_inputs_6_valid      (input_6_valid                  ), //i
    .io_inputs_6_ready      (streammux_1_io_inputs_6_ready  ), //o
    .io_inputs_6_payload    (input_6_payload                ), //i
    .io_output_valid        (streammux_1_io_output_valid    ), //o
    .io_output_ready        (output_ready                   ), //i
    .io_output_payload      (streammux_1_io_output_payload  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(stateMachine_state)
      `StreamSequentialState_binary_sequential_ONE : stateMachine_state_string = "ONE  ";
      `StreamSequentialState_binary_sequential_TWO : stateMachine_state_string = "TWO  ";
      `StreamSequentialState_binary_sequential_THREE : stateMachine_state_string = "THREE";
      `StreamSequentialState_binary_sequential_FOUR : stateMachine_state_string = "FOUR ";
      `StreamSequentialState_binary_sequential_FIVE : stateMachine_state_string = "FIVE ";
      `StreamSequentialState_binary_sequential_SIX : stateMachine_state_string = "SIX  ";
      `StreamSequentialState_binary_sequential_SEVEN : stateMachine_state_string = "SEVEN";
      default : stateMachine_state_string = "?????";
    endcase
  end
  `endif

  assign input_0_ready = streammux_1_io_inputs_0_ready;
  assign input_1_ready = streammux_1_io_inputs_1_ready;
  assign input_2_ready = streammux_1_io_inputs_2_ready;
  assign input_3_ready = streammux_1_io_inputs_3_ready;
  assign input_4_ready = streammux_1_io_inputs_4_ready;
  assign input_5_ready = streammux_1_io_inputs_5_ready;
  assign input_6_ready = streammux_1_io_inputs_6_ready;
  assign output_valid = streammux_1_io_output_valid;
  assign output_payload = streammux_1_io_output_payload;
  assign when_StreamSequential_l33 = (occupancy_0 == 5'h0);
  assign when_StreamSequential_l36 = ((occupancy_0 != 5'h0) && interrupt_0);
  assign when_StreamSequential_l44 = (occupancy_1 == 5'h0);
  assign when_StreamSequential_l47 = ((occupancy_1 != 5'h0) && interrupt_1);
  assign when_StreamSequential_l55 = (occupancy_2 == 5'h0);
  assign when_StreamSequential_l58 = ((occupancy_2 != 5'h0) && interrupt_2);
  assign when_StreamSequential_l66 = (occupancy_3 == 5'h0);
  assign when_StreamSequential_l69 = ((occupancy_3 != 5'h0) && interrupt_3);
  assign when_StreamSequential_l77 = (occupancy_4 == 5'h0);
  assign when_StreamSequential_l80 = ((occupancy_4 != 5'h0) && interrupt_4);
  assign when_StreamSequential_l88 = (occupancy_5 == 5'h0);
  assign when_StreamSequential_l91 = ((occupancy_5 != 5'h0) && interrupt_5);
  assign when_StreamSequential_l99 = (occupancy_6 == 5'h0);
  assign when_StreamSequential_l102 = ((occupancy_6 != 5'h0) && interrupt_6);
  assign readfifo_0 = rdfifo_0;
  assign readfifo_1 = rdfifo_1;
  assign readfifo_2 = rdfifo_2;
  assign readfifo_3 = rdfifo_3;
  assign readfifo_4 = rdfifo_4;
  assign readfifo_5 = rdfifo_5;
  assign readfifo_6 = rdfifo_6;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateMachine_state <= `StreamSequentialState_binary_sequential_ONE;
    end else begin
      case(stateMachine_state)
        `StreamSequentialState_binary_sequential_ONE : begin
          if(when_StreamSequential_l33) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_TWO;
          end
        end
        `StreamSequentialState_binary_sequential_TWO : begin
          if(when_StreamSequential_l44) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_THREE;
          end
        end
        `StreamSequentialState_binary_sequential_THREE : begin
          if(when_StreamSequential_l55) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_FOUR;
          end
        end
        `StreamSequentialState_binary_sequential_FOUR : begin
          if(when_StreamSequential_l66) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_FIVE;
          end
        end
        `StreamSequentialState_binary_sequential_FIVE : begin
          if(when_StreamSequential_l77) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_SIX;
          end
        end
        `StreamSequentialState_binary_sequential_SIX : begin
          if(when_StreamSequential_l88) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_SEVEN;
          end
        end
        default : begin
          if(when_StreamSequential_l99) begin
            stateMachine_state <= `StreamSequentialState_binary_sequential_ONE;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(stateMachine_state)
      `StreamSequentialState_binary_sequential_ONE : begin
        if(when_StreamSequential_l33) begin
          rdfifo_0 <= 1'b0;
        end else begin
          if(when_StreamSequential_l36) begin
            rdfifo_0 <= 1'b1;
            select_1 <= 3'b000;
          end else begin
            rdfifo_0 <= 1'b0;
          end
        end
      end
      `StreamSequentialState_binary_sequential_TWO : begin
        if(when_StreamSequential_l44) begin
          rdfifo_1 <= 1'b0;
        end else begin
          if(when_StreamSequential_l47) begin
            rdfifo_1 <= 1'b1;
            select_1 <= 3'b001;
          end else begin
            rdfifo_1 <= 1'b0;
          end
        end
      end
      `StreamSequentialState_binary_sequential_THREE : begin
        if(when_StreamSequential_l55) begin
          rdfifo_2 <= 1'b0;
        end else begin
          if(when_StreamSequential_l58) begin
            rdfifo_2 <= 1'b1;
            select_1 <= 3'b010;
          end else begin
            rdfifo_2 <= 1'b0;
          end
        end
      end
      `StreamSequentialState_binary_sequential_FOUR : begin
        if(when_StreamSequential_l66) begin
          rdfifo_3 <= 1'b0;
        end else begin
          if(when_StreamSequential_l69) begin
            rdfifo_3 <= 1'b1;
            select_1 <= 3'b011;
          end else begin
            rdfifo_3 <= 1'b0;
          end
        end
      end
      `StreamSequentialState_binary_sequential_FIVE : begin
        if(when_StreamSequential_l77) begin
          rdfifo_4 <= 1'b0;
        end else begin
          if(when_StreamSequential_l80) begin
            rdfifo_4 <= 1'b1;
            select_1 <= 3'b100;
          end else begin
            rdfifo_4 <= 1'b0;
          end
        end
      end
      `StreamSequentialState_binary_sequential_SIX : begin
        if(when_StreamSequential_l88) begin
          rdfifo_5 <= 1'b0;
        end else begin
          if(when_StreamSequential_l91) begin
            rdfifo_5 <= 1'b1;
            select_1 <= 3'b101;
          end else begin
            rdfifo_5 <= 1'b0;
          end
        end
      end
      default : begin
        if(when_StreamSequential_l99) begin
          rdfifo_6 <= 1'b0;
        end else begin
          if(when_StreamSequential_l102) begin
            rdfifo_6 <= 1'b1;
            select_1 <= 3'b110;
          end else begin
            rdfifo_6 <= 1'b0;
          end
        end
      end
    endcase
  end


endmodule

module StreamFragmentFork (
  input               input_valid,
  output reg          input_ready,
  input               input_payload_last,
  input      [7:0]    input_payload_fragment,
  output              output_0_valid,
  input               output_0_ready,
  output     [7:0]    output_0_payload,
  output              output_1_valid,
  input               output_1_ready,
  output     [7:0]    output_1_payload,
  output              output_2_valid,
  input               output_2_ready,
  output     [7:0]    output_2_payload,
  output              output_3_valid,
  input               output_3_ready,
  output     [7:0]    output_3_payload,
  output              output_4_valid,
  input               output_4_ready,
  output     [7:0]    output_4_payload,
  output              output_5_valid,
  input               output_5_ready,
  output     [7:0]    output_5_payload,
  output              output_6_valid,
  input               output_6_ready,
  output     [7:0]    output_6_payload,
  input               clk,
  input               reset
);
  reg                 linkEnable_0;
  reg                 linkEnable_1;
  reg                 linkEnable_2;
  reg                 linkEnable_3;
  reg                 linkEnable_4;
  reg                 linkEnable_5;
  reg                 linkEnable_6;
  reg        `StreamState_binary_sequential_type stateMachine_state;
  wire                input_fire;
  wire                when_StreamFragmentFork_l46;
  wire                when_StreamFragmentFork_l46_1;
  wire                when_StreamFragmentFork_l46_2;
  wire                when_StreamFragmentFork_l46_3;
  wire                when_StreamFragmentFork_l46_4;
  wire                when_StreamFragmentFork_l46_5;
  wire                when_StreamFragmentFork_l46_6;
  `ifndef SYNTHESIS
  reg [47:0] stateMachine_state_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(stateMachine_state)
      `StreamState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `StreamState_binary_sequential_WAIT_1 : stateMachine_state_string = "WAIT_1";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  assign input_fire = (input_valid && input_ready);
  always @(*) begin
    input_ready = 1'b1;
    if(when_StreamFragmentFork_l46) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_1) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_2) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_3) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_4) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_5) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_6) begin
      input_ready = 1'b0;
    end
  end

  assign when_StreamFragmentFork_l46 = ((! output_0_ready) && linkEnable_0);
  assign when_StreamFragmentFork_l46_1 = ((! output_1_ready) && linkEnable_1);
  assign when_StreamFragmentFork_l46_2 = ((! output_2_ready) && linkEnable_2);
  assign when_StreamFragmentFork_l46_3 = ((! output_3_ready) && linkEnable_3);
  assign when_StreamFragmentFork_l46_4 = ((! output_4_ready) && linkEnable_4);
  assign when_StreamFragmentFork_l46_5 = ((! output_5_ready) && linkEnable_5);
  assign when_StreamFragmentFork_l46_6 = ((! output_6_ready) && linkEnable_6);
  assign output_0_valid = (input_valid && linkEnable_0);
  assign output_0_payload = input_payload_fragment;
  assign output_1_valid = (input_valid && linkEnable_1);
  assign output_1_payload = input_payload_fragment;
  assign output_2_valid = (input_valid && linkEnable_2);
  assign output_2_payload = input_payload_fragment;
  assign output_3_valid = (input_valid && linkEnable_3);
  assign output_3_payload = input_payload_fragment;
  assign output_4_valid = (input_valid && linkEnable_4);
  assign output_4_payload = input_payload_fragment;
  assign output_5_valid = (input_valid && linkEnable_5);
  assign output_5_payload = input_payload_fragment;
  assign output_6_valid = (input_valid && linkEnable_6);
  assign output_6_payload = input_payload_fragment;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      linkEnable_0 <= 1'b0;
      linkEnable_1 <= 1'b0;
      linkEnable_2 <= 1'b0;
      linkEnable_3 <= 1'b0;
      linkEnable_4 <= 1'b0;
      linkEnable_5 <= 1'b0;
      linkEnable_6 <= 1'b0;
      stateMachine_state <= `StreamState_binary_sequential_IDLE;
    end else begin
      case(stateMachine_state)
        `StreamState_binary_sequential_IDLE : begin
          if(input_fire) begin
            linkEnable_0 <= (input_payload_fragment == 8'h01);
            linkEnable_1 <= (input_payload_fragment == 8'h02);
            linkEnable_2 <= (input_payload_fragment == 8'h03);
            linkEnable_3 <= (input_payload_fragment == 8'h04);
            linkEnable_4 <= (input_payload_fragment == 8'h05);
            linkEnable_5 <= (input_payload_fragment == 8'h06);
            linkEnable_6 <= (input_payload_fragment == 8'h07);
            stateMachine_state <= `StreamState_binary_sequential_WAIT_1;
          end
        end
        default : begin
          if(input_payload_last) begin
            linkEnable_0 <= 1'b0;
            linkEnable_1 <= 1'b0;
            linkEnable_2 <= 1'b0;
            linkEnable_3 <= 1'b0;
            linkEnable_4 <= 1'b0;
            linkEnable_5 <= 1'b0;
            linkEnable_6 <= 1'b0;
            stateMachine_state <= `StreamState_binary_sequential_IDLE;
          end
        end
      endcase
    end
  end


endmodule

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

//StreamFifo replaced by StreamFifo

//UartCtrl replaced by UartCtrl

//StreamFifo replaced by StreamFifo

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [4:0]    io_occupancy,
  output     [4:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [7:0]    _zz_logic_ram_port0;
  wire       [3:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [3:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [3:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [3:0]    logic_pushPtr_valueNext;
  reg        [3:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [3:0]    logic_popPtr_valueNext;
  reg        [3:0]    logic_popPtr_value;
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
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {3'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {3'd0, _zz_logic_popPtr_valueNext_1};
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 4'b1111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 4'b0000;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 4'b1111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 4'b0000;
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
      logic_pushPtr_value <= 4'b0000;
      logic_popPtr_value <= 4'b0000;
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

module StreamMux (
  input      [2:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [7:0]    io_inputs_0_payload,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [7:0]    io_inputs_1_payload,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [7:0]    io_inputs_2_payload,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input      [7:0]    io_inputs_3_payload,
  input               io_inputs_4_valid,
  output              io_inputs_4_ready,
  input      [7:0]    io_inputs_4_payload,
  input               io_inputs_5_valid,
  output              io_inputs_5_ready,
  input      [7:0]    io_inputs_5_payload,
  input               io_inputs_6_valid,
  output              io_inputs_6_ready,
  input      [7:0]    io_inputs_6_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [7:0]    io_output_payload
);
  reg                 _zz_io_output_valid;
  reg        [7:0]    _zz_io_output_payload;

  always @(*) begin
    case(io_select)
      3'b000 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload = io_inputs_0_payload;
      end
      3'b001 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload = io_inputs_1_payload;
      end
      3'b010 : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload = io_inputs_2_payload;
      end
      3'b011 : begin
        _zz_io_output_valid = io_inputs_3_valid;
        _zz_io_output_payload = io_inputs_3_payload;
      end
      3'b100 : begin
        _zz_io_output_valid = io_inputs_4_valid;
        _zz_io_output_payload = io_inputs_4_payload;
      end
      3'b101 : begin
        _zz_io_output_valid = io_inputs_5_valid;
        _zz_io_output_payload = io_inputs_5_payload;
      end
      default : begin
        _zz_io_output_valid = io_inputs_6_valid;
        _zz_io_output_payload = io_inputs_6_payload;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 3'b000) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 3'b001) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 3'b010) && io_output_ready);
  assign io_inputs_3_ready = ((io_select == 3'b011) && io_output_ready);
  assign io_inputs_4_ready = ((io_select == 3'b100) && io_output_ready);
  assign io_inputs_5_ready = ((io_select == 3'b101) && io_output_ready);
  assign io_inputs_6_ready = ((io_select == 3'b110) && io_output_ready);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload = _zz_io_output_payload;

endmodule

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

//UartCtrlRx replaced by UartCtrlRx

//UartCtrlTx replaced by UartCtrlTx

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

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

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
