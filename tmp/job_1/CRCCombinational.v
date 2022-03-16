// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : CRCCombinational


`define CRCCombinationalCmdMode_binary_sequential_type [0:0]
`define CRCCombinationalCmdMode_binary_sequential_INIT 1'b0
`define CRCCombinationalCmdMode_binary_sequential_UPDATE 1'b1


module CRCCombinational (
  input               io_cmd_valid,
  input      `CRCCombinationalCmdMode_binary_sequential_type io_cmd_payload_mode,
  input      [31:0]   io_cmd_payload_data,
  output     [31:0]   io_crc,
  input               clk,
  input               reset
);
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
  reg        [31:0]   _zz_dataIn;
  reg        [31:0]   dataIn;
  reg        [31:0]   next_crc;
  wire                when_CRCCombinational_l81;
  wire                when_CRCCombinational_l86;
  reg        [31:0]   result_reflected;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  assign _zz_next_crc = (((((((((dataIn[0] ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[10]) ^ dataIn[12]) ^ dataIn[16]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[28]);
  assign _zz_next_crc_1 = dataIn[29];
  assign _zz_next_crc_2 = (((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[13]) ^ dataIn[16]) ^ dataIn[17]);
  assign _zz_next_crc_3 = dataIn[24];
  assign _zz_next_crc_4 = (((((((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[2]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[24]) ^ dataIn[26]) ^ dataIn[30]) ^ dataIn[31]);
  assign _zz_next_crc_5 = crc_reg[0];
  assign _zz_next_crc_6 = (((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[25]) ^ dataIn[27]);
  assign _zz_next_crc_7 = dataIn[31];
  assign _zz_next_crc_8 = ((((((((((((((((_zz_next_crc_9 ^ _zz_next_crc_10) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[15]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[29]) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[0]);
  assign _zz_next_crc_11 = crc_reg[2];
  assign _zz_next_crc_9 = (dataIn[0] ^ dataIn[2]);
  assign _zz_next_crc_10 = dataIn[3];
  assign _zz_next_crc_12 = (((((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[13]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[24]) ^ dataIn[28]);
  assign _zz_next_crc_13 = dataIn[29];
  assign _zz_next_crc_14 = (((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[14]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[25]) ^ dataIn[29]);
  assign _zz_next_crc_15 = dataIn[30];
  assign _zz_next_crc_16 = (((((((((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[10]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[28]) ^ dataIn[29]);
  assign _zz_next_crc_17 = crc_reg[0];
  assign _zz_next_crc_18 = (((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[8]) ^ dataIn[10]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[17]) ^ dataIn[22]);
  assign _zz_next_crc_19 = dataIn[23];
  assign _zz_next_crc_20 = (((((((dataIn[1] ^ dataIn[2]) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[13]);
  assign _zz_next_crc_21 = dataIn[18];
  assign _zz_next_crc_22 = (((((((((dataIn[0] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[19]) ^ dataIn[26]);
  assign _zz_next_crc_23 = dataIn[28];
  assign _zz_next_crc_24 = ((((((((((((((((_zz_next_crc_25 ^ _zz_next_crc_26) ^ dataIn[4]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[20]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[27]) ^ dataIn[28]) ^ dataIn[31]) ^ crc_reg[0]);
  assign _zz_next_crc_27 = crc_reg[1];
  assign _zz_next_crc_25 = (dataIn[0] ^ dataIn[1]);
  assign _zz_next_crc_26 = dataIn[3];
  assign _zz_next_crc_28 = ((((((((((((((((_zz_next_crc_29 ^ _zz_next_crc_30) ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[13]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[21]) ^ dataIn[24]) ^ dataIn[27]) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[0]);
  assign _zz_next_crc_31 = crc_reg[1];
  assign _zz_next_crc_29 = (dataIn[0] ^ dataIn[1]);
  assign _zz_next_crc_30 = dataIn[2];
  assign _zz_next_crc_32 = (((((((((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[3]) ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[22]) ^ dataIn[25]) ^ dataIn[28]) ^ dataIn[31]);
  assign _zz_next_crc_33 = crc_reg[1];
  assign _zz_next_crc_34 = (((((((((((((dataIn[2] ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[23]) ^ dataIn[26]);
  assign _zz_next_crc_35 = dataIn[29];
  assign _zz_next_crc_36 = (((((((((((((dataIn[3] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[18]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[24]) ^ dataIn[27]);
  assign _zz_next_crc_37 = dataIn[30];
  assign _zz_next_crc_38 = (((((((((((dataIn[0] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[8]) ^ dataIn[12]) ^ dataIn[13]) ^ dataIn[17]) ^ dataIn[19]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[24]) ^ dataIn[26]);
  assign _zz_next_crc_39 = dataIn[29];
  assign _zz_next_crc_40 = (((((((((((dataIn[1] ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[14]) ^ dataIn[18]) ^ dataIn[20]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[25]) ^ dataIn[27]);
  assign _zz_next_crc_41 = dataIn[30];
  assign _zz_next_crc_42 = (((((((((dataIn[2] ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[15]) ^ dataIn[19]) ^ dataIn[21]) ^ dataIn[23]) ^ dataIn[24]);
  assign _zz_next_crc_43 = dataIn[26];
  assign _zz_next_crc_44 = (((((((dataIn[3] ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[20]) ^ dataIn[22]);
  assign _zz_next_crc_45 = dataIn[24];
  assign _zz_next_crc_46 = (((((((dataIn[4] ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[12]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[21]) ^ dataIn[23]);
  assign _zz_next_crc_47 = dataIn[25];
  assign _zz_next_crc_48 = (((((((dataIn[5] ^ dataIn[9]) ^ dataIn[10]) ^ dataIn[13]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[22]) ^ dataIn[24]);
  assign _zz_next_crc_49 = dataIn[26];
  assign _zz_next_crc_50 = (((((((((((dataIn[0] ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[12]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_51 = dataIn[29];
  assign _zz_next_crc_52 = (((((((((((dataIn[0] ^ dataIn[1]) ^ dataIn[6]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[15]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_53 = dataIn[29];
  assign _zz_next_crc_54 = (((((((((dataIn[1] ^ dataIn[2]) ^ dataIn[7]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[16]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[20]) ^ dataIn[21]);
  assign _zz_next_crc_55 = dataIn[27];
  assign _zz_next_crc_56 = (((((((((dataIn[2] ^ dataIn[3]) ^ dataIn[8]) ^ dataIn[11]) ^ dataIn[15]) ^ dataIn[17]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[21]) ^ dataIn[22]);
  assign _zz_next_crc_57 = dataIn[28];
  assign _zz_next_crc_58 = (((((((((((((dataIn[0] ^ dataIn[3]) ^ dataIn[4]) ^ dataIn[6]) ^ dataIn[10]) ^ dataIn[18]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[28]);
  assign _zz_next_crc_59 = dataIn[31];
  assign _zz_next_crc_60 = (((((((((((dataIn[1] ^ dataIn[4]) ^ dataIn[5]) ^ dataIn[7]) ^ dataIn[11]) ^ dataIn[19]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]);
  assign _zz_next_crc_61 = dataIn[27];
  assign _zz_next_crc_62 = (((((((((((dataIn[2] ^ dataIn[5]) ^ dataIn[6]) ^ dataIn[8]) ^ dataIn[12]) ^ dataIn[20]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_63 = dataIn[28];
  assign _zz_next_crc_64 = (((((((((((dataIn[3] ^ dataIn[6]) ^ dataIn[7]) ^ dataIn[9]) ^ dataIn[13]) ^ dataIn[21]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[25]) ^ dataIn[26]) ^ dataIn[27]) ^ dataIn[28]);
  assign _zz_next_crc_65 = dataIn[29];
  assign _zz_next_crc_66 = (((((((((dataIn[4] ^ dataIn[7]) ^ dataIn[8]) ^ dataIn[10]) ^ dataIn[14]) ^ dataIn[22]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[26]) ^ dataIn[27]);
  assign _zz_next_crc_67 = dataIn[28];
  assign _zz_next_crc_68 = (((((((((dataIn[5] ^ dataIn[8]) ^ dataIn[9]) ^ dataIn[11]) ^ dataIn[15]) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[25]) ^ dataIn[27]) ^ dataIn[28]);
  assign _zz_next_crc_69 = dataIn[29];
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      `CRCCombinationalCmdMode_binary_sequential_INIT : io_cmd_payload_mode_string = "INIT  ";
      `CRCCombinationalCmdMode_binary_sequential_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_dataIn[0] = io_cmd_payload_data[31];
    _zz_dataIn[1] = io_cmd_payload_data[30];
    _zz_dataIn[2] = io_cmd_payload_data[29];
    _zz_dataIn[3] = io_cmd_payload_data[28];
    _zz_dataIn[4] = io_cmd_payload_data[27];
    _zz_dataIn[5] = io_cmd_payload_data[26];
    _zz_dataIn[6] = io_cmd_payload_data[25];
    _zz_dataIn[7] = io_cmd_payload_data[24];
    _zz_dataIn[8] = io_cmd_payload_data[23];
    _zz_dataIn[9] = io_cmd_payload_data[22];
    _zz_dataIn[10] = io_cmd_payload_data[21];
    _zz_dataIn[11] = io_cmd_payload_data[20];
    _zz_dataIn[12] = io_cmd_payload_data[19];
    _zz_dataIn[13] = io_cmd_payload_data[18];
    _zz_dataIn[14] = io_cmd_payload_data[17];
    _zz_dataIn[15] = io_cmd_payload_data[16];
    _zz_dataIn[16] = io_cmd_payload_data[15];
    _zz_dataIn[17] = io_cmd_payload_data[14];
    _zz_dataIn[18] = io_cmd_payload_data[13];
    _zz_dataIn[19] = io_cmd_payload_data[12];
    _zz_dataIn[20] = io_cmd_payload_data[11];
    _zz_dataIn[21] = io_cmd_payload_data[10];
    _zz_dataIn[22] = io_cmd_payload_data[9];
    _zz_dataIn[23] = io_cmd_payload_data[8];
    _zz_dataIn[24] = io_cmd_payload_data[7];
    _zz_dataIn[25] = io_cmd_payload_data[6];
    _zz_dataIn[26] = io_cmd_payload_data[5];
    _zz_dataIn[27] = io_cmd_payload_data[4];
    _zz_dataIn[28] = io_cmd_payload_data[3];
    _zz_dataIn[29] = io_cmd_payload_data[2];
    _zz_dataIn[30] = io_cmd_payload_data[1];
    _zz_dataIn[31] = io_cmd_payload_data[0];
  end

  always @(*) begin
    dataIn[31 : 24] = _zz_dataIn[7 : 0];
    dataIn[23 : 16] = _zz_dataIn[15 : 8];
    dataIn[15 : 8] = _zz_dataIn[23 : 16];
    dataIn[7 : 0] = _zz_dataIn[31 : 24];
  end

  always @(*) begin
    next_crc[0] = ((((((((((((((((_zz_next_crc ^ _zz_next_crc_1) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[1] = ((((((((((((((((_zz_next_crc_2 ^ _zz_next_crc_3) ^ dataIn[27]) ^ dataIn[28]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[28]);
    next_crc[2] = ((((((((((((((((_zz_next_crc_4 ^ _zz_next_crc_5) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[3] = ((((((((((((((((_zz_next_crc_6 ^ _zz_next_crc_7) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[31]);
    next_crc[4] = ((((((((((((((((_zz_next_crc_8 ^ _zz_next_crc_11) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[5] = ((((((((((((((((_zz_next_crc_12 ^ _zz_next_crc_13) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[6] = ((((((((((((((((_zz_next_crc_14 ^ _zz_next_crc_15) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[7] = ((((((((((((((((_zz_next_crc_16 ^ _zz_next_crc_17) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[29]);
    next_crc[8] = ((((((((((((((((_zz_next_crc_18 ^ _zz_next_crc_19) ^ dataIn[28]) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[17]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[9] = ((((((((((((((((_zz_next_crc_20 ^ _zz_next_crc_21) ^ dataIn[23]) ^ dataIn[24]) ^ dataIn[29]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[18]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[29]);
    next_crc[10] = ((((((((((((((((_zz_next_crc_22 ^ _zz_next_crc_23) ^ dataIn[29]) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[19]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[11] = ((((((((((((((((_zz_next_crc_24 ^ _zz_next_crc_27) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[20]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[12] = ((((((((((((((((_zz_next_crc_28 ^ _zz_next_crc_31) ^ crc_reg[2]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[13] = ((((((((((((((((_zz_next_crc_32 ^ _zz_next_crc_33) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[22]) ^ crc_reg[25]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[14] = ((((((((((((((((_zz_next_crc_34 ^ _zz_next_crc_35) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[23]) ^ crc_reg[26]) ^ crc_reg[29]);
    next_crc[15] = ((((((((((((((((_zz_next_crc_36 ^ _zz_next_crc_37) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[24]) ^ crc_reg[27]) ^ crc_reg[30]);
    next_crc[16] = ((((((((((((((((_zz_next_crc_38 ^ _zz_next_crc_39) ^ dataIn[30]) ^ crc_reg[0]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[17] = ((((((((((((((((_zz_next_crc_40 ^ _zz_next_crc_41) ^ dataIn[31]) ^ crc_reg[1]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[14]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[30]) ^ crc_reg[31]);
    next_crc[18] = ((((((((((((((((_zz_next_crc_42 ^ _zz_next_crc_43) ^ dataIn[28]) ^ dataIn[31]) ^ crc_reg[2]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[15]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[19] = ((((((((((((((((_zz_next_crc_44 ^ _zz_next_crc_45) ^ dataIn[25]) ^ dataIn[27]) ^ dataIn[29]) ^ crc_reg[3]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[20] = ((((((((((((((((_zz_next_crc_46 ^ _zz_next_crc_47) ^ dataIn[26]) ^ dataIn[28]) ^ dataIn[30]) ^ crc_reg[4]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[12]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[21] = ((((((((((((((((_zz_next_crc_48 ^ _zz_next_crc_49) ^ dataIn[27]) ^ dataIn[29]) ^ dataIn[31]) ^ crc_reg[5]) ^ crc_reg[9]) ^ crc_reg[10]) ^ crc_reg[13]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[22] = ((((((((((((((((_zz_next_crc_50 ^ _zz_next_crc_51) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[12]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[23] = ((((((((((((((((_zz_next_crc_52 ^ _zz_next_crc_53) ^ dataIn[31]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[6]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[15]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[24] = ((((((((((((((((_zz_next_crc_54 ^ _zz_next_crc_55) ^ dataIn[28]) ^ dataIn[30]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[7]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[16]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[25] = ((((((((((((((((_zz_next_crc_56 ^ _zz_next_crc_57) ^ dataIn[29]) ^ dataIn[31]) ^ crc_reg[2]) ^ crc_reg[3]) ^ crc_reg[8]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[17]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[26] = ((((((((((((((((_zz_next_crc_58 ^ _zz_next_crc_59) ^ crc_reg[0]) ^ crc_reg[3]) ^ crc_reg[4]) ^ crc_reg[6]) ^ crc_reg[10]) ^ crc_reg[18]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[28]) ^ crc_reg[31]);
    next_crc[27] = ((((((((((((((((_zz_next_crc_60 ^ _zz_next_crc_61) ^ dataIn[29]) ^ crc_reg[1]) ^ crc_reg[4]) ^ crc_reg[5]) ^ crc_reg[7]) ^ crc_reg[11]) ^ crc_reg[19]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[29]);
    next_crc[28] = ((((((((((((((((_zz_next_crc_62 ^ _zz_next_crc_63) ^ dataIn[30]) ^ crc_reg[2]) ^ crc_reg[5]) ^ crc_reg[6]) ^ crc_reg[8]) ^ crc_reg[12]) ^ crc_reg[20]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[30]);
    next_crc[29] = ((((((((((((((((_zz_next_crc_64 ^ _zz_next_crc_65) ^ dataIn[31]) ^ crc_reg[3]) ^ crc_reg[6]) ^ crc_reg[7]) ^ crc_reg[9]) ^ crc_reg[13]) ^ crc_reg[21]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[25]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[31]);
    next_crc[30] = ((((((((((((((((_zz_next_crc_66 ^ _zz_next_crc_67) ^ dataIn[29]) ^ dataIn[30]) ^ crc_reg[4]) ^ crc_reg[7]) ^ crc_reg[8]) ^ crc_reg[10]) ^ crc_reg[14]) ^ crc_reg[22]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[26]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]);
    next_crc[31] = ((((((((((((((((_zz_next_crc_68 ^ _zz_next_crc_69) ^ dataIn[30]) ^ dataIn[31]) ^ crc_reg[5]) ^ crc_reg[8]) ^ crc_reg[9]) ^ crc_reg[11]) ^ crc_reg[15]) ^ crc_reg[23]) ^ crc_reg[24]) ^ crc_reg[25]) ^ crc_reg[27]) ^ crc_reg[28]) ^ crc_reg[29]) ^ crc_reg[30]) ^ crc_reg[31]);
  end

  assign when_CRCCombinational_l81 = (io_cmd_valid && (io_cmd_payload_mode == `CRCCombinationalCmdMode_binary_sequential_INIT));
  assign when_CRCCombinational_l86 = (io_cmd_valid && (io_cmd_payload_mode == `CRCCombinationalCmdMode_binary_sequential_UPDATE));
  always @(*) begin
    result_reflected[0] = crc_reg[31];
    result_reflected[1] = crc_reg[30];
    result_reflected[2] = crc_reg[29];
    result_reflected[3] = crc_reg[28];
    result_reflected[4] = crc_reg[27];
    result_reflected[5] = crc_reg[26];
    result_reflected[6] = crc_reg[25];
    result_reflected[7] = crc_reg[24];
    result_reflected[8] = crc_reg[23];
    result_reflected[9] = crc_reg[22];
    result_reflected[10] = crc_reg[21];
    result_reflected[11] = crc_reg[20];
    result_reflected[12] = crc_reg[19];
    result_reflected[13] = crc_reg[18];
    result_reflected[14] = crc_reg[17];
    result_reflected[15] = crc_reg[16];
    result_reflected[16] = crc_reg[15];
    result_reflected[17] = crc_reg[14];
    result_reflected[18] = crc_reg[13];
    result_reflected[19] = crc_reg[12];
    result_reflected[20] = crc_reg[11];
    result_reflected[21] = crc_reg[10];
    result_reflected[22] = crc_reg[9];
    result_reflected[23] = crc_reg[8];
    result_reflected[24] = crc_reg[7];
    result_reflected[25] = crc_reg[6];
    result_reflected[26] = crc_reg[5];
    result_reflected[27] = crc_reg[4];
    result_reflected[28] = crc_reg[3];
    result_reflected[29] = crc_reg[2];
    result_reflected[30] = crc_reg[1];
    result_reflected[31] = crc_reg[0];
  end

  assign io_crc = (result_reflected ^ 32'hffffffff);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      crc_reg <= 32'hffffffff;
    end else begin
      if(when_CRCCombinational_l81) begin
        crc_reg <= 32'hffffffff;
      end
      if(when_CRCCombinational_l86) begin
        crc_reg <= next_crc;
      end
    end
  end


endmodule
