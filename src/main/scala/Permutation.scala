package foobar

import chisel3._
import chisel3.util._

import foobar._

//permutation layer of ASCON performing Pl o Ps o Pc
class Permutation extends Module {
 val io = IO(new Bundle {
   val State = Input(UInt(320.W))
   val i = Input(UInt(4.W))
   val a = Input(UInt(4.W))
   val b = Input(UInt(4.W))
   val EN_IN = Input(Bool())
   val StateR = Output(UInt(320.W))
   })


//constant layer
val Pc = Module(new ConstantParam() )
//init
Pc.io.i := io.i
Pc.io.a := io.a
Pc.io.b := io.b
Pc.io.EN_IN := io.EN_IN
Pc.io.inCR := io.State

//SBox substitution layer
val Ps = Module(new SBoxHW() )
//init
Ps.io.S := Pc.io.outCR
Ps.io.EN_IN := io.EN_IN	

//linear diff layer
val Pl = Module( new LP() )
//init
Pl.io.S := Ps.io.Sout
Pl.io.EN_IN := io.EN_IN
//output after round

io.StateR := Pl.io.SPrime

}

