module ConstantParam(
  input  [3:0]   io_i,
  input  [3:0]   io_b,
  input  [319:0] io_inCR,
  output [319:0] io_outCR
);
  wire [3:0] _T_2 = io_i + 4'hc; // @[ConstantParam.scala 26:11]
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
  wire [127:0] _T_27 = {outx3,step2x4}; // @[Cat.scala 29:58]
  wire [191:0] _T_29 = {outx0,outx1,outx2}; // @[Cat.scala 29:58]
  assign io_Sout = {_T_29,_T_27}; // @[SBoxHW.scala 67:11]
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
  output        io_data_out_ready,
  output        io_data_in_ready,
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
`endif // RANDOMIZE_REG_INIT
  wire [319:0] Permutation_io_State; // @[HashEngineReco.scala 93:30]
  wire [3:0] Permutation_io_i; // @[HashEngineReco.scala 93:30]
  wire [3:0] Permutation_io_b; // @[HashEngineReco.scala 93:30]
  wire [319:0] Permutation_io_StateR; // @[HashEngineReco.scala 93:30]
  reg [319:0] State; // @[HashEngineReco.scala 40:24]
  reg [63:0] outState; // @[HashEngineReco.scala 41:27]
  reg [2:0] curr_state; // @[HashEngineReco.scala 45:29]
  reg [3:0] rounds; // @[HashEngineReco.scala 46:25]
  reg  firstCH; // @[HashEngineReco.scala 47:26]
  reg  DR; // @[HashEngineReco.scala 48:21]
  reg  operand; // @[HashEngineReco.scala 49:26]
  reg [3:0] i; // @[HashEngineReco.scala 52:20]
  reg  value; // @[Counter.scala 29:33]
  reg [15:0] length; // @[HashEngineReco.scala 58:25]
  wire  _T_4 = 3'h0 == curr_state; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h1 == curr_state; // @[Conditional.scala 37:30]
  wire [319:0] _T_8 = {io_M,256'h0}; // @[Cat.scala 29:58]
  wire [319:0] _T_9 = State ^ _T_8; // @[HashEngineReco.scala 77:32]
  wire  _T_10 = ~value; // @[HashEngineReco.scala 80:34]
  wire  _T_13 = value + 1'h1; // @[Counter.scala 39:22]
  wire  _T_14 = 3'h2 == curr_state; // @[Conditional.scala 37:30]
  wire  _T_15 = ~firstCH; // @[HashEngineReco.scala 87:46]
  wire  _T_16 = io_finalMessage & _T_15; // @[HashEngineReco.scala 87:34]
  wire [3:0] _T_22 = i + 4'h1; // @[HashEngineReco.scala 101:24]
  wire [3:0] _T_24 = rounds - 4'h1; // @[HashEngineReco.scala 103:35]
  wire  _T_25 = i == _T_24; // @[HashEngineReco.scala 103:24]
  wire  _T_26 = 3'h3 == curr_state; // @[Conditional.scala 37:30]
  wire [15:0] _T_29 = length - 16'h40; // @[HashEngineReco.scala 119:30]
  wire  _T_34 = length == 16'h40; // @[HashEngineReco.scala 123:25]
  wire  _T_35 = 3'h4 == curr_state; // @[Conditional.scala 37:30]
  wire  _GEN_20 = _T_35 ? 1'h0 : DR; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_26 | firstCH; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_26 | _GEN_20; // @[Conditional.scala 39:67]
  Permutation Permutation ( // @[HashEngineReco.scala 93:30]
    .io_State(Permutation_io_State),
    .io_i(Permutation_io_i),
    .io_b(Permutation_io_b),
    .io_StateR(Permutation_io_StateR)
  );
  assign io_H = outState; // @[HashEngineReco.scala 60:10]
  assign io_data_out_ready = DR; // @[HashEngineReco.scala 62:27 HashEngineReco.scala 65:27]
  assign io_data_in_ready = curr_state == 3'h1; // @[HashEngineReco.scala 54:22]
  assign io_opModeOut = operand; // @[HashEngineReco.scala 55:18]
  assign Permutation_io_State = State; // @[HashEngineReco.scala 98:27]
  assign Permutation_io_i = i; // @[HashEngineReco.scala 95:23]
  assign Permutation_io_b = rounds; // @[HashEngineReco.scala 97:23]
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
    end else if (_T_4) begin
      if (io_opMode) begin
        State <= 320'h1470194fc6528a6738ec38ac0adffa72ec8e3296c76384cd6f6a54d7f52377da13c42a223be8d87;
      end else begin
        State <= 320'hee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140;
      end
    end else if (_T_7) begin
      if (io_accept) begin
        State <= _T_9;
      end
    end else if (_T_14) begin
      if (_T_10) begin
        State <= Permutation_io_StateR;
      end
    end
    if (reset) begin
      outState <= 64'h0;
    end else if (!(_T_4)) begin
      if (!(_T_7)) begin
        if (!(_T_14)) begin
          if (_T_26) begin
            outState <= State[319:256];
          end
        end
      end
    end
    if (reset) begin
      curr_state <= 3'h0;
    end else if (_T_4) begin
      curr_state <= 3'h1;
    end else if (_T_7) begin
      if (io_accept) begin
        curr_state <= 3'h2;
      end
    end else if (_T_14) begin
      if (_T_10) begin
        if (_T_25) begin
          if (io_finalMessage) begin
            curr_state <= 3'h3;
          end else begin
            curr_state <= 3'h1;
          end
        end
      end
    end else if (_T_26) begin
      if (_T_34) begin
        curr_state <= 3'h4;
      end else begin
        curr_state <= 3'h2;
      end
    end else if (_T_35) begin
      curr_state <= 3'h4;
    end
    if (reset) begin
      rounds <= 4'h0;
    end else if (!(_T_4)) begin
      if (!(_T_7)) begin
        if (_T_14) begin
          if (_T_16) begin
            rounds <= 4'hc;
          end else if (operand) begin
            rounds <= 4'h8;
          end else begin
            rounds <= 4'hc;
          end
        end
      end
    end
    if (reset) begin
      firstCH <= 1'h0;
    end else if (!(_T_4)) begin
      if (!(_T_7)) begin
        if (!(_T_14)) begin
          firstCH <= _GEN_22;
        end
      end
    end
    if (reset) begin
      DR <= 1'h0;
    end else if (!(_T_4)) begin
      if (!(_T_7)) begin
        if (_T_14) begin
          DR <= 1'h0;
        end else begin
          DR <= _GEN_24;
        end
      end
    end
    if (reset) begin
      operand <= 1'h0;
    end else if (_T_4) begin
      operand <= io_opMode;
    end
    if (reset) begin
      i <= 4'h0;
    end else if (!(_T_4)) begin
      if (_T_7) begin
        if (io_accept) begin
          i <= 4'h0;
        end
      end else if (_T_14) begin
        if (_T_10) begin
          i <= _T_22;
        end
      end else if (_T_26) begin
        i <= 4'h0;
      end
    end
    if (reset) begin
      value <= 1'h0;
    end else if (!(_T_4)) begin
      if (_T_7) begin
        if (io_accept) begin
          if (_T_10) begin
            value <= _T_13;
          end
        end
      end else if (_T_14) begin
        value <= _T_13;
      end else if (_T_26) begin
        if (_T_10) begin
          value <= _T_13;
        end
      end
    end
    if (reset) begin
      length <= 16'h0;
    end else if (_T_4) begin
      length <= 16'h100;
    end else if (!(_T_7)) begin
      if (!(_T_14)) begin
        if (_T_26) begin
          length <= _T_29;
        end
      end
    end
  end
endmodule
