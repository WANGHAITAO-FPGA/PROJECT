// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Rx_Checker
// Git hash  : c174ea6407642157543b0d5d61d63095d2618929



module Rx_Checker (
  input               io_input_valid,
  output              io_input_ready,
  input               io_input_payload_last,
  input      [31:0]   io_input_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  output              io_error,
  input               clk,
  input               reset
);
  wire                crc_1_flush;
  wire       [31:0]   crc_1_result;
  wire                io_output_fire;

  Crc crc_1 (
    .flush            (crc_1_flush                ), //i
    .input_valid      (io_input_valid             ), //i
    .input_payload    (io_input_payload_fragment  ), //i
    .result           (crc_1_result               ), //o
    .clk              (clk                        ), //i
    .reset            (reset                      )  //i
  );
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign crc_1_flush = (io_output_fire && io_output_payload_last);
  assign io_output_valid = io_input_valid;
  assign io_output_payload_last = io_input_payload_last;
  assign io_output_payload_fragment = io_input_payload_fragment;
  assign io_input_ready = io_output_ready;
  assign io_error = (io_input_payload_last && (crc_1_result != io_input_payload_fragment));

endmodule

module Crc (
  input               flush,
  input               input_valid,
  input      [31:0]   input_payload,
  output     [31:0]   result,
  input               clk,
  input               reset
);
  wire       [31:0]   crc32_1_crc_o;
  reg        [31:0]   crc_data;

  Crc32 crc32_1 (
    .crc_i     (crc_data       ), //i
    .data_i    (input_payload  ), //i
    .crc_o     (crc32_1_crc_o  )  //o
  );
  assign result = crc_data;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      crc_data <= 32'hffffffff;
    end else begin
      if(input_valid) begin
        crc_data <= crc32_1_crc_o;
      end
      if(flush) begin
        crc_data <= 32'hffffffff;
      end
    end
  end


endmodule

module Crc32 (
  input      [31:0]   crc_i,
  input      [31:0]   data_i,
  output reg [31:0]   crc_o
);
  wire                _zz_crc_o;
  wire                _zz_crc_o_1;
  wire                _zz_crc_o_2;
  wire                _zz_crc_o_3;
  wire                _zz_crc_o_4;
  wire                _zz_crc_o_5;
  wire                _zz_crc_o_6;
  wire                _zz_crc_o_7;
  wire                _zz_crc_o_8;
  wire                _zz_crc_o_9;
  wire                _zz_crc_o_10;
  wire                _zz_crc_o_11;
  wire                _zz_crc_o_12;
  wire                _zz_crc_o_13;
  wire                _zz_crc_o_14;
  wire                _zz_crc_o_15;
  wire                _zz_crc_o_16;
  wire                _zz_crc_o_17;
  wire                _zz_crc_o_18;
  wire                _zz_crc_o_19;
  wire                _zz_crc_o_20;
  wire                _zz_crc_o_21;
  wire                _zz_crc_o_22;
  wire                _zz_crc_o_23;
  wire                _zz_crc_o_24;
  wire                _zz_crc_o_25;
  wire                _zz_crc_o_26;
  wire                _zz_crc_o_27;
  wire                _zz_crc_o_28;
  wire                _zz_crc_o_29;
  wire                _zz_crc_o_30;
  wire                _zz_crc_o_31;
  wire                _zz_crc_o_32;
  wire                _zz_crc_o_33;
  wire                _zz_crc_o_34;
  wire                _zz_crc_o_35;
  wire                _zz_crc_o_36;
  wire                _zz_crc_o_37;
  wire                _zz_crc_o_38;
  wire                _zz_crc_o_39;
  wire                _zz_crc_o_40;
  wire                _zz_crc_o_41;
  wire                _zz_crc_o_42;
  wire                _zz_crc_o_43;
  wire                _zz_crc_o_44;
  wire                _zz_crc_o_45;
  wire                _zz_crc_o_46;
  wire                _zz_crc_o_47;
  wire                _zz_crc_o_48;
  wire                _zz_crc_o_49;
  wire                _zz_crc_o_50;
  wire                _zz_crc_o_51;
  wire                _zz_crc_o_52;
  wire                _zz_crc_o_53;
  wire                _zz_crc_o_54;
  wire                _zz_crc_o_55;
  wire                _zz_crc_o_56;
  wire                _zz_crc_o_57;
  wire                _zz_crc_o_58;
  wire                _zz_crc_o_59;
  wire                _zz_crc_o_60;
  wire                _zz_crc_o_61;
  wire                _zz_crc_o_62;
  wire                _zz_crc_o_63;
  wire                _zz_crc_o_64;
  wire                _zz_crc_o_65;
  wire                _zz_crc_o_66;
  wire                _zz_crc_o_67;
  wire                _zz_crc_o_68;
  wire                _zz_crc_o_69;

  assign _zz_crc_o = (((((((((data_i[31] ^ data_i[30]) ^ data_i[29]) ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[16]) ^ data_i[12]) ^ data_i[10]);
  assign _zz_crc_o_1 = data_i[9];
  assign _zz_crc_o_2 = (((((((((data_i[28] ^ data_i[27]) ^ data_i[24]) ^ data_i[17]) ^ data_i[16]) ^ data_i[13]) ^ data_i[12]) ^ data_i[11]) ^ data_i[9]) ^ data_i[7]);
  assign _zz_crc_o_3 = data_i[6];
  assign _zz_crc_o_4 = (((((((((((((((data_i[31] ^ data_i[30]) ^ data_i[26]) ^ data_i[24]) ^ data_i[18]) ^ data_i[17]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[2]) ^ data_i[1]) ^ data_i[0]);
  assign _zz_crc_o_5 = crc_i[0];
  assign _zz_crc_o_6 = (((((((((((((data_i[31] ^ data_i[27]) ^ data_i[25]) ^ data_i[19]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[14]) ^ data_i[10]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[3]) ^ data_i[2]);
  assign _zz_crc_o_7 = data_i[1];
  assign _zz_crc_o_8 = ((((((((((((((((_zz_crc_o_9 ^ _zz_crc_o_10) ^ data_i[25]) ^ data_i[24]) ^ data_i[20]) ^ data_i[19]) ^ data_i[18]) ^ data_i[15]) ^ data_i[12]) ^ data_i[11]) ^ data_i[8]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]) ^ data_i[2]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_11 = crc_i[2];
  assign _zz_crc_o_9 = (data_i[31] ^ data_i[30]);
  assign _zz_crc_o_10 = data_i[29];
  assign _zz_crc_o_12 = (((((((((((((data_i[29] ^ data_i[28]) ^ data_i[24]) ^ data_i[21]) ^ data_i[20]) ^ data_i[19]) ^ data_i[13]) ^ data_i[10]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[3]) ^ data_i[1]);
  assign _zz_crc_o_13 = data_i[0];
  assign _zz_crc_o_14 = (((((((((((((data_i[30] ^ data_i[29]) ^ data_i[25]) ^ data_i[22]) ^ data_i[21]) ^ data_i[20]) ^ data_i[14]) ^ data_i[11]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[2]);
  assign _zz_crc_o_15 = data_i[1];
  assign _zz_crc_o_16 = (((((((((((((((data_i[29] ^ data_i[28]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[21]) ^ data_i[16]) ^ data_i[15]) ^ data_i[10]) ^ data_i[8]) ^ data_i[7]) ^ data_i[5]) ^ data_i[3]) ^ data_i[2]) ^ data_i[0]);
  assign _zz_crc_o_17 = crc_i[0];
  assign _zz_crc_o_18 = (((((((((data_i[31] ^ data_i[28]) ^ data_i[23]) ^ data_i[22]) ^ data_i[17]) ^ data_i[12]) ^ data_i[11]) ^ data_i[10]) ^ data_i[8]) ^ data_i[4]);
  assign _zz_crc_o_19 = data_i[3];
  assign _zz_crc_o_20 = (((((((data_i[29] ^ data_i[24]) ^ data_i[23]) ^ data_i[18]) ^ data_i[13]) ^ data_i[12]) ^ data_i[11]) ^ data_i[9]);
  assign _zz_crc_o_21 = data_i[5];
  assign _zz_crc_o_22 = (((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[26]) ^ data_i[19]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[5]);
  assign _zz_crc_o_23 = data_i[3];
  assign _zz_crc_o_24 = ((((((((((((((((_zz_crc_o_25 ^ _zz_crc_o_26) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[20]) ^ data_i[17]) ^ data_i[16]) ^ data_i[15]) ^ data_i[14]) ^ data_i[12]) ^ data_i[9]) ^ data_i[4]) ^ data_i[3]) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_27 = crc_i[1];
  assign _zz_crc_o_25 = (data_i[31] ^ data_i[28]);
  assign _zz_crc_o_26 = data_i[27];
  assign _zz_crc_o_28 = ((((((((((((((((_zz_crc_o_29 ^ _zz_crc_o_30) ^ data_i[24]) ^ data_i[21]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[13]) ^ data_i[12]) ^ data_i[9]) ^ data_i[6]) ^ data_i[5]) ^ data_i[4]) ^ data_i[2]) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]);
  assign _zz_crc_o_31 = crc_i[1];
  assign _zz_crc_o_29 = (data_i[31] ^ data_i[30]);
  assign _zz_crc_o_30 = data_i[27];
  assign _zz_crc_o_32 = (((((((((((((((data_i[31] ^ data_i[28]) ^ data_i[25]) ^ data_i[22]) ^ data_i[19]) ^ data_i[18]) ^ data_i[16]) ^ data_i[14]) ^ data_i[13]) ^ data_i[10]) ^ data_i[7]) ^ data_i[6]) ^ data_i[5]) ^ data_i[3]) ^ data_i[2]) ^ data_i[1]);
  assign _zz_crc_o_33 = crc_i[1];
  assign _zz_crc_o_34 = (((((((((((((data_i[29] ^ data_i[26]) ^ data_i[23]) ^ data_i[20]) ^ data_i[19]) ^ data_i[17]) ^ data_i[15]) ^ data_i[14]) ^ data_i[11]) ^ data_i[8]) ^ data_i[7]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]);
  assign _zz_crc_o_35 = data_i[2];
  assign _zz_crc_o_36 = (((((((((((((data_i[30] ^ data_i[27]) ^ data_i[24]) ^ data_i[21]) ^ data_i[20]) ^ data_i[18]) ^ data_i[16]) ^ data_i[15]) ^ data_i[12]) ^ data_i[9]) ^ data_i[8]) ^ data_i[7]) ^ data_i[5]) ^ data_i[4]);
  assign _zz_crc_o_37 = data_i[3];
  assign _zz_crc_o_38 = (((((((((((data_i[30] ^ data_i[29]) ^ data_i[26]) ^ data_i[24]) ^ data_i[22]) ^ data_i[21]) ^ data_i[19]) ^ data_i[17]) ^ data_i[13]) ^ data_i[12]) ^ data_i[8]) ^ data_i[5]);
  assign _zz_crc_o_39 = data_i[4];
  assign _zz_crc_o_40 = (((((((((((data_i[31] ^ data_i[30]) ^ data_i[27]) ^ data_i[25]) ^ data_i[23]) ^ data_i[22]) ^ data_i[20]) ^ data_i[18]) ^ data_i[14]) ^ data_i[13]) ^ data_i[9]) ^ data_i[6]);
  assign _zz_crc_o_41 = data_i[5];
  assign _zz_crc_o_42 = (((((((((data_i[31] ^ data_i[28]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[21]) ^ data_i[19]) ^ data_i[15]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_43 = data_i[7];
  assign _zz_crc_o_44 = (((((((data_i[29] ^ data_i[27]) ^ data_i[25]) ^ data_i[24]) ^ data_i[22]) ^ data_i[20]) ^ data_i[16]) ^ data_i[15]);
  assign _zz_crc_o_45 = data_i[11];
  assign _zz_crc_o_46 = (((((((data_i[30] ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[23]) ^ data_i[21]) ^ data_i[17]) ^ data_i[16]);
  assign _zz_crc_o_47 = data_i[12];
  assign _zz_crc_o_48 = (((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[22]) ^ data_i[18]) ^ data_i[17]);
  assign _zz_crc_o_49 = data_i[13];
  assign _zz_crc_o_50 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[19]) ^ data_i[18]) ^ data_i[16]) ^ data_i[14]) ^ data_i[12]) ^ data_i[11]);
  assign _zz_crc_o_51 = data_i[9];
  assign _zz_crc_o_52 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[27]) ^ data_i[26]) ^ data_i[20]) ^ data_i[19]) ^ data_i[17]) ^ data_i[16]) ^ data_i[15]) ^ data_i[13]) ^ data_i[9]) ^ data_i[6]);
  assign _zz_crc_o_53 = data_i[1];
  assign _zz_crc_o_54 = (((((((((data_i[30] ^ data_i[28]) ^ data_i[27]) ^ data_i[21]) ^ data_i[20]) ^ data_i[18]) ^ data_i[17]) ^ data_i[16]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_55 = data_i[7];
  assign _zz_crc_o_56 = (((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[22]) ^ data_i[21]) ^ data_i[19]) ^ data_i[18]) ^ data_i[17]) ^ data_i[15]) ^ data_i[11]);
  assign _zz_crc_o_57 = data_i[8];
  assign _zz_crc_o_58 = (((((((((((((data_i[31] ^ data_i[28]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[20]) ^ data_i[19]) ^ data_i[18]) ^ data_i[10]) ^ data_i[6]) ^ data_i[4]) ^ data_i[3]);
  assign _zz_crc_o_59 = data_i[0];
  assign _zz_crc_o_60 = (((((((((((data_i[29] ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[21]) ^ data_i[20]) ^ data_i[19]) ^ data_i[11]) ^ data_i[7]) ^ data_i[5]);
  assign _zz_crc_o_61 = data_i[4];
  assign _zz_crc_o_62 = (((((((((((data_i[30] ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[24]) ^ data_i[22]) ^ data_i[21]) ^ data_i[20]) ^ data_i[12]) ^ data_i[8]) ^ data_i[6]);
  assign _zz_crc_o_63 = data_i[5];
  assign _zz_crc_o_64 = (((((((((((data_i[31] ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[25]) ^ data_i[23]) ^ data_i[22]) ^ data_i[21]) ^ data_i[13]) ^ data_i[9]) ^ data_i[7]);
  assign _zz_crc_o_65 = data_i[6];
  assign _zz_crc_o_66 = (((((((((data_i[30] ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[26]) ^ data_i[24]) ^ data_i[23]) ^ data_i[22]) ^ data_i[14]) ^ data_i[10]);
  assign _zz_crc_o_67 = data_i[8];
  assign _zz_crc_o_68 = (((((((((data_i[31] ^ data_i[30]) ^ data_i[29]) ^ data_i[28]) ^ data_i[27]) ^ data_i[25]) ^ data_i[24]) ^ data_i[23]) ^ data_i[15]) ^ data_i[11]);
  assign _zz_crc_o_69 = data_i[9];
  always @(*) begin
    crc_o[0] = ((((((((((((((((_zz_crc_o ^ _zz_crc_o_1) ^ data_i[6]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[12]) ^ crc_i[16]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[1] = ((((((((((((((((_zz_crc_o_2 ^ _zz_crc_o_3) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[28]);
    crc_o[2] = ((((((((((((((((_zz_crc_o_4 ^ _zz_crc_o_5) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[3] = ((((((((((((((((_zz_crc_o_6 ^ _zz_crc_o_7) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[31]);
    crc_o[4] = ((((((((((((((((_zz_crc_o_8 ^ _zz_crc_o_11) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[15]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[5] = ((((((((((((((((_zz_crc_o_12 ^ _zz_crc_o_13) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[28]) ^ crc_i[29]);
    crc_o[6] = ((((((((((((((((_zz_crc_o_14 ^ _zz_crc_o_15) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[14]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[25]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[7] = ((((((((((((((((_zz_crc_o_16 ^ _zz_crc_o_17) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[28]) ^ crc_i[29]);
    crc_o[8] = ((((((((((((((((_zz_crc_o_18 ^ _zz_crc_o_19) ^ data_i[1]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[17]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[9] = ((((((((((((((((_zz_crc_o_20 ^ _zz_crc_o_21) ^ data_i[4]) ^ data_i[2]) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[18]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[29]);
    crc_o[10] = ((((((((((((((((_zz_crc_o_22 ^ _zz_crc_o_23) ^ data_i[2]) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[19]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[11] = ((((((((((((((((_zz_crc_o_24 ^ _zz_crc_o_27) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[20]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[12] = ((((((((((((((((_zz_crc_o_28 ^ _zz_crc_o_31) ^ crc_i[2]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[13] = ((((((((((((((((_zz_crc_o_32 ^ _zz_crc_o_33) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[22]) ^ crc_i[25]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[14] = ((((((((((((((((_zz_crc_o_34 ^ _zz_crc_o_35) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[23]) ^ crc_i[26]) ^ crc_i[29]);
    crc_o[15] = ((((((((((((((((_zz_crc_o_36 ^ _zz_crc_o_37) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[24]) ^ crc_i[27]) ^ crc_i[30]);
    crc_o[16] = ((((((((((((((((_zz_crc_o_38 ^ _zz_crc_o_39) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[8]) ^ crc_i[12]) ^ crc_i[13]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[17] = ((((((((((((((((_zz_crc_o_40 ^ _zz_crc_o_41) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[14]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[30]) ^ crc_i[31]);
    crc_o[18] = ((((((((((((((((_zz_crc_o_42 ^ _zz_crc_o_43) ^ data_i[6]) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[15]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[19] = ((((((((((((((((_zz_crc_o_44 ^ _zz_crc_o_45) ^ data_i[8]) ^ data_i[7]) ^ data_i[3]) ^ crc_i[3]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[29]);
    crc_o[20] = ((((((((((((((((_zz_crc_o_46 ^ _zz_crc_o_47) ^ data_i[9]) ^ data_i[8]) ^ data_i[4]) ^ crc_i[4]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[12]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[21] = ((((((((((((((((_zz_crc_o_48 ^ _zz_crc_o_49) ^ data_i[10]) ^ data_i[9]) ^ data_i[5]) ^ crc_i[5]) ^ crc_i[9]) ^ crc_i[10]) ^ crc_i[13]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[22] = ((((((((((((((((_zz_crc_o_50 ^ _zz_crc_o_51) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[12]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[23] = ((((((((((((((((_zz_crc_o_52 ^ _zz_crc_o_53) ^ data_i[0]) ^ crc_i[0]) ^ crc_i[1]) ^ crc_i[6]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[15]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[24] = ((((((((((((((((_zz_crc_o_54 ^ _zz_crc_o_55) ^ data_i[2]) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[2]) ^ crc_i[7]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[16]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[25] = ((((((((((((((((_zz_crc_o_56 ^ _zz_crc_o_57) ^ data_i[3]) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[3]) ^ crc_i[8]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[17]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[26] = ((((((((((((((((_zz_crc_o_58 ^ _zz_crc_o_59) ^ crc_i[0]) ^ crc_i[3]) ^ crc_i[4]) ^ crc_i[6]) ^ crc_i[10]) ^ crc_i[18]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[28]) ^ crc_i[31]);
    crc_o[27] = ((((((((((((((((_zz_crc_o_60 ^ _zz_crc_o_61) ^ data_i[1]) ^ crc_i[1]) ^ crc_i[4]) ^ crc_i[5]) ^ crc_i[7]) ^ crc_i[11]) ^ crc_i[19]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[29]);
    crc_o[28] = ((((((((((((((((_zz_crc_o_62 ^ _zz_crc_o_63) ^ data_i[2]) ^ crc_i[2]) ^ crc_i[5]) ^ crc_i[6]) ^ crc_i[8]) ^ crc_i[12]) ^ crc_i[20]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[30]);
    crc_o[29] = ((((((((((((((((_zz_crc_o_64 ^ _zz_crc_o_65) ^ data_i[3]) ^ crc_i[3]) ^ crc_i[6]) ^ crc_i[7]) ^ crc_i[9]) ^ crc_i[13]) ^ crc_i[21]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[25]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[31]);
    crc_o[30] = ((((((((((((((((_zz_crc_o_66 ^ _zz_crc_o_67) ^ data_i[7]) ^ data_i[4]) ^ crc_i[4]) ^ crc_i[7]) ^ crc_i[8]) ^ crc_i[10]) ^ crc_i[14]) ^ crc_i[22]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[26]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]);
    crc_o[31] = ((((((((((((((((_zz_crc_o_68 ^ _zz_crc_o_69) ^ data_i[8]) ^ data_i[5]) ^ crc_i[5]) ^ crc_i[8]) ^ crc_i[9]) ^ crc_i[11]) ^ crc_i[15]) ^ crc_i[23]) ^ crc_i[24]) ^ crc_i[25]) ^ crc_i[27]) ^ crc_i[28]) ^ crc_i[29]) ^ crc_i[30]) ^ crc_i[31]);
  end


endmodule
