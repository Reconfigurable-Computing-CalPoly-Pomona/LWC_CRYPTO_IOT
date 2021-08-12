package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._


class HashEngineRecoTestsU(c: HashEngineReco) extends PeekPokeTester(c) {
	poke(c.io.opMode,0)
	poke(c.io.SWout,3)
	poke(c.io.finalMessage,0)
	poke(c.io.pushData,1)
	step(1)
	poke(c.io.Fifoaccept,1)
	poke(c.io.M,BigInt("8000000000000000",16))
	step(1)
	poke(c.io.Fifoaccept,0)
	step(1)
	poke(c.io.finalMessage,1)
	step(200)
	expect(c.io.done,1)
	
	poke(c.io.SWout,0)
	expect(c.io.H,BigInt("7346BC14F036E87A",16))
	step(5)
	poke(c.io.SWout,1)
	expect(c.io.H,BigInt("E03D0997913088F5",16))
	step(5)
	poke(c.io.SWout,2)
	expect(c.io.H,BigInt("F68411434B3CF8B5",16))
	step(5)
	poke(c.io.SWout,3)	
	expect(c.io.H,BigInt("4FA796A80D251F91",16))
	step(5)

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
