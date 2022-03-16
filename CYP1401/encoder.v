`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/18 10:48:38
// Design Name: 
// Module Name: encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module noise_filter
(
 clk,ch,ch_flt 
);

input clk;
input ch;
output ch_flt;
reg ch_buf;

always@(posedge clk)
begin
  ch_buf<=ch;
end

reg dff1,dff2,dff3,dff4;
wire dffj,dffk;
reg ch_flt;

always@(posedge clk)
begin
  dff1 <= ch_buf;
  dff2 <= dff1;
  dff3 <= dff2;
  dff4 <= dff3;
end

assign dffj = dff2&dff3&dff4;
assign dffk = (~dff2)&(~dff3)&(~dff4);

always @(posedge clk) 
begin
  ch_flt <= (dffj&(~ch_flt))|((~dffk)&ch_flt);
end

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/18 10:48:38
// Design Name: 
// Module Name: encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//`include "noise_filter.v"
module encoder
(
   clk80m,
   resetn,
   enc_rstn, 
   enca,
   encb, 
   encx,
   
   encoder_position_out,
   enc_udn,
   enc_cas,
   count_enable,
   count_direction, 
   clk160m
);


(*keep = "true"*) input clk80m;                           //CLOCK,20M
(*keep = "true"*) input resetn;                           //global reset
(*keep = "true"*) input enc_rstn;                         //reset signal,address is 0x02
(*keep = "true"*) input enca;                             //channel A
(*keep = "true"*) input encb;                             //channel B
(*keep = "true"*) input encx;                             //channel X
(*keep = "true"*) input clk160m;                           //CLOCK,20M
//input index;                          //ENCODER index:automatically cleared after every frame read by the MC
(*keep = "true"*) output [31:0] encoder_position_out;     //bit15~bit0:pulse counter;bit31~bit16:circle counter
(*keep = "true"*) output enc_udn;                         //0=encoder direction normal ;1=encoder position up
(*keep = "true"*) output enc_cas;                         //0=encoder position normal;1=encoder position under or overflowed

(*keep = "true"*) output count_enable;
(*keep = "true"*) output count_direction;

reg enc_udn;
reg enca_flt_delayed, encb_flt_delayed;

wire enca_flt,encb_flt,encx_flt;
wire enc_cas;

assign enc_cas=1'b0;                    //need modified!!!

noise_filter e1(.clk(clk160m),.ch(enca),.ch_flt(enca_flt));
noise_filter e2(.clk(clk160m),.ch(encb),.ch_flt(encb_flt));
reg enca_flt_buf,encb_flt_buf;
always @(posedge clk80m) 
    begin
    enca_flt_buf<=enca_flt;
    encb_flt_buf<=encb_flt;
    enca_flt_delayed<= enca_flt_buf;
    encb_flt_delayed<= encb_flt_buf;
	count_enable <= enca_flt_buf ^ enca_flt_delayed ^ encb_flt_buf ^ encb_flt_delayed;
	count_direction <= enca_flt_buf ^ encb_flt_delayed;
    end

reg count_enable,count_direction;

reg [31:0] encoder_position_out;                       //pulse counter

always @(posedge clk80m) 
begin
	if ((~resetn) | (~enc_rstn))
		begin
			encoder_position_out	<= 32'h0;
			enc_udn					<= 1'b0;
		end
	else
		case ({count_enable , count_direction})
			2'b10:
				begin
					encoder_position_out	<= encoder_position_out - 1'b1;
					enc_udn					<= 1'b0;
				end
			2'b11:
				begin
					encoder_position_out	<= encoder_position_out + 1'b1;
					enc_udn					<= 1'b1;
				end
			default:
				begin
					encoder_position_out	<= encoder_position_out;
					enc_udn					<= enc_udn;
				end
		endcase
end

endmodule 

