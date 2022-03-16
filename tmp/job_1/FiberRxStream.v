// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : FiberRxStream


`define fsm_enumDefinition_binary_sequential_type [1:0]
`define fsm_enumDefinition_binary_sequential_fsm_BOOT 2'b00
`define fsm_enumDefinition_binary_sequential_fsm_IDLE 2'b01
`define fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE 2'b10


module FiberRxStream (
  input               input_valid,
  output              input_ready,
  input               input_payload_last,
  input      [31:0]   input_payload_fragment,
  output              output_0_valid,
  input               output_0_ready,
  output     [7:0]    output_0_payload,
  output              output_1_valid,
  input               output_1_ready,
  output     [7:0]    output_1_payload,
  input               clk,
  input               reset
);
  reg        [4:0]    rec_cnt;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateReg;
  reg        `fsm_enumDefinition_binary_sequential_type fsm_stateNext;
  wire                input_fire;
  wire                input_fire_1;
  `ifndef SYNTHESIS
  reg [127:0] fsm_stateReg_string;
  reg [127:0] fsm_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateReg_string = "fsm_BOOT        ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateReg_string = "fsm_IDLE        ";
      `fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE : fsm_stateReg_string = "fsm_DATA_RECIEVE";
      default : fsm_stateReg_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_binary_sequential_fsm_BOOT : fsm_stateNext_string = "fsm_BOOT        ";
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : fsm_stateNext_string = "fsm_IDLE        ";
      `fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE : fsm_stateNext_string = "fsm_DATA_RECIEVE";
      default : fsm_stateNext_string = "????????????????";
    endcase
  end
  `endif

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
      end
      `fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign output_0_valid = ((input_valid && (5'h0 <= rec_cnt)) && (rec_cnt < 5'h05));
  assign output_0_payload = input_payload_fragment[7:0];
  assign output_1_valid = ((input_valid && (5'h05 <= rec_cnt)) && (rec_cnt < 5'h0a));
  assign output_1_payload = input_payload_fragment[7:0];
  assign input_ready = 1'b1;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
        if(input_fire) begin
          fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE;
        end
      end
      `fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE : begin
        if(input_fire_1) begin
          if(input_payload_last) begin
            fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end
  end

  assign input_fire = (input_valid && input_ready);
  assign input_fire_1 = (input_valid && input_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rec_cnt <= 5'h0;
      fsm_stateReg <= `fsm_enumDefinition_binary_sequential_fsm_BOOT;
    end else begin
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_binary_sequential_fsm_IDLE : begin
          if(input_fire) begin
            rec_cnt <= (rec_cnt + 5'h01);
          end else begin
            rec_cnt <= 5'h0;
          end
        end
        `fsm_enumDefinition_binary_sequential_fsm_DATA_RECIEVE : begin
          if(input_fire_1) begin
            rec_cnt <= (rec_cnt + 5'h01);
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule
