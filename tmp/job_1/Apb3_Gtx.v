// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Apb3_Gtx
// Git hash  : c174ea6407642157543b0d5d61d63095d2618929


`define push_State_binary_sequential_type [0:0]
`define push_State_binary_sequential_LENGTH 1'b0
`define push_State_binary_sequential_DATA 1'b1

`define pop_State_binary_sequential_type [1:0]
`define pop_State_binary_sequential_LENGTH 2'b00
`define pop_State_binary_sequential_DATA 2'b01
`define pop_State_binary_sequential_WAIT_1 2'b10


module Apb3_Gtx (
  input      [19:0]   apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  input               axiclk,
  input               axireset,
  input               reset,
  input               clk
);
  reg                 axictrl_axictrl_rx_stream_ready;
  wire       [15:0]   axictrl_axictrl_tx_stream_payload;
  wire                axictrl_axiw_valid;
  wire                axictrl_axiw_payload_last;
  wire       [31:0]   axictrl_axiw_payload_fragment;
  wire                axictrl_axir_ready;
  wire                axictrl_axictrl_rx_stream_valid;
  wire       [15:0]   axictrl_axictrl_rx_stream_payload;
  wire       [8:0]    axictrl_axictrl_rx_popOccupancy;
  wire                axictrl_axictrl_tx_stream_ready;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 axictrl_axictrl_tx_flush_driver;
  reg                 axictrl_axictrl_rx_flush_driver;
  reg                 _zz_axictrl_tx_stream_valid;

  Gtx axictrl (
    .axiw_valid                   (axictrl_axiw_valid                 ), //o
    .axiw_ready                   (1'b1                               ), //i
    .axiw_payload_last            (axictrl_axiw_payload_last          ), //o
    .axiw_payload_fragment        (axictrl_axiw_payload_fragment      ), //o
    .axir_valid                   (axictrl_axiw_valid                 ), //i
    .axir_ready                   (axictrl_axir_ready                 ), //o
    .axir_payload_last            (axictrl_axiw_payload_last          ), //i
    .axir_payload_fragment        (axictrl_axiw_payload_fragment      ), //i
    .axictrl_rx_stream_valid      (axictrl_axictrl_rx_stream_valid    ), //o
    .axictrl_rx_stream_ready      (axictrl_axictrl_rx_stream_ready    ), //i
    .axictrl_rx_stream_payload    (axictrl_axictrl_rx_stream_payload  ), //o
    .axictrl_rx_flush             (axictrl_axictrl_rx_flush_driver    ), //i
    .axictrl_rx_popOccupancy      (axictrl_axictrl_rx_popOccupancy    ), //o
    .axictrl_tx_stream_valid      (_zz_axictrl_tx_stream_valid        ), //i
    .axictrl_tx_stream_ready      (axictrl_axictrl_tx_stream_ready    ), //o
    .axictrl_tx_stream_payload    (axictrl_axictrl_tx_stream_payload  ), //i
    .axictrl_tx_flush             (axictrl_axictrl_tx_flush_driver    ), //i
    .reset                        (reset                              ), //i
    .axiclk                       (axiclk                             ), //i
    .clk                          (clk                                )  //i
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      20'h0 : begin
        apb_PRDATA[0 : 0] = axictrl_axictrl_tx_flush_driver;
        apb_PRDATA[1 : 1] = axictrl_axictrl_tx_stream_ready;
        apb_PRDATA[4 : 4] = axictrl_axictrl_rx_flush_driver;
        apb_PRDATA[5 : 5] = axictrl_axictrl_rx_stream_valid;
      end
      20'h00020 : begin
        apb_PRDATA[15 : 0] = axictrl_axictrl_rx_stream_payload;
      end
      20'h00024 : begin
        apb_PRDATA[8 : 0] = axictrl_axictrl_rx_popOccupancy;
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
    _zz_axictrl_tx_stream_valid = 1'b0;
    case(apb_PADDR)
      20'h00010 : begin
        if(busCtrl_doWrite) begin
          _zz_axictrl_tx_stream_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign axictrl_axictrl_tx_stream_payload = apb_PWDATA[15 : 0];
  always @(*) begin
    axictrl_axictrl_rx_stream_ready = 1'b0;
    case(apb_PADDR)
      20'h00020 : begin
        if(busCtrl_doRead) begin
          axictrl_axictrl_rx_stream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      axictrl_axictrl_tx_flush_driver <= 1'b1;
      axictrl_axictrl_rx_flush_driver <= 1'b1;
    end else begin
      case(apb_PADDR)
        20'h0 : begin
          if(busCtrl_doWrite) begin
            axictrl_axictrl_tx_flush_driver <= apb_PWDATA[0];
            axictrl_axictrl_rx_flush_driver <= apb_PWDATA[4];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Gtx (
  output              axiw_valid,
  input               axiw_ready,
  output              axiw_payload_last,
  output     [31:0]   axiw_payload_fragment,
  input               axir_valid,
  output              axir_ready,
  input               axir_payload_last,
  input      [31:0]   axir_payload_fragment,
  output              axictrl_rx_stream_valid,
  input               axictrl_rx_stream_ready,
  output     [15:0]   axictrl_rx_stream_payload,
  input               axictrl_rx_flush,
  output     [8:0]    axictrl_rx_popOccupancy,
  input               axictrl_tx_stream_valid,
  output              axictrl_tx_stream_ready,
  input      [15:0]   axictrl_tx_stream_payload,
  input               axictrl_tx_flush,
  input               reset,
  input               axiclk,
  input               clk
);
  wire                bufferCC_14_io_dataOut;
  wire                bufferCC_15_io_dataOut;
  wire                txFrontend_stream_adapt_push_stream_ready;
  wire                txFrontend_stream_adapt_pop_stream_valid;
  wire       [31:0]   txFrontend_stream_adapt_pop_stream_payload;
  wire                txFrontend_buffer_io_push_stream_ready;
  wire       [6:0]    txFrontend_buffer_io_push_availability;
  wire                txFrontend_buffer_io_pop_stream_valid;
  wire                txFrontend_buffer_io_pop_stream_payload_last;
  wire       [31:0]   txFrontend_buffer_io_pop_stream_payload_fragment;
  wire                txBackend_crc_input_ready;
  wire                txBackend_crc_output_valid;
  wire                txBackend_crc_output_payload_last;
  wire       [31:0]   txBackend_crc_output_payload_fragment;
  wire                txBackend_header_input_ready;
  wire                txBackend_header_output_valid;
  wire                txBackend_header_output_payload_last;
  wire       [31:0]   txBackend_header_output_payload_fragment;
  wire                rxFrontend_preamble_io_input_ready;
  wire                rxFrontend_preamble_io_output_valid;
  wire                rxFrontend_preamble_io_output_payload_last;
  wire       [31:0]   rxFrontend_preamble_io_output_payload_fragment;
  wire                rxFrontend_checker_io_input_ready;
  wire                rxFrontend_checker_io_output_valid;
  wire                rxFrontend_checker_io_output_payload_last;
  wire       [31:0]   rxFrontend_checker_io_output_payload_fragment;
  wire                rxFrontend_checker_io_error;
  wire                rxFrontend_buffer_io_push_stream_ready;
  wire                rxFrontend_buffer_io_pop_stream_valid;
  wire       [15:0]   rxFrontend_buffer_io_pop_stream_payload;
  wire                rxFrontend_buffer_CC_io_push_ready;
  wire                rxFrontend_buffer_CC_io_pop_valid;
  wire       [15:0]   rxFrontend_buffer_CC_io_pop_payload;
  wire       [8:0]    rxFrontend_buffer_CC_io_pushOccupancy;
  wire       [8:0]    rxFrontend_buffer_CC_io_popOccupancy;
  wire                _zz_1;
  wire                rxReset;
  wire                _zz_2;
  wire                txReset;
  wire                txBackend_header_output_fire;
  reg                 _zz_io_pop_commit;

  BufferCC_12 bufferCC_14 (
    .io_dataIn     (1'b0                    ), //i
    .io_dataOut    (bufferCC_14_io_dataOut  ), //o
    .axiclk        (axiclk                  ), //i
    ._zz_1         (_zz_1                   )  //i
  );
  BufferCC_12 bufferCC_15 (
    .io_dataIn     (1'b0                    ), //i
    .io_dataOut    (bufferCC_15_io_dataOut  ), //o
    .axiclk        (axiclk                  ), //i
    ._zz_1         (_zz_2                   )  //i
  );
  Tx_Buffer_Adapt txFrontend_stream_adapt (
    .push_stream_valid      (axictrl_tx_stream_valid                     ), //i
    .push_stream_ready      (txFrontend_stream_adapt_push_stream_ready   ), //o
    .push_stream_payload    (axictrl_tx_stream_payload                   ), //i
    .pop_stream_valid       (txFrontend_stream_adapt_pop_stream_valid    ), //o
    .pop_stream_ready       (txFrontend_buffer_io_push_stream_ready      ), //i
    .pop_stream_payload     (txFrontend_stream_adapt_pop_stream_payload  ), //o
    .clk                    (clk                                         ), //i
    .reset                  (reset                                       ), //i
    .axictrl_tx_flush       (axictrl_tx_flush                            )  //i
  );
  Tx_Buffer txFrontend_buffer (
    .io_push_stream_valid              (txFrontend_stream_adapt_pop_stream_valid          ), //i
    .io_push_stream_ready              (txFrontend_buffer_io_push_stream_ready            ), //o
    .io_push_stream_payload            (txFrontend_stream_adapt_pop_stream_payload        ), //i
    .io_push_availability              (txFrontend_buffer_io_push_availability            ), //o
    .io_pop_stream_valid               (txFrontend_buffer_io_pop_stream_valid             ), //o
    .io_pop_stream_ready               (txBackend_crc_input_ready                         ), //i
    .io_pop_stream_payload_last        (txFrontend_buffer_io_pop_stream_payload_last      ), //o
    .io_pop_stream_payload_fragment    (txFrontend_buffer_io_pop_stream_payload_fragment  ), //o
    .io_pop_redo                       (1'b0                                              ), //i
    .io_pop_commit                     (_zz_io_pop_commit                                 ), //i
    .clk                               (clk                                               ), //i
    .reset                             (reset                                             ), //i
    .axictrl_tx_flush                  (axictrl_tx_flush                                  ), //i
    .axiclk                            (axiclk                                            ), //i
    .txReset                           (txReset                                           )  //i
  );
  Tx_Crc txBackend_crc (
    .input_valid                (txFrontend_buffer_io_pop_stream_valid             ), //i
    .input_ready                (txBackend_crc_input_ready                         ), //o
    .input_payload_last         (txFrontend_buffer_io_pop_stream_payload_last      ), //i
    .input_payload_fragment     (txFrontend_buffer_io_pop_stream_payload_fragment  ), //i
    .output_valid               (txBackend_crc_output_valid                        ), //o
    .output_ready               (txBackend_header_input_ready                      ), //i
    .output_payload_last        (txBackend_crc_output_payload_last                 ), //o
    .output_payload_fragment    (txBackend_crc_output_payload_fragment             ), //o
    .axiclk                     (axiclk                                            ), //i
    .txReset                    (txReset                                           )  //i
  );
  Tx_Header txBackend_header (
    .input_valid                (txBackend_crc_output_valid                ), //i
    .input_ready                (txBackend_header_input_ready              ), //o
    .input_payload_last         (txBackend_crc_output_payload_last         ), //i
    .input_payload_fragment     (txBackend_crc_output_payload_fragment     ), //i
    .output_valid               (txBackend_header_output_valid             ), //o
    .output_ready               (axiw_ready                                ), //i
    .output_payload_last        (txBackend_header_output_payload_last      ), //o
    .output_payload_fragment    (txBackend_header_output_payload_fragment  ), //o
    .axiclk                     (axiclk                                    ), //i
    .txReset                    (txReset                                   )  //i
  );
  Rx_Preamble rxFrontend_preamble (
    .io_input_valid                (axir_valid                                      ), //i
    .io_input_ready                (rxFrontend_preamble_io_input_ready              ), //o
    .io_input_payload_last         (axir_payload_last                               ), //i
    .io_input_payload_fragment     (axir_payload_fragment                           ), //i
    .io_output_valid               (rxFrontend_preamble_io_output_valid             ), //o
    .io_output_ready               (rxFrontend_checker_io_input_ready               ), //i
    .io_output_payload_last        (rxFrontend_preamble_io_output_payload_last      ), //o
    .io_output_payload_fragment    (rxFrontend_preamble_io_output_payload_fragment  ), //o
    .axiclk                        (axiclk                                          ), //i
    .rxReset                       (rxReset                                         )  //i
  );
  Rx_Checker rxFrontend_checker (
    .io_input_valid                (rxFrontend_preamble_io_output_valid             ), //i
    .io_input_ready                (rxFrontend_checker_io_input_ready               ), //o
    .io_input_payload_last         (rxFrontend_preamble_io_output_payload_last      ), //i
    .io_input_payload_fragment     (rxFrontend_preamble_io_output_payload_fragment  ), //i
    .io_output_valid               (rxFrontend_checker_io_output_valid              ), //o
    .io_output_ready               (rxFrontend_buffer_io_push_stream_ready          ), //i
    .io_output_payload_last        (rxFrontend_checker_io_output_payload_last       ), //o
    .io_output_payload_fragment    (rxFrontend_checker_io_output_payload_fragment   ), //o
    .io_error                      (rxFrontend_checker_io_error                     ), //o
    .axiclk                        (axiclk                                          ), //i
    .rxReset                       (rxReset                                         )  //i
  );
  Rx_Buffer_Adapt rxFrontend_buffer (
    .io_push_stream_valid               (rxFrontend_checker_io_output_valid             ), //i
    .io_push_stream_ready               (rxFrontend_buffer_io_push_stream_ready         ), //o
    .io_push_stream_payload_last        (rxFrontend_checker_io_output_payload_last      ), //i
    .io_push_stream_payload_fragment    (rxFrontend_checker_io_output_payload_fragment  ), //i
    .io_pop_stream_valid                (rxFrontend_buffer_io_pop_stream_valid          ), //o
    .io_pop_stream_ready                (rxFrontend_buffer_CC_io_push_ready             ), //i
    .io_pop_stream_payload              (rxFrontend_buffer_io_pop_stream_payload        ), //o
    .axiclk                             (axiclk                                         ), //i
    .rxReset                            (rxReset                                        )  //i
  );
  StreamFifoCC_1 rxFrontend_buffer_CC (
    .io_push_valid       (rxFrontend_buffer_io_pop_stream_valid    ), //i
    .io_push_ready       (rxFrontend_buffer_CC_io_push_ready       ), //o
    .io_push_payload     (rxFrontend_buffer_io_pop_stream_payload  ), //i
    .io_pop_valid        (rxFrontend_buffer_CC_io_pop_valid        ), //o
    .io_pop_ready        (axictrl_rx_stream_ready                  ), //i
    .io_pop_payload      (rxFrontend_buffer_CC_io_pop_payload      ), //o
    .io_pushOccupancy    (rxFrontend_buffer_CC_io_pushOccupancy    ), //o
    .io_popOccupancy     (rxFrontend_buffer_CC_io_popOccupancy     ), //o
    .axiclk              (axiclk                                   ), //i
    .rxReset             (rxReset                                  ), //i
    .clk                 (clk                                      ), //i
    .reset               (reset                                    ), //i
    .axictrl_rx_flush    (axictrl_rx_flush                         )  //i
  );
  assign _zz_1 = (reset || axictrl_rx_flush);
  assign rxReset = bufferCC_14_io_dataOut;
  assign _zz_2 = (reset || axictrl_tx_flush);
  assign txReset = bufferCC_15_io_dataOut;
  assign axictrl_tx_stream_ready = txFrontend_stream_adapt_push_stream_ready;
  assign axiw_valid = txBackend_header_output_valid;
  assign axiw_payload_last = txBackend_header_output_payload_last;
  assign axiw_payload_fragment = txBackend_header_output_payload_fragment;
  assign txBackend_header_output_fire = (txBackend_header_output_valid && axiw_ready);
  assign axir_ready = rxFrontend_preamble_io_input_ready;
  assign axictrl_rx_stream_valid = rxFrontend_buffer_CC_io_pop_valid;
  assign axictrl_rx_stream_payload = rxFrontend_buffer_CC_io_pop_payload;
  assign axictrl_rx_popOccupancy = rxFrontend_buffer_CC_io_popOccupancy;
  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      _zz_io_pop_commit <= 1'b0;
    end else begin
      _zz_io_pop_commit <= (txBackend_header_output_fire && txBackend_header_output_payload_last);
    end
  end


endmodule

module StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [15:0]   io_pop_payload,
  output     [8:0]    io_pushOccupancy,
  output     [8:0]    io_popOccupancy,
  input               axiclk,
  input               rxReset,
  input               clk,
  input               reset,
  input               axictrl_rx_flush
);
  reg        [15:0]   _zz_ram_port1;
  wire       [8:0]    popToPushGray_buffercc_io_dataOut;
  wire       [8:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [8:0]    _zz_pushCC_pushPtrGray;
  wire       [7:0]    _zz_ram_port;
  wire       [8:0]    _zz_popCC_popPtrGray;
  wire       [7:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [7:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [8:0]    popToPushGray;
  wire       [8:0]    pushToPopGray;
  reg        [8:0]    pushCC_pushPtr;
  wire       [8:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [8:0]    pushCC_pushPtrGray;
  wire       [8:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  wire                _zz_io_pushOccupancy_7;
  reg        [8:0]    popCC_popPtr;
  wire       [8:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [8:0]    popCC_popPtrGray;
  wire       [8:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [8:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  wire                _zz_io_popOccupancy_7;
  reg [15:0] ram [0:255];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[7:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[7:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge axiclk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_10 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .axiclk        (axiclk                             ), //i
    .rxReset       (rxReset                            )  //i
  );
  BufferCC_11 pushToPopGray_buffercc (
    .io_dataIn           (pushToPopGray                      ), //i
    .io_dataOut          (pushToPopGray_buffercc_io_dataOut  ), //o
    .clk                 (clk                                ), //i
    .reset               (reset                              ), //i
    .axictrl_rx_flush    (axictrl_rx_flush                   )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 9'h001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[8 : 7] == (~ pushCC_popPtrGray[8 : 7])) && (pushCC_pushPtrGray[6 : 0] == pushCC_popPtrGray[6 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = (pushCC_popPtrGray[7] ^ _zz_io_pushOccupancy_7);
  assign _zz_io_pushOccupancy_7 = pushCC_popPtrGray[8];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_7,{_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 9'h001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = (popCC_pushPtrGray[6] ^ _zz_io_popOccupancy_6);
  assign _zz_io_popOccupancy_6 = (popCC_pushPtrGray[7] ^ _zz_io_popOccupancy_7);
  assign _zz_io_popOccupancy_7 = popCC_pushPtrGray[8];
  assign io_popOccupancy = ({_zz_io_popOccupancy_7,{_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      pushCC_pushPtr <= 9'h0;
      pushCC_pushPtrGray <= 9'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      popCC_popPtr <= 9'h0;
      popCC_popPtrGray <= 9'h0;
    end else begin
      if(axictrl_rx_flush) begin
      popCC_popPtr <= 9'h0;
      popCC_popPtrGray <= 9'h0;
      end else begin
        if(io_pop_fire) begin
          popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
        end
        if(io_pop_fire_2) begin
          popCC_popPtr <= popCC_popPtrPlus;
        end
      end
    end
  end


endmodule

module Rx_Buffer_Adapt (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input               io_push_stream_payload_last,
  input      [31:0]   io_push_stream_payload_fragment,
  output reg          io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [15:0]   io_pop_stream_payload,
  input               axiclk,
  input               rxReset
);
  reg                 fifo_io_pop_stream_ready;
  wire                fifo_io_push_stream_ready;
  wire       [6:0]    fifo_io_push_availability;
  wire                fifo_io_pop_stream_valid;
  wire       [31:0]   fifo_io_pop_stream_payload;
  reg        [15:0]   _zz_io_pop_stream_payload;
  reg                 push_commit;
  reg        [0:0]    pop_spliter;
  wire                when_Rx_Crc_l271;

  MacTxManagedStreamFifoCc_1 fifo (
    .io_push_stream_valid      (io_push_stream_valid             ), //i
    .io_push_stream_ready      (fifo_io_push_stream_ready        ), //o
    .io_push_stream_payload    (io_push_stream_payload_fragment  ), //i
    .io_push_commit            (push_commit                      ), //i
    .io_push_availability      (fifo_io_push_availability        ), //o
    .io_pop_stream_valid       (fifo_io_pop_stream_valid         ), //o
    .io_pop_stream_ready       (fifo_io_pop_stream_ready         ), //i
    .io_pop_stream_payload     (fifo_io_pop_stream_payload       ), //o
    .io_pop_redo               (1'b0                             ), //i
    .io_pop_commit             (1'b0                             ), //i
    .axiclk                    (axiclk                           ), //i
    .rxReset                   (rxReset                          )  //i
  );
  always @(*) begin
    case(pop_spliter)
      1'b0 : begin
        _zz_io_pop_stream_payload = fifo_io_pop_stream_payload[15 : 0];
      end
      default : begin
        _zz_io_pop_stream_payload = fifo_io_pop_stream_payload[31 : 16];
      end
    endcase
  end

  assign io_push_stream_ready = fifo_io_push_stream_ready;
  always @(*) begin
    fifo_io_pop_stream_ready = 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        if(io_pop_stream_ready) begin
          if(when_Rx_Crc_l271) begin
            fifo_io_pop_stream_ready = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    io_pop_stream_valid = 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        io_pop_stream_valid = 1'b1;
      end
    end
  end

  assign io_pop_stream_payload = _zz_io_pop_stream_payload;
  assign when_Rx_Crc_l271 = (pop_spliter == 1'b1);
  always @(posedge axiclk) begin
    push_commit <= 1'b0;
    if(io_push_stream_payload_last) begin
      push_commit <= 1'b1;
    end
    pop_spliter <= 1'b0;
    if(fifo_io_pop_stream_valid) begin
      if(io_pop_stream_ready) begin
        if(io_pop_stream_ready) begin
          pop_spliter <= (pop_spliter + 1'b1);
        end
      end
    end
  end


endmodule

module Rx_Checker (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  output              io_error,
  input               axiclk,
  input               rxReset
);
  wire                crc_2_flush;
  wire       [31:0]   crc_2_result;
  wire                io_output_fire;

  Crc_1 crc_2 (
    .flush            (crc_2_flush                ), //i
    .input_valid      (io_input_valid             ), //i
    .input_payload    (io_input_payload_fragment  ), //i
    .result           (crc_2_result               ), //o
    .axiclk           (axiclk                     ), //i
    .rxReset          (rxReset                    )  //i
  );
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign crc_2_flush = (io_output_fire && io_output_payload_last);
  assign io_output_valid = io_input_valid;
  assign io_output_payload_last = io_input_payload_last;
  assign io_output_payload_fragment = io_input_payload_fragment;
  assign io_input_ready = io_output_ready;
  assign io_error = (io_input_payload_last && (crc_2_result != io_input_payload_fragment));

endmodule

module Rx_Preamble (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output reg          io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  input               axiclk,
  input               rxReset
);
  wire       [63:0]   startDelimiter;
  wire                io_input_fire;
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
  wire                when_Rx_Crc_l26;
  wire                when_Rx_Crc_l33;

  assign startDelimiter = 64'h000000120000ffbc;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign _zz_history_0_valid = io_input_valid;
  assign _zz_history_0_ready = io_input_ready;
  assign _zz_history_0_payload_last = io_input_payload_last;
  assign _zz_history_0_payload_fragment = io_input_payload_fragment;
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
    io_output_valid = 1'b0;
    if(!when_Rx_Crc_l26) begin
      if(io_input_valid) begin
        io_output_valid = 1'b1;
      end
    end
  end

  assign io_output_payload_fragment = io_input_payload_fragment;
  assign io_input_ready = ((! inFrame) || io_output_ready);
  assign io_output_payload_last = io_input_payload_last;
  assign when_Rx_Crc_l26 = (! inFrame);
  assign when_Rx_Crc_l33 = (io_output_ready && io_input_payload_last);
  always @(posedge axiclk) begin
    if(io_input_fire) begin
      _zz_history_1_valid <= _zz_history_0_valid;
      _zz_history_1_ready <= _zz_history_0_ready;
      _zz_history_1_payload_last <= _zz_history_0_payload_last;
      _zz_history_1_payload_fragment <= _zz_history_0_payload_fragment;
    end
  end

  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      inFrame <= 1'b0;
    end else begin
      if(when_Rx_Crc_l26) begin
        if(hit) begin
          inFrame <= 1'b1;
        end
      end else begin
        if(io_input_valid) begin
          if(when_Rx_Crc_l33) begin
            inFrame <= 1'b0;
          end
        end
      end
    end
  end


endmodule

module Tx_Header (
  input               input_valid,
  output reg          input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output              output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               axiclk,
  input               txReset
);
  reg        [31:0]   _zz_output_payload_fragment;
  wire       [0:0]    _zz_output_payload_fragment_1;
  wire       [63:0]   header;
  reg        [1:0]    state;
  wire                when_Tx_Crc_l183;
  wire                output_fire;
  wire                input_fire;
  wire                when_Tx_Crc_l192;

  assign _zz_output_payload_fragment_1 = state[0:0];
  always @(*) begin
    case(_zz_output_payload_fragment_1)
      1'b0 : begin
        _zz_output_payload_fragment = header[63 : 32];
      end
      default : begin
        _zz_output_payload_fragment = header[31 : 0];
      end
    endcase
  end

  assign header = 64'h0000ffbc00000012;
  assign output_valid = input_valid;
  always @(*) begin
    output_payload_last = 1'b0;
    if(when_Tx_Crc_l183) begin
      output_payload_last = input_payload_last;
    end
  end

  always @(*) begin
    input_ready = 1'b0;
    if(when_Tx_Crc_l183) begin
      input_ready = output_ready;
    end
  end

  assign when_Tx_Crc_l183 = (state == 2'b10);
  always @(*) begin
    if(when_Tx_Crc_l183) begin
      output_payload_fragment = input_payload_fragment;
    end else begin
      output_payload_fragment = _zz_output_payload_fragment;
    end
  end

  assign output_fire = (output_valid && output_ready);
  assign input_fire = (input_valid && input_ready);
  assign when_Tx_Crc_l192 = (input_fire && input_payload_last);
  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      state <= 2'b00;
    end else begin
      if(!when_Tx_Crc_l183) begin
        if(output_fire) begin
          state <= (state + 2'b01);
        end
      end
      if(when_Tx_Crc_l192) begin
        state <= 2'b00;
      end
    end
  end


endmodule

module Tx_Crc (
  input               input_valid,
  output reg          input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output reg          output_valid,
  input               output_ready,
  output reg          output_payload_last,
  output reg [31:0]   output_payload_fragment,
  input               axiclk,
  input               txReset
);
  wire                crc_2_flush;
  wire       [31:0]   crc_2_result;
  reg                 emitCrc;
  wire                input_fire;
  wire                when_Tx_Crc_l151;
  wire                output_fire;
  wire                when_Tx_Crc_l151_1;
  wire                input_fire_1;
  wire                output_fire_1;
  wire                when_Tx_Crc_l157;

  Crc crc_2 (
    .flush            (crc_2_flush             ), //i
    .input_valid      (input_fire_1            ), //i
    .input_payload    (input_payload_fragment  ), //i
    .result           (crc_2_result            ), //o
    .axiclk           (axiclk                  ), //i
    .txReset          (txReset                 )  //i
  );
  assign input_fire = (input_valid && input_ready);
  assign when_Tx_Crc_l151 = (input_fire && input_payload_last);
  assign output_fire = (output_valid && output_ready);
  assign when_Tx_Crc_l151_1 = (output_fire && output_payload_last);
  assign input_fire_1 = (input_valid && input_ready);
  assign output_fire_1 = (output_valid && output_ready);
  assign crc_2_flush = (output_fire_1 && output_payload_last);
  always @(*) begin
    output_payload_last = 1'b0;
    if(!when_Tx_Crc_l157) begin
      output_payload_last = 1'b1;
    end
  end

  assign when_Tx_Crc_l157 = (! emitCrc);
  always @(*) begin
    if(when_Tx_Crc_l157) begin
      output_valid = input_valid;
    end else begin
      output_valid = 1'b1;
    end
  end

  always @(*) begin
    if(when_Tx_Crc_l157) begin
      output_payload_fragment = input_payload_fragment;
    end else begin
      output_payload_fragment = crc_2_result;
    end
  end

  always @(*) begin
    if(when_Tx_Crc_l157) begin
      input_ready = output_ready;
    end else begin
      input_ready = 1'b0;
    end
  end

  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      emitCrc <= 1'b0;
    end else begin
      if(when_Tx_Crc_l151) begin
        emitCrc <= 1'b1;
      end
      if(when_Tx_Crc_l151_1) begin
        emitCrc <= 1'b0;
      end
      if(!when_Tx_Crc_l157) begin
        emitCrc <= 1'b0;
      end
    end
  end


endmodule

module Tx_Buffer (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  output     [6:0]    io_push_availability,
  output reg          io_pop_stream_valid,
  input               io_pop_stream_ready,
  output reg          io_pop_stream_payload_last,
  output     [31:0]   io_pop_stream_payload_fragment,
  input               io_pop_redo,
  input               io_pop_commit,
  input               clk,
  input               reset,
  input               axictrl_tx_flush,
  input               axiclk,
  input               txReset
);
  reg                 fifo_io_pop_stream_ready;
  wire                fifo_io_push_stream_ready;
  wire       [6:0]    fifo_io_push_availability;
  wire                fifo_io_pop_stream_valid;
  wire       [31:0]   fifo_io_pop_stream_payload;
  wire       [10:0]   _zz_push_wordCountMinusOne;
  wire       [31:0]   _zz_push_length;
  wire       [31:0]   _zz_pop_length;
  reg                 push_commit;
  reg        `push_State_binary_sequential_type push_state_1;
  reg        [10:0]   push_length;
  wire       [5:0]    push_wordCountMinusOne;
  reg        [5:0]    push_wordCounter;
  wire                fifo_io_push_stream_fire;
  wire                io_push_stream_fire;
  wire                when_Tx_Crc_l66;
  reg        `pop_State_binary_sequential_type pop_state_1;
  reg        [10:0]   pop_length;
  wire       [10:0]   pop_lengthMinusOne;
  reg        [5:0]    pop_wordCounter;
  wire       [5:0]    pop_wordCountEndAt;
  wire                when_Tx_Crc_l105;
  `ifndef SYNTHESIS
  reg [47:0] push_state_1_string;
  reg [47:0] pop_state_1_string;
  `endif


  assign _zz_push_wordCountMinusOne = (push_length - 11'h001);
  assign _zz_push_length = io_push_stream_payload;
  assign _zz_pop_length = fifo_io_pop_stream_payload;
  MacTxManagedStreamFifoCc fifo (
    .io_push_stream_valid      (io_push_stream_valid        ), //i
    .io_push_stream_ready      (fifo_io_push_stream_ready   ), //o
    .io_push_stream_payload    (io_push_stream_payload      ), //i
    .io_push_commit            (push_commit                 ), //i
    .io_push_availability      (fifo_io_push_availability   ), //o
    .io_pop_stream_valid       (fifo_io_pop_stream_valid    ), //o
    .io_pop_stream_ready       (fifo_io_pop_stream_ready    ), //i
    .io_pop_stream_payload     (fifo_io_pop_stream_payload  ), //o
    .io_pop_redo               (io_pop_redo                 ), //i
    .io_pop_commit             (io_pop_commit               ), //i
    .clk                       (clk                         ), //i
    .reset                     (reset                       ), //i
    .axictrl_tx_flush          (axictrl_tx_flush            ), //i
    .axiclk                    (axiclk                      ), //i
    .txReset                   (txReset                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(push_state_1)
      `push_State_binary_sequential_LENGTH : push_state_1_string = "LENGTH";
      `push_State_binary_sequential_DATA : push_state_1_string = "DATA  ";
      default : push_state_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(pop_state_1)
      `pop_State_binary_sequential_LENGTH : pop_state_1_string = "LENGTH";
      `pop_State_binary_sequential_DATA : pop_state_1_string = "DATA  ";
      `pop_State_binary_sequential_WAIT_1 : pop_state_1_string = "WAIT_1";
      default : pop_state_1_string = "??????";
    endcase
  end
  `endif

  assign io_push_availability = fifo_io_push_availability;
  assign io_push_stream_ready = fifo_io_push_stream_ready;
  assign push_wordCountMinusOne = (_zz_push_wordCountMinusOne >>> 5);
  assign fifo_io_push_stream_fire = (io_push_stream_valid && fifo_io_push_stream_ready);
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign when_Tx_Crc_l66 = (push_wordCounter == push_wordCountMinusOne);
  assign pop_lengthMinusOne = (pop_length - 11'h001);
  assign pop_wordCountEndAt = (pop_lengthMinusOne >>> 5);
  always @(*) begin
    fifo_io_pop_stream_ready = 1'b0;
    case(pop_state_1)
      `pop_State_binary_sequential_LENGTH : begin
        if(fifo_io_pop_stream_valid) begin
          fifo_io_pop_stream_ready = 1'b1;
        end
      end
      `pop_State_binary_sequential_DATA : begin
        if(io_pop_stream_ready) begin
          fifo_io_pop_stream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_pop_stream_valid = 1'b0;
    case(pop_state_1)
      `pop_State_binary_sequential_LENGTH : begin
      end
      `pop_State_binary_sequential_DATA : begin
        io_pop_stream_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_pop_stream_payload_last = 1'b0;
    case(pop_state_1)
      `pop_State_binary_sequential_LENGTH : begin
      end
      `pop_State_binary_sequential_DATA : begin
        if(io_pop_stream_ready) begin
          if(when_Tx_Crc_l105) begin
            io_pop_stream_payload_last = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign io_pop_stream_payload_fragment = fifo_io_pop_stream_payload;
  assign when_Tx_Crc_l105 = (pop_wordCounter == pop_wordCountEndAt);
  always @(posedge clk) begin
    push_commit <= 1'b0;
    case(push_state_1)
      `push_State_binary_sequential_LENGTH : begin
        push_wordCounter <= 6'h0;
        if(fifo_io_push_stream_fire) begin
          push_length <= _zz_push_length[10:0];
        end
      end
      default : begin
        if(io_push_stream_fire) begin
          push_wordCounter <= (push_wordCounter + 6'h01);
          if(when_Tx_Crc_l66) begin
            push_commit <= 1'b1;
          end
        end
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      push_state_1 <= `push_State_binary_sequential_LENGTH;
    end else begin
      if(axictrl_tx_flush) begin
      push_state_1 <= `push_State_binary_sequential_LENGTH;
      end else begin
        case(push_state_1)
          `push_State_binary_sequential_LENGTH : begin
            if(fifo_io_push_stream_fire) begin
              push_state_1 <= `push_State_binary_sequential_DATA;
            end
          end
          default : begin
            if(io_push_stream_fire) begin
              if(when_Tx_Crc_l66) begin
                push_state_1 <= `push_State_binary_sequential_LENGTH;
              end
            end
          end
        endcase
      end
    end
  end

  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      pop_state_1 <= `pop_State_binary_sequential_LENGTH;
    end else begin
      case(pop_state_1)
        `pop_State_binary_sequential_LENGTH : begin
          if(fifo_io_pop_stream_valid) begin
            pop_state_1 <= `pop_State_binary_sequential_DATA;
          end
        end
        `pop_State_binary_sequential_DATA : begin
          if(io_pop_stream_ready) begin
            if(when_Tx_Crc_l105) begin
              pop_state_1 <= `pop_State_binary_sequential_WAIT_1;
            end
          end
        end
        default : begin
          if(io_pop_commit) begin
            pop_state_1 <= `pop_State_binary_sequential_LENGTH;
          end
        end
      endcase
      if(io_pop_redo) begin
        pop_state_1 <= `pop_State_binary_sequential_LENGTH;
      end
    end
  end

  always @(posedge axiclk) begin
    case(pop_state_1)
      `pop_State_binary_sequential_LENGTH : begin
        pop_wordCounter <= 6'h0;
        if(fifo_io_pop_stream_valid) begin
          pop_length <= _zz_pop_length[10:0];
        end
      end
      `pop_State_binary_sequential_DATA : begin
        if(io_pop_stream_ready) begin
          pop_wordCounter <= (pop_wordCounter + 6'h01);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Tx_Buffer_Adapt (
  input               push_stream_valid,
  output              push_stream_ready,
  input      [15:0]   push_stream_payload,
  output              pop_stream_valid,
  input               pop_stream_ready,
  output     [31:0]   pop_stream_payload,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);
  wire                area_fifo_io_push_valid;
  wire       [31:0]   area_fifo_io_push_payload;
  wire                area_fifo_io_push_ready;
  wire                area_fifo_io_pop_valid;
  wire       [31:0]   area_fifo_io_pop_payload;
  wire       [6:0]    area_fifo_io_pushOccupancy;
  wire       [6:0]    area_fifo_io_popOccupancy;
  wire                push_stream_fire;
  reg                 _zz_push_stream_ready;
  reg        [0:0]    _zz_push_stream_ready_1;
  reg        [0:0]    _zz_push_stream_ready_2;
  wire                _zz_push_stream_ready_3;
  reg        [15:0]   _zz_io_push_payload;
  wire                push_stream_fire_1;

  StreamFifoCC area_fifo (
    .io_push_valid       (area_fifo_io_push_valid     ), //i
    .io_push_ready       (area_fifo_io_push_ready     ), //o
    .io_push_payload     (area_fifo_io_push_payload   ), //i
    .io_pop_valid        (area_fifo_io_pop_valid      ), //o
    .io_pop_ready        (pop_stream_ready            ), //i
    .io_pop_payload      (area_fifo_io_pop_payload    ), //o
    .io_pushOccupancy    (area_fifo_io_pushOccupancy  ), //o
    .io_popOccupancy     (area_fifo_io_popOccupancy   ), //o
    .clk                 (clk                         ), //i
    .reset               (reset                       ), //i
    .axictrl_tx_flush    (axictrl_tx_flush            )  //i
  );
  assign push_stream_fire = (push_stream_valid && push_stream_ready);
  always @(*) begin
    _zz_push_stream_ready = 1'b0;
    if(push_stream_fire) begin
      _zz_push_stream_ready = 1'b1;
    end
  end

  assign _zz_push_stream_ready_3 = (_zz_push_stream_ready_2 == 1'b1);
  always @(*) begin
    _zz_push_stream_ready_1 = (_zz_push_stream_ready_2 + _zz_push_stream_ready);
    if(1'b0) begin
      _zz_push_stream_ready_1 = 1'b0;
    end
  end

  assign push_stream_fire_1 = (push_stream_valid && push_stream_ready);
  assign area_fifo_io_push_valid = (push_stream_valid && _zz_push_stream_ready_3);
  assign area_fifo_io_push_payload = {push_stream_payload,_zz_io_push_payload};
  assign push_stream_ready = (! ((! area_fifo_io_push_ready) && _zz_push_stream_ready_3));
  assign pop_stream_valid = area_fifo_io_pop_valid;
  assign pop_stream_payload = area_fifo_io_pop_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_push_stream_ready_2 <= 1'b0;
    end else begin
      if(axictrl_tx_flush) begin
      _zz_push_stream_ready_2 <= 1'b0;
      end else begin
        _zz_push_stream_ready_2 <= _zz_push_stream_ready_1;
      end
    end
  end

  always @(posedge clk) begin
    if(push_stream_fire_1) begin
      _zz_io_push_payload <= push_stream_payload;
    end
  end


endmodule

//BufferCC_12 replaced by BufferCC_12

module BufferCC_12 (
  input               io_dataIn,
  output              io_dataOut,
  input               axiclk,
  input               _zz_1
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiclk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_11 (
  input      [8:0]    io_dataIn,
  output     [8:0]    io_dataOut,
  input               clk,
  input               reset,
  input               axictrl_rx_flush
);
  (* async_reg = "true" *) reg        [8:0]    buffers_0;
  (* async_reg = "true" *) reg        [8:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 9'h0;
      buffers_1 <= 9'h0;
    end else begin
      if(axictrl_rx_flush) begin
      buffers_0 <= 9'h0;
      buffers_1 <= 9'h0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule

module BufferCC_10 (
  input      [8:0]    io_dataIn,
  output     [8:0]    io_dataOut,
  input               axiclk,
  input               rxReset
);
  (* async_reg = "true" *) reg        [8:0]    buffers_0;
  (* async_reg = "true" *) reg        [8:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      buffers_0 <= 9'h0;
      buffers_1 <= 9'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module MacTxManagedStreamFifoCc_1 (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  input               io_push_commit,
  output     [6:0]    io_push_availability,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  input               io_pop_redo,
  input               io_pop_commit,
  input               axiclk,
  input               rxReset
);
  reg        [31:0]   _zz_ram_port1;
  wire                popToPush_io_input_ready;
  wire                popToPush_io_output_valid;
  wire       [6:0]    popToPush_io_output_payload;
  wire                pushToPop_io_input_ready;
  wire                pushToPop_io_output_valid;
  wire       [6:0]    pushToPop_io_output_payload;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_io_push_availability;
  reg                 _zz_1;
  reg        [6:0]    push_currentPtr;
  reg        [6:0]    push_oldPtr;
  reg        [6:0]    push_popPtr;
  wire                io_push_stream_fire;
  reg        [6:0]    pop_currentPtr;
  reg        [6:0]    pop_oldPtr;
  reg        [6:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [5:0]    pop_cmd_payload;
  wire                io_pop_stream_fire;
  reg        [6:0]    pop_commitPtr;
  wire                _zz_io_pop_stream_valid;
  reg                 _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  reg                 _zz_io_pop_stream_valid_2;
  wire                pop_cmd_fire;
  reg [31:0] ram [0:63];

  assign _zz_ram_port = push_currentPtr[5:0];
  assign _zz_io_push_availability = (push_currentPtr - push_popPtr);
  always @(posedge axiclk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_stream_payload;
    end
  end

  always @(posedge axiclk) begin
    if(pop_cmd_ready) begin
      _zz_ram_port1 <= ram[pop_cmd_payload];
    end
  end

  StreamCCByToggle_2 popToPush (
    .io_input_valid       (1'b1                         ), //i
    .io_input_ready       (popToPush_io_input_ready     ), //o
    .io_input_payload     (pop_oldPtr                   ), //i
    .io_output_valid      (popToPush_io_output_valid    ), //o
    .io_output_ready      (1'b1                         ), //i
    .io_output_payload    (popToPush_io_output_payload  ), //o
    .axiclk               (axiclk                       ), //i
    .rxReset              (rxReset                      )  //i
  );
  StreamCCByToggle_2 pushToPop (
    .io_input_valid       (1'b1                         ), //i
    .io_input_ready       (pushToPop_io_input_ready     ), //o
    .io_input_payload     (push_oldPtr                  ), //i
    .io_output_valid      (pushToPop_io_output_valid    ), //o
    .io_output_ready      (1'b1                         ), //i
    .io_output_payload    (pushToPop_io_output_payload  ), //o
    .axiclk               (axiclk                       ), //i
    .rxReset              (rxReset                      )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_stream_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign io_push_stream_ready = (! ((push_currentPtr[6] != push_popPtr[6]) && (push_currentPtr[5 : 0] == push_popPtr[5 : 0])));
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign io_push_availability = (7'h40 - _zz_io_push_availability);
  assign pop_cmd_valid = ((! (pop_currentPtr == pop_pushPtr)) && (! io_pop_redo));
  assign pop_cmd_payload = pop_currentPtr[5:0];
  assign io_pop_stream_fire = (io_pop_stream_valid && io_pop_stream_ready);
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  always @(*) begin
    _zz_io_pop_stream_valid_2 = _zz_io_pop_stream_valid;
    if(io_pop_redo) begin
      _zz_io_pop_stream_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    _zz_pop_cmd_ready = io_pop_stream_ready;
    if(io_pop_redo) begin
      _zz_pop_cmd_ready = 1'b1;
    end
  end

  assign io_pop_stream_valid = _zz_io_pop_stream_valid_2;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      push_currentPtr <= 7'h0;
      push_oldPtr <= 7'h0;
      push_popPtr <= 7'h0;
      pop_currentPtr <= 7'h0;
      pop_oldPtr <= 7'h0;
      pop_pushPtr <= 7'h0;
      _zz_io_pop_stream_valid_1 <= 1'b0;
    end else begin
      if(popToPush_io_output_valid) begin
        push_popPtr <= popToPush_io_output_payload;
      end
      if(io_push_stream_fire) begin
        push_currentPtr <= (push_currentPtr + 7'h01);
      end
      if(io_push_commit) begin
        push_oldPtr <= push_currentPtr;
      end
      if(pushToPop_io_output_valid) begin
        pop_pushPtr <= pushToPop_io_output_payload;
      end
      if(_zz_pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= 1'b0;
      end
      if(pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= pop_cmd_valid;
      end
      if(pop_cmd_fire) begin
        pop_currentPtr <= (pop_currentPtr + 7'h01);
      end
      if(io_pop_redo) begin
        pop_currentPtr <= pop_oldPtr;
      end
      if(io_pop_commit) begin
        pop_oldPtr <= pop_commitPtr;
      end
    end
  end

  always @(posedge axiclk) begin
    if(io_pop_stream_fire) begin
      pop_commitPtr <= pop_currentPtr;
    end
  end


endmodule

module Crc_1 (
  input               flush,
  input               input_valid,
  input      [31:0]   input_payload,
  output     [31:0]   result,
  input               axiclk,
  input               rxReset
);
  wire       [31:0]   crc32_2_crc_o;
  reg        [31:0]   crc_data;

  Crc32 crc32_2 (
    .crc_i     (crc_data       ), //i
    .data_i    (input_payload  ), //i
    .crc_o     (crc32_2_crc_o  )  //o
  );
  assign result = crc_data;
  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      crc_data <= 32'hffffffff;
    end else begin
      if(input_valid) begin
        crc_data <= crc32_2_crc_o;
      end
      if(flush) begin
        crc_data <= 32'hffffffff;
      end
    end
  end


endmodule

module Crc (
  input               flush,
  input               input_valid,
  input      [31:0]   input_payload,
  output     [31:0]   result,
  input               axiclk,
  input               txReset
);
  wire       [31:0]   crc32_2_crc_o;
  reg        [31:0]   crc_data;

  Crc32 crc32_2 (
    .crc_i     (crc_data       ), //i
    .data_i    (input_payload  ), //i
    .crc_o     (crc32_2_crc_o  )  //o
  );
  assign result = crc_data;
  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      crc_data <= 32'hffffffff;
    end else begin
      if(input_valid) begin
        crc_data <= crc32_2_crc_o;
      end
      if(flush) begin
        crc_data <= 32'hffffffff;
      end
    end
  end


endmodule

module MacTxManagedStreamFifoCc (
  input               io_push_stream_valid,
  output              io_push_stream_ready,
  input      [31:0]   io_push_stream_payload,
  input               io_push_commit,
  output     [6:0]    io_push_availability,
  output              io_pop_stream_valid,
  input               io_pop_stream_ready,
  output     [31:0]   io_pop_stream_payload,
  input               io_pop_redo,
  input               io_pop_commit,
  input               clk,
  input               reset,
  input               axictrl_tx_flush,
  input               axiclk,
  input               txReset
);
  reg        [31:0]   _zz_ram_port1;
  wire                popToPush_io_input_ready;
  wire                popToPush_io_output_valid;
  wire       [6:0]    popToPush_io_output_payload;
  wire                pushToPop_io_input_ready;
  wire                pushToPop_io_output_valid;
  wire       [6:0]    pushToPop_io_output_payload;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_io_push_availability;
  reg                 _zz_1;
  reg        [6:0]    push_currentPtr;
  reg        [6:0]    push_oldPtr;
  reg        [6:0]    push_popPtr;
  wire                io_push_stream_fire;
  reg        [6:0]    pop_currentPtr;
  reg        [6:0]    pop_oldPtr;
  reg        [6:0]    pop_pushPtr;
  wire                pop_cmd_valid;
  wire                pop_cmd_ready;
  wire       [5:0]    pop_cmd_payload;
  wire                io_pop_stream_fire;
  reg        [6:0]    pop_commitPtr;
  wire                _zz_io_pop_stream_valid;
  reg                 _zz_pop_cmd_ready;
  reg                 _zz_io_pop_stream_valid_1;
  reg                 _zz_io_pop_stream_valid_2;
  wire                pop_cmd_fire;
  reg [31:0] ram [0:63];

  assign _zz_ram_port = push_currentPtr[5:0];
  assign _zz_io_push_availability = (push_currentPtr - push_popPtr);
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_stream_payload;
    end
  end

  always @(posedge axiclk) begin
    if(pop_cmd_ready) begin
      _zz_ram_port1 <= ram[pop_cmd_payload];
    end
  end

  StreamCCByToggle popToPush (
    .io_input_valid       (1'b1                         ), //i
    .io_input_ready       (popToPush_io_input_ready     ), //o
    .io_input_payload     (pop_oldPtr                   ), //i
    .io_output_valid      (popToPush_io_output_valid    ), //o
    .io_output_ready      (1'b1                         ), //i
    .io_output_payload    (popToPush_io_output_payload  ), //o
    .axiclk               (axiclk                       ), //i
    .txReset              (txReset                      ), //i
    .clk                  (clk                          ), //i
    .reset                (reset                        ), //i
    .axictrl_tx_flush     (axictrl_tx_flush             )  //i
  );
  StreamCCByToggle_1 pushToPop (
    .io_input_valid       (1'b1                         ), //i
    .io_input_ready       (pushToPop_io_input_ready     ), //o
    .io_input_payload     (push_oldPtr                  ), //i
    .io_output_valid      (pushToPop_io_output_valid    ), //o
    .io_output_ready      (1'b1                         ), //i
    .io_output_payload    (pushToPop_io_output_payload  ), //o
    .clk                  (clk                          ), //i
    .reset                (reset                        ), //i
    .axictrl_tx_flush     (axictrl_tx_flush             ), //i
    .axiclk               (axiclk                       ), //i
    .txReset              (txReset                      )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_stream_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign io_push_stream_ready = (! ((push_currentPtr[6] != push_popPtr[6]) && (push_currentPtr[5 : 0] == push_popPtr[5 : 0])));
  assign io_push_stream_fire = (io_push_stream_valid && io_push_stream_ready);
  assign io_push_availability = (7'h40 - _zz_io_push_availability);
  assign pop_cmd_valid = ((! (pop_currentPtr == pop_pushPtr)) && (! io_pop_redo));
  assign pop_cmd_payload = pop_currentPtr[5:0];
  assign io_pop_stream_fire = (io_pop_stream_valid && io_pop_stream_ready);
  assign pop_cmd_ready = ((! _zz_io_pop_stream_valid) || _zz_pop_cmd_ready);
  assign _zz_io_pop_stream_valid = _zz_io_pop_stream_valid_1;
  always @(*) begin
    _zz_io_pop_stream_valid_2 = _zz_io_pop_stream_valid;
    if(io_pop_redo) begin
      _zz_io_pop_stream_valid_2 = 1'b0;
    end
  end

  always @(*) begin
    _zz_pop_cmd_ready = io_pop_stream_ready;
    if(io_pop_redo) begin
      _zz_pop_cmd_ready = 1'b1;
    end
  end

  assign io_pop_stream_valid = _zz_io_pop_stream_valid_2;
  assign io_pop_stream_payload = _zz_ram_port1;
  assign pop_cmd_fire = (pop_cmd_valid && pop_cmd_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      push_currentPtr <= 7'h0;
      push_oldPtr <= 7'h0;
      push_popPtr <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      push_currentPtr <= 7'h0;
      push_oldPtr <= 7'h0;
      push_popPtr <= 7'h0;
      end else begin
        if(popToPush_io_output_valid) begin
          push_popPtr <= popToPush_io_output_payload;
        end
        if(io_push_stream_fire) begin
          push_currentPtr <= (push_currentPtr + 7'h01);
        end
        if(io_push_commit) begin
          push_oldPtr <= push_currentPtr;
        end
      end
    end
  end

  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      pop_currentPtr <= 7'h0;
      pop_oldPtr <= 7'h0;
      pop_pushPtr <= 7'h0;
      _zz_io_pop_stream_valid_1 <= 1'b0;
    end else begin
      if(pushToPop_io_output_valid) begin
        pop_pushPtr <= pushToPop_io_output_payload;
      end
      if(_zz_pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= 1'b0;
      end
      if(pop_cmd_ready) begin
        _zz_io_pop_stream_valid_1 <= pop_cmd_valid;
      end
      if(pop_cmd_fire) begin
        pop_currentPtr <= (pop_currentPtr + 7'h01);
      end
      if(io_pop_redo) begin
        pop_currentPtr <= pop_oldPtr;
      end
      if(io_pop_commit) begin
        pop_oldPtr <= pop_commitPtr;
      end
    end
  end

  always @(posedge axiclk) begin
    if(io_pop_stream_fire) begin
      pop_commitPtr <= pop_currentPtr;
    end
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  output     [6:0]    io_pushOccupancy,
  output     [6:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);
  reg        [31:0]   _zz_ram_port1;
  wire       [6:0]    popToPushGray_buffercc_io_dataOut;
  wire       [6:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [6:0]    _zz_pushCC_pushPtrGray;
  wire       [5:0]    _zz_ram_port;
  wire       [6:0]    _zz_popCC_popPtrGray;
  wire       [5:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [5:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [6:0]    popToPushGray;
  wire       [6:0]    pushToPopGray;
  reg        [6:0]    pushCC_pushPtr;
  wire       [6:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [6:0]    pushCC_pushPtrGray;
  wire       [6:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  reg        [6:0]    popCC_popPtr;
  wire       [6:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [6:0]    popCC_popPtrGray;
  wire       [6:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [6:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  reg [31:0] ram [0:63];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[5:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[5:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_8 popToPushGray_buffercc (
    .io_dataIn           (popToPushGray                      ), //i
    .io_dataOut          (popToPushGray_buffercc_io_dataOut  ), //o
    .clk                 (clk                                ), //i
    .reset               (reset                              ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                   )  //i
  );
  BufferCC_8 pushToPopGray_buffercc (
    .io_dataIn           (pushToPopGray                      ), //i
    .io_dataOut          (pushToPopGray_buffercc_io_dataOut  ), //o
    .clk                 (clk                                ), //i
    .reset               (reset                              ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                   )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 7'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[6 : 5] == (~ pushCC_popPtrGray[6 : 5])) && (pushCC_pushPtrGray[4 : 0] == pushCC_popPtrGray[4 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = pushCC_popPtrGray[6];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 7'h01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = (popCC_pushPtrGray[3] ^ _zz_io_popOccupancy_3);
  assign _zz_io_popOccupancy_3 = (popCC_pushPtrGray[4] ^ _zz_io_popOccupancy_4);
  assign _zz_io_popOccupancy_4 = (popCC_pushPtrGray[5] ^ _zz_io_popOccupancy_5);
  assign _zz_io_popOccupancy_5 = popCC_pushPtrGray[6];
  assign io_popOccupancy = ({_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
      end else begin
        if(io_push_fire) begin
          pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
        end
        if(io_push_fire_1) begin
          pushCC_pushPtr <= pushCC_pushPtrPlus;
        end
        if(io_pop_fire) begin
          popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
        end
        if(io_pop_fire_2) begin
          popCC_popPtr <= popCC_popPtrPlus;
        end
      end
    end
  end


endmodule

//StreamCCByToggle_2 replaced by StreamCCByToggle_2

module StreamCCByToggle_2 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               axiclk,
  input               rxReset
);
  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC_4 outHitSignal_buffercc (
    .io_dataIn     (outHitSignal                      ), //i
    .io_dataOut    (outHitSignal_buffercc_io_dataOut  ), //o
    .axiclk        (axiclk                            ), //i
    .rxReset       (rxReset                           )  //i
  );
  BufferCC_4 pushArea_target_buffercc (
    .io_dataIn     (pushArea_target                      ), //i
    .io_dataOut    (pushArea_target_buffercc_io_dataOut  ), //o
    .axiclk        (axiclk                               ), //i
    .rxReset       (rxReset                              )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      pushArea_target <= 1'b0;
      popArea_hit <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

//Crc32 replaced by Crc32

module Crc32 (
  input      [31:0]   crc_i,
  input      [31:0]   data_i,
  output reg [31:0]   crc_o
);
  wire                _zz_crc_o;
  wire                _zz_crc_o_1;
  wire                _zz_crc_o_2;
  wire                _zz_crc_o_3;
  wire                _zz_crc_o_4;
  wire                _zz_crc_o_5;
  wire                _zz_crc_o_6;
  wire                _zz_crc_o_7;
  wire                _zz_crc_o_8;
  wire                _zz_crc_o_9;
  wire                _zz_crc_o_10;
  wire                _zz_crc_o_11;
  wire                _zz_crc_o_12;
  wire                _zz_crc_o_13;
  wire                _zz_crc_o_14;
  wire                _zz_crc_o_15;
  wire                _zz_crc_o_16;
  wire                _zz_crc_o_17;
  wire                _zz_crc_o_18;
  wire                _zz_crc_o_19;
  wire                _zz_crc_o_20;
  wire                _zz_crc_o_21;
  wire                _zz_crc_o_22;
  wire                _zz_crc_o_23;
  wire                _zz_crc_o_24;
  wire                _zz_crc_o_25;
  wire                _zz_crc_o_26;
  wire                _zz_crc_o_27;
  wire                _zz_crc_o_28;
  wire                _zz_crc_o_29;
  wire                _zz_crc_o_30;
  wire                _zz_crc_o_31;
  wire                _zz_crc_o_32;
  wire                _zz_crc_o_33;
  wire                _zz_crc_o_34;
  wire                _zz_crc_o_35;
  wire                _zz_crc_o_36;
  wire                _zz_crc_o_37;
  wire                _zz_crc_o_38;
  wire                _zz_crc_o_39;
  wire                _zz_crc_o_40;
  wire                _zz_crc_o_41;
  wire                _zz_crc_o_42;
  wire                _zz_crc_o_43;
  wire                _zz_crc_o_44;
  wire                _zz_crc_o_45;
  wire                _zz_crc_o_46;
  wire                _zz_crc_o_47;
  wire                _zz_crc_o_48;
  wire                _zz_crc_o_49;
  wire                _zz_crc_o_50;
  wire                _zz_crc_o_51;
  wire                _zz_crc_o_52;
  wire                _zz_crc_o_53;
  wire                _zz_crc_o_54;
  wire                _zz_crc_o_55;
  wire                _zz_crc_o_56;
  wire                _zz_crc_o_57;
  wire                _zz_crc_o_58;
  wire                _zz_crc_o_59;
  wire                _zz_crc_o_60;
  wire                _zz_crc_o_61;
  wire                _zz_crc_o_62;
  wire                _zz_crc_o_63;
  wire                _zz_crc_o_64;
  wire                _zz_crc_o_65;
  wire                _zz_crc_o_66;
  wire                _zz_crc_o_67;
  wire                _zz_crc_o_68;
  wire                _zz_crc_o_69;

  assign _zz_crc_o = (((((((((data_i[31] ^ data_i[30]) ^ data_i[29]) ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[16]) ^ data_i[12]) ^ data_i[10]);
  assign _zz_crc_o_1 = data_i[9];
  assign _zz_crc_o_2 = (((((((((data_i[28] ^ data_i[27]) ^ data_i[24]) ^ data_i[17]) ^ data_i[16]) ^ data_i[13]) ^ data_i[12]) ^ data_i[11]) ^ data_i[9]) ^ data_i[7]);
  assign _zz_crc_o_3 = data_i[6];
  assign _zz_crc_o_4 = (((((((((((((((data_i[31] ^ data_i[30]) ^ data_i[26]) ^ data_i[24]) ^ data_i[18]) ^ data_i[17]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[2]) ^ data_i[1]) ^ data_i[0]);
  assign _zz_crc_o_5 = crc_i[0];
  assign _zz_crc_o_6 = (((((((((((((data_i[31] ^ data_i[27]) ^ data_i[25]) ^ data_i[19]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[14]) ^ data_i[10]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[3]) ^ data_i[2]);
  assign _zz_crc_o_7 = data_i[1];
  assign _zz_crc_o_8 = ((((((((((((((((_zz_crc_o_9 ^ _zz_crc_o_10) ^ data_i[25]) ^ data_i[24]) ^ data_i[20]) ^ data_i[19]) ^ data_i[18]) ^ data_i[15]) ^ data_i[12]) ^ data_i[11]) ^ data_i[8]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]) ^ data_i[2]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_11 = crc_i[2];
  assign _zz_crc_o_9 = (data_i[31] ^ data_i[30]);
  assign _zz_crc_o_10 = data_i[29];
  assign _zz_crc_o_12 = (((((((((((((data_i[29] ^ data_i[28]) ^ data_i[24]) ^ data_i[21]) ^ data_i[20]) ^ data_i[19]) ^ data_i[13]) ^ data_i[10]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[3]) ^ data_i[1]);
  assign _zz_crc_o_13 = data_i[0];
  assign _zz_crc_o_14 = (((((((((((((data_i[30] ^ data_i[29]) ^ data_i[25]) ^ data_i[22]) ^ data_i[21]) ^ data_i[20]) ^ data_i[14]) ^ data_i[11]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[2]);
  assign _zz_crc_o_15 = data_i[1];
  assign _zz_crc_o_16 = (((((((((((((((data_i[29] ^ data_i[28]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[21]) ^ data_i[16]) ^ data_i[15]) ^ data_i[10]) ^ data_i[8]) ^ data_i[7]) ^ data_i[5]) ^ data_i[3]) ^ data_i[2]) ^ data_i[0]);
  assign _zz_crc_o_17 = crc_i[0];
  assign _zz_crc_o_18 = (((((((((data_i[31] ^ data_i[28]) ^ data_i[23]) ^ data_i[22]) ^ data_i[17]) ^ data_i[12]) ^ data_i[11]) ^ data_i[10]) ^ data_i[8]) ^ data_i[4]);
  assign _zz_crc_o_19 = data_i[3];
  assign _zz_crc_o_20 = (((((((data_i[29] ^ data_i[24]) ^ data_i[23]) ^ data_i[18]) ^ data_i[13]) ^ data_i[12]) ^ data_i[11]) ^ data_i[9]);
  assign _zz_crc_o_21 = data_i[5];
  assign _zz_crc_o_22 = (((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[26]) ^ data_i[19]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[5]);
  assign _zz_crc_o_23 = data_i[3];
  assign _zz_crc_o_24 = ((((((((((((((((_zz_crc_o_25 ^ _zz_crc_o_26) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[20]) ^ data_i[17]) ^ data_i[16]) ^ data_i[15]) ^ data_i[14]) ^ data_i[12]) ^ data_i[9]) ^ data_i[4]) ^ data_i[3]) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_27 = crc_i[1];
  assign _zz_crc_o_25 = (data_i[31] ^ data_i[28]);
  assign _zz_crc_o_26 = data_i[27];
  assign _zz_crc_o_28 = ((((((((((((((((_zz_crc_o_29 ^ _zz_crc_o_30) ^ data_i[24]) ^ data_i[21]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[13]) ^ data_i[12]) ^ data_i[9]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[2]) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_31 = crc_i[1];
  assign _zz_crc_o_29 = (data_i[31] ^ data_i[30]);
  assign _zz_crc_o_30 = data_i[27];
  assign _zz_crc_o_32 = (((((((((((((((data_i[31] ^ data_i[28]) ^ data_i[25]) ^ data_i[22]) ^ data_i[19]) ^ data_i[18]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[10]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[3]) ^ data_i[2]) ^ data_i[1]);
  assign _zz_crc_o_33 = crc_i[1];
  assign _zz_crc_o_34 = (((((((((((((data_i[29] ^ data_i[26]) ^ data_i[23]) ^ data_i[20]) ^ data_i[19]) ^ data_i[17]) ^ data_i[15]) ^ data_i[14]) ^ data_i[11]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]);
  assign _zz_crc_o_35 = data_i[2];
  assign _zz_crc_o_36 = (((((((((((((data_i[30] ^ data_i[27]) ^ data_i[24]) ^ data_i[21]) ^ data_i[20]) ^ data_i[18]) ^ data_i[16]) ^ data_i[15]) ^ data_i[12]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[5]) ^ data_i[4]);
  assign _zz_crc_o_37 = data_i[3];
  assign _zz_crc_o_38 = (((((((((((data_i[30] ^ data_i[29]) ^ data_i[26]) ^ data_i[24]) ^ data_i[22]) ^ data_i[21]) ^ data_i[19]) ^ data_i[17]) ^ data_i[13]) ^ data_i[12]) ^ data_i[8]) ^ data_i[5]);
  assign _zz_crc_o_39 = data_i[4];
  assign _zz_crc_o_40 = (((((((((((data_i[31] ^ data_i[30]) ^ data_i[27]) ^ data_i[25]) ^ data_i[23]) ^ data_i[22]) ^ data_i[20]) ^ data_i[18]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[6]);
  assign _zz_crc_o_41 = data_i[5];
  assign _zz_crc_o_42 = (((((((((data_i[31] ^ data_i[28]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[21]) ^ data_i[19]) ^ data_i[15]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_43 = data_i[7];
  assign _zz_crc_o_44 = (((((((data_i[29] ^ data_i[27]) ^ data_i[25]) ^ data_i[24]) ^ data_i[22]) ^ data_i[20]) ^ data_i[16]) ^ data_i[15]);
  assign _zz_crc_o_45 = data_i[11];
  assign _zz_crc_o_46 = (((((((data_i[30] ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[23]) ^ data_i[21]) ^ data_i[17]) ^ data_i[16]);
  assign _zz_crc_o_47 = data_i[12];
  assign _zz_crc_o_48 = (((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[22]) ^ data_i[18]) ^ data_i[17]);
  assign _zz_crc_o_49 = data_i[13];
  assign _zz_crc_o_50 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[19]) ^ data_i[18]) ^ data_i[16]) ^ data_i[14]) ^ data_i[12]) ^ data_i[11]);
  assign _zz_crc_o_51 = data_i[9];
  assign _zz_crc_o_52 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[20]) ^ data_i[19]) ^ data_i[17]) ^ data_i[16]) ^ data_i[15]) ^ data_i[13]) ^ data_i[9]) ^ data_i[6]);
  assign _zz_crc_o_53 = data_i[1];
  assign _zz_crc_o_54 = (((((((((data_i[30] ^ data_i[28]) ^ data_i[27]) ^ data_i[21]) ^ data_i[20]) ^ data_i[18]) ^ data_i[17]) ^ data_i[16]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_55 = data_i[7];
  assign _zz_crc_o_56 = (((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[22]) ^ data_i[21]) ^ data_i[19]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[11]);
  assign _zz_crc_o_57 = data_i[8];
  assign _zz_crc_o_58 = (((((((((((((data_i[31] ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[20]) ^ data_i[19]) ^ data_i[18]) ^ data_i[10]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]);
  assign _zz_crc_o_59 = data_i[0];
  assign _zz_crc_o_60 = (((((((((((data_i[29] ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[21]) ^ data_i[20]) ^ data_i[19]) ^ data_i[11]) ^ data_i[7]) ^ data_i[5]);
  assign _zz_crc_o_61 = data_i[4];
  assign _zz_crc_o_62 = (((((((((((data_i[30] ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[22]) ^ data_i[21]) ^ data_i[20]) ^ data_i[12]) ^ data_i[8]) ^ data_i[6]);
  assign _zz_crc_o_63 = data_i[5];
  assign _zz_crc_o_64 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[23]) ^ data_i[22]) ^ data_i[21]) ^ data_i[13]) ^ data_i[9]) ^ data_i[7]);
  assign _zz_crc_o_65 = data_i[6];
  assign _zz_crc_o_66 = (((((((((data_i[30] ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_67 = data_i[8];
  assign _zz_crc_o_68 = (((((((((data_i[31] ^ data_i[30]) ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[15]) ^ data_i[11]);
  assign _zz_crc_o_69 = data_i[9];
  always @(*) begin
    crc_o[0] = ((((((((((((((((_zz_crc_o ^ _zz_crc_o_1) ^ data_i[6]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[12]) ^ crc_i[16]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[1] = ((((((((((((((((_zz_crc_o_2 ^ _zz_crc_o_3) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[28]);
    crc_o[2] = ((((((((((((((((_zz_crc_o_4 ^ _zz_crc_o_5) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[3] = ((((((((((((((((_zz_crc_o_6 ^ _zz_crc_o_7) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[31]);
    crc_o[4] = ((((((((((((((((_zz_crc_o_8 ^ _zz_crc_o_11) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[15]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[5] = ((((((((((((((((_zz_crc_o_12 ^ _zz_crc_o_13) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[28]) ^ crc_i[29]);
    crc_o[6] = ((((((((((((((((_zz_crc_o_14 ^ _zz_crc_o_15) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[14]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[25]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[7] = ((((((((((((((((_zz_crc_o_16 ^ _zz_crc_o_17) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[28]) ^ crc_i[29]);
    crc_o[8] = ((((((((((((((((_zz_crc_o_18 ^ _zz_crc_o_19) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[17]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[9] = ((((((((((((((((_zz_crc_o_20 ^ _zz_crc_o_21) ^ data_i[4]) ^ data_i[2]) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[18]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[29]);
    crc_o[10] = ((((((((((((((((_zz_crc_o_22 ^ _zz_crc_o_23) ^ data_i[2]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[19]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[11] = ((((((((((((((((_zz_crc_o_24 ^ _zz_crc_o_27) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[20]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[12] = ((((((((((((((((_zz_crc_o_28 ^ _zz_crc_o_31) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[13] = ((((((((((((((((_zz_crc_o_32 ^ _zz_crc_o_33) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[22]) ^ crc_i[25]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[14] = ((((((((((((((((_zz_crc_o_34 ^ _zz_crc_o_35) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[23]) ^ crc_i[26]) ^ crc_i[29]);
    crc_o[15] = ((((((((((((((((_zz_crc_o_36 ^ _zz_crc_o_37) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[30]);
    crc_o[16] = ((((((((((((((((_zz_crc_o_38 ^ _zz_crc_o_39) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[8]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[17] = ((((((((((((((((_zz_crc_o_40 ^ _zz_crc_o_41) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[18] = ((((((((((((((((_zz_crc_o_42 ^ _zz_crc_o_43) ^ data_i[6]) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[19] = ((((((((((((((((_zz_crc_o_44 ^ _zz_crc_o_45) ^ data_i[8]) ^ data_i[7]) ^ data_i[3]) ^ crc_i[3]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[29]);
    crc_o[20] = ((((((((((((((((_zz_crc_o_46 ^ _zz_crc_o_47) ^ data_i[9]) ^ data_i[8]) ^ data_i[4]) ^ crc_i[4]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[21] = ((((((((((((((((_zz_crc_o_48 ^ _zz_crc_o_49) ^ data_i[10]) ^ data_i[9]) ^ data_i[5]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[22] = ((((((((((((((((_zz_crc_o_50 ^ _zz_crc_o_51) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[23] = ((((((((((((((((_zz_crc_o_52 ^ _zz_crc_o_53) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[24] = ((((((((((((((((_zz_crc_o_54 ^ _zz_crc_o_55) ^ data_i[2]) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[25] = ((((((((((((((((_zz_crc_o_56 ^ _zz_crc_o_57) ^ data_i[3]) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[26] = ((((((((((((((((_zz_crc_o_58 ^ _zz_crc_o_59) ^ crc_i[0]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[10]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[27] = ((((((((((((((((_zz_crc_o_60 ^ _zz_crc_o_61) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[11]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]);
    crc_o[28] = ((((((((((((((((_zz_crc_o_62 ^ _zz_crc_o_63) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[8]) ^ crc_i[12]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[29] = ((((((((((((((((_zz_crc_o_64 ^ _zz_crc_o_65) ^ data_i[3]) ^ crc_i[3]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[30] = ((((((((((((((((_zz_crc_o_66 ^ _zz_crc_o_67) ^ data_i[7]) ^ data_i[4]) ^ crc_i[4]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[31] = ((((((((((((((((_zz_crc_o_68 ^ _zz_crc_o_69) ^ data_i[8]) ^ data_i[5]) ^ crc_i[5]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
  end


endmodule

module StreamCCByToggle_1 (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               clk,
  input               reset,
  input               axictrl_tx_flush,
  input               axiclk,
  input               txReset
);
  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC_1 outHitSignal_buffercc (
    .io_dataIn           (outHitSignal                      ), //i
    .io_dataOut          (outHitSignal_buffercc_io_dataOut  ), //o
    .clk                 (clk                               ), //i
    .reset               (reset                             ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                  )  //i
  );
  BufferCC pushArea_target_buffercc (
    .io_dataIn     (pushArea_target                      ), //i
    .io_dataOut    (pushArea_target_buffercc_io_dataOut  ), //o
    .axiclk        (axiclk                               ), //i
    .txReset       (txReset                              )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
      end else begin
        if(pushArea_accept) begin
          pushArea_target <= (! pushArea_target);
        end
        if(pushArea_accept) begin
          pushArea_data <= io_input_payload;
        end
      end
    end
  end

  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      popArea_hit <= 1'b0;
    end else begin
      if(popArea_stream_fire) begin
        popArea_hit <= popArea_target;
      end
    end
  end


endmodule

module StreamCCByToggle (
  input               io_input_valid,
  output              io_input_ready,
  input      [6:0]    io_input_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [6:0]    io_output_payload,
  input               axiclk,
  input               txReset,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);
  wire                outHitSignal_buffercc_io_dataOut;
  wire                pushArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  wire                pushArea_hit;
  wire                pushArea_accept;
  reg                 pushArea_target;
  reg        [6:0]    pushArea_data;
  wire                io_input_fire;
  wire                popArea_stream_valid;
  wire                popArea_stream_ready;
  wire       [6:0]    popArea_stream_payload;
  wire                popArea_target;
  wire                popArea_stream_fire;
  reg                 popArea_hit;

  BufferCC outHitSignal_buffercc (
    .io_dataIn     (outHitSignal                      ), //i
    .io_dataOut    (outHitSignal_buffercc_io_dataOut  ), //o
    .axiclk        (axiclk                            ), //i
    .txReset       (txReset                           )  //i
  );
  BufferCC_1 pushArea_target_buffercc (
    .io_dataIn           (pushArea_target                      ), //i
    .io_dataOut          (pushArea_target_buffercc_io_dataOut  ), //o
    .clk                 (clk                                  ), //i
    .reset               (reset                                ), //i
    .axictrl_tx_flush    (axictrl_tx_flush                     )  //i
  );
  assign pushArea_hit = outHitSignal_buffercc_io_dataOut;
  assign io_input_fire = (io_input_valid && io_input_ready);
  assign pushArea_accept = io_input_fire;
  assign io_input_ready = (pushArea_hit == pushArea_target);
  assign popArea_target = pushArea_target_buffercc_io_dataOut;
  assign popArea_stream_fire = (popArea_stream_valid && popArea_stream_ready);
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign io_output_valid = popArea_stream_valid;
  assign popArea_stream_ready = io_output_ready;
  assign io_output_payload = popArea_stream_payload;
  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      pushArea_target <= 1'b0;
      pushArea_data <= 7'h0;
    end else begin
      if(pushArea_accept) begin
        pushArea_target <= (! pushArea_target);
      end
      if(pushArea_accept) begin
        pushArea_data <= io_input_payload;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      popArea_hit <= 1'b0;
    end else begin
      if(axictrl_tx_flush) begin
      popArea_hit <= 1'b0;
      end else begin
        if(popArea_stream_fire) begin
          popArea_hit <= popArea_target;
        end
      end
    end
  end


endmodule

//BufferCC_8 replaced by BufferCC_8

module BufferCC_8 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);
  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      if(axictrl_tx_flush) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule

//BufferCC_4 replaced by BufferCC_4

//BufferCC_4 replaced by BufferCC_4

//BufferCC_4 replaced by BufferCC_4

module BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               axiclk,
  input               rxReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiclk or posedge rxReset) begin
    if(rxReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC_1 replaced by BufferCC_1

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset,
  input               axictrl_tx_flush
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      if(axictrl_tx_flush) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               axiclk,
  input               txReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiclk or posedge txReset) begin
    if(txReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
