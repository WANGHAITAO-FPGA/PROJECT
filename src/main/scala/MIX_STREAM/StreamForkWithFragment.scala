package MIX_STREAM

import spinal.core._
import spinal.lib.{Fragment, Stream, StreamForkArea, master, slave}

import scala.collection.Seq

case class StreamForkWithFragment[T <: Data](dataType: HardType[T], portCount: Int, synchronous: Boolean = false) extends Component {
  val io = new Bundle {
    val input = slave Stream(Fragment(dataType))
    val outputs = Vec(master Stream(Fragment(dataType)), portCount)
  }
  val logic = new StreamForkArea(io.input, io.outputs, synchronous)
}

class StreamForkAreaWithFragment[T <: Data](input : Stream[Fragment[T]], outputs : Seq[Stream[Fragment[T]]], synchronous: Boolean = false) extends Area {
  val portCount = outputs.size
  if (synchronous) {
    input.ready := outputs.map(_.ready).reduce(_ && _)
    outputs.foreach(_.valid := input.valid && input.ready)
    outputs.foreach(_.payload.fragment := input.payload.fragment)
    outputs.foreach(_.payload.last := input.payload.last)
  } else {
    /* Store if an output stream already has taken its value or not */
    val linkEnable = Vec(RegInit(True),portCount)

    /* Ready is true when every output stream takes or has taken its value */
    input.ready := True
    for (i <- 0 until portCount) {
      when(!outputs(i).ready && linkEnable(i)) {
        input.ready := False
      }
    }

    /* Outputs are valid if the input is valid and they haven't taken their value yet.
     * When an output fires, mark its value as taken. */
    for (i <- 0 until portCount) {
      outputs(i).valid := input.valid && linkEnable(i)
      outputs(i).payload.fragment := input.payload.fragment
      outputs(i).payload.last := input.payload.last
      when(outputs(i).fire) {
        linkEnable(i) := False
      }
    }

    /* Reset the storage for each new value */
    when(input.ready) {
      linkEnable.foreach(_ := True)
    }
  }
}
