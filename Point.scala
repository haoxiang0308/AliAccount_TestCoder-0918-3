import scala.util.Random
import java.io.{File, PrintWriter}

// 定义坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个坐标点实例
  val point = Point(3.5, 7.2)
  println(s"创建的坐标点: $point")
  
  // 生成随机文件名
  val randomFileName = s"point_${Random.nextInt(10000)}.txt"
  println(s"随机生成的文件名: $randomFileName")
  
  // 将坐标点信息保存到随机命名的文件中
  val writer = new PrintWriter(new File(randomFileName))
  writer.write(point.toString)
  writer.close()
  
  println(s"坐标点已保存到文件: $randomFileName")
}