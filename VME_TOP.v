// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : VME_TOP
// Git hash  : faa136a5cd11b0754bd45144fa843c52609e72a5

`timescale 1ns/1ps 

module VME_TOP (
  input               clk,
  input               reset,
  input      [23:0]   vme_addr,
  input      [5:0]    vme_am,
  input               vme_as,
  input               vme_ds0,
  input               vme_ds1,
  input               vme_write,
  input               vme_lword,
  input               vme_iack,
  output              vme_dtack,
  output              vme_beer,
  output              vme_retry,
  output     [6:0]    vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4,
  output              datadir,
  output     [31:0]   vme_data_0,
  output     [31:0]   vme_data_1,
  output     [31:0]   vme_data_2,
  output     [31:0]   vme_data_3,
  output     [31:0]   vme_data_4,
  output     [31:0]   vme_data_5,
  input      [31:0]   sensor_data_0,
  input      [31:0]   sensor_data_1,
  input      [31:0]   sensor_data_2,
  input      [31:0]   sensor_data_3,
  input      [31:0]   sensor_data_4,
  input      [31:0]   sensor_data_5,
  input      [31:0]   sensor_data_6,
  input      [31:0]   sensor_data_7,
  input      [31:0]   sensor_data_8,
  input      [31:0]   sensor_data_9,
  input      [31:0]   sensor_data_10,
  input      [31:0]   sensor_data_11,
   inout     [31:0]   vme_data
);

  wire                vme_area_vme_decode_vme_dtack;
  wire                vme_area_vme_decode_vme_beer;
  wire                vme_area_vme_decode_vme_retry;
  wire       [6:0]    vme_area_vme_decode_vme_irq;
  wire                vme_area_vme_decode_vme_iackout;
  wire       [31:0]   vme_area_vme_decode_vme_data_write;
  wire                vme_area_vme_decode_vme_data_writeEnable;
  wire                vme_area_vme_decode_lwr;
  wire                vme_area_vme_decode_lrd;
  wire       [14:0]   vme_area_vme_decode_laddr;
  wire                vme_area_vme_decode_datadir;
  wire       [14:0]   vme_area_vme_decode_apb_PADDR;
  wire       [0:0]    vme_area_vme_decode_apb_PSEL;
  wire                vme_area_vme_decode_apb_PENABLE;
  wire                vme_area_vme_decode_apb_PWRITE;
  wire       [31:0]   vme_area_vme_decode_apb_PWDATA;
  wire                vme_area_vme_reg_apb_PREADY;
  wire       [31:0]   vme_area_vme_reg_apb_PRDATA;
  wire                vme_area_vme_reg_apb_PSLVERROR;
  wire       [31:0]   vme_area_vme_reg_vme_data_0;
  wire       [31:0]   vme_area_vme_reg_vme_data_1;
  wire       [31:0]   vme_area_vme_reg_vme_data_2;
  wire       [31:0]   vme_area_vme_reg_vme_data_3;
  wire       [31:0]   vme_area_vme_reg_vme_data_4;
  wire       [31:0]   vme_area_vme_reg_vme_data_5;
  reg                 _zz_vme_data;
  wire       [31:0]   _zz_vme_data_read;
  wire       [31:0]   _zz_vme_data_1;
  wire                _zz_1;

  Vme vme_area_vme_decode (
    .clk                     (clk                                       ), //i
    .reset                   (reset                                     ), //i
    .vme_addr                (vme_addr[23:0]                            ), //i
    .vme_data_read           (_zz_vme_data_read[31:0]                   ), //i
    .vme_data_write          (vme_area_vme_decode_vme_data_write[31:0]  ), //o
    .vme_data_writeEnable    (vme_area_vme_decode_vme_data_writeEnable  ), //o
    .vme_am                  (vme_am[5:0]                               ), //i
    .vme_as                  (vme_as                                    ), //i
    .vme_ds0                 (vme_ds0                                   ), //i
    .vme_ds1                 (vme_ds1                                   ), //i
    .vme_write               (vme_write                                 ), //i
    .vme_lword               (vme_lword                                 ), //i
    .vme_iack                (vme_iack                                  ), //i
    .vme_dtack               (vme_area_vme_decode_vme_dtack             ), //o
    .vme_beer                (vme_area_vme_decode_vme_beer              ), //o
    .vme_retry               (vme_area_vme_decode_vme_retry             ), //o
    .vme_irq                 (vme_area_vme_decode_vme_irq[6:0]          ), //o
    .vme_iackin              (vme_iackin                                ), //i
    .vme_iackout             (vme_area_vme_decode_vme_iackout           ), //o
    .gap                     (gap[3:0]                                  ), //i
    .sw                      (sw[3:0]                                   ), //i
    .gap4                    (gap4                                      ), //i
    .lwr                     (vme_area_vme_decode_lwr                   ), //o
    .lrd                     (vme_area_vme_decode_lrd                   ), //o
    .laddr                   (vme_area_vme_decode_laddr[14:0]           ), //o
    .datadir                 (vme_area_vme_decode_datadir               ), //o
    .apb_PADDR               (vme_area_vme_decode_apb_PADDR[14:0]       ), //o
    .apb_PSEL                (vme_area_vme_decode_apb_PSEL              ), //o
    .apb_PENABLE             (vme_area_vme_decode_apb_PENABLE           ), //o
    .apb_PREADY              (vme_area_vme_reg_apb_PREADY               ), //i
    .apb_PWRITE              (vme_area_vme_decode_apb_PWRITE            ), //o
    .apb_PWDATA              (vme_area_vme_decode_apb_PWDATA[31:0]      ), //o
    .apb_PRDATA              (vme_area_vme_reg_apb_PRDATA[31:0]         ), //i
    .apb_PSLVERROR           (vme_area_vme_reg_apb_PSLVERROR            )  //i
  );
  VME_REG vme_area_vme_reg (
    .apb_PADDR         (vme_area_vme_decode_apb_PADDR[14:0]   ), //i
    .apb_PSEL          (vme_area_vme_decode_apb_PSEL          ), //i
    .apb_PENABLE       (vme_area_vme_decode_apb_PENABLE       ), //i
    .apb_PREADY        (vme_area_vme_reg_apb_PREADY           ), //o
    .apb_PWRITE        (vme_area_vme_decode_apb_PWRITE        ), //i
    .apb_PWDATA        (vme_area_vme_decode_apb_PWDATA[31:0]  ), //i
    .apb_PRDATA        (vme_area_vme_reg_apb_PRDATA[31:0]     ), //o
    .apb_PSLVERROR     (vme_area_vme_reg_apb_PSLVERROR        ), //o
    .vme_data_0        (vme_area_vme_reg_vme_data_0[31:0]     ), //o
    .vme_data_1        (vme_area_vme_reg_vme_data_1[31:0]     ), //o
    .vme_data_2        (vme_area_vme_reg_vme_data_2[31:0]     ), //o
    .vme_data_3        (vme_area_vme_reg_vme_data_3[31:0]     ), //o
    .vme_data_4        (vme_area_vme_reg_vme_data_4[31:0]     ), //o
    .vme_data_5        (vme_area_vme_reg_vme_data_5[31:0]     ), //o
    .sensor_data_0     (sensor_data_0[31:0]                   ), //i
    .sensor_data_1     (sensor_data_1[31:0]                   ), //i
    .sensor_data_2     (sensor_data_2[31:0]                   ), //i
    .sensor_data_3     (sensor_data_3[31:0]                   ), //i
    .sensor_data_4     (sensor_data_4[31:0]                   ), //i
    .sensor_data_5     (sensor_data_5[31:0]                   ), //i
    .sensor_data_6     (sensor_data_6[31:0]                   ), //i
    .sensor_data_7     (sensor_data_7[31:0]                   ), //i
    .sensor_data_8     (sensor_data_8[31:0]                   ), //i
    .sensor_data_9     (sensor_data_9[31:0]                   ), //i
    .sensor_data_10    (sensor_data_10[31:0]                  ), //i
    .sensor_data_11    (sensor_data_11[31:0]                  ), //i
    .clk               (clk                                   ), //i
    .reset             (reset                                 )  //i
  );
  assign vme_data = _zz_vme_data ? _zz_vme_data_1 : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
  always @(*) begin
    _zz_vme_data = 1'b0;
    if(_zz_1) begin
      _zz_vme_data = 1'b1;
    end
  end

  assign _zz_vme_data_1 = vme_area_vme_decode_vme_data_write;
  assign _zz_1 = vme_area_vme_decode_vme_data_writeEnable;
  assign vme_dtack = vme_area_vme_decode_vme_dtack;
  assign vme_beer = vme_area_vme_decode_vme_beer;
  assign vme_retry = vme_area_vme_decode_vme_retry;
  assign vme_irq = vme_area_vme_decode_vme_irq;
  assign vme_iackout = vme_area_vme_decode_vme_iackout;
  assign datadir = vme_area_vme_decode_datadir;
  assign vme_data_0 = vme_area_vme_reg_vme_data_0;
  assign vme_data_1 = vme_area_vme_reg_vme_data_1;
  assign vme_data_2 = vme_area_vme_reg_vme_data_2;
  assign vme_data_3 = vme_area_vme_reg_vme_data_3;
  assign vme_data_4 = vme_area_vme_reg_vme_data_4;
  assign vme_data_5 = vme_area_vme_reg_vme_data_5;
  assign _zz_vme_data_read = vme_data;

endmodule

module VME_REG (
  input      [14:0]   apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [31:0]   apb_PWDATA,
  output     [31:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  output     [31:0]   vme_data_0,
  output     [31:0]   vme_data_1,
  output     [31:0]   vme_data_2,
  output     [31:0]   vme_data_3,
  output     [31:0]   vme_data_4,
  output     [31:0]   vme_data_5,
  input      [31:0]   sensor_data_0,
  input      [31:0]   sensor_data_1,
  input      [31:0]   sensor_data_2,
  input      [31:0]   sensor_data_3,
  input      [31:0]   sensor_data_4,
  input      [31:0]   sensor_data_5,
  input      [31:0]   sensor_data_6,
  input      [31:0]   sensor_data_7,
  input      [31:0]   sensor_data_8,
  input      [31:0]   sensor_data_9,
  input      [31:0]   sensor_data_10,
  input      [31:0]   sensor_data_11,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [31:0]   busslave_readData;
  wire                busslave_askWrite;
  wire                busslave_askRead;
  wire                busslave_doWrite;
  wire                busslave_doRead;
  wire                when_RegInst_l153;
  reg        [31:0]   _zz_vme_data_0;
  reg        [31:0]   _zz_vme_data_0_1;
  wire                when_RegInst_l153_1;
  reg        [31:0]   _zz_vme_data_1;
  reg        [31:0]   _zz_vme_data_1_1;
  wire                when_RegInst_l153_2;
  reg        [31:0]   _zz_vme_data_2;
  reg        [31:0]   _zz_vme_data_2_1;
  wire                when_RegInst_l153_3;
  reg        [31:0]   _zz_vme_data_3;
  reg        [31:0]   _zz_vme_data_3_1;
  wire                when_RegInst_l153_4;
  reg        [31:0]   _zz_vme_data_4;
  reg        [31:0]   _zz_vme_data_4_1;
  wire                when_RegInst_l153_5;
  reg        [31:0]   _zz_vme_data_5;
  reg        [31:0]   _zz_vme_data_5_1;

  assign apb_PREADY = 1'b1;
  assign apb_PRDATA = busslave_readData;
  assign apb_PSLVERROR = busslave_readError;
  assign busslave_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busslave_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busslave_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busslave_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign when_RegInst_l153 = ((apb_PADDR == 15'h0) && busslave_doWrite);
  assign vme_data_0 = _zz_vme_data_0_1;
  assign when_RegInst_l153_1 = ((apb_PADDR == 15'h0004) && busslave_doWrite);
  assign vme_data_1 = _zz_vme_data_1_1;
  assign when_RegInst_l153_2 = ((apb_PADDR == 15'h0008) && busslave_doWrite);
  assign vme_data_2 = _zz_vme_data_2_1;
  assign when_RegInst_l153_3 = ((apb_PADDR == 15'h000c) && busslave_doWrite);
  assign vme_data_3 = _zz_vme_data_3_1;
  assign when_RegInst_l153_4 = ((apb_PADDR == 15'h0010) && busslave_doWrite);
  assign vme_data_4 = _zz_vme_data_4_1;
  assign when_RegInst_l153_5 = ((apb_PADDR == 15'h0014) && busslave_doWrite);
  assign vme_data_5 = _zz_vme_data_5_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 32'h0;
      _zz_vme_data_0 <= 32'h0;
      _zz_vme_data_1 <= 32'h0;
      _zz_vme_data_2 <= 32'h0;
      _zz_vme_data_3 <= 32'h0;
      _zz_vme_data_4 <= 32'h0;
      _zz_vme_data_5 <= 32'h0;
    end else begin
      if(when_RegInst_l153) begin
        _zz_vme_data_0 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_1) begin
        _zz_vme_data_1 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_2) begin
        _zz_vme_data_2 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_3) begin
        _zz_vme_data_3 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_4) begin
        _zz_vme_data_4 <= apb_PWDATA[31 : 0];
      end
      if(when_RegInst_l153_5) begin
        _zz_vme_data_5 <= apb_PWDATA[31 : 0];
      end
      if(busslave_doRead) begin
        case(apb_PADDR)
          15'h0 : begin
            busslave_readData <= _zz_vme_data_0;
            busslave_readError <= 1'b0;
          end
          15'h0004 : begin
            busslave_readData <= _zz_vme_data_1;
            busslave_readError <= 1'b0;
          end
          15'h0008 : begin
            busslave_readData <= _zz_vme_data_2;
            busslave_readError <= 1'b0;
          end
          15'h000c : begin
            busslave_readData <= _zz_vme_data_3;
            busslave_readError <= 1'b0;
          end
          15'h0010 : begin
            busslave_readData <= _zz_vme_data_4;
            busslave_readError <= 1'b0;
          end
          15'h0014 : begin
            busslave_readData <= _zz_vme_data_5;
            busslave_readError <= 1'b0;
          end
          15'h0018 : begin
            busslave_readData <= sensor_data_0;
            busslave_readError <= 1'b0;
          end
          15'h001c : begin
            busslave_readData <= sensor_data_1;
            busslave_readError <= 1'b0;
          end
          15'h0020 : begin
            busslave_readData <= sensor_data_2;
            busslave_readError <= 1'b0;
          end
          15'h0024 : begin
            busslave_readData <= sensor_data_3;
            busslave_readError <= 1'b0;
          end
          15'h0028 : begin
            busslave_readData <= sensor_data_4;
            busslave_readError <= 1'b0;
          end
          15'h002c : begin
            busslave_readData <= sensor_data_5;
            busslave_readError <= 1'b0;
          end
          15'h0030 : begin
            busslave_readData <= sensor_data_6;
            busslave_readError <= 1'b0;
          end
          15'h0034 : begin
            busslave_readData <= sensor_data_7;
            busslave_readError <= 1'b0;
          end
          15'h0038 : begin
            busslave_readData <= sensor_data_8;
            busslave_readError <= 1'b0;
          end
          15'h003c : begin
            busslave_readData <= sensor_data_9;
            busslave_readError <= 1'b0;
          end
          15'h0040 : begin
            busslave_readData <= sensor_data_10;
            busslave_readError <= 1'b0;
          end
          15'h0044 : begin
            busslave_readData <= sensor_data_11;
            busslave_readError <= 1'b0;
          end
          default : begin
            busslave_readData <= 32'h0;
            busslave_readError <= 1'b1;
          end
        endcase
      end
    end
  end

  always @(posedge clk) begin
    if(when_RegInst_l153) begin
      _zz_vme_data_0_1 <= _zz_vme_data_0;
    end
    if(when_RegInst_l153_1) begin
      _zz_vme_data_1_1 <= _zz_vme_data_1;
    end
    if(when_RegInst_l153_2) begin
      _zz_vme_data_2_1 <= _zz_vme_data_2;
    end
    if(when_RegInst_l153_3) begin
      _zz_vme_data_3_1 <= _zz_vme_data_3;
    end
    if(when_RegInst_l153_4) begin
      _zz_vme_data_4_1 <= _zz_vme_data_4;
    end
    if(when_RegInst_l153_5) begin
      _zz_vme_data_5_1 <= _zz_vme_data_5;
    end
  end


endmodule

module Vme (
  input               clk,
  input               reset,
  input      [23:0]   vme_addr,
  input      [31:0]   vme_data_read,
  output     [31:0]   vme_data_write,
  output              vme_data_writeEnable,
  input      [5:0]    vme_am,
  input               vme_as,
  input               vme_ds0,
  input               vme_ds1,
  input               vme_write,
  input               vme_lword,
  input               vme_iack,
  output              vme_dtack,
  output              vme_beer,
  output              vme_retry,
  output     [6:0]    vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4,
  output              lwr,
  output              lrd,
  output     [14:0]   laddr,
  output              datadir,
  output     [14:0]   apb_PADDR,
  output     [0:0]    apb_PSEL,
  output              apb_PENABLE,
  input               apb_PREADY,
  output              apb_PWRITE,
  output     [31:0]   apb_PWDATA,
  input      [31:0]   apb_PRDATA,
  input               apb_PSLVERROR
);

  wire                vme_area_os_count_shot_clk;
  wire                vme_area_os_count_shot_out;
  wire                vme_area_sloterr;
  wire                vme_area_addr_pass_data1;
  wire                vme_area_addr_pass_int1;
  wire                vme_area_addr_pass_data;
  wire                vme_area_addr_pass_int;
  wire                vme_area_ds;
  reg                 vme_area_dtack;
  reg                 vme_area_os_count_shot_out_regNext;
  reg                 vme_area_ds_regNext;
  wire                when_VmeInterface_l121;

  oneshot_count vme_area_os_count (
    .clk         (clk                         ), //i
    .shot_clk    (vme_area_os_count_shot_clk  ), //i
    .count       (8'h02                       ), //i
    .shot_out    (vme_area_os_count_shot_out  )  //o
  );
  assign vme_area_sloterr = (gap == sw);
  assign vme_area_addr_pass_data1 = ((((vme_am == 6'h39) || (vme_am == 6'h3d)) && vme_lword) && vme_iack);
  assign vme_area_addr_pass_int1 = ((((vme_am == 6'h29) || (vme_am == 6'h2d)) && vme_lword) && (! vme_iack));
  assign vme_area_addr_pass_data = (((((vme_area_addr_pass_data1 && (! vme_as)) && (vme_addr[19 : 16] == (~ gap))) && vme_area_sloterr) && (vme_addr[23 : 21] == 3'b110)) && (vme_addr[20] == (! gap4)));
  assign vme_area_addr_pass_int = (vme_area_addr_pass_int1 && (! vme_as));
  assign laddr = ((vme_area_addr_pass_data1 && (! vme_as)) ? vme_addr[15 : 1] : 15'h7fff);
  assign vme_area_ds = (vme_ds0 && vme_ds1);
  assign lwr = ((vme_area_addr_pass_data && (! vme_write)) ? vme_area_ds : 1'b1);
  assign lrd = ((vme_area_addr_pass_data && vme_write) ? vme_area_ds : 1'b1);
  assign vme_area_os_count_shot_clk = (! (lwr && lrd));
  assign when_VmeInterface_l121 = (((! vme_area_os_count_shot_out) && vme_area_os_count_shot_out_regNext) || (vme_area_ds && (! vme_area_ds_regNext)));
  assign vme_dtack = vme_area_dtack;
  assign apb_PADDR = laddr;
  assign apb_PSEL = ((! lwr) || (! lrd));
  assign apb_PWRITE = (! lwr);
  assign apb_PENABLE = ((! lwr) || (! lrd));
  assign vme_data_writeEnable = (! lrd);
  assign vme_data_write = apb_PRDATA;
  assign apb_PWDATA = vme_data_read;
  assign datadir = ((vme_area_addr_pass_data && vme_write) ? 1'b1 : 1'b0);
  assign vme_iackout = vme_iackin;
  assign vme_beer = 1'b0;
  assign vme_retry = 1'b0;
  assign vme_irq = 7'h7f;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      vme_area_dtack <= 1'b1;
    end else begin
      if(when_VmeInterface_l121) begin
        if(vme_area_ds) begin
          vme_area_dtack <= 1'b1;
        end else begin
          vme_area_dtack <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    vme_area_os_count_shot_out_regNext <= vme_area_os_count_shot_out;
    vme_area_ds_regNext <= vme_area_ds;
  end


endmodule

module oneshot_count (
  input               clk,
  input               shot_clk,
  input      [7:0]    count,
  output              shot_out
);

  wire                dff_1_clrn;
  wire                dff_1_q;
  reg                 oneshot_negarea_shot_clk_buf;
  reg        [7:0]    oneshot_posarea_counter;
  wire                when_VmeInterface_l70;

  DFF dff_1 (
    .d       (1'b1                          ), //i
    .q       (dff_1_q                       ), //o
    .clrn    (dff_1_clrn                    ), //i
    .clk     (oneshot_negarea_shot_clk_buf  )  //i
  );
  assign when_VmeInterface_l70 = (! dff_1_q);
  assign dff_1_clrn = (oneshot_posarea_counter < count);
  assign shot_out = dff_1_q;
  always @(negedge clk) begin
    oneshot_negarea_shot_clk_buf <= shot_clk;
  end

  always @(posedge clk) begin
    if(when_VmeInterface_l70) begin
      oneshot_posarea_counter <= 8'h0;
    end else begin
      oneshot_posarea_counter <= (oneshot_posarea_counter + 8'h01);
    end
  end


endmodule

module DFF (
  input               d,
  output              q,
  input               clrn,
  input               clk
);

  (* async_reg = "true" *) reg                 dff_area_buffer;

  assign q = ((! clrn) ? 1'b0 : dff_area_buffer);
  always @(posedge clk) begin
    dff_area_buffer <= d;
  end


endmodule
