package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._

class ConstantParamTestsU(c: ConstantParam) extends PeekPokeTester(c) {

    poke(c.io.i, 0)
    poke(c.io.a, 12)
    poke(c.io.b, 12)
    poke(c.io.EN_IN,true)
    poke(c.io.inCR, 0x00)
    step(1)

    expect(c.io.outCR,      BigInt("00000000000000000000000000000000000000000000F000000000000000000000000000000000",16))

    poke(c.io.i, 0)
    poke(c.io.a, 12)
    poke(c.io.b, 8)
    poke(c.io.inCR, 0x00)
    step(1)
    expect(c.io.outCR,  BigInt("00000000000000000000000000000000000000000000b400000000000000000000000000000000",16))


}

object ConstantParamTest {

  def run(args: Array[String]) {
    val (argsrest, opt) = TestUtil.getopts(args,
      Map("bw" -> "16") )

    val bwval = opt("bw").toInt
    println("FooTest: bitwidth=" + bwval)

    val dut = () => new ConstantParam()
    val tester = c => new ConstantParamTestsU(c)

    TestUtil.driverhelper(argsrest, dut, tester)
  }
}
