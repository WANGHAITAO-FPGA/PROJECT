`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/22 11:31:09
// Design Name: 
// Module Name: Xilinx_Bram
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
module Xilinx_Bram(
   input   wire        wr_clk,
   input   wire        wr_en,
   input   wire[7:0]   wr_addr,
   input   wire[31:0]  wr_data,
   input   wire        wr_rst,   
   
   input   wire        rd_clk,
   input   wire        rd_en,
   input   wire[7:0]   rd_addr,
   output  wire[31:0]  rd_data,
   input   wire        rd_rst
);    
    
BRAM_TDP_MACRO #(
     .BRAM_SIZE("36Kb"), // Target BRAM: "18Kb" or "36Kb" 
     .DEVICE("7SERIES"), // Target device: "7SERIES" 
     .DOA_REG(0),        // Optional port A output register (0 or 1)
     .DOB_REG(0),        // Optional port B output register (0 or 1)
     .INIT_A(),  // Initial values on port A output port
     .INIT_B(), // Initial values on port B output port
     .INIT_FILE ("NONE"),
     .READ_WIDTH_A (32),   // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
     .READ_WIDTH_B (32),   // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
     .SIM_COLLISION_CHECK ("ALL"), // Collision check enable "ALL", "WARNING_ONLY", 
                                   //   "GENERATE_X_ONLY" or "NONE" 
     .SRVAL_A(16'h0000), // Set/Reset value for port A output
     .SRVAL_B(16'h0000), // Set/Reset value for port B output
     .WRITE_MODE_A("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
     .WRITE_MODE_B("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
     .WRITE_WIDTH_A(32), // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
     .WRITE_WIDTH_B(32), // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
     .INIT_00(256'h00000)
) BRAM_TDP_MACRO_inst (
     .DOA(),       // Output port-A data, width defined by READ_WIDTH_A parameter
     .DOB(rd_data),       // Output port-B data, width defined by READ_WIDTH_B parameter
     .ADDRA(wr_addr),   // Input port-A address, width defined by Port A depth
     .ADDRB(rd_addr),   // Input port-B address, width defined by Port B depth
     .CLKA(wr_clk),     // 1-bit input port-A clock
     .CLKB(rd_clk),     // 1-bit input port-B clock
     .DIA(wr_data),  // Input port-A data, width defined by WRITE_WIDTH_A parameter
     .DIB(),       // Input port-B data, width defined by WRITE_WIDTH_B parameter
     .ENA(1'b1),       // 1-bit input port-A enable
     .ENB(rd_en),       // 1-bit input port-B enable
     .REGCEA(1'b1), // 1-bit input port-A output register enable
     .REGCEB(1'b1), // 1-bit input port-B output register enable
     .RSTA(wr_rst),     // 1-bit input port-A reset
     .RSTB(rd_rst),     // 1-bit input port-B reset
     .WEA({4{wr_en}}),       // Input port-A write enable, width defined by Port A depth
     .WEB(4'b0000)        // Input port-B write enable, width defined by Port B depth
);
    
endmodule
