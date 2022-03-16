// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : DecodeRxStream


`define fsm_enumDefinition_binary_sequential_type [3:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 4'b0000
`define fsm_enumDefinition_binary_sequential_fsm_SlaveId 4'b0001
`define fsm_enumDefinition_binary_sequential_fsm_FunctionCode 4'b0010
`define fsm_enumDefinition_binary_sequential_fsm_GetAddress 4'b0011
`define fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData 4'b0100
`define fsm_enumDefinition_binary_sequential_fsm_GetDataLength 4'b0101
`define fsm_enumDefinition_binary_sequential_fsm_WriteMultiData 4'b0110
`define fsm_enumDefinition_binary_sequential_fsm_GetCRC 4'b0111
`define fsm_enumDefinition_binary_sequential_fsm_End 4'b1000


module DecodeRxStream (
  input               input_valid,
  output              input_ready,
  input      [7:0]    input_payload,
  output              output_valid,
  input               output_ready,
  output     [7:0]    output_payload,
  input               clk,
  input               reset
);
  wire       [7:0]    _zz_when_FiberRxStream_l125;
  reg        [7:0]    rec_cnt;
  reg        [7:0]    length;
  reg                 valid;
  reg        [7:0]    functioncode;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [7:0]    input_payload_regNext;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                when_FiberRxStream_l64;
  wire                when_FiberRxStream_l75;
  wire                when_FiberRxStream_l87;
  wire                when_FiberRxStream_l89;
  wire                when_FiberRxStream_l102;
  wire                when_FiberRxStream_l113;
  wire                when_FiberRxStream_l125;
  wire                when_FiberRxStream_l136;
  `ifndef SYNTHESIS
  reg [215:0] fsm_stateReg_string;
  reg [215:0] fsm_stateNext_string;
  `endif


  assign _zz_when_FiberRxStream_l125 = (length - 8'h01);
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT                   ";
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : fsm_stateReg_string = "fsm_SlaveId                ";
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : fsm_stateReg_string = "fsm_FunctionCode           ";
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : fsm_stateReg_string = "fsm_GetAddress             ";
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : fsm_stateReg_string = "fsm_ReadLength_WriteOneData";
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : fsm_stateReg_string = "fsm_GetDataLength          ";
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : fsm_stateReg_string = "fsm_WriteMultiData         ";
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : fsm_stateReg_string = "fsm_GetCRC                 ";
      `fsm_enumDefinition_binary_sequential_fsm_End : fsm_stateReg_string = "fsm_End                    ";
      default : fsm_stateReg_string = "???????????????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT                   ";
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : fsm_stateNext_string = "fsm_SlaveId                ";
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : fsm_stateNext_string = "fsm_FunctionCode           ";
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : fsm_stateNext_string = "fsm_GetAddress             ";
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : fsm_stateNext_string = "fsm_ReadLength_WriteOneData";
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : fsm_stateNext_string = "fsm_GetDataLength          ";
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : fsm_stateNext_string = "fsm_WriteMultiData         ";
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : fsm_stateNext_string = "fsm_GetCRC                 ";
      `fsm_enumDefinition_binary_sequential_fsm_End : fsm_stateNext_string = "fsm_End                    ";
      default : fsm_stateNext_string = "???????????????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign input_ready = 1'b1;
  assign output_valid = ((input_valid && valid) && output_ready);
  assign output_payload = input_payload_regNext;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
        if(when_FiberRxStream_l64) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_FunctionCode;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
        if(when_FiberRxStream_l75) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetAddress;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SlaveId;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
        if(input_valid) begin
          if(when_FiberRxStream_l87) begin
            if(when_FiberRxStream_l89) begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData;
            end else begin
              fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetDataLength;
            end
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l102) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetCRC;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
        if(input_valid) begin
          if(when_FiberRxStream_l113) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
        if(input_valid) begin
          if(when_FiberRxStream_l125) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_GetCRC;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
        if(input_valid) begin
          if(when_FiberRxStream_l136) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_End;
          end
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
        fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SlaveId;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_SlaveId;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign when_FiberRxStream_l64 = (input_valid && (input_payload == 8'h01));
  assign when_FiberRxStream_l75 = (input_valid && (((input_payload == 8'h03) || (input_payload == 8'h06)) || (input_payload == 8'h10)));
  assign when_FiberRxStream_l87 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l89 = ((functioncode == 8'h03) || (functioncode == 8'h06));
  assign when_FiberRxStream_l102 = (8'h01 <= rec_cnt);
  assign when_FiberRxStream_l113 = (rec_cnt == 8'h02);
  assign when_FiberRxStream_l125 = (rec_cnt == _zz_when_FiberRxStream_l125);
  assign when_FiberRxStream_l136 = (8'h01 <= rec_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 8'h0;
      length <= 8'h0;
      valid <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
          if(when_FiberRxStream_l64) begin
            valid <= 1'b1;
          end else begin
            valid <= 1'b0;
            rec_cnt <= 8'h0;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
        end
        `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l87) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l102) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l113) begin
              rec_cnt <= 8'h0;
              length <= input_payload;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l125) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
          if(input_valid) begin
            rec_cnt <= (rec_cnt + 8'h01);
            if(when_FiberRxStream_l136) begin
              rec_cnt <= 8'h0;
            end
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_End : begin
          valid <= 1'b0;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    input_payload_regNext <= input_payload;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_SlaveId : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_FunctionCode : begin
        if(when_FiberRxStream_l75) begin
          functioncode <= input_payload;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetAddress : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_ReadLength_WriteOneData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetDataLength : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_WriteMultiData : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_GetCRC : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_End : begin
      end
      default : begin
      end
    endcase
  end


endmodule
