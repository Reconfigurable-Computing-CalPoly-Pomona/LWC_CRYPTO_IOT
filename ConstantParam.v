module ConstantParam(
  input          clock,
  input          reset,
  input  [3:0]   io_i,
  input  [3:0]   io_a,
  input  [3:0]   io_b,
  input          io_EN_IN,
  input  [319:0] io_inCR,
  output [319:0] io_outCR
);
  wire [3:0] _T_2 = io_i + io_a; // @[ConstantParam.scala 26:11]
  wire [3:0] _T_4 = _T_2 - io_b; // @[ConstantParam.scala 26:18]
  wire [7:0] r = {{4'd0}, _T_4}; // @[ConstantParam.scala 23:13 ConstantParam.scala 26:3]
  wire  _T_5 = r == 8'h0; // @[ConstantParam.scala 31:12]
  wire [7:0] x2c = io_inCR[135:128]; // @[ConstantParam.scala 24:15 ConstantParam.scala 25:5]
  wire [7:0] _T_6 = x2c ^ 8'hf0; // @[ConstantParam.scala 31:38]
  wire  _T_7 = r == 8'h1; // @[ConstantParam.scala 32:16]
  wire [7:0] _T_8 = x2c ^ 8'he1; // @[ConstantParam.scala 32:41]
  wire  _T_9 = r == 8'h2; // @[ConstantParam.scala 33:16]
  wire [7:0] _T_10 = x2c ^ 8'hd2; // @[ConstantParam.scala 33:41]
  wire  _T_11 = r == 8'h3; // @[ConstantParam.scala 34:16]
  wire [7:0] _T_12 = x2c ^ 8'hc3; // @[ConstantParam.scala 34:41]
  wire  _T_13 = r == 8'h4; // @[ConstantParam.scala 35:16]
  wire [7:0] _T_14 = x2c ^ 8'hb4; // @[ConstantParam.scala 35:41]
  wire  _T_15 = r == 8'h5; // @[ConstantParam.scala 36:16]
  wire [7:0] _T_16 = x2c ^ 8'ha5; // @[ConstantParam.scala 36:41]
  wire  _T_17 = r == 8'h6; // @[ConstantParam.scala 37:16]
  wire [7:0] _T_18 = x2c ^ 8'h96; // @[ConstantParam.scala 37:41]
  wire  _T_19 = r == 8'h7; // @[ConstantParam.scala 38:16]
  wire [7:0] _T_20 = x2c ^ 8'h87; // @[ConstantParam.scala 38:41]
  wire  _T_21 = r == 8'h8; // @[ConstantParam.scala 39:16]
  wire [7:0] _T_22 = x2c ^ 8'h78; // @[ConstantParam.scala 39:41]
  wire  _T_23 = r == 8'h9; // @[ConstantParam.scala 40:16]
  wire [7:0] _T_24 = x2c ^ 8'h69; // @[ConstantParam.scala 40:41]
  wire  _T_25 = r == 8'ha; // @[ConstantParam.scala 41:16]
  wire [7:0] _T_26 = x2c ^ 8'h5a; // @[ConstantParam.scala 41:42]
  wire  _T_27 = r == 8'hb; // @[ConstantParam.scala 42:16]
  wire [7:0] _T_28 = x2c ^ 8'h4b; // @[ConstantParam.scala 42:42]
  wire [7:0] _GEN_0 = _T_27 ? _T_28 : 8'h0; // @[ConstantParam.scala 42:26]
  wire [7:0] _GEN_1 = _T_25 ? _T_26 : _GEN_0; // @[ConstantParam.scala 41:26]
  wire [7:0] _GEN_2 = _T_23 ? _T_24 : _GEN_1; // @[ConstantParam.scala 40:25]
  wire [7:0] _GEN_3 = _T_21 ? _T_22 : _GEN_2; // @[ConstantParam.scala 39:25]
  wire [7:0] _GEN_4 = _T_19 ? _T_20 : _GEN_3; // @[ConstantParam.scala 38:25]
  wire [7:0] _GEN_5 = _T_17 ? _T_18 : _GEN_4; // @[ConstantParam.scala 37:25]
  wire [7:0] _GEN_6 = _T_15 ? _T_16 : _GEN_5; // @[ConstantParam.scala 36:25]
  wire [7:0] _GEN_7 = _T_13 ? _T_14 : _GEN_6; // @[ConstantParam.scala 35:25]
  wire [7:0] _GEN_8 = _T_11 ? _T_12 : _GEN_7; // @[ConstantParam.scala 34:25]
  wire [7:0] _GEN_9 = _T_9 ? _T_10 : _GEN_8; // @[ConstantParam.scala 33:25]
  wire [7:0] _GEN_10 = _T_7 ? _T_8 : _GEN_9; // @[ConstantParam.scala 32:25]
  wire [7:0] outReg = _T_5 ? _T_6 : _GEN_10; // @[ConstantParam.scala 31:22]
  wire [191:0] _T_31 = {io_inCR[319:136],outReg}; // @[Cat.scala 29:58]
  assign io_outCR = {_T_31,io_inCR[127:0]}; // @[ConstantParam.scala 46:10]
endmodule
