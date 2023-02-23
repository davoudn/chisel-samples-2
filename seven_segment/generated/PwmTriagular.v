module PwmTriagular(
  input        clock,
  input        reset,
  input  [7:0] io_totcyclesIn,
  input  [7:0] io_oncyclesIn,
  output [7:0] io_signalOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] countReg; // @[pwm.scala 37:25]
  reg [7:0] ampReg; // @[pwm.scala 38:23]
  wire [7:0] middle = io_totcyclesIn / 2'h2; // @[pwm.scala 42:28]
  wire [7:0] _countReg_T_2 = countReg + 8'h1; // @[pwm.scala 44:64]
  wire [7:0] _ampReg_T_2 = ampReg + 8'h1; // @[pwm.scala 45:47]
  wire [7:0] _ampReg_T_4 = ampReg - 8'h1; // @[pwm.scala 45:61]
  assign io_signalOut = countReg < io_oncyclesIn ? ampReg : 8'h0; // @[pwm.scala 47:22]
  always @(posedge clock) begin
    if (reset) begin // @[pwm.scala 37:25]
      countReg <= 8'h0; // @[pwm.scala 37:25]
    end else if (countReg == io_totcyclesIn) begin // @[pwm.scala 44:19]
      countReg <= 8'h0;
    end else begin
      countReg <= _countReg_T_2;
    end
    if (reset) begin // @[pwm.scala 38:23]
      ampReg <= 8'h0; // @[pwm.scala 38:23]
    end else if (countReg < middle) begin // @[pwm.scala 45:19]
      ampReg <= _ampReg_T_2;
    end else begin
      ampReg <= _ampReg_T_4;
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
  countReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  ampReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
