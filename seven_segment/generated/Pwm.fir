circuit Pwm :
  module Pwm :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip totcyclesIn : UInt<8>, flip oncyclesIn : UInt<8>, signalOut : UInt<1>}

    reg countReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[pwm.scala 20:25]
    node _countReg_T = eq(countReg, io.totcyclesIn) @[pwm.scala 22:30]
    node _countReg_T_1 = add(countReg, UInt<1>("h1")) @[pwm.scala 22:64]
    node _countReg_T_2 = tail(_countReg_T_1, 1) @[pwm.scala 22:64]
    node _countReg_T_3 = mux(_countReg_T, UInt<1>("h0"), _countReg_T_2) @[pwm.scala 22:19]
    countReg <= _countReg_T_3 @[pwm.scala 22:12]
    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[pwm.scala 24:22]
    node _stateReg_T = lt(countReg, io.oncyclesIn) @[pwm.scala 25:24]
    stateReg <= _stateReg_T @[pwm.scala 25:12]
    io.signalOut <= stateReg @[pwm.scala 27:15]

