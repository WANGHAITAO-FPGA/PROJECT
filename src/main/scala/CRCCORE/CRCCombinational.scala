package CRCCORE

import CRCCORE.{CRC5, CRCPolynomial, PolynomialGF2}
import spinal.core._
import spinal.lib.bus.misc.BusSlaveFactory
import spinal.lib.{EndiannessSwap, Reverse, slave}

import scala.collection.mutable.ListBuffer

/**
 * CRC combinational
 *
 * Doc :
 *   - http://www.sigmatone.com/utilities/crc_generator/crc_generator.htm
 *   - http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
 *   - http://crccalc.com/
 */


/**
 * CRC Configuration
 *
 * @param crcConfig : String representing the equation
 * @param dataWidth : Bus data width
 */
case class CRCCombinationalConfig(
                                   crcConfig : CRCPolynomial,
                                   dataWidth : BitCount
                                 ){
  val crcWidth = crcConfig.polynomial.order bits
}


object CRCCombinationalCmdMode extends SpinalEnum{
  val INIT, UPDATE = newElement()
}


case class CRCCombinationalCmd(g: CRCCombinationalConfig) extends Bundle{
  val mode = CRCCombinationalCmdMode()
  val data = Bits(g.dataWidth)
}


case class CRCCombinationalIO(g: CRCCombinationalConfig) extends Bundle{

  val cmd = slave Flow(CRCCombinationalCmd(g))
  val crc = out Bits(g.crcWidth)
  val nextcrc = out Bits(g.crcWidth)

  /** Drive IO from a bus */
  def driveFrom(busCtrl: BusSlaveFactory, baseAddress: Int = 0) = new Area {

    busCtrl.driveFlow(cmd, baseAddress + 0x00)

    busCtrl.read(crc, baseAddress + 0x08)

    busCtrl.read(nextcrc, baseAddress + 0x10)
  }
}


/**
 * CRC Combinational component
 */
class CRCCombinational(g: CRCCombinationalConfig) extends Component{

  //assert(g.dataWidth.value % 8 == 0, "Currently support only datawidth multiple of 8")
  //assert(g.crcConfig.polynomial.order % 8 == 0, "Currently support only polynomial degree multiple of 8")

  import CRCCombinationalCmdMode._

  val io = CRCCombinationalIO(g)

  // Input operation
  val crc_reg  = Reg(cloneOf(io.crc)) init g.crcConfig.initValue
  //val dataIn   = if(g.crcConfig.inputReflected) EndiannessSwap(Reverse(io.cmd.data))  else io.cmd.data
  val dataIn   = if(g.crcConfig.inputReflected && g.dataWidth.value >= 8) EndiannessSwap(Reverse(io.cmd.data))
                 else if(g.crcConfig.inputReflected && g.dataWidth.value < 8) Reverse(io.cmd.data)
                 else io.cmd.data

  // Compute the CRC
  val next_crc = CRCCombinationalCore(dataIn, crc_reg, g.crcConfig.polynomial)

  // Init
  when(io.cmd.valid && io.cmd.mode === INIT){
    crc_reg := B(g.crcConfig.initValue, io.crc.getWidth bits)
  }

  // Update
  when(io.cmd.valid && io.cmd.mode === UPDATE){
    crc_reg := next_crc
  }

  // Output operation
  val result_reflected = if(g.crcConfig.outputReflected) Reverse(crc_reg) else crc_reg

  io.crc := result_reflected ^ B(g.crcConfig.finalXor, crc_reg.getWidth bits)
  io.nextcrc := next_crc
}


/**
 * CRC combinational core
 */
object CRCCombinationalCore {


  case class Register(name: String, index: Int){
    def ==(that: Register): Boolean = {
      return this.name == that.name && this.index == that.index
    }

    override def toString: String = s"${name}(${index})"
  }

  /**
   * Creaete a CRC combinational core
   * @param data       : data input of the crc
   * @param crc        : current crc value
   * @param polynomial : CRC polynomial
   * @return newCRC
   */
  def apply(data: Bits, crc: Bits, polynomial: PolynomialGF2) : Bits ={

    val newCRC = cloneOf(crc)

    val listXor = lfsrCRCGenerator(polynomial, data.getWidth)

    for(i <- 0 until crc.getWidth){
      newCRC(i) := listXor(i).map(t => if (t.name == "D") data(t.index) else crc(t.index)).reduce(_ ^ _)
    }

    newCRC
  }

  /**
   * Use a LFSR to compute the xor combination for each index in order to perform the CRC in one clock
   *
   * Rule : Build a LFSR from a polynomial :
   *                1 * x^0 = 1 => feedback
   *                1 * x^n     => x^n xor x^(n-1)
   *                0 * x^0     => do noting
   *
   * e.g : x^3+x+1
   *
   *          /-------------------------------------------XOR<-- D2,D1,D0
   *          |   ____     |      ____              ____   |
   *          \->|_C0_|---XOR--->|_C1_|------------|_C2_|--/
   *      0:       c0              c1                c2         D2,D1,D0
   *      1:      c2^d2         c0^c2^d2             c1         D1,D0
   *      2:      c1^d1        c2^d2^c1^d1        c0^c2^d2      D0
   *      3:   c0^c2^d2^d0   c1^d1^c0^c2^d2^d0   c2^d2^c1^d1    -
   *
   *      crc(0) = c0^c2^d2^d0
   *      crc(1) = c1^d1^c0^c2^d2^d0
   *      crc(2) = c2^d2^c1^d1
   */
  def lfsrCRCGenerator(polynomial: PolynomialGF2, dataWidth: Int):List[List[Register]]={

    assert(dataWidth <= polynomial.order, "dataWidth can't be bigger than the polynomial length")

    val listPolynomial = polynomial.toBooleanList()
    val lenLFSR        = polynomial.order  // nbr of register used by the LFSR

    // initialize the LFSR register
    var lfsr = (for(i <- 0 until lenLFSR) yield List(Register("C", i))).toList

    // execute the LFSR dataWidth number of time
    for(j <- 0 until dataWidth) {

      val result = new ListBuffer[List[Register]]()
      result += lfsr(lenLFSR - 1) ::: List(Register("D", dataWidth - 1 - j))

      for (i <- 1 until lenLFSR) {
        if (listPolynomial(lenLFSR - i) == false) {
          result += lfsr(i - 1)
        } else {
          result += lfsr(i - 1) ::: lfsr(lenLFSR - 1) ::: List(Register("D", dataWidth - 1  - j))
        }
      }

      lfsr = result.toList
    }

    // Simplify (odd number => replace by one occurrence, even number => remove all occurrence)
    val finalRes = new ListBuffer[List[Register]]()
    for(lt <- lfsr){
      val listD = (for(i <- 0 until lenLFSR if (lt.count(_ == Register("D", i)) % 2  == 1)) yield Register("D", i)).toList
      val listC = (for(i <- 0 until lenLFSR if (lt.count(_ == Register("C", i)) % 2  == 1)) yield Register("C", i)).toList
      finalRes += (listD ++ listC)
    }

    finalRes.toList
  }
}

/*object crc_test{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new CRCCombinational(CRCCombinationalConfig(CRC8.Standard, 8 bits))){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(10)
      dut.io.cmd.mode #= CRCCombinationalCmdMode.INIT
      dut.io.cmd.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.cmd.mode #= CRCCombinationalCmdMode.UPDATE
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0x12
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(200)
    }
  }
}*/

object crc_test{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new CRCCombinational(CRCCombinationalConfig(CRC5.ENDAT, 1 bits))){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(10)
      dut.io.cmd.mode #= CRCCombinationalCmdMode.INIT
      dut.io.cmd.valid #= true
      dut.clockDomain.waitSampling()
      dut.io.cmd.mode #= CRCCombinationalCmdMode.UPDATE

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 1
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()

      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()
      dut.io.cmd.valid #= true
      dut.io.cmd.data #= 0
      dut.clockDomain.waitSampling()


      dut.io.cmd.valid #= false
      dut.clockDomain.waitSampling(200)
    }
  }
}
