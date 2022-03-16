// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : IoFilter
// Git hash  : 1d7d59401b86b42deedb807f9591ae65cc74e9dc



module IoFilter (
  input               io_in,
  output              io_out,
  input               clk,
  input               reset
);
  wire                io_in_buffercc_io_dataOut;
  reg        [0:0]    timer_counter;
  wire                timer_tick;
  wire                sampler_ioSync;
  wire                sampler_ioSamples_0;
  reg                 iosampleout;
  wire                when_IoFilter_l30;

  BufferCC io_in_buffercc (
    .io_dataIn     (io_in                      ), //i
    .io_dataOut    (io_in_buffercc_io_dataOut  ), //o
    .clk           (clk                        ), //i
    .reset         (reset                      )  //i
  );
  assign timer_tick = (timer_counter == 1'b0);
  assign sampler_ioSync = io_in_buffercc_io_dataOut;
  assign sampler_ioSamples_0 = sampler_ioSync;
  assign when_IoFilter_l30 = (sampler_ioSamples_0 != iosampleout);
  assign io_out = iosampleout;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      timer_counter <= 1'b0;
      iosampleout <= 1'b1;
    end else begin
      timer_counter <= (timer_counter - 1'b1);
      if(timer_tick) begin
        timer_counter <= 1'b1;
      end
      if(timer_tick) begin
        if(when_IoFilter_l30) begin
          iosampleout <= sampler_ioSamples_0;
        end
      end
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
