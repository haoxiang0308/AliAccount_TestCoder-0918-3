// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个示例坐标点
  val point = Point(3.5, 7.2)
  
  // 生成随机文件名
  val randomFileName = s"point_${System.currentTimeMillis()}_${scala.util.Random.nextInt(1000)}.scala"
  
  // 将样例类定义保存到随机命名的文件中
  import java.io.{File, PrintWriter}
  val file = new File(randomFileName)
  val writer = new PrintWriter(file)
  
  writer.write(
    s"""// 定义一个表示坐标点的样例类
       |case class Point(x: Double, y: Double) {
       |  override def toString: String = s"Point($$x, $$y)"
       |}
       |
       |// 示例使用
       |val point = Point(${point.x}, ${point.y})
       |println(point)
       |""".stripMargin
  )
  
  writer.close()
  
  println(s"样例类已保存到文件: $randomFileName")
  println(s"坐标点: $point")
}