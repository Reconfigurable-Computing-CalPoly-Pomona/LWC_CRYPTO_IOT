package foobar

import chisel3._
import chisel3.util._

//A Linear Diffusion Permutation for the ASCON engine
class LP extends Module {
  val io = IO(new Bundle {
    val S    = Input(UInt(320.W))
    val EN_IN = Input(Bool())
    val SPrime  = Output(UInt(320.W))
  })
  //temp value to be stored to output on clock
  val state = RegInit(0.U(320.W))
    //Performs actions bases on p_L from paper in ASCON
    //Split state into 5 64-bit values
    val x0 = WireInit(0.U(64.W))
    val x1 = WireInit(0.U(64.W))
    val x2 = WireInit(0.U(64.W))
    val x3 = WireInit(0.U(64.W))
    val x4 = WireInit(0.U(64.W))

    val x0Prime = WireInit(0.U(64.W))
    val x1Prime = WireInit(0.U(64.W))
    val x2Prime = WireInit(0.U(64.W))
    val x3Prime = WireInit(0.U(64.W))
    val x4Prime = WireInit(0.U(64.W))
  when ( io.EN_IN)
  {

    x4 := io.S( 63,   0)
    x3 := io.S(127,  64)
    x2 := io.S(191, 128)
    x1 := io.S(255, 192)
    x0 := io.S(319, 256)

    //Perform linear diffusion
    val x0Prime = Wire(UInt(64.W))
    val x1Prime = Wire(UInt(64.W))
    val x2Prime = Wire(UInt(64.W))
    val x3Prime = Wire(UInt(64.W))
    val x4Prime = Wire(UInt(64.W))
    x0Prime := x0 ^ Cat(x0(18, 0),x0(63, 19)) ^ Cat(x0(27, 0),x0(63, 28))
    x1Prime := x1 ^ Cat(x1(60, 0),x1(63, 61)) ^ Cat(x1(38, 0), x1(63, 39))
    x2Prime := x2 ^ Cat(x2(0),    x2(63, 1))  ^ Cat(x2(5, 0), x2(63, 6))
    x3Prime := x3 ^ Cat(x3(9, 0), x3(63, 10)) ^ Cat(x3(16, 0),x3(63, 17))
    x4Prime := x4 ^ Cat(x4(6, 0), x4(63, 7))  ^ Cat(x4(40, 0),x4(63, 41)) 
    //Concatenate and send to out
    state := Cat(x0Prime,x1Prime,x2Prime,x3Prime,x4Prime)
  }
  io.SPrime := state
}
