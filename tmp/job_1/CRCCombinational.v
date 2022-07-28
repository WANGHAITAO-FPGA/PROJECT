// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : CRCCombinational
// Git hash  : 7b19f4fe54d68aa8d3eaabd67f2c036bf7e647b0

`timescale 1ns/1ps 

module CRCCombinational (
  input               io_cmd_valid,
  input      [0:0]    io_cmd_payload_mode,
  input      [37:0]   io_cmd_payload_data,
  output     [4:0]    io_crc,
  output     [4:0]    io_nextcrc,
  input               clk,
  input               reset
);
  localparam CRCCombinationalCmdMode_INIT = 1'd0;
  localparam CRCCombinationalCmdMode_UPDATE = 1'd1;

  reg        [4:0]    crc_reg;
  reg        [4:0]    next_crc;
  wire                when_CRCCombinational_l88;
  wire                when_CRCCombinational_l93;
  reg        [4:0]    result_reflected;
  `ifndef SYNTHESIS
  reg [47:0] io_cmd_payload_mode_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CRCCombinationalCmdMode_INIT : io_cmd_payload_mode_string = "INIT  ";
      CRCCombinationalCmdMode_UPDATE : io_cmd_payload_mode_string = "UPDATE";
      default : io_cmd_payload_mode_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    next_crc[0] = (((io_cmd_payload_data[0] ^ io_cmd_payload_data[2]) ^ crc_reg[2]) ^ crc_reg[3]);
    next_crc[1] = ((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[1]) ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ crc_reg[0]) ^ crc_reg[2]) ^ crc_reg[4]);
    next_crc[2] = ((((((io_cmd_payload_data[1] ^ io_cmd_payload_data[2]) ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]);
    next_crc[3] = ((((((io_cmd_payload_data[0] ^ io_cmd_payload_data[3]) ^ io_cmd_payload_data[4]) ^ crc_reg[0]) ^ crc_reg[1]) ^ crc_reg[3]) ^ crc_reg[4]);
    next_crc[4] = ((((io_cmd_payload_data[1] ^ io_cmd_payload_data[4]) ^ crc_reg[1]) ^ crc_reg[2]) ^ crc_reg[4]);
  end

  assign when_CRCCombinational_l88 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_INIT));
  assign when_CRCCombinational_l93 = (io_cmd_valid && (io_cmd_payload_mode == CRCCombinationalCmdMode_UPDATE));
  always @(*) begin
    result_reflected[0] = crc_reg[4];
    result_reflected[1] = crc_reg[3];
    result_reflected[2] = crc_reg[2];
    result_reflected[3] = crc_reg[1];
    result_reflected[4] = crc_reg[0];
  end

  assign io_crc = (result_reflected ^ 5'h1f);
  assign io_nextcrc = next_crc;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      crc_reg <= 5'h1f;
    end else begin
      if(when_CRCCombinational_l88) begin
        crc_reg <= 5'h1f;
      end
      if(when_CRCCombinational_l93) begin
        crc_reg <= next_crc;
      end
    end
  end


endmodule
