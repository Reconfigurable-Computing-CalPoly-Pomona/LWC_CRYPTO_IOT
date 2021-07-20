module ConstantParam(
  input          clock,
  input  [3:0]   io_i,
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
  wire [3:0] _T_2 = io_i + 4'hc; // @[ConstantParam.scala 26:11]
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
  wire [63:0] x0 = io_EN_IN ? io_S[319:256] : 64'h0; // @[LP.scala 29:3]
  wire [63:0] _T_12 = {x0[18:0],x0[63:19]}; // @[Cat.scala 29:58]
  wire [63:0] _T_13 = x0 ^ _T_12; // @[LP.scala 43:19]
  wire [63:0] _T_16 = {x0[27:0],x0[63:28]}; // @[Cat.scala 29:58]
  wire [63:0] _T_17 = _T_13 ^ _T_16; // @[LP.scala 43:47]
  wire [63:0] x1 = io_EN_IN ? io_S[255:192] : 64'h0; // @[LP.scala 29:3]
  wire [63:0] _T_20 = {x1[60:0],x1[63:61]}; // @[Cat.scala 29:58]
  wire [63:0] _T_21 = x1 ^ _T_20; // @[LP.scala 44:19]
  wire [63:0] _T_24 = {x1[38:0],x1[63:39]}; // @[Cat.scala 29:58]
  wire [63:0] _T_25 = _T_21 ^ _T_24; // @[LP.scala 44:47]
  wire [63:0] x2 = io_EN_IN ? io_S[191:128] : 64'h0; // @[LP.scala 29:3]
  wire [63:0] _T_28 = {x2[0],x2[63:1]}; // @[Cat.scala 29:58]
  wire [63:0] _T_29 = x2 ^ _T_28; // @[LP.scala 45:19]
  wire [63:0] _T_32 = {x2[5:0],x2[63:6]}; // @[Cat.scala 29:58]
  wire [63:0] _T_33 = _T_29 ^ _T_32; // @[LP.scala 45:47]
  wire [63:0] x3 = io_EN_IN ? io_S[127:64] : 64'h0; // @[LP.scala 29:3]
  wire [63:0] _T_36 = {x3[9:0],x3[63:10]}; // @[Cat.scala 29:58]
  wire [63:0] _T_37 = x3 ^ _T_36; // @[LP.scala 46:19]
  wire [63:0] _T_40 = {x3[16:0],x3[63:17]}; // @[Cat.scala 29:58]
  wire [63:0] _T_41 = _T_37 ^ _T_40; // @[LP.scala 46:47]
  wire [63:0] x4 = io_EN_IN ? io_S[63:0] : 64'h0; // @[LP.scala 29:3]
  wire [63:0] _T_44 = {x4[6:0],x4[63:7]}; // @[Cat.scala 29:58]
  wire [63:0] _T_45 = x4 ^ _T_44; // @[LP.scala 47:19]
  wire [63:0] _T_48 = {x4[40:0],x4[63:41]}; // @[Cat.scala 29:58]
  wire [63:0] _T_49 = _T_45 ^ _T_48; // @[LP.scala 47:47]
  wire [319:0] _T_53 = {_T_17,_T_25,_T_33,_T_41,_T_49}; // @[Cat.scala 29:58]
  assign io_SPrime = state; // @[LP.scala 51:13]
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
  always @(posedge clock) begin
    if (reset) begin
      state <= 320'h0;
    end else if (io_EN_IN) begin
      state <= _T_53;
    end
  end
endmodule
module Permutation(
  input          clock,
  input          reset,
  input  [319:0] io_State,
  input  [3:0]   io_i,
  input  [3:0]   io_b,
  input          io_EN_IN,
  output [319:0] io_StateR
);
  wire  Pc_clock; // @[Permutation.scala 21:16]
  wire [3:0] Pc_io_i; // @[Permutation.scala 21:16]
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
module HashEngine(
  input         clock,
  input         reset,
  input  [63:0] io_M,
  input         io_accept,
  input         io_finalMessage,
  output [63:0] io_H,
  output        io_data_ready,
  output        io_idle
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
`endif // RANDOMIZE_REG_INIT
  wire  Permutation_clock; // @[HashEngine.scala 76:30]
  wire  Permutation_reset; // @[HashEngine.scala 76:30]
  wire [319:0] Permutation_io_State; // @[HashEngine.scala 76:30]
  wire [3:0] Permutation_io_i; // @[HashEngine.scala 76:30]
  wire [3:0] Permutation_io_b; // @[HashEngine.scala 76:30]
  wire  Permutation_io_EN_IN; // @[HashEngine.scala 76:30]
  wire [319:0] Permutation_io_StateR; // @[HashEngine.scala 76:30]
  reg [319:0] State; // @[HashEngine.scala 25:24]
  reg [63:0] outState; // @[HashEngine.scala 26:27]
  reg [2:0] curr_state; // @[HashEngine.scala 30:29]
  reg [3:0] rounds; // @[HashEngine.scala 31:25]
  reg  DR; // @[HashEngine.scala 33:21]
  reg [3:0] i; // @[HashEngine.scala 36:20]
  reg [2:0] value; // @[Counter.scala 29:33]
  reg [15:0] length; // @[HashEngine.scala 41:25]
  wire  _T_2 = 3'h0 == curr_state; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h1 == curr_state; // @[Conditional.scala 37:30]
  wire [319:0] _T_4 = {io_M,256'h0}; // @[Cat.scala 29:58]
  wire [319:0] _T_5 = State ^ _T_4; // @[HashEngine.scala 60:32]
  wire  _T_6 = value == 3'h0; // @[HashEngine.scala 63:34]
  wire  _T_7 = value == 3'h4; // @[Counter.scala 38:24]
  wire [2:0] _T_9 = value + 3'h1; // @[Counter.scala 39:22]
  wire  _T_10 = 3'h2 == curr_state; // @[Conditional.scala 37:30]
  wire [3:0] _T_18 = i + 4'h1; // @[HashEngine.scala 84:24]
  wire [3:0] _T_20 = rounds - 4'h1; // @[HashEngine.scala 86:35]
  wire  _T_21 = i == _T_20; // @[HashEngine.scala 86:24]
  wire  _GEN_10 = _T_21 ? 1'h0 : 1'h1; // @[HashEngine.scala 86:41]
  wire  _T_22 = 3'h3 == curr_state; // @[Conditional.scala 37:30]
  wire [15:0] _T_25 = length - 16'h40; // @[HashEngine.scala 102:30]
  wire  _T_30 = length == 16'h40; // @[HashEngine.scala 106:25]
  wire  _T_31 = 3'h4 == curr_state; // @[Conditional.scala 37:30]
  wire  _GEN_19 = _T_31 ? 1'h0 : DR; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_22 | _GEN_19; // @[Conditional.scala 39:67]
  Permutation Permutation ( // @[HashEngine.scala 76:30]
    .clock(Permutation_clock),
    .reset(Permutation_reset),
    .io_State(Permutation_io_State),
    .io_i(Permutation_io_i),
    .io_b(Permutation_io_b),
    .io_EN_IN(Permutation_io_EN_IN),
    .io_StateR(Permutation_io_StateR)
  );
  assign io_H = outState; // @[HashEngine.scala 43:10]
  assign io_data_ready = DR; // @[HashEngine.scala 45:23 HashEngine.scala 48:23]
  assign io_idle = curr_state == 3'h1; // @[HashEngine.scala 38:13]
  assign Permutation_clock = clock;
  assign Permutation_reset = reset;
  assign Permutation_io_State = State; // @[HashEngine.scala 81:27]
  assign Permutation_io_i = i; // @[HashEngine.scala 78:23]
  assign Permutation_io_b = rounds; // @[HashEngine.scala 80:23]
  assign Permutation_io_EN_IN = _T_6 ? _GEN_10 : 1'h1; // @[HashEngine.scala 77:27 HashEngine.scala 87:35]
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
  DR = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  i = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  value = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  length = _RAND_7[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      State <= 320'h0;
    end else if (_T_2) begin
      State <= 320'hee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140;
    end else if (_T_3) begin
      if (io_accept) begin
        State <= _T_5;
      end
    end else if (_T_10) begin
      if (_T_6) begin
        State <= Permutation_io_StateR;
      end
    end
    if (reset) begin
      outState <= 64'h0;
    end else if (!(_T_2)) begin
      if (!(_T_3)) begin
        if (!(_T_10)) begin
          if (_T_22) begin
            outState <= State[319:256];
          end
        end
      end
    end
    if (reset) begin
      curr_state <= 3'h0;
    end else if (_T_2) begin
      curr_state <= 3'h1;
    end else if (_T_3) begin
      if (io_accept) begin
        curr_state <= 3'h2;
      end
    end else if (_T_10) begin
      if (_T_6) begin
        if (_T_21) begin
          if (io_finalMessage) begin
            curr_state <= 3'h3;
          end else begin
            curr_state <= 3'h1;
          end
        end
      end
    end else if (_T_22) begin
      if (_T_30) begin
        curr_state <= 3'h4;
      end else begin
        curr_state <= 3'h2;
      end
    end else if (_T_31) begin
      curr_state <= 3'h4;
    end
    if (reset) begin
      rounds <= 4'h0;
    end else if (!(_T_2)) begin
      if (!(_T_3)) begin
        if (_T_10) begin
          rounds <= 4'hc;
        end
      end
    end
    if (reset) begin
      DR <= 1'h0;
    end else if (!(_T_2)) begin
      if (!(_T_3)) begin
        if (_T_10) begin
          DR <= 1'h0;
        end else begin
          DR <= _GEN_23;
        end
      end
    end
    if (reset) begin
      i <= 4'h0;
    end else if (!(_T_2)) begin
      if (_T_3) begin
        if (io_accept) begin
          i <= 4'h0;
        end
      end else if (_T_10) begin
        if (_T_6) begin
          i <= _T_18;
        end
      end else if (_T_22) begin
        i <= 4'h0;
      end
    end
    if (reset) begin
      value <= 3'h0;
    end else if (!(_T_2)) begin
      if (_T_3) begin
        if (io_accept) begin
          if (_T_6) begin
            if (_T_7) begin
              value <= 3'h0;
            end else begin
              value <= _T_9;
            end
          end
        end
      end else if (_T_10) begin
        if (_T_7) begin
          value <= 3'h0;
        end else begin
          value <= _T_9;
        end
      end else if (_T_22) begin
        if (_T_6) begin
          if (_T_7) begin
            value <= 3'h0;
          end else begin
            value <= _T_9;
          end
        end
      end
    end
    if (reset) begin
      length <= 16'h0;
    end else if (_T_2) begin
      length <= 16'h100;
    end else if (!(_T_3)) begin
      if (!(_T_10)) begin
        if (_T_22) begin
          length <= _T_25;
        end
      end
    end
  end
endmodule
