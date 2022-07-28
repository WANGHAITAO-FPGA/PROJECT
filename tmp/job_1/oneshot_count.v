// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : oneshot_count
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

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
  wire                when_VmeInterface_l76;

  DFF dff_1 (
    .d    (1'b1                        ), //i
    .q    (dff_1_q                     ), //o
    .clrn (dff_1_clrn                  ), //i
    .clk  (oneshot_negarea_shot_clk_buf)  //i
  );
  assign when_VmeInterface_l76 = (! dff_1_q);
  assign dff_1_clrn = (oneshot_posarea_counter < count);
  assign shot_out = dff_1_q;
  always @(negedge clk) begin
    oneshot_negarea_shot_clk_buf <= shot_clk;
  end

  always @(posedge clk) begin
    if(when_VmeInterface_l76) begin
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
  wire                when_VmeInterface_l47;

  assign when_VmeInterface_l47 = (! clrn);
  assign q = dff_area_buffer;
  always @(posedge clk) begin
    if(when_VmeInterface_l47) begin
      dff_area_buffer <= 1'b0;
    end else begin
      dff_area_buffer <= d;
    end
  end


endmodule
