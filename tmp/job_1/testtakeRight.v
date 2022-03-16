// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : testtakeRight
// Git hash  : 1d7d59401b86b42deedb807f9591ae65cc74e9dc



module testtakeRight (
  input      [127:0]  datain,
  output     [127:0]  dataout
);

  assign dataout = {{{datain[31 : 0],datain[63 : 32]},datain[95 : 64]},datain[127 : 96]};

endmodule
