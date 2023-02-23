/*
 * Dummy file to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */



import chisel3._
import chisel3.util._
import sevseg_pack._

class Pwm extends Module {
  val io = IO(new Bundle {
    val totcyclesIn = Input (UInt(8.W))
    val oncyclesIn  = Input (UInt(8.W))
    val signalOut   = Output(UInt(1.W))
  })
  val countReg = RegInit(0.U(8.W))

  countReg := Mux ( countReg === io.totcyclesIn, 0.U, countReg + 1.U )

  val stateReg = Reg ( Bool() )
  stateReg := countReg < io.oncyclesIn

  io.signalOut:= stateReg
}


class PwmTriagular extends Module {
  val io = IO(new Bundle {
    val totcyclesIn = Input (UInt(8.W))
    val oncyclesIn  = Input (UInt(8.W))
    val signalOut   = Output(UInt(8.W))
  })
  val countReg = RegInit(0.U(8.W))
  val ampReg = RegInit(0.U(8.W))

  val middle = Wire (UInt(8.W))

  middle := io.totcyclesIn / 2.U

  countReg := Mux ( countReg === io.totcyclesIn, 0.U, countReg + 1.U )
  ampReg   := Mux ( countReg < middle, ampReg + 1.U, ampReg - 1.U )

  io.signalOut:= Mux ( countReg < io.oncyclesIn, ampReg, 0.U)
}




object AddMain extends App {
  println("Generating the adder hardware")
  emitVerilog(new PwmTriagular(), Array("--target-dir", "generated"))
}
