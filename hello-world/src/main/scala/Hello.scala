/*
 * This code is a minimal hardware described in Chisel.
 * 
 * Blinking LED: the FPGA version of Hello World
 */

import chisel3._

/**
 * The blinking LED component.
 */

class Hello extends Module {
  val io = IO(new Bundle {
  val sw = Input(UInt (2.W))
  val led = Output (UInt (1.W))
  val led2= Output (UInt (1.W))
  })

  val CNT_0 = (50000 / 2 - 1).U
  val CNT_1 = (500  / 2 - 1).U

  val cntReg0 = RegInit(0.U(32.W))
  val cntReg1 = RegInit(0.U(32.W))
  val blkReg = RegInit(0.U(1.W))
  val blkReg2= RegInit(0.U(1.W))
  val swbln  = RegInit(0.U(1.W))
  val flag0  = WireDefault (0.U(1.W))
// seems it is the main loop !!
//
 when(flag0 === 0.U){ 
  cntReg0 := cntReg0 + 1.U
 }

  when(flag0 === 1.U){
  cntReg1 := cntReg1 + 1.U
 }

  when(cntReg0 === CNT_0) {
    cntReg0:= 0.U
    flag0  := 1.U
    blkReg := ~blkReg
  }
  when(cntReg1 === CNT_1) {
    cntReg1:= 0.U
    flag0  := 0.U
    blkReg := ~blkReg
  }
when ( io.sw === 0.U){
  blkReg2 := 0.U
}
//when ( io.sw === 1.U){
// io.led2 := 1.U
//} 

  io.led := blkReg
  io.led2:= blkReg2 
// end of loop
}

/**
 * An object extending App to generate the Verilog code.
 */
object Hello extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Hello(), Array("--target-dir", "generated"))
}
