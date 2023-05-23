// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Bitonic
// Git hash  : 97a059ff96a5911e180604c977169aa06554a43e

`timescale 1ns/1ps

module Bitonic (
  input               dataIn_valid,
  input      [15:0]   dataIn_payload_0,
  input      [15:0]   dataIn_payload_1,
  input      [15:0]   dataIn_payload_2,
  input      [15:0]   dataIn_payload_3,
  input      [15:0]   dataIn_payload_4,
  input      [15:0]   dataIn_payload_5,
  input      [15:0]   dataIn_payload_6,
  input      [15:0]   dataIn_payload_7,
  output              dataOut_valid,
  output     [15:0]   dataOut_payload_0,
  output     [15:0]   dataOut_payload_1,
  output     [15:0]   dataOut_payload_2,
  output     [15:0]   dataOut_payload_3,
  output     [15:0]   dataOut_payload_4,
  output     [15:0]   dataOut_payload_5,
  output     [15:0]   dataOut_payload_6,
  output     [15:0]   dataOut_payload_7,
  input               clk,
  input               reset
);

  wire                _zz_dataOut_payload_0;
  wire                _zz_dataOut_payload_0_1;
  wire                _zz_dataOut_payload_0_2;
  wire                _zz_dataOut_payload_0_3;
  reg        [15:0]   _zz_dataOut_payload_0_4;
  reg        [15:0]   _zz_dataOut_payload_0_5;
  reg        [15:0]   _zz_dataOut_payload_0_6;
  reg        [15:0]   _zz_dataOut_payload_0_7;
  reg        [15:0]   _zz_dataOut_payload_0_8;
  reg        [15:0]   _zz_dataOut_payload_0_9;
  reg        [15:0]   _zz_dataOut_payload_0_10;
  reg        [15:0]   _zz_dataOut_payload_0_11;
  wire                _zz_dataOut_payload_0_12;
  wire       [15:0]   _zz_dataOut_payload_0_13;
  wire       [15:0]   _zz_dataOut_payload_0_14;
  wire                _zz_dataOut_payload_0_15;
  wire       [15:0]   _zz_dataOut_payload_0_16;
  wire       [15:0]   _zz_dataOut_payload_0_17;
  wire                _zz_dataOut_payload_0_18;
  wire                _zz_dataOut_payload_0_19;
  reg        [15:0]   _zz_dataOut_payload_0_20;
  reg        [15:0]   _zz_dataOut_payload_0_21;
  reg        [15:0]   _zz_dataOut_payload_0_22;
  reg        [15:0]   _zz_dataOut_payload_0_23;
  wire                _zz_dataOut_payload_0_24;
  wire       [15:0]   _zz_dataOut_payload_0_25;
  wire       [15:0]   _zz_dataOut_payload_0_26;
  wire                _zz_dataOut_payload_0_27;
  wire       [15:0]   _zz_dataOut_payload_0_28;
  wire       [15:0]   _zz_dataOut_payload_0_29;
  wire                _zz_dataOut_payload_0_30;
  wire                _zz_dataOut_payload_0_31;
  reg        [15:0]   _zz_dataOut_payload_0_32;
  reg        [15:0]   _zz_dataOut_payload_0_33;
  reg        [15:0]   _zz_dataOut_payload_0_34;
  reg        [15:0]   _zz_dataOut_payload_0_35;
  reg        [15:0]   _zz_dataOut_payload_0_36;
  reg        [15:0]   _zz_dataOut_payload_0_37;
  reg        [15:0]   _zz_dataOut_payload_0_38;
  reg        [15:0]   _zz_dataOut_payload_0_39;
  reg        [15:0]   _zz_dataOut_payload_0_40;
  reg        [15:0]   _zz_dataOut_payload_0_41;
  reg        [15:0]   _zz_dataOut_payload_0_42;
  reg        [15:0]   _zz_dataOut_payload_0_43;
  wire                _zz_dataOut_payload_0_44;
  wire       [15:0]   _zz_dataOut_payload_4;
  wire       [15:0]   _zz_dataOut_payload_0_45;
  wire                _zz_dataOut_payload_0_46;
  wire       [15:0]   _zz_dataOut_payload_4_1;
  wire       [15:0]   _zz_dataOut_payload_0_47;
  wire                _zz_dataOut_payload_0_48;
  wire       [15:0]   _zz_dataOut_payload_4_2;
  wire       [15:0]   _zz_dataOut_payload_0_49;
  wire                _zz_dataOut_payload_0_50;
  wire       [15:0]   _zz_dataOut_payload_4_3;
  wire       [15:0]   _zz_dataOut_payload_0_51;
  wire                _zz_dataOut_payload_0_52;
  wire       [15:0]   _zz_dataOut_payload_2;
  wire       [15:0]   _zz_dataOut_payload_0_53;
  wire                _zz_dataOut_payload_0_54;
  wire       [15:0]   _zz_dataOut_payload_2_1;
  wire       [15:0]   _zz_dataOut_payload_0_55;
  wire                _zz_dataOut_payload_0_56;
  wire                _zz_dataOut_payload_2_2;
  reg        [15:0]   _zz_dataOut_payload_0_57;
  reg        [15:0]   _zz_dataOut_payload_1;
  reg        [15:0]   _zz_dataOut_payload_2_3;
  reg        [15:0]   _zz_dataOut_payload_3;
  wire                _zz_dataOut_payload_4_4;
  wire       [15:0]   _zz_dataOut_payload_6;
  wire       [15:0]   _zz_dataOut_payload_4_5;
  wire                _zz_dataOut_payload_4_6;
  wire       [15:0]   _zz_dataOut_payload_6_1;
  wire       [15:0]   _zz_dataOut_payload_4_7;
  wire                _zz_dataOut_payload_4_8;
  wire                _zz_dataOut_payload_6_2;
  reg        [15:0]   _zz_dataOut_payload_4_9;
  reg        [15:0]   _zz_dataOut_payload_5;
  reg        [15:0]   _zz_dataOut_payload_6_3;
  reg        [15:0]   _zz_dataOut_payload_7;
  reg        [15:0]   _zz_dataOut_payload_0_58;
  reg        [15:0]   _zz_dataOut_payload_1_1;
  reg        [15:0]   _zz_dataOut_payload_2_4;
  reg        [15:0]   _zz_dataOut_payload_3_1;
  reg        [15:0]   _zz_dataOut_payload_4_10;
  reg        [15:0]   _zz_dataOut_payload_5_1;
  reg        [15:0]   _zz_dataOut_payload_6_4;
  reg        [15:0]   _zz_dataOut_payload_7_1;
  reg        [15:0]   _zz_dataOut_payload_0_59;
  reg        [15:0]   _zz_dataOut_payload_1_2;
  reg        [15:0]   _zz_dataOut_payload_2_5;
  reg        [15:0]   _zz_dataOut_payload_3_2;
  reg        [15:0]   _zz_dataOut_payload_4_11;
  reg        [15:0]   _zz_dataOut_payload_5_2;
  reg        [15:0]   _zz_dataOut_payload_6_5;
  reg        [15:0]   _zz_dataOut_payload_7_2;
  reg                 dataIn_valid_delay_1;
  reg                 dataIn_valid_delay_2;
  reg                 dataIn_valid_delay_3;
  reg                 dataIn_valid_delay_4;
  reg                 dataIn_valid_delay_5;
  reg                 dataIn_valid_delay_6;

  assign _zz_dataOut_payload_0 = (dataIn_payload_1 < dataIn_payload_0);
  assign _zz_dataOut_payload_0_1 = (dataIn_payload_3 < dataIn_payload_2);
  assign _zz_dataOut_payload_0_2 = (dataIn_payload_5 < dataIn_payload_4);
  assign _zz_dataOut_payload_0_3 = (dataIn_payload_7 < dataIn_payload_6);
  assign _zz_dataOut_payload_0_12 = (_zz_dataOut_payload_0_7 < _zz_dataOut_payload_0_4);
  assign _zz_dataOut_payload_0_13 = (_zz_dataOut_payload_0_12 ? _zz_dataOut_payload_0_4 : _zz_dataOut_payload_0_7);
  assign _zz_dataOut_payload_0_14 = (_zz_dataOut_payload_0_12 ? _zz_dataOut_payload_0_7 : _zz_dataOut_payload_0_4);
  assign _zz_dataOut_payload_0_15 = (_zz_dataOut_payload_0_6 < _zz_dataOut_payload_0_5);
  assign _zz_dataOut_payload_0_16 = (_zz_dataOut_payload_0_15 ? _zz_dataOut_payload_0_5 : _zz_dataOut_payload_0_6);
  assign _zz_dataOut_payload_0_17 = (_zz_dataOut_payload_0_15 ? _zz_dataOut_payload_0_6 : _zz_dataOut_payload_0_5);
  assign _zz_dataOut_payload_0_18 = (_zz_dataOut_payload_0_17 < _zz_dataOut_payload_0_14);
  assign _zz_dataOut_payload_0_19 = (_zz_dataOut_payload_0_13 < _zz_dataOut_payload_0_16);
  assign _zz_dataOut_payload_0_24 = (_zz_dataOut_payload_0_11 < _zz_dataOut_payload_0_8);
  assign _zz_dataOut_payload_0_25 = (_zz_dataOut_payload_0_24 ? _zz_dataOut_payload_0_8 : _zz_dataOut_payload_0_11);
  assign _zz_dataOut_payload_0_26 = (_zz_dataOut_payload_0_24 ? _zz_dataOut_payload_0_11 : _zz_dataOut_payload_0_8);
  assign _zz_dataOut_payload_0_27 = (_zz_dataOut_payload_0_10 < _zz_dataOut_payload_0_9);
  assign _zz_dataOut_payload_0_28 = (_zz_dataOut_payload_0_27 ? _zz_dataOut_payload_0_9 : _zz_dataOut_payload_0_10);
  assign _zz_dataOut_payload_0_29 = (_zz_dataOut_payload_0_27 ? _zz_dataOut_payload_0_10 : _zz_dataOut_payload_0_9);
  assign _zz_dataOut_payload_0_30 = (_zz_dataOut_payload_0_29 < _zz_dataOut_payload_0_26);
  assign _zz_dataOut_payload_0_31 = (_zz_dataOut_payload_0_25 < _zz_dataOut_payload_0_28);
  assign _zz_dataOut_payload_0_44 = (_zz_dataOut_payload_0_43 < _zz_dataOut_payload_0_36);
  assign _zz_dataOut_payload_4 = (_zz_dataOut_payload_0_44 ? _zz_dataOut_payload_0_36 : _zz_dataOut_payload_0_43);
  assign _zz_dataOut_payload_0_45 = (_zz_dataOut_payload_0_44 ? _zz_dataOut_payload_0_43 : _zz_dataOut_payload_0_36);
  assign _zz_dataOut_payload_0_46 = (_zz_dataOut_payload_0_42 < _zz_dataOut_payload_0_37);
  assign _zz_dataOut_payload_4_1 = (_zz_dataOut_payload_0_46 ? _zz_dataOut_payload_0_37 : _zz_dataOut_payload_0_42);
  assign _zz_dataOut_payload_0_47 = (_zz_dataOut_payload_0_46 ? _zz_dataOut_payload_0_42 : _zz_dataOut_payload_0_37);
  assign _zz_dataOut_payload_0_48 = (_zz_dataOut_payload_0_41 < _zz_dataOut_payload_0_38);
  assign _zz_dataOut_payload_4_2 = (_zz_dataOut_payload_0_48 ? _zz_dataOut_payload_0_38 : _zz_dataOut_payload_0_41);
  assign _zz_dataOut_payload_0_49 = (_zz_dataOut_payload_0_48 ? _zz_dataOut_payload_0_41 : _zz_dataOut_payload_0_38);
  assign _zz_dataOut_payload_0_50 = (_zz_dataOut_payload_0_40 < _zz_dataOut_payload_0_39);
  assign _zz_dataOut_payload_4_3 = (_zz_dataOut_payload_0_50 ? _zz_dataOut_payload_0_39 : _zz_dataOut_payload_0_40);
  assign _zz_dataOut_payload_0_51 = (_zz_dataOut_payload_0_50 ? _zz_dataOut_payload_0_40 : _zz_dataOut_payload_0_39);
  assign _zz_dataOut_payload_0_52 = (_zz_dataOut_payload_0_49 < _zz_dataOut_payload_0_45);
  assign _zz_dataOut_payload_2 = (_zz_dataOut_payload_0_52 ? _zz_dataOut_payload_0_45 : _zz_dataOut_payload_0_49);
  assign _zz_dataOut_payload_0_53 = (_zz_dataOut_payload_0_52 ? _zz_dataOut_payload_0_49 : _zz_dataOut_payload_0_45);
  assign _zz_dataOut_payload_0_54 = (_zz_dataOut_payload_0_51 < _zz_dataOut_payload_0_47);
  assign _zz_dataOut_payload_2_1 = (_zz_dataOut_payload_0_54 ? _zz_dataOut_payload_0_47 : _zz_dataOut_payload_0_51);
  assign _zz_dataOut_payload_0_55 = (_zz_dataOut_payload_0_54 ? _zz_dataOut_payload_0_51 : _zz_dataOut_payload_0_47);
  assign _zz_dataOut_payload_0_56 = (_zz_dataOut_payload_0_55 < _zz_dataOut_payload_0_53);
  assign _zz_dataOut_payload_2_2 = (_zz_dataOut_payload_2_1 < _zz_dataOut_payload_2);
  assign _zz_dataOut_payload_4_4 = (_zz_dataOut_payload_4_1 < _zz_dataOut_payload_4_3);
  assign _zz_dataOut_payload_6 = (_zz_dataOut_payload_4_4 ? _zz_dataOut_payload_4_3 : _zz_dataOut_payload_4_1);
  assign _zz_dataOut_payload_4_5 = (_zz_dataOut_payload_4_4 ? _zz_dataOut_payload_4_1 : _zz_dataOut_payload_4_3);
  assign _zz_dataOut_payload_4_6 = (_zz_dataOut_payload_4 < _zz_dataOut_payload_4_2);
  assign _zz_dataOut_payload_6_1 = (_zz_dataOut_payload_4_6 ? _zz_dataOut_payload_4_2 : _zz_dataOut_payload_4);
  assign _zz_dataOut_payload_4_7 = (_zz_dataOut_payload_4_6 ? _zz_dataOut_payload_4 : _zz_dataOut_payload_4_2);
  assign _zz_dataOut_payload_4_8 = (_zz_dataOut_payload_4_7 < _zz_dataOut_payload_4_5);
  assign _zz_dataOut_payload_6_2 = (_zz_dataOut_payload_6_1 < _zz_dataOut_payload_6);
  assign dataOut_payload_0 = _zz_dataOut_payload_0_59;
  assign dataOut_payload_1 = _zz_dataOut_payload_1_2;
  assign dataOut_payload_2 = _zz_dataOut_payload_2_5;
  assign dataOut_payload_3 = _zz_dataOut_payload_3_2;
  assign dataOut_payload_4 = _zz_dataOut_payload_4_11;
  assign dataOut_payload_5 = _zz_dataOut_payload_5_2;
  assign dataOut_payload_6 = _zz_dataOut_payload_6_5;
  assign dataOut_payload_7 = _zz_dataOut_payload_7_2;
  assign dataOut_valid = dataIn_valid_delay_6;
  always @(posedge clk) begin
    _zz_dataOut_payload_0_4 <= (_zz_dataOut_payload_0 ? dataIn_payload_1 : dataIn_payload_0);
    _zz_dataOut_payload_0_5 <= (_zz_dataOut_payload_0 ? dataIn_payload_0 : dataIn_payload_1);
    _zz_dataOut_payload_0_6 <= (_zz_dataOut_payload_0_1 ? dataIn_payload_3 : dataIn_payload_2);
    _zz_dataOut_payload_0_7 <= (_zz_dataOut_payload_0_1 ? dataIn_payload_2 : dataIn_payload_3);
    _zz_dataOut_payload_0_8 <= (_zz_dataOut_payload_0_2 ? dataIn_payload_5 : dataIn_payload_4);
    _zz_dataOut_payload_0_9 <= (_zz_dataOut_payload_0_2 ? dataIn_payload_4 : dataIn_payload_5);
    _zz_dataOut_payload_0_10 <= (_zz_dataOut_payload_0_3 ? dataIn_payload_7 : dataIn_payload_6);
    _zz_dataOut_payload_0_11 <= (_zz_dataOut_payload_0_3 ? dataIn_payload_6 : dataIn_payload_7);
    _zz_dataOut_payload_0_20 <= (_zz_dataOut_payload_0_18 ? _zz_dataOut_payload_0_17 : _zz_dataOut_payload_0_14);
    _zz_dataOut_payload_0_21 <= (_zz_dataOut_payload_0_18 ? _zz_dataOut_payload_0_14 : _zz_dataOut_payload_0_17);
    _zz_dataOut_payload_0_22 <= (_zz_dataOut_payload_0_19 ? _zz_dataOut_payload_0_13 : _zz_dataOut_payload_0_16);
    _zz_dataOut_payload_0_23 <= (_zz_dataOut_payload_0_19 ? _zz_dataOut_payload_0_16 : _zz_dataOut_payload_0_13);
    _zz_dataOut_payload_0_32 <= (_zz_dataOut_payload_0_30 ? _zz_dataOut_payload_0_29 : _zz_dataOut_payload_0_26);
    _zz_dataOut_payload_0_33 <= (_zz_dataOut_payload_0_30 ? _zz_dataOut_payload_0_26 : _zz_dataOut_payload_0_29);
    _zz_dataOut_payload_0_34 <= (_zz_dataOut_payload_0_31 ? _zz_dataOut_payload_0_25 : _zz_dataOut_payload_0_28);
    _zz_dataOut_payload_0_35 <= (_zz_dataOut_payload_0_31 ? _zz_dataOut_payload_0_28 : _zz_dataOut_payload_0_25);
    _zz_dataOut_payload_0_36 <= _zz_dataOut_payload_0_20;
    _zz_dataOut_payload_0_37 <= _zz_dataOut_payload_0_21;
    _zz_dataOut_payload_0_38 <= _zz_dataOut_payload_0_22;
    _zz_dataOut_payload_0_39 <= _zz_dataOut_payload_0_23;
    _zz_dataOut_payload_0_40 <= _zz_dataOut_payload_0_32;
    _zz_dataOut_payload_0_41 <= _zz_dataOut_payload_0_33;
    _zz_dataOut_payload_0_42 <= _zz_dataOut_payload_0_34;
    _zz_dataOut_payload_0_43 <= _zz_dataOut_payload_0_35;
    _zz_dataOut_payload_0_57 <= (_zz_dataOut_payload_0_56 ? _zz_dataOut_payload_0_55 : _zz_dataOut_payload_0_53);
    _zz_dataOut_payload_1 <= (_zz_dataOut_payload_0_56 ? _zz_dataOut_payload_0_53 : _zz_dataOut_payload_0_55);
    _zz_dataOut_payload_2_3 <= (_zz_dataOut_payload_2_2 ? _zz_dataOut_payload_2_1 : _zz_dataOut_payload_2);
    _zz_dataOut_payload_3 <= (_zz_dataOut_payload_2_2 ? _zz_dataOut_payload_2 : _zz_dataOut_payload_2_1);
    _zz_dataOut_payload_4_9 <= (_zz_dataOut_payload_4_8 ? _zz_dataOut_payload_4_7 : _zz_dataOut_payload_4_5);
    _zz_dataOut_payload_5 <= (_zz_dataOut_payload_4_8 ? _zz_dataOut_payload_4_5 : _zz_dataOut_payload_4_7);
    _zz_dataOut_payload_6_3 <= (_zz_dataOut_payload_6_2 ? _zz_dataOut_payload_6_1 : _zz_dataOut_payload_6);
    _zz_dataOut_payload_7 <= (_zz_dataOut_payload_6_2 ? _zz_dataOut_payload_6 : _zz_dataOut_payload_6_1);
    _zz_dataOut_payload_0_58 <= _zz_dataOut_payload_0_57;
    _zz_dataOut_payload_1_1 <= _zz_dataOut_payload_1;
    _zz_dataOut_payload_2_4 <= _zz_dataOut_payload_2_3;
    _zz_dataOut_payload_3_1 <= _zz_dataOut_payload_3;
    _zz_dataOut_payload_4_10 <= _zz_dataOut_payload_4_9;
    _zz_dataOut_payload_5_1 <= _zz_dataOut_payload_5;
    _zz_dataOut_payload_6_4 <= _zz_dataOut_payload_6_3;
    _zz_dataOut_payload_7_1 <= _zz_dataOut_payload_7;
    _zz_dataOut_payload_0_59 <= _zz_dataOut_payload_0_58;
    _zz_dataOut_payload_1_2 <= _zz_dataOut_payload_1_1;
    _zz_dataOut_payload_2_5 <= _zz_dataOut_payload_2_4;
    _zz_dataOut_payload_3_2 <= _zz_dataOut_payload_3_1;
    _zz_dataOut_payload_4_11 <= _zz_dataOut_payload_4_10;
    _zz_dataOut_payload_5_2 <= _zz_dataOut_payload_5_1;
    _zz_dataOut_payload_6_5 <= _zz_dataOut_payload_6_4;
    _zz_dataOut_payload_7_2 <= _zz_dataOut_payload_7_1;
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dataIn_valid_delay_1 <= 1'b0;
      dataIn_valid_delay_2 <= 1'b0;
      dataIn_valid_delay_3 <= 1'b0;
      dataIn_valid_delay_4 <= 1'b0;
      dataIn_valid_delay_5 <= 1'b0;
      dataIn_valid_delay_6 <= 1'b0;
    end else begin
      dataIn_valid_delay_1 <= dataIn_valid;
      dataIn_valid_delay_2 <= dataIn_valid_delay_1;
      dataIn_valid_delay_3 <= dataIn_valid_delay_2;
      dataIn_valid_delay_4 <= dataIn_valid_delay_3;
      dataIn_valid_delay_5 <= dataIn_valid_delay_4;
      dataIn_valid_delay_6 <= dataIn_valid_delay_5;
    end
  end


endmodule
