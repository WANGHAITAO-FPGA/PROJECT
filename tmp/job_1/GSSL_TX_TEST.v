// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : GSSL_TX_TEST

`timescale 1ns/1ps 

module GSSL_TX_TEST (
  input               GSSL_REFCLK,
  input               rst_in,
  output     [2:0]    GSSL_TXCT0,
  output     [7:0]    GSSL_TXD,
  output     [7:0]    writes_addr,
  output     [15:0]   writes_dataIn,
  output              writes_en,
  output              writes_we,
  output              rx_led
);

  wire       [15:0]   gssl_area_gssl_tx_module_reads_dataOut;
  reg        [15:0]   _zz_gssl_area_rams_port0;
  wire       [2:0]    gssl_area_gssl_tx_module_GSSL_TXCT0;
  wire       [7:0]    gssl_area_gssl_tx_module_GSSL_TXD;
  wire       [7:0]    gssl_area_gssl_tx_module_reads_addr;
  wire                gssl_area_gssl_tx_module_reads_en;
  wire       [7:0]    gssl_area_gssl_rx_module_writes_addr;
  wire                gssl_area_gssl_rx_module_writes_en;
  wire       [15:0]   gssl_area_gssl_rx_module_writes_dataIn;
  wire                gssl_area_gssl_rx_module_writes_we;
  wire                gssl_area_gssl_rx_module_rx_frame_done;
  wire                gssl_area_gssl_rx_module_rx_error;
  wire       [15:0]   gssl_area_gssl_rx_module_rx_frame_head_data;
  wire                gssl_area_gssl_rx_module_rx_led;
  wire       [7:0]    _zz_reads_dataOut;
  reg [15:0] gssl_area_rams [0:255];

  initial begin
    $readmemb("GSSL_TX_TEST.v_toplevel_gssl_area_rams.bin",gssl_area_rams);
  end
  always @(posedge GSSL_REFCLK) begin
    if(gssl_area_gssl_tx_module_reads_en) begin
      _zz_gssl_area_rams_port0 <= gssl_area_rams[_zz_reads_dataOut];
    end
  end

  GSSL_TX_MOUDLE gssl_area_gssl_tx_module (
    .GSSL_REFCLK           (GSSL_REFCLK                                   ), //i
    .rst_in                (rst_in                                        ), //i
    .timer_tick            (1'b1                                          ), //i
    .GSSL_TXCT0            (gssl_area_gssl_tx_module_GSSL_TXCT0[2:0]      ), //o
    .GSSL_TXD              (gssl_area_gssl_tx_module_GSSL_TXD[7:0]        ), //o
    .tx_frame_head_data    (16'h0020                                      ), //i
    .reads_addr            (gssl_area_gssl_tx_module_reads_addr[7:0]      ), //o
    .reads_dataOut         (gssl_area_gssl_tx_module_reads_dataOut[15:0]  ), //i
    .reads_en              (gssl_area_gssl_tx_module_reads_en             )  //o
  );
  GSSL_RX_MOUDLE gssl_area_gssl_rx_module (
    .GSSL_RXCLK            (GSSL_REFCLK                                        ), //i
    .rst_in                (rst_in                                             ), //i
    .GSSL_RXST0            (GSSL_TXCT0[2:0]                                    ), //i
    .GSSL_RXD              (GSSL_TXD[7:0]                                      ), //i
    .writes_addr           (gssl_area_gssl_rx_module_writes_addr[7:0]          ), //o
    .writes_dataIn         (gssl_area_gssl_rx_module_writes_dataIn[15:0]       ), //o
    .writes_en             (gssl_area_gssl_rx_module_writes_en                 ), //o
    .writes_we             (gssl_area_gssl_rx_module_writes_we                 ), //o
    .rx_frame_done         (gssl_area_gssl_rx_module_rx_frame_done             ), //o
    .rx_error              (gssl_area_gssl_rx_module_rx_error                  ), //o
    .rx_frame_head_data    (gssl_area_gssl_rx_module_rx_frame_head_data[15:0]  ), //o
    .rx_led                (gssl_area_gssl_rx_module_rx_led                    )  //o
  );
  assign GSSL_TXCT0 = gssl_area_gssl_tx_module_GSSL_TXCT0;
  assign GSSL_TXD = gssl_area_gssl_tx_module_GSSL_TXD;
  assign _zz_reads_dataOut = gssl_area_gssl_tx_module_reads_addr;
  assign gssl_area_gssl_tx_module_reads_dataOut = _zz_gssl_area_rams_port0;
  assign writes_addr = gssl_area_gssl_rx_module_writes_addr;
  assign writes_dataIn = gssl_area_gssl_rx_module_writes_dataIn;
  assign writes_en = gssl_area_gssl_rx_module_writes_en;
  assign writes_we = gssl_area_gssl_rx_module_writes_we;
  assign rx_led = gssl_area_gssl_rx_module_rx_led;

endmodule

module GSSL_RX_MOUDLE (
  input               GSSL_RXCLK,
  input               rst_in,
  input      [2:0]    GSSL_RXST0,
  input      [7:0]    GSSL_RXD,
  output     [7:0]    writes_addr,
  output     [15:0]   writes_dataIn,
  output              writes_en,
  output              writes_we,
  output              rx_frame_done,
  output              rx_error,
  output     [15:0]   rx_frame_head_data,
  output              rx_led
);

  wire                gssl_area_gsslrxreceiver_decode_k;
  wire       [15:0]   gssl_area_gsslrxreceiver_rx_dpram_data;
  wire       [7:0]    gssl_area_gsslrxreceiver_rx_dpram_waddress;
  wire                gssl_area_gsslrxreceiver_rx_dpram_wr;
  wire       [15:0]   gssl_area_gsslrxreceiver_rx_frame_head_data;
  wire       [7:0]    gssl_area_gsslrxreceiver_rx_atc_status_data;
  wire                gssl_area_gsslrxreceiver_rx_ttc_trigger;
  wire                gssl_area_gsslrxreceiver_rx_atc_trigger;
  wire                gssl_area_gsslrxreceiver_rx_frame_busy;
  wire                gssl_area_gsslrxreceiver_rx_frame_done;
  wire                gssl_area_gsslrxreceiver_rx_frame_len_err;
  wire                gssl_area_gsslrxreceiver_rx_frame_chs_err;
  wire                gssl_area_gsslrxreceiver_rx_frame_scd_err;
  wire       [3:0]    gssl_area_gsslrxreceiver_rx_state_debug;
  wire                gssl_area_gssl_rx_led_rx_led;

  GSSL_RX_Receiver gssl_area_gsslrxreceiver (
    .GSSL_RXCLK            (GSSL_RXCLK                                         ), //i
    .rst_in                (rst_in                                             ), //i
    .CHS_CTRL              (1'b0                                               ), //i
    .decode_k              (gssl_area_gsslrxreceiver_decode_k                  ), //i
    .decode_data           (GSSL_RXD[7:0]                                      ), //i
    .rx_dpram_data         (gssl_area_gsslrxreceiver_rx_dpram_data[15:0]       ), //o
    .rx_dpram_waddress     (gssl_area_gsslrxreceiver_rx_dpram_waddress[7:0]    ), //o
    .rx_dpram_wr           (gssl_area_gsslrxreceiver_rx_dpram_wr               ), //o
    .rx_frame_head_data    (gssl_area_gsslrxreceiver_rx_frame_head_data[15:0]  ), //o
    .rx_atc_status_data    (gssl_area_gsslrxreceiver_rx_atc_status_data[7:0]   ), //o
    .rx_ttc_trigger        (gssl_area_gsslrxreceiver_rx_ttc_trigger            ), //o
    .rx_atc_trigger        (gssl_area_gsslrxreceiver_rx_atc_trigger            ), //o
    .rx_frame_busy         (gssl_area_gsslrxreceiver_rx_frame_busy             ), //o
    .rx_frame_done         (gssl_area_gsslrxreceiver_rx_frame_done             ), //o
    .rx_frame_len_err      (gssl_area_gsslrxreceiver_rx_frame_len_err          ), //o
    .rx_frame_chs_err      (gssl_area_gsslrxreceiver_rx_frame_chs_err          ), //o
    .rx_frame_scd_err      (gssl_area_gsslrxreceiver_rx_frame_scd_err          ), //o
    .rx_state_debug        (gssl_area_gsslrxreceiver_rx_state_debug[3:0]       )  //o
  );
  GSSL_RX_LED gssl_area_gssl_rx_led (
    .trig          (gssl_area_gsslrxreceiver_rx_frame_done  ), //i
    .rx_led        (gssl_area_gssl_rx_led_rx_led            ), //o
    .GSSL_RXCLK    (GSSL_RXCLK                              ), //i
    .rst_in        (rst_in                                  )  //i
  );
  assign gssl_area_gsslrxreceiver_decode_k = GSSL_RXST0[0];
  assign rx_frame_done = gssl_area_gsslrxreceiver_rx_frame_done;
  assign writes_addr = gssl_area_gsslrxreceiver_rx_dpram_waddress;
  assign writes_dataIn = gssl_area_gsslrxreceiver_rx_dpram_data;
  assign writes_en = 1'b1;
  assign writes_we = gssl_area_gsslrxreceiver_rx_dpram_wr;
  assign rx_error = ((gssl_area_gsslrxreceiver_rx_frame_chs_err || gssl_area_gsslrxreceiver_rx_frame_len_err) || gssl_area_gsslrxreceiver_rx_frame_scd_err);
  assign rx_frame_head_data = gssl_area_gsslrxreceiver_rx_frame_head_data;
  assign rx_led = gssl_area_gssl_rx_led_rx_led;

endmodule

module GSSL_TX_MOUDLE (
  input               GSSL_REFCLK,
  input               rst_in,
  input               timer_tick,
  output reg [2:0]    GSSL_TXCT0,
  output     [7:0]    GSSL_TXD,
  input      [15:0]   tx_frame_head_data,
  output     [7:0]    reads_addr,
  input      [15:0]   reads_dataOut,
  output              reads_en
);

  reg                 gssl_area_timer_io_clear;
  wire                gssl_area_timer_io_full;
  wire       [31:0]   gssl_area_timer_io_value;
  wire       [7:0]    gssl_area_gssltxtransmitter_tx_dpram_raddress;
  wire                gssl_area_gssltxtransmitter_encode_k;
  wire       [7:0]    gssl_area_gssltxtransmitter_encode_data;
  wire                gssl_area_gssltxtransmitter_tx_frame_busy;
  wire                gssl_area_gssltxtransmitter_tx_frame_done;
  wire                gssl_area_gssltxtransmitter_tx_dpram_rd;
  wire       [3:0]    gssl_area_gssltxtransmitter_tx_state_debug;
  wire                when_CYP1401_l161;

  Timer gssl_area_timer (
    .io_tick        (timer_tick                      ), //i
    .io_clear       (gssl_area_timer_io_clear        ), //i
    .io_limit       (32'h000003e8                    ), //i
    .io_full        (gssl_area_timer_io_full         ), //o
    .io_value       (gssl_area_timer_io_value[31:0]  ), //o
    .GSSL_REFCLK    (GSSL_REFCLK                     ), //i
    .rst_in         (rst_in                          )  //i
  );
  GSSL_TX_Transmitter gssl_area_gssltxtransmitter (
    .GSSL_REFCLK           (GSSL_REFCLK                                         ), //i
    .rst_in                (rst_in                                              ), //i
    .CHS_CTRL              (1'b0                                                ), //i
    .tx_ttc_trigger        (1'b0                                                ), //i
    .tx_atc_trigger        (1'b0                                                ), //i
    .tx_data_trigger       (gssl_area_timer_io_full                             ), //i
    .tx_frame_head_data    (tx_frame_head_data[15:0]                            ), //i
    .tx_dpram_q            (reads_dataOut[15:0]                                 ), //i
    .tx_atc_status_data    (8'h0                                                ), //i
    .tx_dpram_raddress     (gssl_area_gssltxtransmitter_tx_dpram_raddress[7:0]  ), //o
    .encode_k              (gssl_area_gssltxtransmitter_encode_k                ), //o
    .encode_data           (gssl_area_gssltxtransmitter_encode_data[7:0]        ), //o
    .tx_frame_busy         (gssl_area_gssltxtransmitter_tx_frame_busy           ), //o
    .tx_frame_done         (gssl_area_gssltxtransmitter_tx_frame_done           ), //o
    .tx_dpram_rd           (gssl_area_gssltxtransmitter_tx_dpram_rd             ), //o
    .tx_state_debug        (gssl_area_gssltxtransmitter_tx_state_debug[3:0]     )  //o
  );
  assign when_CYP1401_l161 = (32'h000003e8 <= gssl_area_timer_io_value);
  always @(*) begin
    if(when_CYP1401_l161) begin
      gssl_area_timer_io_clear = 1'b1;
    end else begin
      gssl_area_timer_io_clear = 1'b0;
    end
  end

  assign reads_addr = gssl_area_gssltxtransmitter_tx_dpram_raddress;
  assign reads_en = gssl_area_gssltxtransmitter_tx_dpram_rd;
  always @(*) begin
    GSSL_TXCT0[2 : 1] = 2'b00;
    GSSL_TXCT0[0] = gssl_area_gssltxtransmitter_encode_k;
  end

  assign GSSL_TXD = gssl_area_gssltxtransmitter_encode_data;

endmodule

module GSSL_RX_LED (
  input               trig,
  output              rx_led,
  input               GSSL_RXCLK,
  input               rst_in
);

  reg        [15:0]   counter;
  wire                when_CYP1401_l197;

  assign when_CYP1401_l197 = (counter != 16'hf424);
  assign rx_led = (counter == 16'hf424);
  always @(posedge GSSL_RXCLK or posedge rst_in) begin
    if(rst_in) begin
      counter <= 16'h0;
    end else begin
      if(trig) begin
        counter <= 16'h0;
      end else begin
        if(when_CYP1401_l197) begin
          counter <= (counter + 16'h0001);
        end
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
  input               GSSL_REFCLK,
  input               rst_in
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
  always @(posedge GSSL_REFCLK or posedge rst_in) begin
    if(rst_in) begin
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

  always @(posedge GSSL_REFCLK) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 32'h0;
    end
  end


endmodule
