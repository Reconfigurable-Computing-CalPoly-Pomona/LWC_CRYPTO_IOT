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
