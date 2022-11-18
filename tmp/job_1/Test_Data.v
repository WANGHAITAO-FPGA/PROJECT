// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Test_Data
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module Test_Data (
  output              data_out_valid,
  output     [15:0]   data_out_payload,
  input               clk,
  input               reset
);

  wire       [15:0]   _zz_rom_port0;
  wire       [15:0]   _zz_data_out_payload;
  wire       [15:0]   _zz_data_out_payload_1;
  reg        [4:0]    i;
  reg        [4:0]    counter;
  reg                 data_valid;
  reg        [9:0]    tt;
  wire                when_Get_Max_Flow_l101;
  wire                when_Get_Max_Flow_l104;
  wire                when_Get_Max_Flow_l110;
  (* ram_style = "distributed" *) reg [15:0] rom [0:31];

  assign _zz_data_out_payload = _zz_rom_port0;
  assign _zz_data_out_payload_1 = 16'h1388;
  initial begin
    $readmemb("D:\\SCALA\\SRIO\\tmp\\job_1\\Test_Data.v_toplevel_rom.bin",rom);
  end
  assign _zz_rom_port0 = rom[i];
  assign when_Get_Max_Flow_l101 = (tt < 10'h1f4);
  assign when_Get_Max_Flow_l104 = (counter < 5'h08);
  assign when_Get_Max_Flow_l110 = (i < 5'h1f);
  assign data_out_payload = ($signed(_zz_data_out_payload) - $signed(_zz_data_out_payload_1));
  assign data_out_valid = data_valid;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      i <= 5'h0;
      counter <= 5'h0;
      data_valid <= 1'b0;
      tt <= 10'h0;
    end else begin
      if(when_Get_Max_Flow_l101) begin
        tt <= (tt + 10'h001);
      end else begin
        if(when_Get_Max_Flow_l104) begin
          counter <= (counter + 5'h01);
          data_valid <= 1'b0;
        end else begin
          data_valid <= 1'b1;
          counter <= 5'h0;
          if(when_Get_Max_Flow_l110) begin
            i <= (i + 5'h01);
          end else begin
            i <= 5'h0;
          end
        end
      end
    end
  end


endmodule
