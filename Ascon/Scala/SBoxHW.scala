package problems

import chisel3._
import chisel3.util._

class SBoxHW extends Module {
  val io = IO(new Bundle {
    val S = Input(UInt(320.W))
    val EN_IN = Input(Bool())
    val Sout = Output(UInt(320.W))
  })
  
  val outReg = RegInit(0.U(320.W))
 
  val x0 = WireInit(0.U(64.W))
  val x1 = WireInit(0.U(64.W))
  val x2 = WireInit(0.U(64.W))
  val x3 = WireInit(0.U(64.W))
  val x4 = WireInit(0.U(64.W))
  
  val outx0 = WireInit(0.U(64.W))
  val outx1 = WireInit(0.U(64.W))
  val outx2 = WireInit(0.U(64.W))
  val outx3 = WireInit(0.U(64.W))
  val outx4 = WireInit(0.U(64.W))

  //made in the form of round.h
  val step1x0 = WireInit(0.U(64.W))
  val step1x4 = WireInit(0.U(64.W))
  val step1x2 = WireInit(0.U(64.W))

  val step2x0 = WireInit(0.U(64.W))
  val step2x2 = WireInit(0.U(64.W))
  val step2x4 = WireInit(0.U(64.W))
  val step2x1 = WireInit(0.U(64.W))
  val step2x3 = WireInit(0.U(64.W))
  
  when(io.EN_IN)
  {

  x4 := io.S( 63,   0)
  x3 := io.S(127,  64)
  x2 := io.S(191, 128)
  x1 := io.S(255, 192)
  x0 := io.S(319, 256)

  step1x0 := x0 ^ x4
  step1x4 := x4 ^ x3
  step1x2 := x2 ^ x1

  step2x0 := step1x0 ^ ( ~x1 & step1x2   )
  step2x2 := step1x2 ^ ( ~x3 & step1x4   )
  step2x4 := step1x4 ^ ( ~step1x0 & x1   )
  step2x1 := x1   ^ ( ~step1x2 & x3   )
  step2x3 := x3   ^ ( ~step1x4 & step1x0 )

  outx1 := step2x1 ^ step2x0
  outx3 := step2x3 ^ step2x2
  outx0 := step2x0 ^ step2x4
  outx2 := ~step2x2
  outx4 := step2x4
  
  outReg := Cat(outx0,outx1,outx2,outx3,outx4)
  }.otherwise {
  outReg := outReg
  } 
  io.Sout := outReg
}
