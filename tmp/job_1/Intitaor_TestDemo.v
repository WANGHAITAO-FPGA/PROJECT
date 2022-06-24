// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Intitaor_TestDemo
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module Intitaor_TestDemo (
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
  output              iresp_stream_valid,
  input               iresp_stream_ready,
  output     [63:0]   iresp_stream_payload,
  input               clk,
  input               reset
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

  wire       [33:0]   intitaor_test_1_usercmd_user_addr;
  wire       [3:0]    intitaor_test_1_usercmd_user_ftype;
  wire       [3:0]    intitaor_test_1_usercmd_user_ttype;
  wire       [7:0]    intitaor_test_1_usercmd_user_size;
  wire       [1:0]    intitaor_test_1_usercmd_user_prio;
  wire       [7:0]    intitaor_test_1_usercmd_user_tid;
  wire                intitaor_test_1_usercmd_user_data_valid;
  wire       [63:0]   intitaor_test_1_usercmd_user_data_payload;
  wire                intitaor_test_1_send_start;
  wire                intitaor_1_s_axis_ireq_tvalid;
  wire                intitaor_1_s_axis_ireq_tlast;
  wire       [63:0]   intitaor_1_s_axis_ireq_tdata;
  wire       [7:0]    intitaor_1_s_axis_ireq_tkeep;
  wire       [31:0]   intitaor_1_s_axis_ireq_tuser;
  wire                intitaor_1_m_axis_iresp_tready;
  wire                intitaor_1_usercmd_user_data_ready;
  wire                intitaor_1_iresp_stream_valid;
  wire       [63:0]   intitaor_1_iresp_stream_payload;

  Intitaor_Test intitaor_test_1 (
    .usercmd_user_addr            (intitaor_test_1_usercmd_user_addr[33:0]          ), //o
    .usercmd_user_ftype           (intitaor_test_1_usercmd_user_ftype[3:0]          ), //o
    .usercmd_user_ttype           (intitaor_test_1_usercmd_user_ttype[3:0]          ), //o
    .usercmd_user_size            (intitaor_test_1_usercmd_user_size[7:0]           ), //o
    .usercmd_user_prio            (intitaor_test_1_usercmd_user_prio[1:0]           ), //o
    .usercmd_user_tid             (intitaor_test_1_usercmd_user_tid[7:0]            ), //o
    .usercmd_user_data_valid      (intitaor_test_1_usercmd_user_data_valid          ), //o
    .usercmd_user_data_ready      (intitaor_1_usercmd_user_data_ready               ), //i
    .usercmd_user_data_payload    (intitaor_test_1_usercmd_user_data_payload[63:0]  ), //o
    .send_start                   (intitaor_test_1_send_start                       ), //o
    .clk                          (clk                                              ), //i
    .reset                        (reset                                            )  //i
  );
  Intitaor intitaor_1 (
    .s_axis_ireq_tvalid           (intitaor_1_s_axis_ireq_tvalid                    ), //o
    .s_axis_ireq_tready           (s_axis_ireq_tready                               ), //i
    .s_axis_ireq_tlast            (intitaor_1_s_axis_ireq_tlast                     ), //o
    .s_axis_ireq_tdata            (intitaor_1_s_axis_ireq_tdata[63:0]               ), //o
    .s_axis_ireq_tkeep            (intitaor_1_s_axis_ireq_tkeep[7:0]                ), //o
    .s_axis_ireq_tuser            (intitaor_1_s_axis_ireq_tuser[31:0]               ), //o
    .m_axis_iresp_tvalid          (m_axis_iresp_tvalid                              ), //i
    .m_axis_iresp_tready          (intitaor_1_m_axis_iresp_tready                   ), //o
    .m_axis_iresp_tlast           (m_axis_iresp_tlast                               ), //i
    .m_axis_iresp_tdata           (m_axis_iresp_tdata[63:0]                         ), //i
    .m_axis_iresp_tkeep           (m_axis_iresp_tkeep[7:0]                          ), //i
    .m_axis_iresp_tuser           (m_axis_iresp_tuser[31:0]                         ), //i
    .usercmd_user_addr            (intitaor_test_1_usercmd_user_addr[33:0]          ), //i
    .usercmd_user_ftype           (intitaor_test_1_usercmd_user_ftype[3:0]          ), //i
    .usercmd_user_ttype           (intitaor_test_1_usercmd_user_ttype[3:0]          ), //i
    .usercmd_user_size            (intitaor_test_1_usercmd_user_size[7:0]           ), //i
    .usercmd_user_prio            (intitaor_test_1_usercmd_user_prio[1:0]           ), //i
    .usercmd_user_tid             (intitaor_test_1_usercmd_user_tid[7:0]            ), //i
    .usercmd_user_data_valid      (intitaor_test_1_usercmd_user_data_valid          ), //i
    .usercmd_user_data_ready      (intitaor_1_usercmd_user_data_ready               ), //o
    .usercmd_user_data_payload    (intitaor_test_1_usercmd_user_data_payload[63:0]  ), //i
    .send_start                   (intitaor_test_1_send_start                       ), //i
    .iresp_stream_valid           (intitaor_1_iresp_stream_valid                    ), //o
    .iresp_stream_ready           (iresp_stream_ready                               ), //i
    .iresp_stream_payload         (intitaor_1_iresp_stream_payload[63:0]            ), //o
    .clk                          (clk                                              ), //i
    .reset                        (reset                                            )  //i
  );
  assign s_axis_ireq_tvalid = intitaor_1_s_axis_ireq_tvalid;
  assign s_axis_ireq_tlast = intitaor_1_s_axis_ireq_tlast;
  assign s_axis_ireq_tdata = intitaor_1_s_axis_ireq_tdata;
  assign s_axis_ireq_tkeep = intitaor_1_s_axis_ireq_tkeep;
  assign s_axis_ireq_tuser = intitaor_1_s_axis_ireq_tuser;
  assign m_axis_iresp_tready = intitaor_1_m_axis_iresp_tready;
  assign iresp_stream_valid = intitaor_1_iresp_stream_valid;
  assign iresp_stream_payload = intitaor_1_iresp_stream_payload;

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
  input               clk,
  input               reset
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
  wire       [8:0]    streamfifo_1_io_occupancy;
  wire       [8:0]    streamfifo_1_io_availability;
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
    .io_occupancy       (streamfifo_1_io_occupancy[8:0]     ), //o
    .io_availability    (streamfifo_1_io_availability[8:0]  ), //o
    .clk                (clk                                ), //i
    .reset              (reset                              )  //i
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
  assign s_axis_ireq_tuser = 32'h00550054;
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
  always @(posedge clk or posedge reset) begin
    if(reset) begin
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

  always @(posedge clk) begin
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

module Intitaor_Test (
  output     [33:0]   usercmd_user_addr,
  output     [3:0]    usercmd_user_ftype,
  output     [3:0]    usercmd_user_ttype,
  output     [7:0]    usercmd_user_size,
  output     [1:0]    usercmd_user_prio,
  output     [7:0]    usercmd_user_tid,
  output              usercmd_user_data_valid,
  input               usercmd_user_data_ready,
  output     [63:0]   usercmd_user_data_payload,
  output              send_start,
  input               clk,
  input               reset
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

  reg                 timer_1_io_clear;
  wire                timer_1_io_full;
  wire       [31:0]   timer_1_io_value;
  wire                when_Intitaor_l150;
  reg                 send_start_1;
  `ifndef SYNTHESIS
  reg [47:0] usercmd_user_ftype_string;
  reg [47:0] usercmd_user_ttype_string;
  `endif


  Timer timer_1 (
    .io_tick     (1'b1                    ), //i
    .io_clear    (timer_1_io_clear        ), //i
    .io_limit    (32'h000001f4            ), //i
    .io_full     (timer_1_io_full         ), //o
    .io_value    (timer_1_io_value[31:0]  ), //o
    .clk         (clk                     ), //i
    .reset       (reset                   )  //i
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

  assign when_Intitaor_l150 = (32'h000001f4 <= timer_1_io_value);
  always @(*) begin
    if(when_Intitaor_l150) begin
      timer_1_io_clear = 1'b1;
    end else begin
      timer_1_io_clear = 1'b0;
    end
  end

  assign usercmd_user_ftype = SrioFtype_NREAD;
  assign usercmd_user_prio = 2'b01;
  assign usercmd_user_size = 8'h08;
  assign usercmd_user_tid = 8'h0a;
  assign usercmd_user_ttype = SrioTtype_TNWR_R;
  assign usercmd_user_addr = 34'h000000032;
  assign usercmd_user_data_valid = 1'b0;
  assign usercmd_user_data_payload = 64'h0;
  assign send_start = send_start_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      send_start_1 <= 1'b0;
    end else begin
      send_start_1 <= 1'b0;
      if(timer_1_io_full) begin
        send_start_1 <= 1'b1;
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
  output     [8:0]    io_occupancy,
  output     [8:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [7:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [7:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [7:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [7:0]    logic_pushPtr_valueNext;
  reg        [7:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [7:0]    logic_popPtr_valueNext;
  reg        [7:0]    logic_popPtr_value;
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
  wire       [7:0]    logic_ptrDif;
  reg [63:0] logic_ram [0:255];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {7'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {7'd0, _zz_logic_popPtr_valueNext_1};
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

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 8'hff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 8'h0;
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

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 8'hff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 8'h0;
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
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 8'h0;
      logic_popPtr_value <= 8'h0;
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

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               clk,
  input               reset
);

  wire       [31:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [31:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {31'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
    end
  end


endmodule
