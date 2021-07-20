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
  wire  _T_5 = r == 8'h0; // @[ConstantParam.scala 31:12]
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
  wire [191:0] _T_31 = {io_inCR[319:136],outReg}; // @[Cat.scala 29:58]
  assign io_outCR = {_T_31,io_inCR[127:0]}; // @[ConstantParam.scala 46:10]
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
  always @(posedge clock) begin
    x2c <= io_inCR[135:128];
    if (io_EN_IN) begin
      if (_T_5) begin
        outReg <= _T_6;
      end else if (_T_7) begin
        outReg <= _T_8;
      end else if (_T_9) begin
        outReg <= _T_10;
      end else if (_T_11) begin
        outReg <= _T_12;
      end else if (_T_13) begin
        outReg <= _T_14;
      end else if (_T_15) begin
        outReg <= _T_16;
      end else if (_T_17) begin
        outReg <= _T_18;
      end else if (_T_19) begin
        outReg <= _T_20;
      end else if (_T_21) begin
        outReg <= _T_22;
      end else if (_T_23) begin
        outReg <= _T_24;
      end else if (_T_25) begin
        outReg <= _T_26;
      end else if (_T_27) begin
        outReg <= _T_28;
      end else begin
        outReg <= 8'h0;
      end
    end
  end
endmodule
