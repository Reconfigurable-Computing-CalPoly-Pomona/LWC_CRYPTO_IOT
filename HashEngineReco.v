module ConstantParam(
  input  [3:0]   io_i,
  input  [3:0]   io_b,
  input  [319:0] io_inCR,
  output [319:0] io_outCR
);
  wire [3:0] _T_2 = io_i + 4'hc; // @[ConstantParam.scala 26:11]
  wire [3:0] _T_4 = _T_2 - io_b; // @[ConstantParam.scala 26:18]
  wire [7:0] r = {{4'd0}, _T_4}; // @[ConstantParam.scala 23:13 ConstantParam.scala 26:3]
  wire [7:0] x2c = io_inCR[135:128]; // @[ConstantParam.scala 24:15 ConstantParam.scala 25:5]
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
  wire [7:0] _GEN_9 = r == 8'h2 ? _T_10 : _GEN_8; // @[ConstantParam.scala 33:25 ConstantParam.scala 33:34]
  wire [7:0] _GEN_10 = r == 8'h1 ? _T_8 : _GEN_9; // @[ConstantParam.scala 32:25 ConstantParam.scala 32:34]
  wire [7:0] outReg = r == 8'h0 ? _T_6 : _GEN_10; // @[ConstantParam.scala 31:22 ConstantParam.scala 31:31]
  wire [183:0] hi_hi = io_inCR[319:136]; // @[ConstantParam.scala 46:24]
  wire [127:0] lo = io_inCR[127:0]; // @[ConstantParam.scala 46:48]
  wire [191:0] hi = {hi_hi,outReg}; // @[Cat.scala 30:58]
  assign io_outCR = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module SBoxHW(
  input  [319:0] io_S,
  output [319:0] io_Sout
);
  wire [63:0] x4 = io_S[63:0]; // @[SBoxHW.scala 41:13]
  wire [63:0] x3 = io_S[127:64]; // @[SBoxHW.scala 42:13]
  wire [63:0] x2 = io_S[191:128]; // @[SBoxHW.scala 43:13]
  wire [63:0] x1 = io_S[255:192]; // @[SBoxHW.scala 44:13]
  wire [63:0] x0 = io_S[319:256]; // @[SBoxHW.scala 45:13]
  wire [63:0] step1x0 = x0 ^ x4; // @[SBoxHW.scala 47:17]
  wire [63:0] step1x4 = x4 ^ x3; // @[SBoxHW.scala 48:17]
  wire [63:0] step1x2 = x2 ^ x1; // @[SBoxHW.scala 49:17]
  wire [63:0] _T_8 = ~x1; // @[SBoxHW.scala 51:26]
  wire [63:0] _T_9 = _T_8 & step1x2; // @[SBoxHW.scala 51:30]
  wire [63:0] step2x0 = step1x0 ^ _T_9; // @[SBoxHW.scala 51:22]
  wire [63:0] _T_11 = ~x3; // @[SBoxHW.scala 52:26]
  wire [63:0] _T_12 = _T_11 & step1x4; // @[SBoxHW.scala 52:30]
  wire [63:0] step2x2 = step1x2 ^ _T_12; // @[SBoxHW.scala 52:22]
  wire [63:0] _T_14 = ~step1x0; // @[SBoxHW.scala 53:26]
  wire [63:0] _T_15 = _T_14 & x1; // @[SBoxHW.scala 53:35]
  wire [63:0] step2x4 = step1x4 ^ _T_15; // @[SBoxHW.scala 53:22]
  wire [63:0] _T_17 = ~step1x2; // @[SBoxHW.scala 54:23]
  wire [63:0] _T_18 = _T_17 & x3; // @[SBoxHW.scala 54:32]
  wire [63:0] step2x1 = x1 ^ _T_18; // @[SBoxHW.scala 54:19]
  wire [63:0] _T_20 = ~step1x4; // @[SBoxHW.scala 55:23]
  wire [63:0] _T_21 = _T_20 & step1x0; // @[SBoxHW.scala 55:32]
  wire [63:0] step2x3 = x3 ^ _T_21; // @[SBoxHW.scala 55:19]
  wire [63:0] outx1 = step2x1 ^ step2x0; // @[SBoxHW.scala 57:20]
  wire [63:0] outx3 = step2x3 ^ step2x2; // @[SBoxHW.scala 58:20]
  wire [63:0] outx0 = step2x0 ^ step2x4; // @[SBoxHW.scala 59:20]
  wire [63:0] outx2 = ~step2x2; // @[SBoxHW.scala 60:12]
  wire [127:0] lo = {outx3,step2x4}; // @[Cat.scala 30:58]
  wire [191:0] hi = {outx0,outx1,outx2}; // @[Cat.scala 30:58]
  assign io_Sout = {hi,lo}; // @[Cat.scala 30:58]
endmodule
module LP(
  input  [319:0] io_S,
  output [319:0] io_SPrime
);
  wire [63:0] x4 = io_S[63:0]; // @[LP.scala 31:15]
  wire [63:0] x3 = io_S[127:64]; // @[LP.scala 32:15]
  wire [63:0] x2 = io_S[191:128]; // @[LP.scala 33:15]
  wire [63:0] x1 = io_S[255:192]; // @[LP.scala 34:15]
  wire [63:0] x0 = io_S[319:256]; // @[LP.scala 35:15]
  wire [18:0] hi = x0[18:0]; // @[LP.scala 43:27]
  wire [44:0] lo = x0[63:19]; // @[LP.scala 43:37]
  wire [63:0] _T_5 = {hi,lo}; // @[Cat.scala 30:58]
  wire [63:0] _T_6 = x0 ^ _T_5; // @[LP.scala 43:19]
  wire [27:0] hi_1 = x0[27:0]; // @[LP.scala 43:55]
  wire [35:0] lo_1 = x0[63:28]; // @[LP.scala 43:65]
  wire [63:0] _T_7 = {hi_1,lo_1}; // @[Cat.scala 30:58]
  wire [63:0] x0Prime = _T_6 ^ _T_7; // @[LP.scala 43:47]
  wire [60:0] hi_2 = x1[60:0]; // @[LP.scala 44:27]
  wire [2:0] lo_2 = x1[63:61]; // @[LP.scala 44:37]
  wire [63:0] _T_9 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _T_10 = x1 ^ _T_9; // @[LP.scala 44:19]
  wire [38:0] hi_3 = x1[38:0]; // @[LP.scala 44:55]
  wire [24:0] lo_3 = x1[63:39]; // @[LP.scala 44:66]
  wire [63:0] _T_11 = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire [63:0] x1Prime = _T_10 ^ _T_11; // @[LP.scala 44:47]
  wire  hi_4 = x2[0]; // @[LP.scala 45:27]
  wire [62:0] lo_4 = x2[63:1]; // @[LP.scala 45:37]
  wire [63:0] _T_13 = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire [63:0] _T_14 = x2 ^ _T_13; // @[LP.scala 45:19]
  wire [5:0] hi_5 = x2[5:0]; // @[LP.scala 45:55]
  wire [57:0] lo_5 = x2[63:6]; // @[LP.scala 45:65]
  wire [63:0] _T_15 = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire [63:0] x2Prime = _T_14 ^ _T_15; // @[LP.scala 45:47]
  wire [9:0] hi_6 = x3[9:0]; // @[LP.scala 46:27]
  wire [53:0] lo_6 = x3[63:10]; // @[LP.scala 46:37]
  wire [63:0] _T_17 = {hi_6,lo_6}; // @[Cat.scala 30:58]
  wire [63:0] _T_18 = x3 ^ _T_17; // @[LP.scala 46:19]
  wire [16:0] hi_7 = x3[16:0]; // @[LP.scala 46:55]
  wire [46:0] lo_7 = x3[63:17]; // @[LP.scala 46:65]
  wire [63:0] _T_19 = {hi_7,lo_7}; // @[Cat.scala 30:58]
  wire [63:0] x3Prime = _T_18 ^ _T_19; // @[LP.scala 46:47]
  wire [6:0] hi_8 = x4[6:0]; // @[LP.scala 47:27]
  wire [56:0] lo_8 = x4[63:7]; // @[LP.scala 47:37]
  wire [63:0] _T_21 = {hi_8,lo_8}; // @[Cat.scala 30:58]
  wire [63:0] _T_22 = x4 ^ _T_21; // @[LP.scala 47:19]
  wire [40:0] hi_9 = x4[40:0]; // @[LP.scala 47:55]
  wire [22:0] lo_9 = x4[63:41]; // @[LP.scala 47:65]
  wire [63:0] _T_23 = {hi_9,lo_9}; // @[Cat.scala 30:58]
  wire [63:0] x4Prime = _T_22 ^ _T_23; // @[LP.scala 47:47]
  wire [127:0] lo_10 = {x3Prime,x4Prime}; // @[Cat.scala 30:58]
  wire [191:0] hi_10 = {x0Prime,x1Prime,x2Prime}; // @[Cat.scala 30:58]
  assign io_SPrime = {hi_10,lo_10}; // @[Cat.scala 30:58]
endmodule
module Permutation(
  input  [319:0] io_State,
  input  [3:0]   io_i,
  input  [3:0]   io_b,
  output [319:0] io_StateR
);
  wire [3:0] Pc_io_i; // @[Permutation.scala 21:16]
  wire [3:0] Pc_io_b; // @[Permutation.scala 21:16]
  wire [319:0] Pc_io_inCR; // @[Permutation.scala 21:16]
  wire [319:0] Pc_io_outCR; // @[Permutation.scala 21:16]
  wire [319:0] Ps_io_S; // @[Permutation.scala 30:16]
  wire [319:0] Ps_io_Sout; // @[Permutation.scala 30:16]
  wire [319:0] Pl_io_S; // @[Permutation.scala 36:16]
  wire [319:0] Pl_io_SPrime; // @[Permutation.scala 36:16]
  ConstantParam Pc ( // @[Permutation.scala 21:16]
    .io_i(Pc_io_i),
    .io_b(Pc_io_b),
    .io_inCR(Pc_io_inCR),
    .io_outCR(Pc_io_outCR)
  );
  SBoxHW Ps ( // @[Permutation.scala 30:16]
    .io_S(Ps_io_S),
    .io_Sout(Ps_io_Sout)
  );
  LP Pl ( // @[Permutation.scala 36:16]
    .io_S(Pl_io_S),
    .io_SPrime(Pl_io_SPrime)
  );
  assign io_StateR = Pl_io_SPrime; // @[Permutation.scala 42:11]
  assign Pc_io_i = io_i; // @[Permutation.scala 23:9]
  assign Pc_io_b = io_b; // @[Permutation.scala 25:9]
  assign Pc_io_inCR = io_State; // @[Permutation.scala 27:12]
  assign Ps_io_S = Pc_io_outCR; // @[Permutation.scala 32:9]
  assign Pl_io_S = Ps_io_Sout; // @[Permutation.scala 38:9]
endmodule
module HashEngineReco(
  input         clock,
  input         reset,
  input  [63:0] io_M,
  input         io_accept,
  input         io_finalMessage,
  output [63:0] io_H,
  input  [1:0]  io_SWout,
  output        io_data_in_ready,
  output        io_data_out_ready,
  output        io_done,
  input         io_opMode,
  output        io_opModeOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [319:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [255:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire [319:0] Permutation_io_State; // @[HashEngineReco.scala 97:30]
  wire [3:0] Permutation_io_i; // @[HashEngineReco.scala 97:30]
  wire [3:0] Permutation_io_b; // @[HashEngineReco.scala 97:30]
  wire [319:0] Permutation_io_StateR; // @[HashEngineReco.scala 97:30]
  reg [319:0] State; // @[HashEngineReco.scala 42:24]
  reg [63:0] outState; // @[HashEngineReco.scala 43:27]
  reg [2:0] curr_state; // @[HashEngineReco.scala 47:29]
  reg [3:0] rounds; // @[HashEngineReco.scala 48:25]
  reg  firstCH; // @[HashEngineReco.scala 49:26]
  reg  DR; // @[HashEngineReco.scala 50:21]
  reg  operand; // @[HashEngineReco.scala 51:26]
  reg [3:0] i; // @[HashEngineReco.scala 54:20]
  reg  value; // @[Counter.scala 60:40]
  reg [15:0] length; // @[HashEngineReco.scala 60:25]
  wire  _T_2 = 3'h0 == curr_state; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h1 == curr_state; // @[Conditional.scala 37:30]
  wire [319:0] _T_6 = {io_M,256'h0}; // @[Cat.scala 30:58]
  wire [319:0] _T_7 = State ^ _T_6; // @[HashEngineReco.scala 81:32]
  wire  _T_8 = ~value; // @[HashEngineReco.scala 84:34]
  wire  _GEN_1 = ~value ? value + 1'h1 : value; // @[HashEngineReco.scala 84:42 Counter.scala 76:15 Counter.scala 60:40]
  wire  _T_9 = 3'h2 == curr_state; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_9 = operand ? 4'h8 : 4'hc; // @[HashEngineReco.scala 95:24 HashEngineReco.scala 95:24]
  wire [3:0] _GEN_10 = io_finalMessage & ~firstCH ? 4'hc : _GEN_9; // @[HashEngineReco.scala 91:55 HashEngineReco.scala 92:24 HashEngineReco.scala 95:24]
  wire [3:0] _T_14 = i + 4'h1; // @[HashEngineReco.scala 105:24]
  wire [3:0] _T_16 = rounds - 4'h1; // @[HashEngineReco.scala 107:35]
  wire [2:0] _GEN_11 = io_finalMessage ? 3'h3 : 3'h1; // @[HashEngineReco.scala 109:42 HashEngineReco.scala 110:36 HashEngineReco.scala 113:36]
  wire [2:0] _GEN_13 = i == _T_16 ? _GEN_11 : curr_state; // @[HashEngineReco.scala 107:41 HashEngineReco.scala 47:29]
  wire [3:0] _GEN_14 = _T_8 ? _T_14 : i; // @[HashEngineReco.scala 104:38 HashEngineReco.scala 105:19 HashEngineReco.scala 54:20]
  wire [319:0] _GEN_15 = _T_8 ? Permutation_io_StateR : State; // @[HashEngineReco.scala 104:38 HashEngineReco.scala 106:23 HashEngineReco.scala 42:24]
  wire [2:0] _GEN_17 = _T_8 ? _GEN_13 : curr_state; // @[HashEngineReco.scala 104:38 HashEngineReco.scala 47:29]
  wire  _T_18 = 3'h3 == curr_state; // @[Conditional.scala 37:30]
  wire [15:0] _T_21 = length - 16'h40; // @[HashEngineReco.scala 123:30]
  wire [2:0] _GEN_19 = length == 16'h40 ? 3'h4 : 3'h2; // @[HashEngineReco.scala 127:34 HashEngineReco.scala 128:28 HashEngineReco.scala 131:28]
  wire  _T_24 = 3'h4 == curr_state; // @[Conditional.scala 37:30]
  wire  _GEN_20 = _T_24 ? 1'h0 : DR; // @[Conditional.scala 39:67 HashEngineReco.scala 135:16 HashEngineReco.scala 50:21]
  wire [2:0] _GEN_21 = _T_24 ? 3'h4 : curr_state; // @[Conditional.scala 39:67 HashEngineReco.scala 136:24 HashEngineReco.scala 47:29]
  wire  _GEN_22 = _T_18 | firstCH; // @[Conditional.scala 39:67 HashEngineReco.scala 119:21 HashEngineReco.scala 49:26]
  wire [63:0] _GEN_23 = _T_18 ? State[319:256] : outState; // @[Conditional.scala 39:67 HashEngineReco.scala 120:22 HashEngineReco.scala 43:27]
  wire  _GEN_24 = _T_18 | _GEN_20; // @[Conditional.scala 39:67 HashEngineReco.scala 121:16]
  wire [3:0] _GEN_25 = _T_18 ? 4'h0 : i; // @[Conditional.scala 39:67 HashEngineReco.scala 122:15 HashEngineReco.scala 54:20]
  wire [15:0] _GEN_26 = _T_18 ? _T_21 : length; // @[Conditional.scala 39:67 HashEngineReco.scala 123:20 HashEngineReco.scala 60:25]
  wire  _GEN_27 = _T_18 ? _GEN_1 : value; // @[Conditional.scala 39:67 Counter.scala 60:40]
  wire [2:0] _GEN_28 = _T_18 ? _GEN_19 : _GEN_21; // @[Conditional.scala 39:67]
  reg [255:0] HoldOut; // @[HashEngineReco.scala 139:26]
  reg [2:0] value_1; // @[Counter.scala 60:40]
  wire [191:0] hi = HoldOut[255:64]; // @[HashEngineReco.scala 144:39]
  wire [255:0] _T_27 = {hi,outState}; // @[Cat.scala 30:58]
  wire [187:0] hi_hi = HoldOut[255:68]; // @[HashEngineReco.scala 146:39]
  wire [63:0] lo = HoldOut[63:0]; // @[HashEngineReco.scala 146:64]
  wire [315:0] _T_29 = {hi_hi,outState,lo}; // @[Cat.scala 30:58]
  wire [63:0] hi_hi_1 = HoldOut[255:192]; // @[HashEngineReco.scala 148:39]
  wire [127:0] lo_1 = HoldOut[127:0]; // @[HashEngineReco.scala 148:65]
  wire [255:0] _T_31 = {hi_hi_1,outState,lo_1}; // @[Cat.scala 30:58]
  wire [191:0] lo_2 = HoldOut[191:0]; // @[HashEngineReco.scala 150:48]
  wire [255:0] _T_33 = {outState,lo_2}; // @[Cat.scala 30:58]
  wire [255:0] _GEN_57 = value_1 == 3'h3 ? _T_33 : HoldOut; // @[HashEngineReco.scala 149:43 HashEngineReco.scala 150:25 HashEngineReco.scala 153:25]
  wire [255:0] _GEN_58 = value_1 == 3'h2 ? _T_31 : _GEN_57; // @[HashEngineReco.scala 147:43 HashEngineReco.scala 148:25]
  wire [315:0] _GEN_59 = value_1 == 3'h1 ? _T_29 : {{60'd0}, _GEN_58}; // @[HashEngineReco.scala 145:43 HashEngineReco.scala 146:25]
  wire [315:0] _GEN_60 = value_1 == 3'h0 ? {{60'd0}, _T_27} : _GEN_59; // @[HashEngineReco.scala 143:37 HashEngineReco.scala 144:25]
  wire  wrap_3 = value_1 == 3'h4; // @[Counter.scala 72:24]
  wire [2:0] _value_T_7 = value_1 + 3'h1; // @[Counter.scala 76:24]
  wire [315:0] _GEN_62 = io_data_out_ready ? _GEN_60 : {{60'd0}, HoldOut}; // @[HashEngineReco.scala 141:36 HashEngineReco.scala 139:26]
  wire  _T_35 = 2'h0 == io_SWout; // @[Conditional.scala 37:30]
  wire  _T_37 = 2'h1 == io_SWout; // @[Conditional.scala 37:30]
  wire  _T_39 = 2'h2 == io_SWout; // @[Conditional.scala 37:30]
  wire  _T_41 = 2'h3 == io_SWout; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_64 = _T_41 ? hi_hi_1 : 64'h0; // @[Conditional.scala 39:67 HashEngineReco.scala 171:17]
  wire [63:0] _GEN_65 = _T_39 ? HoldOut[191:128] : _GEN_64; // @[Conditional.scala 39:67 HashEngineReco.scala 168:17]
  wire [63:0] _GEN_66 = _T_37 ? HoldOut[127:64] : _GEN_65; // @[Conditional.scala 39:67 HashEngineReco.scala 165:17]
  Permutation Permutation ( // @[HashEngineReco.scala 97:30]
    .io_State(Permutation_io_State),
    .io_i(Permutation_io_i),
    .io_b(Permutation_io_b),
    .io_StateR(Permutation_io_StateR)
  );
  assign io_H = _T_35 ? lo : _GEN_66; // @[Conditional.scala 40:58 HashEngineReco.scala 162:17]
  assign io_data_in_ready = curr_state == 3'h1; // @[HashEngineReco.scala 56:36]
  assign io_data_out_ready = DR; // @[HashEngineReco.scala 65:21 HashEngineReco.scala 66:27 HashEngineReco.scala 69:27]
  assign io_done = value_1 == 3'h4; // @[HashEngineReco.scala 158:32]
  assign io_opModeOut = operand; // @[HashEngineReco.scala 57:18]
  assign Permutation_io_State = State; // @[HashEngineReco.scala 102:27]
  assign Permutation_io_i = i; // @[HashEngineReco.scala 99:23]
  assign Permutation_io_b = rounds; // @[HashEngineReco.scala 101:23]
  always @(posedge clock) begin
    if (reset) begin // @[HashEngineReco.scala 42:24]
      State <= 320'h0; // @[HashEngineReco.scala 42:24]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_opMode) begin // @[HashEngineReco.scala 74:25]
        State <= 320'h1470194fc6528a6738ec38ac0adffa72ec8e3296c76384cd6f6a54d7f52377da13c42a223be8d87;
      end else begin
        State <= 320'hee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140;
      end
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      if (io_accept) begin // @[HashEngineReco.scala 80:28]
        State <= _T_7; // @[HashEngineReco.scala 81:23]
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      State <= _GEN_15;
    end
    if (reset) begin // @[HashEngineReco.scala 43:27]
      outState <= 64'h0; // @[HashEngineReco.scala 43:27]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (!(_T_5)) begin // @[Conditional.scala 39:67]
        if (!(_T_9)) begin // @[Conditional.scala 39:67]
          outState <= _GEN_23;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 47:29]
      curr_state <= 3'h0; // @[HashEngineReco.scala 47:29]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      curr_state <= 3'h1; // @[HashEngineReco.scala 76:24]
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      if (io_accept) begin // @[HashEngineReco.scala 80:28]
        curr_state <= 3'h2; // @[HashEngineReco.scala 82:28]
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      curr_state <= _GEN_17;
    end else begin
      curr_state <= _GEN_28;
    end
    if (reset) begin // @[HashEngineReco.scala 48:25]
      rounds <= 4'h0; // @[HashEngineReco.scala 48:25]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (!(_T_5)) begin // @[Conditional.scala 39:67]
        if (_T_9) begin // @[Conditional.scala 39:67]
          rounds <= _GEN_10;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 49:26]
      firstCH <= 1'h0; // @[HashEngineReco.scala 49:26]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (!(_T_5)) begin // @[Conditional.scala 39:67]
        if (!(_T_9)) begin // @[Conditional.scala 39:67]
          firstCH <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 50:21]
      DR <= 1'h0; // @[HashEngineReco.scala 50:21]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (!(_T_5)) begin // @[Conditional.scala 39:67]
        if (_T_9) begin // @[Conditional.scala 39:67]
          DR <= 1'h0; // @[HashEngineReco.scala 90:16]
        end else begin
          DR <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 51:26]
      operand <= 1'h0; // @[HashEngineReco.scala 51:26]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      operand <= io_opMode; // @[HashEngineReco.scala 77:21]
    end
    if (reset) begin // @[HashEngineReco.scala 54:20]
      i <= 4'h0; // @[HashEngineReco.scala 54:20]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (_T_5) begin // @[Conditional.scala 39:67]
        if (io_accept) begin // @[HashEngineReco.scala 80:28]
          i <= 4'h0; // @[HashEngineReco.scala 83:19]
        end
      end else if (_T_9) begin // @[Conditional.scala 39:67]
        i <= _GEN_14;
      end else begin
        i <= _GEN_25;
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 1'h0; // @[Counter.scala 60:40]
    end else if (!(_T_2)) begin // @[Conditional.scala 40:58]
      if (_T_5) begin // @[Conditional.scala 39:67]
        if (io_accept) begin // @[HashEngineReco.scala 80:28]
          value <= _GEN_1;
        end
      end else if (_T_9) begin // @[Conditional.scala 39:67]
        value <= value + 1'h1; // @[Counter.scala 76:15]
      end else begin
        value <= _GEN_27;
      end
    end
    if (reset) begin // @[HashEngineReco.scala 60:25]
      length <= 16'h0; // @[HashEngineReco.scala 60:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      length <= 16'h100; // @[HashEngineReco.scala 75:20]
    end else if (!(_T_5)) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 39:67]
        length <= _GEN_26;
      end
    end
    if (reset) begin // @[HashEngineReco.scala 139:26]
      HoldOut <= 256'h0; // @[HashEngineReco.scala 139:26]
    end else begin
      HoldOut <= _GEN_62[255:0];
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 3'h0; // @[Counter.scala 60:40]
    end else if (io_data_out_ready) begin // @[HashEngineReco.scala 141:36]
      if (wrap_3) begin // @[Counter.scala 86:20]
        value_1 <= 3'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_7; // @[Counter.scala 76:15]
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
  _RAND_0 = {10{`RANDOM}};
  State = _RAND_0[319:0];
  _RAND_1 = {2{`RANDOM}};
  outState = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  curr_state = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  rounds = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  firstCH = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  DR = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  operand = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  i = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  value = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  length = _RAND_9[15:0];
  _RAND_10 = {8{`RANDOM}};
  HoldOut = _RAND_10[255:0];
  _RAND_11 = {1{`RANDOM}};
  value_1 = _RAND_11[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
