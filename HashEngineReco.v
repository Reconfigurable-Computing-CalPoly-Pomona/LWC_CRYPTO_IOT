module Fifo(
  input         clock,
  input         reset,
  input         io_enq_val,
  output        io_enq_rdy,
  output        io_deq_val,
  output        io_is_full,
  output        io_is_empty,
  input         io_deq_rdy,
  input  [63:0] io_enq_dat,
  output [63:0] io_deq_dat
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:15]; // @[Fifo.scala 35:14]
  wire [63:0] ram_MPORT_1_data; // @[Fifo.scala 35:14]
  wire [3:0] ram_MPORT_1_addr; // @[Fifo.scala 35:14]
  wire [63:0] ram_MPORT_data; // @[Fifo.scala 35:14]
  wire [3:0] ram_MPORT_addr; // @[Fifo.scala 35:14]
  wire  ram_MPORT_mask; // @[Fifo.scala 35:14]
  wire  ram_MPORT_en; // @[Fifo.scala 35:14]
  reg [3:0] enq_ptr; // @[Fifo.scala 18:21]
  reg [3:0] deq_ptr; // @[Fifo.scala 19:21]
  wire  do_enq = io_enq_rdy & io_enq_val; // @[Fifo.scala 20:25]
  wire  do_deq = io_deq_rdy & io_deq_val; // @[Fifo.scala 21:25]
  wire [3:0] deq_ptr_inc = deq_ptr + 4'h1; // @[Fifo.scala 25:27]
  wire [3:0] enq_ptr_inc = enq_ptr + 4'h1; // @[Fifo.scala 26:27]
  reg  is_full_next; // @[Fifo.scala 28:27]
  wire  _T_10 = do_deq & io_is_full ? 1'h0 : io_is_full; // @[Fifo.scala 29:75]
  assign ram_MPORT_1_addr = deq_ptr;
  assign ram_MPORT_1_data = ram[ram_MPORT_1_addr]; // @[Fifo.scala 35:14]
  assign ram_MPORT_data = io_enq_dat;
  assign ram_MPORT_addr = enq_ptr;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_rdy & io_enq_val;
  assign io_enq_rdy = ~io_is_full; // @[Fifo.scala 39:15]
  assign io_deq_val = ~io_is_empty; // @[Fifo.scala 40:15]
  assign io_is_full = is_full_next; // @[Fifo.scala 34:12]
  assign io_is_empty = ~io_is_full & enq_ptr == deq_ptr; // @[Fifo.scala 22:28]
  assign io_deq_dat = ram_MPORT_1_data; // @[Fifo.scala 41:14]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Fifo.scala 35:14]
    end
    if (reset) begin // @[Fifo.scala 18:21]
      enq_ptr <= 4'h0; // @[Fifo.scala 18:21]
    end else if (do_enq) begin // @[Fifo.scala 32:15]
      enq_ptr <= enq_ptr_inc;
    end
    if (reset) begin // @[Fifo.scala 19:21]
      deq_ptr <= 4'h0; // @[Fifo.scala 19:21]
    end else if (do_deq) begin // @[Fifo.scala 33:15]
      deq_ptr <= deq_ptr_inc;
    end
    if (reset) begin // @[Fifo.scala 28:27]
      is_full_next <= 1'h0; // @[Fifo.scala 28:27]
    end else begin
      is_full_next <= do_enq & ~do_deq & enq_ptr_inc == deq_ptr | _T_10; // @[Fifo.scala 29:14]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  is_full_next = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  input         io_pushData,
  input         io_Fifoaccept,
  input         io_finalMessage,
  output [63:0] io_H,
  input  [1:0]  io_SWout,
  output        io_data_in_ready,
  output        io_data_out_ready,
  output        io_done,
  input         io_opMode,
  output        io_opModeOut,
  output        io_FifoReadyIn
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
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [255:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  FIFO_clock; // @[HashEngineReco.scala 76:22]
  wire  FIFO_reset; // @[HashEngineReco.scala 76:22]
  wire  FIFO_io_enq_val; // @[HashEngineReco.scala 76:22]
  wire  FIFO_io_enq_rdy; // @[HashEngineReco.scala 76:22]
  wire  FIFO_io_deq_val; // @[HashEngineReco.scala 76:22]
  wire  FIFO_io_is_full; // @[HashEngineReco.scala 76:22]
  wire  FIFO_io_is_empty; // @[HashEngineReco.scala 76:22]
  wire  FIFO_io_deq_rdy; // @[HashEngineReco.scala 76:22]
  wire [63:0] FIFO_io_enq_dat; // @[HashEngineReco.scala 76:22]
  wire [63:0] FIFO_io_deq_dat; // @[HashEngineReco.scala 76:22]
  wire [319:0] Permutation_io_State; // @[HashEngineReco.scala 149:30]
  wire [3:0] Permutation_io_i; // @[HashEngineReco.scala 149:30]
  wire [3:0] Permutation_io_b; // @[HashEngineReco.scala 149:30]
  wire [319:0] Permutation_io_StateR; // @[HashEngineReco.scala 149:30]
  reg [319:0] State; // @[HashEngineReco.scala 44:24]
  reg [63:0] outState; // @[HashEngineReco.scala 45:27]
  reg [2:0] curr_state; // @[HashEngineReco.scala 49:29]
  reg [3:0] rounds; // @[HashEngineReco.scala 50:25]
  reg  firstCH; // @[HashEngineReco.scala 51:26]
  reg  DR; // @[HashEngineReco.scala 52:21]
  reg  operand; // @[HashEngineReco.scala 53:26]
  reg [3:0] i; // @[HashEngineReco.scala 56:20]
  reg  value; // @[Counter.scala 60:40]
  reg [15:0] length; // @[HashEngineReco.scala 62:25]
  reg  test; // @[HashEngineReco.scala 78:23]
  reg  stateP; // @[HashEngineReco.scala 81:25]
  wire  _T_2 = ~stateP; // @[Conditional.scala 37:30]
  wire  _GEN_2 = io_Fifoaccept | stateP; // @[HashEngineReco.scala 84:31 HashEngineReco.scala 86:24 HashEngineReco.scala 81:25]
  wire  _T_5 = 3'h0 == curr_state; // @[Conditional.scala 37:30]
  wire  _T_8 = 3'h1 == curr_state; // @[Conditional.scala 37:30]
  wire  FIFOReadyOut = FIFO_io_deq_val;
  wire [63:0] FIFOM = FIFO_io_deq_dat;
  wire [319:0] _T_12 = {FIFOM,256'h0}; // @[Cat.scala 30:58]
  wire [319:0] _T_13 = State ^ _T_12; // @[HashEngineReco.scala 131:32]
  wire  _T_14 = ~value; // @[HashEngineReco.scala 134:34]
  wire  _GEN_8 = ~value ? value + 1'h1 : value; // @[HashEngineReco.scala 134:42 Counter.scala 76:15 Counter.scala 60:40]
  wire  _T_15 = 3'h2 == curr_state; // @[Conditional.scala 37:30]
  wire  _T_16 = io_finalMessage & FIFO_io_is_empty; // @[HashEngineReco.scala 143:36]
  wire [3:0] _GEN_16 = operand ? 4'h8 : 4'hc; // @[HashEngineReco.scala 147:24 HashEngineReco.scala 147:24]
  wire [3:0] _GEN_17 = io_finalMessage & FIFO_io_is_empty & ~firstCH ? 4'hc : _GEN_16; // @[HashEngineReco.scala 143:78 HashEngineReco.scala 144:24 HashEngineReco.scala 147:24]
  wire [3:0] _T_21 = i + 4'h1; // @[HashEngineReco.scala 157:24]
  wire [3:0] _T_23 = rounds - 4'h1; // @[HashEngineReco.scala 159:35]
  wire [2:0] _GEN_18 = _T_16 ? 3'h3 : 3'h1; // @[HashEngineReco.scala 161:62 HashEngineReco.scala 162:36 HashEngineReco.scala 165:36]
  wire [2:0] _GEN_20 = i == _T_23 ? _GEN_18 : curr_state; // @[HashEngineReco.scala 159:41 HashEngineReco.scala 49:29]
  wire [3:0] _GEN_21 = _T_14 ? _T_21 : i; // @[HashEngineReco.scala 156:38 HashEngineReco.scala 157:19 HashEngineReco.scala 56:20]
  wire [319:0] _GEN_22 = _T_14 ? Permutation_io_StateR : State; // @[HashEngineReco.scala 156:38 HashEngineReco.scala 158:23 HashEngineReco.scala 44:24]
  wire [2:0] _GEN_24 = _T_14 ? _GEN_20 : curr_state; // @[HashEngineReco.scala 156:38 HashEngineReco.scala 49:29]
  wire  _T_26 = 3'h3 == curr_state; // @[Conditional.scala 37:30]
  wire [15:0] _T_29 = length - 16'h40; // @[HashEngineReco.scala 175:30]
  wire [2:0] _GEN_26 = length == 16'h40 ? 3'h4 : 3'h2; // @[HashEngineReco.scala 179:34 HashEngineReco.scala 180:28 HashEngineReco.scala 183:28]
  wire  _T_32 = 3'h4 == curr_state; // @[Conditional.scala 37:30]
  wire  _GEN_27 = _T_32 ? 1'h0 : DR; // @[Conditional.scala 39:67 HashEngineReco.scala 187:16 HashEngineReco.scala 52:21]
  wire [2:0] _GEN_28 = _T_32 ? 3'h4 : curr_state; // @[Conditional.scala 39:67 HashEngineReco.scala 188:24 HashEngineReco.scala 49:29]
  wire  _GEN_29 = _T_26 | firstCH; // @[Conditional.scala 39:67 HashEngineReco.scala 171:21 HashEngineReco.scala 51:26]
  wire [63:0] _GEN_30 = _T_26 ? State[319:256] : outState; // @[Conditional.scala 39:67 HashEngineReco.scala 172:22 HashEngineReco.scala 45:27]
  wire  _GEN_31 = _T_26 | _GEN_27; // @[Conditional.scala 39:67 HashEngineReco.scala 173:16]
  wire [3:0] _GEN_32 = _T_26 ? 4'h0 : i; // @[Conditional.scala 39:67 HashEngineReco.scala 174:15 HashEngineReco.scala 56:20]
  wire [15:0] _GEN_33 = _T_26 ? _T_29 : length; // @[Conditional.scala 39:67 HashEngineReco.scala 175:20 HashEngineReco.scala 62:25]
  wire  _GEN_34 = _T_26 ? _GEN_8 : value; // @[Conditional.scala 39:67 Counter.scala 60:40]
  wire [2:0] _GEN_35 = _T_26 ? _GEN_26 : _GEN_28; // @[Conditional.scala 39:67]
  reg [255:0] HoldOut; // @[HashEngineReco.scala 191:26]
  reg [2:0] value_1; // @[Counter.scala 60:40]
  wire [191:0] hi = HoldOut[255:64]; // @[HashEngineReco.scala 196:39]
  wire [255:0] _T_35 = {hi,outState}; // @[Cat.scala 30:58]
  wire [187:0] hi_hi = HoldOut[255:68]; // @[HashEngineReco.scala 198:39]
  wire [63:0] lo = HoldOut[63:0]; // @[HashEngineReco.scala 198:64]
  wire [315:0] _T_37 = {hi_hi,outState,lo}; // @[Cat.scala 30:58]
  wire [63:0] hi_hi_1 = HoldOut[255:192]; // @[HashEngineReco.scala 200:39]
  wire [127:0] lo_1 = HoldOut[127:0]; // @[HashEngineReco.scala 200:65]
  wire [255:0] _T_39 = {hi_hi_1,outState,lo_1}; // @[Cat.scala 30:58]
  wire [191:0] lo_2 = HoldOut[191:0]; // @[HashEngineReco.scala 202:48]
  wire [255:0] _T_41 = {outState,lo_2}; // @[Cat.scala 30:58]
  wire [255:0] _GEN_64 = value_1 == 3'h3 ? _T_41 : HoldOut; // @[HashEngineReco.scala 201:43 HashEngineReco.scala 202:25 HashEngineReco.scala 205:25]
  wire [255:0] _GEN_65 = value_1 == 3'h2 ? _T_39 : _GEN_64; // @[HashEngineReco.scala 199:43 HashEngineReco.scala 200:25]
  wire [315:0] _GEN_66 = value_1 == 3'h1 ? _T_37 : {{60'd0}, _GEN_65}; // @[HashEngineReco.scala 197:43 HashEngineReco.scala 198:25]
  wire [315:0] _GEN_67 = value_1 == 3'h0 ? {{60'd0}, _T_35} : _GEN_66; // @[HashEngineReco.scala 195:37 HashEngineReco.scala 196:25]
  wire  wrap_3 = value_1 == 3'h4; // @[Counter.scala 72:24]
  wire [2:0] _value_T_7 = value_1 + 3'h1; // @[Counter.scala 76:24]
  wire [315:0] _GEN_69 = io_data_out_ready ? _GEN_67 : {{60'd0}, HoldOut}; // @[HashEngineReco.scala 193:36 HashEngineReco.scala 191:26]
  wire  _T_43 = 2'h0 == io_SWout; // @[Conditional.scala 37:30]
  wire  _T_45 = 2'h1 == io_SWout; // @[Conditional.scala 37:30]
  wire  _T_47 = 2'h2 == io_SWout; // @[Conditional.scala 37:30]
  wire  _T_49 = 2'h3 == io_SWout; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_71 = _T_49 ? hi_hi_1 : 64'h0; // @[Conditional.scala 39:67 HashEngineReco.scala 223:17]
  wire [63:0] _GEN_72 = _T_47 ? HoldOut[191:128] : _GEN_71; // @[Conditional.scala 39:67 HashEngineReco.scala 220:17]
  wire [63:0] _GEN_73 = _T_45 ? HoldOut[127:64] : _GEN_72; // @[Conditional.scala 39:67 HashEngineReco.scala 217:17]
  Fifo FIFO ( // @[HashEngineReco.scala 76:22]
    .clock(FIFO_clock),
    .reset(FIFO_reset),
    .io_enq_val(FIFO_io_enq_val),
    .io_enq_rdy(FIFO_io_enq_rdy),
    .io_deq_val(FIFO_io_deq_val),
    .io_is_full(FIFO_io_is_full),
    .io_is_empty(FIFO_io_is_empty),
    .io_deq_rdy(FIFO_io_deq_rdy),
    .io_enq_dat(FIFO_io_enq_dat),
    .io_deq_dat(FIFO_io_deq_dat)
  );
  Permutation Permutation ( // @[HashEngineReco.scala 149:30]
    .io_State(Permutation_io_State),
    .io_i(Permutation_io_i),
    .io_b(Permutation_io_b),
    .io_StateR(Permutation_io_StateR)
  );
  assign io_H = _T_43 ? lo : _GEN_73; // @[Conditional.scala 40:58 HashEngineReco.scala 214:17]
  assign io_data_in_ready = curr_state == 3'h1; // @[HashEngineReco.scala 58:36]
  assign io_data_out_ready = DR; // @[HashEngineReco.scala 67:21 HashEngineReco.scala 68:27 HashEngineReco.scala 71:27]
  assign io_done = value_1 == 3'h4; // @[HashEngineReco.scala 210:32]
  assign io_opModeOut = operand; // @[HashEngineReco.scala 59:18]
  assign io_FifoReadyIn = FIFO_io_enq_rdy; // @[HashEngineReco.scala 100:20]
  assign FIFO_clock = clock;
  assign FIFO_reset = reset;
  assign FIFO_io_enq_val = test; // @[HashEngineReco.scala 79:21]
  assign FIFO_io_deq_rdy = io_data_in_ready; // @[HashEngineReco.scala 106:21]
  assign FIFO_io_enq_dat = io_M; // @[HashEngineReco.scala 108:21]
  assign Permutation_io_State = State; // @[HashEngineReco.scala 154:27]
  assign Permutation_io_i = i; // @[HashEngineReco.scala 151:23]
  assign Permutation_io_b = rounds; // @[HashEngineReco.scala 153:23]
  always @(posedge clock) begin
    if (reset) begin // @[HashEngineReco.scala 44:24]
      State <= 320'h0; // @[HashEngineReco.scala 44:24]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_opMode) begin // @[HashEngineReco.scala 124:25]
        State <= 320'h1470194fc6528a6738ec38ac0adffa72ec8e3296c76384cd6f6a54d7f52377da13c42a223be8d87;
      end else begin
        State <= 320'hee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140;
      end
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_pushData & FIFOReadyOut & ~FIFO_io_is_empty) begin // @[HashEngineReco.scala 130:67]
        State <= _T_13; // @[HashEngineReco.scala 131:23]
      end
    end else if (_T_15) begin // @[Conditional.scala 39:67]
      State <= _GEN_22;
    end
    if (reset) begin // @[HashEngineReco.scala 45:27]
      outState <= 64'h0; // @[HashEngineReco.scala 45:27]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (!(_T_8)) begin // @[Conditional.scala 39:67]
        if (!(_T_15)) begin // @[Conditional.scala 39:67]
          outState <= _GEN_30;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 49:29]
      curr_state <= 3'h0; // @[HashEngineReco.scala 49:29]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      curr_state <= 3'h1; // @[HashEngineReco.scala 126:24]
    end else if (_T_8) begin // @[Conditional.scala 39:67]
      if (io_pushData & FIFOReadyOut & ~FIFO_io_is_empty) begin // @[HashEngineReco.scala 130:67]
        curr_state <= 3'h2; // @[HashEngineReco.scala 132:28]
      end
    end else if (_T_15) begin // @[Conditional.scala 39:67]
      curr_state <= _GEN_24;
    end else begin
      curr_state <= _GEN_35;
    end
    if (reset) begin // @[HashEngineReco.scala 50:25]
      rounds <= 4'h0; // @[HashEngineReco.scala 50:25]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (!(_T_8)) begin // @[Conditional.scala 39:67]
        if (_T_15) begin // @[Conditional.scala 39:67]
          rounds <= _GEN_17;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 51:26]
      firstCH <= 1'h0; // @[HashEngineReco.scala 51:26]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (!(_T_8)) begin // @[Conditional.scala 39:67]
        if (!(_T_15)) begin // @[Conditional.scala 39:67]
          firstCH <= _GEN_29;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 52:21]
      DR <= 1'h0; // @[HashEngineReco.scala 52:21]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (!(_T_8)) begin // @[Conditional.scala 39:67]
        if (_T_15) begin // @[Conditional.scala 39:67]
          DR <= 1'h0; // @[HashEngineReco.scala 142:16]
        end else begin
          DR <= _GEN_31;
        end
      end
    end
    if (reset) begin // @[HashEngineReco.scala 53:26]
      operand <= 1'h0; // @[HashEngineReco.scala 53:26]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      operand <= io_opMode; // @[HashEngineReco.scala 127:21]
    end
    if (reset) begin // @[HashEngineReco.scala 56:20]
      i <= 4'h0; // @[HashEngineReco.scala 56:20]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (_T_8) begin // @[Conditional.scala 39:67]
        if (io_pushData & FIFOReadyOut & ~FIFO_io_is_empty) begin // @[HashEngineReco.scala 130:67]
          i <= 4'h0; // @[HashEngineReco.scala 133:19]
        end
      end else if (_T_15) begin // @[Conditional.scala 39:67]
        i <= _GEN_21;
      end else begin
        i <= _GEN_32;
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 1'h0; // @[Counter.scala 60:40]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (_T_8) begin // @[Conditional.scala 39:67]
        if (io_pushData & FIFOReadyOut & ~FIFO_io_is_empty) begin // @[HashEngineReco.scala 130:67]
          value <= _GEN_8;
        end
      end else if (_T_15) begin // @[Conditional.scala 39:67]
        value <= value + 1'h1; // @[Counter.scala 76:15]
      end else begin
        value <= _GEN_34;
      end
    end
    if (reset) begin // @[HashEngineReco.scala 62:25]
      length <= 16'h0; // @[HashEngineReco.scala 62:25]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      length <= 16'h100; // @[HashEngineReco.scala 125:20]
    end else if (!(_T_8)) begin // @[Conditional.scala 39:67]
      if (!(_T_15)) begin // @[Conditional.scala 39:67]
        length <= _GEN_33;
      end
    end
    if (reset) begin // @[HashEngineReco.scala 78:23]
      test <= 1'h0; // @[HashEngineReco.scala 78:23]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      test <= io_Fifoaccept;
    end else if (stateP) begin // @[Conditional.scala 39:67]
      test <= 1'h0; // @[HashEngineReco.scala 96:14]
    end
    if (reset) begin // @[HashEngineReco.scala 81:25]
      stateP <= 1'h0; // @[HashEngineReco.scala 81:25]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      stateP <= _GEN_2;
    end else if (stateP) begin // @[Conditional.scala 39:67]
      if (~io_Fifoaccept) begin // @[HashEngineReco.scala 93:29]
        stateP <= 1'h0; // @[HashEngineReco.scala 94:24]
      end
    end
    if (reset) begin // @[HashEngineReco.scala 191:26]
      HoldOut <= 256'h0; // @[HashEngineReco.scala 191:26]
    end else begin
      HoldOut <= _GEN_69[255:0];
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 3'h0; // @[Counter.scala 60:40]
    end else if (io_data_out_ready) begin // @[HashEngineReco.scala 193:36]
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
  _RAND_10 = {1{`RANDOM}};
  test = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stateP = _RAND_11[0:0];
  _RAND_12 = {8{`RANDOM}};
  HoldOut = _RAND_12[255:0];
  _RAND_13 = {1{`RANDOM}};
  value_1 = _RAND_13[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
