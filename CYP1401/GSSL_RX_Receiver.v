module	GSSL_RX_Receiver
	(
		//inputs
		GSSL_RXCLK,
		rst_in,
		CHS_CTRL,
		
		decode_k,
		decode_data,
		
		//outputs
		rx_dpram_data,
		rx_dpram_waddress,
		rx_dpram_wr,
		
		rx_frame_head_data,
		rx_atc_status_data,
		
		rx_ttc_trigger,
		rx_atc_trigger,
		
		rx_frame_busy,
		rx_frame_done,
		
		rx_frame_len_err,
		rx_frame_chs_err,
		rx_frame_scd_err,
		
		//debug_signals
		rx_state_debug
	);
	
	input			GSSL_RXCLK;
	input			rst_in;
	input			CHS_CTRL;				//	CHS_CTRL: 0 - neg chs; 1 - pos chs
	
	input			decode_k;
	input	[7:0]	decode_data;
	
	output	[31:0]	rx_dpram_data;
	output	[7:0]	rx_dpram_waddress;
	output			rx_dpram_wr;
	
	output	[31:0]	rx_frame_head_data;
	output	[7:0]	rx_atc_status_data;
	
	output			rx_ttc_trigger;
	output			rx_atc_trigger;
	
	output			rx_frame_busy;
	output			rx_frame_done;
	
	output			rx_frame_len_err;
	output			rx_frame_chs_err;
	output			rx_frame_scd_err;
	
	output	[3:0]	rx_state_debug;
	
	reg		[31:0]	rx_dpram_data;
	reg		[7:0]	rx_dpram_waddress;
	reg				rx_dpram_wr,
					rx_dpram_wr_b;
	
	reg		[31:0]	rx_frame_head_data;
	reg		[7:0]	rx_atc_status_data;
	
	reg				rx_ttc_trigger;
	reg				rx_atc_trigger;
	
	reg				rx_frame_busy;
	reg				rx_frame_done;
	
	reg				rx_frame_len_err;
	reg				rx_frame_chs_err;
	reg				rx_frame_scd_err;
	
	reg		[3:0]	rx_state;
	reg		[3:0]	next_state;
	
	reg		[31:0]	rx_word_reg;
	reg		[9:0]	rx_byte_chs;
	reg		[9:0]	rx_byte_chs_n;
	reg				rx_frame_head_flag;
	reg		[8:0]	rx_word_counter;
	
	parameter	SOF		=	8'b00000000;       //k28.0
	parameter	EOF		=	8'b00000001;       //k28.1
	parameter	TTC		=	8'b00000010;       //k28.2
	parameter	SYNC	=	8'b00000101;       //k28.5
	parameter	ATC		=	8'b00000100;       //k28.4
	
	parameter	RX_IDLE		=	4'h0;
	parameter	RX_STATUS	=	4'h8;
	parameter	RX_BYTE_0	=	4'h1;
	parameter	RX_BYTE_1	=	4'h2;
	parameter	RX_BYTE_2	=	4'h3;
	parameter	RX_BYTE_3	=	4'h4;
	parameter	RX_BYTE_CHS	=	4'h5;
	parameter	RX_SYNC		=	4'h6;
	parameter	RX_EOF		=	4'h7;
	
	assign		rx_state_debug = rx_state;
	
	always @ ( posedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in == 1'b1 )
		begin
			rx_state				<= RX_IDLE;
			next_state				<= RX_IDLE;
			
			//rx_dpram_data			<= 32'h0;
			//rx_dpram_waddress		<= 8'h0;
			rx_dpram_wr_b				<= 1'b0;
			
			rx_frame_head_data		<= 32'h0;
			rx_atc_status_data		<= 8'h0;
			
			//rx_word_reg				<= 32'h0;
			//rx_byte_chs				<= 10'h0;
			//rx_byte_chs_n			<= 10'h0;
			
			rx_ttc_trigger			<= 1'b0;
			rx_atc_trigger			<= 1'b0;
			
			rx_frame_busy			<= 1'b0;
			rx_frame_done			<= 1'b0;
			
//			rx_frame_len_err		<= 1'b0;
//			rx_frame_chs_err		<= 1'b0;
//			rx_frame_scd_err		<= 1'b0;
			
			rx_frame_head_flag		<= 1'b0;
			rx_word_counter			<= 9'h0;
		end
		
		else
		begin
			case( rx_state )
				RX_IDLE:	
				begin
					if( decode_k == 1'b1 )
					begin
						case( decode_data )
							SOF:	
							begin
								rx_state			<= RX_BYTE_0;
								
								rx_ttc_trigger		<= 1'b0;
								rx_frame_busy		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
								rx_frame_head_flag	<= 1'b1;
							end
							
							TTC:	
							begin
								rx_state			<= RX_IDLE;
								
								rx_ttc_trigger		<= 1'b1;
								rx_frame_busy		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
								rx_frame_head_flag	<= 1'b0;
							end
								
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								
								rx_ttc_trigger		<= 1'b0;
								rx_frame_busy		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
								rx_frame_head_flag	<= 1'b0;
							end
									
							SYNC:	
							begin
								rx_state			<= RX_IDLE;
								
								rx_ttc_trigger		<= 1'b0;
								rx_frame_busy		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
								rx_frame_head_flag	<= 1'b0;
							end
							
							default:
							begin
								rx_state			<= RX_IDLE;
								
								rx_ttc_trigger		<= 1'b0;
								rx_frame_busy		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
								rx_frame_head_flag	<= 1'b0;
							end
						endcase
					end
					
					else
					begin
						rx_state			<= RX_IDLE;
						
						rx_ttc_trigger		<= 1'b0;
						rx_frame_busy		<= 1'b0;
						//rx_frame_scd_err	<= 1'b1;
						rx_frame_head_flag	<= 1'b0;
					end
					
					next_state				<= RX_IDLE;
					
					//rx_dpram_data			<= 32'h0;
					//rx_dpram_waddress		<= 8'h0;
					rx_dpram_wr_b				<= 1'b0;
					
					//rx_word_reg				<= 32'h0;
					//rx_byte_chs				<= 10'h0;
					//rx_byte_chs_n			<= 10'h0;
					
					rx_atc_trigger			<= 1'b0;
					
					rx_frame_done			<= 1'b0;
					
					//rx_frame_len_err		<= 1'b0;
					//rx_frame_chs_err		<= 1'b0;
					
					rx_word_counter			<= 9'h0;
				end
				
				RX_STATUS:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_atc_status_data	<= decode_data;
						rx_atc_trigger		<= 1'b1;
						
						case( next_state )
							RX_IDLE:	
							begin
								rx_state			<= RX_IDLE;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_0:	
							begin
								rx_state			<= RX_BYTE_0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_1:	
							begin
								rx_state			<= RX_BYTE_1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_2:	
							begin
								rx_state			<= RX_BYTE_2;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_3:	
							begin
								rx_state			<= RX_BYTE_3;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_CHS:
							begin
								rx_state			<= RX_BYTE_CHS;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_SYNC:	
							begin
								rx_state			<= RX_SYNC;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							RX_EOF:		
							begin
								rx_state			<= RX_EOF;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							default:	
							begin
								rx_state			<= RX_IDLE;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
						
					else
					begin
						rx_state			<= RX_IDLE;
						rx_atc_status_data	<= 8'h0;
						rx_atc_trigger		<= 1'b0;
						//rx_frame_scd_err	<= 1'b1;
					end

					rx_frame_done			<= 1'b0;
				end
				
				RX_BYTE_0:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_state			<= RX_BYTE_1;
						
						rx_dpram_wr_b			<= 1'b0;
						//rx_word_reg[7:0]	<= decode_data;
						//rx_byte_chs			<= { 2'h0 , decode_data };
						//rx_byte_chs_n		<= 10'h0;
						rx_ttc_trigger		<= 1'b0;
						rx_atc_trigger		<= 1'b0;
						rx_frame_busy		<= 1'b1;
						rx_frame_done		<= 1'b0;
						//rx_frame_len_err	<= 1'b0;
						//rx_frame_chs_err	<= 1'b0;
						//rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_BYTE_0;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_state			<= RX_BYTE_0;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_state			<= RX_IDLE;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					next_state		<= RX_BYTE_0;
				end
				
				RX_BYTE_1:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_state			<= RX_BYTE_2;
						
						rx_dpram_wr_b			<= 1'b0;
						//rx_word_reg[15:8]	<= decode_data;
						//rx_byte_chs_n		<= 10'h0;
						/*
						if( rx_frame_head_flag == 1'b1 )
							rx_byte_chs		<= rx_byte_chs + { 2'h0, decode_data } + { 2'h0 , rx_word_reg[7:0] };

						else
							rx_byte_chs		<= rx_byte_chs + { 2'h0, decode_data } + { 2'h0 , rx_frame_head_data[7:0] };
						*/
						rx_ttc_trigger		<= 1'b0;
						rx_atc_trigger		<= 1'b0;
						rx_frame_busy		<= 1'b1;
						rx_frame_done		<= 1'b0;
						//rx_frame_len_err	<= 1'b0;
						//rx_frame_chs_err	<= 1'b0;
						//rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_BYTE_1;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_state			<= RX_BYTE_1;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_state			<= RX_IDLE;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					next_state		<= RX_BYTE_1;
				end
				
				RX_BYTE_2:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_state			<= RX_BYTE_3;
						
						rx_dpram_wr_b			<= 1'b0;
						//rx_word_reg[23:16]	<= decode_data;
						//rx_byte_chs			<= rx_byte_chs + { 2'h0 , decode_data };
						//rx_byte_chs_n		<= 10'h0;
						rx_ttc_trigger		<= 1'b0;
						rx_atc_trigger		<= 1'b0;
						rx_frame_busy		<= 1'b1;
						rx_frame_done		<= 1'b0;
						//rx_frame_len_err	<= 1'b0;
						//rx_frame_chs_err	<= 1'b0;
						//rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_BYTE_2;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_state			<= RX_BYTE_2;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_state			<= RX_IDLE;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					next_state		<= RX_BYTE_2;
				end
				
				RX_BYTE_3:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_state			<= RX_BYTE_CHS;
						
						//rx_word_reg[31:24]	<= decode_data;
						//rx_byte_chs			<= rx_byte_chs + { 2'h0 , decode_data } - { 1'b0 , rx_word_counter } + 8'b1;
						//rx_byte_chs_n		<= ~( rx_byte_chs + { 2'h0 , decode_data } - { 1'b0 , rx_word_counter } );
						rx_dpram_wr_b			<= 1'b0;
						rx_ttc_trigger		<= 1'b0;
						rx_atc_trigger		<= 1'b0;
						rx_frame_busy		<= 1'b1;
						rx_frame_done		<= 1'b0;
						//rx_frame_len_err	<= 1'b0;
						//rx_frame_chs_err	<= 1'b0;
						
						if( rx_frame_head_flag == 1'b1 )
							rx_frame_head_data	<= { 16'h0 , rx_word_reg[15:0] };
							
						//rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_BYTE_3;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_state			<= RX_BYTE_3;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_state			<= RX_IDLE;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
						
					next_state		<= RX_BYTE_3;
				end
				
				RX_BYTE_CHS:
				begin
					if( decode_k == 1'b0 )
					begin
						rx_state					<= RX_SYNC;
						/*
						if( CHS_CTRL == 1'b0 )
						begin
							if( decode_data != rx_byte_chs_n[7:0] )
								rx_frame_chs_err	<= 1'b1;

							else
								rx_frame_chs_err	<= 1'b0;
						end
						
						else
						begin
							if( decode_data != rx_byte_chs[7:0] )
								rx_frame_chs_err	<= 1'b1;

							else
								rx_frame_chs_err	<= 1'b0;
						end
						*/
						//rx_dpram_data				<= rx_word_reg;
						
						//if( rx_frame_head_flag == 1'b1 )
						//	rx_dpram_waddress		<= 8'h0;

						//else
						//	rx_dpram_waddress		<= rx_frame_head_data[15:8] + rx_word_counter[7:0] - 8'h1;

						rx_dpram_wr_b			<= 1'b0;
						//rx_word_reg			<= 32'h0;
						rx_ttc_trigger		<= 1'b0;
						rx_atc_trigger		<= 1'b0;
						rx_frame_busy		<= 1'b1;
						rx_frame_done		<= 1'b0;
						//rx_frame_len_err	<= 1'b0;
						//rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_BYTE_CHS;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_state			<= RX_BYTE_CHS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_state			<= RX_IDLE;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
						
					next_state		<= RX_BYTE_CHS;
				end
				
				RX_SYNC:	
				begin
					if( decode_k == 1'b1 )
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_SYNC;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								if( rx_word_counter[7:0] == rx_frame_head_data[7:0] )
									rx_state		<= RX_EOF;

								else
									rx_state		<= RX_BYTE_0;
									
								if( rx_frame_head_flag == 0 )
									rx_dpram_wr_b			<= 1'b1;
									
								//rx_word_reg			<= 32'h0;
								//rx_byte_chs			<= 10'h0;
								//rx_byte_chs_n		<= 10'h0;
								rx_ttc_trigger		<= 1'b0;
								rx_atc_trigger		<= 1'b0;
								rx_frame_busy		<= 1'b1;
								rx_frame_done		<= 1'b0;
								//rx_frame_len_err	<= 1'b0;
								//rx_frame_chs_err	<= 1'b0;
								rx_frame_head_flag	<= 1'b0;
								rx_word_counter		<= rx_word_counter + 9'h1;	
								//rx_frame_scd_err	<= 1'b0;
							end
									
							default:
							begin
								rx_state			<= RX_IDLE;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					else
					begin
						rx_state			<= RX_IDLE;
						//rx_frame_scd_err	<= 1'b1;
					end
					
					next_state		<= RX_SYNC;
				end
				
				RX_EOF:		
				begin
					if( decode_k == 1'b1 )
					begin
						case( decode_data )
							TTC:	
							begin
								rx_state			<= RX_EOF;
								rx_ttc_trigger		<= 1'b1;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_state			<= RX_STATUS;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_state			<= RX_EOF;
								rx_ttc_trigger		<= 1'b0;
								//rx_frame_scd_err	<= 1'b0;
							end
							
							EOF:	
							begin
								rx_state			<= RX_IDLE;
								
								rx_dpram_wr_b			<= 1'b0;
								//rx_word_reg			<= 32'h0;
								//rx_byte_chs			<= 10'h0;
								//rx_byte_chs_n		<= 10'h0;
								rx_ttc_trigger		<= 1'b0;
								rx_atc_trigger		<= 1'b0;
								rx_frame_busy		<= 1'b1;
								rx_frame_done		<= 1'b1;
								
								//if( rx_word_counter[7:0] == rx_frame_head_data[7:0] + 8'h1 )
									//rx_frame_len_err	<= 1'b0;
									
								//else
									//rx_frame_len_err	<= 1'b1;

								//rx_frame_chs_err	<= 1'b0;
								rx_frame_head_flag	<= 1'b0;
							end
							
							default:
							begin
									rx_state			<= RX_IDLE;
									rx_ttc_trigger		<= 1'b0;
									//rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					else
					begin
						rx_state			<= RX_IDLE;
						//rx_frame_scd_err	<= 1'b1;
					end
					
					next_state	<= RX_EOF;
				end
				
				default:	
				begin
					rx_state				<= RX_IDLE;
					next_state				<= RX_IDLE;
					//rx_dpram_data			<= 32'h0;
					//rx_dpram_waddress		<= 8'h0;
					rx_dpram_wr_b				<= 1'b0;
					rx_frame_head_data		<= 32'h0;
					rx_atc_status_data		<= 8'h0;
					//rx_word_reg				<= 32'h0;
					//rx_byte_chs				<= 10'h0;
					//rx_byte_chs_n			<= 10'h0;
					rx_ttc_trigger			<= 1'b0;
					rx_atc_trigger			<= 1'b0;
					rx_frame_busy			<= 1'b0;
					rx_frame_done			<= 1'b0;
					//rx_frame_len_err		<= 1'b0;
					//rx_frame_chs_err		<= 1'b0;
					//rx_frame_scd_err		<= 1'b0;
					rx_frame_head_flag		<= 1'b0;
					rx_word_counter			<= 9'h0;
				end
			endcase
		end
	end
	
	//rx_dpram_data
	always @ ( negedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in )
			rx_dpram_data <= 'b0;
		
		else
		begin
			if( rx_state == RX_BYTE_CHS )
				rx_dpram_data	<= rx_word_reg;	
		end
	end	
	
	//rx_dpram_waddress
	always @ ( negedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in )
			rx_dpram_waddress <= 'b0;
		
		else
		begin
			if( rx_state == RX_BYTE_CHS )
				rx_dpram_waddress	<= rx_frame_head_data[15:8] + rx_word_counter[7:0] - 8'h1;
		end
	end
		
	//rx_dpram_wr
	always @ ( posedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in )
			rx_dpram_wr <= 'b0;
		
		else
			rx_dpram_wr <= rx_dpram_wr_b;
	end
	
	//rx_word_reg
	always @ ( posedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in )
			rx_word_reg	<= 32'h0;
			
		else
		begin
			case( rx_state )
				RX_IDLE:	
				begin	
					rx_word_reg			<= 32'h0;
				end
					
				RX_BYTE_0:
				begin		
					if( decode_k == 1'b0 )
						rx_word_reg[7:0]	<= decode_data;
				end
					
				RX_BYTE_1:	
				begin	
					if( decode_k == 1'b0 )
						rx_word_reg[15:8]	<= decode_data;
				end
					
				RX_BYTE_2:	
				begin	
					if( decode_k == 1'b0 )
						rx_word_reg[23:16]	<= decode_data;
				end
					
				RX_BYTE_3:		
				begin
					if( decode_k == 1'b0 )
						rx_word_reg[31:24]	<= decode_data;
				end
					
				RX_BYTE_CHS:
				begin
					if( decode_k == 1'b0 )
						rx_word_reg <= 'b0;
				end
				
				RX_SYNC:	
				begin
					if( decode_k == 1'b1 )
						if( decode_data == SYNC )
							rx_word_reg <= 'b0;
				end
				
				RX_EOF:	
				begin
					if( decode_k == 1'b1 )
						if( decode_data == EOF )
							rx_word_reg <= 'b0;
				end
				
				default:
				begin
					rx_word_reg <= 'b0;
				end
			endcase
		end
	end
	
	//rx_byte_chs,rx_byte_chs_n
	always @ ( posedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in )
		begin
			rx_byte_chs				<= 10'h0;
			rx_byte_chs_n			<= 10'h0;
		end
			
		else
		begin
			case( rx_state )
				RX_IDLE:	
				begin
					rx_byte_chs				<= 10'h0;
					rx_byte_chs_n			<= 10'h0;
				end
					
				RX_BYTE_0:
				begin
//					if( decode_k == 1'b0 )
//					begin
						rx_byte_chs			<= { 2'h0 , decode_data };
						rx_byte_chs_n		<= 10'h0;
//					end
				end
					
				RX_BYTE_1:	
				begin
//					if( decode_k == 1'b0 )
//					begin
						rx_byte_chs_n		<= 10'h0;
						
						if( rx_frame_head_flag == 1'b1 )
							rx_byte_chs		<= rx_byte_chs + { 2'h0, decode_data } + { 2'h0 , rx_word_reg[7:0] };

						else
							rx_byte_chs		<= rx_byte_chs + { 2'h0, decode_data } + { 2'h0 , rx_frame_head_data[7:0] };
//					end
				end
					
				RX_BYTE_2:	
				begin
//					if( decode_k == 1'b0 )
//					begin
						rx_byte_chs			<= rx_byte_chs + { 2'h0 , decode_data };
						rx_byte_chs_n		<= 10'h0;
//					end
				end
				
				RX_BYTE_3:		
				begin
//					if( decode_k == 1'b0 )
//					begin
						rx_byte_chs			<= rx_byte_chs + { 2'h0 , decode_data } - { 1'b0 , rx_word_counter } + 8'b1;
						rx_byte_chs_n		<= ~( rx_byte_chs + { 2'h0 , decode_data } - { 1'b0 , rx_word_counter } );
//					end
				end
								
				RX_SYNC:	
				begin
//					if( decode_k == 1'b1 )
//					begin
//						case( decode_data )
//							SYNC:	
//							begin
								rx_byte_chs			<= 10'h0;
								rx_byte_chs_n		<= 10'h0;								
//							end
//						endcase
//					end
				end
				
				RX_EOF:	
				begin
//					if( decode_k == 1'b1 )
//					begin
//						case( decode_data )							
//							EOF:	
//							begin
								rx_byte_chs			<= 10'h0;
								rx_byte_chs_n		<= 10'h0;								
//							end								
//						endcase
//					end
				end
				
				default:
				begin
					rx_byte_chs				<= 10'h0;
					rx_byte_chs_n			<= 10'h0;
				end
			endcase
		end
	end
		
	//rx_frame_len_err,rx_frame_chs_err,rx_frame_scd_err
	always @ ( posedge GSSL_RXCLK or posedge rst_in )
	begin
		if( rst_in )
		begin
			rx_frame_len_err		<= 1'b0;
			rx_frame_chs_err		<= 1'b0;
			rx_frame_scd_err		<= 1'b0;
		end
			
		else
		begin
			case( rx_state )
				RX_IDLE:	
				begin
					if( decode_k == 1'b1 )
					begin
						case( decode_data )
							SOF:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
								
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
									
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					else
					begin
						rx_frame_scd_err	<= 1'b1;
					end
					
					rx_frame_len_err		<= 1'b0;
					rx_frame_chs_err		<= 1'b0;
				end
						
				RX_STATUS:	
				begin
					if( decode_k == 1'b0 )
					begin						
						case( next_state )
							RX_IDLE:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_0:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_1:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_2:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_3:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_BYTE_CHS:
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							RX_EOF:		
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:	
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
						
					else
					begin
						rx_frame_scd_err	<= 1'b1;
					end
				end
							
				RX_BYTE_0:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_frame_len_err	<= 1'b0;
						rx_frame_chs_err	<= 1'b0;
						rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
				end
									
				RX_BYTE_1:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_frame_len_err	<= 1'b0;
						rx_frame_chs_err	<= 1'b0;
						rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
				end
				
				RX_BYTE_2:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_frame_len_err	<= 1'b0;
						rx_frame_chs_err	<= 1'b0;
						rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
				end
				
				RX_BYTE_3:	
				begin
					if( decode_k == 1'b0 )
					begin
						rx_frame_len_err	<= 1'b0;
						rx_frame_chs_err	<= 1'b0;
						rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
				end
				
				RX_BYTE_CHS:
				begin
					if( decode_k == 1'b0 )
					begin						
						if( CHS_CTRL == 1'b0 )
						begin
							if( decode_data != rx_byte_chs_n[7:0] )
								rx_frame_chs_err	<= 1'b1;

							else
								rx_frame_chs_err	<= 1'b0;
						end
						
						else
						begin
							if( decode_data != rx_byte_chs[7:0] )
								rx_frame_chs_err	<= 1'b1;

							else
								rx_frame_chs_err	<= 1'b0;
						end

						rx_frame_len_err	<= 1'b0;
						rx_frame_scd_err	<= 1'b0;
					end
					
					else
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
				end
				
				RX_SYNC:	
				begin
					if( decode_k == 1'b1 )
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin									
								rx_frame_len_err	<= 1'b0;
								rx_frame_chs_err	<= 1'b0;
								rx_frame_scd_err	<= 1'b0;
							end
									
							default:
							begin
								rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					else
					begin
						rx_frame_scd_err	<= 1'b1;
					end
				end
				
				RX_EOF:		
				begin
					if( decode_k == 1'b1 )
					begin
						case( decode_data )
							TTC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							ATC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							SYNC:	
							begin
								rx_frame_scd_err	<= 1'b0;
							end
							
							EOF:	
							begin
								if( rx_word_counter[7:0] == rx_frame_head_data[7:0] + 8'h1 )
									rx_frame_len_err	<= 1'b0;
									
								else
									rx_frame_len_err	<= 1'b1;

								rx_frame_chs_err	<= 1'b0;
							end
							
							default:
							begin
									rx_frame_scd_err	<= 1'b1;
							end
						endcase
					end
					
					else
					begin
						rx_frame_scd_err	<= 1'b1;
					end
				end
				
				default:
				begin
					rx_frame_len_err		<= 1'b0;
					rx_frame_chs_err		<= 1'b0;
					rx_frame_scd_err		<= 1'b0;
				end
			endcase
		end
	end
	
endmodule
