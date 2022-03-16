// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : SrioResponse
// Git hash  : 1d7d59401b86b42deedb807f9591ae65cc74e9dc


`define srio_ftype__type [3:0]
`define srio_ftype__NREAD 4'b0010
`define srio_ftype__NWRITE 4'b0101
`define srio_ftype__SWRITE 4'b0110
`define srio_ftype__DOORB 4'b1010
`define srio_ftype__MESSG 4'b1011
`define srio_ftype__RESP 4'b1101

`define srio_ttype__type [3:0]
`define srio_ttype__TNWR 4'b0100
`define srio_ttype__TNWR_R 4'b0101
`define srio_ttype__TNDATA 4'b0000
`define srio_ttype__TWDATA 4'b1000


module SrioResponse (
  output              tresp_valid,
  input               tresp_ready,
  output              tresp_payload_last,
  output     [63:0]   tresp_payload_fragment,
  output     [7:0]    tresp_tkeep,
  input               treq_valid,
  output              treq_ready,
  input               treq_payload_last,
  input      [63:0]   treq_payload_fragment,
  input      [31:0]   treq_tuser,
  output     [31:0]   tresp_tuser,
  input      [15:0]   deviceid,
  input      [15:0]   source_id,
  input               clk,
  input               reset
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
  wire                when_SrioResponse_l60;
  wire                treq_fire_1;
  reg                 generate_a_response;
  wire                treq_fire_2;
  wire                when_SrioResponse_l69;
  reg                 capture_data;
  wire                treq_fire_3;
  wire                when_SrioResponse_l79;
  wire                treq_fire_4;
  wire                when_SrioResponse_l81;
  wire                treq_fire_5;
  wire                data_store_wen;
  reg        [7:0]    data_store_waddr;
  wire                treq_fire_6;
  wire                when_SrioResponse_l90;
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
  wire                when_SrioResponse_l115;
  wire                tresp_fire;
  wire                when_SrioResponse_l121;
  wire                tresp_fire_1;
  reg                 tresp_tlast;
  wire                when_SrioResponse_l130;
  wire                tresp_fire_2;
  wire                tresp_fire_3;
  wire                when_SrioResponse_l132;
  wire                when_SrioResponse_l134;
  reg        [7:0]    data_store_raddr;
  wire                tresp_fire_4;
  wire                when_SrioResponse_l142;
  wire                tresp_fire_5;
  wire                when_SrioResponse_l144;
  reg                 generate_rsp;
  reg                 generate_rsp_d;
  reg                 pull_from_store_d;
  wire                when_SrioResponse_l153;
  reg                 tresp_tvalid;
  wire                when_SrioResponse_l162;
  wire                tresp_fire_6;
  wire                when_SrioResponse_l164;
  wire       [63:0]   header_beat;
  reg        [63:0]   tresp_tdata;
  reg        [63:0]   data_store_dout;
  wire                tresp_fire_7;
  wire                when_SrioResponse_l179;
  wire       [7:0]    _zz_tresp_tdata;
  wire                tresp_fire_8;
  wire                when_SrioResponse_l181;
  `ifndef SYNTHESIS
  reg [47:0] responding_ttype_string;
  `endif

  (* ram_style = "block" , ram_style = "distributed" *) reg [63:0] rspmem [0:255];

  assign _zz_data_store_waddr = (data_store_waddr + 8'h01);
  assign _zz_number_of_data_beats = response_size[7 : 3];
  assign _zz_data_store_raddr = (data_store_raddr + 8'h01);
  assign _zz_rspmem_port = data_store_waddr;
  always @(posedge clk) begin
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

  assign tresp_tuser = {source_id,deviceid};
  assign tresp_tkeep = 8'hff;
  assign current_tid = treq_payload_fragment[63 : 56];
  assign current_ftype = treq_payload_fragment[55 : 52];
  assign current_ttype = treq_payload_fragment[51 : 48];
  assign current_size = treq_payload_fragment[43 : 36];
  assign current_prio = (treq_payload_fragment[46 : 45] + 2'b01);
  assign current_addr = treq_payload_fragment[33 : 0];
  assign current_srcid = treq_tuser[31 : 16];
  assign response_data_in_d = {{{{{current_srcid,current_addr[7 : 0]},current_prio},current_tid},current_ftype},current_size};
  assign treq_fire = (treq_valid && treq_ready);
  assign when_SrioResponse_l60 = (treq_fire && treq_payload_last);
  assign treq_fire_1 = (treq_valid && treq_ready);
  assign treq_fire_2 = (treq_valid && treq_ready);
  assign when_SrioResponse_l69 = (first_beat && treq_fire_2);
  assign treq_fire_3 = (treq_valid && treq_ready);
  assign when_SrioResponse_l79 = (first_beat && treq_fire_3);
  assign treq_fire_4 = (treq_valid && treq_ready);
  assign when_SrioResponse_l81 = (treq_fire_4 && treq_payload_last);
  assign treq_fire_5 = (treq_valid && treq_ready);
  assign data_store_wen = (capture_data && treq_fire_5);
  assign treq_fire_6 = (treq_valid && treq_ready);
  assign when_SrioResponse_l90 = (first_beat && treq_fire_6);
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
  assign when_SrioResponse_l115 = (current_beat_cnt == 6'h0);
  assign tresp_fire = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l121 = (tresp_fire && tresp_payload_last);
  assign tresp_fire_1 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l130 = (responding_ttype == `srio_ttype__TNDATA);
  assign tresp_fire_2 = (tresp_valid && tresp_ready);
  assign tresp_fire_3 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l132 = ((current_beat_cnt == number_of_data_beats) && tresp_fire_3);
  assign when_SrioResponse_l134 = (tresp_ready || (! tresp_valid));
  assign tresp_payload_last = tresp_tlast;
  assign tresp_fire_4 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l142 = ((pull_from_store && (current_beat_cnt == 6'h0)) && (! tresp_fire_4));
  assign tresp_fire_5 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l144 = (pull_from_store && tresp_fire_5);
  assign when_SrioResponse_l153 = (generate_rsp_d && (current_beat_cnt == 6'h0));
  assign when_SrioResponse_l162 = (pull_from_store_d && (current_beat_cnt == 6'h0));
  assign tresp_fire_6 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l164 = (tresp_fire_6 && tresp_payload_last);
  assign tresp_valid = tresp_tvalid;
  assign header_beat = {{{{{response_tid,`srio_ftype__RESP},responding_ttype},1'b0},response_prio},45'h0};
  assign tresp_fire_7 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l179 = ((current_beat_cnt == 6'h0) && (! tresp_fire_7));
  assign _zz_tresp_tdata = data_store_raddr;
  assign tresp_fire_8 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l181 = (pull_from_store && tresp_fire_8);
  assign tresp_payload_fragment = tresp_tdata;
  always @(posedge clk) begin
    response_data_in <= response_data_in_d;
    if(when_SrioResponse_l115) begin
      number_of_data_beats <= {1'd0, _zz_number_of_data_beats};
    end else begin
      number_of_data_beats <= number_of_data_beats;
    end
    if(when_SrioResponse_l179) begin
      tresp_tdata <= header_beat;
    end else begin
      if(when_SrioResponse_l181) begin
        tresp_tdata <= _zz_rspmem_port1;
      end else begin
        tresp_tdata <= tresp_tdata;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
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
      if(when_SrioResponse_l60) begin
        first_beat <= 1'b1;
      end else begin
        if(treq_fire_1) begin
          first_beat <= 1'b0;
        end else begin
          first_beat <= first_beat;
        end
      end
      if(when_SrioResponse_l69) begin
        generate_a_response <= ((((current_ftype == `srio_ftype__NREAD) || (current_ftype == `srio_ftype__DOORB)) || (current_ftype == `srio_ftype__MESSG)) || ((current_ftype == `srio_ftype__NWRITE) && (current_ttype == `srio_ttype__TNWR_R)));
      end else begin
        generate_a_response <= 1'b0;
      end
      if(when_SrioResponse_l79) begin
        capture_data <= ((current_ftype == `srio_ftype__SWRITE) || (current_ftype == `srio_ftype__NWRITE));
      end else begin
        if(when_SrioResponse_l81) begin
          capture_data <= 1'b0;
        end else begin
          capture_data <= capture_data;
        end
      end
      if(when_SrioResponse_l90) begin
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
      if(when_SrioResponse_l121) begin
        current_beat_cnt <= 6'h0;
      end else begin
        if(tresp_fire_1) begin
          current_beat_cnt <= (current_beat_cnt + 6'h01);
        end else begin
          current_beat_cnt <= current_beat_cnt;
        end
      end
      if(when_SrioResponse_l130) begin
        tresp_tlast <= (! (tresp_fire_2 && tresp_payload_last));
      end else begin
        if(when_SrioResponse_l132) begin
          tresp_tlast <= (! tresp_tlast);
        end else begin
          if(when_SrioResponse_l134) begin
            tresp_tlast <= 1'b0;
          end else begin
            tresp_tlast <= tresp_tlast;
          end
        end
      end
      if(when_SrioResponse_l142) begin
        data_store_raddr <= starting_read_addr;
      end else begin
        if(when_SrioResponse_l144) begin
          data_store_raddr <= _zz_data_store_raddr;
        end
      end
      generate_rsp <= generate_a_response;
      generate_rsp_d <= generate_rsp;
      if(when_SrioResponse_l153) begin
        pull_from_store_d <= 1'b1;
      end else begin
        if(tresp_payload_last) begin
          pull_from_store_d <= 1'b0;
        end else begin
          pull_from_store_d <= pull_from_store_d;
        end
      end
      if(when_SrioResponse_l162) begin
        tresp_tvalid <= 1'b1;
      end else begin
        if(when_SrioResponse_l164) begin
          tresp_tvalid <= 1'b0;
        end else begin
          tresp_tvalid <= tresp_tvalid;
        end
      end
    end
  end


endmodule
