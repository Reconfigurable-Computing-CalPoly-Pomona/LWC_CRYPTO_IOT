module ConstantParam(
  input          clock,
  input  [3:0]   io_i,
  input  [3:0]   io_a,
  input  [3:0]   io_b,
  input          io_EN_IN,
  input  [319:0] io_inCR,
  output [319:0] io_outCR
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] x2c; // @[ConstantParam.scala 24:14]
  wire [3:0] _T_2 = io_i + io_a; // @[ConstantParam.scala 26:11]
  wire [3:0] _T_4 = _T_2 - io_b; // @[ConstantParam.scala 26:18]
  reg [7:0] outReg; // @[ConstantParam.scala 28:17]
  wire [7:0] r = {{4'd0}, _T_4}; // @[ConstantParam.scala 23:13 ConstantParam.scala 26:3]
  wire [7:0] _T_6 = x2c ^ 8'hf0; // @[ConstantParam.scala 31:38]
  wire [7:0] _T_8 = x2c ^ 8'he1; // @[ConstantParam.scala 32:41]
  wire [7:0] _T_10 = x2c ^ 8'hd2; // @[ConstantParam.scala 33:41]
  wire [7:0] _T_12 = x2c ^ 8'hc3; // @[ConstantParam.scala 34:41]
  wire [7:0] _T_14 = x2c ^ 8'hb4; // @[ConstantParam.scala 35:41]
  wire [7:0] _T_16 = x2c ^ 8'ha5; // @[ConstantParam.scala 36:41]
  wire [7:0] _T_18 = x2c ^ 8'h96; // @[ConstantParam.scala 37:41]
  wire [7:0] _T_20 = x2c ^ 8'h87; // @[ConstantParam.scala 38:41]
  wire [7:0] _T_22 = x2c ^ 8'h78; // @[ConstantParam.scala 39:41]
  wire [7:0] _T_24 = x2c ^ 8'h69; // @[ConstantParam.scala 40:41]
  wire [7:0] _T_26 = x2c ^ 8'h5a; // @[ConstantParam.scala 41:42]
  wire [7:0] _T_28 = x2c ^ 8'h4b; // @[ConstantParam.scala 42:42]
  wire [7:0] _GEN_0 = r == 8'hb ? _T_28 : 8'h0; // @[ConstantParam.scala 42:26 ConstantParam.scala 42:35 ConstantParam.scala 43:23]
  wire [7:0] _GEN_1 = r == 8'ha ? _T_26 : _GEN_0; // @[ConstantParam.scala 41:26 ConstantParam.scala 41:35]
  wire [7:0] _GEN_2 = r == 8'h9 ? _T_24 : _GEN_1; // @[ConstantParam.scala 40:25 ConstantParam.scala 40:34]
  wire [7:0] _GEN_3 = r == 8'h8 ? _T_22 : _GEN_2; // @[ConstantParam.scala 39:25 ConstantParam.scala 39:34]
  wire [7:0] _GEN_4 = r == 8'h7 ? _T_20 : _GEN_3; // @[ConstantParam.scala 38:25 ConstantParam.scala 38:34]
  wire [7:0] _GEN_5 = r == 8'h6 ? _T_18 : _GEN_4; // @[ConstantParam.scala 37:25 ConstantParam.scala 37:34]
  wire [7:0] _GEN_6 = r == 8'h5 ? _T_16 : _GEN_5; // @[ConstantParam.scala 36:25 ConstantParam.scala 36:34]
  wire [7:0] _GEN_7 = r == 8'h4 ? _T_14 : _GEN_6; // @[ConstantParam.scala 35:25 ConstantParam.scala 35:34]
  wire [7:0] _GEN_8 = r == 8'h3 ? _T_12 : _GEN_7; // @[ConstantParam.scala 34:25 ConstantParam.scala 34:34]
  wire [183:0] hi_hi = io_inCR[319:136]; // @[ConstantParam.scala 46:24]
  wire [127:0] lo = io_inCR[127:0]; // @[ConstantParam.scala 46:48]
  wire [191:0] hi = {hi_hi,outReg}; // @[Cat.scala 30:58]
  assign io_outCR = {hi,lo}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    x2c <= io_inCR[135:128]; // @[ConstantParam.scala 25:5]
    if (io_EN_IN) begin // @[ConstantParam.scala 30:1]
      if (r == 8'h0) begin // @[ConstantParam.scala 31:22]
        outReg <= _T_6; // @[ConstantParam.scala 31:31]
      end else if (r == 8'h1) begin // @[ConstantParam.scala 32:25]
        outReg <= _T_8; // @[ConstantParam.scala 32:34]
      end else if (r == 8'h2) begin // @[ConstantParam.scala 33:25]
        outReg <= _T_10; // @[ConstantParam.scala 33:34]
      end else begin
        outReg <= _GEN_8;
      end
    end
  end
// Register and memory initialization
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
  _RAND_0 = {1{`RANDOM}};
  x2c = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  outReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  wire [63:0] x0 = io_EN_IN ? io_S[319:256] : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 45:6]
  wire [63:0] x4 = io_EN_IN ? io_S[63:0] : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 41:6]
  wire [63:0] _T_5 = x0 ^ x4; // @[SBoxHW.scala 47:17]
  wire [63:0] x3 = io_EN_IN ? io_S[127:64] : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 42:6]
  wire [63:0] _T_6 = x4 ^ x3; // @[SBoxHW.scala 48:17]
  wire [63:0] x2 = io_EN_IN ? io_S[191:128] : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 43:6]
  wire [63:0] x1 = io_EN_IN ? io_S[255:192] : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 44:6]
  wire [63:0] _T_7 = x2 ^ x1; // @[SBoxHW.scala 49:17]
  wire [63:0] _T_8 = ~x1; // @[SBoxHW.scala 51:26]
  wire [63:0] step1x2 = io_EN_IN ? _T_7 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 49:11]
  wire [63:0] _T_9 = _T_8 & step1x2; // @[SBoxHW.scala 51:30]
  wire [63:0] step1x0 = io_EN_IN ? _T_5 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 47:11]
  wire [63:0] _T_10 = step1x0 ^ _T_9; // @[SBoxHW.scala 51:22]
  wire [63:0] _T_11 = ~x3; // @[SBoxHW.scala 52:26]
  wire [63:0] step1x4 = io_EN_IN ? _T_6 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 48:11]
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
  wire [63:0] step2x1 = io_EN_IN ? _T_19 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 54:11]
  wire [63:0] step2x0 = io_EN_IN ? _T_10 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 51:11]
  wire [63:0] _T_23 = step2x1 ^ step2x0; // @[SBoxHW.scala 57:20]
  wire [63:0] step2x3 = io_EN_IN ? _T_22 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 55:11]
  wire [63:0] step2x2 = io_EN_IN ? _T_13 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 52:11]
  wire [63:0] _T_24 = step2x3 ^ step2x2; // @[SBoxHW.scala 58:20]
  wire [63:0] step2x4 = io_EN_IN ? _T_16 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 53:11]
  wire [63:0] _T_25 = step2x0 ^ step2x4; // @[SBoxHW.scala 59:20]
  wire [63:0] _T_26 = ~step2x2; // @[SBoxHW.scala 60:12]
  wire [63:0] outx3 = io_EN_IN ? _T_24 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 58:9]
  wire [63:0] outx4 = io_EN_IN ? step2x4 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 61:9]
  wire [63:0] outx0 = io_EN_IN ? _T_25 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 59:9]
  wire [63:0] outx1 = io_EN_IN ? _T_23 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 57:9]
  wire [63:0] outx2 = io_EN_IN ? _T_26 : 64'h0; // @[SBoxHW.scala 39:3 SBoxHW.scala 60:9]
  wire [319:0] _T_27 = {outx0,outx1,outx2,outx3,outx4}; // @[Cat.scala 30:58]
  assign io_Sout = outReg; // @[SBoxHW.scala 67:11]
  always @(posedge clock) begin
    if (reset) begin // @[SBoxHW.scala 13:23]
      outReg <= 320'h0; // @[SBoxHW.scala 13:23]
    end else if (io_EN_IN) begin // @[SBoxHW.scala 39:3]
      outReg <= _T_27; // @[SBoxHW.scala 63:10]
    end
  end
// Register and memory initialization
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
endmodule
module LP(
  input          clock,
  input          reset,
  input  [319:0] io_S,
  input          io_EN_IN,
  output [319:0] io_SPrime
);
`ifdef RANDOMIZE_REG_INIT
  reg [319:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [319:0] state; // @[LP.scala 14:22]
  wire [63:0] x0 = io_EN_IN ? io_S[319:256] : 64'h0; // @[LP.scala 29:3 LP.scala 35:8]
  wire [18:0] hi = x0[18:0]; // @[LP.scala 43:27]
  wire [44:0] lo = x0[63:19]; // @[LP.scala 43:37]
  wire [63:0] _T_5 = {hi,lo}; // @[Cat.scala 30:58]
  wire [63:0] _T_6 = x0 ^ _T_5; // @[LP.scala 43:19]
  wire [27:0] hi_1 = x0[27:0]; // @[LP.scala 43:55]
  wire [35:0] lo_1 = x0[63:28]; // @[LP.scala 43:65]
  wire [63:0] _T_7 = {hi_1,lo_1}; // @[Cat.scala 30:58]
  wire [63:0] hi_hi_hi = _T_6 ^ _T_7; // @[LP.scala 43:47]
  wire [63:0] x1 = io_EN_IN ? io_S[255:192] : 64'h0; // @[LP.scala 29:3 LP.scala 34:8]
  wire [60:0] hi_2 = x1[60:0]; // @[LP.scala 44:27]
  wire [2:0] lo_2 = x1[63:61]; // @[LP.scala 44:37]
  wire [63:0] _T_9 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _T_10 = x1 ^ _T_9; // @[LP.scala 44:19]
  wire [38:0] hi_3 = x1[38:0]; // @[LP.scala 44:55]
  wire [24:0] lo_3 = x1[63:39]; // @[LP.scala 44:66]
  wire [63:0] _T_11 = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire [63:0] hi_hi_lo = _T_10 ^ _T_11; // @[LP.scala 44:47]
  wire [63:0] x2 = io_EN_IN ? io_S[191:128] : 64'h0; // @[LP.scala 29:3 LP.scala 33:8]
  wire  hi_4 = x2[0]; // @[LP.scala 45:27]
  wire [62:0] lo_4 = x2[63:1]; // @[LP.scala 45:37]
  wire [63:0] _T_13 = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire [63:0] _T_14 = x2 ^ _T_13; // @[LP.scala 45:19]
  wire [5:0] hi_5 = x2[5:0]; // @[LP.scala 45:55]
  wire [57:0] lo_5 = x2[63:6]; // @[LP.scala 45:65]
  wire [63:0] _T_15 = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire [63:0] hi_lo = _T_14 ^ _T_15; // @[LP.scala 45:47]
  wire [63:0] x3 = io_EN_IN ? io_S[127:64] : 64'h0; // @[LP.scala 29:3 LP.scala 32:8]
  wire [9:0] hi_6 = x3[9:0]; // @[LP.scala 46:27]
  wire [53:0] lo_6 = x3[63:10]; // @[LP.scala 46:37]
  wire [63:0] _T_17 = {hi_6,lo_6}; // @[Cat.scala 30:58]
  wire [63:0] _T_18 = x3 ^ _T_17; // @[LP.scala 46:19]
  wire [16:0] hi_7 = x3[16:0]; // @[LP.scala 46:55]
  wire [46:0] lo_7 = x3[63:17]; // @[LP.scala 46:65]
  wire [63:0] _T_19 = {hi_7,lo_7}; // @[Cat.scala 30:58]
  wire [63:0] lo_hi = _T_18 ^ _T_19; // @[LP.scala 46:47]
  wire [63:0] x4 = io_EN_IN ? io_S[63:0] : 64'h0; // @[LP.scala 29:3 LP.scala 31:8]
  wire [6:0] hi_8 = x4[6:0]; // @[LP.scala 47:27]
  wire [56:0] lo_8 = x4[63:7]; // @[LP.scala 47:37]
  wire [63:0] _T_21 = {hi_8,lo_8}; // @[Cat.scala 30:58]
  wire [63:0] _T_22 = x4 ^ _T_21; // @[LP.scala 47:19]
  wire [40:0] hi_9 = x4[40:0]; // @[LP.scala 47:55]
  wire [22:0] lo_9 = x4[63:41]; // @[LP.scala 47:65]
  wire [63:0] _T_23 = {hi_9,lo_9}; // @[Cat.scala 30:58]
  wire [63:0] lo_lo = _T_22 ^ _T_23; // @[LP.scala 47:47]
  wire [319:0] _T_25 = {hi_hi_hi,hi_hi_lo,hi_lo,lo_hi,lo_lo}; // @[Cat.scala 30:58]
  assign io_SPrime = state; // @[LP.scala 51:13]
  always @(posedge clock) begin
    if (reset) begin // @[LP.scala 14:22]
      state <= 320'h0; // @[LP.scala 14:22]
    end else if (io_EN_IN) begin // @[LP.scala 29:3]
      state <= _T_25; // @[LP.scala 49:11]
    end
  end
// Register and memory initialization
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
  state = _RAND_0[319:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Permutation(
  input          clock,
  input          reset,
  input  [319:0] io_State,
  input  [3:0]   io_i,
  input  [3:0]   io_a,
  input  [3:0]   io_b,
  input          io_EN_IN,
  output [319:0] io_StateR
);
  wire  Pc_clock; // @[Permutation.scala 21:16]
  wire [3:0] Pc_io_i; // @[Permutation.scala 21:16]
  wire [3:0] Pc_io_a; // @[Permutation.scala 21:16]
  wire [3:0] Pc_io_b; // @[Permutation.scala 21:16]
  wire  Pc_io_EN_IN; // @[Permutation.scala 21:16]
  wire [319:0] Pc_io_inCR; // @[Permutation.scala 21:16]
  wire [319:0] Pc_io_outCR; // @[Permutation.scala 21:16]
  wire  Ps_clock; // @[Permutation.scala 30:16]
  wire  Ps_reset; // @[Permutation.scala 30:16]
  wire [319:0] Ps_io_S; // @[Permutation.scala 30:16]
  wire  Ps_io_EN_IN; // @[Permutation.scala 30:16]
  wire [319:0] Ps_io_Sout; // @[Permutation.scala 30:16]
  wire  Pl_clock; // @[Permutation.scala 36:16]
  wire  Pl_reset; // @[Permutation.scala 36:16]
  wire [319:0] Pl_io_S; // @[Permutation.scala 36:16]
  wire  Pl_io_EN_IN; // @[Permutation.scala 36:16]
  wire [319:0] Pl_io_SPrime; // @[Permutation.scala 36:16]
  ConstantParam Pc ( // @[Permutation.scala 21:16]
    .clock(Pc_clock),
    .io_i(Pc_io_i),
    .io_a(Pc_io_a),
    .io_b(Pc_io_b),
    .io_EN_IN(Pc_io_EN_IN),
    .io_inCR(Pc_io_inCR),
    .io_outCR(Pc_io_outCR)
  );
  SBoxHW Ps ( // @[Permutation.scala 30:16]
    .clock(Ps_clock),
    .reset(Ps_reset),
    .io_S(Ps_io_S),
    .io_EN_IN(Ps_io_EN_IN),
    .io_Sout(Ps_io_Sout)
  );
  LP Pl ( // @[Permutation.scala 36:16]
    .clock(Pl_clock),
    .reset(Pl_reset),
    .io_S(Pl_io_S),
    .io_EN_IN(Pl_io_EN_IN),
    .io_SPrime(Pl_io_SPrime)
  );
  assign io_StateR = Pl_io_SPrime; // @[Permutation.scala 42:11]
  assign Pc_clock = clock;
  assign Pc_io_i = io_i; // @[Permutation.scala 23:9]
  assign Pc_io_a = io_a; // @[Permutation.scala 24:9]
  assign Pc_io_b = io_b; // @[Permutation.scala 25:9]
  assign Pc_io_EN_IN = io_EN_IN; // @[Permutation.scala 26:13]
  assign Pc_io_inCR = io_State; // @[Permutation.scala 27:12]
  assign Ps_clock = clock;
  assign Ps_reset = reset;
  assign Ps_io_S = Pc_io_outCR; // @[Permutation.scala 32:9]
  assign Ps_io_EN_IN = io_EN_IN; // @[Permutation.scala 33:13]
  assign Pl_clock = clock;
  assign Pl_reset = reset;
  assign Pl_io_S = Ps_io_Sout; // @[Permutation.scala 38:9]
  assign Pl_io_EN_IN = io_EN_IN; // @[Permutation.scala 39:13]
endmodule
