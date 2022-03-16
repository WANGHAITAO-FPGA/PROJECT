`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: yg_st
// Engineer: wanght
// 
// Create Date: 2020/12/21 09:56:49
// Design Name: 
// Module Name: gtp_tx
// Project Name: 
// Target Devices: zynq_7030
// Tool Versions: v1.00
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module gtp_tx(
	(*keep = "true"*) input 	wire 			    log_rst_q 			,
	(*keep = "true"*) input	wire			      log_clk 			,		
	
	(*keep = "true"*) output 	reg [31:0]  	s_axi_tx_tdata		,
	(*keep = "true"*) output 	wire[3:0]   	s_axi_tx_tkeep		,
	(*keep = "true"*) output 	wire 			    s_axi_tx_tlast		,
	(*keep = "true"*) output 	wire 			    s_axi_tx_tvalid		,
	(*keep = "true"*) input 	wire 			    s_axi_tx_tready		,
	
	(*keep = "true"*) input   wire[31:0]     tx_packet_gtxid     ,
  (*keep = "true"*) input   wire[31:0]	   tx_packet_head      ,
	(*keep = "true"*) input   wire           tx_packet_req       ,
	(*keep = "true"*) input   wire           tx_packet_trigger   ,
	(*keep = "true"*) output  reg[31:0]      crc_data            ,

  (*keep = "true"*) output  wire[7:0]      tx_packet_addra     ,
  (*keep = "true"*) input   wire[31:0]     tx_packet_data      ,
  (*keep = "true"*) output  wire           tx_packet_rden      
);

//==========================================
//parameter defien
//==========================================
 assign s_axi_tx_tkeep = 4'hf;
 
 localparam IDLE             = 9'b000000000;
 localparam TX_HEAD          = 9'b000000001;
 localparam TX_GTXID         = 9'b000000010;
 localparam TX_LENGTH        = 9'b000000100;
 localparam TX_DATA          = 9'b000001000;
 //localparam  TX_CHECK_H      = 9'b000010000;
 //localparam  TX_CHECK_L      = 9'b000100000; 
 localparam  TX_CHECK        = 9'b000010000;
 localparam  TX_END          = 9'b001000000;
 localparam  TX_TRIGGER      = 9'b010000000;
 localparam  TX_TRIGGER_END  = 9'b100000000;
 
 reg[8:0] current_state;
 reg[8:0] next_state;

 wire ireq_advance_condition  = s_axi_tx_tready && s_axi_tx_tvalid;
 
 reg   [5:0] current_beat_cnt;
 
always @(posedge log_clk or posedge log_rst_q) begin
   if(log_rst_q) current_state <= IDLE;
   else current_state <= next_state;
end

always @(*)begin
  //next_state = IDLE;
  case(current_state)
     IDLE: 
       if(tx_packet_req && s_axi_tx_tready) next_state = TX_HEAD;
       //else if(tx_packet_trigger && s_axi_tx_tready) next_state =  TX_TRIGGER;
       else next_state = IDLE;
     TX_HEAD: 
       if(ireq_advance_condition) next_state = TX_GTXID;
       else next_state = TX_HEAD;
     TX_GTXID:  
       if(ireq_advance_condition) next_state = TX_LENGTH;
       else next_state = TX_GTXID;
     TX_LENGTH: 
       if(ireq_advance_condition) next_state = TX_DATA;
       else next_state = TX_LENGTH;
     TX_DATA: 
       if((current_beat_cnt > tx_packet_head[7:0]+1'b1)&&ireq_advance_condition) next_state = TX_CHECK;
       else next_state = TX_DATA;
     TX_CHECK: 
       if(ireq_advance_condition) next_state = TX_END;
       else next_state = TX_CHECK;
     /*TX_CHECK_L: 
       if(ireq_advance_condition) next_state = TX_END;
       else next_state = TX_CHECK_L;*/
     TX_END: 
       if(ireq_advance_condition) next_state = IDLE;
       else next_state = TX_END;
     TX_TRIGGER:
       if(ireq_advance_condition)  next_state = TX_TRIGGER_END;  
       else next_state = TX_TRIGGER;
     TX_TRIGGER_END:
       if(ireq_advance_condition) next_state = IDLE;
       else next_state = TX_TRIGGER_END;
     default: 
       next_state = IDLE;
  endcase
end

assign s_axi_tx_tvalid = ((current_state != IDLE)&& s_axi_tx_tready)?1'b1:1'b0;

assign tx_packet_rden = ((current_state != IDLE)&& s_axi_tx_tready)?1'b0:1'b1;

wire[5:0] tx_byte_cnt;

always @(posedge log_clk or posedge log_rst_q) begin
  if (log_rst_q) begin
    current_beat_cnt <= 6'h0;
  end else if (ireq_advance_condition && s_axi_tx_tlast) begin
    current_beat_cnt <= 6'h0;
  end else if (ireq_advance_condition) begin
    current_beat_cnt <= current_beat_cnt + 1'b1;
  end
end

assign tx_byte_cnt = (ireq_advance_condition)?(current_beat_cnt + 1'b1):current_beat_cnt;
  
assign  s_axi_tx_tlast = ((current_beat_cnt == (tx_packet_head[7:0]+3'd5))||(current_state == TX_END)||(current_state == TX_TRIGGER_END)&& ireq_advance_condition)?1'b1:1'b0;
    
    
always @(*) begin
   s_axi_tx_tdata = 16'h0000;
   if (current_state == TX_HEAD) begin
     s_axi_tx_tdata  = 16'hffbc;
   end else if(current_state == TX_GTXID) begin
     s_axi_tx_tdata  = tx_packet_gtxid;
   end else if(current_state == TX_LENGTH) begin
   	 s_axi_tx_tdata  = tx_packet_head;   	 
   end else if(current_state == TX_DATA) begin
   	 s_axi_tx_tdata  = tx_packet_data;    	 
   end else if(current_state == TX_CHECK) begin
   	 s_axi_tx_tdata  = crc_data;
   //end else if(current_state == TX_CHECK_L) begin
   //  s_axi_tx_tdata  <= crc_data[15:0];   	 
   end else if(current_state == TX_END) begin
   	 s_axi_tx_tdata  = 16'hffbd;
   end else if(current_state == TX_TRIGGER)	begin
     s_axi_tx_tdata  = 16'hffba;
   end else if(current_state == TX_TRIGGER_END)	begin
     s_axi_tx_tdata  = 16'hffbb;
   end  
end   

reg[7:0] tx_addr_temp;

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) begin
    tx_addr_temp <= 8'd0;
  end else if(tx_packet_head[15:0]==1) begin
    tx_addr_temp <= 8'd0;
  end else if(tx_packet_head[15:0]!=1) begin
    if((current_state == TX_GTXID)&&ireq_advance_condition)begin
       if(tx_packet_head[15:8]==0)tx_addr_temp <= tx_packet_head[15:8]+1'b1;
       else tx_addr_temp <= tx_packet_head[15:8];
    end   
    else if((current_state == TX_LENGTH)&&ireq_advance_condition) tx_addr_temp <= tx_addr_temp+1'b1;
    else if((current_state == TX_DATA)&&ireq_advance_condition) tx_addr_temp <= tx_addr_temp+1'b1;
  end
end


assign tx_packet_addra = (ireq_advance_condition)?tx_addr_temp:(tx_addr_temp-1'b1);


always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q)begin
    crc_data <= 32'hffffffff;
  end else begin
    if((current_state == TX_GTXID)||(current_state == TX_LENGTH)||(current_state == TX_DATA)&&ireq_advance_condition) crc_data <= nextCRC32_D32(s_axi_tx_tdata,crc_data);
    else if(current_state == IDLE) crc_data <= 32'hffffffff;
    else crc_data <= crc_data;
  end  
end  
    

 function [31:0] nextCRC32_D32;

    input [31:0] Data;
    input [31:0] crc;
    reg [31:0] d;
    reg [31:0] c;
    reg [31:0] newcrc;
  begin
    d = Data;
    c = crc;

    newcrc[0] = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[16] ^ d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[0] ^ c[0] ^ c[6] ^ c[9] ^ c[10] ^ c[12] ^ c[16] ^ c[24] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
    newcrc[1] = d[28] ^ d[27] ^ d[24] ^ d[17] ^ d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[7] ^ d[6] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[6] ^ c[7] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[16] ^ c[17] ^ c[24] ^ c[27] ^ c[28];
    newcrc[2] = d[31] ^ d[30] ^ d[26] ^ d[24] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[13] ^ c[14] ^ c[16] ^ c[17] ^ c[18] ^ c[24] ^ c[26] ^ c[30] ^ c[31];
    newcrc[3] = d[31] ^ d[27] ^ d[25] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[25] ^ c[27] ^ c[31];
    newcrc[4] = d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[20] ^ d[19] ^ d[18] ^ d[15] ^ d[12] ^ d[11] ^ d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[11] ^ c[12] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[24] ^ c[25] ^ c[29] ^ c[30] ^ c[31];
    newcrc[5] = d[29] ^ d[28] ^ d[24] ^ d[21] ^ d[20] ^ d[19] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[10] ^ c[13] ^ c[19] ^ c[20] ^ c[21] ^ c[24] ^ c[28] ^ c[29];
    newcrc[6] = d[30] ^ d[29] ^ d[25] ^ d[22] ^ d[21] ^ d[20] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[11] ^ c[14] ^ c[20] ^ c[21] ^ c[22] ^ c[25] ^ c[29] ^ c[30];
    newcrc[7] = d[29] ^ d[28] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[16] ^ d[15] ^ d[10] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[3] ^ c[5] ^ c[7] ^ c[8] ^ c[10] ^ c[15] ^ c[16] ^ c[21] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[28] ^ c[29];
    newcrc[8] = d[31] ^ d[28] ^ d[23] ^ d[22] ^ d[17] ^ d[12] ^ d[11] ^ d[10] ^ d[8] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[8] ^ c[10] ^ c[11] ^ c[12] ^ c[17] ^ c[22] ^ c[23] ^ c[28] ^ c[31];
    newcrc[9] = d[29] ^ d[24] ^ d[23] ^ d[18] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[18] ^ c[23] ^ c[24] ^ c[29];
    newcrc[10] = d[31] ^ d[29] ^ d[28] ^ d[26] ^ d[19] ^ d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[3] ^ c[5] ^ c[9] ^ c[13] ^ c[14] ^ c[16] ^ c[19] ^ c[26] ^ c[28] ^ c[29] ^ c[31];
    newcrc[11] = d[31] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[9] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[9] ^ c[12] ^ c[14] ^ c[15] ^ c[16] ^ c[17] ^ c[20] ^ c[24] ^ c[25] ^ c[26] ^ c[27] ^ c[28] ^ c[31];
    newcrc[12] = d[31] ^ d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[18] ^ d[17] ^ d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[6] ^ c[9] ^ c[12] ^ c[13] ^ c[15] ^ c[17] ^ c[18] ^ c[21] ^ c[24] ^ c[27] ^ c[30] ^ c[31];
    newcrc[13] = d[31] ^ d[28] ^ d[25] ^ d[22] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^ c[10] ^ c[13] ^ c[14] ^ c[16] ^ c[18] ^ c[19] ^ c[22] ^ c[25] ^ c[28] ^ c[31];
    newcrc[14] = d[29] ^ d[26] ^ d[23] ^ d[20] ^ d[19] ^ d[17] ^ d[15] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^ c[8] ^ c[11] ^ c[14] ^ c[15] ^ c[17] ^ c[19] ^ c[20] ^ c[23] ^ c[26] ^ c[29];
    newcrc[15] = d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[20] ^ d[18] ^ d[16] ^ d[15] ^ d[12] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[4] ^ d[3] ^ c[3] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^ c[12] ^ c[15] ^ c[16] ^ c[18] ^ c[20] ^ c[21] ^ c[24] ^ c[27] ^ c[30];
    newcrc[16] = d[30] ^ d[29] ^ d[26] ^ d[24] ^ d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[13] ^ d[12] ^ d[8] ^ d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[4] ^ c[5] ^ c[8] ^ c[12] ^ c[13] ^ c[17] ^ c[19] ^ c[21] ^ c[22] ^ c[24] ^ c[26] ^ c[29] ^ c[30];
    newcrc[17] = d[31] ^ d[30] ^ d[27] ^ d[25] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[14] ^ d[13] ^ d[9] ^ d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[5] ^ c[6] ^ c[9] ^ c[13] ^ c[14] ^ c[18] ^ c[20] ^ c[22] ^ c[23] ^ c[25] ^ c[27] ^ c[30] ^ c[31];
    newcrc[18] = d[31] ^ d[28] ^ d[26] ^ d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[15] ^ d[14] ^ d[10] ^ d[7] ^ d[6] ^ d[2] ^ c[2] ^ c[6] ^ c[7] ^ c[10] ^ c[14] ^ c[15] ^ c[19] ^ c[21] ^ c[23] ^ c[24] ^ c[26] ^ c[28] ^ c[31];
    newcrc[19] = d[29] ^ d[27] ^ d[25] ^ d[24] ^ d[22] ^ d[20] ^ d[16] ^ d[15] ^ d[11] ^ d[8] ^ d[7] ^ d[3] ^ c[3] ^ c[7] ^ c[8] ^ c[11] ^ c[15] ^ c[16] ^ c[20] ^ c[22] ^ c[24] ^ c[25] ^ c[27] ^ c[29];
    newcrc[20] = d[30] ^ d[28] ^ d[26] ^ d[25] ^ d[23] ^ d[21] ^ d[17] ^ d[16] ^ d[12] ^ d[9] ^ d[8] ^ d[4] ^ c[4] ^ c[8] ^ c[9] ^ c[12] ^ c[16] ^ c[17] ^ c[21] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ c[30];
    newcrc[21] = d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[24] ^ d[22] ^ d[18] ^ d[17] ^ d[13] ^ d[10] ^ d[9] ^ d[5] ^ c[5] ^ c[9] ^ c[10] ^ c[13] ^ c[17] ^ c[18] ^ c[22] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
    newcrc[22] = d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[24] ^ d[23] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ d[12] ^ d[11] ^ d[9] ^ d[0] ^ c[0] ^ c[9] ^ c[11] ^ c[12] ^ c[14] ^ c[16] ^ c[18] ^ c[19] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
    newcrc[23] = d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[20] ^ d[19] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[9] ^ d[6] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[6] ^ c[9] ^ c[13] ^ c[15] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
    newcrc[24] = d[30] ^ d[28] ^ d[27] ^ d[21] ^ d[20] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[10] ^ d[7] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[7] ^ c[10] ^ c[14] ^ c[16] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[27] ^ c[28] ^ c[30];
    newcrc[25] = d[31] ^ d[29] ^ d[28] ^ d[22] ^ d[21] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[11] ^ d[8] ^ d[3] ^ d[2] ^ c[2] ^ c[3] ^ c[8] ^ c[11] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ c[28] ^ c[29] ^ c[31];
    newcrc[26] = d[31] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[19] ^ d[18] ^ d[10] ^ d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[0] ^ c[3] ^ c[4] ^ c[6] ^ c[10] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ c[28] ^ c[31];
    newcrc[27] = d[29] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[20] ^ d[19] ^ d[11] ^ d[7] ^ d[5] ^ d[4] ^ d[1] ^ c[1] ^ c[4] ^ c[5] ^ c[7] ^ c[11] ^ c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ c[27] ^ c[29];
    newcrc[28] = d[30] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[22] ^ d[21] ^ d[20] ^ d[12] ^ d[8] ^ d[6] ^ d[5] ^ d[2] ^ c[2] ^ c[5] ^ c[6] ^ c[8] ^ c[12] ^ c[20] ^ c[21] ^ c[22] ^ c[24] ^ c[25] ^ c[26] ^ c[27] ^ c[28] ^ c[30];
    newcrc[29] = d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[23] ^ d[22] ^ d[21] ^ d[13] ^ d[9] ^ d[7] ^ d[6] ^ d[3] ^ c[3] ^ c[6] ^ c[7] ^ c[9] ^ c[13] ^ c[21] ^ c[22] ^ c[23] ^ c[25] ^ c[26] ^ c[27] ^ c[28] ^ c[29] ^ c[31];
    newcrc[30] = d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[24] ^ d[23] ^ d[22] ^ d[14] ^ d[10] ^ d[8] ^ d[7] ^ d[4] ^ c[4] ^ c[7] ^ c[8] ^ c[10] ^ c[14] ^ c[22] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[29] ^ c[30];
    newcrc[31] = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^ d[24] ^ d[23] ^ d[15] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ c[5] ^ c[8] ^ c[9] ^ c[11] ^ c[15] ^ c[23] ^ c[24] ^ c[25] ^ c[27] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
    nextCRC32_D32 = newcrc;
  end
  endfunction
  
/*
ila_2 ila_2_inst (
  .clk                      (log_clk           ), // input wire clk                 
                  
  .probe0                   (s_axi_tx_tdata         ), 
  .probe1                   (s_axi_tx_tvalid        ), 
  .probe2                   (s_axi_tx_tlast        ),
  .probe3                   (s_axi_tx_tready),
  .probe4                   (current_state),
  .probe5                   (tx_packet_addra),
  .probe6                   (current_beat_cnt)
); */

endmodule
