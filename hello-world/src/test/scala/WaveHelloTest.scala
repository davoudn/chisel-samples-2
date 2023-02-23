import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class WaveHelloTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "Hello"
  " Waveform " should "pass" in {
    test(new Hello). withAnnotations (Seq( WriteVcdAnnotation )) { dut =>
    for (_ <- 0 until 100000) {
      dut.clock.setTimeout(0)
        dut.clock.step(1)
        dut.io.led.peek()
        dut.io.sw.poke(0)
        dut.io.led2.peek()
      }
      println("\nEnd the blinking LED")
    }
  }
}
