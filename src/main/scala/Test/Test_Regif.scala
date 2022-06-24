package Test

import SimpleBus._
import spinal.core._
import spinal.lib.bus.regif.AccessType.RO
import spinal.lib.slave

case class Test_Regif(addrwidth : Int, datawidth : Int) extends Component{
  val io = new Bundle{
    val simplebus = slave(SimpleBus(SimpleBusConfig(addrwidth,datawidth)))
  }
  noIoPrefix()

  val busslave = SpBusInterface(io.simplebus,(0x0000, 1000 Byte))

    val My_Reg_HEADER = busslave.newReg(doc="帧头")
    val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
    HEADER := 0x00F1F2F3

    val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
    val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
    Slaveid := 0x0000000F

    val My_Reg_Address = busslave.newReg(doc="地址")
    val Address = My_Reg_Address.field(32 bits,RO,0,"地址")
    Address := 0x20220523

    val My_Reg_DA1 = busslave.newReg(doc="地址")
    val DA1 = My_Reg_DA1.field(32 bits,RO,0,"地址")
    DA1 := 0x7FFE8003

    val My_Reg_DA2 = busslave.newReg(doc="地址")
    val DA2 = My_Reg_DA2.field(32 bits,RO,0,"地址")
    DA2 := 0x7FFD8005

    val My_Reg_DA3 = busslave.newReg(doc="地址")
    val DA3 = My_Reg_DA3.field(32 bits,RO,0,"地址")
    DA3 := 0x7FFC8007

    val My_Reg_DA4 = busslave.newReg(doc="地址")
    val DA4 = My_Reg_DA4.field(32 bits,RO,0,"地址")
    DA4 := 0x7FFB8009

    /*******************************************ELEC************************************************/
    val My_Reg_Data1 = busslave.newReg(doc="数据")
    val Data1 = My_Reg_Data1.field(32 bits,RO,0,"数据")
    Data1 := 0x7FFA800A

    val My_Reg_Data2 = busslave.newReg(doc="数据")
    val Data2 = My_Reg_Data2.field(32 bits,RO,0,"数据")
    Data2 := 0x7FFFFFFF

    val My_Reg_Data3 = busslave.newReg(doc="数据")
    val Data3 = My_Reg_Data3.field(32 bits,RO,0,"数据")
    Data3 := 0x7FFFFFFF

    val My_Reg_Data4 = busslave.newReg(doc="数据")
    val Data4 = My_Reg_Data4.field(32 bits,RO,0,"数据")
    Data4 := 0x00000000

    val My_Reg_Data5 = busslave.newReg(doc="数据")
    val Data5 = My_Reg_Data5.field(32 bits,RO,0,"数据")
    Data5 := 0x00000000

    val My_Reg_Data6 = busslave.newReg(doc="数据")
    val Data6 = My_Reg_Data6.field(32 bits,RO,0,"数据")
    Data6 := 0x000000B1


    /*******************************************压电********************************************/

    val My_Reg1_Data1 = busslave.newReg(doc="数据")
    val E_Data1 = My_Reg1_Data1.field(32 bits,RO,0,"数据")
    E_Data1 := 0x01030000

    val My_Reg1_Data2 = busslave.newReg(doc="数据")
    val E_Data2 = My_Reg1_Data2.field(32 bits,RO,0,"数据")
    E_Data2 := 0x0001840a

    val My_Reg1_Data3 = busslave.newReg(doc="数据")
    val E_Data3 = My_Reg1_Data3.field(32 bits,RO,0,"数据")
    E_Data3 := 0x00000000

    val My_Reg1_Data4 = busslave.newReg(doc="数据")
    val E_Data4 = My_Reg1_Data4.field(32 bits,RO,0,"数据")
    E_Data4 := 0x00000000

    val My_Reg1_Data5 = busslave.newReg(doc="数据")
    val E_Data5 = My_Reg1_Data5.field(32 bits,RO,0,"数据")
    E_Data5 := 0x00000000

    val My_Reg1_Data6 = busslave.newReg(doc="数据")
    val E_Data6 = My_Reg1_Data6.field(32 bits,RO,0,"数据")
    E_Data6 := 0x000000B1

    /*******************************************尾部********************************************/
    val My_Reg_Crc = busslave.newReg(doc="帧头")
    val Crc = My_Reg_Crc.field(32 bits,RO,0,"帧头")
    Crc := 0x01A2A3A4

    val My_Reg_End = busslave.newReg(doc="帧头")
    val End = My_Reg_End.field(32 bits,RO,0,"帧头")
    End := 0x0000FFBD

//  val My_Reg_HEADER = busslave.newReg(doc="帧头")
//  val HEADER = My_Reg_HEADER.field(32 bits,RO,0,"帧头")
//  HEADER := 0x0000FFBC
//
//  val My_Reg_Slaveid = busslave.newReg(doc="板卡识别号")
//  val Slaveid = My_Reg_Slaveid.field(32 bits,RO,0,"板卡识别号")
//  Slaveid := 0x00000001
//
//  val My_Reg_Address = busslave.newReg(doc="地址")
//  val Address = My_Reg_Address.field(32 bits,RO,0,"地址")
//  Address := 0x0000991C
//
//  val My_Reg_DA1 = busslave.newReg(doc="地址")
//  val DA1 = My_Reg_DA1.field(32 bits,RO,0,"地址")
//  DA1 := 0x7FFF8000
//
//  val My_Reg_DA2 = busslave.newReg(doc="地址")
//  val DA2 = My_Reg_DA2.field(32 bits,RO,0,"地址")
//  DA2 := 0x7FFF8000
//
//  val My_Reg_DA3 = busslave.newReg(doc="地址")
//  val DA3 = My_Reg_DA3.field(32 bits,RO,0,"地址")
//  DA3 := 0x7FFF8000
//
//  val My_Reg_DA4 = busslave.newReg(doc="地址")
//  val DA4 = My_Reg_DA4.field(32 bits,RO,0,"地址")
//  DA4 := 0x7FFF8000
//
//  /*******************************************ELEC************************************************/
//  val My_Reg_Data1 = busslave.newRegAt(address = 40,doc="数据")
//  val Data1 = My_Reg_Data1.field(32 bits,RO,0,"数据")
//  Data1 := 0x01030000
//
//  val My_Reg_Data2 = busslave.newReg(doc="数据")
//  val Data2 = My_Reg_Data2.field(32 bits,RO,0,"数据")
//  Data2 := 0x0001840a
//
//  val My_Reg_Data3 = busslave.newReg(doc="数据")
//  val Data3 = My_Reg_Data3.field(32 bits,RO,0,"数据")
//  Data3 := 0x00000000
//
//  val My_Reg_Data4 = busslave.newReg(doc="数据")
//  val Data4 = My_Reg_Data4.field(32 bits,RO,0,"数据")
//  Data4 := 0x00000000
//
//  val My_Reg_Data5 = busslave.newReg(doc="数据")
//  val Data5 = My_Reg_Data5.field(32 bits,RO,0,"数据")
//  Data5 := 0x00000000
//
//  val My_Reg_Data6 = busslave.newReg(doc="数据")
//  val Data6 = My_Reg_Data6.field(32 bits,RO,0,"数据")
//  Data6 := 0x000000B1
//
//
//  /*******************************************压电********************************************/
//
//  val My_Reg1_Data1 = busslave.newRegAt(address = 104,doc="数据")
//  val E_Data1 = My_Reg1_Data1.field(32 bits,RO,0,"数据")
//  E_Data1 := 0x01030000
//
//  val My_Reg1_Data2 = busslave.newReg(doc="数据")
//  val E_Data2 = My_Reg1_Data2.field(32 bits,RO,0,"数据")
//  E_Data2 := 0x0001840a
//
//  val My_Reg1_Data3 = busslave.newReg(doc="数据")
//  val E_Data3 = My_Reg1_Data3.field(32 bits,RO,0,"数据")
//  E_Data3 := 0x00000000
//
//  val My_Reg1_Data4 = busslave.newReg(doc="数据")
//  val E_Data4 = My_Reg1_Data4.field(32 bits,RO,0,"数据")
//  E_Data4 := 0x00000000
//
//  val My_Reg1_Data5 = busslave.newReg(doc="数据")
//  val E_Data5 = My_Reg1_Data5.field(32 bits,RO,0,"数据")
//  E_Data5 := 0x00000000
//
//  val My_Reg1_Data6 = busslave.newReg(doc="数据")
//  val E_Data6 = My_Reg1_Data6.field(32 bits,RO,0,"数据")
//  E_Data6 := 0x000000B1
//
//  /*******************************************尾部********************************************/
//  val My_Reg_Crc = busslave.newReg(doc="帧头")
//  val Crc = My_Reg_Crc.field(32 bits,RO,0,"帧头")
//  Crc := 0x01A2A3A4
//
//  val My_Reg_End = busslave.newReg(doc="帧头")
//  val End = My_Reg_End.field(32 bits,RO,0,"帧头")
//  End := 0x0000FFBD

}
