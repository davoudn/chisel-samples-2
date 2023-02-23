module Sevseg(
  input        clock,
  input        reset,
  output [7:0] io_digit,
  input  [3:0] io_sw
);
  wire [7:0] _GEN_0 = 4'h8 == io_sw ? 8'h80 : 8'h0; // @[sg.scala 20:10 21:18 29:27]
  wire [7:0] _GEN_1 = 4'h7 == io_sw ? 8'h41 : _GEN_0; // @[sg.scala 21:18 28:27]
  wire [7:0] _GEN_2 = 4'h6 == io_sw ? 8'h20 : _GEN_1; // @[sg.scala 21:18 27:27]
  wire [7:0] _GEN_3 = 4'h5 == io_sw ? 8'h10 : _GEN_2; // @[sg.scala 21:18 26:27]
  wire [7:0] _GEN_4 = 4'h4 == io_sw ? 8'h8 : _GEN_3; // @[sg.scala 21:18 25:27]
  wire [7:0] _GEN_5 = 4'h3 == io_sw ? 8'h4 : _GEN_4; // @[sg.scala 21:18 24:27]
  wire [7:0] _GEN_6 = 4'h2 == io_sw ? 8'h2 : _GEN_5; // @[sg.scala 21:18 23:27]
  assign io_digit = 4'h1 == io_sw ? 8'h1 : _GEN_6; // @[sg.scala 21:18 22:27]
endmodule
