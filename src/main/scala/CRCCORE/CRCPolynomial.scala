package CRCCORE

import CRCCORE.{PolynomialGF2, crypto}
import crypto._


/**
 * Class used to define the configuration of a CRC
 * @param polynomial      : CRC polynomial
 * @param initValue       : init value of the CRC
 * @param inputReflected  : if true the input is reflected  (inverse)
 * @param outputReflected : if true the output is reflected (inverse)
 * @param finalXor        : this value is xor with the ouptut result
 */
class CRCPolynomial(
                     val polynomial      : PolynomialGF2,
                     val initValue       : BigInt,
                     val inputReflected  : Boolean,
                     val outputReflected : Boolean,
                     val finalXor        : BigInt
                   )


/**
 * Define all CRC 32
 */
object CRC32 {
  def Standard  = new CRCPolynomial(polynomial = p"32'x04C11DB7", initValue = BigInt("FFFFFFFF", 16), inputReflected = true,  outputReflected = true,  finalXor = BigInt("FFFFFFFF", 16))
  def XFER      = new CRCPolynomial(polynomial = p"32'x000000AF", initValue = BigInt("00000000", 16), inputReflected = false, outputReflected = false, finalXor = BigInt("00000000", 16))
  def MPEG2     = new CRCPolynomial(polynomial = p"32'x04C11DB7", initValue = BigInt("FFFFFFFF", 16), inputReflected = false,  outputReflected = false,  finalXor = BigInt("00000000", 16))
}


/**
 * Define all CRC 16
 */
object CRC16 {
  def XModem    = new CRCPolynomial(polynomial = p"16'x1021", initValue = BigInt("0000", 16), inputReflected = false, outputReflected = false, finalXor = BigInt("0000", 16))
}


/**
 * Define all CRC 8
 */
object CRC8 {
  def Standard  = new CRCPolynomial(polynomial = p"8'x07", initValue = BigInt("00", 16), inputReflected = false, outputReflected = false, finalXor = BigInt("00", 16))
  def DARC      = new CRCPolynomial(polynomial = p"8'x39", initValue = BigInt("00", 16), inputReflected = true,  outputReflected = true,  finalXor = BigInt("00", 16))
}

object CRC5 {
  def USB = new CRCPolynomial(polynomial = p"5'x05", initValue = BigInt("1F", 16), inputReflected = true, outputReflected = true, finalXor = BigInt("1F", 16))
  def ENDAT = new CRCPolynomial(polynomial = p"5'x0B", initValue = BigInt("1F", 16), inputReflected = false, outputReflected = false, finalXor = BigInt("1F", 16))
}
