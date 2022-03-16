module	GSSL_TX_Transmitter
	(
		//inputs
		GSSL_REFCLK,
		rst_in,
		CHS_CTRL,
		
		tx_ttc_trigger,
		tx_atc_trigger,
		tx_data_trigger,
		
		tx_frame_head_data,
		tx_dpram_q,		
		tx_atc_status_data,	
		
		//outputs
		tx_dpram_raddress,
		
		encode_k,
		encode_data,
		
		tx_frame_busy,
		tx_frame_done,
		tx_dpram_rd,
		
		//debug signals
		tx_state_debug
	);
	
	input			GSSL_REFCLK;
	input			rst_in;
	input			CHS_CTRL;				//	CHS_CTRL: 0 - neg chs; 1 - pos chs
	input			tx_ttc_trigger;
	input			tx_atc_trigger;
	input			tx_data_trigger;
	input	[31:0]	tx_frame_head_data;
	input	[31:0]	tx_dpram_q;
	input	[7:0]	tx_atc_status_data;
	
	output	[7:0]	tx_dpram_raddress;
	output			encode_k;
	output	[7:0]	encode_data;
	output			tx_frame_busy;
	output			tx_frame_done;
	output			tx_dpram_rd;
	
	output	[3:0]	tx_state_debug;
	
	reg		[7:0]	tx_dpram_raddress;
	reg				encode_k;
	reg		[7:0]	encode_data;
	reg				tx_frame_busy;
	reg				tx_frame_done;
	reg				tx_dpram_rd;
	
	reg		[3:0]	tx_state;
	reg		[3:0]	next_state;
	reg		[31:0]	tx_word_reg;
	reg		[9:0]	tx_byte_chs;
	reg		[9:0]	tx_byte_chs_n;
	reg		[8:0]	tx_word_counter;
	
	parameter	SOF		=	8'b00000000;       //k28.0
	parameter	EOF		=	8'b00000001;       //k28.1
	parameter	TTC		=	8'b00000010;       //k28.2
	parameter	SYNC	=	8'b00000101;       //k28.5
	parameter	ATC		=	8'b00000100;       //k28.4
	
	parameter	TX_IDLE		=	4'h0;
	parameter	TX_TTC		=	4'h1;
	parameter	TX_ATC		=	4'h2;
	parameter	TX_STATUS	=	4'h3;
	parameter	TX_SOF		=	4'h4;
	parameter	TX_BYTE_0	=	4'h5;
	parameter	TX_BYTE_1	=	4'h6;
	parameter	TX_BYTE_2	=	4'h7;
	parameter	TX_BYTE_3	=	4'h8;
	parameter	TX_BYTE_CHS	=	4'h9;
	parameter	TX_SYNC		=	4'hA;
	parameter	TX_EOF		=	4'hB;
	
	assign		tx_state_debug = tx_state;
	
	always @ ( posedge GSSL_REFCLK or posedge rst_in )
	begin
		if( rst_in == 1'b1 )
		begin
			tx_state			<= TX_IDLE;
			next_state			<= TX_IDLE;
			
			tx_word_reg			<= 32'h0;
			tx_byte_chs			<= 10'h0;
			tx_byte_chs_n		<= 10'h0;
			tx_word_counter		<= 9'h0;
			
			encode_k			<= 1'b1;
			encode_data			<= SYNC;
			
			tx_dpram_raddress	<= 8'h0;
			tx_frame_busy		<= 1'b0;
			tx_frame_done		<= 1'b0;
			tx_dpram_rd			<= 1'b0;
		end
		
		else
		begin
			case( tx_state )
				TX_IDLE:	
				begin
					if( tx_ttc_trigger == 1'b1 )
						tx_state	<= TX_TTC;

					else if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else if( tx_data_trigger == 1'b1 )
						tx_state	<= TX_SOF;
						
					else
						tx_state	<= TX_IDLE;

					next_state			<= TX_IDLE;
					
					encode_k			<= 1'b1;
					encode_data			<= SYNC;
					
					tx_word_reg			<= 32'h0;
					tx_byte_chs			<= 10'h0;
					tx_byte_chs_n		<= 10'h0;
					tx_word_counter		<= 9'h0;
					
					tx_dpram_raddress	<= 8'h0;
					tx_frame_busy		<= 1'b0;
					tx_frame_done		<= 1'b0;
					tx_dpram_rd			<= 1'b0;
				end
				
				TX_TTC:		
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;
						
					else if( tx_data_trigger == 1'b1 )
						tx_state	<= TX_SOF;
						
					else
						tx_state	<= TX_IDLE;

					encode_k			<= 1'b1;
					encode_data			<= TTC;
					
					tx_word_reg			<= 32'h0;
					tx_byte_chs			<= 10'h0;
					tx_byte_chs_n		<= 10'h0;
					tx_word_counter		<= 9'h0;
					
					tx_dpram_raddress	<= 8'h0;
					tx_frame_busy		<= 1'b0;
					tx_frame_done		<= 1'b0;
				end
				
				TX_ATC:		
				begin
					tx_state			<= TX_STATUS;
					
					if( tx_frame_busy == 1'b0 )
					begin
						if( tx_ttc_trigger == 1'b1 )
							next_state	<= TX_TTC;

						else
							next_state	<= TX_IDLE;
					end
					
					else
						next_state		<= next_state;

					encode_k			<= 1'b1;
					encode_data			<= ATC;
				end
				
				TX_STATUS:	
				begin
					case( next_state )
						TX_IDLE:	
						begin
							if( tx_ttc_trigger == 1'b1 )
								tx_state	<= TX_TTC;

							else if( tx_data_trigger == 1'b1 )
								tx_state	<= TX_SOF;

							else
								tx_state	<= TX_IDLE;
						end
						
						TX_TTC:		
							tx_state	<= TX_TTC;
									
						TX_BYTE_0:	
							tx_state	<= TX_BYTE_0;
									
						TX_BYTE_1:	
							tx_state	<= TX_BYTE_1;
									
						TX_BYTE_2:	
							tx_state	<= TX_BYTE_2;
									
						TX_BYTE_3:	
							tx_state	<= TX_BYTE_3;
									
						TX_BYTE_CHS:
							tx_state	<= TX_BYTE_CHS;
									
						TX_SYNC:	
							tx_state	<= TX_SYNC;
									
						TX_EOF:		
							tx_state	<= TX_EOF;
									
						default:	
							tx_state	<= TX_IDLE;									
					endcase

					encode_k			<= 1'b0;
					encode_data			<= tx_atc_status_data;

					tx_frame_done		<= 1'b0;
				end
				
				TX_SOF:		
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else
						tx_state	<= TX_BYTE_0;

					next_state			<= TX_BYTE_0;
					
					encode_k			<= 1'b1;
					encode_data			<= SOF;
					
					tx_word_reg			<= tx_frame_head_data;
					tx_byte_chs			<= 10'h0;
					tx_byte_chs_n		<= 10'h0;
					tx_word_counter		<= 9'h0;
					
					tx_dpram_raddress	<= 8'h0;
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
					tx_dpram_rd			<= 1'b0;
				end
				
				TX_BYTE_0:	
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else
						tx_state	<= TX_BYTE_1;

					next_state			<= TX_BYTE_1;
					
					encode_k			<= 1'b0;
					encode_data			<= tx_word_reg[7:0];
					
					tx_byte_chs			<= tx_frame_head_data[7:0] + tx_word_reg[7:0] + tx_word_reg[15:8]/* - 8'b1*/;
					
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
				end
				
				TX_BYTE_1:	
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else
						tx_state	<= TX_BYTE_2;

					next_state			<= TX_BYTE_2;
					
					encode_k			<= 1'b0;
					encode_data			<= tx_word_reg[15:8];
					
					tx_byte_chs			<= tx_byte_chs + tx_word_reg[23:16] + tx_word_reg[31:24];					
					tx_dpram_raddress	<= tx_frame_head_data[15:8] + tx_word_counter[7:0];
					
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
					tx_dpram_rd			<= 1'b0;
				end
				
				TX_BYTE_2:	
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else
						tx_state	<= TX_BYTE_3;

					next_state			<= TX_BYTE_3;
					
					encode_k			<= 1'b0;
					encode_data			<= tx_word_reg[23:16];
					
					tx_byte_chs			<= tx_byte_chs - tx_word_counter;
					
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
					
					if( tx_word_counter < tx_frame_head_data[7:0] )
						tx_dpram_rd			<= 1'b1;
				end
				
				TX_BYTE_3:	
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else
						tx_state	<= TX_BYTE_CHS;

					next_state			<= TX_BYTE_CHS;
					
					encode_k			<= 1'b0;
					encode_data			<= tx_word_reg[31:24];
					
					tx_byte_chs_n		<= ~tx_byte_chs;
					
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
					tx_dpram_rd			<= 1'b0;
				end
				
				TX_BYTE_CHS:
				begin
					if( tx_atc_trigger == 1'b1 )
						tx_state	<= TX_ATC;

					else
						tx_state	<= TX_SYNC;

					next_state			<= TX_SYNC;
					
					encode_k			<= 1'b0;
					encode_data			<= CHS_CTRL ? tx_byte_chs[7:0] : tx_byte_chs_n[7:0];
					
					tx_word_reg			<= tx_dpram_q;
					
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
				end
				
				TX_SYNC:	
				begin
					if( tx_word_counter == tx_frame_head_data[7:0] )
					begin
						if( tx_atc_trigger == 1'b1 )
							tx_state	<= TX_ATC;

						else
							tx_state	<= TX_EOF;

						next_state	<= TX_EOF;
					end
					
					else
					begin
						if( tx_atc_trigger == 1'b1 )
							tx_state	<= TX_ATC;

						else
							tx_state	<= TX_BYTE_0;

						next_state	<= TX_BYTE_0;
					end
					
					encode_k			<= 1'b1;
					encode_data			<= SYNC;
					
					if( tx_word_counter < tx_frame_head_data[7:0] )
						tx_word_counter		<= tx_word_counter + 9'h1;
						
					else
						tx_word_counter		<= 'b0;
					
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b0;
				end
				
				TX_EOF:		
				begin
					tx_state			<= TX_IDLE;
					next_state			<= TX_IDLE;
					
					encode_k			<= 1'b1;
					encode_data			<= EOF;
					
					tx_word_reg			<= 32'h0;
					tx_byte_chs			<= 10'h0;
					tx_byte_chs_n		<= 10'h0;
					tx_word_counter		<= 9'h0;
					
					tx_dpram_raddress	<= 8'h0;
					tx_frame_busy		<= 1'b1;
					tx_frame_done		<= 1'b1;
				end
				
				default:	
				begin
					tx_state			<= TX_IDLE;
					next_state			<= TX_IDLE;
					
					encode_k			<= 1'b1;
					encode_data			<= SYNC;
					
					tx_word_reg			<= 32'h0;
					tx_byte_chs			<= 10'h0;
					tx_byte_chs_n		<= 10'h0;
					tx_word_counter		<= 9'h0;
					
					tx_dpram_raddress	<= 8'h0;
					tx_frame_busy		<= 1'b0;
					tx_frame_done		<= 1'b0;
					tx_dpram_rd			<= 1'b0;
				end
			endcase
		end
	end
	
endmodule
