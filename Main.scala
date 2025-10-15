import scala.util.Random
import java.io.PrintWriter
import java.io.File

object Main extends App {
  // 创建一个坐标点实例
  val point = Point(3.5, 7.2)
  
  // 生成随机文件名
  val randomFileName = s"point_${Random.nextInt(10000)}.txt"
  val file = new File(randomFileName)
  
  // 将坐标点信息写入文件
  val writer = new PrintWriter(file)
  writer.write(point.toString)
  writer.close()
  
  println(s"坐标点已保存到文件: $randomFileName")
  println(s"文件内容: ${point.toString}")
}