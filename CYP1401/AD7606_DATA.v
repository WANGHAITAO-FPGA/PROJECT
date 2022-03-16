`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/18 14:11:58
// Design Name: 
// Module Name: AD7606_DATA
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
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ad7606 
//////////////////////////////////////////////////////////////////////////////////
module AD7606_DATA(
    (*keep = "true"*) input      wire        		clk,                  //50mhz
	(*keep = "true"*) input      wire             reset,
    (*keep = "true"*) input      wire             sample_en,

	(*keep = "true"*) input      wire[15:0] 		ad_data,            //ad7606 ???��????
	(*keep = "true"*) input      wire        		ad_busy,            //ad7606 ??����????
    (*keep = "true"*) input      wire        		first_data,         //ad7606 ??????????����????  
	(*keep = "true"*) output     wire[2:0] 		ad_os,              //ad7606 ?????����???????
	(*keep = "true"*) output     reg     		    ad_cs,              //ad7606 AD cs
	(*keep = "true"*) output     reg    	    	ad_rd,              //ad7606 AD data read
	(*keep = "true"*) output     reg 		        ad_reset,           //ad7606 AD reset
	(*keep = "true"*) output     reg     		    ad_convsta,         //ad7606 AD convert start
	(*keep = "true"*) output     reg     		    ad_convstb,         //ad7606 AD convert start	
	(*keep = "true"*) output     wire             ad_range,
	(*keep = "true"*) output     reg[15:0]        ad_ch1_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch2_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch3_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch4_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch5_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch6_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch7_o,
	(*keep = "true"*) output     reg[15:0]        ad_ch8_o,
	(*keep = "true"*) output     reg              ad_data_valid_o
);


reg [9:0] cnt;
reg [7:0] i;
reg [15:0] cnt5us;
reg [7:0] ad_state;

assign ad_os=3'b000;  //???????��
assign ad_range = 1'b1; //??10V???��?��????��??��

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

//ad????
always@(posedge clk_out)
begin        
  if(reset)   
      ad_reset<=1'b0;            
  if(cnt<10'h3ff)
  begin
      cnt<=cnt+1'b1;
      ad_reset<=1'b1;
  end
  else
      ad_reset<=1'b0;  //?????��??????ad_reset???????????��??     
end            
	
//?��?????��????
always@ (posedge clk_out)   //200k???��??
begin
  if(reset)
      cnt5us <= 16'd0;
  if((cnt5us < 16'd249)&&(cnt==10'h3ff))
      cnt5us <= cnt5us + 1'b1;
  else
      cnt5us <= 16'd0;
end

//��??????��
always @(posedge clk_out) 
begin
  if(reset)
  begin
      ad_cs<=1'b1;
      ad_rd<=1'b1; 
      ad_convsta<=1'b1;   
      ad_convstb<=1'b1;   
      i<=8'd0;   
      ad_ch1_o<=16'd0;
      ad_ch2_o<=16'd0;
      ad_ch3_o<=16'd0;
      ad_ch4_o<=16'd0;
      ad_ch5_o<=16'd0;
      ad_ch6_o<=16'd0;
      ad_ch7_o<=16'd0;
      ad_ch8_o<=16'd0;
      ad_data_valid_o <= 1'b0;
      ad_state<=8'd0; 
  end
  else if(ad_reset)
  begin
      ad_cs<=1'b1;
      ad_rd<=1'b1; 
      ad_convsta<=1'b1;   
      ad_convstb<=1'b1;   
      i<=8'd0;   
      ad_state<=8'd0; 
  end
  else        
  begin
    case(ad_state)
    8'd0: begin
        if(sample_en) ad_state <= 8'd1;
        else ad_state <= 8'd0;
    end
	8'd1: begin
        ad_cs<=1'b1;
        ad_rd<=1'b1; 
        ad_convsta<=1'b1;
        ad_convstb<=1'b1;
        ad_data_valid_o <= 1'b0;    
        ad_state <= 8'd2;
	end	  
	8'd2: begin
        if(i == 8'd5)            
        begin
            i<=8'd0;             
            ad_state<=8'd3;
        end
        else 
        begin    
            ad_state<=8'd2;      
            i<=i+1'b1;
        end
    end                
    8'd3: begin       
        if(i==8'd2)     
        begin                        //????2??lock??convstab????????��?????25ns?????????��???????��??
            i<=8'd0;             
            ad_convsta<=1'b1;
            ad_convstb<=1'b1;
            ad_state<=8'd4;                                          
        end
        else 
        begin
            i<=i+1'b1;
            ad_convsta<=1'b0;
            ad_convstb<=1'b0;                     //????AD��???
            ad_state<=8'd3;
        end
    end                
    8'd4: begin            
        if(i==8'd5) 
        begin                           //????5??clock, ????busy????????(tconv)
            i<=8'd0;
            ad_state<=8'd5;
        end
        else 
        begin
            i<=i+1'b1;
            ad_state<=8'd4;
        end
    end  
    8'd5: begin            
        if(!ad_busy) 
        begin                    //????busy????????  ??��??????��????????         
            ad_state<=8'd6;
        end
        else
            ad_state<=8'd5;
    end                 
    8'd6: begin 
        ad_cs<=1'b0;                              //cs???????��  ?��??????8?��???��??  
        ad_rd<=1'b0;                       
        ad_state<=8'd7;  
     end    
    8'd7: begin            
        ad_state<=8'd8;
    end
    8'd8: begin  
        if(first_data)                       
            ad_state<=8'd9;
        else
            ad_state<=8'd8;    
     end
    8'd9: begin
        if(i==8'd1)
        begin 
            ad_rd<=1'b1;
            ad_ch1_o<=ad_data;                        //??CH1               
            i<=8'd0;
            ad_state<=8'd10;                 
        end
        else 
        begin  
            i<=i+1'b1;
            ad_state<=8'd9; 
        end
    end
    8'd10: begin
        if(i==8'd1)
        begin
            ad_rd<=1'b0;              
            i<=8'd0;
            ad_state<=8'd11;                 
        end
        else 
        begin  
            i<=i+1'b1;
            ad_state<=8'd10; 
        end
    end      
    8'd11: begin 
        if(i==8'd1)
        begin
            ad_rd<=1'b1;
            ad_ch2_o<=ad_data;                        //??CH2
            i<=8'd0;
            ad_state<=8'd12;                 
        end
        else 
        begin
            i<=i+1'b1;
            ad_state<=8'd11;
        end
    end
    8'd12: begin 
        if(i==8'd1) 
         begin
             ad_rd<=1'b0;
             i<=8'd0;
             ad_state<=8'd13;                 
         end
         else 
         begin                           
             i<=i+1'b1;
             ad_state<=8'd12;  
         end
    end       
    8'd13: begin 
        if(i==8'd1)
        begin
            ad_rd<=1'b1;
            ad_ch3_o<=ad_data;                        //??CH3
            i<=8'd0;
            ad_state<=8'd14;                 
        end
        else 
        begin    
            i<=i+1'b1;
            ad_state<=8'd13;
        end
    end
    8'd14: begin 
        if(i==8'd1)
        begin
            ad_rd<=1'b0;
            i<=8'd0;
            ad_state<=8'd15;                 
        end
        else 
        begin                                 
            i<=i+1'b1;
            ad_state<=8'd14;
        end
    end 
    8'd15: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b1;
            ad_ch4_o<=ad_data;                        //??CH4
            i<=8'd0;
            ad_state<=8'd16;                 
        end
        else 
        begin
            i<=i+1'b1;
            ad_state<=8'd15;
        end
    end
    8'd16: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b0;
            i<=8'd0;
            ad_state<=8'd17;                 
        end
        else 
        begin                           
            i<=i+1'b1;
            ad_state<=8'd16; 
        end
    end   
    8'd17: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b1;
            ad_ch5_o<=ad_data;                        //??CH5
            i<=8'd0;
            ad_state<=8'd18;                 
        end
        else 
        begin
            i<=i+1'b1;
            ad_state<=8'd17;
        end
    end
    8'd18: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b0;
            i<=8'd0;
            ad_state<=8'd19;                 
        end
        else 
        begin                            
            i<=i+1'b1;
            ad_state<=8'd18; 
        end
    end   
    8'd19: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b1;
            ad_ch6_o<=ad_data;                        //??CH6
            i<=8'd0;
            ad_state<=8'd20;                 
        end
        else
        begin
            i<=i+1'b1;
            ad_state<=8'd19;
        end
    end
    8'd20: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b0;
            i<=8'd0;
            ad_state<=8'd21;                 
        end
        else
        begin                          
            i<=i+1'b1;
            ad_state<=8'd20;
        end
    end   
    8'd21: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b1;
            ad_ch7_o<=ad_data;                        //??CH7
            i<=8'd0;
            ad_state<=8'd22;                 
        end
        else
        begin
            i<=i+1'b1;
            ad_state<=8'd21;    
        end
    end
    8'd22: begin 
        if(i==8'd1) 
        begin 
            ad_rd<=1'b0;
            i<=8'd0;
            ad_state<=8'd23;                 
        end
        else
        begin                           
            i<=i+1'b1;
            ad_state<=8'd22;
        end
    end    
    8'd23: begin 
        if(i==8'd1) 
        begin
            ad_rd<=1'b1;
            ad_ch8_o<=ad_data;                        //??CH8
            i<=8'd0;
            ad_state<=8'd24;                 
        end
        else 
        begin
            i<=i+1'b1;
            ad_state<=8'd23;    
        end
    end
    8'd24: begin 
        if(i==8'd1) 
        begin
            ad_data_valid_o <= 1'b1;
            ad_rd<=1'b1;                                           
            i<=8'd0;
            ad_state<=8'd25;                 
        end
        else 
        begin                   
            i<=i+1'b1;
            ad_state<=8'd24;    
        end
    end
    8'd25: begin                                 //?��??????????idle��???
        ad_rd<=1'b1;     
        ad_cs<=1'b1;
        ad_data_valid_o <= 1'b0;
        if(cnt5us == 16'd249)                      
           ad_state<=8'h1;
        else
           ad_state<=8'd25;
    end  
    default:    ad_state<=8'd0;
    endcase    
    end               
end          
endmodule

