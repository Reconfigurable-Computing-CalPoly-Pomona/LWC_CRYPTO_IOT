package foobar

import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters.{Driver, PeekPokeTester}
import testutil._


class LPTestsU(c: LP) extends PeekPokeTester(c) {
    poke(c.io.S,0)
    poke(c.io.EN_IN,true)
    step(3)
    expect(c.io.SPrime,0)
    val in1 = BigInt("00000000000000F000000000000000F0FFFFFFFFFFFFFF0F00000000000000F000000000000000F0",16)
    poke(c.io.S,in1)
    step(1)
    val out1 = BigInt("1E0F00000000F000000001E00007703FFFFFFFFFFFFF743C780000000000F0E0000000780000F1",16)
    //val out1
    expect(c.io.SPrime,out1)
    //val in2 = BigInt("0000000011110000 0000000011110000 1111111100001111 0000000011110000 0000000011110000",16)
    //poke(c.io.S,in2)
    //step(3)
    //val out2 = BigInt("00020100000000100000000020000090400000000000001804080000000000102000000008000010",16)
    //expect(c.io.SPrime,out2)
}


object LPTest {

  def run(args: Array[String]) {
    val (argsrest, opt) = TestUtil.getopts(args,
      Map("bw" -> "16") )

    val bwval = opt("bw").toInt
    println("FooTest: bitwidth=" + bwval)

    val dut = () => new LP()
    val tester = c => new LPTestsU(c)

    TestUtil.driverhelper(argsrest, dut, tester)
  }
}
