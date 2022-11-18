package ENDAT

import spinal.core._
import spinal.lib._
import spinal.lib.com.spi.SpiKind
import spinal.lib.fsm.{EntryPoint, State, StateMachine}

import scala.util.Random
import scala.util.Random.nextBoolean

case class SsiInterface()  extends Bundle with IMasterSlave{
  val clk = Bool()
  val en = Bool()
  val data = Bool()
  override def asMaster(): Unit = {
    //out(clk)
    in(data,en,clk)
  }
}

case class SSI(datawidth : Int, clearcount : Int) extends Component{
  val io = new Bundle{
    val ssi = master(SsiInterface())
    val kind = in(SpiKind())
    val postion = out Bits(datawidth bits)  addTag(crossClockDomain)
//    val clk_counter = out UInt(log2Up(clearcount) bits)
//    val counter = out UInt(log2Up(datawidth*2) bits)
  }
  noIoPrefix()
  val sclk = Reg(Bool()) init False
  sclk := io.ssi.clk ^ io.kind.cpol ^ io.kind.cpha

  //val normalizedSclkEdges = (io.ssi.clk ^ io.kind.cpol ^ io.kind.cpha).edges()
  val counter = Counter(datawidth*2)
  val buffer = Reg(Bits(datawidth bits)) init 0
  buffer.addAttribute("MARK_DEBUG","TRUE")

  val clk_counter = Counter(clearcount)
  when(!io.ssi.clk){
    clk_counter.increment()
  }otherwise{
    clk_counter.clear()
  }

  when(clk_counter.willOverflow){
    counter.clear()
    buffer := 0
  } otherwise {
    when(sclk.rise){
      buffer := (buffer ## io.ssi.data).resized
    }
    when(sclk.edges().toggle){
      counter.increment()
    }
  }
  io.postion := EndiannessSwap(RegNextWhen(buffer,counter.willOverflow))
//  io.counter := counter
//  io.clk_counter := clk_counter
}

object SSI_Sim{
  import spinal.core.sim._
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.doSim(new SSI(32,100)){dut=>
      dut.clockDomain.forkStimulus(10)
      dut.io.ssi.clk #= false
      dut.io.kind.cpha #= false
      dut.io.kind.cpol #= false
      dut.io.ssi.data #= false
      dut.io.ssi.en #= true
      dut.clockDomain.waitSampling(50)
      dut.io.ssi.clk #= true
      dut.clockDomain.waitSampling()
      dut.io.ssi.clk #= false
      dut.clockDomain.waitSampling(500)
      dut.io.ssi.en #= false
      dut.clockDomain.waitSampling(20)
      for(i <- 0 until 32){
        dut.io.ssi.clk #= true
        dut.clockDomain.waitSampling(10)
        dut.io.ssi.clk #= false
        dut.io.ssi.data #= Random.nextBoolean()
        dut.clockDomain.waitSampling(10)
      }
      dut.clockDomain.waitSampling(20)
      dut.io.ssi.en #= true
      dut.clockDomain.waitSampling(549)
      dut.io.ssi.en #= false
      dut.clockDomain.waitSampling(20)
      for(i <- 0 until 32){
        dut.io.ssi.clk #= true
        dut.clockDomain.waitSampling(10)
        dut.io.ssi.clk #= false
        dut.io.ssi.data #= Random.nextBoolean()
        dut.clockDomain.waitSampling(10)
      }
      dut.clockDomain.waitSampling(20)
      dut.io.ssi.en #= true
      dut.clockDomain.waitSampling(500)
    }
  }
}



//case class SSI(ssi_clkToogle : Int,datawidth : Int, Wait_Tcnt : Int) extends Component{
//  val io = new Bundle{
//    val ssi = master(SsiInterface())
//    val sample = in Bool()
//    val postion = out Bits(datawidth bits)
//  }
//  noIoPrefix()
//
//  val timer = new Area{
//    val counter = Reg(UInt(log2Up(ssi_clkToogle)+1 bits))
//    val reset = False
//    val ssi_clkToogleHit = counter === ssi_clkToogle
//    counter := counter + 1
//    when(reset){
//      counter := 0
//    }
//  }
//
//  val ssi_clk = Reg(Bool()) init False
//  val en = Reg(Bool()) init True
//  en := io.ssi.en
//  val buffer = Reg(Bits(datawidth bits)) init 0
//  val postion = Reg(Bits(datawidth bits)) init 0  addTag(crossClockDomain)
//
//  val fsm = new StateMachine{
//    val counter = Reg(UInt(log2Up(Wait_Tcnt)+1 bits)) init 0
//    val Wait_Start: State = new State with EntryPoint {
//      whenIsActive{
//        when(en.fall()){
//          ssi_clk := False
//          timer.reset := True
//          counter := 0
//          buffer := 0
//          goto(Active_Cs)
//        }
//      }
//    }
//    val Active_Cs: State = new State{
//      whenIsActive{
//        when(timer.ssi_clkToogleHit){
//          timer.reset := True
//          goto(Get_Data)
//        }
//      }
//    }
////    val Dummy_State: State = new State{
////      whenIsActive{
////        when(timer.ssi_clkToogleHit){
////          ssi_clk := ~ssi_clk
////          timer.reset := True
////          goto(Get_Data)
////        }
////      }
////    }
//    val Get_Data: State = new State{
//      whenIsActive{
//        when(timer.ssi_clkToogleHit){
//          counter := counter + 1
//          ssi_clk := ~ssi_clk
//          timer.reset := True
//          when(!counter.lsb){
//            buffer := (buffer##io.ssi.data).resized
//          }
//          when(counter === (2*datawidth-2)){
//            counter := 0
//            goto(Wait_State)
//          }
//        }
//      }
//    }
//    val Wait_State: State = new State{
//      whenIsActive{
//        when(timer.ssi_clkToogleHit){
//          ssi_clk := False
//          postion := buffer
//          timer.reset := True
//          goto(Wait_Start)
//        }
//      }
//    }
//  }
//  io.ssi.clk := ssi_clk
//  io.postion := EndiannessSwap(postion)
//}
//
//object SSI{
//  import spinal.core.sim._
//  def main(args: Array[String]): Unit = {
//    SimConfig.withWave.doSim(new SSI(4,32,500)){dut=>
//      dut.clockDomain.forkStimulus(10)
//      dut.io.sample #= false
//      dut.io.ssi.en #= true
//      dut.clockDomain.waitSampling(10)
//      dut.io.sample #= true
//      dut.clockDomain.waitSampling()
//      //var t = true
//      dut.io.ssi.en #= false
//      for(idex <- 0 until 1000){
//        //dut.clockDomain.waitSamplingWhere(dut.io.ssi.clk.edge().toBoolean)
//        //t = !t
//        dut.io.ssi.data #= nextBoolean()
//        dut.clockDomain.waitSampling(8)
//      }
//      dut.io.ssi.en #= true
//      dut.clockDomain.waitSampling(1000)
//      dut.io.ssi.en #= false
//      for(idex <- 0 until 1000){
//        //dut.clockDomain.waitSamplingWhere(dut.io.ssi.clk.edge().toBoolean)
//        //t = !t
//        dut.io.ssi.data #= nextBoolean()
//        dut.clockDomain.waitSampling(8)
//      }
//      dut.io.ssi.en #= true
//      dut.clockDomain.waitSampling(1000)
//    }
//  }
//}




