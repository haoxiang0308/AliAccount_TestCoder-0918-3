// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个坐标点实例
  val point = Point(3.5, 4.2)
  
  // 生成随机文件名
  val randomFileName = s"point_${System.currentTimeMillis()}.scala"
  
  // 将样例类定义保存到随机命名的文件中
  import java.io.PrintWriter
  val writer = new PrintWriter(randomFileName)
  writer.write(
    s"""// 定义一个表示坐标点的样例类
       |case class Point(x: Double, y: Double) {
       |  override def toString: String = s"Point($$x, $$y)"
       |}
       |
       |// 示例点实例
       |val point = Point(${point.x}, ${point.y})
       |println(point)
       |""".stripMargin
  )
  writer.close()
  
  println(s"样例类已保存到文件: $randomFileName")
  println(s"坐标点: $point")
}