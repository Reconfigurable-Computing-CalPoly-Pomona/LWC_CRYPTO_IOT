package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._

class SBoxHWTestsU(c: SBoxHW) extends PeekPokeTester(c) {
  poke(c.io.EN_IN,true)
  val in1 = BigInt("00400c0000000100000000000000000000000000000000F000000000000000000000000000000000",16)
  poke(c.io.S,in1)
  step(10)
  expect(c.io.Sout,BigInt("400C00000001F000400C00000001F0FFFFFFFFFFFFFF0F00400C00000001F00000000000000000",16))
  /*
  //poke(c.io.x0,1)
  //poke(c.io.x1,1)
  //poke(c.io.x2,1)
  //poke(c.io.x3,1)
  //poke(c.io.x4,3) //LSB
//hex 10 & 1f
  //expect(c.io.outx0,1)
  //expect(c.io.outx1,2)
  //expect(c.io.outx2,2)
  //expect(c.io.outx3,3)
  //expect(c.io.outx4,3)//LSB
//hex 4 & 1e

  */
}

object SBoxHWTest {

  def run(args: Array[String]) {
    val (argsrest, opt) = TestUtil.getopts(args,
      Map("bw" -> "16") )

    val bwval = opt("bw").toInt
    println("FooTest: bitwidth=" + bwval)

    val dut = () => new SBoxHW()
    val tester = c => new SBoxHWTestsU(c)

    TestUtil.driverhelper(argsrest, dut, tester)
  }
}
