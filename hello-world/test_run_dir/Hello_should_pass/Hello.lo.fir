circuit Hello :
  module Hello :
    input clock : Clock
    input reset : UInt<1>
    input io_sw : UInt<2>
    output io_led : UInt<1>
    output io_led2 : UInt<1>

    reg cntReg0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntReg0) @[Hello.scala 23:24]
    reg cntReg1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntReg1) @[Hello.scala 24:24]
    reg blkReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), blkReg) @[Hello.scala 25:23]
    reg blkReg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), blkReg2) @[Hello.scala 26:23]
    reg swbln : UInt<1>, clock with :
      reset => (UInt<1>("h0"), swbln) @[Hello.scala 27:23]
    node _T_3 = eq(cntReg1, UInt<8>("hf9")) @[Hello.scala 44:16]
    node _T_2 = eq(cntReg0, UInt<15>("h61a7")) @[Hello.scala 39:16]
    node _GEN_3 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Hello.scala 39:27 41:12]
    node _GEN_6 = mux(_T_3, UInt<1>("h0"), _GEN_3) @[Hello.scala 44:27 46:12]
    node flag0 = _GEN_6
    node _T = eq(flag0, UInt<1>("h0")) @[Hello.scala 31:13]
    node _cntReg0_T = add(cntReg0, UInt<1>("h1")) @[Hello.scala 32:22]
    node _cntReg0_T_1 = tail(_cntReg0_T, 1) @[Hello.scala 32:22]
    node _GEN_0 = mux(_T, _cntReg0_T_1, cntReg0) @[Hello.scala 31:21 32:11 23:24]
    node _T_1 = eq(flag0, UInt<1>("h1")) @[Hello.scala 35:14]
    node _cntReg1_T = add(cntReg1, UInt<1>("h1")) @[Hello.scala 36:22]
    node _cntReg1_T_1 = tail(_cntReg1_T, 1) @[Hello.scala 36:22]
    node _GEN_1 = mux(_T_1, _cntReg1_T_1, cntReg1) @[Hello.scala 35:22 36:11 24:24]
    node _blkReg_T = not(blkReg) @[Hello.scala 42:15]
    node _GEN_2 = mux(_T_2, UInt<1>("h0"), _GEN_0) @[Hello.scala 39:27 40:12]
    node _GEN_4 = mux(_T_2, _blkReg_T, blkReg) @[Hello.scala 39:27 42:12 25:23]
    node _blkReg_T_1 = not(blkReg) @[Hello.scala 47:15]
    node _GEN_5 = mux(_T_3, UInt<1>("h0"), _GEN_1) @[Hello.scala 44:27 45:12]
    node _GEN_7 = mux(_T_3, _blkReg_T_1, _GEN_4) @[Hello.scala 44:27 47:12]
    node _T_4 = eq(io_sw, UInt<1>("h0")) @[Hello.scala 49:14]
    node _GEN_8 = mux(_T_4, UInt<1>("h0"), blkReg2) @[Hello.scala 49:22 50:11 26:23]
    io_led <= blkReg @[Hello.scala 56:10]
    io_led2 <= blkReg2 @[Hello.scala 57:10]
    cntReg0 <= mux(reset, UInt<32>("h0"), _GEN_2) @[Hello.scala 23:{24,24}]
    cntReg1 <= mux(reset, UInt<32>("h0"), _GEN_5) @[Hello.scala 24:{24,24}]
    blkReg <= mux(reset, UInt<1>("h0"), _GEN_7) @[Hello.scala 25:{23,23}]
    blkReg2 <= mux(reset, UInt<1>("h0"), _GEN_8) @[Hello.scala 26:{23,23}]
    swbln <= mux(reset, UInt<1>("h0"), swbln) @[Hello.scala 27:{23,23,23}]
