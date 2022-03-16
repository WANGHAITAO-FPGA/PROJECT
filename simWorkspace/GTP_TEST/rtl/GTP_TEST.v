// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : GTP_TEST

`timescale 1ns/1ps 

module GTP_TEST (
  input               log_rst_q,
  input               log_clk,
  output     [31:0]   s_axi_tx_tdata,
  output              s_axi_tx_tlast,
  output              s_axi_tx_tvalid,
  input               s_axi_tx_tready
);

  reg                 gtx_area_timer_B_io_clear;
  wire                gtx_area_gtxtest_tx_packet_req;
  wire       [31:0]   gtx_area_gtxtest_tx_packet_data;
  reg        [31:0]   _zz_gtx_area_mem_port0;
  wire                gtx_area_timer_B_io_full;
  wire       [31:0]   gtx_area_timer_B_io_value;
  wire       [31:0]   gtx_area_gtxtest_s_axi_tx_tdata;
  wire       [3:0]    gtx_area_gtxtest_s_axi_tx_tkeep;
  wire                gtx_area_gtxtest_s_axi_tx_tlast;
  wire                gtx_area_gtxtest_s_axi_tx_tvalid;
  wire       [31:0]   gtx_area_gtxtest_crc_data;
  wire       [7:0]    gtx_area_gtxtest_tx_packet_addra;
  wire                gtx_area_gtxtest_tx_packet_rden;
  wire                when_GTX_TEST_l45;
  reg                 gtx_area_timer_B_io_full_delay_1;
  reg                 gtx_area_timer_B_io_full_delay_1_1;
  reg                 gtx_area_timer_B_io_full_delay_2;
  reg                 gtx_area_timer_B_io_full_delay_1_2;
  reg                 gtx_area_timer_B_io_full_delay_2_1;
  reg                 gtx_area_timer_B_io_full_delay_3;
  wire       [7:0]    _zz_tx_packet_data;
  wire                _zz_tx_packet_data_1;
  (* ram_style = "block" *) reg [31:0] gtx_area_mem [0:255];

  initial begin
    $readmemb("GTP_TEST.v_toplevel_gtx_area_mem.bin",gtx_area_mem);
  end
  always @(posedge log_clk) begin
    if(_zz_tx_packet_data_1) begin
      _zz_gtx_area_mem_port0 <= gtx_area_mem[_zz_tx_packet_data];
    end
  end

  Timer gtx_area_timer_B (
    .io_tick      (1'b1                             ), //i
    .io_clear     (gtx_area_timer_B_io_clear        ), //i
    .io_limit     (32'h000001f4                     ), //i
    .io_full      (gtx_area_timer_B_io_full         ), //o
    .io_value     (gtx_area_timer_B_io_value[31:0]  ), //o
    .log_clk      (log_clk                          ), //i
    .log_rst_q    (log_rst_q                        )  //i
  );
  gtp_tx gtx_area_gtxtest (
    .log_rst_q            (log_rst_q                              ), //i
    .log_clk              (log_clk                                ), //i
    .s_axi_tx_tdata       (gtx_area_gtxtest_s_axi_tx_tdata[31:0]  ), //o
    .s_axi_tx_tkeep       (gtx_area_gtxtest_s_axi_tx_tkeep[3:0]   ), //o
    .s_axi_tx_tlast       (gtx_area_gtxtest_s_axi_tx_tlast        ), //o
    .s_axi_tx_tvalid      (gtx_area_gtxtest_s_axi_tx_tvalid       ), //o
    .s_axi_tx_tready      (s_axi_tx_tready                        ), //i
    .tx_packet_gtxid      (32'h00000001                           ), //i
    .tx_packet_head       (32'h0000003b                           ), //i
    .tx_packet_req        (gtx_area_gtxtest_tx_packet_req         ), //i
    .tx_packet_trigger    (1'b0                                   ), //i
    .crc_data             (gtx_area_gtxtest_crc_data[31:0]        ), //o
    .tx_packet_addra      (gtx_area_gtxtest_tx_packet_addra[7:0]  ), //o
    .tx_packet_data       (gtx_area_gtxtest_tx_packet_data[31:0]  ), //i
    .tx_packet_rden       (gtx_area_gtxtest_tx_packet_rden        )  //o
  );
  assign when_GTX_TEST_l45 = (32'h000001f4 <= gtx_area_timer_B_io_value);
  always @(*) begin
    if(when_GTX_TEST_l45) begin
      gtx_area_timer_B_io_clear = 1'b1;
    end else begin
      gtx_area_timer_B_io_clear = 1'b0;
    end
  end

  assign gtx_area_gtxtest_tx_packet_req = (((gtx_area_timer_B_io_full || gtx_area_timer_B_io_full_delay_1) || gtx_area_timer_B_io_full_delay_2) || gtx_area_timer_B_io_full_delay_3);
  assign s_axi_tx_tlast = gtx_area_gtxtest_s_axi_tx_tlast;
  assign s_axi_tx_tdata = gtx_area_gtxtest_s_axi_tx_tdata;
  assign s_axi_tx_tvalid = gtx_area_gtxtest_s_axi_tx_tvalid;
  assign _zz_tx_packet_data = gtx_area_gtxtest_tx_packet_addra;
  assign _zz_tx_packet_data_1 = (! gtx_area_gtxtest_tx_packet_rden);
  assign gtx_area_gtxtest_tx_packet_data = _zz_gtx_area_mem_port0;
  always @(posedge log_clk) begin
    gtx_area_timer_B_io_full_delay_1 <= gtx_area_timer_B_io_full;
    gtx_area_timer_B_io_full_delay_1_1 <= gtx_area_timer_B_io_full;
    gtx_area_timer_B_io_full_delay_2 <= gtx_area_timer_B_io_full_delay_1_1;
    gtx_area_timer_B_io_full_delay_1_2 <= gtx_area_timer_B_io_full;
    gtx_area_timer_B_io_full_delay_2_1 <= gtx_area_timer_B_io_full_delay_1_2;
    gtx_area_timer_B_io_full_delay_3 <= gtx_area_timer_B_io_full_delay_2_1;
  end


endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               log_clk,
  input               log_rst_q
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
  always @(posedge log_clk or posedge log_rst_q) begin
    if(log_rst_q) begin
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

  always @(posedge log_clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
    end
  end


endmodule
