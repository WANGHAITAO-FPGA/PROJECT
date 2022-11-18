// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : SrioResponse
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

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
  input               clk,
  input               reset
);
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
  wire       [3:0]    responding_ttype;
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
  always @(posedge clk) begin
    if(data_store_wen) begin
      rspmem[_zz_rspmem_port] <= treq_payload_fragment;
    end
  end

  assign _zz_rspmem_port1 = rspmem[_zz_tresp_tdata];
  `ifndef SYNTHESIS
  always @(*) begin
    case(responding_ttype)
      srio_ttype_TNWR : responding_ttype_string = "TNWR  ";
      srio_ttype_TNWR_R : responding_ttype_string = "TNWR_R";
      srio_ttype_TNDATA : responding_ttype_string = "TNDATA";
      srio_ttype_TWDATA : responding_ttype_string = "TWDATA";
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
  assign pull_from_store = ((response_ftype == srio_ftype_NREAD) ? 1'b1 : 1'b0);
  assign responding_ttype = ((response_ftype == srio_ftype_NREAD) ? srio_ttype_TWDATA : srio_ttype_TNDATA);
  assign when_SrioResponse_l109 = (current_beat_cnt == 6'h0);
  assign tresp_fire = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l115 = (tresp_fire && tresp_payload_last);
  assign tresp_fire_1 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l124 = (responding_ttype == srio_ttype_TNDATA);
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
  assign header_beat = {{{{{response_tid,srio_ftype_RESP},responding_ttype},1'b0},response_prio},45'h0};
  assign tresp_fire_7 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l173 = ((current_beat_cnt == 6'h0) && (! tresp_fire_7));
  assign _zz_tresp_tdata = data_store_raddr;
  assign tresp_fire_8 = (tresp_valid && tresp_ready);
  assign when_SrioResponse_l175 = (pull_from_store && tresp_fire_8);
  assign tresp_payload_fragment = tresp_tdata;
  always @(posedge clk) begin
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
        generate_a_response <= ((((current_ftype == srio_ftype_NREAD) || (current_ftype == srio_ftype_DOORB)) || (current_ftype == srio_ftype_MESSG)) || ((current_ftype == srio_ftype_NWRITE) && (current_ttype == srio_ttype_TNWR_R)));
      end else begin
        generate_a_response <= 1'b0;
      end
      if(when_SrioResponse_l73) begin
        capture_data <= ((current_ftype == srio_ftype_SWRITE) || (current_ftype == srio_ftype_NWRITE));
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
