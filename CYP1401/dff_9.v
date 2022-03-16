// Copyright (C) 1991-2010 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II"
// VERSION		"Version 10.1 Build 153 11/29/2010 SJ Full Version"
// CREATED		"Fri Nov 08 14:46:38 2013"

module dff_9(
	RXST0_in,
	RXCLK,
	RXD_in,
	RXST0_out,
	RXD_out
);


input wire	RXST0_in;
input wire	RXCLK;
input wire	[7:0] RXD_in;
output wire	RXST0_out;
output wire	[7:0] RXD_out;

wire	[8:0] d_in;
reg	[8:0] d_out;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_0 = 1;
assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_2 = 1;
assign	SYNTHESIZED_WIRE_3 = 1;
assign	SYNTHESIZED_WIRE_4 = 1;
assign	SYNTHESIZED_WIRE_5 = 1;
assign	SYNTHESIZED_WIRE_6 = 1;
assign	SYNTHESIZED_WIRE_7 = 1;
assign	SYNTHESIZED_WIRE_8 = 1;
assign	SYNTHESIZED_WIRE_9 = 1;
assign	SYNTHESIZED_WIRE_10 = 1;
assign	SYNTHESIZED_WIRE_11 = 1;
assign	SYNTHESIZED_WIRE_12 = 1;
assign	SYNTHESIZED_WIRE_13 = 1;
assign	SYNTHESIZED_WIRE_14 = 1;
assign	SYNTHESIZED_WIRE_15 = 1;
assign	SYNTHESIZED_WIRE_16 = 1;
assign	SYNTHESIZED_WIRE_17 = 1;




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_0 or negedge SYNTHESIZED_WIRE_1)
begin
if (!SYNTHESIZED_WIRE_0)
	begin
	d_out[0] = 0;
	end
else
if (!SYNTHESIZED_WIRE_1)
	begin
	d_out[0] = 1;
	end
else
	begin
	d_out[0] = d_in[0];
	end
end





always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_2 or negedge SYNTHESIZED_WIRE_3)
begin
if (!SYNTHESIZED_WIRE_2)
	begin
	d_out[4] = 0;
	end
else
if (!SYNTHESIZED_WIRE_3)
	begin
	d_out[4] = 1;
	end
else
	begin
	d_out[4] = d_in[4];
	end
end




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_4 or negedge SYNTHESIZED_WIRE_5)
begin
if (!SYNTHESIZED_WIRE_4)
	begin
	d_out[5] = 0;
	end
else
if (!SYNTHESIZED_WIRE_5)
	begin
	d_out[5] = 1;
	end
else
	begin
	d_out[5] = d_in[5];
	end
end




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_6 or negedge SYNTHESIZED_WIRE_7)
begin
if (!SYNTHESIZED_WIRE_6)
	begin
	d_out[6] = 0;
	end
else
if (!SYNTHESIZED_WIRE_7)
	begin
	d_out[6] = 1;
	end
else
	begin
	d_out[6] = d_in[6];
	end
end





always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_8 or negedge SYNTHESIZED_WIRE_9)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	d_out[7] = 0;
	end
else
if (!SYNTHESIZED_WIRE_9)
	begin
	d_out[7] = 1;
	end
else
	begin
	d_out[7] = d_in[7];
	end
end




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_10 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_10)
	begin
	d_out[8] = 0;
	end
else
if (!SYNTHESIZED_WIRE_11)
	begin
	d_out[8] = 1;
	end
else
	begin
	d_out[8] = d_in[8];
	end
end




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_12 or negedge SYNTHESIZED_WIRE_13)
begin
if (!SYNTHESIZED_WIRE_12)
	begin
	d_out[1] = 0;
	end
else
if (!SYNTHESIZED_WIRE_13)
	begin
	d_out[1] = 1;
	end
else
	begin
	d_out[1] = d_in[1];
	end
end




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_14 or negedge SYNTHESIZED_WIRE_15)
begin
if (!SYNTHESIZED_WIRE_14)
	begin
	d_out[2] = 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	d_out[2] = 1;
	end
else
	begin
	d_out[2] = d_in[2];
	end
end




always@(posedge RXCLK or negedge SYNTHESIZED_WIRE_16 or negedge SYNTHESIZED_WIRE_17)
begin
if (!SYNTHESIZED_WIRE_16)
	begin
	d_out[3] = 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	d_out[3] = 1;
	end
else
	begin
	d_out[3] = d_in[3];
	end
end

assign	RXST0_out = d_out[8];
assign	RXD_out[7:0] = d_out[7:0];
assign	d_in[8] = RXST0_in;
assign	d_in[7:0] = RXD_in;

endmodule
