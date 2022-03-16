// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Apb3Srio


`define srio_ftype__type [3:0]
`define srio_ftype__NREAD 4'b0010
`define srio_ftype__NWRITE 4'b0101
`define srio_ftype__SWRITE 4'b0110
`define srio_ftype__DOORB 4'b1010
`define srio_ftype__MESSG 4'b1011
`define srio_ftype__RESP 4'b1101
`define srio_ftype__FTYPE9 4'b1001

`define srio_ttype__type [3:0]
`define srio_ttype__TNWR 4'b0100
`define srio_ttype__TNWR_R 4'b0101
`define srio_ttype__TNDATA 4'b0000
`define srio_ttype__TWDATA 4'b1000


module Apb3Srio (
  input      [7:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output reg [31:0]   apb_PRDATA,
  input               bus_reset,
  input               bus_clk,
  input               srio_clk,
  input               srio_reset
);
  wire       [31:0]   busctrl_srio_ctrl_request_ireq_datastream_payload;
  reg                 busctrl_srio_ctrl_request_iresp_datastream_ready;
  wire                busctrl_srio_ctrl_request_ireq_datastream_ready;
  wire                busctrl_srio_ctrl_request_iresp_datastream_valid;
  wire       [31:0]   busctrl_srio_ctrl_request_iresp_datastream_payload;
  wire                busctrl_srio_ireq_stream_valid;
  wire                busctrl_srio_ireq_stream_payload_last;
  wire       [63:0]   busctrl_srio_ireq_stream_payload_fragment;
  wire       [31:0]   busctrl_srio_ireq_tuser;
  wire                busctrl_srio_iresp_stream_ready;
  wire                busctrl_srio_treq_stream_ready;
  wire                busctrl_srio_tresp_stream_valid;
  wire                busctrl_srio_tresp_stream_payload_last;
  wire       [63:0]   busctrl_srio_tresp_stream_payload_fragment;
  wire                busctrl_busCtrl_askWrite;
  wire                busctrl_busCtrl_askRead;
  wire                busctrl_busCtrl_doWrite;
  wire                busctrl_busCtrl_doRead;
  reg                 _zz_ctrl_request_ireq_datastream_valid;
  reg                 busctrl_srio_ctrl_request_ireq_flush_driver;
  reg        [31:0]   busctrl_srio_ctrl_request_ireq_cmd_driver;
  reg        [31:0]   busctrl_srio_ctrl_request_ireq_startaddr_driver;
  reg        [15:0]   busctrl_srio_ctrl_request_ireq_src_id_driver;
  reg        [15:0]   busctrl_srio_ctrl_request_ireq_dest_id_driver;
  reg                 _zz_ctrl_request_ireq_start;

  Srio busctrl_srio (
    .ctrl_request_ireq_cmd                    (busctrl_srio_ctrl_request_ireq_cmd_driver           ), //i
    .ctrl_request_ireq_startaddr              (busctrl_srio_ctrl_request_ireq_startaddr_driver     ), //i
    .ctrl_request_ireq_datastream_valid       (_zz_ctrl_request_ireq_datastream_valid              ), //i
    .ctrl_request_ireq_datastream_ready       (busctrl_srio_ctrl_request_ireq_datastream_ready     ), //o
    .ctrl_request_ireq_datastream_payload     (busctrl_srio_ctrl_request_ireq_datastream_payload   ), //i
    .ctrl_request_ireq_start                  (_zz_ctrl_request_ireq_start                         ), //i
    .ctrl_request_ireq_flush                  (busctrl_srio_ctrl_request_ireq_flush_driver         ), //i
    .ctrl_request_ireq_src_id                 (busctrl_srio_ctrl_request_ireq_src_id_driver        ), //i
    .ctrl_request_ireq_dest_id                (busctrl_srio_ctrl_request_ireq_dest_id_driver       ), //i
    .ctrl_request_iresp_datastream_valid      (busctrl_srio_ctrl_request_iresp_datastream_valid    ), //o
    .ctrl_request_iresp_datastream_ready      (busctrl_srio_ctrl_request_iresp_datastream_ready    ), //i
    .ctrl_request_iresp_datastream_payload    (busctrl_srio_ctrl_request_iresp_datastream_payload  ), //o
    .ireq_stream_valid                        (busctrl_srio_ireq_stream_valid                      ), //o
    .ireq_stream_ready                        (busctrl_srio_treq_stream_ready                      ), //i
    .ireq_stream_payload_last                 (busctrl_srio_ireq_stream_payload_last               ), //o
    .ireq_stream_payload_fragment             (busctrl_srio_ireq_stream_payload_fragment           ), //o
    .ireq_tuser                               (busctrl_srio_ireq_tuser                             ), //o
    .iresp_stream_valid                       (busctrl_srio_tresp_stream_valid                     ), //i
    .iresp_stream_ready                       (busctrl_srio_iresp_stream_ready                     ), //o
    .iresp_stream_payload_last                (busctrl_srio_tresp_stream_payload_last              ), //i
    .iresp_stream_payload_fragment            (busctrl_srio_tresp_stream_payload_fragment          ), //i
    .treq_stream_valid                        (busctrl_srio_ireq_stream_valid                      ), //i
    .treq_stream_ready                        (busctrl_srio_treq_stream_ready                      ), //o
    .treq_stream_payload_last                 (busctrl_srio_ireq_stream_payload_last               ), //i
    .treq_stream_payload_fragment             (busctrl_srio_ireq_stream_payload_fragment           ), //i
    .treq_tuser                               (busctrl_srio_ireq_tuser                             ), //i
    .tresp_stream_valid                       (busctrl_srio_tresp_stream_valid                     ), //o
    .tresp_stream_ready                       (busctrl_srio_iresp_stream_ready                     ), //i
    .tresp_stream_payload_last                (busctrl_srio_tresp_stream_payload_last              ), //o
    .tresp_stream_payload_fragment            (busctrl_srio_tresp_stream_payload_fragment          ), //o
    .bus_reset                                (bus_reset                                           ), //i
    .bus_clk                                  (bus_clk                                             ), //i
    .srio_clk                                 (srio_clk                                            ), //i
    .srio_reset                               (srio_reset                                          )  //i
  );
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 32'h0;
    case(apb_PADDR)
      8'h04 : begin
        apb_PRDATA[0 : 0] = busctrl_srio_ctrl_request_ireq_flush_driver;
        apb_PRDATA[2 : 2] = busctrl_srio_ctrl_request_ireq_datastream_ready;
      end
      8'h08 : begin
        apb_PRDATA[31 : 0] = busctrl_srio_ctrl_request_ireq_cmd_driver;
      end
      8'h0c : begin
        apb_PRDATA[31 : 0] = busctrl_srio_ctrl_request_ireq_startaddr_driver;
      end
      8'h10 : begin
        apb_PRDATA[15 : 0] = busctrl_srio_ctrl_request_ireq_src_id_driver;
        apb_PRDATA[31 : 16] = busctrl_srio_ctrl_request_ireq_dest_id_driver;
      end
      8'h20 : begin
        apb_PRDATA[31 : 0] = busctrl_srio_ctrl_request_iresp_datastream_payload;
      end
      default : begin
      end
    endcase
  end

  assign busctrl_busCtrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busctrl_busCtrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busctrl_busCtrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busctrl_busCtrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(*) begin
    _zz_ctrl_request_ireq_datastream_valid = 1'b0;
    case(apb_PADDR)
      8'h0 : begin
        if(busctrl_busCtrl_doWrite) begin
          _zz_ctrl_request_ireq_datastream_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign busctrl_srio_ctrl_request_ireq_datastream_payload = apb_PWDATA[31 : 0];
  always @(*) begin
    _zz_ctrl_request_ireq_start = 1'b0;
    case(apb_PADDR)
      8'h14 : begin
        if(busctrl_busCtrl_doWrite) begin
          _zz_ctrl_request_ireq_start = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    busctrl_srio_ctrl_request_iresp_datastream_ready = 1'b0;
    case(apb_PADDR)
      8'h20 : begin
        if(busctrl_busCtrl_doRead) begin
          busctrl_srio_ctrl_request_iresp_datastream_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(posedge bus_clk or posedge bus_reset) begin
    if(bus_reset) begin
      busctrl_srio_ctrl_request_ireq_flush_driver <= 1'b1;
    end else begin
      case(apb_PADDR)
        8'h04 : begin
          if(busctrl_busCtrl_doWrite) begin
            busctrl_srio_ctrl_request_ireq_flush_driver <= apb_PWDATA[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge bus_clk) begin
    case(apb_PADDR)
      8'h08 : begin
        if(busctrl_busCtrl_doWrite) begin
          busctrl_srio_ctrl_request_ireq_cmd_driver <= apb_PWDATA[31 : 0];
        end
      end
      8'h0c : begin
        if(busctrl_busCtrl_doWrite) begin
          busctrl_srio_ctrl_request_ireq_startaddr_driver <= apb_PWDATA[31 : 0];
        end
      end
      8'h10 : begin
        if(busctrl_busCtrl_doWrite) begin
          busctrl_srio_ctrl_request_ireq_src_id_driver <= apb_PWDATA[15 : 0];
          busctrl_srio_ctrl_request_ireq_dest_id_driver <= apb_PWDATA[31 : 16];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Srio (
  input      [31:0]   ctrl_request_ireq_cmd,
  input      [31:0]   ctrl_request_ireq_startaddr,
  input               ctrl_request_ireq_datastream_valid,
  output              ctrl_request_ireq_datastream_ready,
  input      [31:0]   ctrl_request_ireq_datastream_payload,
  input               ctrl_request_ireq_start,
  input               ctrl_request_ireq_flush,
  input      [15:0]   ctrl_request_ireq_src_id,
  input      [15:0]   ctrl_request_ireq_dest_id,
  output              ctrl_request_iresp_datastream_valid,
  input               ctrl_request_iresp_datastream_ready,
  output     [31:0]   ctrl_request_iresp_datastream_payload,
  output              ireq_stream_valid,
  input               ireq_stream_ready,
  output              ireq_stream_payload_last,
  output     [63:0]   ireq_stream_payload_fragment,
  output     [31:0]   ireq_tuser,
  input               iresp_stream_valid,
  output              iresp_stream_ready,
  input               iresp_stream_payload_last,
  input      [63:0]   iresp_stream_payload_fragment,
  input               treq_stream_valid,
  output              treq_stream_ready,
  input               treq_stream_payload_last,
  input      [63:0]   treq_stream_payload_fragment,
  input      [31:0]   treq_tuser,
  output              tresp_stream_valid,
  input               tresp_stream_ready,
  output              tresp_stream_payload_last,
  output     [63:0]   tresp_stream_payload_fragment,
  input               bus_reset,
  input               bus_clk,
  input               srio_clk,
  input               srio_reset
);
  wire                txFront_srio_txbuffer_io_push_valid;
  wire       [63:0]   txFront_srio_txbuffer_io_push_payload;
  wire                rxFront_srio_iresprxbuffer_io_pop_ready;
  wire                bufferCC_5_io_dataOut;
  wire                txFront_srio_txbuffer_io_push_ready;
  wire                txFront_srio_txbuffer_io_pop_valid;
  wire       [63:0]   txFront_srio_txbuffer_io_pop_payload;
  wire       [7:0]    txFront_srio_txbuffer_io_pushOccupancy;
  wire       [7:0]    txFront_srio_txbuffer_io_popOccupancy;
  wire                txBack_srio_request_ireq_valid;
  wire                txBack_srio_request_ireq_payload_last;
  wire       [63:0]   txBack_srio_request_ireq_payload_fragment;
  wire                txBack_srio_request_iresp_ready;
  wire                txBack_srio_request_user_data_ready;
  wire                txBack_srio_request_iresp_stream_valid;
  wire       [63:0]   txBack_srio_request_iresp_stream_payload;
  wire                rxFront_srio_iresprxbuffer_io_push_ready;
  wire                rxFront_srio_iresprxbuffer_io_pop_valid;
  wire       [63:0]   rxFront_srio_iresprxbuffer_io_pop_payload;
  wire       [7:0]    rxFront_srio_iresprxbuffer_io_pushOccupancy;
  wire       [7:0]    rxFront_srio_iresprxbuffer_io_popOccupancy;
  wire                resp_srio_response_tresp_valid;
  wire                resp_srio_response_tresp_payload_last;
  wire       [63:0]   resp_srio_response_tresp_payload_fragment;
  wire                resp_srio_response_treq_ready;
  reg        [31:0]   _zz_ctrl_request_iresp_datastream_payload_4;
  wire                _zz_1;
  wire                busReset;
  wire                ctrl_request_ireq_datastream_fire;
  reg                 _zz_ctrl_request_ireq_datastream_ready;
  reg        [0:0]    _zz_ctrl_request_ireq_datastream_ready_1;
  reg        [0:0]    _zz_ctrl_request_ireq_datastream_ready_2;
  wire                _zz_ctrl_request_ireq_datastream_ready_3;
  reg        [31:0]   _zz_io_push_payload;
  wire                ctrl_request_ireq_datastream_fire_1;
  wire       [7:0]    _zz_user_tid;
  wire       [3:0]    _zz_user_ftype;
  wire       [3:0]    _zz_user_ttype;
  wire       [7:0]    _zz_user_size;
  wire       [1:0]    _zz_user_prio;
  wire       [33:0]   _zz_user_addr;
  wire                ctrl_request_iresp_datastream_fire;
  reg                 _zz_ctrl_request_iresp_datastream_payload;
  reg        [0:0]    _zz_ctrl_request_iresp_datastream_payload_1;
  reg        [0:0]    _zz_ctrl_request_iresp_datastream_payload_2;
  wire                _zz_io_pop_ready;
  wire       [63:0]   _zz_ctrl_request_iresp_datastream_payload_3;

  BufferCC_4 bufferCC_5 (
    .io_dataIn     (1'b0                   ), //i
    .io_dataOut    (bufferCC_5_io_dataOut  ), //o
    .bus_clk       (bus_clk                ), //i
    ._zz_1         (_zz_1                  )  //i
  );
  StreamFifoCC txFront_srio_txbuffer (
    .io_push_valid       (txFront_srio_txbuffer_io_push_valid     ), //i
    .io_push_ready       (txFront_srio_txbuffer_io_push_ready     ), //o
    .io_push_payload     (txFront_srio_txbuffer_io_push_payload   ), //i
    .io_pop_valid        (txFront_srio_txbuffer_io_pop_valid      ), //o
    .io_pop_ready        (txBack_srio_request_user_data_ready     ), //i
    .io_pop_payload      (txFront_srio_txbuffer_io_pop_payload    ), //o
    .io_pushOccupancy    (txFront_srio_txbuffer_io_pushOccupancy  ), //o
    .io_popOccupancy     (txFront_srio_txbuffer_io_popOccupancy   ), //o
    .bus_clk             (bus_clk                                 ), //i
    .bus_reset           (bus_reset                               ), //i
    .srio_clk            (srio_clk                                ), //i
    .srio_reset          (srio_reset                              )  //i
  );
  SrioRequest txBack_srio_request (
    .ireq_valid                (txBack_srio_request_ireq_valid             ), //o
    .ireq_ready                (ireq_stream_ready                          ), //i
    .ireq_payload_last         (txBack_srio_request_ireq_payload_last      ), //o
    .ireq_payload_fragment     (txBack_srio_request_ireq_payload_fragment  ), //o
    .iresp_valid               (iresp_stream_valid                         ), //i
    .iresp_ready               (txBack_srio_request_iresp_ready            ), //o
    .iresp_payload_last        (iresp_stream_payload_last                  ), //i
    .iresp_payload_fragment    (iresp_stream_payload_fragment              ), //i
    .user_addr                 (_zz_user_addr                              ), //i
    .user_ftype                (_zz_user_ftype                             ), //i
    .user_ttype                (_zz_user_ttype                             ), //i
    .user_size                 (_zz_user_size                              ), //i
    .user_prio                 (_zz_user_prio                              ), //i
    .user_tid                  (_zz_user_tid                               ), //i
    .user_data_valid           (txFront_srio_txbuffer_io_pop_valid         ), //i
    .user_data_ready           (txBack_srio_request_user_data_ready        ), //o
    .user_data_payload         (txFront_srio_txbuffer_io_pop_payload       ), //i
    .send_start                (ctrl_request_ireq_start                    ), //i
    .iresp_stream_valid        (txBack_srio_request_iresp_stream_valid     ), //o
    .iresp_stream_ready        (rxFront_srio_iresprxbuffer_io_push_ready   ), //i
    .iresp_stream_payload      (txBack_srio_request_iresp_stream_payload   ), //o
    .srio_clk                  (srio_clk                                   ), //i
    .busReset                  (busReset                                   )  //i
  );
  StreamFifoCC_1 rxFront_srio_iresprxbuffer (
    .io_push_valid       (txBack_srio_request_iresp_stream_valid       ), //i
    .io_push_ready       (rxFront_srio_iresprxbuffer_io_push_ready     ), //o
    .io_push_payload     (txBack_srio_request_iresp_stream_payload     ), //i
    .io_pop_valid        (rxFront_srio_iresprxbuffer_io_pop_valid      ), //o
    .io_pop_ready        (rxFront_srio_iresprxbuffer_io_pop_ready      ), //i
    .io_pop_payload      (rxFront_srio_iresprxbuffer_io_pop_payload    ), //o
    .io_pushOccupancy    (rxFront_srio_iresprxbuffer_io_pushOccupancy  ), //o
    .io_popOccupancy     (rxFront_srio_iresprxbuffer_io_popOccupancy   ), //o
    .srio_clk            (srio_clk                                     ), //i
    .srio_reset          (srio_reset                                   ), //i
    .bus_clk             (bus_clk                                      ), //i
    .bus_reset           (bus_reset                                    )  //i
  );
  SrioResponse resp_srio_response (
    .tresp_valid               (resp_srio_response_tresp_valid             ), //o
    .tresp_ready               (tresp_stream_ready                         ), //i
    .tresp_payload_last        (resp_srio_response_tresp_payload_last      ), //o
    .tresp_payload_fragment    (resp_srio_response_tresp_payload_fragment  ), //o
    .treq_valid                (treq_stream_valid                          ), //i
    .treq_ready                (resp_srio_response_treq_ready              ), //o
    .treq_payload_last         (treq_stream_payload_last                   ), //i
    .treq_payload_fragment     (treq_stream_payload_fragment               ), //i
    .treq_tuser                (treq_tuser                                 ), //i
    .srio_clk                  (srio_clk                                   ), //i
    .busReset                  (busReset                                   )  //i
  );
  always @(*) begin
    case(_zz_ctrl_request_iresp_datastream_payload_2)
      1'b0 : begin
        _zz_ctrl_request_iresp_datastream_payload_4 = _zz_ctrl_request_iresp_datastream_payload_3[31 : 0];
      end
      default : begin
        _zz_ctrl_request_iresp_datastream_payload_4 = _zz_ctrl_request_iresp_datastream_payload_3[63 : 32];
      end
    endcase
  end

  assign _zz_1 = (bus_reset || ctrl_request_ireq_flush);
  assign busReset = bufferCC_5_io_dataOut;
  assign ctrl_request_ireq_datastream_fire = (ctrl_request_ireq_datastream_valid && ctrl_request_ireq_datastream_ready);
  always @(*) begin
    _zz_ctrl_request_ireq_datastream_ready = 1'b0;
    if(ctrl_request_ireq_datastream_fire) begin
      _zz_ctrl_request_ireq_datastream_ready = 1'b1;
    end
  end

  assign _zz_ctrl_request_ireq_datastream_ready_3 = (_zz_ctrl_request_ireq_datastream_ready_2 == 1'b1);
  always @(*) begin
    _zz_ctrl_request_ireq_datastream_ready_1 = (_zz_ctrl_request_ireq_datastream_ready_2 + _zz_ctrl_request_ireq_datastream_ready);
    if(1'b0) begin
      _zz_ctrl_request_ireq_datastream_ready_1 = 1'b0;
    end
  end

  assign ctrl_request_ireq_datastream_fire_1 = (ctrl_request_ireq_datastream_valid && ctrl_request_ireq_datastream_ready);
  assign txFront_srio_txbuffer_io_push_valid = (ctrl_request_ireq_datastream_valid && _zz_ctrl_request_ireq_datastream_ready_3);
  assign txFront_srio_txbuffer_io_push_payload = {ctrl_request_ireq_datastream_payload,_zz_io_push_payload};
  assign ctrl_request_ireq_datastream_ready = (! ((! txFront_srio_txbuffer_io_push_ready) && _zz_ctrl_request_ireq_datastream_ready_3));
  assign _zz_user_tid = ctrl_request_ireq_cmd[31 : 24];
  assign _zz_user_ftype = ctrl_request_ireq_cmd[23 : 20];
  assign _zz_user_ttype = ctrl_request_ireq_cmd[19 : 16];
  assign _zz_user_size = ctrl_request_ireq_cmd[15 : 8];
  assign _zz_user_prio = ctrl_request_ireq_cmd[1 : 0];
  assign _zz_user_addr = {2'd0, ctrl_request_ireq_startaddr};
  assign ireq_stream_valid = txBack_srio_request_ireq_valid;
  assign ireq_stream_payload_last = txBack_srio_request_ireq_payload_last;
  assign ireq_stream_payload_fragment = txBack_srio_request_ireq_payload_fragment;
  assign ireq_tuser = {ctrl_request_ireq_src_id,ctrl_request_ireq_dest_id};
  assign iresp_stream_ready = txBack_srio_request_iresp_ready;
  assign ctrl_request_iresp_datastream_fire = (ctrl_request_iresp_datastream_valid && ctrl_request_iresp_datastream_ready);
  always @(*) begin
    _zz_ctrl_request_iresp_datastream_payload = 1'b0;
    if(ctrl_request_iresp_datastream_fire) begin
      _zz_ctrl_request_iresp_datastream_payload = 1'b1;
    end
  end

  assign _zz_io_pop_ready = (_zz_ctrl_request_iresp_datastream_payload_2 == 1'b1);
  always @(*) begin
    _zz_ctrl_request_iresp_datastream_payload_1 = (_zz_ctrl_request_iresp_datastream_payload_2 + _zz_ctrl_request_iresp_datastream_payload);
    if(1'b0) begin
      _zz_ctrl_request_iresp_datastream_payload_1 = 1'b0;
    end
  end

  assign ctrl_request_iresp_datastream_valid = rxFront_srio_iresprxbuffer_io_pop_valid;
  assign _zz_ctrl_request_iresp_datastream_payload_3 = rxFront_srio_iresprxbuffer_io_pop_payload;
  assign ctrl_request_iresp_datastream_payload = _zz_ctrl_request_iresp_datastream_payload_4;
  assign rxFront_srio_iresprxbuffer_io_pop_ready = (ctrl_request_iresp_datastream_ready && _zz_io_pop_ready);
  assign tresp_stream_valid = resp_srio_response_tresp_valid;
  assign tresp_stream_payload_last = resp_srio_response_tresp_payload_last;
  assign tresp_stream_payload_fragment = resp_srio_response_tresp_payload_fragment;
  assign treq_stream_ready = resp_srio_response_treq_ready;
  always @(posedge bus_clk or posedge busReset) begin
    if(busReset) begin
      _zz_ctrl_request_ireq_datastream_ready_2 <= 1'b0;
      _zz_ctrl_request_iresp_datastream_payload_2 <= 1'b0;
    end else begin
      _zz_ctrl_request_ireq_datastream_ready_2 <= _zz_ctrl_request_ireq_datastream_ready_1;
      _zz_ctrl_request_iresp_datastream_payload_2 <= _zz_ctrl_request_iresp_datastream_payload_1;
    end
  end

  always @(posedge bus_clk) begin
    if(ctrl_request_ireq_datastream_fire_1) begin
      _zz_io_push_payload <= ctrl_request_ireq_datastream_payload;
    end
  end


endmodule

module SrioResponse (
  output              tresp_valid,
  input               tresp_ready,
  output              tresp_payload_last,
  output     [63:0]   tresp_payload_fragment,
  input               treq_valid,
  output              treq_ready,
  input               treq_payload_last,
  input      [63:0]   treq_payload_fragment,
  input      [31:0]   treq_tuser,
  input               srio_clk,
  input               busReset
);
  wire       [63:0]   _zz_rspmem_port1;
  wire       [7:0]    _zz_data_store_waddr;
  wire       [4:0]    _zz_number_of_data_beats;
  wire       [7:0]    _zz_data_store_raddr;
  wire       [7:0]    _zz_rspmem_port;
  wire       [7:0]    current_tid;
  wire       [3:0]    current_ftype;
  wire       [3:0]    current_ttype;
  wire       [7:0]    current_size;
  wire       [1:0]    current_prio;
  wire       [33:0]   current_addr;
  wire       [15:0]   current_srcid;
  wire       [45:0]   response_data_in_d;
  reg        [45:0]   response_data_in;
  reg                 first_beat;
  wire                treq_fire;
  wire                when_SrioResponse_l54;
  wire                treq_fire_1;
  reg                 generate_a_response;
  wire                treq_fire_2;
  wire                when_SrioResponse_l63;
  reg                 capture_data;
  wire                treq_fire_3;
  wire                when_SrioResponse_l73;
  wire                treq_fire_4;
  wire                when_SrioResponse_l75;
  wire                treq_fire_5;
  wire                data_store_wen;
  reg        [7:0]    data_store_waddr;
  wire                treq_fire_6;
  wire                when_SrioResponse_l84;
  wire                treq_fire_7;
  reg        [45:0]   response_data_out_d;
  reg        [45:0]   response_data_out;
  wire       [7:0]    response_tid;
  wire       [3:0]    response_ftype;
  wire       [7:0]    response_size;
  wire       [1:0]    response_prio;
  wire       [7:0]    starting_read_addr;
  wire       [15:0]   dest_id;
  wire                pull_from_store;
  wire       `srio_ttype__type responding_ttype;
  reg        [5:0]    current_beat_cnt;
  reg        [5:0]    number_of_data_beats;
  wire                when_SrioResponse_l109;
  wire                tresp_fire;
  wire                when_SrioResponse_l115;
  wire                tresp_fire_1;
  reg                 tresp_tlast;
  wire                when_SrioResponse_l124;
  wire                tresp_fire_2;
  wire                tresp_fire_3;
  wire                when_SrioResponse_l126;
  wire                when_SrioResponse_l128;
  reg        [7:0]    data_store_raddr;
  wire                tresp_fire_4;
  wire                when_SrioResponse_l136;
  wire                tresp_fire_5;
  wire                when_SrioResponse_l138;
  reg                 generate_rsp;
  reg                 generate_rsp_d;
  reg                 pull_from_store_d;
  wire                when_SrioResponse_l147;
  reg                 tresp_tvalid;
  wire                when_SrioResponse_l156;
  wire                tresp_fire_6;
  wire                when_SrioResponse_l158;
  wire       [63:0]   header_beat;
  reg        [63:0]   tresp_tdata;
  reg        [63:0]   data_store_dout;
  wire                tresp_fire_7;
  wire                when_SrioResponse_l173;
  wire       [7:0]    _zz_tresp_tdata;
  wire                tresp_fire_8;
  wire                when_SrioResponse_l175;
  `ifndef SYNTHESIS
  reg [47:0] responding_ttype_string;
  `endif

  (* ram_style = "block" , ram_style = "distributed" *) reg [63:0] rspmem [0:255];

  assign _zz_data_store_waddr = (data_store_waddr + 8'h01);
  assign _zz_number_of_data_beats = response_size[7 : 3];
  assign _zz_data_store_raddr = (data_store_raddr + 8'h01);
  assign _zz_rspmem_port = data_store_waddr;
  always @(posedge srio_clk) begin
    if(data_store_wen) begin
      rspmem[_zz_rspmem_port] <= treq_payload_fragment;
    end
  end

  assign _zz_rspmem_port1 = rspmem[_zz_tresp_tdata];
  `ifndef SYNTHESIS
  always @(*) begin
    case(responding_ttype)
      `srio_ttype__TNWR : responding_ttype_string = "TNWR  ";
      `srio_ttype__TNWR_R : responding_ttype_string = "TNWR_R";
      `srio_ttype__TNDATA : responding_ttype_string = "TNDATA";
      `srio_ttype__TWDATA : responding_ttype_string = "TWDATA";
      default : responding_ttype_string = "??????";
    endcase
  end
  `endif

  assign current_tid = treq_payload_fragment[63 : 56];
  assign current_ftype = treq_payload_fragment[55 : 52];
  assign current_ttype = treq_payload_fragment[51 : 48];
  assign current_size = treq_payload_fragment[43 : 36];
  assign current_prio = (treq_payload_fragment[46 : 45] + 2'b01);
  assign current_addr = treq_payload_fragment[33 : 0];
  assign current_srcid = treq_tuser[31 : 16];
  assign response_data_in_d = {{{{{current_srcid,current_addr[7 : 0]},current_prio},current_tid},current_ftype},current_size};
  assign treq_fire = (treq_valid && treq_ready);
  assign when_SrioResponse_l54 = (treq_fire && treq_payload_last);
  assign treq_fire_1 = (treq_valid && treq_ready);
  assign treq_fire_2 = (treq_valid && treq_ready);
  assign when_SrioResponse_l63 = (first_beat && treq_fire_2);
  assign treq_fire_3 = (treq_valid && treq_ready);
  assign when_SrioResponse_l73 = (first_beat && treq_fire_3);
  assign treq_fire_4 = (treq_valid && treq_ready);
  assign when_SrioResponse_l75 = (treq_fire_4 && treq_payload_last);
  assign treq_fire_5 = (treq_valid && treq_ready);
  assign data_store_wen = (capture_data && treq_fire_5);
  assign treq_fire_6 = (treq_valid && treq_ready);
  assign when_SrioResponse_l84 = (first_beat && treq_fire_6);
  assign treq_fire_7 = (treq_valid && treq_ready);
  assign treq_ready = 1'b1;
  assign response_tid = response_data_out[19 : 12];
  assign response_ftype = response_data_out[11 : 8];
  assign response_size = response_data_out[7 : 0];
  assign response_prio = response_data_out[21 : 20];
  assign starting_read_addr = response_data_out[29 : 22];
  assign dest_id = response_data_out[45 : 30];
  assign pull_from_store = ((response_ftype == `srio_ftype__NREAD) ? 1'b1 : 1'b0);
  assign responding_ttype = ((response_ftype == `srio_ftype__NREAD) ? `srio_ttype__TWDATA : `srio_ttype__TNDATA);
  assign when_SrioResponse_l109 = (current_beat_cnt == 6'h0);
  assign tresp_fire = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l115 = (tresp_fire && tresp_payload_last);
  assign tresp_fire_1 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l124 = (responding_ttype == `srio_ttype__TNDATA);
  assign tresp_fire_2 = (tresp_valid && tresp_ready);
  assign tresp_fire_3 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l126 = ((current_beat_cnt == number_of_data_beats) && tresp_fire_3);
  assign when_SrioResponse_l128 = (tresp_ready || (! tresp_valid));
  assign tresp_payload_last = tresp_tlast;
  assign tresp_fire_4 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l136 = ((pull_from_store && (current_beat_cnt == 6'h0)) && (! tresp_fire_4));
  assign tresp_fire_5 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l138 = (pull_from_store && tresp_fire_5);
  assign when_SrioResponse_l147 = (generate_rsp_d && (current_beat_cnt == 6'h0));
  assign when_SrioResponse_l156 = (pull_from_store_d && (current_beat_cnt == 6'h0));
  assign tresp_fire_6 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l158 = (tresp_fire_6 && tresp_payload_last);
  assign tresp_valid = tresp_tvalid;
  assign header_beat = {{{{{response_tid,`srio_ftype__RESP},responding_ttype},1'b0},response_prio},45'h0};
  assign tresp_fire_7 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l173 = ((current_beat_cnt == 6'h0) && (! tresp_fire_7));
  assign _zz_tresp_tdata = data_store_raddr;
  assign tresp_fire_8 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l175 = (pull_from_store && tresp_fire_8);
  assign tresp_payload_fragment = tresp_tdata;
  always @(posedge srio_clk) begin
    response_data_in <= response_data_in_d;
    if(when_SrioResponse_l109) begin
      number_of_data_beats <= {1'd0, _zz_number_of_data_beats};
    end else begin
      number_of_data_beats <= number_of_data_beats;
    end
    if(when_SrioResponse_l173) begin
      tresp_tdata <= header_beat;
    end else begin
      if(when_SrioResponse_l175) begin
        tresp_tdata <= _zz_rspmem_port1;
      end else begin
        tresp_tdata <= tresp_tdata;
      end
    end
  end

  always @(posedge srio_clk or posedge busReset) begin
    if(busReset) begin
      first_beat <= 1'b1;
      generate_a_response <= 1'b0;
      capture_data <= 1'b0;
      data_store_waddr <= 8'h0;
      response_data_out_d <= 46'h0;
      response_data_out <= 46'h0;
      current_beat_cnt <= 6'h0;
      tresp_tlast <= 1'b0;
      data_store_raddr <= 8'h0;
      generate_rsp <= 1'b0;
      generate_rsp_d <= 1'b0;
      pull_from_store_d <= 1'b0;
      tresp_tvalid <= 1'b0;
    end else begin
      if(when_SrioResponse_l54) begin
        first_beat <= 1'b1;
      end else begin
        if(treq_fire_1) begin
          first_beat <= 1'b0;
        end else begin
          first_beat <= first_beat;
        end
      end
      if(when_SrioResponse_l63) begin
        generate_a_response <= ((((current_ftype == `srio_ftype__NREAD) || (current_ftype == `srio_ftype__DOORB)) || (current_ftype == `srio_ftype__MESSG)) || ((current_ftype == `srio_ftype__NWRITE) && (current_ttype == `srio_ttype__TNWR_R)));
      end else begin
        generate_a_response <= 1'b0;
      end
      if(when_SrioResponse_l73) begin
        capture_data <= ((current_ftype == `srio_ftype__SWRITE) || (current_ftype == `srio_ftype__NWRITE));
      end else begin
        if(when_SrioResponse_l75) begin
          capture_data <= 1'b0;
        end else begin
          capture_data <= capture_data;
        end
      end
      if(when_SrioResponse_l84) begin
        data_store_waddr <= current_addr[7 : 0];
      end else begin
        if(treq_fire_7) begin
          data_store_waddr <= _zz_data_store_waddr;
        end else begin
          data_store_waddr <= data_store_waddr;
        end
      end
      if(generate_a_response) begin
        response_data_out_d <= response_data_in;
      end
      response_data_out <= response_data_out_d;
      if(when_SrioResponse_l115) begin
        current_beat_cnt <= 6'h0;
      end else begin
        if(tresp_fire_1) begin
          current_beat_cnt <= (current_beat_cnt + 6'h01);
        end else begin
          current_beat_cnt <= current_beat_cnt;
        end
      end
      if(when_SrioResponse_l124) begin
        tresp_tlast <= (! (tresp_fire_2 && tresp_payload_last));
      end else begin
        if(when_SrioResponse_l126) begin
          tresp_tlast <= (! tresp_tlast);
        end else begin
          if(when_SrioResponse_l128) begin
            tresp_tlast <= 1'b0;
          end else begin
            tresp_tlast <= tresp_tlast;
          end
        end
      end
      if(when_SrioResponse_l136) begin
        data_store_raddr <= starting_read_addr;
      end else begin
        if(when_SrioResponse_l138) begin
          data_store_raddr <= _zz_data_store_raddr;
        end
      end
      generate_rsp <= generate_a_response;
      generate_rsp_d <= generate_rsp;
      if(when_SrioResponse_l147) begin
        pull_from_store_d <= 1'b1;
      end else begin
        if(tresp_payload_last) begin
          pull_from_store_d <= 1'b0;
        end else begin
          pull_from_store_d <= pull_from_store_d;
        end
      end
      if(when_SrioResponse_l156) begin
        tresp_tvalid <= 1'b1;
      end else begin
        if(when_SrioResponse_l158) begin
          tresp_tvalid <= 1'b0;
        end else begin
          tresp_tvalid <= tresp_tvalid;
        end
      end
    end
  end


endmodule

module StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [7:0]    io_pushOccupancy,
  output     [7:0]    io_popOccupancy,
  input               srio_clk,
  input               srio_reset,
  input               bus_clk,
  input               bus_reset
);
  reg        [63:0]   _zz_ram_port1;
  wire       [7:0]    popToPushGray_buffercc_io_dataOut;
  wire       [7:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [7:0]    _zz_pushCC_pushPtrGray;
  wire       [6:0]    _zz_ram_port;
  wire       [7:0]    _zz_popCC_popPtrGray;
  wire       [6:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [6:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [7:0]    popToPushGray;
  wire       [7:0]    pushToPopGray;
  reg        [7:0]    pushCC_pushPtr;
  wire       [7:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [7:0]    pushCC_pushPtrGray;
  wire       [7:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  reg        [7:0]    popCC_popPtr;
  wire       [7:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [7:0]    popCC_popPtrGray;
  wire       [7:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [7:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  reg [63:0] ram [0:127];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[6:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[6:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge srio_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge bus_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .srio_clk      (srio_clk                           ), //i
    .srio_reset    (srio_reset                         )  //i
  );
  BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .bus_clk       (bus_clk                            ), //i
    .bus_reset     (bus_reset                          )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 8'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[7 : 6] == (~ pushCC_popPtrGray[7 : 6])) && (pushCC_pushPtrGray[5 : 0] == pushCC_popPtrGray[5 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = pushCC_popPtrGray[7];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 8'h01);
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
  assign _zz_io_popOccupancy_6 = popCC_pushPtrGray[7];
  assign io_popOccupancy = ({_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      pushCC_pushPtr <= 8'h0;
      pushCC_pushPtrGray <= 8'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge bus_clk or posedge bus_reset) begin
    if(bus_reset) begin
      popCC_popPtr <= 8'h0;
      popCC_popPtrGray <= 8'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module SrioRequest (
  output              ireq_valid,
  input               ireq_ready,
  output              ireq_payload_last,
  output     [63:0]   ireq_payload_fragment,
  input               iresp_valid,
  output              iresp_ready,
  input               iresp_payload_last,
  input      [63:0]   iresp_payload_fragment,
  input      [33:0]   user_addr,
  input      [3:0]    user_ftype,
  input      [3:0]    user_ttype,
  input      [7:0]    user_size,
  input      [1:0]    user_prio,
  input      [7:0]    user_tid,
  input               user_data_valid,
  output              user_data_ready,
  input      [63:0]   user_data_payload,
  input               send_start,
  output              iresp_stream_valid,
  input               iresp_stream_ready,
  output     [63:0]   iresp_stream_payload,
  input               srio_clk,
  input               busReset
);
  wire       [5:0]    _zz_when_SrioRequest_l48;
  wire       [4:0]    _zz_when_SrioRequest_l48_1;
  wire       `srio_ftype__type _zz_request_autocheck_error;
  wire       `srio_ttype__type _zz_request_autocheck_error_1;
  wire       [63:0]   header_beat;
  reg        [5:0]    current_beat_cnt;
  wire                ireq_fire;
  wire                when_SrioRequest_l35;
  wire                ireq_fire_1;
  wire       [4:0]    number_of_data_beats;
  reg                 ireq_tlast;
  wire                when_SrioRequest_l46;
  wire                ireq_fire_2;
  wire                ireq_fire_3;
  wire                when_SrioRequest_l48;
  wire                when_SrioRequest_l50;
  wire                when_SrioRequest_l52;
  reg        [63:0]   ireq_tdata;
  wire                ireq_fire_4;
  wire                when_SrioRequest_l60;
  reg                 user_data_ready_1;
  reg                 ireq_tvalid;
  reg                 send_start_d;
  wire                ireq_fire_5;
  wire                when_SrioRequest_l70;
  wire                when_SrioRequest_l73;
  wire       [63:0]   write_queue_data_d;
  reg        [63:0]   write_queue_data;
  reg                 expecting_a_response;
  wire                ireq_fire_6;
  wire                when_SrioRequest_l87;
  reg        [63:0]   read_queue_data;
  wire       [7:0]    expected_tid;
  wire       [3:0]    expected_ftype;
  wire       [7:0]    expected_size;
  reg                 compare_received;
  wire                iresp_fire;
  wire                when_SrioRequest_l102;
  wire                iresp_fire_1;
  reg                 request_autocheck_error;
  wire                iresp_fire_2;
  wire                when_SrioRequest_l111;
  reg                 iresp_tready;
  wire                iresp_fire_3;
  wire                when_SrioRequest_l121;
  reg                 nread_iresp_write;
  wire                iresp_fire_4;
  wire                when_SrioRequest_l129;
  wire                iresp_fire_5;
  wire                when_SrioRequest_l131;
  wire                iresp_fire_6;

  assign _zz_when_SrioRequest_l48_1 = number_of_data_beats;
  assign _zz_when_SrioRequest_l48 = {1'd0, _zz_when_SrioRequest_l48_1};
  assign _zz_request_autocheck_error = `srio_ftype__NREAD;
  assign _zz_request_autocheck_error_1 = `srio_ttype__TWDATA;
  assign header_beat = {{{{{{{{user_tid,user_ftype},user_ttype},1'b0},user_prio},1'b0},user_size},2'b00},user_addr};
  assign ireq_fire = (ireq_valid && ireq_ready);
  assign when_SrioRequest_l35 = (ireq_fire && ireq_payload_last);
  assign ireq_fire_1 = (ireq_valid && ireq_ready);
  assign number_of_data_beats = user_size[7 : 3];
  assign when_SrioRequest_l46 = (((user_ftype == `srio_ftype__NREAD) || (user_ftype == `srio_ftype__DOORB)) && (current_beat_cnt == 6'h0));
  assign ireq_fire_2 = (ireq_valid && ireq_ready);
  assign ireq_fire_3 = (ireq_valid && ireq_ready);
  assign when_SrioRequest_l48 = ((current_beat_cnt == _zz_when_SrioRequest_l48) && ireq_fire_3);
  assign when_SrioRequest_l50 = (! ireq_ready);
  assign when_SrioRequest_l52 = (ireq_ready || (! ireq_valid));
  assign ireq_payload_last = ireq_tlast;
  assign ireq_fire_4 = (ireq_valid && ireq_ready);
  assign when_SrioRequest_l60 = ((current_beat_cnt == 6'h0) && (! ireq_fire_4));
  assign ireq_payload_fragment = ireq_tdata;
  assign ireq_fire_5 = (ireq_valid && ireq_ready);
  assign when_SrioRequest_l70 = (ireq_fire_5 && ireq_payload_last);
  assign when_SrioRequest_l73 = (send_start && (! send_start_d));
  assign ireq_valid = ireq_tvalid;
  assign user_data_ready = user_data_ready_1;
  assign write_queue_data_d = {{{44'h0,user_tid},user_ftype},user_size};
  assign ireq_fire_6 = (ireq_valid && ireq_ready);
  assign when_SrioRequest_l87 = ((current_beat_cnt == 6'h0) && ireq_fire_6);
  assign expected_tid = read_queue_data[19 : 12];
  assign expected_ftype = read_queue_data[11 : 8];
  assign expected_size = read_queue_data[7 : 0];
  assign iresp_fire = (iresp_valid && iresp_ready);
  assign when_SrioRequest_l102 = (iresp_fire && iresp_payload_last);
  assign iresp_fire_1 = (iresp_valid && iresp_ready);
  assign iresp_fire_2 = (iresp_valid && iresp_ready);
  assign when_SrioRequest_l111 = (compare_received && iresp_fire_2);
  assign iresp_fire_3 = (iresp_valid && iresp_ready);
  assign when_SrioRequest_l121 = (iresp_fire_3 && iresp_payload_last);
  assign iresp_ready = iresp_tready;
  assign iresp_fire_4 = (iresp_valid && iresp_ready);
  assign when_SrioRequest_l129 = ((compare_received && (expected_ftype == `srio_ftype__NREAD)) && iresp_fire_4);
  assign iresp_fire_5 = (iresp_valid && iresp_ready);
  assign when_SrioRequest_l131 = (iresp_fire_5 && iresp_payload_last);
  assign iresp_stream_payload = iresp_payload_fragment;
  assign iresp_fire_6 = (iresp_valid && iresp_ready);
  assign iresp_stream_valid = (nread_iresp_write && iresp_fire_6);
  always @(posedge srio_clk or posedge busReset) begin
    if(busReset) begin
      current_beat_cnt <= 6'h0;
      ireq_tlast <= 1'b0;
      user_data_ready_1 <= 1'b0;
      ireq_tvalid <= 1'b0;
      send_start_d <= 1'b0;
      expecting_a_response <= 1'b0;
      compare_received <= 1'b1;
      request_autocheck_error <= 1'b0;
      iresp_tready <= 1'b0;
      nread_iresp_write <= 1'b0;
    end else begin
      if(when_SrioRequest_l35) begin
        current_beat_cnt <= 6'h0;
      end else begin
        if(ireq_fire_1) begin
          current_beat_cnt <= (current_beat_cnt + 6'h01);
        end else begin
          current_beat_cnt <= current_beat_cnt;
        end
      end
      if(when_SrioRequest_l46) begin
        ireq_tlast <= (! (ireq_fire_2 && ireq_payload_last));
      end else begin
        if(when_SrioRequest_l48) begin
          ireq_tlast <= (! ireq_tlast);
        end else begin
          if(when_SrioRequest_l50) begin
            ireq_tlast <= ireq_tlast;
          end else begin
            if(when_SrioRequest_l52) begin
              ireq_tlast <= 1'b0;
            end else begin
              ireq_tlast <= ireq_tlast;
            end
          end
        end
      end
      send_start_d <= send_start;
      if(when_SrioRequest_l70) begin
        ireq_tvalid <= 1'b0;
        user_data_ready_1 <= 1'b0;
      end else begin
        if(when_SrioRequest_l73) begin
          ireq_tvalid <= 1'b1;
          user_data_ready_1 <= 1'b1;
        end else begin
          ireq_tvalid <= ireq_tvalid;
          user_data_ready_1 <= user_data_ready_1;
        end
      end
      if(when_SrioRequest_l87) begin
        expecting_a_response <= ((((user_ftype == `srio_ftype__NREAD) || (user_ftype == `srio_ftype__DOORB)) || ((user_ftype == `srio_ftype__NWRITE) && (user_ttype == `srio_ttype__TNWR_R))) || (user_ftype == `srio_ftype__MESSG));
      end else begin
        expecting_a_response <= 1'b0;
      end
      if(when_SrioRequest_l102) begin
        compare_received <= 1'b1;
      end else begin
        if(iresp_fire_1) begin
          compare_received <= 1'b0;
        end else begin
          compare_received <= compare_received;
        end
      end
      if(when_SrioRequest_l111) begin
        request_autocheck_error <= ((((expected_tid != iresp_payload_fragment[63 : 56]) || ((expected_ftype == _zz_request_autocheck_error) && (iresp_payload_fragment[51 : 48] != _zz_request_autocheck_error_1))) || ((expected_ftype == `srio_ftype__NWRITE) && (iresp_payload_fragment[51 : 48] != `srio_ttype__TNDATA))) || ((expected_ftype == `srio_ftype__DOORB) && (iresp_payload_fragment[51 : 48] != `srio_ttype__TNDATA)));
      end else begin
        request_autocheck_error <= 1'b0;
      end
      if(when_SrioRequest_l121) begin
        iresp_tready <= 1'b0;
      end else begin
        iresp_tready <= 1'b1;
      end
      if(when_SrioRequest_l129) begin
        nread_iresp_write <= 1'b1;
      end else begin
        if(when_SrioRequest_l131) begin
          nread_iresp_write <= 1'b0;
        end else begin
          nread_iresp_write <= nread_iresp_write;
        end
      end
    end
  end

  always @(posedge srio_clk) begin
    if(when_SrioRequest_l60) begin
      ireq_tdata <= header_beat;
    end else begin
      ireq_tdata <= user_data_payload;
    end
    write_queue_data <= write_queue_data_d;
    if(expecting_a_response) begin
      read_queue_data <= write_queue_data;
    end
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [7:0]    io_pushOccupancy,
  output     [7:0]    io_popOccupancy,
  input               bus_clk,
  input               bus_reset,
  input               srio_clk,
  input               srio_reset
);
  reg        [63:0]   _zz_ram_port1;
  wire       [7:0]    popToPushGray_buffercc_io_dataOut;
  wire       [7:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [7:0]    _zz_pushCC_pushPtrGray;
  wire       [6:0]    _zz_ram_port;
  wire       [7:0]    _zz_popCC_popPtrGray;
  wire       [6:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [6:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [7:0]    popToPushGray;
  wire       [7:0]    pushToPopGray;
  reg        [7:0]    pushCC_pushPtr;
  wire       [7:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [7:0]    pushCC_pushPtrGray;
  wire       [7:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                _zz_io_pushOccupancy_3;
  wire                _zz_io_pushOccupancy_4;
  wire                _zz_io_pushOccupancy_5;
  wire                _zz_io_pushOccupancy_6;
  reg        [7:0]    popCC_popPtr;
  wire       [7:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [7:0]    popCC_popPtrGray;
  wire       [7:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [7:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  wire                _zz_io_popOccupancy_3;
  wire                _zz_io_popOccupancy_4;
  wire                _zz_io_popOccupancy_5;
  wire                _zz_io_popOccupancy_6;
  reg [63:0] ram [0:127];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[6:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[6:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge bus_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge srio_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .bus_clk       (bus_clk                            ), //i
    .bus_reset     (bus_reset                          )  //i
  );
  BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .srio_clk      (srio_clk                           ), //i
    .srio_reset    (srio_reset                         )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 8'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[7 : 6] == (~ pushCC_popPtrGray[7 : 6])) && (pushCC_pushPtrGray[5 : 0] == pushCC_popPtrGray[5 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = (pushCC_popPtrGray[3] ^ _zz_io_pushOccupancy_3);
  assign _zz_io_pushOccupancy_3 = (pushCC_popPtrGray[4] ^ _zz_io_pushOccupancy_4);
  assign _zz_io_pushOccupancy_4 = (pushCC_popPtrGray[5] ^ _zz_io_pushOccupancy_5);
  assign _zz_io_pushOccupancy_5 = (pushCC_popPtrGray[6] ^ _zz_io_pushOccupancy_6);
  assign _zz_io_pushOccupancy_6 = pushCC_popPtrGray[7];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_6,{_zz_io_pushOccupancy_5,{_zz_io_pushOccupancy_4,{_zz_io_pushOccupancy_3,{_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}}}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 8'h01);
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
  assign _zz_io_popOccupancy_6 = popCC_pushPtrGray[7];
  assign io_popOccupancy = ({_zz_io_popOccupancy_6,{_zz_io_popOccupancy_5,{_zz_io_popOccupancy_4,{_zz_io_popOccupancy_3,{_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}}}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge bus_clk or posedge bus_reset) begin
    if(bus_reset) begin
      pushCC_pushPtr <= 8'h0;
      pushCC_pushPtrGray <= 8'h0;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      popCC_popPtr <= 8'h0;
      popCC_popPtrGray <= 8'h0;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               bus_clk,
  input               _zz_1
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge bus_clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC_1 replaced by BufferCC_1

module BufferCC_1 (
  input      [7:0]    io_dataIn,
  output     [7:0]    io_dataOut,
  input               srio_clk,
  input               srio_reset
);
  (* async_reg = "true" *) reg        [7:0]    buffers_0;
  (* async_reg = "true" *) reg        [7:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk or posedge srio_reset) begin
    if(srio_reset) begin
      buffers_0 <= 8'h0;
      buffers_1 <= 8'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input      [7:0]    io_dataIn,
  output     [7:0]    io_dataOut,
  input               bus_clk,
  input               bus_reset
);
  (* async_reg = "true" *) reg        [7:0]    buffers_0;
  (* async_reg = "true" *) reg        [7:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge bus_clk or posedge bus_reset) begin
    if(bus_reset) begin
      buffers_0 <= 8'h0;
      buffers_1 <= 8'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
