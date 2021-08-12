package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._

class FifoTestsU(c: Fifo) extends PeekPokeTester(c) {
	expect(c.io.is_empty,1)	//empty fifo
	poke(c.io.enq_dat,5) 		//ready val 5 to queue
	expect(c.io.enq_rdy,1) 	//checkk if fifo ready
	poke(c.io.enq_val,1) 		//push data
	step(5)
	poke(c.io.deq_val,1) 		//request push
	expect(c.io.deq_dat,5) 	//get fifo data
}

object FifoTest {

  def run(args: Array[String]) {
    val (argsrest, opt) = TestUtil.getopts(args,
      Map("bw" -> "16") )

    val bwval = opt("bw").toInt
    println("FooTest: bitwidth=" + bwval)

    val dut = () => new Fifo(bwval)
    val tester = c => new FifoTestsU(c)

    TestUtil.driverhelper(argsrest, dut, tester)
  }
}