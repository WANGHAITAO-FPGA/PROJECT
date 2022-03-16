// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : SrioRequest
// Git hash  : 1d7d59401b86b42deedb807f9591ae65cc74e9dc


`define srio_ftype__type [3:0]
`define srio_ftype__NREAD 4'b0010
`define srio_ftype__NWRITE 4'b0101
`define srio_ftype__SWRITE 4'b0110
`define srio_ftype__DOORB 4'b1010
`define srio_ftype__MESSG 4'b1011
`define srio_ftype__RESP 4'b1101
`define srio_ftype__FTYPE9 4'b1001


module SrioRequest (
  output              ireq_valid,
  input               ireq_ready,
  output              ireq_payload_last,
  output     [63:0]   ireq_payload_fragment,
  input      [33:0]   user_addr,
  input      [3:0]    user_ftype,
  input      [3:0]    user_ttype,
  input      [7:0]    user_size,
  input      [1:0]    user_prio,
  input      [7:0]    user_tid,
  input      [63:0]   user_data,
  input               send_start,
  input               clk,
  input               reset
);
  wire       [5:0]    _zz_when_SrioRequest_l48;
  wire       [4:0]    _zz_when_SrioRequest_l48_1;
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
  wire                when_SrioRequest_l62;
  reg                 ireq_tvalid;
  reg                 send_start_d;
  wire                ireq_fire_5;
  wire                when_SrioRequest_l71;
  wire                when_SrioRequest_l73;

  assign _zz_when_SrioRequest_l48_1 = number_of_data_beats;
  assign _zz_when_SrioRequest_l48 = {1'd0, _zz_when_SrioRequest_l48_1};
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
  assign when_SrioRequest_l62 = ((current_beat_cnt == 6'h0) && (! ireq_fire_4));
  assign ireq_payload_fragment = ireq_tdata;
  assign ireq_fire_5 = (ireq_valid && ireq_ready);
  assign when_SrioRequest_l71 = (ireq_fire_5 && ireq_payload_last);
  assign when_SrioRequest_l73 = (send_start && (! send_start_d));
  assign ireq_valid = ireq_tvalid;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      current_beat_cnt <= 6'h0;
      ireq_tlast <= 1'b0;
      ireq_tvalid <= 1'b0;
      send_start_d <= 1'b0;
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
      if(when_SrioRequest_l71) begin
        ireq_tvalid <= 1'b0;
      end else begin
        if(when_SrioRequest_l73) begin
          ireq_tvalid <= 1'b1;
        end else begin
          ireq_tvalid <= ireq_tvalid;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(when_SrioRequest_l62) begin
      ireq_tdata <= header_beat;
    end else begin
      ireq_tdata <= user_data;
    end
  end


endmodule
