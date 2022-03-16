package xilinx



import XilinxDeviceFamily._
case class VivadoConfig(
                         xilinxDeviceFamily: XilinxDeviceFamily = Series7,
                         devicePart: String,
                         processortCount: Int
                       )