`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/03/18 11:43:27
// Design Name:
// Module Name: BISS_Position
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
module BISS_Position(
					//inputs
					clk,
					reset,
					enc_data,
					sample_en,
					//outputs
					enc_clk,
					enc_position_all,
					enc_position_out,
					erro_flag,
					warn_flag,
					crc_flag
					);
(*keep = "true"*) input	clk;
(*keep = "true"*) input	reset;
(*keep = "true"*) input	enc_data;
(*keep = "true"*) input	sample_en;

(*keep = "true"*) output	erro_flag;
(*keep = "true"*) output	warn_flag;
(*keep = "true"*) output	crc_flag;
(*keep = "true"*) output	enc_clk;
(*keep = "true"*) output	enc_position_out;
(*keep = "true"*) output	enc_position_all;

reg [40:0]	enc_position_all;
reg			erro_flag,
			warn_flag;
reg	[5:0]	crc_flag;
reg [40:0]	enc_position_temp;
reg [31:0]	enc_position_out;
reg			enc_clk;
reg [11:0]	CNT,
			DATA_CNT;
reg	[1:0]	start_flag;
reg	[7:0]	Next_State,
			Curr_State;


localparam  RESET	  =	8'b00000001;
localparam  MA_H	  =	8'b00000010;
localparam  WAIT	  = 8'b00000100;
localparam  MA_START  =	8'b00001000;
localparam  MA_SCLK_H = 8'b00010000;
localparam  Finish	  =	8'b00100000;

reg     clk_out;

reg[3:0] clk_dvidecnt;

always @ ( posedge clk or posedge reset )
begin
  if(reset)begin
	  clk_dvidecnt <= 0;
	  clk_out <= 0;
  end else begin
	  if(clk_dvidecnt == 4'd1)begin
		  clk_dvidecnt <= 0;
		  clk_out <= ~clk_out;
	  end else begin
		   clk_dvidecnt <= clk_dvidecnt + 1'b1;
	  end
  end
end

reg			ENC_SLO_1reg,
			ENC_SLO_2reg;

always @ ( posedge clk_out )
begin
	ENC_SLO_1reg <= enc_data;
	ENC_SLO_2reg <= ENC_SLO_1reg;
end
wire	ENC_SLO_negedge;
assign	ENC_SLO_negedge = (~ENC_SLO_1reg) & ENC_SLO_2reg;

always @ ( posedge clk_out or posedge reset )
begin
	if( reset )
		Curr_State <= RESET;

	else
		Curr_State <= Next_State;
end

always @ (*)
begin
	case( Curr_State )
		RESET:
		begin
			if( sample_en )
				Next_State = MA_H;
			else
				Next_State = RESET;
		end

		MA_H:
		begin
			if(enc_data & sample_en)
				Next_State = WAIT;
			else
				Next_State = MA_H;
		end

		WAIT:
		begin
			if(CNT >= 100)
				Next_State = MA_START;
			else
				Next_State = WAIT;
		end

		MA_START:
		begin
			if( DATA_CNT >= 41)
				Next_State = MA_SCLK_H ;

			else
				Next_State = MA_START ;
		end

		MA_SCLK_H:
		begin
			Next_State = Finish;
		end

		Finish:
		begin
			if( (enc_data ==1) & (CNT >= 2000))
			begin
				Next_State = MA_H;
			end
			else
				Next_State = Finish;
		end

		default:
		begin
			Next_State = RESET ;
		end
	endcase

end

always @(posedge clk_out or posedge reset)
begin
	if(reset)
	begin
		CNT		<= 12'h0;
		DATA_CNT<= 'h0;
		start_flag <= 'h0;
		enc_clk	<= 1'b1;
		enc_position_temp <= 41'h0;
		enc_position_out <= 32'h0;
		erro_flag	<= 'b0;
		warn_flag	<= 'b0;
		crc_flag	<= 'h0;
	end

	else
	begin
		case(Curr_State)
		RESET:
		begin
			CNT		<= 12'h0;
			DATA_CNT<= 'h0;
			start_flag <= 'h0;
			enc_clk	<= 1'b1;
			enc_position_temp <= 41'h0;
			enc_position_out <= 32'h0;
			erro_flag	<= 'b0;
			warn_flag	<= 'b0;
			crc_flag	<= 'h0;
		end

		MA_H:
		begin
			CNT		<= 12'h0;
			DATA_CNT<= 'h0;
			start_flag <= 'h0;
			enc_clk	<= 1'b1;
		end

		WAIT:
		begin
			if(CNT >=100 )
			CNT <= 'b0;
			else
			CNT <= CNT + 1'b1;

		end

		MA_START:
		begin
			if(DATA_CNT >= 41)
				begin
					CNT <= 'b0;
					DATA_CNT <= 'h0;
					enc_clk <= 'b1;
				end
			else
				CNT <= CNT + 1'b1;

			if( CNT[5:0] == 6'b000000  )
				enc_clk <= 'b0;

			if( CNT[5:0] == 6'b100000  )
			begin
				enc_clk <= 'b1;

				if(start_flag ==2 )
				begin
					DATA_CNT<= DATA_CNT +1'b1;
				end
			end

			if(ENC_SLO_negedge & (start_flag < 2 ))
				start_flag <= start_flag + 1'b1;

			if( CNT[5:0] == 6'b000010 & (start_flag ==2 ))
			enc_position_temp <= {enc_position_temp[39:0] , enc_data };

		end

		MA_SCLK_H:
		begin
			CNT <= 'b0;
			DATA_CNT <= 'h0;
			start_flag <= 'h0;
			enc_clk <= 'b1;
			enc_position_out <= {enc_position_temp[39:8]};
			erro_flag	<= enc_position_temp[7];
			warn_flag	<= enc_position_temp[6];
			crc_flag	<= enc_position_temp[5:0];
		end

		Finish:
		begin
			enc_position_all <= enc_position_temp;
			if(enc_data == 1)
			begin
				if(CNT >= 2000)
					CNT <= 'b0;
				else
					CNT <= CNT + 1'b1;
			end

			else
			begin
				enc_clk <= 'b1;
				CNT <= 'b0;
				erro_flag	<= 'b0;
				warn_flag	<= 'b0;
				crc_flag	<= 'h0;
			end

		end
		default:
			begin
				CNT 			<= 'b0;
				DATA_CNT <= 'h0;
				start_flag <= 'h0;
				enc_clk	<= 1'b1;
				enc_position_temp <= 41'h0;
				enc_position_out <= 32'h0;
				erro_flag	<= 'b0;
				warn_flag	<= 'b0;
				crc_flag	<= 'h0;
			end
	  endcase
	end


end


endmodule
