// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : Vme

`timescale 1ns/1ps 

module Vme (
  input               clk,
  input               reset,
  input      [23:0]   vme_addr,
  input      [15:0]   vme_data,
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
  wire                when_VmeInterface_l117;

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
  assign when_VmeInterface_l117 = (((! vme_area_os_count_shot_out) && vme_area_os_count_shot_out_regNext) || (vme_area_ds && (! vme_area_ds_regNext)));
  assign vme_dtack = vme_area_dtack;
  assign datadir = ((vme_area_addr_pass_data && vme_write) ? 1'b1 : 1'b0);
  assign vme_beer = 1'b0;
  assign vme_retry = 1'b0;
  assign vme_irq = 1'b1;
  assign vme_iackout = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      vme_area_dtack <= 1'b1;
    end else begin
      if(when_VmeInterface_l117) begin
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
  wire                when_VmeInterface_l68;

  DFF dff_1 (
    .d       (1'b1                          ), //i
    .q       (dff_1_q                       ), //o
    .clrn    (dff_1_clrn                    ), //i
    .clk     (oneshot_negarea_shot_clk_buf  )  //i
  );
  assign when_VmeInterface_l68 = (! dff_1_q);
  assign dff_1_clrn = (oneshot_posarea_counter < count);
  assign shot_out = dff_1_q;
  always @(negedge clk) begin
    oneshot_negarea_shot_clk_buf <= shot_clk;
  end

  always @(posedge clk) begin
    if(when_VmeInterface_l68) begin
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
