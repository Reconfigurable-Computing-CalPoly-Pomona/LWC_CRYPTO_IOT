package problems

import chisel3._
import chisel3.util._

class ConstantParam extends Module {
  val io = IO(new Bundle {
    val i = Input(UInt(4.W))
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val EN_IN = Input(Bool())
    val inCR = Input(UInt(320.W))
    val outCR = Output(UInt(320.W))
  })

//i = current number of rounds
//a = max rounds
//b = rounds to go?
//inCR = input CR to be XOR'd
//outCR = output

//only performing on last 8 bits as input of X2
val r = Wire(UInt(8.W))
val x2c = Reg(UInt(8.W))
x2c := io.inCR(136,128)
r := io.i + io.a - io.b

val outReg = Reg(UInt(8.W))
when (io.EN_IN) 
{
  when ( r === 0.U ) { outReg := x2c ^ 0xf0.U }
  .elsewhen( r === 1.U) { outReg := x2c ^ 0xe1.U }
  .elsewhen( r === 2.U) { outReg := x2c ^ 0xd2.U }
  .elsewhen( r === 3.U) { outReg := x2c ^ 0xc3.U }
  .elsewhen( r === 4.U) { outReg := x2c ^ 0xb4.U }
  .elsewhen( r === 5.U) { outReg := x2c ^ 0xa5.U }
  .elsewhen( r === 6.U) { outReg := x2c ^ 0x96.U }
  .elsewhen( r === 7.U) { outReg := x2c ^ 0x87.U }
  .elsewhen( r === 8.U) { outReg := x2c ^ 0x78.U }
  .elsewhen( r === 9.U) { outReg := x2c ^ 0x69.U }
  .elsewhen( r === 10.U) { outReg := x2c ^ 0x5a.U }
  .elsewhen( r === 11.U) { outReg := x2c ^ 0x4b.U }
  .otherwise { outReg := 0.U } 
}

io.outCR := Cat(io.inCR(319,136),outReg,io.inCR(127,0))
}
