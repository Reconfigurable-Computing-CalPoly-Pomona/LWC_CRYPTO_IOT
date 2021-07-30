module LP(
  input          clock,
  input          reset,
  input  [319:0] io_S,
  input          io_EN_IN,
  output [319:0] io_SPrime
);
  wire [63:0] x4 = io_S[63:0]; // @[LP.scala 31:15]
  wire [63:0] x3 = io_S[127:64]; // @[LP.scala 32:15]
  wire [63:0] x2 = io_S[191:128]; // @[LP.scala 33:15]
  wire [63:0] x1 = io_S[255:192]; // @[LP.scala 34:15]
  wire [63:0] x0 = io_S[319:256]; // @[LP.scala 35:15]
  wire [63:0] _T_7 = {x0[18:0],x0[63:19]}; // @[Cat.scala 29:58]
  wire [63:0] _T_8 = x0 ^ _T_7; // @[LP.scala 43:19]
  wire [63:0] _T_11 = {x0[27:0],x0[63:28]}; // @[Cat.scala 29:58]
  wire [63:0] x0Prime = _T_8 ^ _T_11; // @[LP.scala 43:47]
  wire [63:0] _T_15 = {x1[60:0],x1[63:61]}; // @[Cat.scala 29:58]
  wire [63:0] _T_16 = x1 ^ _T_15; // @[LP.scala 44:19]
  wire [63:0] _T_19 = {x1[38:0],x1[63:39]}; // @[Cat.scala 29:58]
  wire [63:0] x1Prime = _T_16 ^ _T_19; // @[LP.scala 44:47]
  wire [63:0] _T_23 = {x2[0],x2[63:1]}; // @[Cat.scala 29:58]
  wire [63:0] _T_24 = x2 ^ _T_23; // @[LP.scala 45:19]
  wire [63:0] _T_27 = {x2[5:0],x2[63:6]}; // @[Cat.scala 29:58]
  wire [63:0] x2Prime = _T_24 ^ _T_27; // @[LP.scala 45:47]
  wire [63:0] _T_31 = {x3[9:0],x3[63:10]}; // @[Cat.scala 29:58]
  wire [63:0] _T_32 = x3 ^ _T_31; // @[LP.scala 46:19]
  wire [63:0] _T_35 = {x3[16:0],x3[63:17]}; // @[Cat.scala 29:58]
  wire [63:0] x3Prime = _T_32 ^ _T_35; // @[LP.scala 46:47]
  wire [63:0] _T_39 = {x4[6:0],x4[63:7]}; // @[Cat.scala 29:58]
  wire [63:0] _T_40 = x4 ^ _T_39; // @[LP.scala 47:19]
  wire [63:0] _T_43 = {x4[40:0],x4[63:41]}; // @[Cat.scala 29:58]
  wire [63:0] x4Prime = _T_40 ^ _T_43; // @[LP.scala 47:47]
  wire [127:0] _T_45 = {x3Prime,x4Prime}; // @[Cat.scala 29:58]
  wire [191:0] _T_47 = {x0Prime,x1Prime,x2Prime}; // @[Cat.scala 29:58]
  assign io_SPrime = {_T_47,_T_45}; // @[LP.scala 51:13]
endmodule
