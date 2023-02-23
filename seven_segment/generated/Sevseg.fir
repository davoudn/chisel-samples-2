circuit Sevseg :
  module Sevseg :
    input clock : Clock
    input reset : UInt<1>
    output io : { digit : UInt<8>, flip sw : UInt<4>}

    wire result : UInt<8> @[sg.scala 19:21]
    result <= UInt<1>("h0") @[sg.scala 20:10]
    node _T = eq(UInt<1>("h1"), io.sw) @[sg.scala 21:18]
    when _T : @[sg.scala 21:18]
      result <= UInt<1>("h1") @[sg.scala 22:27]
    else :
      node _T_1 = eq(UInt<2>("h2"), io.sw) @[sg.scala 21:18]
      when _T_1 : @[sg.scala 21:18]
        result <= UInt<2>("h2") @[sg.scala 23:27]
      else :
        node _T_2 = eq(UInt<2>("h3"), io.sw) @[sg.scala 21:18]
        when _T_2 : @[sg.scala 21:18]
          result <= UInt<3>("h4") @[sg.scala 24:27]
        else :
          node _T_3 = eq(UInt<3>("h4"), io.sw) @[sg.scala 21:18]
          when _T_3 : @[sg.scala 21:18]
            result <= UInt<4>("h8") @[sg.scala 25:27]
          else :
            node _T_4 = eq(UInt<3>("h5"), io.sw) @[sg.scala 21:18]
            when _T_4 : @[sg.scala 21:18]
              result <= UInt<5>("h10") @[sg.scala 26:27]
            else :
              node _T_5 = eq(UInt<3>("h6"), io.sw) @[sg.scala 21:18]
              when _T_5 : @[sg.scala 21:18]
                result <= UInt<6>("h20") @[sg.scala 27:27]
              else :
                node _T_6 = eq(UInt<3>("h7"), io.sw) @[sg.scala 21:18]
                when _T_6 : @[sg.scala 21:18]
                  result <= UInt<7>("h41") @[sg.scala 28:27]
                else :
                  node _T_7 = eq(UInt<4>("h8"), io.sw) @[sg.scala 21:18]
                  when _T_7 : @[sg.scala 21:18]
                    result <= UInt<8>("h80") @[sg.scala 29:27]
    io.digit <= result @[sg.scala 31:12]

