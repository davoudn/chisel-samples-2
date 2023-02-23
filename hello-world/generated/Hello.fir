circuit Hello :
  module Hello :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sw : UInt<2>, led : UInt<1>, led2 : UInt<1>}

    reg cntReg0 : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Hello.scala 23:24]
    reg cntReg1 : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Hello.scala 24:24]
    reg blkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Hello.scala 25:23]
    reg blkReg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Hello.scala 26:23]
    reg swbln : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Hello.scala 27:23]
    wire flag0 : UInt<1>
    flag0 <= UInt<1>("h0")
    node _T = eq(flag0, UInt<1>("h0")) @[Hello.scala 31:13]
    when _T : @[Hello.scala 31:21]
      node _cntReg0_T = add(cntReg0, UInt<1>("h1")) @[Hello.scala 32:22]
      node _cntReg0_T_1 = tail(_cntReg0_T, 1) @[Hello.scala 32:22]
      cntReg0 <= _cntReg0_T_1 @[Hello.scala 32:11]
    node _T_1 = eq(flag0, UInt<1>("h1")) @[Hello.scala 35:14]
    when _T_1 : @[Hello.scala 35:22]
      node _cntReg1_T = add(cntReg1, UInt<1>("h1")) @[Hello.scala 36:22]
      node _cntReg1_T_1 = tail(_cntReg1_T, 1) @[Hello.scala 36:22]
      cntReg1 <= _cntReg1_T_1 @[Hello.scala 36:11]
    node _T_2 = eq(cntReg0, UInt<15>("h61a7")) @[Hello.scala 39:16]
    when _T_2 : @[Hello.scala 39:27]
      cntReg0 <= UInt<1>("h0") @[Hello.scala 40:12]
      flag0 <= UInt<1>("h1") @[Hello.scala 41:12]
      node _blkReg_T = not(blkReg) @[Hello.scala 42:15]
      blkReg <= _blkReg_T @[Hello.scala 42:12]
    node _T_3 = eq(cntReg1, UInt<8>("hf9")) @[Hello.scala 44:16]
    when _T_3 : @[Hello.scala 44:27]
      cntReg1 <= UInt<1>("h0") @[Hello.scala 45:12]
      flag0 <= UInt<1>("h0") @[Hello.scala 46:12]
      node _blkReg_T_1 = not(blkReg) @[Hello.scala 47:15]
      blkReg <= _blkReg_T_1 @[Hello.scala 47:12]
    node _T_4 = eq(io.sw, UInt<1>("h0")) @[Hello.scala 49:14]
    when _T_4 : @[Hello.scala 49:22]
      blkReg2 <= UInt<1>("h0") @[Hello.scala 50:11]
    io.led <= blkReg @[Hello.scala 56:10]
    io.led2 <= blkReg2 @[Hello.scala 57:10]

