// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : CRC5_
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps 

module CRC5_ (
  input      [23:0]   data_in,
  input               crc_en,
  output     [4:0]    crc_out,
  input               clk,
  input               rst
);

  wire       [4:0]    area_crc_crc_out;

  crc area_crc (
    .data_in    (data_in[23:0]          ), //i
    .crc_en     (crc_en                 ), //i
    .crc_out    (area_crc_crc_out[4:0]  ), //o
    .clk        (clk                    ), //i
    .rst        (rst                    )  //i
  );
  assign crc_out = area_crc_crc_out;

endmodule
