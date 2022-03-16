name := "EMIF_Test"

version := "0.1"

scalaVersion := "2.12.2"

val spinalVersion = "1.6.1"

libraryDependencies ++= Seq(
  "com.github.spinalhdl" % "spinalhdl-core_2.12" % spinalVersion,
  "com.github.spinalhdl" % "spinalhdl-lib_2.12" % spinalVersion,
  compilerPlugin("com.github.spinalhdl" % "spinalhdl-idsl-plugin_2.12" % spinalVersion),
  "org.scalatest" %% "scalatest" % "3.0.8" % "test"
)

fork := true