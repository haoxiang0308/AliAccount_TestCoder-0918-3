// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

object Point extends App {
  // 创建一个Point实例
  val myPoint = Point(1.5, 2.7)
  println(s"Created point: $myPoint")

  // 生成一个随机文件名
  val randomFileName = s"/workspace/scala_points/point_data_${scala.util.Random.nextInt(10000)}.scala"
  println(s"Saving point data to: $randomFileName")

  // 将点的信息写入随机命名的文件
  import java.io.PrintWriter
  val writer = new PrintWriter(randomFileName)
  try {
    writer.println(s"// Data for point instance")
    writer.println(s"val pointInstance = Point(${myPoint.x}, ${myPoint.y})")
  } finally {
    writer.close()
  }

  println("Point data saved successfully.")
}
