package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._

class PermutationTestsU(c: Permutation) extends PeekPokeTester(c) {
    poke(c.io.State,0)
    poke(c.io.i,0)
    poke(c.io.a,12)
    poke(c.io.b,12)
    poke(c.io.EN_IN,true)
    step(5)
    expect(c.io.StateR,BigInt("1E0F00000000F000000001E00007703FFFFFFFFFFFFF743C780000000000F00000000000000000",16))
    /*val in1 = BigInt("00000000000000010000000000000001000000000000000100000000000000010000000000000001",16)
    poke(c.io.State,in1)
    poke(c.io.i,0)
    poke(c.io.a,0)
    poke(c.io.b,0)
    step(1)
    val out1 = BigInt("00002010000000010000000002000009840000000000000100408000000000010200000000800001",16)
    expect(c.io.StateR,out1)
    */
}

object PermutationTest {

  def run(args: Array[String]) {
    val (argsrest, opt) = TestUtil.getopts(args,
      Map("bw" -> "16") )

    val bwval = opt("bw").toInt
    println("FooTest: bitwidth=" + bwval)

    val dut = () => new Permutation()
    val tester = c => new PermutationTestsU(c)

    TestUtil.driverhelper(argsrest, dut, tester)
  }
}
