package foobar

import chisel3._
import chisel3.util._

import foobar.Permutation


class HashEngineReco extends Module { //assuming rate of 64, to be modulated
  val io = IO(new Bundle {
    val M = Input(UInt(64.W))
    val accept = Input(Bool())
    val finalMessage = Input(Bool())//both final message input and compute hash requirement
    val H = Output(UInt(64.W))// Size of rate possibly, Will be 256 in Hash or HashA arrangement
    val data_out_ready = Output(Bool())
    val data_in_ready = Output(Bool())
    val opMode = Input(UInt(1.W))
    val opModeOut = Output(UInt(1.W))
  })

    /*def PrecomputedStates(in: UInt) = {
        val out = 0.U
        when(in === 1.U){
            out := BigInt("01470194fc6528a6738ec38ac0adffa72ec8e3296c76384cd6f6a54d7f52377da13c42a223be8d87",16).U
        }
        .otherwise{
            out := BigInt("ee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140",16).U
        }
        val put = out
    }*/

    //ROM for arrangements of ASCON
    //val states = VecInit(BigInt("ee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140",16),BigInt("01470194fc6528a6738ec38ac0adffa72ec8e3296c76384cd6f6a54d7f52377da13c42a223be8d87",16))
    //val PrecomputedStates = states(counter(m.length.U))//fill with precomputed states for a given arrangement
    val aSets = RegInit(VecInit(Seq(12,12).map(_.asUInt(4.W))))//fill with a rounds for arragements
    val bSets = RegInit(VecInit(Seq(12,8).map(_.asUInt(4.W))))//fill with b rounds for arragements
    val desiredLength = 256.U//RegInit(VecInit(Seq.fill(2)(256.U(16.W))))//fill with hash output lengths

    //states for rate and capacity
    val State = RegInit(0.U(320.W))
    val outState = RegInit(0.U(64.W))//size of rate

    //FSM for running engine and flags
    val startup :: messagestage :: runperm :: computehash :: complete :: Nil = Enum(5)
    val curr_state = RegInit(startup)
    val rounds = RegInit(0.U(4.W))
    val firstCH = RegInit(0.U(1.W))
    val DR = RegInit(0.U(1.W))
    val operand = RegInit(0.U(1.W))

    //Module and module wires
    val i = RegInit(0.U(4.W))
    val count = Counter(2)
    io.data_in_ready := curr_state === messagestage
    io.opModeOut := operand

    //length
    val length = RegInit(0.U(16.W))

    io.H := outState
    when(DR === 1.U){
        io.data_out_ready := true.B
    }
    .otherwise{
        io.data_out_ready := false.B
    }
    
    switch(curr_state){
        is(startup){
            State := Mux(io.opMode === 1.U,BigInt("01470194fc6528a6738ec38ac0adffa72ec8e3296c76384cd6f6a54d7f52377da13c42a223be8d87",16).U,BigInt("ee9398aadb67f03d8bb21831c60f1002b48a92db98d5da6243189921b8f8e3e8348fa5c9d525e140",16).U)//(io.opMode)
            length := desiredLength//(io.opMode)
            curr_state := messagestage
            operand := io.opMode
        }
        is(messagestage){
            when(io.accept){
                State := State ^ Cat(io.M,0.U(256.W))
                curr_state := runperm
                i := 0.U
                when(count.value === 0.U){
                    count.inc()
                }
            }
        }
        is(runperm){
            DR := 0.U
            when(io.finalMessage && (firstCH === 0.U)){
                rounds := aSets(operand)//a
            }
            .otherwise{
                rounds := bSets(operand)//b
            }
            val perm = Module(new Permutation())
            perm.io.EN_IN := true.B
            perm.io.i := i
            perm.io.a := aSets(operand)
            perm.io.b := rounds //depends on a or b round
            perm.io.State := State
            count.inc()
            when(count.value === 0.U){ //perm is done
                i := i + 1.U
                State := perm.io.StateR
                when(i === rounds - 1.U){ //finished expected rounds
                    perm.io.EN_IN := false.B
                    when(io.finalMessage){
                        curr_state := computehash
                    }
                    .otherwise{
                        curr_state := messagestage
                    }
                }
            }
        }
        is(computehash){
            firstCH := 1.U
            outState := State(319,256)
            DR := 1.U
            i := 0.U
            length := length - 64.U //length - rate
            when(count.value === 0.U){ 
                count.inc()
            }
            when(length === 64.U){//size of rate thus final cycle
                curr_state := complete
            }
            .otherwise{
                curr_state := runperm
            }
        }
        is(complete){
            DR := 0.U
            curr_state := complete//is done
        }
    }
}