package foobar

import chisel3._
import chisel3.util._

import foobar._
class Fifo ( val n: Int = 16)extends Module {
val io = IO(new Bundle {
val enq_val = Input(Bool())
val enq_rdy = Output(Bool())
val deq_val = Output(Bool())
val is_full = Output(Bool())
val is_empty = Output(Bool())
val deq_rdy = Input(Bool())
val enq_dat = Input(UInt(64.W))
val deq_dat = Output(UInt(64.W))
})
val enq_ptr= RegInit(0.U( log2Ceil(n).W))
val deq_ptr= RegInit(0.U( log2Ceil(n).W))
val do_enq = io.enq_rdy && io.enq_val
val do_deq = io.deq_rdy && io.deq_val
io.is_empty := !io.is_full && (enq_ptr === deq_ptr)


val deq_ptr_inc = deq_ptr + 1.U
val enq_ptr_inc = enq_ptr + 1.U

val is_full_next = RegInit(false.B)
is_full_next := Mux(do_enq && ~do_deq &&(enq_ptr_inc===deq_ptr),true.B,Mux(do_deq && io.is_full, false.B, io.is_full))


enq_ptr := Mux(do_enq, enq_ptr_inc, enq_ptr)
deq_ptr := Mux(do_deq, deq_ptr_inc, deq_ptr)
io.is_full := is_full_next
val ram = Mem(n,UInt(64.W))
when (do_enq) {
ram(enq_ptr) := io.enq_dat
}
io.enq_rdy := !io.is_full
io.deq_val := !io.is_empty
ram(deq_ptr) <> io.deq_dat
}
