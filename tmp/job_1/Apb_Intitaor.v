// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Apb_Intitaor
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps 

module Apb_Intitaor (
  input      [7:0]    apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output reg [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output              s_axis_ireq_tvalid,
  input               s_axis_ireq_tready,
  output              s_axis_ireq_tlast,
  output     [63:0]   s_axis_ireq_tdata,
  output     [7:0]    s_axis_ireq_tkeep,
  output     [31:0]   s_axis_ireq_tuser,
  input               m_axis_iresp_tvalid,
  output              m_axis_iresp_tready,
  input               m_axis_iresp_tlast,
  input      [63:0]   m_axis_iresp_tdata,
  input      [7:0]    m_axis_iresp_tkeep,
  input      [31:0]   m_axis_iresp_tuser,
  input               reset,
  input               clk,
  input               srio_clk_clk
);

  reg        [33:0]   intitaor_ctrl_ctrl_user_addr;
  wire       [15:0]   intitaor_ctrl_ctrl_user_stream_payload;
  wire                intitaor_ctrl_ctrl_user_stream_ready;
  wire                intitaor_ctrl_s_axis_ireq_tvalid;
  wire                intitaor_ctrl_s_axis_ireq_tlast;
  wire       [63:0]   intitaor_ctrl_s_axis_ireq_tdata;
  wire       [7:0]    intitaor_ctrl_s_axis_ireq_tkeep;
  wire       [31:0]   intitaor_ctrl_s_axis_ireq_tuser;
  wire                intitaor_ctrl_m_axis_iresp_tready;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 intitaor_ctrl_ctrl_flush_driver;
  reg                 _zz_ctrl_user_stream_valid;
  reg        [7:0]    intitaor_ctrl_ctrl_user_tid_driver;
  reg        [3:0]    intitaor_ctrl_ctrl_user_ftype_driver;
  reg        [3:0]    intitaor_ctrl_ctrl_user_ttype_driver;
  reg        [1:0]    intitaor_ctrl_ctrl_user_prio_driver;
  reg        [7:0]    intitaor_ctrl_ctrl_user_size_driver;
  reg        [1:0]    _zz_apb_PRDATA;
  reg        [15:0]   _zz_apb_PRDATA_1;
  reg        [15:0]   _zz_apb_PRDATA_2;
  reg                 _zz_ctrl_send_start;

  Srio_Intitaor intitaor_ctrl (
    .ctrl_user_addr              (intitaor_ctrl_ctrl_user_addr[33:0]            ), //i
    .ctrl_user_ftype             (intitaor_ctrl_ctrl_user_ftype_driver[3:0]     ), //i
    .ctrl_user_ttype             (intitaor_ctrl_ctrl_user_ttype_driver[3:0]     ), //i
    .ctrl_user_size              (intitaor_ctrl_ctrl_user_size_driver[7:0]      ), //i
    .ctrl_user_prio              (intitaor_ctrl_ctrl_user_prio_driver[1:0]      ), //i
    .ctrl_user_tid               (intitaor_ctrl_ctrl_user_tid_driver[7:0]       ), //i
    .ctrl_user_stream_valid      (_zz_ctrl_user_stream_valid                    ), //i
    .ctrl_user_stream_ready      (intitaor_ctrl_ctrl_user_stream_ready          ), //o
    .ctrl_user_stream_payload    (intitaor_ctrl_ctrl_user_stream_payload[15:0]  ), //i
    .ctrl_send_start             (_zz_ctrl_send_start                           ), //i
    .ctrl_flush                  (intitaor_ctrl_ctrl_flush_driver               ), //i
    .s_axis_ireq_tvalid          (intitaor_ctrl_s_axis_ireq_tvalid              ), //o
    .s_axis_ireq_tready          (s_axis_ireq_tready                            ), //i
    .s_axis_ireq_tlast           (intitaor_ctrl_s_axis_ireq_tlast               ), //o
    .s_axis_ireq_tdata           (intitaor_ctrl_s_axis_ireq_tdata[63:0]         ), //o
    .s_axis_ireq_tkeep           (intitaor_ctrl_s_axis_ireq_tkeep[7:0]          ), //o
    .s_axis_ireq_tuser           (intitaor_ctrl_s_axis_ireq_tuser[31:0]         ), //o
    .m_axis_iresp_tvalid         (m_axis_iresp_tvalid                           ), //i
    .m_axis_iresp_tready         (intitaor_ctrl_m_axis_iresp_tready             ), //o
    .m_axis_iresp_tlast          (m_axis_iresp_tlast                            ), //i
    .m_axis_iresp_tdata          (m_axis_iresp_tdata[63:0]                      ), //i
    .m_axis_iresp_tkeep          (m_axis_iresp_tkeep[7:0]                       ), //i
    .m_axis_iresp_tuser          (m_axis_iresp_tuser[31:0]                      ), //i
    .reset                       (reset                                         ), //i
    .srio_clk_clk                (srio_clk_clk                                  ), //i
    .clk                         (clk                                           )  //i
  );
  assign s_axis_ireq_tvalid = intitaor_ctrl_s_axis_ireq_tvalid;
  assign s_axis_ireq_tlast = intitaor_ctrl_s_axis_ireq_tlast;
  assign s_axis_ireq_tdata = intitaor_ctrl_s_axis_ireq_tdata;
  assign s_axis_ireq_tkeep = intitaor_ctrl_s_axis_ireq_tkeep;
  assign s_axis_ireq_tuser = intitaor_ctrl_s_axis_ireq_tuser;
  assign m_axis_iresp_tready = intitaor_ctrl_m_axis_iresp_tready;
  assign apb_PREADY = 1'b1;
  always @(*) begin
    apb_PRDATA = 16'h0;
    case(apb_PADDR)
      8'h0 : begin
        apb_PRDATA[0 : 0] = intitaor_ctrl_ctrl_flush_driver;
        apb_PRDATA[1 : 1] = intitaor_ctrl_ctrl_user_stream_ready;
      end
      8'h08 : begin
        apb_PRDATA[15 : 8] = intitaor_ctrl_ctrl_user_tid_driver;
        apb_PRDATA[7 : 4] = intitaor_ctrl_ctrl_user_ftype_driver;
        apb_PRDATA[3 : 0] = intitaor_ctrl_ctrl_user_ttype_driver;
      end
      8'h0c : begin
        apb_PRDATA[9 : 8] = intitaor_ctrl_ctrl_user_prio_driver;
        apb_PRDATA[7 : 0] = intitaor_ctrl_ctrl_user_size_driver;
      end
      8'h10 : begin
        apb_PRDATA[1 : 0] = _zz_apb_PRDATA;
      end
      8'h14 : begin
        apb_PRDATA[15 : 0] = _zz_apb_PRDATA_1;
      end
      8'h18 : begin
        apb_PRDATA[15 : 0] = _zz_apb_PRDATA_2;
      end
      default : begin
      end
    endcase
  end

  assign apb_PSLVERROR = 1'b0;
  assign busCtrl_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busCtrl_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busCtrl_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busCtrl_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  always @(*) begin
    _zz_ctrl_user_stream_valid = 1'b0;
    case(apb_PADDR)
      8'h04 : begin
        if(busCtrl_doWrite) begin
          _zz_ctrl_user_stream_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign intitaor_ctrl_ctrl_user_stream_payload = apb_PWDATA[15 : 0];
  always @(*) begin
    intitaor_ctrl_ctrl_user_addr[33 : 32] = _zz_apb_PRDATA;
    intitaor_ctrl_ctrl_user_addr[31 : 16] = _zz_apb_PRDATA_1;
    intitaor_ctrl_ctrl_user_addr[15 : 0] = _zz_apb_PRDATA_2;
  end

  always @(*) begin
    _zz_ctrl_send_start = 1'b0;
    case(apb_PADDR)
      8'h1c : begin
        if(busCtrl_doWrite) begin
          _zz_ctrl_send_start = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      intitaor_ctrl_ctrl_flush_driver <= 1'b1;
    end else begin
      case(apb_PADDR)
        8'h0 : begin
          if(busCtrl_doWrite) begin
            intitaor_ctrl_ctrl_flush_driver <= apb_PWDATA[0];
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
        if(busCtrl_doWrite) begin
          intitaor_ctrl_ctrl_user_tid_driver <= apb_PWDATA[15 : 8];
          intitaor_ctrl_ctrl_user_ftype_driver <= apb_PWDATA[7 : 4];
          intitaor_ctrl_ctrl_user_ttype_driver <= apb_PWDATA[3 : 0];
        end
      end
      8'h0c : begin
        if(busCtrl_doWrite) begin
          intitaor_ctrl_ctrl_user_prio_driver <= apb_PWDATA[9 : 8];
          intitaor_ctrl_ctrl_user_size_driver <= apb_PWDATA[7 : 0];
        end
      end
      8'h10 : begin
        if(busCtrl_doWrite) begin
          _zz_apb_PRDATA <= apb_PWDATA[1 : 0];
        end
      end
      8'h14 : begin
        if(busCtrl_doWrite) begin
          _zz_apb_PRDATA_1 <= apb_PWDATA[15 : 0];
        end
      end
      8'h18 : begin
        if(busCtrl_doWrite) begin
          _zz_apb_PRDATA_2 <= apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Srio_Intitaor (
  input      [33:0]   ctrl_user_addr,
  input      [3:0]    ctrl_user_ftype,
  input      [3:0]    ctrl_user_ttype,
  input      [7:0]    ctrl_user_size,
  input      [1:0]    ctrl_user_prio,
  input      [7:0]    ctrl_user_tid,
  input               ctrl_user_stream_valid,
  output              ctrl_user_stream_ready,
  input      [15:0]   ctrl_user_stream_payload,
  input               ctrl_send_start,
  input               ctrl_flush,
  output              s_axis_ireq_tvalid,
  input               s_axis_ireq_tready,
  output              s_axis_ireq_tlast,
  output     [63:0]   s_axis_ireq_tdata,
  output     [7:0]    s_axis_ireq_tkeep,
  output     [31:0]   s_axis_ireq_tuser,
  input               m_axis_iresp_tvalid,
  output              m_axis_iresp_tready,
  input               m_axis_iresp_tlast,
  input      [63:0]   m_axis_iresp_tdata,
  input      [7:0]    m_axis_iresp_tkeep,
  input      [31:0]   m_axis_iresp_tuser,
  input               reset,
  input               srio_clk_clk,
  input               clk
);
  localparam SrioFtype_NREAD = 4'd2;
  localparam SrioFtype_NWRITE = 4'd5;
  localparam SrioFtype_SWRITE = 4'd6;
  localparam SrioFtype_DOORB = 4'd10;
  localparam SrioFtype_MESSG = 4'd11;
  localparam SrioFtype_RESP = 4'd13;
  localparam SrioFtype_FTYPE9 = 4'd9;
  localparam SrioTtype_TNWR = 4'd4;
  localparam SrioTtype_TNWR_R = 4'd5;
  localparam SrioTtype_TNDATA = 4'd0;
  localparam SrioTtype_TWDATA = 4'd8;

  wire                srio_area_intitaor_iresp_stream_ready;
  wire                bufferCC_5_io_dataOut;
  wire                txFrontend_stream_adapt_push_stream_ready;
  wire                txFrontend_stream_adapt_pop_stream_valid;
  wire       [63:0]   txFrontend_stream_adapt_pop_stream_payload;
  wire                txFrontend_buffer_io_push_ready;
  wire                txFrontend_buffer_io_pop_valid;
  wire       [63:0]   txFrontend_buffer_io_pop_payload;
  wire       [6:0]    txFrontend_buffer_io_pushOccupancy;
  wire       [6:0]    txFrontend_buffer_io_popOccupancy;
  wire                srio_area_intitaor_s_axis_ireq_tvalid;
  wire                srio_area_intitaor_s_axis_ireq_tlast;
  wire       [63:0]   srio_area_intitaor_s_axis_ireq_tdata;
  wire       [7:0]    srio_area_intitaor_s_axis_ireq_tkeep;
  wire       [31:0]   srio_area_intitaor_s_axis_ireq_tuser;
  wire                srio_area_intitaor_m_axis_iresp_tready;
  wire                srio_area_intitaor_usercmd_user_data_ready;
  wire                srio_area_intitaor_iresp_stream_valid;
  wire       [63:0]   srio_area_intitaor_iresp_stream_payload;
  wire                _zz_1;
  wire                txReset;
  wire       [3:0]    _zz_usercmd_user_ftype;
  wire       [3:0]    _zz_usercmd_user_ftype_1;
  wire       [3:0]    _zz_usercmd_user_ttype;
  wire       [3:0]    _zz_usercmd_user_ttype_1;
  `ifndef SYNTHESIS
  reg [47:0] _zz_usercmd_user_ftype_string;
  reg [47:0] _zz_usercmd_user_ftype_1_string;
  reg [47:0] _zz_usercmd_user_ttype_string;
  reg [47:0] _zz_usercmd_user_ttype_1_string;
  `endif


  BufferCC_4 bufferCC_5 (
    .io_dataIn       (1'b0                   ), //i
    .io_dataOut      (bufferCC_5_io_dataOut  ), //o
    .srio_clk_clk    (srio_clk_clk           ), //i
    ._zz_1           (_zz_1                  )  //i
  );
  Tx_Buffer_Adapt txFrontend_stream_adapt (
    .push_stream_valid      (ctrl_user_stream_valid                            ), //i
    .push_stream_ready      (txFrontend_stream_adapt_push_stream_ready         ), //o
    .push_stream_payload    (ctrl_user_stream_payload[15:0]                    ), //i
    .pop_stream_valid       (txFrontend_stream_adapt_pop_stream_valid          ), //o
    .pop_stream_ready       (txFrontend_buffer_io_push_ready                   ), //i
    .pop_stream_payload     (txFrontend_stream_adapt_pop_stream_payload[63:0]  ), //o
    .clk                    (clk                                               ), //i
    .reset                  (reset                                             ), //i
    .ctrl_flush             (ctrl_flush                                        )  //i
  );
  StreamFifoCC_1 txFrontend_buffer (
    .io_push_valid       (txFrontend_stream_adapt_pop_stream_valid          ), //i
    .io_push_ready       (txFrontend_buffer_io_push_ready                   ), //o
    .io_push_payload     (txFrontend_stream_adapt_pop_stream_payload[63:0]  ), //i
    .io_pop_valid        (txFrontend_buffer_io_pop_valid                    ), //o
    .io_pop_ready        (srio_area_intitaor_usercmd_user_data_ready        ), //i
    .io_pop_payload      (txFrontend_buffer_io_pop_payload[63:0]            ), //o
    .io_pushOccupancy    (txFrontend_buffer_io_pushOccupancy[6:0]           ), //o
    .io_popOccupancy     (txFrontend_buffer_io_popOccupancy[6:0]            ), //o
    .clk                 (clk                                               ), //i
    .reset               (reset                                             ), //i
    .ctrl_flush          (ctrl_flush                                        ), //i
    .srio_clk_clk        (srio_clk_clk                                      ), //i
    .txReset             (txReset                                           )  //i
  );
  Intitaor srio_area_intitaor (
    .s_axis_ireq_tvalid           (srio_area_intitaor_s_axis_ireq_tvalid          ), //o
    .s_axis_ireq_tready           (s_axis_ireq_tready                             ), //i
    .s_axis_ireq_tlast            (srio_area_intitaor_s_axis_ireq_tlast           ), //o
    .s_axis_ireq_tdata            (srio_area_intitaor_s_axis_ireq_tdata[63:0]     ), //o
    .s_axis_ireq_tkeep            (srio_area_intitaor_s_axis_ireq_tkeep[7:0]      ), //o
    .s_axis_ireq_tuser            (srio_area_intitaor_s_axis_ireq_tuser[31:0]     ), //o
    .m_axis_iresp_tvalid          (m_axis_iresp_tvalid                            ), //i
    .m_axis_iresp_tready          (srio_area_intitaor_m_axis_iresp_tready         ), //o
    .m_axis_iresp_tlast           (m_axis_iresp_tlast                             ), //i
    .m_axis_iresp_tdata           (m_axis_iresp_tdata[63:0]                       ), //i
    .m_axis_iresp_tkeep           (m_axis_iresp_tkeep[7:0]                        ), //i
    .m_axis_iresp_tuser           (m_axis_iresp_tuser[31:0]                       ), //i
    .usercmd_user_addr            (ctrl_user_addr[33:0]                           ), //i
    .usercmd_user_ftype           (_zz_usercmd_user_ftype[3:0]                    ), //i
    .usercmd_user_ttype           (_zz_usercmd_user_ttype[3:0]                    ), //i
    .usercmd_user_size            (ctrl_user_size[7:0]                            ), //i
    .usercmd_user_prio            (ctrl_user_prio[1:0]                            ), //i
    .usercmd_user_tid             (ctrl_user_tid[7:0]                             ), //i
    .usercmd_user_data_valid      (txFrontend_buffer_io_pop_valid                 ), //i
    .usercmd_user_data_ready      (srio_area_intitaor_usercmd_user_data_ready     ), //o
    .usercmd_user_data_payload    (txFrontend_buffer_io_pop_payload[63:0]         ), //i
    .send_start                   (ctrl_send_start                                ), //i
    .iresp_stream_valid           (srio_area_intitaor_iresp_stream_valid          ), //o
    .iresp_stream_ready           (srio_area_intitaor_iresp_stream_ready          ), //i
    .iresp_stream_payload         (srio_area_intitaor_iresp_stream_payload[63:0]  ), //o
    .srio_clk_clk                 (srio_clk_clk                                   ), //i
    .txReset                      (txReset                                        )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_usercmd_user_ftype)
      SrioFtype_NREAD : _zz_usercmd_user_ftype_string = "NREAD ";
      SrioFtype_NWRITE : _zz_usercmd_user_ftype_string = "NWRITE";
      SrioFtype_SWRITE : _zz_usercmd_user_ftype_string = "SWRITE";
      SrioFtype_DOORB : _zz_usercmd_user_ftype_string = "DOORB ";
      SrioFtype_MESSG : _zz_usercmd_user_ftype_string = "MESSG ";
      SrioFtype_RESP : _zz_usercmd_user_ftype_string = "RESP  ";
      SrioFtype_FTYPE9 : _zz_usercmd_user_ftype_string = "FTYPE9";
      default : _zz_usercmd_user_ftype_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_usercmd_user_ftype_1)
      SrioFtype_NREAD : _zz_usercmd_user_ftype_1_string = "NREAD ";
      SrioFtype_NWRITE : _zz_usercmd_user_ftype_1_string = "NWRITE";
      SrioFtype_SWRITE : _zz_usercmd_user_ftype_1_string = "SWRITE";
      SrioFtype_DOORB : _zz_usercmd_user_ftype_1_string = "DOORB ";
      SrioFtype_MESSG : _zz_usercmd_user_ftype_1_string = "MESSG ";
      SrioFtype_RESP : _zz_usercmd_user_ftype_1_string = "RESP  ";
      SrioFtype_FTYPE9 : _zz_usercmd_user_ftype_1_string = "FTYPE9";
      default : _zz_usercmd_user_ftype_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_usercmd_user_ttype)
      SrioTtype_TNWR : _zz_usercmd_user_ttype_string = "TNWR  ";
      SrioTtype_TNWR_R : _zz_usercmd_user_ttype_string = "TNWR_R";
      SrioTtype_TNDATA : _zz_usercmd_user_ttype_string = "TNDATA";
      SrioTtype_TWDATA : _zz_usercmd_user_ttype_string = "TWDATA";
      default : _zz_usercmd_user_ttype_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_usercmd_user_ttype_1)
      SrioTtype_TNWR : _zz_usercmd_user_ttype_1_string = "TNWR  ";
      SrioTtype_TNWR_R : _zz_usercmd_user_ttype_1_string = "TNWR_R";
      SrioTtype_TNDATA : _zz_usercmd_user_ttype_1_string = "TNDATA";
      SrioTtype_TWDATA : _zz_usercmd_user_ttype_1_string = "TWDATA";
      default : _zz_usercmd_user_ttype_1_string = "??????";
    endcase
  end
  `endif

  assign _zz_1 = (reset || ctrl_flush);
  assign txReset = bufferCC_5_io_dataOut;
  assign ctrl_user_stream_ready = txFrontend_stream_adapt_push_stream_ready;
  assign s_axis_ireq_tvalid = srio_area_intitaor_s_axis_ireq_tvalid;
  assign s_axis_ireq_tlast = srio_area_intitaor_s_axis_ireq_tlast;
  assign s_axis_ireq_tdata = srio_area_intitaor_s_axis_ireq_tdata;
  assign s_axis_ireq_tkeep = srio_area_intitaor_s_axis_ireq_tkeep;
  assign s_axis_ireq_tuser = srio_area_intitaor_s_axis_ireq_tuser;
  assign m_axis_iresp_tready = srio_area_intitaor_m_axis_iresp_tready;
  assign _zz_usercmd_user_ftype_1 = ctrl_user_ftype;
  assign _zz_usercmd_user_ftype = _zz_usercmd_user_ftype_1;
  assign _zz_usercmd_user_ttype_1 = ctrl_user_ttype;
  assign _zz_usercmd_user_ttype = _zz_usercmd_user_ttype_1;

endmodule

module Intitaor (
  output              s_axis_ireq_tvalid,
  input               s_axis_ireq_tready,
  output              s_axis_ireq_tlast,
  output     [63:0]   s_axis_ireq_tdata,
  output     [7:0]    s_axis_ireq_tkeep,
  output     [31:0]   s_axis_ireq_tuser,
  input               m_axis_iresp_tvalid,
  output              m_axis_iresp_tready,
  input               m_axis_iresp_tlast,
  input      [63:0]   m_axis_iresp_tdata,
  input      [7:0]    m_axis_iresp_tkeep,
  input      [31:0]   m_axis_iresp_tuser,
  input      [33:0]   usercmd_user_addr,
  input      [3:0]    usercmd_user_ftype,
  input      [3:0]    usercmd_user_ttype,
  input      [7:0]    usercmd_user_size,
  input      [1:0]    usercmd_user_prio,
  input      [7:0]    usercmd_user_tid,
  input               usercmd_user_data_valid,
  output              usercmd_user_data_ready,
  input      [63:0]   usercmd_user_data_payload,
  input               send_start,
  output              iresp_stream_valid,
  input               iresp_stream_ready,
  output     [63:0]   iresp_stream_payload,
  input               srio_clk_clk,
  input               txReset
);
  localparam SrioFtype_NREAD = 4'd2;
  localparam SrioFtype_NWRITE = 4'd5;
  localparam SrioFtype_SWRITE = 4'd6;
  localparam SrioFtype_DOORB = 4'd10;
  localparam SrioFtype_MESSG = 4'd11;
  localparam SrioFtype_RESP = 4'd13;
  localparam SrioFtype_FTYPE9 = 4'd9;
  localparam SrioTtype_TNWR = 4'd4;
  localparam SrioTtype_TNWR_R = 4'd5;
  localparam SrioTtype_TNDATA = 4'd0;
  localparam SrioTtype_TWDATA = 4'd8;
  localparam srio_ftype_NREAD = 4'd2;
  localparam srio_ftype_NWRITE = 4'd5;
  localparam srio_ftype_SWRITE = 4'd6;
  localparam srio_ftype_DOORB = 4'd10;
  localparam srio_ftype_MESSG = 4'd11;
  localparam srio_ftype_RESP = 4'd13;
  localparam srio_ftype_FTYPE9 = 4'd9;
  localparam srio_ttype_TNWR = 4'd4;
  localparam srio_ttype_TNWR_R = 4'd5;
  localparam srio_ttype_TNDATA = 4'd0;
  localparam srio_ttype_TWDATA = 4'd8;

  wire                streamfifo_1_io_push_ready;
  wire                streamfifo_1_io_pop_valid;
  wire       [63:0]   streamfifo_1_io_pop_payload;
  wire       [6:0]    streamfifo_1_io_occupancy;
  wire       [6:0]    streamfifo_1_io_availability;
  wire       [5:0]    _zz_when_Intitaor_l46;
  wire       [4:0]    _zz_when_Intitaor_l46_1;
  wire       [3:0]    _zz_request_autocheck_error;
  wire       [3:0]    _zz_request_autocheck_error_1;
  wire       [63:0]   header_beat;
  reg        [5:0]    current_beat_cnt;
  wire                intiator_intiator_req_stream_fire;
  wire                when_Intitaor_l32;
  wire                intiator_intiator_req_stream_fire_1;
  wire       [4:0]    number_of_data_beats;
  reg                 ireq_tlast;
  wire                when_Intitaor_l44;
  wire                intiator_intiator_req_stream_fire_2;
  wire                intiator_intiator_req_stream_fire_3;
  wire                when_Intitaor_l46;
  wire                when_Intitaor_l48;
  wire                when_Intitaor_l50;
  reg        [63:0]   ireq_tdata;
  wire                intiator_intiator_req_stream_fire_4;
  wire                when_Intitaor_l58;
  reg                 user_data_ready;
  reg                 ireq_tvalid;
  reg                 send_start_d;
  wire                intiator_intiator_req_stream_fire_5;
  wire                when_Intitaor_l68;
  wire                when_Intitaor_l71;
  wire       [63:0]   write_queue_data_d;
  reg        [63:0]   write_queue_data;
  reg                 expecting_a_response;
  wire                intiator_intiator_req_stream_fire_6;
  wire                when_Intitaor_l85;
  reg        [63:0]   read_queue_data;
  wire       [7:0]    expected_tid;
  wire       [3:0]    expected_ftype;
  wire       [7:0]    expected_size;
  reg                 compare_received;
  wire                intiator_intiator_resp_stream_fire;
  wire                when_Intitaor_l100;
  wire                intiator_intiator_resp_stream_fire_1;
  reg                 request_autocheck_error;
  wire                intiator_intiator_resp_stream_fire_2;
  wire                when_Intitaor_l109;
  reg                 iresp_tready;
  wire                intiator_intiator_resp_stream_fire_3;
  wire                when_Intitaor_l119;
  reg                 nread_iresp_write;
  wire                intiator_intiator_resp_stream_fire_4;
  wire                when_Intitaor_l127;
  wire                intiator_intiator_resp_stream_fire_5;
  wire                when_Intitaor_l129;
  wire                intiator_intiator_resp_stream_fire_6;
  `ifndef SYNTHESIS
  reg [47:0] usercmd_user_ftype_string;
  reg [47:0] usercmd_user_ttype_string;
  `endif


  assign _zz_when_Intitaor_l46_1 = number_of_data_beats;
  assign _zz_when_Intitaor_l46 = {1'd0, _zz_when_Intitaor_l46_1};
  assign _zz_request_autocheck_error = srio_ftype_NREAD;
  assign _zz_request_autocheck_error_1 = srio_ttype_TWDATA;
  StreamFifo streamfifo_1 (
    .io_push_valid      (usercmd_user_data_valid            ), //i
    .io_push_ready      (streamfifo_1_io_push_ready         ), //o
    .io_push_payload    (usercmd_user_data_payload[63:0]    ), //i
    .io_pop_valid       (streamfifo_1_io_pop_valid          ), //o
    .io_pop_ready       (user_data_ready                    ), //i
    .io_pop_payload     (streamfifo_1_io_pop_payload[63:0]  ), //o
    .io_flush           (1'b0                               ), //i
    .io_occupancy       (streamfifo_1_io_occupancy[6:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[6:0]  ), //o
    .srio_clk_clk       (srio_clk_clk                       ), //i
    .txReset            (txReset                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(usercmd_user_ftype)
      SrioFtype_NREAD : usercmd_user_ftype_string = "NREAD ";
      SrioFtype_NWRITE : usercmd_user_ftype_string = "NWRITE";
      SrioFtype_SWRITE : usercmd_user_ftype_string = "SWRITE";
      SrioFtype_DOORB : usercmd_user_ftype_string = "DOORB ";
      SrioFtype_MESSG : usercmd_user_ftype_string = "MESSG ";
      SrioFtype_RESP : usercmd_user_ftype_string = "RESP  ";
      SrioFtype_FTYPE9 : usercmd_user_ftype_string = "FTYPE9";
      default : usercmd_user_ftype_string = "??????";
    endcase
  end
  always @(*) begin
    case(usercmd_user_ttype)
      SrioTtype_TNWR : usercmd_user_ttype_string = "TNWR  ";
      SrioTtype_TNWR_R : usercmd_user_ttype_string = "TNWR_R";
      SrioTtype_TNDATA : usercmd_user_ttype_string = "TNDATA";
      SrioTtype_TWDATA : usercmd_user_ttype_string = "TWDATA";
      default : usercmd_user_ttype_string = "??????";
    endcase
  end
  `endif

  assign s_axis_ireq_tkeep = 8'hff;
  assign s_axis_ireq_tuser = 32'h000000ff;
  assign usercmd_user_data_ready = streamfifo_1_io_push_ready;
  assign header_beat = {{{{{{{{usercmd_user_tid,usercmd_user_ftype},usercmd_user_ttype},1'b0},usercmd_user_prio},1'b0},usercmd_user_size},2'b00},usercmd_user_addr};
  assign intiator_intiator_req_stream_fire = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l32 = (intiator_intiator_req_stream_fire && s_axis_ireq_tlast);
  assign intiator_intiator_req_stream_fire_1 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign number_of_data_beats = usercmd_user_size[7 : 3];
  assign when_Intitaor_l44 = (((usercmd_user_ftype == SrioFtype_NREAD) || (usercmd_user_ftype == SrioFtype_DOORB)) && (current_beat_cnt == 6'h0));
  assign intiator_intiator_req_stream_fire_2 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign intiator_intiator_req_stream_fire_3 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l46 = ((current_beat_cnt == _zz_when_Intitaor_l46) && intiator_intiator_req_stream_fire_3);
  assign when_Intitaor_l48 = (! s_axis_ireq_tready);
  assign when_Intitaor_l50 = (s_axis_ireq_tready || (! s_axis_ireq_tvalid));
  assign s_axis_ireq_tlast = ireq_tlast;
  assign intiator_intiator_req_stream_fire_4 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l58 = ((current_beat_cnt == 6'h0) && (! intiator_intiator_req_stream_fire_4));
  assign s_axis_ireq_tdata = ireq_tdata;
  assign intiator_intiator_req_stream_fire_5 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l68 = (intiator_intiator_req_stream_fire_5 && s_axis_ireq_tlast);
  assign when_Intitaor_l71 = (send_start && (! send_start_d));
  assign s_axis_ireq_tvalid = ireq_tvalid;
  assign write_queue_data_d = {{{44'h0,usercmd_user_tid},usercmd_user_ftype},usercmd_user_size};
  assign intiator_intiator_req_stream_fire_6 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l85 = ((current_beat_cnt == 6'h0) && intiator_intiator_req_stream_fire_6);
  assign expected_tid = read_queue_data[19 : 12];
  assign expected_ftype = read_queue_data[11 : 8];
  assign expected_size = read_queue_data[7 : 0];
  assign intiator_intiator_resp_stream_fire = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l100 = (intiator_intiator_resp_stream_fire && m_axis_iresp_tlast);
  assign intiator_intiator_resp_stream_fire_1 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign intiator_intiator_resp_stream_fire_2 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l109 = (compare_received && intiator_intiator_resp_stream_fire_2);
  assign intiator_intiator_resp_stream_fire_3 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l119 = (intiator_intiator_resp_stream_fire_3 && m_axis_iresp_tlast);
  assign m_axis_iresp_tready = iresp_tready;
  assign intiator_intiator_resp_stream_fire_4 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l127 = ((compare_received && (expected_ftype == srio_ftype_NREAD)) && intiator_intiator_resp_stream_fire_4);
  assign intiator_intiator_resp_stream_fire_5 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l129 = (intiator_intiator_resp_stream_fire_5 && m_axis_iresp_tlast);
  assign iresp_stream_payload = m_axis_iresp_tdata;
  assign intiator_intiator_resp_stream_fire_6 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign iresp_stream_valid = (nread_iresp_write && intiator_intiator_resp_stream_fire_6);
  always @(posedge srio_clk_clk or posedge txReset) begin
    if(txReset) begin
      current_beat_cnt <= 6'h0;
      ireq_tlast <= 1'b0;
      user_data_ready <= 1'b0;
      ireq_tvalid <= 1'b0;
      send_start_d <= 1'b0;
      expecting_a_response <= 1'b0;
      compare_received <= 1'b1;
      request_autocheck_error <= 1'b0;
      iresp_tready <= 1'b0;
      nread_iresp_write <= 1'b0;
    end else begin
      if(when_Intitaor_l32) begin
        current_beat_cnt <= 6'h0;
      end else begin
        if(intiator_intiator_req_stream_fire_1) begin
          current_beat_cnt <= (current_beat_cnt + 6'h01);
        end else begin
          current_beat_cnt <= current_beat_cnt;
        end
      end
      if(when_Intitaor_l44) begin
        ireq_tlast <= (! (intiator_intiator_req_stream_fire_2 && s_axis_ireq_tlast));
      end else begin
        if(when_Intitaor_l46) begin
          ireq_tlast <= (! ireq_tlast);
        end else begin
          if(when_Intitaor_l48) begin
            ireq_tlast <= ireq_tlast;
          end else begin
            if(when_Intitaor_l50) begin
              ireq_tlast <= 1'b0;
            end else begin
              ireq_tlast <= ireq_tlast;
            end
          end
        end
      end
      send_start_d <= send_start;
      if(when_Intitaor_l68) begin
        ireq_tvalid <= 1'b0;
        user_data_ready <= 1'b0;
      end else begin
        if(when_Intitaor_l71) begin
          ireq_tvalid <= 1'b1;
          user_data_ready <= 1'b1;
        end else begin
          ireq_tvalid <= ireq_tvalid;
          user_data_ready <= user_data_ready;
        end
      end
      if(when_Intitaor_l85) begin
        expecting_a_response <= ((((usercmd_user_ftype == SrioFtype_NREAD) || (usercmd_user_ftype == SrioFtype_DOORB)) || ((usercmd_user_ftype == SrioFtype_NWRITE) && (usercmd_user_ttype == SrioTtype_TNWR_R))) || (usercmd_user_ftype == SrioFtype_MESSG));
      end else begin
        expecting_a_response <= 1'b0;
      end
      if(when_Intitaor_l100) begin
        compare_received <= 1'b1;
      end else begin
        if(intiator_intiator_resp_stream_fire_1) begin
          compare_received <= 1'b0;
        end else begin
          compare_received <= compare_received;
        end
      end
      if(when_Intitaor_l109) begin
        request_autocheck_error <= ((((expected_tid != m_axis_iresp_tdata[63 : 56]) || ((expected_ftype == _zz_request_autocheck_error) && (m_axis_iresp_tdata[51 : 48] != _zz_request_autocheck_error_1))) || ((expected_ftype == srio_ftype_NWRITE) && (m_axis_iresp_tdata[51 : 48] != srio_ttype_TNDATA))) || ((expected_ftype == srio_ftype_DOORB) && (m_axis_iresp_tdata[51 : 48] != srio_ttype_TNDATA)));
      end else begin
        request_autocheck_error <= 1'b0;
      end
      if(when_Intitaor_l119) begin
        iresp_tready <= 1'b0;
      end else begin
        iresp_tready <= 1'b1;
      end
      if(when_Intitaor_l127) begin
        nread_iresp_write <= 1'b1;
      end else begin
        if(when_Intitaor_l129) begin
          nread_iresp_write <= 1'b0;
        end else begin
          nread_iresp_write <= nread_iresp_write;
        end
      end
    end
  end

  always @(posedge srio_clk_clk) begin
    if(when_Intitaor_l58) begin
      ireq_tdata <= header_beat;
    end else begin
      ireq_tdata <= streamfifo_1_io_pop_payload;
    end
    write_queue_data <= write_queue_data_d;
    if(expecting_a_response) begin
      read_queue_data <= write_queue_data;
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
  output     [6:0]    io_pushOccupancy,
  output     [6:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               ctrl_flush,
  input               srio_clk_clk,
  input               txReset
);

  reg        [63:0]   _zz_ram_port1;
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
  reg [63:0] ram [0:63];

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

  always @(posedge srio_clk_clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_2 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[6:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[6:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   ), //i
    .ctrl_flush    (ctrl_flush                              )  //i
  );
  BufferCC_3 pushToPopGray_buffercc (
    .io_dataIn       (pushToPopGray[6:0]                      ), //i
    .io_dataOut      (pushToPopGray_buffercc_io_dataOut[6:0]  ), //o
    .srio_clk_clk    (srio_clk_clk                            ), //i
    .txReset         (txReset                                 )  //i
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
    end else begin
      if(ctrl_flush) begin
      pushCC_pushPtr <= 7'h0;
      pushCC_pushPtrGray <= 7'h0;
      end else begin
        if(io_push_fire) begin
          pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
        end
        if(io_push_fire_1) begin
          pushCC_pushPtr <= pushCC_pushPtrPlus;
        end
      end
    end
  end

  always @(posedge srio_clk_clk or posedge txReset) begin
    if(txReset) begin
      popCC_popPtr <= 7'h0;
      popCC_popPtrGray <= 7'h0;
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

module Tx_Buffer_Adapt (
  input               push_stream_valid,
  output              push_stream_ready,
  input      [15:0]   push_stream_payload,
  output              pop_stream_valid,
  input               pop_stream_ready,
  output     [63:0]   pop_stream_payload,
  input               clk,
  input               reset,
  input               ctrl_flush
);

  wire                area_fifo_io_push_valid;
  wire       [63:0]   area_fifo_io_push_payload;
  wire                area_fifo_io_push_ready;
  wire                area_fifo_io_pop_valid;
  wire       [63:0]   area_fifo_io_pop_payload;
  wire       [3:0]    area_fifo_io_pushOccupancy;
  wire       [3:0]    area_fifo_io_popOccupancy;
  wire       [1:0]    _zz__zz_push_stream_ready_1;
  wire       [0:0]    _zz__zz_push_stream_ready_1_1;
  wire       [31:0]   _zz__zz_io_push_payload;
  wire                push_stream_fire;
  reg                 _zz_push_stream_ready;
  reg        [1:0]    _zz_push_stream_ready_1;
  reg        [1:0]    _zz_push_stream_ready_2;
  wire                _zz_push_stream_ready_3;
  reg        [47:0]   _zz_io_push_payload;
  wire                push_stream_fire_1;

  assign _zz__zz_push_stream_ready_1_1 = _zz_push_stream_ready;
  assign _zz__zz_push_stream_ready_1 = {1'd0, _zz__zz_push_stream_ready_1_1};
  assign _zz__zz_io_push_payload = (_zz_io_push_payload >>> 16);
  StreamFifoCC area_fifo (
    .io_push_valid       (area_fifo_io_push_valid          ), //i
    .io_push_ready       (area_fifo_io_push_ready          ), //o
    .io_push_payload     (area_fifo_io_push_payload[63:0]  ), //i
    .io_pop_valid        (area_fifo_io_pop_valid           ), //o
    .io_pop_ready        (pop_stream_ready                 ), //i
    .io_pop_payload      (area_fifo_io_pop_payload[63:0]   ), //o
    .io_pushOccupancy    (area_fifo_io_pushOccupancy[3:0]  ), //o
    .io_popOccupancy     (area_fifo_io_popOccupancy[3:0]   ), //o
    .clk                 (clk                              ), //i
    .reset               (reset                            ), //i
    .ctrl_flush          (ctrl_flush                       )  //i
  );
  assign push_stream_fire = (push_stream_valid && push_stream_ready);
  always @(*) begin
    _zz_push_stream_ready = 1'b0;
    if(push_stream_fire) begin
      _zz_push_stream_ready = 1'b1;
    end
  end

  assign _zz_push_stream_ready_3 = (_zz_push_stream_ready_2 == 2'b11);
  always @(*) begin
    _zz_push_stream_ready_1 = (_zz_push_stream_ready_2 + _zz__zz_push_stream_ready_1);
    if(1'b0) begin
      _zz_push_stream_ready_1 = 2'b00;
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
      _zz_push_stream_ready_2 <= 2'b00;
    end else begin
      if(ctrl_flush) begin
      _zz_push_stream_ready_2 <= 2'b00;
      end else begin
        _zz_push_stream_ready_2 <= _zz_push_stream_ready_1;
      end
    end
  end

  always @(posedge clk) begin
    if(push_stream_fire_1) begin
      _zz_io_push_payload <= {push_stream_payload,_zz__zz_io_push_payload};
    end
  end


endmodule

module BufferCC_4 (
  input               io_dataIn,
  output              io_dataOut,
  input               srio_clk_clk,
  input               _zz_1
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk_clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
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
  input               srio_clk_clk,
  input               txReset
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
  wire                when_Stream_l946;
  wire       [5:0]    logic_ptrDif;
  reg [63:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge srio_clk_clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge srio_clk_clk) begin
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
  assign when_Stream_l946 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge srio_clk_clk or posedge txReset) begin
    if(txReset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l946) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module BufferCC_3 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               srio_clk_clk,
  input               txReset
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge srio_clk_clk or posedge txReset) begin
    if(txReset) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_2 (
  input      [6:0]    io_dataIn,
  output     [6:0]    io_dataOut,
  input               clk,
  input               reset,
  input               ctrl_flush
);

  (* async_reg = "true" *) reg        [6:0]    buffers_0;
  (* async_reg = "true" *) reg        [6:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
    end else begin
      if(ctrl_flush) begin
      buffers_0 <= 7'h0;
      buffers_1 <= 7'h0;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
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
  output     [3:0]    io_pushOccupancy,
  output     [3:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               ctrl_flush
);

  reg        [63:0]   _zz_ram_port1;
  wire       [3:0]    popToPushGray_buffercc_io_dataOut;
  wire       [3:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [3:0]    _zz_pushCC_pushPtrGray;
  wire       [2:0]    _zz_ram_port;
  wire       [3:0]    _zz_popCC_popPtrGray;
  wire       [2:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [2:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [3:0]    popToPushGray;
  wire       [3:0]    pushToPopGray;
  reg        [3:0]    pushCC_pushPtr;
  wire       [3:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [3:0]    pushCC_pushPtrGray;
  wire       [3:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  reg        [3:0]    popCC_popPtr;
  wire       [3:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [3:0]    popCC_popPtrGray;
  wire       [3:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [3:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  reg [63:0] ram [0:7];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[2:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[2:0];
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

  BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[3:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[3:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   ), //i
    .ctrl_flush    (ctrl_flush                              )  //i
  );
  BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray[3:0]                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut[3:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   ), //i
    .ctrl_flush    (ctrl_flush                              )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 4'b0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[3 : 2] == (~ pushCC_popPtrGray[3 : 2])) && (pushCC_pushPtrGray[1 : 0] == pushCC_popPtrGray[1 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = pushCC_popPtrGray[3];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 4'b0001);
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
  assign _zz_io_popOccupancy_2 = popCC_pushPtrGray[3];
  assign io_popOccupancy = ({_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushCC_pushPtr <= 4'b0000;
      pushCC_pushPtrGray <= 4'b0000;
      popCC_popPtr <= 4'b0000;
      popCC_popPtrGray <= 4'b0000;
    end else begin
      if(ctrl_flush) begin
      pushCC_pushPtr <= 4'b0000;
      pushCC_pushPtrGray <= 4'b0000;
      popCC_popPtr <= 4'b0000;
      popCC_popPtrGray <= 4'b0000;
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

//BufferCC replaced by BufferCC

module BufferCC (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               clk,
  input               reset,
  input               ctrl_flush
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      if(ctrl_flush) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
      end else begin
        buffers_0 <= io_dataIn;
        buffers_1 <= buffers_0;
      end
    end
  end


endmodule
