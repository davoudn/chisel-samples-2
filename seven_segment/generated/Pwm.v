module Pwm(
  input        clock,
  input        reset,
  input  [7:0] io_totcyclesIn,
  input  [7:0] io_oncyclesIn,
  output       io_signalOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] countReg; // @[pwm.scala 20:25]
  wire [7:0] _countReg_T_2 = countReg + 8'h1; // @[pwm.scala 22:64]
  reg  stateReg; // @[pwm.scala 24:22]
  assign io_signalOut = stateReg; // @[pwm.scala 27:15]
  always @(posedge clock) begin
    if (reset) begin // @[pwm.scala 20:25]
      countReg <= 8'h0; // @[pwm.scala 20:25]
    end else if (countReg == io_totcyclesIn) begin // @[pwm.scala 22:19]
      countReg <= 8'h0;
    end else begin
      countReg <= _countReg_T_2;
    end
    stateReg <= countReg < io_oncyclesIn; // @[pwm.scala 25:24]
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
  countReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  stateReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
