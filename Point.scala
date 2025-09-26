// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

object PointApp extends App {
  // 创建一个 Point 实例
  val myPoint = Point(3.5, 7.2)
  println(s"创建的点是: $myPoint")

  // 将 Point 实例的信息写入一个随机命名的文件
  import java.io.PrintWriter
  import scala.util.Random

  val randomFileName = s"random_output_${Random.nextInt(10000)}.txt"
  val writer = new PrintWriter(randomFileName)
  writer.write(s"Point coordinates: (${myPoint.x}, ${myPoint.y})\n")
  writer.close()
  println(s"点的信息已保存到文件: $randomFileName")
}