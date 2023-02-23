circuit PwmTriagular :
  module PwmTriagular :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip totcyclesIn : UInt<8>, flip oncyclesIn : UInt<8>, signalOut : UInt<8>}

    reg countReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[pwm.scala 37:25]
    reg ampReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[pwm.scala 38:23]
    wire middle : UInt<8> @[pwm.scala 40:21]
    node _middle_T = div(io.totcyclesIn, UInt<2>("h2")) @[pwm.scala 42:28]
    middle <= _middle_T @[pwm.scala 42:10]
    node _countReg_T = eq(countReg, io.totcyclesIn) @[pwm.scala 44:30]
    node _countReg_T_1 = add(countReg, UInt<1>("h1")) @[pwm.scala 44:64]
    node _countReg_T_2 = tail(_countReg_T_1, 1) @[pwm.scala 44:64]
    node _countReg_T_3 = mux(_countReg_T, UInt<1>("h0"), _countReg_T_2) @[pwm.scala 44:19]
    countReg <= _countReg_T_3 @[pwm.scala 44:12]
    node _ampReg_T = lt(countReg, middle) @[pwm.scala 45:30]
    node _ampReg_T_1 = add(ampReg, UInt<1>("h1")) @[pwm.scala 45:47]
    node _ampReg_T_2 = tail(_ampReg_T_1, 1) @[pwm.scala 45:47]
    node _ampReg_T_3 = sub(ampReg, UInt<1>("h1")) @[pwm.scala 45:61]
    node _ampReg_T_4 = tail(_ampReg_T_3, 1) @[pwm.scala 45:61]
    node _ampReg_T_5 = mux(_ampReg_T, _ampReg_T_2, _ampReg_T_4) @[pwm.scala 45:19]
    ampReg <= _ampReg_T_5 @[pwm.scala 45:12]
    node _io_signalOut_T = lt(countReg, io.oncyclesIn) @[pwm.scala 47:33]
    node _io_signalOut_T_1 = mux(_io_signalOut_T, ampReg, UInt<1>("h0")) @[pwm.scala 47:22]
    io.signalOut <= _io_signalOut_T_1 @[pwm.scala 47:15]

