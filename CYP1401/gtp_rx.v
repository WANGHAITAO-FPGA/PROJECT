`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/04 16:19:57
// Design Name: 
// Module Name: gtp_rx
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
module gtp_rx(
  (*keep = "true"*) input	 wire			      log_clk,		
  (*keep = "true"*) input  wire           log_rst_q,
  
  (*keep = "true"*) input  wire[31:0]     m_axi_rx_tdata,
  (*keep = "true"*) input  wire           m_axi_rx_tvalid,
  (*keep = "true"*) input  wire           m_axi_rx_tlast,
  
  (*keep = "true"*) output reg            gtp_rx_done,
  (*keep = "true"*) output reg            gtp_rx_trigger,
  
  (*keep = "true"*) output reg[7:0]       packet_data_addr,
  (*keep = "true"*) output wire           packet_data_wr,
  
  (*keep = "true"*) input  wire[31:0]     gtx_id,
  (*keep = "true"*) output reg[31:0]      gtx_rd_id,
  (*keep = "true"*) output reg            gtx_id_error,
  (*keep = "true"*) output reg[31:0]      packet_data_head 
 );
     
localparam  IDLE        = 4'b0000;
localparam  RX_GTXID    = 4'b0001;
localparam  RX_HEAD     = 4'b0010;
localparam  RX_DATA     = 4'b0100;
localparam  RX_TRIGGER  = 4'b1000;

reg[5:0] current_state;
reg[6:0] next_state;
reg[7:0] rec_data_num;
reg[31:0] crc_rddata;
reg[31:0] crc_data;
//reg[3:0] packet_data_wr;
//reg[7:0] packet_data_addr;
reg[7:0] store_length;
reg[7:0] store_head;

reg packet_data_wr_temp;

always @(posedge log_clk or posedge log_rst_q) begin
   if(log_rst_q) current_state <= IDLE;
   else current_state <= next_state;
end

always @(*)begin
  next_state = IDLE;
  case(current_state)
     IDLE: begin
       if((m_axi_rx_tvalid)&&(m_axi_rx_tdata == 32'hffbc)) next_state = RX_GTXID;
       else if((m_axi_rx_tvalid)&&(m_axi_rx_tdata == 32'hffba)) next_state = RX_TRIGGER;
       else next_state = IDLE;
     end  
     RX_GTXID:begin
         if(m_axi_rx_tvalid)  next_state = RX_HEAD;
         else next_state = RX_GTXID;          
     end
     RX_HEAD:begin
         if(m_axi_rx_tvalid)  next_state = RX_DATA;
         else next_state = RX_HEAD;   
     end        
     RX_DATA:begin
       if(m_axi_rx_tlast)  next_state = IDLE;
       else next_state = RX_DATA;
     end  
     RX_TRIGGER:begin
        next_state = IDLE;
     end        
     default: 
       next_state = IDLE;
  endcase
end

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q)begin
    gtx_rd_id <= 16'd0;
  end else begin
    if((current_state == RX_GTXID) && m_axi_rx_tvalid) begin
      gtx_rd_id <= m_axi_rx_tdata;
    end
    else begin
      gtx_rd_id <= gtx_rd_id;
    end
  end
end


always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q)begin
    store_length <= 8'd0;
  end else begin
    if((current_state == RX_HEAD) && m_axi_rx_tvalid) begin
      store_length <= m_axi_rx_tdata[7:0];
      store_head <= m_axi_rx_tdata[15:8];
      //packet_data_head <= m_axi_rx_tdata;
    end
    else begin
      store_length <= store_length;
      store_head <= store_head;
      //packet_data_head <= packet_data_head;
    end
  end
end

always @(posedge log_clk or posedge log_rst_q) begin
 if(log_rst_q)begin
    packet_data_head <= 8'd0;
 end else begin
   if((current_state == RX_DATA) && m_axi_rx_tvalid)begin 
     if((store_length == 8'd1)&&(store_head == 0)&&(rec_data_num == 1'b0)) packet_data_head <= m_axi_rx_tdata;
     else if((store_length != 8'd1)&&(store_head != 0)) packet_data_head <= {store_head,store_length};
     else packet_data_head <= packet_data_head;
   end
 end
end

wire[7:0]  rec_data_tcnt;

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) rec_data_num <= 8'd0;
  else begin
    if((m_axi_rx_tvalid)&&(current_state == RX_DATA))  rec_data_num <= rec_data_num + 1'b1;
    else if(current_state == IDLE) rec_data_num <= 0;
    else rec_data_num <= rec_data_num;
  end
end

assign rec_data_tcnt = (m_axi_rx_tvalid)?(rec_data_num+1'b1):rec_data_num;


always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) packet_data_wr_temp <= 1'b0;
  else if((current_state == RX_GTXID)||(current_state == RX_HEAD)||((current_state == RX_DATA)&&(rec_data_tcnt < store_length)))packet_data_wr_temp <= 1'b1;
  else packet_data_wr_temp <= 1'b0;
end

assign packet_data_wr = packet_data_wr_temp & m_axi_rx_tvalid;
//reg[7:0] rd_addr_temp;

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) packet_data_addr <= 8'd0;
  else if(current_state == RX_GTXID) packet_data_addr <= 8'd0;
  else if((current_state == RX_HEAD) && m_axi_rx_tvalid) begin
     if(m_axi_rx_tdata[15:0] ==1) packet_data_addr <= 0;
     else begin
       if(m_axi_rx_tdata[15:8]==0) packet_data_addr <= m_axi_rx_tdata[15:8] + 1'b1;
       else packet_data_addr <= m_axi_rx_tdata[15:8]; 
     end
  end
  else if((current_state == RX_DATA) && m_axi_rx_tvalid) begin 
     if(store_head == 0) packet_data_addr <=  store_head + rec_data_tcnt+1'b1;
     else packet_data_addr <=  store_head + rec_data_tcnt;
  end
  else packet_data_addr <= packet_data_addr;
end







/**********************************CRC_CHECK***********************************************/
always @(posedge log_clk) begin
  if(rec_data_num == store_length) crc_rddata <= m_axi_rx_tdata;
  //else if(rec_data_num == (store_length+1'b1) && m_axi_rx_tvalid) crc_rddata[15:0] <= m_axi_rx_tdata;
  else crc_rddata <= crc_rddata;
end

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q)begin
    crc_data <= 32'hffffffff;
  end else begin
    if(((current_state == RX_GTXID)||(current_state == RX_HEAD)||((current_state == RX_DATA)&&(rec_data_num<store_length))) && m_axi_rx_tvalid) crc_data <= nextCRC32_D32(m_axi_rx_tdata,crc_data);
    else if(current_state == IDLE) crc_data <= 32'hffffffff;
    else crc_data <= crc_data;
  end  
end  

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) gtp_rx_done <= 1'b0;
  else if((crc_data == crc_rddata)&&(rec_data_tcnt == (store_length+2'd2))&&(m_axi_rx_tdata == 32'hffbd)) gtp_rx_done <= 1'b1;
  else gtp_rx_done <= 1'b0;
end

always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) gtx_id_error <= 1'b0;
  else if((crc_data == crc_rddata)&&(rec_data_tcnt == (store_length+2'd2))&&(m_axi_rx_tdata == 32'hffbd)&&(gtx_rd_id != gtx_id)) gtx_id_error <= 1'b1;
  else gtx_id_error <= gtx_id_error;
end


always @(posedge log_clk or posedge log_rst_q) begin
  if(log_rst_q) gtp_rx_trigger <= 1'b0;
  //else if((current_state == RX_TRIGGER)&&(m_axi_rx_tdata == 32'hffbb)) gtp_rx_trigger <= 1'b1;
  else if((current_state == RX_TRIGGER)) gtp_rx_trigger <= 1'b1;
  else gtp_rx_trigger <= 1'b0;
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
ila_0 ila_0_inst (
  .clk                      (log_clk           ), // input wire clk                 
                  
  .probe0                   (m_axi_rx_tdata        ), 
  .probe1                   (packet_data_wr         ), 
  .probe2                   (m_axi_rx_tlast         ),
  .probe3                   (m_axi_rx_tvalid),
  .probe4                   (packet_data_addr),
  .probe5                   (rec_data_tcnt),
  .probe6                   (current_state)
);*/

    
endmodule
