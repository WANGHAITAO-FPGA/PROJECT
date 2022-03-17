// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : CRCCombinational
// Git hash  : e12463ecd71b83aebd7d90cc6cfe530450f7b623

`timescale 1ns/1ps 

module CRCCombinational (
  input               io_cmd_valid,
  input      [0:0]    io_cmd_payload_mode,
  input      [31:0]   io_cmd_payload_data,
  output     [31:0]   io_crc,
  input               clk,
  input               reset
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;

  wire                _zz_next_crc;
  wire                _zz_next_crc_1;
  wire                _zz_next_crc_2;
  wire                _zz_next_crc_3;
  wire                _zz_next_crc_4;
  wire                _zz_next_crc_5;
  wire                _zz_next_crc_6;
  wire                _zz_next_crc_7;
  wire                _zz_next_crc_8;
  wire                _zz_next_crc_9;
  wire                _zz_next_crc_10;
  wire                _zz_next_crc_11;
  wire                _zz_next_crc_12;
  wire                _zz_next_crc_13;
  wire                _zz_next_crc_14;
  wire                _zz_next_crc_15;
  wire                _zz_next_crc_16;
  wire                _zz_next_crc_17;
  wire                _zz_next_crc_18;
  wire                _zz_next_crc_19;
  wire                _zz_next_crc_20;
  wire                _zz_next_crc_21;
  wire                _zz_next_crc_22;
  wire                _zz_next_crc_23;
  wire                _zz_next_crc_24;
  wire                _zz_next_crc_25;
  wire                _zz_next_crc_26;
  wire                _zz_next_crc_27;
  wire                _zz_next_crc_28;
  wire                _zz_next_crc_29;
  wire                _zz_next_crc_30;
  wire                _zz_next_crc_31;
  wire                _zz_next_crc_32;
  wire                _zz_next_crc_33;
  wire                _zz_next_crc_34;
  wire                _zz_next_crc_35;
  wire                _zz_next_crc_36;
  wire                _zz_next_crc_37;
  wire                _zz_next_crc_38;
  wire                _zz_next_crc_39;
  wire                _zz_next_crc_40;
  wire                _zz_next_crc_41;
  wire                _zz_next_crc_42;
  wire                _zz_next_crc_43;
  wire                _zz_next_crc_44;
  wire                _zz_next_crc_45;
  wire                _zz_next_crc_46;
  wire                _zz_next_crc_47;
  wire                _zz_next_crc_48;
  wire                _zz_next_crc_49;
  wire                _zz_next_crc_50;
  wire                _zz_next_crc_51;
  wire                _zz_next_crc_52;
  wire                _zz_next_crc_53;
  wire                _zz_next_crc_54;
  wire                _zz_next_crc_55;
  wire                _zz_next_crc_56;
  wire                _zz_next_crc_57;
  wire                _zz_next_crc_58;
  wire                _zz_next_crc_59;
  wire                _zz_next_crc_60;
  wire                _zz_next_crc_61;
  wire                _zz_next_crc_62;
  wire                _zz_next_crc_63;
  wire                _zz_next_crc_64;
  wire                _zz_next_crc_65;
  wire                _zz_next_crc_66;
  wire                _zz_next_crc_67;
  wire                _zz_next_crc_68;
  wire                _zz_next_crc_69;
  reg        [31:0]   crc_reg;
  reg        [31:0]   next_crc;
  wire                when_CRCCombinational_l83;
  wire                when_CRCCombinational_l88;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_next_crc = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_1 = io_cmd_payload_data[29];
  assign _zz_next_crc_2 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]);
  assign _zz_next_crc_3 = io_cmd_payload_data[24];
  assign _zz_next_crc_4 = (((((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]);
  assign _zz_next_crc_5 = crc_reg[0];
  assign _zz_next_crc_6 = (((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_7 = io_cmd_payload_data[31];
  assign _zz_next_crc_8 = ((((((((((((((((_zz_next_crc_9 ^ _zz_next_crc_10) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_11 = crc_reg[2];
  assign _zz_next_crc_9 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[2]);
  assign _zz_next_crc_10 = io_cmd_payload_data[3];
  assign _zz_next_crc_12 = (((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_13 = io_cmd_payload_data[29];
  assign _zz_next_crc_14 = (((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[29]);
  assign _zz_next_crc_15 = io_cmd_payload_data[30];
  assign _zz_next_crc_16 = (((((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[29]);
  assign _zz_next_crc_17 = crc_reg[0];
  assign _zz_next_crc_18 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_19 = io_cmd_payload_data[23];
  assign _zz_next_crc_20 = (((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]);
  assign _zz_next_crc_21 = io_cmd_payload_data[18];
  assign _zz_next_crc_22 = (((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_23 = io_cmd_payload_data[28];
  assign _zz_next_crc_24 = ((((((((((((((((_zz_next_crc_25 ^ _zz_next_crc_26) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_27 = crc_reg[1];
  assign _zz_next_crc_25 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[1]);
  assign _zz_next_crc_26 = io_cmd_payload_data[3];
  assign _zz_next_crc_28 = ((((((((((((((((_zz_next_crc_29 ^ _zz_next_crc_30) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]);
  assign _zz_next_crc_31 = crc_reg[1];
  assign _zz_next_crc_29 = (io_cmd_payload_data[0] ^ io_cmd_payload_data[1]);
  assign _zz_next_crc_30 = io_cmd_payload_data[2];
  assign _zz_next_crc_32 = (((((((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]);
  assign _zz_next_crc_33 = crc_reg[1];
  assign _zz_next_crc_34 = (((((((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_35 = io_cmd_payload_data[29];
  assign _zz_next_crc_36 = (((((((((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_37 = io_cmd_payload_data[30];
  assign _zz_next_crc_38 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_39 = io_cmd_payload_data[29];
  assign _zz_next_crc_40 = (((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_41 = io_cmd_payload_data[30];
  assign _zz_next_crc_42 = (((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]);
  assign _zz_next_crc_43 = io_cmd_payload_data[26];
  assign _zz_next_crc_44 = (((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_45 = io_cmd_payload_data[24];
  assign _zz_next_crc_46 = (((((((io_cmd_payload_data[4] ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]);
  assign _zz_next_crc_47 = io_cmd_payload_data[25];
  assign _zz_next_crc_48 = (((((((io_cmd_payload_data[5] ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]);
  assign _zz_next_crc_49 = io_cmd_payload_data[26];
  assign _zz_next_crc_50 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_51 = io_cmd_payload_data[29];
  assign _zz_next_crc_52 = (((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_53 = io_cmd_payload_data[29];
  assign _zz_next_crc_54 = (((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[16]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]);
  assign _zz_next_crc_55 = io_cmd_payload_data[27];
  assign _zz_next_crc_56 = (((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[17]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]);
  assign _zz_next_crc_57 = io_cmd_payload_data[28];
  assign _zz_next_crc_58 = (((((((((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[18]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_59 = io_cmd_payload_data[31];
  assign _zz_next_crc_60 = (((((((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[4]) ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[19]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]);
  assign _zz_next_crc_61 = io_cmd_payload_data[27];
  assign _zz_next_crc_62 = (((((((((((io_cmd_payload_data[2] ^ io_cmd_payload_data[5]) ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[12]) ^ io_cmd_payload_data[20]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_63 = io_cmd_payload_data[28];
  assign _zz_next_crc_64 = (((((((((((io_cmd_payload_data[3] ^ io_cmd_payload_data[6]) ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[13]) ^ io_cmd_payload_data[21]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_65 = io_cmd_payload_data[29];
  assign _zz_next_crc_66 = (((((((((io_cmd_payload_data[4] ^ io_cmd_payload_data[7]) ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[10]) ^ io_cmd_payload_data[14]) ^ io_cmd_payload_data[22]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[27]);
  assign _zz_next_crc_67 = io_cmd_payload_data[28];
  assign _zz_next_crc_68 = (((((((((io_cmd_payload_data[5] ^ io_cmd_payload_data[8]) ^ io_cmd_payload_data[9]) ^ io_cmd_payload_data[11]) ^ io_cmd_payload_data[15]) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]);
  assign _zz_next_crc_69 = io_cmd_payload_data[29];
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CRCCombinationalCmdMode_INIT : io_cmd_payload_mode_string = "INIT  ";
      CRCCombinationalCmdMode_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    next_crc[0] = ((((((((((((((((_zz_next_crc ^ _zz_next_crc_1) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[1] = ((((((((((((((((_zz_next_crc_2 ^ _zz_next_crc_3) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[28]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[2] = ((((((((((((((((_zz_next_crc_4 ^ _zz_next_crc_5) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[3] = ((((((((((((((((_zz_next_crc_6 ^ _zz_next_crc_7) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[4] = ((((((((((((((((_zz_next_crc_8 ^ _zz_next_crc_11) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[5] = ((((((((((((((((_zz_next_crc_12 ^ _zz_next_crc_13) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[6] = ((((((((((((((((_zz_next_crc_14 ^ _zz_next_crc_15) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[7] = ((((((((((((((((_zz_next_crc_16 ^ _zz_next_crc_17) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[8] = ((((((((((((((((_zz_next_crc_18 ^ _zz_next_crc_19) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[17]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[9] = ((((((((((((((((_zz_next_crc_20 ^ _zz_next_crc_21) ^ io_cmd_payload_data[23]) ^ io_cmd_payload_data[24]) ^ io_cmd_payload_data[29]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[18]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[29]);
    next_crc[10] = ((((((((((((((((_zz_next_crc_22 ^ _zz_next_crc_23) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[19]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[11] = ((((((((((((((((_zz_next_crc_24 ^ _zz_next_crc_27) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[12] = ((((((((((((((((_zz_next_crc_28 ^ _zz_next_crc_31) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[13] = ((((((((((((((((_zz_next_crc_32 ^ _zz_next_crc_33) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[14] = ((((((((((((((((_zz_next_crc_34 ^ _zz_next_crc_35) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[23]) ^ crc_reg[26]) ^ crc_reg[29]);
    next_crc[15] = ((((((((((((((((_zz_next_crc_36 ^ _zz_next_crc_37) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]);
    next_crc[16] = ((((((((((((((((_zz_next_crc_38 ^ _zz_next_crc_39) ^ io_cmd_payload_data[30]) ^ crc_reg[0]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[17] = ((((((((((((((((_zz_next_crc_40 ^ _zz_next_crc_41) ^ io_cmd_payload_data[31]) ^ crc_reg[1]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[18] = ((((((((((((((((_zz_next_crc_42 ^ _zz_next_crc_43) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[31]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[19] = ((((((((((((((((_zz_next_crc_44 ^ _zz_next_crc_45) ^ io_cmd_payload_data[25]) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[29]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[20] = ((((((((((((((((_zz_next_crc_46 ^ _zz_next_crc_47) ^ io_cmd_payload_data[26]) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[30]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[21] = ((((((((((((((((_zz_next_crc_48 ^ _zz_next_crc_49) ^ io_cmd_payload_data[27]) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[22] = ((((((((((((((((_zz_next_crc_50 ^ _zz_next_crc_51) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[23] = ((((((((((((((((_zz_next_crc_52 ^ _zz_next_crc_53) ^ io_cmd_payload_data[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[24] = ((((((((((((((((_zz_next_crc_54 ^ _zz_next_crc_55) ^ io_cmd_payload_data[28]) ^ io_cmd_payload_data[30]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[25] = ((((((((((((((((_zz_next_crc_56 ^ _zz_next_crc_57) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[31]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[26] = ((((((((((((((((_zz_next_crc_58 ^ _zz_next_crc_59) ^ crc_reg[0]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[10]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[27] = ((((((((((((((((_zz_next_crc_60 ^ _zz_next_crc_61) ^ io_cmd_payload_data[29]) ^ crc_reg[1]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[11]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[28] = ((((((((((((((((_zz_next_crc_62 ^ _zz_next_crc_63) ^ io_cmd_payload_data[30]) ^ crc_reg[2]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[29] = ((((((((((((((((_zz_next_crc_64 ^ _zz_next_crc_65) ^ io_cmd_payload_data[31]) ^ crc_reg[3]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[30] = ((((((((((((((((_zz_next_crc_66 ^ _zz_next_crc_67) ^ io_cmd_payload_data[29]) ^ io_cmd_payload_data[30]) ^ crc_reg[4]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[31] = ((((((((((((((((_zz_next_crc_68 ^ _zz_next_crc_69) ^ io_cmd_payload_data[30]) ^ io_cmd_payload_data[31]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
  end

  assign when_CRCCombinational_l83 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_INIT));
  assign when_CRCCombinational_l88 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_UPDATE));
  assign io_crc = (crc_reg ^ 32'h0);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      crc_reg <= 32'hffffffff;
    end else begin
      if(when_CRCCombinational_l83) begin
        crc_reg <= 32'hffffffff;
      end
      if(when_CRCCombinational_l88) begin
        crc_reg <= next_crc;
      end
    end
  end


endmodule
