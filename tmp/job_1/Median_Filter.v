// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Median_Filter
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps

module Median_Filter (
  input               data_in_valid,
  input      [15:0]   data_in_payload,
  output     [15:0]   data_max,
  output     [15:0]   data_min,
  output     [15:0]   data_sum,
  input               clk,
  input               reset
);

  wire       [15:0]   findmax_1_dataOut;
  wire       [15:0]   findmin_1_dataOut;
  wire       [2:0]    _zz__zz_1;
  wire       [16:0]   _zz__zz_data_averge;
  wire       [16:0]   _zz__zz_data_averge_1;
  wire       [17:0]   _zz__zz_data_averge_1_1;
  wire       [17:0]   _zz__zz_data_averge_1_2;
  wire       [16:0]   _zz__zz_data_averge_1_3;
  wire       [18:0]   _zz__zz_data_averge_2;
  wire       [18:0]   _zz__zz_data_averge_2_1;
  wire       [16:0]   _zz__zz_data_averge_2_2;
  wire       [19:0]   _zz__zz_data_averge_3;
  wire       [19:0]   _zz__zz_data_averge_3_1;
  wire       [16:0]   _zz__zz_data_averge_3_2;
  wire       [20:0]   _zz__zz_data_averge_4;
  wire       [20:0]   _zz__zz_data_averge_4_1;
  wire       [16:0]   _zz__zz_data_averge_4_2;
  wire       [21:0]   _zz__zz_data_averge_5;
  wire       [21:0]   _zz__zz_data_averge_5_1;
  wire       [16:0]   _zz__zz_data_averge_5_2;
  wire       [22:0]   _zz_data_averge_6;
  wire       [22:0]   _zz_data_averge_7;
  wire       [22:0]   _zz_data_averge_8;
  wire       [22:0]   _zz_data_averge_9;
  wire       [22:0]   _zz_data_averge_10;
  wire       [22:0]   _zz_data_averge_11;
  wire       [16:0]   _zz_data_averge_12;
  wire       [22:0]   _zz_data_averge_13;
  wire       [22:0]   _zz_data_averge_14;
  wire       [3:0]    _zz_data_averge_15;
  reg        [9:0]    counter;
  reg        [15:0]   data_temp_0;
  reg        [15:0]   data_temp_1;
  reg        [15:0]   data_temp_2;
  reg        [15:0]   data_temp_3;
  reg        [15:0]   data_temp_4;
  reg        [15:0]   data_temp_5;
  reg        [15:0]   data_temp_6;
  reg        [15:0]   data_temp_7;
  wire       [15:0]   data_max_1;
  reg        [15:0]   data_averge;
  wire       [7:0]    _zz_1;
  wire                when_Median_Filter_l75;
  wire       [16:0]   _zz_data_averge;
  wire       [17:0]   _zz_data_averge_1;
  wire       [18:0]   _zz_data_averge_2;
  wire       [19:0]   _zz_data_averge_3;
  wire       [20:0]   _zz_data_averge_4;
  wire       [21:0]   _zz_data_averge_5;
  wire                when_Median_Filter_l82;
  reg        [15:0]   findmax_1_dataOut_regNextWhen;
  wire                when_Median_Filter_l83;
  reg        [15:0]   findmin_1_dataOut_regNextWhen;

  assign _zz__zz_1 = counter[2:0];
  assign _zz__zz_data_averge = {data_temp_0[15],data_temp_0};
  assign _zz__zz_data_averge_1 = {data_temp_1[15],data_temp_1};
  assign _zz__zz_data_averge_1_1 = {_zz_data_averge[16],_zz_data_averge};
  assign _zz__zz_data_averge_1_3 = {data_temp_2[15],data_temp_2};
  assign _zz__zz_data_averge_1_2 = {{1{_zz__zz_data_averge_1_3[16]}}, _zz__zz_data_averge_1_3};
  assign _zz__zz_data_averge_2 = {_zz_data_averge_1[17],_zz_data_averge_1};
  assign _zz__zz_data_averge_2_2 = {data_temp_3[15],data_temp_3};
  assign _zz__zz_data_averge_2_1 = {{2{_zz__zz_data_averge_2_2[16]}}, _zz__zz_data_averge_2_2};
  assign _zz__zz_data_averge_3 = {_zz_data_averge_2[18],_zz_data_averge_2};
  assign _zz__zz_data_averge_3_2 = {data_temp_4[15],data_temp_4};
  assign _zz__zz_data_averge_3_1 = {{3{_zz__zz_data_averge_3_2[16]}}, _zz__zz_data_averge_3_2};
  assign _zz__zz_data_averge_4 = {_zz_data_averge_3[19],_zz_data_averge_3};
  assign _zz__zz_data_averge_4_2 = {data_temp_5[15],data_temp_5};
  assign _zz__zz_data_averge_4_1 = {{4{_zz__zz_data_averge_4_2[16]}}, _zz__zz_data_averge_4_2};
  assign _zz__zz_data_averge_5 = {_zz_data_averge_4[20],_zz_data_averge_4};
  assign _zz__zz_data_averge_5_2 = {data_temp_6[15],data_temp_6};
  assign _zz__zz_data_averge_5_1 = {{5{_zz__zz_data_averge_5_2[16]}}, _zz__zz_data_averge_5_2};
  assign _zz_data_averge_6 = ($signed(_zz_data_averge_7) / $signed(_zz_data_averge_15));
  assign _zz_data_averge_7 = ($signed(_zz_data_averge_8) - $signed(_zz_data_averge_14));
  assign _zz_data_averge_8 = ($signed(_zz_data_averge_9) - $signed(_zz_data_averge_13));
  assign _zz_data_averge_9 = ($signed(_zz_data_averge_10) + $signed(_zz_data_averge_11));
  assign _zz_data_averge_10 = {_zz_data_averge_5[21],_zz_data_averge_5};
  assign _zz_data_averge_12 = {data_temp_7[15],data_temp_7};
  assign _zz_data_averge_11 = {{6{_zz_data_averge_12[16]}}, _zz_data_averge_12};
  assign _zz_data_averge_13 = {{7{findmax_1_dataOut[15]}}, findmax_1_dataOut};
  assign _zz_data_averge_14 = {{7{findmin_1_dataOut[15]}}, findmin_1_dataOut};
  assign _zz_data_averge_15 = 4'b0110;
  FindMax findmax_1 (
    .dataIn_0 (data_temp_0[15:0]      ), //i
    .dataIn_1 (data_temp_1[15:0]      ), //i
    .dataIn_2 (data_temp_2[15:0]      ), //i
    .dataIn_3 (data_temp_3[15:0]      ), //i
    .dataIn_4 (data_temp_4[15:0]      ), //i
    .dataIn_5 (data_temp_5[15:0]      ), //i
    .dataIn_6 (data_temp_6[15:0]      ), //i
    .dataIn_7 (data_temp_7[15:0]      ), //i
    .dataOut  (findmax_1_dataOut[15:0])  //o
  );
  FindMin findmin_1 (
    .dataIn_0 (data_temp_0[15:0]      ), //i
    .dataIn_1 (data_temp_1[15:0]      ), //i
    .dataIn_2 (data_temp_2[15:0]      ), //i
    .dataIn_3 (data_temp_3[15:0]      ), //i
    .dataIn_4 (data_temp_4[15:0]      ), //i
    .dataIn_5 (data_temp_5[15:0]      ), //i
    .dataIn_6 (data_temp_6[15:0]      ), //i
    .dataIn_7 (data_temp_7[15:0]      ), //i
    .dataOut  (findmin_1_dataOut[15:0])  //o
  );
  assign data_max_1 = 16'h0;
  assign _zz_1 = ({7'd0,1'b1} <<< _zz__zz_1);
  assign when_Median_Filter_l75 = (counter == 10'h008);
  assign _zz_data_averge = ($signed(_zz__zz_data_averge) + $signed(_zz__zz_data_averge_1));
  assign _zz_data_averge_1 = ($signed(_zz__zz_data_averge_1_1) + $signed(_zz__zz_data_averge_1_2));
  assign _zz_data_averge_2 = ($signed(_zz__zz_data_averge_2) + $signed(_zz__zz_data_averge_2_1));
  assign _zz_data_averge_3 = ($signed(_zz__zz_data_averge_3) + $signed(_zz__zz_data_averge_3_1));
  assign _zz_data_averge_4 = ($signed(_zz__zz_data_averge_4) + $signed(_zz__zz_data_averge_4_1));
  assign _zz_data_averge_5 = ($signed(_zz__zz_data_averge_5) + $signed(_zz__zz_data_averge_5_1));
  assign when_Median_Filter_l82 = (counter == 10'h008);
  assign data_max = findmax_1_dataOut_regNextWhen;
  assign when_Median_Filter_l83 = (counter == 10'h008);
  assign data_min = findmin_1_dataOut_regNextWhen;
  assign data_sum = data_averge;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter <= 10'h0;
      data_averge <= 16'h0;
    end else begin
      if(data_in_valid) begin
        counter <= (counter + 10'h001);
      end
      if(when_Median_Filter_l75) begin
        counter <= 10'h0;
        data_averge <= _zz_data_averge_6[15:0];
      end
    end
  end

  always @(posedge clk) begin
    if(data_in_valid) begin
      if(_zz_1[0]) begin
        data_temp_0 <= data_in_payload;
      end
      if(_zz_1[1]) begin
        data_temp_1 <= data_in_payload;
      end
      if(_zz_1[2]) begin
        data_temp_2 <= data_in_payload;
      end
      if(_zz_1[3]) begin
        data_temp_3 <= data_in_payload;
      end
      if(_zz_1[4]) begin
        data_temp_4 <= data_in_payload;
      end
      if(_zz_1[5]) begin
        data_temp_5 <= data_in_payload;
      end
      if(_zz_1[6]) begin
        data_temp_6 <= data_in_payload;
      end
      if(_zz_1[7]) begin
        data_temp_7 <= data_in_payload;
      end
    end
    if(when_Median_Filter_l82) begin
      findmax_1_dataOut_regNextWhen <= findmax_1_dataOut;
    end
    if(when_Median_Filter_l83) begin
      findmin_1_dataOut_regNextWhen <= findmin_1_dataOut;
    end
  end


endmodule

module FindMin (
  input      [15:0]   dataIn_0,
  input      [15:0]   dataIn_1,
  input      [15:0]   dataIn_2,
  input      [15:0]   dataIn_3,
  input      [15:0]   dataIn_4,
  input      [15:0]   dataIn_5,
  input      [15:0]   dataIn_6,
  input      [15:0]   dataIn_7,
  output     [15:0]   dataOut
);

  wire       [15:0]   _zz_dataOut;
  wire       [15:0]   _zz_dataOut_1;
  wire       [15:0]   _zz_dataOut_2;
  wire       [15:0]   _zz_dataOut_3;
  wire       [15:0]   _zz_dataOut_4;
  wire       [15:0]   _zz_dataOut_5;

  assign _zz_dataOut = (($signed(dataIn_0) < $signed(dataIn_1)) ? dataIn_0 : dataIn_1);
  assign _zz_dataOut_1 = (($signed(dataIn_2) < $signed(dataIn_3)) ? dataIn_2 : dataIn_3);
  assign _zz_dataOut_2 = (($signed(_zz_dataOut) < $signed(_zz_dataOut_1)) ? _zz_dataOut : _zz_dataOut_1);
  assign _zz_dataOut_3 = (($signed(dataIn_4) < $signed(dataIn_5)) ? dataIn_4 : dataIn_5);
  assign _zz_dataOut_4 = (($signed(dataIn_6) < $signed(dataIn_7)) ? dataIn_6 : dataIn_7);
  assign _zz_dataOut_5 = (($signed(_zz_dataOut_3) < $signed(_zz_dataOut_4)) ? _zz_dataOut_3 : _zz_dataOut_4);
  assign dataOut = (($signed(_zz_dataOut_2) < $signed(_zz_dataOut_5)) ? _zz_dataOut_2 : _zz_dataOut_5);

endmodule

module FindMax (
  input      [15:0]   dataIn_0,
  input      [15:0]   dataIn_1,
  input      [15:0]   dataIn_2,
  input      [15:0]   dataIn_3,
  input      [15:0]   dataIn_4,
  input      [15:0]   dataIn_5,
  input      [15:0]   dataIn_6,
  input      [15:0]   dataIn_7,
  output     [15:0]   dataOut
);

  wire       [15:0]   _zz_dataOut;
  wire       [15:0]   _zz_dataOut_1;
  wire       [15:0]   _zz_dataOut_2;
  wire       [15:0]   _zz_dataOut_3;
  wire       [15:0]   _zz_dataOut_4;
  wire       [15:0]   _zz_dataOut_5;

  assign _zz_dataOut = (($signed(dataIn_1) < $signed(dataIn_0)) ? dataIn_0 : dataIn_1);
  assign _zz_dataOut_1 = (($signed(dataIn_3) < $signed(dataIn_2)) ? dataIn_2 : dataIn_3);
  assign _zz_dataOut_2 = (($signed(_zz_dataOut_1) < $signed(_zz_dataOut)) ? _zz_dataOut : _zz_dataOut_1);
  assign _zz_dataOut_3 = (($signed(dataIn_5) < $signed(dataIn_4)) ? dataIn_4 : dataIn_5);
  assign _zz_dataOut_4 = (($signed(dataIn_7) < $signed(dataIn_6)) ? dataIn_6 : dataIn_7);
  assign _zz_dataOut_5 = (($signed(_zz_dataOut_4) < $signed(_zz_dataOut_3)) ? _zz_dataOut_3 : _zz_dataOut_4);
  assign dataOut = (($signed(_zz_dataOut_5) < $signed(_zz_dataOut_2)) ? _zz_dataOut_2 : _zz_dataOut_5);

endmodule
