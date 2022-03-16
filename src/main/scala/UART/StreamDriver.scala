package UART

import spinal.core._
import spinal.core.sim._
import spinal.lib.Stream

case class StreamDriver[T <: BitVector](bus : Stream[T]){
  private def clock = bus.getComponent().clockDomain

  def initBus():Unit={
    bus.valid #= false
  }

  def driveArray(data:Array[Int]):Unit={
    data.foreach{d=>
      bus.valid #= true
      bus.payload #= d
      clock.waitActiveEdgeWhere(bus.ready.toBoolean)
    }
    bus.valid #= false
  }
}

