module SBoxHW(
  input          clock,
  input          reset,
  input  [319:0] io_S,
  input          io_EN_IN,
  output [319:0] io_Sout
);
`ifdef RANDOMIZE_REG_INIT
  reg [319:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [319:0] outReg; // @[SBoxHW.scala 13:23]
  wire [63:0] x0 = io_EN_IN ? io_S[319:256] : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] x4 = io_EN_IN ? io_S[63:0] : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_5 = x0 ^ x4; // @[SBoxHW.scala 47:17]
  wire [63:0] x3 = io_EN_IN ? io_S[127:64] : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_6 = x4 ^ x3; // @[SBoxHW.scala 48:17]
  wire [63:0] x2 = io_EN_IN ? io_S[191:128] : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] x1 = io_EN_IN ? io_S[255:192] : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_7 = x2 ^ x1; // @[SBoxHW.scala 49:17]
  wire [63:0] _T_8 = ~x1; // @[SBoxHW.scala 51:26]
  wire [63:0] step1x2 = io_EN_IN ? _T_7 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_9 = _T_8 & step1x2; // @[SBoxHW.scala 51:30]
  wire [63:0] step1x0 = io_EN_IN ? _T_5 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_10 = step1x0 ^ _T_9; // @[SBoxHW.scala 51:22]
  wire [63:0] _T_11 = ~x3; // @[SBoxHW.scala 52:26]
  wire [63:0] step1x4 = io_EN_IN ? _T_6 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_12 = _T_11 & step1x4; // @[SBoxHW.scala 52:30]
  wire [63:0] _T_13 = step1x2 ^ _T_12; // @[SBoxHW.scala 52:22]
  wire [63:0] _T_14 = ~step1x0; // @[SBoxHW.scala 53:26]
  wire [63:0] _T_15 = _T_14 & x1; // @[SBoxHW.scala 53:35]
  wire [63:0] _T_16 = step1x4 ^ _T_15; // @[SBoxHW.scala 53:22]
  wire [63:0] _T_17 = ~step1x2; // @[SBoxHW.scala 54:23]
  wire [63:0] _T_18 = _T_17 & x3; // @[SBoxHW.scala 54:32]
  wire [63:0] _T_19 = x1 ^ _T_18; // @[SBoxHW.scala 54:19]
  wire [63:0] _T_20 = ~step1x4; // @[SBoxHW.scala 55:23]
  wire [63:0] _T_21 = _T_20 & step1x0; // @[SBoxHW.scala 55:32]
  wire [63:0] _T_22 = x3 ^ _T_21; // @[SBoxHW.scala 55:19]
  wire [63:0] step2x1 = io_EN_IN ? _T_19 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] step2x0 = io_EN_IN ? _T_10 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_23 = step2x1 ^ step2x0; // @[SBoxHW.scala 57:20]
  wire [63:0] step2x3 = io_EN_IN ? _T_22 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] step2x2 = io_EN_IN ? _T_13 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_24 = step2x3 ^ step2x2; // @[SBoxHW.scala 58:20]
  wire [63:0] step2x4 = io_EN_IN ? _T_16 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] _T_25 = step2x0 ^ step2x4; // @[SBoxHW.scala 59:20]
  wire [63:0] _T_26 = ~step2x2; // @[SBoxHW.scala 60:12]
  wire [63:0] outx3 = io_EN_IN ? _T_24 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] outx4 = io_EN_IN ? step2x4 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] outx0 = io_EN_IN ? _T_25 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] outx1 = io_EN_IN ? _T_23 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [63:0] outx2 = io_EN_IN ? _T_26 : 64'h0; // @[SBoxHW.scala 39:3]
  wire [319:0] _T_30 = {outx0,outx1,outx2,outx3,outx4}; // @[Cat.scala 29:58]
  assign io_Sout = outReg; // @[SBoxHW.scala 67:11]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {10{`RANDOM}};
  outReg = _RAND_0[319:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      outReg <= 320'h0;
    end else if (io_EN_IN) begin
      outReg <= _T_30;
    end
  end
endmodule
