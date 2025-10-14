// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

object PointApp extends App {
  // 创建一个 Point 实例
  val myPoint = Point(3.5, 7.2)
  println(s"Created point: $myPoint")

  // 将 Point 实例的信息写入一个随机命名的文件
  val fileName = s"point_data_${scala.util.Random.nextInt(10000)}.txt"
  import java.io.PrintWriter
  val writer = new PrintWriter(fileName)
  writer.write(myPoint.toString)
  writer.close()
  println(s"Point data saved to file: $fileName")
}