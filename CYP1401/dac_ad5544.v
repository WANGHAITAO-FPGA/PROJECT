`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 14:58:40
// Design Name: 
// Module Name: dac_ad5544
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
module dac_ad5544(
					//inputs
					clk, //80M
					reset,
					ad5544_trig,
					AD5544_DATA_IN1,
					AD5544_DATA_IN2,
					AD5544_DATA_IN3,
					AD5544_DATA_IN4,
					
					//outputs
					AD5544_CS,
					AD5544_LDAC,
					AD5544_MSB,
					AD5544_RS,
					AD5544_SCLK,
					AD5544_SDIN
					
					);
input			clk;
input			reset;
input			ad5544_trig;
input	[15:0]	AD5544_DATA_IN1,
				AD5544_DATA_IN2,
				AD5544_DATA_IN3,
				AD5544_DATA_IN4;

output	reg		AD5544_CS,
				AD5544_LDAC,
				AD5544_RS,
				AD5544_SCLK,
				AD5544_SDIN;
output	wire	AD5544_MSB;

reg		[9:0]	cnt;
reg		[17:0]	AD5544_SDIN_reg;		

reg		[3:0]	channel;
reg		[6:0]	curr_state,
				next_state;	
				
localparam [6:0]	RESET	= 7'b0000001,
					IDLE	= 7'b0000010,
					WAIT	= 7'b0000100,
					CS_L	= 7'b0001000,
					SCLK	= 7'b0010000,
					CS_LDAC	= 7'b0100000,	
					Finish	= 7'b1000000;

wire	[17:0]	DATA_CH1;
wire	[17:0]	DATA_CH2;
wire	[17:0]	DATA_CH3;
wire	[17:0]	DATA_CH4;

			
assign	DATA_CH1 	= { 2'h0,AD5544_DATA_IN1 };
assign	DATA_CH2 	= { 2'h1,AD5544_DATA_IN2 };
assign	DATA_CH3 	= { 2'h2,AD5544_DATA_IN3 };
assign	DATA_CH4 	= { 2'h3,AD5544_DATA_IN4 };	
assign	AD5544_MSB	= 1'b1;

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

reg		ad5544_trig_reg1,
		ad5544_trig_reg2;
always @ ( posedge clk_out or posedge reset)
begin
  if(reset)begin
    ad5544_trig_reg1 <= 0;
    ad5544_trig_reg2 <= 0;
  end else begin
	ad5544_trig_reg1 <= ad5544_trig;
	ad5544_trig_reg2 <= ad5544_trig_reg1;
  end
end
wire	ad5544_trig_posedge;
assign	ad5544_trig_posedge = ad5544_trig_reg1 & ( !ad5544_trig_reg2 );

always @ ( posedge clk_out or posedge reset )
begin
	if( reset )
		curr_state	<= RESET;
	
	else
		curr_state	<= next_state;
end

always @ *
begin
	case( curr_state )
		RESET:
		begin
			next_state = IDLE;
		end
		
		IDLE:
		begin
			if( ad5544_trig_posedge )
				next_state = WAIT;    
					  
			else
				next_state = IDLE ;
		end	
		
		WAIT:
		begin
			if(cnt == 5)
				next_state = CS_L;
			else
				next_state = WAIT;

		end
		
		CS_L:
		begin
			if(cnt == 3)
				next_state = SCLK;
			else
				next_state = CS_L;
		end
		
		SCLK:
		begin
			if(cnt == 73)
				next_state = CS_LDAC;
			else
				next_state = SCLK;
		end
		
		CS_LDAC:
		begin
			if(cnt == 5)
				next_state = Finish;
			else
				next_state = CS_LDAC;
		end
		
		Finish:
		begin
			if( cnt == 3 )
				if(channel==4)
					next_state = IDLE;
				else 
					next_state = WAIT;
			else
				next_state = Finish;
		end
		
		default:
		begin
			next_state = IDLE;
		end
		
	endcase
end
		
always @ ( posedge clk_out or posedge reset )
begin
	if( reset )
	begin
		cnt				<= 'h0;
		
		AD5544_CS		<= 'b1;
		AD5544_LDAC		<= 'b1;
		AD5544_RS		<= 'b0;
		AD5544_SCLK		<= 'b0;
		AD5544_SDIN		<= 'b0;		
		
		AD5544_SDIN_reg <= 'h0;
		channel			<= 'h1;
	end
	
	else
	begin	
		case( curr_state )
		RESET:
			begin
				cnt				<= 'h0;
				
				AD5544_CS		<= 'b1;
				AD5544_LDAC		<= 'b1;
				AD5544_RS		<= 'b0;
				AD5544_SCLK		<= 'b0;
				AD5544_SDIN		<= 'b0;		
				
				AD5544_SDIN_reg <= 'h0;
				channel			<= 'h1;
			end
			
			IDLE:
			begin
				cnt				<= 'h0;
				
				AD5544_CS		<= 'b1;
				AD5544_LDAC		<= 'b1;
				AD5544_RS		<= 'b1;
				AD5544_SCLK		<= 'b0;
				AD5544_SDIN		<= 'b0;		
				
				AD5544_SDIN_reg <= 'h0;
				channel			<= 'h1;
			end
			
			WAIT:
			begin
				if(cnt == 5)
					cnt			<= 'h0;
				else
					cnt			<= cnt + 1'b1;
				
				AD5544_RS		<= 'b1;
				AD5544_CS		<= 'b1;
				channel			<= channel;

			end
			
			CS_L:
			begin
				if(cnt == 3)
					cnt			<= 'h0;
				else
					cnt			<= cnt + 1'b1;
					
				AD5544_CS		<= 'b0;
				
				case( channel )
					4'h1:
						AD5544_SDIN_reg <= DATA_CH1;	
					
					4'h2:
						AD5544_SDIN_reg <= DATA_CH2;	
						
					4'h3:
						AD5544_SDIN_reg <= DATA_CH3;	
						
					4'h4:
						AD5544_SDIN_reg <= DATA_CH4;
				    default:
					    AD5544_SDIN_reg <= AD5544_SDIN_reg;	
				endcase	
			end
			
			SCLK:
			begin									
				if( cnt == 73 )
					cnt		<= 'h0;
					
				else
					cnt		<= cnt + 1'b1;
				
				if( cnt[1:0] == 2'b00 )
				begin
					AD5544_SCLK	<= 'b0;
				end
				
				if( cnt[1:0] == 2'b01 )
				begin
					AD5544_SCLK	<= 'b0;
					AD5544_SDIN	<= AD5544_SDIN_reg[17];
				end
				
				if( cnt[1:0] == 2'b10 )
				begin
					AD5544_SCLK		<= 'b1;
					AD5544_SDIN_reg	<= { AD5544_SDIN_reg[16:0] , 1'b0 };
				end
			end
		
			CS_LDAC:
			begin
				if( cnt == 5 )
					cnt		<= 'h0;
				else
					cnt		<= cnt + 1'b1;

				if( (cnt >=2 ) & (cnt <= 4) )	
					AD5544_LDAC	<= 'b0;
				
				AD5544_CS		<= 'b1;	
				AD5544_SCLK		<= 'b0;
				AD5544_SDIN_reg	<= 'h0;

			end
			
			Finish:
			begin
				if( cnt == 3 )
				begin
					cnt		<= 'h0;
					channel	<= channel + 1'b1;
				end
				else
					cnt		<= cnt + 1'b1;
				AD5544_CS		<= 'b1;
				AD5544_LDAC		<= 'b1;
				AD5544_RS		<= 'b1;
				AD5544_SCLK		<= 'b0;
				AD5544_SDIN		<= 'b0;		
				
				AD5544_SDIN_reg <= 'h0;
				
			end
			
			default:
			begin
				cnt				<= 'h0;
				AD5544_CS		<= 'b1;
				AD5544_LDAC		<= 'b1;
				AD5544_RS		<= 'b0;
				AD5544_SCLK		<= 'b0;
				AD5544_SDIN		<= 'b0;		
				
				AD5544_SDIN_reg <= 'h0;
				channel			<= 'h1;
			end
		endcase
	end
end
			
endmodule		
			