// Generator : SpinalHDL v1.7.1    git head : 0444bb76ab1d6e19f0ec46bc03c4769776deb7d5
// Component : Srio_Swrite
// Git hash  : 5672a5f4ba624f2a63ed18011c0fe85ac8b31a06

`timescale 1ns/1ps

module Srio_Swrite (
  output              s_axis_ireq_tvalid,
  input               s_axis_ireq_tready,
  output              s_axis_ireq_tlast,
  output     [63:0]   s_axis_ireq_tdata,
  output     [7:0]    s_axis_ireq_tkeep,
  output     [31:0]   s_axis_ireq_tuser,
  input               m_axis_iresp_tvalid,
  output              m_axis_iresp_tready,
  input               m_axis_iresp_tlast,
  input      [63:0]   m_axis_iresp_tdata,
  input      [7:0]    m_axis_iresp_tkeep,
  input      [31:0]   m_axis_iresp_tuser,
  input      [31:0]   postion,
  input      [31:0]   speed,
  input      [31:0]   kp,
  input      [31:0]   ki,
  input      [31:0]   kd,
  input      [37:0]   endatPostion,
  input               endatIndex,
  input               InPlace,
  input               tick,
  input               clk,
  input               reset
);
  localparam SrioFtype_NREAD = 4'd2;
  localparam SrioFtype_NWRITE = 4'd5;
  localparam SrioFtype_SWRITE = 4'd6;
  localparam SrioFtype_DOORB = 4'd10;
  localparam SrioFtype_MESSG = 4'd11;
  localparam SrioFtype_RESP = 4'd13;
  localparam SrioFtype_FTYPE9 = 4'd9;
  localparam SrioTtype_TNWR = 4'd4;
  localparam SrioTtype_TNWR_R = 4'd5;
  localparam SrioTtype_TNDATA = 4'd0;
  localparam SrioTtype_TWDATA = 4'd8;
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_Wait_Start = 2'd1;
  localparam fsm_enumDef_Send_Data = 2'd2;
  localparam fsm_enumDef_End_1 = 2'd3;

  wire       [7:0]    intiator_usercmd_user_tid;
  wire                intiator_iresp_stream_ready;
  wire                intiator_s_axis_ireq_tvalid;
  wire                intiator_s_axis_ireq_tlast;
  wire       [63:0]   intiator_s_axis_ireq_tdata;
  wire       [7:0]    intiator_s_axis_ireq_tkeep;
  wire       [31:0]   intiator_s_axis_ireq_tuser;
  wire                intiator_m_axis_iresp_tready;
  wire                intiator_usercmd_user_data_ready;
  wire                intiator_iresp_stream_valid;
  wire       [63:0]   intiator_iresp_stream_payload;
  wire       [63:0]   intiator_reg_simplebus_RDATA;
  wire                streamfifo_2_io_push_ready;
  wire                streamfifo_2_io_pop_valid;
  wire       [63:0]   streamfifo_2_io_pop_payload;
  wire       [6:0]    streamfifo_2_io_occupancy;
  wire       [6:0]    streamfifo_2_io_availability;
  reg        [7:0]    tcnt;
  reg                 RENABLE;
  reg        [8:0]    RADDR;
  reg        [63:0]   RDATA;
  reg        [8:0]    send_length;
  reg                 start;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 RENABLE_regNext;
  wire                intiator_intiator_req_stream_fire;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_Srio_Swrite_l149;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  Intitaor intiator (
    .s_axis_ireq_tvalid        (intiator_s_axis_ireq_tvalid        ), //o
    .s_axis_ireq_tready        (streamfifo_2_io_push_ready         ), //i
    .s_axis_ireq_tlast         (intiator_s_axis_ireq_tlast         ), //o
    .s_axis_ireq_tdata         (intiator_s_axis_ireq_tdata[63:0]   ), //o
    .s_axis_ireq_tkeep         (intiator_s_axis_ireq_tkeep[7:0]    ), //o
    .s_axis_ireq_tuser         (intiator_s_axis_ireq_tuser[31:0]   ), //o
    .m_axis_iresp_tvalid       (m_axis_iresp_tvalid                ), //i
    .m_axis_iresp_tready       (intiator_m_axis_iresp_tready       ), //o
    .m_axis_iresp_tlast        (m_axis_iresp_tlast                 ), //i
    .m_axis_iresp_tdata        (m_axis_iresp_tdata[63:0]           ), //i
    .m_axis_iresp_tkeep        (m_axis_iresp_tkeep[7:0]            ), //i
    .m_axis_iresp_tuser        (m_axis_iresp_tuser[31:0]           ), //i
    .usercmd_user_addr         (34'h0                              ), //i
    .usercmd_user_ftype        (SrioFtype_SWRITE                   ), //i
    .usercmd_user_ttype        (SrioTtype_TNDATA                   ), //i
    .usercmd_user_size         (8'hff                              ), //i
    .usercmd_user_prio         (2'b00                              ), //i
    .usercmd_user_tid          (intiator_usercmd_user_tid[7:0]     ), //i
    .usercmd_user_data_valid   (RENABLE_regNext                    ), //i
    .usercmd_user_data_ready   (intiator_usercmd_user_data_ready   ), //o
    .usercmd_user_data_payload (intiator_reg_simplebus_RDATA[63:0] ), //i
    .send_start                (start                              ), //i
    .iresp_stream_valid        (intiator_iresp_stream_valid        ), //o
    .iresp_stream_ready        (intiator_iresp_stream_ready        ), //i
    .iresp_stream_payload      (intiator_iresp_stream_payload[63:0]), //o
    .clk                       (clk                                ), //i
    .reset                     (reset                              )  //i
  );
  Yw_Intiator_Regif intiator_reg (
    .simplebus_RADDR   (RADDR[8:0]                        ), //i
    .simplebus_RDATA   (intiator_reg_simplebus_RDATA[63:0]), //o
    .simplebus_RENABLE (RENABLE                           ), //i
    .simplebus_WADDR   (9'h0                              ), //i
    .simplebus_WDATA   (64'h0                             ), //i
    .simplebus_WENABLE (1'b0                              ), //i
    .postion           (postion[31:0]                     ), //i
    .speed             (speed[31:0]                       ), //i
    .kp                (kp[31:0]                          ), //i
    .ki                (ki[31:0]                          ), //i
    .kd                (kd[31:0]                          ), //i
    .endatPostion      (endatPostion[37:0]                ), //i
    .endatIndex        (endatIndex                        ), //i
    .InPlace           (InPlace                           ), //i
    .clk               (clk                               ), //i
    .reset             (reset                             )  //i
  );
  StreamFifo streamfifo_2 (
    .io_push_valid   (intiator_s_axis_ireq_tvalid      ), //i
    .io_push_ready   (streamfifo_2_io_push_ready       ), //o
    .io_push_payload (intiator_s_axis_ireq_tdata[63:0] ), //i
    .io_pop_valid    (streamfifo_2_io_pop_valid        ), //o
    .io_pop_ready    (s_axis_ireq_tready               ), //i
    .io_pop_payload  (streamfifo_2_io_pop_payload[63:0]), //o
    .io_flush        (1'b0                             ), //i
    .io_occupancy    (streamfifo_2_io_occupancy[6:0]   ), //o
    .io_availability (streamfifo_2_io_availability[6:0]), //o
    .clk             (clk                              ), //i
    .reset           (reset                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateReg_string = "Wait_Start";
      fsm_enumDef_Send_Data : fsm_stateReg_string = "Send_Data ";
      fsm_enumDef_End_1 : fsm_stateReg_string = "End_1     ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_Wait_Start : fsm_stateNext_string = "Wait_Start";
      fsm_enumDef_Send_Data : fsm_stateNext_string = "Send_Data ";
      fsm_enumDef_End_1 : fsm_stateNext_string = "End_1     ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign s_axis_ireq_tkeep = intiator_s_axis_ireq_tkeep;
  assign s_axis_ireq_tuser = intiator_s_axis_ireq_tuser;
  assign m_axis_iresp_tready = intiator_m_axis_iresp_tready;
  assign intiator_usercmd_user_tid = tcnt;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
      end
      fsm_enumDef_Send_Data : begin
      end
      fsm_enumDef_End_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign s_axis_ireq_tdata = streamfifo_2_io_pop_payload;
  assign s_axis_ireq_tvalid = streamfifo_2_io_pop_valid;
  assign intiator_intiator_req_stream_fire = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign s_axis_ireq_tlast = ((streamfifo_2_io_occupancy == 7'h01) && intiator_intiator_req_stream_fire);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_Wait_Start : begin
        if(tick) begin
          fsm_stateNext = fsm_enumDef_Send_Data;
        end
      end
      fsm_enumDef_Send_Data : begin
        if(when_Srio_Swrite_l149) begin
          fsm_stateNext = fsm_enumDef_End_1;
        end
      end
      fsm_enumDef_End_1 : begin
        fsm_stateNext = fsm_enumDef_Wait_Start;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_Wait_Start;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_Srio_Swrite_l149 = (send_length == 9'h01f);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      tcnt <= 8'h0;
      RENABLE <= 1'b0;
      RADDR <= 9'h0;
      send_length <= 9'h0;
      start <= 1'b0;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      start <= 1'b0;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_Wait_Start : begin
          if(tick) begin
            tcnt <= (tcnt + 8'h01);
            RADDR <= 9'h0;
            RENABLE <= 1'b1;
            send_length <= 9'h0;
          end
        end
        fsm_enumDef_Send_Data : begin
          RADDR <= (RADDR + 9'h008);
          send_length <= (send_length + 9'h001);
          if(when_Srio_Swrite_l149) begin
            RENABLE <= 1'b0;
          end
        end
        fsm_enumDef_End_1 : begin
          send_length <= 9'h0;
          RENABLE <= 1'b0;
          start <= 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    RENABLE_regNext <= RENABLE;
  end


endmodule

//StreamFifo replaced by StreamFifo

module Yw_Intiator_Regif (
  input      [8:0]    simplebus_RADDR,
  output     [63:0]   simplebus_RDATA,
  input               simplebus_RENABLE,
  input      [8:0]    simplebus_WADDR,
  input      [63:0]   simplebus_WDATA,
  input               simplebus_WENABLE,
  input      [31:0]   postion,
  input      [31:0]   speed,
  input      [31:0]   kp,
  input      [31:0]   ki,
  input      [31:0]   kd,
  input      [37:0]   endatPostion,
  input               endatIndex,
  input               InPlace,
  input               clk,
  input               reset
);

  reg                 busslave_readError;
  reg        [63:0]   busslave_readData;
  wire                read_hit_0x0000;
  wire                write_hit_0x0000;
  wire       [31:0]   HEADER;
  wire                read_hit_0x0008;
  wire                write_hit_0x0008;
  wire       [31:0]   Version;
  wire                read_hit_0x0010;
  wire                write_hit_0x0010;
  wire       [31:0]   Postion_1;
  wire                read_hit_0x0018;
  wire                write_hit_0x0018;
  wire       [31:0]   Speed_1;
  wire                read_hit_0x0020;
  wire                write_hit_0x0020;
  wire       [31:0]   Kp_1;
  wire                read_hit_0x0028;
  wire                write_hit_0x0028;
  wire       [31:0]   Ki_1;
  wire                read_hit_0x0030;
  wire                write_hit_0x0030;
  wire       [31:0]   Kd_1;
  wire                read_hit_0x0038;
  wire                write_hit_0x0038;
  wire       [37:0]   EndatPostion_1;
  wire                read_hit_0x0040;
  wire                write_hit_0x0040;
  wire       [0:0]    EndatIndex_1;
  wire                read_hit_0x0048;
  wire                write_hit_0x0048;
  wire       [0:0]    InPlace_1;
  wire                read_hit_0x0050;
  wire                write_hit_0x0050;
  wire                read_hit_0x0058;
  wire                write_hit_0x0058;
  wire                read_hit_0x0060;
  wire                write_hit_0x0060;
  wire                read_hit_0x0068;
  wire                write_hit_0x0068;
  wire                read_hit_0x0070;
  wire                write_hit_0x0070;
  wire                read_hit_0x0078;
  wire                write_hit_0x0078;
  wire                read_hit_0x0080;
  wire                write_hit_0x0080;
  wire                read_hit_0x0088;
  wire                write_hit_0x0088;
  wire                read_hit_0x0090;
  wire                write_hit_0x0090;
  wire                read_hit_0x0098;
  wire                write_hit_0x0098;
  wire                read_hit_0x00a0;
  wire                write_hit_0x00a0;
  wire                read_hit_0x00a8;
  wire                write_hit_0x00a8;
  wire                read_hit_0x00b0;
  wire                write_hit_0x00b0;
  wire                read_hit_0x00b8;
  wire                write_hit_0x00b8;
  wire                read_hit_0x00c0;
  wire                write_hit_0x00c0;
  wire                read_hit_0x00c8;
  wire                write_hit_0x00c8;
  wire                read_hit_0x00d0;
  wire                write_hit_0x00d0;
  wire                read_hit_0x00d8;
  wire                write_hit_0x00d8;
  wire                read_hit_0x00e0;
  wire                write_hit_0x00e0;
  wire                read_hit_0x00e8;
  wire                write_hit_0x00e8;
  wire                read_hit_0x00f0;
  wire                write_hit_0x00f0;
  wire                read_hit_0x00f8;
  wire                write_hit_0x00f8;

  assign simplebus_RDATA = busslave_readData;
  assign read_hit_0x0000 = ((simplebus_RADDR == 9'h0) && simplebus_RENABLE);
  assign write_hit_0x0000 = ((simplebus_WADDR == 9'h0) && simplebus_WENABLE);
  assign HEADER = 32'h00f1f2f3;
  assign read_hit_0x0008 = ((simplebus_RADDR == 9'h008) && simplebus_RENABLE);
  assign write_hit_0x0008 = ((simplebus_WADDR == 9'h008) && simplebus_WENABLE);
  assign Version = 32'h07e60a11;
  assign read_hit_0x0010 = ((simplebus_RADDR == 9'h010) && simplebus_RENABLE);
  assign write_hit_0x0010 = ((simplebus_WADDR == 9'h010) && simplebus_WENABLE);
  assign Postion_1 = postion;
  assign read_hit_0x0018 = ((simplebus_RADDR == 9'h018) && simplebus_RENABLE);
  assign write_hit_0x0018 = ((simplebus_WADDR == 9'h018) && simplebus_WENABLE);
  assign Speed_1 = speed;
  assign read_hit_0x0020 = ((simplebus_RADDR == 9'h020) && simplebus_RENABLE);
  assign write_hit_0x0020 = ((simplebus_WADDR == 9'h020) && simplebus_WENABLE);
  assign Kp_1 = kp;
  assign read_hit_0x0028 = ((simplebus_RADDR == 9'h028) && simplebus_RENABLE);
  assign write_hit_0x0028 = ((simplebus_WADDR == 9'h028) && simplebus_WENABLE);
  assign Ki_1 = ki;
  assign read_hit_0x0030 = ((simplebus_RADDR == 9'h030) && simplebus_RENABLE);
  assign write_hit_0x0030 = ((simplebus_WADDR == 9'h030) && simplebus_WENABLE);
  assign Kd_1 = kd;
  assign read_hit_0x0038 = ((simplebus_RADDR == 9'h038) && simplebus_RENABLE);
  assign write_hit_0x0038 = ((simplebus_WADDR == 9'h038) && simplebus_WENABLE);
  assign EndatPostion_1 = endatPostion;
  assign read_hit_0x0040 = ((simplebus_RADDR == 9'h040) && simplebus_RENABLE);
  assign write_hit_0x0040 = ((simplebus_WADDR == 9'h040) && simplebus_WENABLE);
  assign EndatIndex_1 = endatIndex;
  assign read_hit_0x0048 = ((simplebus_RADDR == 9'h048) && simplebus_RENABLE);
  assign write_hit_0x0048 = ((simplebus_WADDR == 9'h048) && simplebus_WENABLE);
  assign InPlace_1 = InPlace;
  assign read_hit_0x0050 = ((simplebus_RADDR == 9'h050) && simplebus_RENABLE);
  assign write_hit_0x0050 = ((simplebus_WADDR == 9'h050) && simplebus_WENABLE);
  assign read_hit_0x0058 = ((simplebus_RADDR == 9'h058) && simplebus_RENABLE);
  assign write_hit_0x0058 = ((simplebus_WADDR == 9'h058) && simplebus_WENABLE);
  assign read_hit_0x0060 = ((simplebus_RADDR == 9'h060) && simplebus_RENABLE);
  assign write_hit_0x0060 = ((simplebus_WADDR == 9'h060) && simplebus_WENABLE);
  assign read_hit_0x0068 = ((simplebus_RADDR == 9'h068) && simplebus_RENABLE);
  assign write_hit_0x0068 = ((simplebus_WADDR == 9'h068) && simplebus_WENABLE);
  assign read_hit_0x0070 = ((simplebus_RADDR == 9'h070) && simplebus_RENABLE);
  assign write_hit_0x0070 = ((simplebus_WADDR == 9'h070) && simplebus_WENABLE);
  assign read_hit_0x0078 = ((simplebus_RADDR == 9'h078) && simplebus_RENABLE);
  assign write_hit_0x0078 = ((simplebus_WADDR == 9'h078) && simplebus_WENABLE);
  assign read_hit_0x0080 = ((simplebus_RADDR == 9'h080) && simplebus_RENABLE);
  assign write_hit_0x0080 = ((simplebus_WADDR == 9'h080) && simplebus_WENABLE);
  assign read_hit_0x0088 = ((simplebus_RADDR == 9'h088) && simplebus_RENABLE);
  assign write_hit_0x0088 = ((simplebus_WADDR == 9'h088) && simplebus_WENABLE);
  assign read_hit_0x0090 = ((simplebus_RADDR == 9'h090) && simplebus_RENABLE);
  assign write_hit_0x0090 = ((simplebus_WADDR == 9'h090) && simplebus_WENABLE);
  assign read_hit_0x0098 = ((simplebus_RADDR == 9'h098) && simplebus_RENABLE);
  assign write_hit_0x0098 = ((simplebus_WADDR == 9'h098) && simplebus_WENABLE);
  assign read_hit_0x00a0 = ((simplebus_RADDR == 9'h0a0) && simplebus_RENABLE);
  assign write_hit_0x00a0 = ((simplebus_WADDR == 9'h0a0) && simplebus_WENABLE);
  assign read_hit_0x00a8 = ((simplebus_RADDR == 9'h0a8) && simplebus_RENABLE);
  assign write_hit_0x00a8 = ((simplebus_WADDR == 9'h0a8) && simplebus_WENABLE);
  assign read_hit_0x00b0 = ((simplebus_RADDR == 9'h0b0) && simplebus_RENABLE);
  assign write_hit_0x00b0 = ((simplebus_WADDR == 9'h0b0) && simplebus_WENABLE);
  assign read_hit_0x00b8 = ((simplebus_RADDR == 9'h0b8) && simplebus_RENABLE);
  assign write_hit_0x00b8 = ((simplebus_WADDR == 9'h0b8) && simplebus_WENABLE);
  assign read_hit_0x00c0 = ((simplebus_RADDR == 9'h0c0) && simplebus_RENABLE);
  assign write_hit_0x00c0 = ((simplebus_WADDR == 9'h0c0) && simplebus_WENABLE);
  assign read_hit_0x00c8 = ((simplebus_RADDR == 9'h0c8) && simplebus_RENABLE);
  assign write_hit_0x00c8 = ((simplebus_WADDR == 9'h0c8) && simplebus_WENABLE);
  assign read_hit_0x00d0 = ((simplebus_RADDR == 9'h0d0) && simplebus_RENABLE);
  assign write_hit_0x00d0 = ((simplebus_WADDR == 9'h0d0) && simplebus_WENABLE);
  assign read_hit_0x00d8 = ((simplebus_RADDR == 9'h0d8) && simplebus_RENABLE);
  assign write_hit_0x00d8 = ((simplebus_WADDR == 9'h0d8) && simplebus_WENABLE);
  assign read_hit_0x00e0 = ((simplebus_RADDR == 9'h0e0) && simplebus_RENABLE);
  assign write_hit_0x00e0 = ((simplebus_WADDR == 9'h0e0) && simplebus_WENABLE);
  assign read_hit_0x00e8 = ((simplebus_RADDR == 9'h0e8) && simplebus_RENABLE);
  assign write_hit_0x00e8 = ((simplebus_WADDR == 9'h0e8) && simplebus_WENABLE);
  assign read_hit_0x00f0 = ((simplebus_RADDR == 9'h0f0) && simplebus_RENABLE);
  assign write_hit_0x00f0 = ((simplebus_WADDR == 9'h0f0) && simplebus_WENABLE);
  assign read_hit_0x00f8 = ((simplebus_RADDR == 9'h0f8) && simplebus_RENABLE);
  assign write_hit_0x00f8 = ((simplebus_WADDR == 9'h0f8) && simplebus_WENABLE);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busslave_readError <= 1'b0;
      busslave_readData <= 64'h0;
    end else begin
      if(simplebus_RENABLE) begin
        case(simplebus_RADDR)
          9'h0 : begin
            busslave_readData <= {32'h0,HEADER};
            busslave_readError <= 1'b0;
          end
          9'h008 : begin
            busslave_readData <= {32'h0,Version};
            busslave_readError <= 1'b0;
          end
          9'h010 : begin
            busslave_readData <= {32'h0,Postion_1};
            busslave_readError <= 1'b0;
          end
          9'h018 : begin
            busslave_readData <= {32'h0,Speed_1};
            busslave_readError <= 1'b0;
          end
          9'h020 : begin
            busslave_readData <= {32'h0,Kp_1};
            busslave_readError <= 1'b0;
          end
          9'h028 : begin
            busslave_readData <= {32'h0,Ki_1};
            busslave_readError <= 1'b0;
          end
          9'h030 : begin
            busslave_readData <= {32'h0,Kd_1};
            busslave_readError <= 1'b0;
          end
          9'h038 : begin
            busslave_readData <= {26'h0,EndatPostion_1};
            busslave_readError <= 1'b0;
          end
          9'h040 : begin
            busslave_readData <= {63'h0,EndatIndex_1};
            busslave_readError <= 1'b0;
          end
          9'h048 : begin
            busslave_readData <= {63'h0,InPlace_1};
            busslave_readError <= 1'b0;
          end
          9'h050 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h058 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h060 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h068 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h070 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h078 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h080 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h088 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h090 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h098 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0a0 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0a8 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0b0 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0b8 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0c0 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0c8 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0d0 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0d8 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0e0 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0e8 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0f0 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          9'h0f8 : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b0;
          end
          default : begin
            busslave_readData <= 64'h0;
            busslave_readError <= 1'b1;
          end
        endcase
      end
    end
  end


endmodule

module Intitaor (
  output              s_axis_ireq_tvalid,
  input               s_axis_ireq_tready,
  output              s_axis_ireq_tlast,
  output     [63:0]   s_axis_ireq_tdata,
  output     [7:0]    s_axis_ireq_tkeep,
  output     [31:0]   s_axis_ireq_tuser,
  input               m_axis_iresp_tvalid,
  output              m_axis_iresp_tready,
  input               m_axis_iresp_tlast,
  input      [63:0]   m_axis_iresp_tdata,
  input      [7:0]    m_axis_iresp_tkeep,
  input      [31:0]   m_axis_iresp_tuser,
  input      [33:0]   usercmd_user_addr,
  input      [3:0]    usercmd_user_ftype,
  input      [3:0]    usercmd_user_ttype,
  input      [7:0]    usercmd_user_size,
  input      [1:0]    usercmd_user_prio,
  input      [7:0]    usercmd_user_tid,
  input               usercmd_user_data_valid,
  output              usercmd_user_data_ready,
  input      [63:0]   usercmd_user_data_payload,
  input               send_start,
  output              iresp_stream_valid,
  input               iresp_stream_ready,
  output     [63:0]   iresp_stream_payload,
  input               clk,
  input               reset
);
  localparam SrioFtype_NREAD = 4'd2;
  localparam SrioFtype_NWRITE = 4'd5;
  localparam SrioFtype_SWRITE = 4'd6;
  localparam SrioFtype_DOORB = 4'd10;
  localparam SrioFtype_MESSG = 4'd11;
  localparam SrioFtype_RESP = 4'd13;
  localparam SrioFtype_FTYPE9 = 4'd9;
  localparam SrioTtype_TNWR = 4'd4;
  localparam SrioTtype_TNWR_R = 4'd5;
  localparam SrioTtype_TNDATA = 4'd0;
  localparam SrioTtype_TWDATA = 4'd8;
  localparam srio_ftype_NREAD = 4'd2;
  localparam srio_ftype_NWRITE = 4'd5;
  localparam srio_ftype_SWRITE = 4'd6;
  localparam srio_ftype_DOORB = 4'd10;
  localparam srio_ftype_MESSG = 4'd11;
  localparam srio_ftype_RESP = 4'd13;
  localparam srio_ftype_FTYPE9 = 4'd9;
  localparam srio_ttype_TNWR = 4'd4;
  localparam srio_ttype_TNWR_R = 4'd5;
  localparam srio_ttype_TNDATA = 4'd0;
  localparam srio_ttype_TWDATA = 4'd8;

  wire                streamfifo_2_io_push_ready;
  wire                streamfifo_2_io_pop_valid;
  wire       [63:0]   streamfifo_2_io_pop_payload;
  wire       [6:0]    streamfifo_2_io_occupancy;
  wire       [6:0]    streamfifo_2_io_availability;
  wire       [5:0]    _zz_when_Intitaor_l47;
  wire       [4:0]    _zz_when_Intitaor_l47_1;
  wire       [3:0]    _zz_request_autocheck_error;
  wire       [3:0]    _zz_request_autocheck_error_1;
  wire       [63:0]   header_beat;
  reg        [5:0]    current_beat_cnt;
  wire                intiator_intiator_req_stream_fire;
  wire                when_Intitaor_l33;
  wire                intiator_intiator_req_stream_fire_1;
  wire       [4:0]    number_of_data_beats;
  reg                 ireq_tlast;
  wire                when_Intitaor_l45;
  wire                intiator_intiator_req_stream_fire_2;
  wire                intiator_intiator_req_stream_fire_3;
  wire                when_Intitaor_l47;
  wire                when_Intitaor_l49;
  wire                when_Intitaor_l51;
  reg        [63:0]   ireq_tdata;
  wire                intiator_intiator_req_stream_fire_4;
  wire                when_Intitaor_l59;
  reg                 user_data_ready;
  reg                 ireq_tvalid;
  reg                 send_start_d;
  wire                intiator_intiator_req_stream_fire_5;
  wire                when_Intitaor_l69;
  wire                when_Intitaor_l72;
  wire       [63:0]   write_queue_data_d;
  reg        [63:0]   write_queue_data;
  reg                 expecting_a_response;
  wire                intiator_intiator_req_stream_fire_6;
  wire                when_Intitaor_l87;
  reg        [63:0]   read_queue_data;
  wire       [7:0]    expected_tid;
  wire       [3:0]    expected_ftype;
  wire       [7:0]    expected_size;
  reg                 compare_received;
  wire                intiator_intiator_resp_stream_fire;
  wire                when_Intitaor_l102;
  wire                intiator_intiator_resp_stream_fire_1;
  reg                 request_autocheck_error;
  wire                intiator_intiator_resp_stream_fire_2;
  wire                when_Intitaor_l111;
  reg                 iresp_tready;
  wire                intiator_intiator_resp_stream_fire_3;
  wire                when_Intitaor_l121;
  reg                 nread_iresp_write;
  wire                intiator_intiator_resp_stream_fire_4;
  wire                when_Intitaor_l129;
  wire                intiator_intiator_resp_stream_fire_5;
  wire                when_Intitaor_l131;
  wire                intiator_intiator_resp_stream_fire_6;
  `ifndef SYNTHESIS
  reg [47:0] usercmd_user_ftype_string;
  reg [47:0] usercmd_user_ttype_string;
  `endif


  assign _zz_when_Intitaor_l47_1 = number_of_data_beats;
  assign _zz_when_Intitaor_l47 = {1'd0, _zz_when_Intitaor_l47_1};
  assign _zz_request_autocheck_error = srio_ftype_NREAD;
  assign _zz_request_autocheck_error_1 = srio_ttype_TWDATA;
  StreamFifo streamfifo_2 (
    .io_push_valid   (usercmd_user_data_valid          ), //i
    .io_push_ready   (streamfifo_2_io_push_ready       ), //o
    .io_push_payload (usercmd_user_data_payload[63:0]  ), //i
    .io_pop_valid    (streamfifo_2_io_pop_valid        ), //o
    .io_pop_ready    (user_data_ready                  ), //i
    .io_pop_payload  (streamfifo_2_io_pop_payload[63:0]), //o
    .io_flush        (1'b0                             ), //i
    .io_occupancy    (streamfifo_2_io_occupancy[6:0]   ), //o
    .io_availability (streamfifo_2_io_availability[6:0]), //o
    .clk             (clk                              ), //i
    .reset           (reset                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(usercmd_user_ftype)
      SrioFtype_NREAD : usercmd_user_ftype_string = "NREAD ";
      SrioFtype_NWRITE : usercmd_user_ftype_string = "NWRITE";
      SrioFtype_SWRITE : usercmd_user_ftype_string = "SWRITE";
      SrioFtype_DOORB : usercmd_user_ftype_string = "DOORB ";
      SrioFtype_MESSG : usercmd_user_ftype_string = "MESSG ";
      SrioFtype_RESP : usercmd_user_ftype_string = "RESP  ";
      SrioFtype_FTYPE9 : usercmd_user_ftype_string = "FTYPE9";
      default : usercmd_user_ftype_string = "??????";
    endcase
  end
  always @(*) begin
    case(usercmd_user_ttype)
      SrioTtype_TNWR : usercmd_user_ttype_string = "TNWR  ";
      SrioTtype_TNWR_R : usercmd_user_ttype_string = "TNWR_R";
      SrioTtype_TNDATA : usercmd_user_ttype_string = "TNDATA";
      SrioTtype_TWDATA : usercmd_user_ttype_string = "TWDATA";
      default : usercmd_user_ttype_string = "??????";
    endcase
  end
  `endif

  assign s_axis_ireq_tkeep = 8'hff;
  assign s_axis_ireq_tuser = 32'h00ff00dd;
  assign usercmd_user_data_ready = streamfifo_2_io_push_ready;
  assign header_beat = {{{{{{{{usercmd_user_tid,usercmd_user_ftype},usercmd_user_ttype},1'b0},usercmd_user_prio},1'b0},usercmd_user_size},2'b00},usercmd_user_addr};
  assign intiator_intiator_req_stream_fire = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l33 = (intiator_intiator_req_stream_fire && s_axis_ireq_tlast);
  assign intiator_intiator_req_stream_fire_1 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign number_of_data_beats = usercmd_user_size[7 : 3];
  assign when_Intitaor_l45 = (((usercmd_user_ftype == SrioFtype_NREAD) || (usercmd_user_ftype == SrioFtype_DOORB)) && (current_beat_cnt == 6'h0));
  assign intiator_intiator_req_stream_fire_2 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign intiator_intiator_req_stream_fire_3 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l47 = ((current_beat_cnt == _zz_when_Intitaor_l47) && intiator_intiator_req_stream_fire_3);
  assign when_Intitaor_l49 = (! s_axis_ireq_tready);
  assign when_Intitaor_l51 = (s_axis_ireq_tready || (! s_axis_ireq_tvalid));
  assign s_axis_ireq_tlast = ireq_tlast;
  assign intiator_intiator_req_stream_fire_4 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l59 = ((current_beat_cnt == 6'h0) && (! intiator_intiator_req_stream_fire_4));
  assign s_axis_ireq_tdata = ireq_tdata;
  assign intiator_intiator_req_stream_fire_5 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l69 = (intiator_intiator_req_stream_fire_5 && s_axis_ireq_tlast);
  assign when_Intitaor_l72 = (send_start && (! send_start_d));
  assign s_axis_ireq_tvalid = ireq_tvalid;
  assign write_queue_data_d = {{{44'h0,usercmd_user_tid},usercmd_user_ftype},usercmd_user_size};
  assign intiator_intiator_req_stream_fire_6 = (s_axis_ireq_tvalid && s_axis_ireq_tready);
  assign when_Intitaor_l87 = ((current_beat_cnt == 6'h0) && intiator_intiator_req_stream_fire_6);
  assign expected_tid = read_queue_data[19 : 12];
  assign expected_ftype = read_queue_data[11 : 8];
  assign expected_size = read_queue_data[7 : 0];
  assign intiator_intiator_resp_stream_fire = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l102 = (intiator_intiator_resp_stream_fire && m_axis_iresp_tlast);
  assign intiator_intiator_resp_stream_fire_1 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign intiator_intiator_resp_stream_fire_2 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l111 = (compare_received && intiator_intiator_resp_stream_fire_2);
  assign intiator_intiator_resp_stream_fire_3 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l121 = (intiator_intiator_resp_stream_fire_3 && m_axis_iresp_tlast);
  assign m_axis_iresp_tready = iresp_tready;
  assign intiator_intiator_resp_stream_fire_4 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l129 = ((compare_received && (expected_ftype == srio_ftype_NREAD)) && intiator_intiator_resp_stream_fire_4);
  assign intiator_intiator_resp_stream_fire_5 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign when_Intitaor_l131 = (intiator_intiator_resp_stream_fire_5 && m_axis_iresp_tlast);
  assign iresp_stream_payload = m_axis_iresp_tdata;
  assign intiator_intiator_resp_stream_fire_6 = (m_axis_iresp_tvalid && m_axis_iresp_tready);
  assign iresp_stream_valid = (nread_iresp_write && intiator_intiator_resp_stream_fire_6);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      current_beat_cnt <= 6'h0;
      ireq_tlast <= 1'b0;
      user_data_ready <= 1'b0;
      ireq_tvalid <= 1'b0;
      send_start_d <= 1'b0;
      expecting_a_response <= 1'b0;
      compare_received <= 1'b1;
      request_autocheck_error <= 1'b0;
      iresp_tready <= 1'b0;
      nread_iresp_write <= 1'b0;
    end else begin
      if(when_Intitaor_l33) begin
        current_beat_cnt <= 6'h0;
      end else begin
        if(intiator_intiator_req_stream_fire_1) begin
          current_beat_cnt <= (current_beat_cnt + 6'h01);
        end else begin
          current_beat_cnt <= current_beat_cnt;
        end
      end
      if(when_Intitaor_l45) begin
        ireq_tlast <= (! (intiator_intiator_req_stream_fire_2 && s_axis_ireq_tlast));
      end else begin
        if(when_Intitaor_l47) begin
          ireq_tlast <= (! ireq_tlast);
        end else begin
          if(when_Intitaor_l49) begin
            ireq_tlast <= ireq_tlast;
          end else begin
            if(when_Intitaor_l51) begin
              ireq_tlast <= 1'b0;
            end else begin
              ireq_tlast <= ireq_tlast;
            end
          end
        end
      end
      send_start_d <= send_start;
      if(when_Intitaor_l69) begin
        ireq_tvalid <= 1'b0;
        user_data_ready <= 1'b0;
      end else begin
        if(when_Intitaor_l72) begin
          ireq_tvalid <= 1'b1;
          user_data_ready <= 1'b1;
        end else begin
          ireq_tvalid <= ireq_tvalid;
          user_data_ready <= user_data_ready;
        end
      end
      if(when_Intitaor_l87) begin
        expecting_a_response <= ((((usercmd_user_ftype == SrioFtype_NREAD) || (usercmd_user_ftype == SrioFtype_DOORB)) || ((usercmd_user_ftype == SrioFtype_NWRITE) && (usercmd_user_ttype == SrioTtype_TNWR_R))) || (usercmd_user_ftype == SrioFtype_MESSG));
      end else begin
        expecting_a_response <= 1'b0;
      end
      if(when_Intitaor_l102) begin
        compare_received <= 1'b1;
      end else begin
        if(intiator_intiator_resp_stream_fire_1) begin
          compare_received <= 1'b0;
        end else begin
          compare_received <= compare_received;
        end
      end
      if(when_Intitaor_l111) begin
        request_autocheck_error <= ((((expected_tid != m_axis_iresp_tdata[63 : 56]) || ((expected_ftype == _zz_request_autocheck_error) && (m_axis_iresp_tdata[51 : 48] != _zz_request_autocheck_error_1))) || ((expected_ftype == srio_ftype_NWRITE) && (m_axis_iresp_tdata[51 : 48] != srio_ttype_TNDATA))) || ((expected_ftype == srio_ftype_DOORB) && (m_axis_iresp_tdata[51 : 48] != srio_ttype_TNDATA)));
      end else begin
        request_autocheck_error <= 1'b0;
      end
      if(when_Intitaor_l121) begin
        iresp_tready <= 1'b0;
      end else begin
        iresp_tready <= 1'b1;
      end
      if(when_Intitaor_l129) begin
        nread_iresp_write <= 1'b1;
      end else begin
        if(when_Intitaor_l131) begin
          nread_iresp_write <= 1'b0;
        end else begin
          nread_iresp_write <= nread_iresp_write;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(when_Intitaor_l59) begin
      ireq_tdata <= header_beat;
    end else begin
      ireq_tdata <= streamfifo_2_io_pop_payload;
    end
    write_queue_data <= write_queue_data_d;
    if(expecting_a_response) begin
      read_queue_data <= write_queue_data;
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  input               io_flush,
  output     [6:0]    io_occupancy,
  output     [6:0]    io_availability,
  input               clk,
  input               reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [5:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [5:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [5:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [5:0]    logic_pushPtr_valueNext;
  reg        [5:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [5:0]    logic_popPtr_valueNext;
  reg        [5:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l1078;
  wire       [5:0]    logic_ptrDif;
  reg [63:0] logic_ram [0:63];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {5'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {5'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 6'h3f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 6'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 6'h3f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 6'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1078 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 6'h0;
      logic_popPtr_value <= 6'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1078) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule
