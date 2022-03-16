// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : StreamFragmentFork
// Git hash  : 1d7d59401b86b42deedb807f9591ae65cc74e9dc


`define StreamState_binary_sequential_type [0:0]
`define StreamState_binary_sequential_IDLE 1'b0
`define StreamState_binary_sequential_WAIT_1 1'b1


module StreamFragmentFork (
  input               input_valid,
  output reg          input_ready,
  input               input_payload_last,
  input      [7:0]    input_payload_fragment,
  output              output_0_valid,
  input               output_0_ready,
  output     [7:0]    output_0_payload,
  output              output_1_valid,
  input               output_1_ready,
  output     [7:0]    output_1_payload,
  output              output_2_valid,
  input               output_2_ready,
  output     [7:0]    output_2_payload,
  input               clk,
  input               reset
);
  reg                 linkEnable_0;
  reg                 linkEnable_1;
  reg                 linkEnable_2;
  reg        `StreamState_binary_sequential_type stateMachine_state;
  wire                input_fire;
  wire                when_StreamFragmentFork_l46;
  wire                when_StreamFragmentFork_l46_1;
  wire                when_StreamFragmentFork_l46_2;
  `ifndef SYNTHESIS
  reg [47:0] stateMachine_state_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(stateMachine_state)
      `StreamState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `StreamState_binary_sequential_WAIT_1 : stateMachine_state_string = "WAIT_1";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  assign input_fire = (input_valid && input_ready);
  always @(*) begin
    input_ready = 1'b1;
    if(when_StreamFragmentFork_l46) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_1) begin
      input_ready = 1'b0;
    end
    if(when_StreamFragmentFork_l46_2) begin
      input_ready = 1'b0;
    end
  end

  assign when_StreamFragmentFork_l46 = ((! output_0_ready) && linkEnable_0);
  assign when_StreamFragmentFork_l46_1 = ((! output_1_ready) && linkEnable_1);
  assign when_StreamFragmentFork_l46_2 = ((! output_2_ready) && linkEnable_2);
  assign output_0_valid = (input_valid && linkEnable_0);
  assign output_0_payload = input_payload_fragment;
  assign output_1_valid = (input_valid && linkEnable_1);
  assign output_1_payload = input_payload_fragment;
  assign output_2_valid = (input_valid && linkEnable_2);
  assign output_2_payload = input_payload_fragment;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      linkEnable_0 <= 1'b0;
      linkEnable_1 <= 1'b0;
      linkEnable_2 <= 1'b0;
      stateMachine_state <= `StreamState_binary_sequential_IDLE;
    end else begin
      case(stateMachine_state)
        `StreamState_binary_sequential_IDLE : begin
          if(input_fire) begin
            linkEnable_0 <= (input_payload_fragment == 8'h01);
            linkEnable_1 <= (input_payload_fragment == 8'h02);
            linkEnable_2 <= (input_payload_fragment == 8'h03);
            stateMachine_state <= `StreamState_binary_sequential_WAIT_1;
          end
        end
        default : begin
          if(input_payload_last) begin
            linkEnable_0 <= 1'b0;
            linkEnable_1 <= 1'b0;
            linkEnable_2 <= 1'b0;
            stateMachine_state <= `StreamState_binary_sequential_IDLE;
          end
        end
      endcase
    end
  end


endmodule
