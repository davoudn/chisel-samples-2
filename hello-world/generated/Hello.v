module Hello(
  input        clock,
  input        reset,
  input  [1:0] io_sw,
  output       io_led,
  output       io_led2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cntReg0; // @[Hello.scala 23:24]
  reg [31:0] cntReg1; // @[Hello.scala 24:24]
  reg  blkReg; // @[Hello.scala 25:23]
  wire  _T_2 = cntReg0 == 32'h61a7; // @[Hello.scala 39:16]
  wire  flag0 = cntReg1 == 32'hf9 ? 1'h0 : _T_2; // @[Hello.scala 44:27 46:12]
  wire [31:0] _cntReg0_T_1 = cntReg0 + 32'h1; // @[Hello.scala 32:22]
  wire [31:0] _cntReg1_T_1 = cntReg1 + 32'h1; // @[Hello.scala 36:22]
  wire  _blkReg_T = ~blkReg; // @[Hello.scala 42:15]
  assign io_led = blkReg; // @[Hello.scala 56:10]
  assign io_led2 = 1'h0; // @[Hello.scala 57:10]
  always @(posedge clock) begin
    if (reset) begin // @[Hello.scala 23:24]
      cntReg0 <= 32'h0; // @[Hello.scala 23:24]
    end else if (cntReg0 == 32'h61a7) begin // @[Hello.scala 39:27]
      cntReg0 <= 32'h0; // @[Hello.scala 40:12]
    end else if (~flag0) begin // @[Hello.scala 31:21]
      cntReg0 <= _cntReg0_T_1; // @[Hello.scala 32:11]
    end
    if (reset) begin // @[Hello.scala 24:24]
      cntReg1 <= 32'h0; // @[Hello.scala 24:24]
    end else if (cntReg1 == 32'hf9) begin // @[Hello.scala 44:27]
      cntReg1 <= 32'h0; // @[Hello.scala 45:12]
    end else if (flag0) begin // @[Hello.scala 35:22]
      cntReg1 <= _cntReg1_T_1; // @[Hello.scala 36:11]
    end
    if (reset) begin // @[Hello.scala 25:23]
      blkReg <= 1'h0; // @[Hello.scala 25:23]
    end else if (cntReg1 == 32'hf9) begin // @[Hello.scala 44:27]
      blkReg <= _blkReg_T; // @[Hello.scala 47:12]
    end else if (cntReg0 == 32'h61a7) begin // @[Hello.scala 39:27]
      blkReg <= ~blkReg; // @[Hello.scala 42:12]
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
  cntReg0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  blkReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
