package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._


class HashEngineRecoTestsU(c: HashEngineReco) extends PeekPokeTester(c) {
	poke(c.io.M,0)
}


object HashEngineRecoTest {

  def run(args: Array[String]) {
    val (argsrest, opt) = TestUtil.getopts(args,
      Map("bw" -> "16") )

    val bwval = opt("bw").toInt
    println("FooTest: bitwidth=" + bwval)

    val dut = () => new HashEngineReco()
    val tester = c => new HashEngineRecoTestsU(c)

    TestUtil.driverhelper(argsrest, dut, tester)
  }
}
