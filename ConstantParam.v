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
