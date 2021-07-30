module SBoxHW(
  input          clock,
  input          reset,
  input  [319:0] io_S,
  input          io_EN_IN,
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
  wire [127:0] _T_27 = {outx3,step2x4}; // @[Cat.scala 29:58]
  wire [191:0] _T_29 = {outx0,outx1,outx2}; // @[Cat.scala 29:58]
  assign io_Sout = {_T_29,_T_27}; // @[SBoxHW.scala 67:11]
endmodule
