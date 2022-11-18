// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Data_Adjust
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module Data_Adjust (
  output              data_out_valid,
  output     [15:0]   data_out_payload,
  output              quard_out,
  input               clk,
  input               reset
);

  wire                test_data_1_data_out_valid;
  wire       [15:0]   test_data_1_data_out_payload;
  wire                get_maxmin_data_max_valid;
  wire       [15:0]   get_maxmin_data_max_payload;
  wire                get_maxmin_data_min_valid;
  wire       [15:0]   get_maxmin_data_min_payload;
  wire                get_maxmin_data_middle_valid;
  wire       [15:0]   get_maxmin_data_middle_payload;
  wire                data_fifo_io_push_ready;
  wire                data_fifo_io_pop_valid;
  wire       [15:0]   data_fifo_io_pop_payload;
  wire       [5:0]    data_fifo_io_occupancy;
  wire       [5:0]    data_fifo_io_availability;
  wire       [30:0]   _zz_data_out_payload;
  wire       [15:0]   _zz_data_out_payload_1;
  wire       [14:0]   _zz_data_out_payload_2;
  wire       [14:0]   _zz_data_out_payload_3;
  reg                 quard_out_1;
  wire                when_Get_Max_Flow_l71;

  assign _zz_data_out_payload = ($signed(_zz_data_out_payload_1) * $signed(_zz_data_out_payload_2));
  assign _zz_data_out_payload_1 = ($signed(data_fifo_io_pop_payload) - $signed(get_maxmin_data_middle_payload));
  assign _zz_data_out_payload_2 = ($signed(_zz_data_out_payload_3) / $signed(get_maxmin_data_max_payload));
  assign _zz_data_out_payload_3 = 15'h3fff;
  Test_Data test_data_1 (
    .data_out_valid   (test_data_1_data_out_valid        ), //o
    .data_out_payload (test_data_1_data_out_payload[15:0]), //o
    .clk              (clk                               ), //i
    .reset            (reset                             )  //i
  );
  Get_MaxMin_Flow get_maxmin (
    .data_in_valid       (test_data_1_data_out_valid          ), //i
    .data_in_payload     (test_data_1_data_out_payload[15:0]  ), //i
    .data_max_valid      (get_maxmin_data_max_valid           ), //o
    .data_max_payload    (get_maxmin_data_max_payload[15:0]   ), //o
    .data_min_valid      (get_maxmin_data_min_valid           ), //o
    .data_min_payload    (get_maxmin_data_min_payload[15:0]   ), //o
    .data_middle_valid   (get_maxmin_data_middle_valid        ), //o
    .data_middle_payload (get_maxmin_data_middle_payload[15:0]), //o
    .clk                 (clk                                 ), //i
    .reset               (reset                               )  //i
  );
  StreamFifo data_fifo (
    .io_push_valid   (test_data_1_data_out_valid        ), //i
    .io_push_ready   (data_fifo_io_push_ready           ), //o
    .io_push_payload (test_data_1_data_out_payload[15:0]), //i
    .io_pop_valid    (data_fifo_io_pop_valid            ), //o
    .io_pop_ready    (get_maxmin_data_middle_valid      ), //i
    .io_pop_payload  (data_fifo_io_pop_payload[15:0]    ), //o
    .io_flush        (1'b0                              ), //i
    .io_occupancy    (data_fifo_io_occupancy[5:0]       ), //o
    .io_availability (data_fifo_io_availability[5:0]    ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  assign data_out_valid = get_maxmin_data_middle_valid;
  assign data_out_payload = _zz_data_out_payload[15:0];
  assign when_Get_Max_Flow_l71 = ($signed(get_maxmin_data_middle_payload) < $signed(data_fifo_io_pop_payload));
  assign quard_out = quard_out_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      quard_out_1 <= 1'b0;
    end else begin
      if(get_maxmin_data_middle_valid) begin
        if(when_Get_Max_Flow_l71) begin
          quard_out_1 <= 1'b1;
        end else begin
          quard_out_1 <= 1'b0;
        end
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [15:0]   io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [15:0]   _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [15:0]   _zz_logic_ram_port_1;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1078;
  wire       [4:0]    logic_ptrDif;
  reg [15:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  assign _zz_logic_ram_port_1 = io_push_payload;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1078 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1078) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module Get_MaxMin_Flow (
  input               data_in_valid,
  input      [15:0]   data_in_payload,
  output              data_max_valid,
  output     [15:0]   data_max_payload,
  output              data_min_valid,
  output     [15:0]   data_min_payload,
  output              data_middle_valid,
  output     [15:0]   data_middle_payload,
  input               clk,
  input               reset
);

  wire       [15:0]   findmax_1_dataOut;
  wire       [15:0]   findmin_1_dataOut;
  wire       [3:0]    _zz__zz_1;
  wire       [3:0]    _zz__zz_2;
  wire       [16:0]   _zz_data_middle;
  wire       [16:0]   _zz_data_middle_1;
  wire       [16:0]   _zz_data_middle_2;
  reg        [4:0]    counter;
  reg        [15:0]   data_temp_0;
  reg        [15:0]   data_temp_1;
  reg        [15:0]   data_temp_2;
  reg        [15:0]   data_temp_3;
  reg        [15:0]   data_temp_4;
  reg        [15:0]   data_temp_5;
  reg        [15:0]   data_temp_6;
  reg        [15:0]   data_temp_7;
  reg        [15:0]   data_temp_8;
  reg        [15:0]   data_temp_9;
  reg        [15:0]   data_temp_10;
  reg        [15:0]   data_temp_11;
  reg        [15:0]   data_temp_12;
  reg        [15:0]   data_temp_13;
  reg        [15:0]   data_temp_14;
  reg        [15:0]   data_temp_15;
  reg                 valid;
  reg        [15:0]   data_middle;
  wire                when_Get_Max_Flow_l25;
  wire       [15:0]   _zz_1;
  wire       [15:0]   _zz_2;
  wire                when_Get_Max_Flow_l28;
  reg                 data_in_valid_regNext;
  reg                 data_in_valid_regNext_1;
  reg                 data_max_valid_regNext;

  assign _zz__zz_1 = counter[3:0];
  assign _zz__zz_2 = counter[3:0];
  assign _zz_data_middle = ($signed(_zz_data_middle_1) + $signed(_zz_data_middle_2));
  assign _zz_data_middle_1 = {data_max_payload[15],data_max_payload};
  assign _zz_data_middle_2 = {data_min_payload[15],data_min_payload};
  FindMax findmax_1 (
    .dataIn_0  (data_temp_0[15:0]      ), //i
    .dataIn_1  (data_temp_1[15:0]      ), //i
    .dataIn_2  (data_temp_2[15:0]      ), //i
    .dataIn_3  (data_temp_3[15:0]      ), //i
    .dataIn_4  (data_temp_4[15:0]      ), //i
    .dataIn_5  (data_temp_5[15:0]      ), //i
    .dataIn_6  (data_temp_6[15:0]      ), //i
    .dataIn_7  (data_temp_7[15:0]      ), //i
    .dataIn_8  (data_temp_8[15:0]      ), //i
    .dataIn_9  (data_temp_9[15:0]      ), //i
    .dataIn_10 (data_temp_10[15:0]     ), //i
    .dataIn_11 (data_temp_11[15:0]     ), //i
    .dataIn_12 (data_temp_12[15:0]     ), //i
    .dataIn_13 (data_temp_13[15:0]     ), //i
    .dataIn_14 (data_temp_14[15:0]     ), //i
    .dataIn_15 (data_temp_15[15:0]     ), //i
    .dataOut   (findmax_1_dataOut[15:0])  //o
  );
  FindMin findmin_1 (
    .dataIn_0  (data_temp_0[15:0]      ), //i
    .dataIn_1  (data_temp_1[15:0]      ), //i
    .dataIn_2  (data_temp_2[15:0]      ), //i
    .dataIn_3  (data_temp_3[15:0]      ), //i
    .dataIn_4  (data_temp_4[15:0]      ), //i
    .dataIn_5  (data_temp_5[15:0]      ), //i
    .dataIn_6  (data_temp_6[15:0]      ), //i
    .dataIn_7  (data_temp_7[15:0]      ), //i
    .dataIn_8  (data_temp_8[15:0]      ), //i
    .dataIn_9  (data_temp_9[15:0]      ), //i
    .dataIn_10 (data_temp_10[15:0]     ), //i
    .dataIn_11 (data_temp_11[15:0]     ), //i
    .dataIn_12 (data_temp_12[15:0]     ), //i
    .dataIn_13 (data_temp_13[15:0]     ), //i
    .dataIn_14 (data_temp_14[15:0]     ), //i
    .dataIn_15 (data_temp_15[15:0]     ), //i
    .dataOut   (findmin_1_dataOut[15:0])  //o
  );
  assign when_Get_Max_Flow_l25 = (data_in_valid && (counter < 5'h0f));
  assign _zz_1 = ({15'd0,1'b1} <<< _zz__zz_1);
  assign _zz_2 = ({15'd0,1'b1} <<< _zz__zz_2);
  assign when_Get_Max_Flow_l28 = (data_in_valid && (counter == 5'h0f));
  assign data_max_payload = findmax_1_dataOut;
  assign data_max_valid = (valid && data_in_valid_regNext);
  assign data_min_payload = findmin_1_dataOut;
  assign data_min_valid = (valid && data_in_valid_regNext_1);
  assign data_middle_payload = data_middle;
  assign data_middle_valid = data_max_valid_regNext;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter <= 5'h0;
      valid <= 1'b0;
      data_middle <= 16'h0;
    end else begin
      if(when_Get_Max_Flow_l25) begin
        counter <= (counter + 5'h01);
      end else begin
        if(when_Get_Max_Flow_l28) begin
          counter <= 5'h0;
          valid <= 1'b1;
        end
      end
      if(data_max_valid) begin
        data_middle <= (_zz_data_middle >>> 1);
      end
    end
  end

  always @(posedge clk) begin
    if(when_Get_Max_Flow_l25) begin
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
      if(_zz_1[8]) begin
        data_temp_8 <= data_in_payload;
      end
      if(_zz_1[9]) begin
        data_temp_9 <= data_in_payload;
      end
      if(_zz_1[10]) begin
        data_temp_10 <= data_in_payload;
      end
      if(_zz_1[11]) begin
        data_temp_11 <= data_in_payload;
      end
      if(_zz_1[12]) begin
        data_temp_12 <= data_in_payload;
      end
      if(_zz_1[13]) begin
        data_temp_13 <= data_in_payload;
      end
      if(_zz_1[14]) begin
        data_temp_14 <= data_in_payload;
      end
      if(_zz_1[15]) begin
        data_temp_15 <= data_in_payload;
      end
    end else begin
      if(when_Get_Max_Flow_l28) begin
        if(_zz_2[0]) begin
          data_temp_0 <= data_in_payload;
        end
        if(_zz_2[1]) begin
          data_temp_1 <= data_in_payload;
        end
        if(_zz_2[2]) begin
          data_temp_2 <= data_in_payload;
        end
        if(_zz_2[3]) begin
          data_temp_3 <= data_in_payload;
        end
        if(_zz_2[4]) begin
          data_temp_4 <= data_in_payload;
        end
        if(_zz_2[5]) begin
          data_temp_5 <= data_in_payload;
        end
        if(_zz_2[6]) begin
          data_temp_6 <= data_in_payload;
        end
        if(_zz_2[7]) begin
          data_temp_7 <= data_in_payload;
        end
        if(_zz_2[8]) begin
          data_temp_8 <= data_in_payload;
        end
        if(_zz_2[9]) begin
          data_temp_9 <= data_in_payload;
        end
        if(_zz_2[10]) begin
          data_temp_10 <= data_in_payload;
        end
        if(_zz_2[11]) begin
          data_temp_11 <= data_in_payload;
        end
        if(_zz_2[12]) begin
          data_temp_12 <= data_in_payload;
        end
        if(_zz_2[13]) begin
          data_temp_13 <= data_in_payload;
        end
        if(_zz_2[14]) begin
          data_temp_14 <= data_in_payload;
        end
        if(_zz_2[15]) begin
          data_temp_15 <= data_in_payload;
        end
      end
    end
    data_in_valid_regNext <= data_in_valid;
    data_in_valid_regNext_1 <= data_in_valid;
    data_max_valid_regNext <= data_max_valid;
  end


endmodule

module Test_Data (
  output              data_out_valid,
  output     [15:0]   data_out_payload,
  input               clk,
  input               reset
);

  wire       [15:0]   _zz_rom_port0;
  wire       [15:0]   _zz_data_out_payload;
  wire       [15:0]   _zz_data_out_payload_1;
  reg        [3:0]    i;
  reg        [3:0]    counter;
  reg                 data_valid;
  reg        [9:0]    tt;
  wire                when_Get_Max_Flow_l101;
  wire                when_Get_Max_Flow_l104;
  wire                when_Get_Max_Flow_l110;
  (* ram_style = "distributed" *) reg [15:0] rom [0:15];

  assign _zz_data_out_payload = _zz_rom_port0;
  assign _zz_data_out_payload_1 = 16'h1388;
  initial begin
    $readmemb("D:\\SCALA\\SRIO\\tmp\\job_1\\Data_Adjust.v_toplevel_test_data_1_rom.bin",rom);
  end
  assign _zz_rom_port0 = rom[i];
  assign when_Get_Max_Flow_l101 = (tt < 10'h1f4);
  assign when_Get_Max_Flow_l104 = (counter < 4'b1000);
  assign when_Get_Max_Flow_l110 = (i < 4'b1111);
  assign data_out_payload = ($signed(_zz_data_out_payload) - $signed(_zz_data_out_payload_1));
  assign data_out_valid = data_valid;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      i <= 4'b0000;
      counter <= 4'b0000;
      data_valid <= 1'b0;
      tt <= 10'h0;
    end else begin
      if(when_Get_Max_Flow_l101) begin
        tt <= (tt + 10'h001);
      end else begin
        if(when_Get_Max_Flow_l104) begin
          counter <= (counter + 4'b0001);
          data_valid <= 1'b0;
        end else begin
          data_valid <= 1'b1;
          counter <= 4'b0000;
          if(when_Get_Max_Flow_l110) begin
            i <= (i + 4'b0001);
          end else begin
            i <= 4'b0000;
          end
        end
      end
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
  input      [15:0]   dataIn_8,
  input      [15:0]   dataIn_9,
  input      [15:0]   dataIn_10,
  input      [15:0]   dataIn_11,
  input      [15:0]   dataIn_12,
  input      [15:0]   dataIn_13,
  input      [15:0]   dataIn_14,
  input      [15:0]   dataIn_15,
  output     [15:0]   dataOut
);

  wire       [15:0]   _zz_dataOut;
  wire       [15:0]   _zz_dataOut_1;
  wire       [15:0]   _zz_dataOut_2;
  wire       [15:0]   _zz_dataOut_3;
  wire       [15:0]   _zz_dataOut_4;
  wire       [15:0]   _zz_dataOut_5;
  wire       [15:0]   _zz_dataOut_6;
  wire       [15:0]   _zz_dataOut_7;
  wire       [15:0]   _zz_dataOut_8;
  wire       [15:0]   _zz_dataOut_9;
  wire       [15:0]   _zz_dataOut_10;
  wire       [15:0]   _zz_dataOut_11;
  wire       [15:0]   _zz_dataOut_12;
  wire       [15:0]   _zz_dataOut_13;

  assign _zz_dataOut = (($signed(dataIn_0) < $signed(dataIn_1)) ? dataIn_0 : dataIn_1);
  assign _zz_dataOut_1 = (($signed(dataIn_2) < $signed(dataIn_3)) ? dataIn_2 : dataIn_3);
  assign _zz_dataOut_2 = (($signed(_zz_dataOut) < $signed(_zz_dataOut_1)) ? _zz_dataOut : _zz_dataOut_1);
  assign _zz_dataOut_3 = (($signed(dataIn_4) < $signed(dataIn_5)) ? dataIn_4 : dataIn_5);
  assign _zz_dataOut_4 = (($signed(dataIn_6) < $signed(dataIn_7)) ? dataIn_6 : dataIn_7);
  assign _zz_dataOut_5 = (($signed(_zz_dataOut_3) < $signed(_zz_dataOut_4)) ? _zz_dataOut_3 : _zz_dataOut_4);
  assign _zz_dataOut_6 = (($signed(_zz_dataOut_2) < $signed(_zz_dataOut_5)) ? _zz_dataOut_2 : _zz_dataOut_5);
  assign _zz_dataOut_7 = (($signed(dataIn_8) < $signed(dataIn_9)) ? dataIn_8 : dataIn_9);
  assign _zz_dataOut_8 = (($signed(dataIn_10) < $signed(dataIn_11)) ? dataIn_10 : dataIn_11);
  assign _zz_dataOut_9 = (($signed(_zz_dataOut_7) < $signed(_zz_dataOut_8)) ? _zz_dataOut_7 : _zz_dataOut_8);
  assign _zz_dataOut_10 = (($signed(dataIn_12) < $signed(dataIn_13)) ? dataIn_12 : dataIn_13);
  assign _zz_dataOut_11 = (($signed(dataIn_14) < $signed(dataIn_15)) ? dataIn_14 : dataIn_15);
  assign _zz_dataOut_12 = (($signed(_zz_dataOut_10) < $signed(_zz_dataOut_11)) ? _zz_dataOut_10 : _zz_dataOut_11);
  assign _zz_dataOut_13 = (($signed(_zz_dataOut_9) < $signed(_zz_dataOut_12)) ? _zz_dataOut_9 : _zz_dataOut_12);
  assign dataOut = (($signed(_zz_dataOut_6) < $signed(_zz_dataOut_13)) ? _zz_dataOut_6 : _zz_dataOut_13);

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
  input      [15:0]   dataIn_8,
  input      [15:0]   dataIn_9,
  input      [15:0]   dataIn_10,
  input      [15:0]   dataIn_11,
  input      [15:0]   dataIn_12,
  input      [15:0]   dataIn_13,
  input      [15:0]   dataIn_14,
  input      [15:0]   dataIn_15,
  output     [15:0]   dataOut
);

  wire       [15:0]   _zz_dataOut;
  wire       [15:0]   _zz_dataOut_1;
  wire       [15:0]   _zz_dataOut_2;
  wire       [15:0]   _zz_dataOut_3;
  wire       [15:0]   _zz_dataOut_4;
  wire       [15:0]   _zz_dataOut_5;
  wire       [15:0]   _zz_dataOut_6;
  wire       [15:0]   _zz_dataOut_7;
  wire       [15:0]   _zz_dataOut_8;
  wire       [15:0]   _zz_dataOut_9;
  wire       [15:0]   _zz_dataOut_10;
  wire       [15:0]   _zz_dataOut_11;
  wire       [15:0]   _zz_dataOut_12;
  wire       [15:0]   _zz_dataOut_13;

  assign _zz_dataOut = (($signed(dataIn_1) < $signed(dataIn_0)) ? dataIn_0 : dataIn_1);
  assign _zz_dataOut_1 = (($signed(dataIn_3) < $signed(dataIn_2)) ? dataIn_2 : dataIn_3);
  assign _zz_dataOut_2 = (($signed(_zz_dataOut_1) < $signed(_zz_dataOut)) ? _zz_dataOut : _zz_dataOut_1);
  assign _zz_dataOut_3 = (($signed(dataIn_5) < $signed(dataIn_4)) ? dataIn_4 : dataIn_5);
  assign _zz_dataOut_4 = (($signed(dataIn_7) < $signed(dataIn_6)) ? dataIn_6 : dataIn_7);
  assign _zz_dataOut_5 = (($signed(_zz_dataOut_4) < $signed(_zz_dataOut_3)) ? _zz_dataOut_3 : _zz_dataOut_4);
  assign _zz_dataOut_6 = (($signed(_zz_dataOut_5) < $signed(_zz_dataOut_2)) ? _zz_dataOut_2 : _zz_dataOut_5);
  assign _zz_dataOut_7 = (($signed(dataIn_9) < $signed(dataIn_8)) ? dataIn_8 : dataIn_9);
  assign _zz_dataOut_8 = (($signed(dataIn_11) < $signed(dataIn_10)) ? dataIn_10 : dataIn_11);
  assign _zz_dataOut_9 = (($signed(_zz_dataOut_8) < $signed(_zz_dataOut_7)) ? _zz_dataOut_7 : _zz_dataOut_8);
  assign _zz_dataOut_10 = (($signed(dataIn_13) < $signed(dataIn_12)) ? dataIn_12 : dataIn_13);
  assign _zz_dataOut_11 = (($signed(dataIn_15) < $signed(dataIn_14)) ? dataIn_14 : dataIn_15);
  assign _zz_dataOut_12 = (($signed(_zz_dataOut_11) < $signed(_zz_dataOut_10)) ? _zz_dataOut_10 : _zz_dataOut_11);
  assign _zz_dataOut_13 = (($signed(_zz_dataOut_12) < $signed(_zz_dataOut_9)) ? _zz_dataOut_9 : _zz_dataOut_12);
  assign dataOut = (($signed(_zz_dataOut_13) < $signed(_zz_dataOut_6)) ? _zz_dataOut_6 : _zz_dataOut_13);

endmodule
