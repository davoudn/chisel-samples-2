/*
 * Dummy file to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

package sevseg_pack

import chisel3._
import chisel3.util._

class Sevseg extends Module {
  val io = IO(new Bundle {
    val digit = Output(UInt(8.W))
    val sw = Input(UInt(4.W))
  })

  val result = Wire (UInt(8.W))
  result := 0.U
  switch (io.sw) {
  is ("b0001".U) { result := "b00000001".U}
  is ("b0010".U) { result := "b00000010".U}
  is ("b0011".U) { result := "b00000100".U}
  is ("b0100".U) { result := "b00001000".U}
  is ("b0101".U) { result := "b00010000".U}
  is ("b0110".U) { result := "b00100000".U}
  is ("b0111".U) { result := "b01000001".U}
  is ("b1000".U) { result := "b10000000".U}
  }
  io.digit := result
}

object AddMain extends App {
  println("Generating the adder hardware")
  emitVerilog(new Sevseg(), Array("--target-dir", "generated"))
}
