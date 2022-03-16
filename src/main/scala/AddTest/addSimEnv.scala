package AddTest
/*
import spinal.core._
import spinal.core.sim._
import scala.collection.mutable
import org.

case class data(
               data1:Int,
               data2:Int,
               var sum:Int=0
               )

case class addSimEnv(period:Int,dataWidth:Int) extends add(dataWidth){
  private val dataTestQueue = mutable.Queue[data]()
  private val sumRefQueue = mutable.Queue[data]()
  private val sumResultQueue = mutable.Queue[Int]()

  private def init={
    clockDomain.forkStimulus(10)
    dataIn.valid #= false
    clockDomain.waitSampling(10)
  }

  private def referenceModel(dataTest:data)={
    dataTest.sum = dataTest.data1 + dataTest.data2
    sumRefQueue.enqueue(dataTest)
  }
  private def portInDriver()={
    val drv= fork{
      while(true){
        if(dataTestQueue.nonEmpty){
          val dataTest = dataTestQueue.dequeue()
          referenceModel(dataTest)
          dataIn.valid #= true
          dataIn.data1 #= dataTest.data1
          dataIn.data2 #= dataTest.data2
          clockDomain.waitSampling()
          dataIn.valid #= false
        }
        else
          clockDomain.waitSampling()
      }
    }
  }
  private def portOutMon()={
    val mon = fork{
      while(true){
        if(sum.valid.toBoolean) {
          sumResultQueue.enqueue(sum.payload.toInt)
        }
        clockDomain.waitSampling()
      }
    }
  }
  private def scoreBoard()={
    val score = fork{
      while(true){
        if(sumRefQueue.nonEmpty && sumResultQueue.nonEmpty){
          val sumRef = sumRefQueue.dequeue()
          val sumActula = sumResultQueue.dequeue()
          assert(sumRef.sum == sumActula,s"data Missmatch ref: ${sumRef},actual sum value $sumActula")
        }
        clockDomain.waitSampling()
      }
    }
  }
  def simEnvStart()={
    init
    portInDriver()
    portOutMon()
    scoreBoard()
  }

  def waitSimDone()={
    clockDomain.waitSampling(10)
    while (sumRefQueue.nonEmpty || sumResultQueue.nonEmpty){
      clockDomain.waitSampling(10)
    }
  }

  def insertData(dataTest:data)={
    dataTestQueue.enqueue(dataTest)
  }
}


class addSimTab extends FunSuite{

}*/