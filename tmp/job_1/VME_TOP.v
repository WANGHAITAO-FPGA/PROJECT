// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : VME_TOP

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
  output              vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [15:0]   data_read,
  output     [15:0]   data_write,
  output              data_writeEnable,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4
);

  wire                vme_area_vme_decode_vme_dtack;
  wire                vme_area_vme_decode_vme_beer;
  wire                vme_area_vme_decode_vme_retry;
  wire                vme_area_vme_decode_vme_irq;
  wire                vme_area_vme_decode_vme_iackout;
  wire                vme_area_vme_decode_lwr;
  wire                vme_area_vme_decode_lrd;
  wire       [14:0]   vme_area_vme_decode_laddr;
  wire                vme_area_vme_decode_datadir;
  wire       [15:0]   vme_area_vme_apb_data_write;
  wire                vme_area_vme_apb_data_writeEnable;
  wire       [14:0]   vme_area_vme_apb_apb_PADDR;
  wire       [0:0]    vme_area_vme_apb_apb_PSEL;
  wire                vme_area_vme_apb_apb_PENABLE;
  wire                vme_area_vme_apb_apb_PWRITE;
  wire       [15:0]   vme_area_vme_apb_apb_PWDATA;
  wire                vme_area_vme_reg_apb_PREADY;
  wire       [15:0]   vme_area_vme_reg_apb_PRDATA;
  wire                vme_area_vme_reg_apb_PSLVERROR;

  Vme vme_area_vme_decode (
    .clk            (clk                              ), //i
    .reset          (reset                            ), //i
    .vme_addr       (vme_addr[23:0]                   ), //i
    .vme_am         (vme_am[5:0]                      ), //i
    .vme_as         (vme_as                           ), //i
    .vme_ds0        (vme_ds0                          ), //i
    .vme_ds1        (vme_ds1                          ), //i
    .vme_write      (vme_write                        ), //i
    .vme_lword      (vme_lword                        ), //i
    .vme_iack       (vme_iack                         ), //i
    .vme_dtack      (vme_area_vme_decode_vme_dtack    ), //o
    .vme_beer       (vme_area_vme_decode_vme_beer     ), //o
    .vme_retry      (vme_area_vme_decode_vme_retry    ), //o
    .vme_irq        (vme_area_vme_decode_vme_irq      ), //o
    .vme_iackin     (vme_iackin                       ), //i
    .vme_iackout    (vme_area_vme_decode_vme_iackout  ), //o
    .gap            (gap[3:0]                         ), //i
    .sw             (sw[3:0]                          ), //i
    .gap4           (gap4                             ), //i
    .lwr            (vme_area_vme_decode_lwr          ), //o
    .lrd            (vme_area_vme_decode_lrd          ), //o
    .laddr          (vme_area_vme_decode_laddr[14:0]  ), //o
    .datadir        (vme_area_vme_decode_datadir      )  //o
  );
  VME_APB vme_area_vme_apb (
    .lwr                 (vme_area_vme_decode_lwr            ), //i
    .lrd                 (vme_area_vme_decode_lrd            ), //i
    .laddr               (vme_area_vme_decode_laddr[14:0]    ), //i
    .data_read           (data_read[15:0]                    ), //i
    .data_write          (vme_area_vme_apb_data_write[15:0]  ), //o
    .data_writeEnable    (vme_area_vme_apb_data_writeEnable  ), //o
    .apb_PADDR           (vme_area_vme_apb_apb_PADDR[14:0]   ), //o
    .apb_PSEL            (vme_area_vme_apb_apb_PSEL          ), //o
    .apb_PENABLE         (vme_area_vme_apb_apb_PENABLE       ), //o
    .apb_PREADY          (vme_area_vme_reg_apb_PREADY        ), //i
    .apb_PWRITE          (vme_area_vme_apb_apb_PWRITE        ), //o
    .apb_PWDATA          (vme_area_vme_apb_apb_PWDATA[15:0]  ), //o
    .apb_PRDATA          (vme_area_vme_reg_apb_PRDATA[15:0]  ), //i
    .apb_PSLVERROR       (vme_area_vme_reg_apb_PSLVERROR     )  //i
  );
  VME_REG vme_area_vme_reg (
    .apb_PADDR        (vme_area_vme_apb_apb_PADDR[14:0]   ), //i
    .apb_PSEL         (vme_area_vme_apb_apb_PSEL          ), //i
    .apb_PENABLE      (vme_area_vme_apb_apb_PENABLE       ), //i
    .apb_PREADY       (vme_area_vme_reg_apb_PREADY        ), //o
    .apb_PWRITE       (vme_area_vme_apb_apb_PWRITE        ), //i
    .apb_PWDATA       (vme_area_vme_apb_apb_PWDATA[15:0]  ), //i
    .apb_PRDATA       (vme_area_vme_reg_apb_PRDATA[15:0]  ), //o
    .apb_PSLVERROR    (vme_area_vme_reg_apb_PSLVERROR     ), //o
    .clk              (clk                                ), //i
    .reset            (reset                              )  //i
  );
  assign vme_dtack = vme_area_vme_decode_vme_dtack;
  assign vme_beer = vme_area_vme_decode_vme_beer;
  assign vme_retry = vme_area_vme_decode_vme_retry;
  assign vme_irq = vme_area_vme_decode_vme_irq;
  assign vme_iackout = vme_area_vme_decode_vme_iackout;
  assign data_write = vme_area_vme_apb_data_write;
  assign data_writeEnable = vme_area_vme_apb_data_writeEnable;

endmodule

module VME_REG (
  input      [14:0]   apb_PADDR,
  input      [0:0]    apb_PSEL,
  input               apb_PENABLE,
  output              apb_PREADY,
  input               apb_PWRITE,
  input      [15:0]   apb_PWDATA,
  output     [15:0]   apb_PRDATA,
  output              apb_PSLVERROR,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [15:0]   busslave_readData;
  wire                busslave_askWrite;
  wire                busslave_askRead;
  wire                busslave_doWrite;
  wire                busslave_doRead;
  wire                when_RegInst_l153;
  reg        [15:0]   VME_Reg0;
  wire                when_RegInst_l153_1;
  reg        [15:0]   VME_Reg1;
  wire                when_RegInst_l153_2;
  reg        [15:0]   VME_Reg2;
  wire                when_RegInst_l153_3;
  reg        [15:0]   VME_Reg3;

  assign apb_PREADY = 1'b1;
  assign apb_PRDATA = busslave_readData;
  assign apb_PSLVERROR = busslave_readError;
  assign busslave_askWrite = ((apb_PSEL[0] && apb_PENABLE) && apb_PWRITE);
  assign busslave_askRead = ((apb_PSEL[0] && apb_PENABLE) && (! apb_PWRITE));
  assign busslave_doWrite = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && apb_PWRITE);
  assign busslave_doRead = (((apb_PSEL[0] && apb_PENABLE) && apb_PREADY) && (! apb_PWRITE));
  assign when_RegInst_l153 = ((apb_PADDR == 15'h0) && busslave_doWrite);
  assign when_RegInst_l153_1 = ((apb_PADDR == 15'h0002) && busslave_doWrite);
  assign when_RegInst_l153_2 = ((apb_PADDR == 15'h0004) && busslave_doWrite);
  assign when_RegInst_l153_3 = ((apb_PADDR == 15'h0006) && busslave_doWrite);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 16'h0;
      VME_Reg0 <= 16'h0;
      VME_Reg1 <= 16'h0;
      VME_Reg2 <= 16'h0;
      VME_Reg3 <= 16'h0;
    end else begin
      if(when_RegInst_l153) begin
        VME_Reg0 <= apb_PWDATA[15 : 0];
      end
      if(when_RegInst_l153_1) begin
        VME_Reg1 <= apb_PWDATA[15 : 0];
      end
      if(when_RegInst_l153_2) begin
        VME_Reg2 <= apb_PWDATA[15 : 0];
      end
      if(when_RegInst_l153_3) begin
        VME_Reg3 <= apb_PWDATA[15 : 0];
      end
      if(busslave_doRead) begin
        case(apb_PADDR)
          15'h0 : begin
            busslave_readData <= VME_Reg0;
            busslave_readError <= 1'b0;
          end
          15'h0002 : begin
            busslave_readData <= VME_Reg1;
            busslave_readError <= 1'b0;
          end
          15'h0004 : begin
            busslave_readData <= VME_Reg2;
            busslave_readError <= 1'b0;
          end
          15'h0006 : begin
            busslave_readData <= VME_Reg3;
            busslave_readError <= 1'b0;
          end
          default : begin
            busslave_readData <= 16'h0;
            busslave_readError <= 1'b1;
          end
        endcase
      end
    end
  end


endmodule

module VME_APB (
  input               lwr,
  input               lrd,
  input      [14:0]   laddr,
  input      [15:0]   data_read,
  output     [15:0]   data_write,
  output              data_writeEnable,
  output     [14:0]   apb_PADDR,
  output     [0:0]    apb_PSEL,
  output              apb_PENABLE,
  input               apb_PREADY,
  output              apb_PWRITE,
  output     [15:0]   apb_PWDATA,
  input      [15:0]   apb_PRDATA,
  input               apb_PSLVERROR
);


  assign apb_PADDR = laddr;
  assign apb_PSEL = ((! lwr) || (! lrd));
  assign apb_PWRITE = (! lwr);
  assign apb_PENABLE = ((! lwr) || (! lrd));
  assign data_writeEnable = lwr;
  assign data_write = apb_PRDATA;
  assign apb_PWDATA = data_read;

endmodule

module Vme (
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
  output              vme_irq,
  input               vme_iackin,
  output              vme_iackout,
  input      [3:0]    gap,
  input      [3:0]    sw,
  input               gap4,
  output              lwr,
  output              lrd,
  output     [14:0]   laddr,
  output              datadir
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
  wire                when_VmeInterface_l120;

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
  assign when_VmeInterface_l120 = (((! vme_area_os_count_shot_out) && vme_area_os_count_shot_out_regNext) || (vme_area_ds && (! vme_area_ds_regNext)));
  assign vme_dtack = vme_area_dtack;
  assign datadir = ((vme_area_addr_pass_data && vme_write) ? 1'b1 : 1'b0);
  assign vme_iackout = vme_iackin;
  assign vme_beer = 1'b0;
  assign vme_retry = 1'b0;
  assign vme_irq = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      vme_area_dtack <= 1'b1;
    end else begin
      if(when_VmeInterface_l120) begin
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
