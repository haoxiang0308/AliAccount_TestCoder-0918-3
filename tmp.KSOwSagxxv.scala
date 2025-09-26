// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double)

// 伴生对象中可以包含主函数用于测试
object Point {
  def main(args: Array[String]): Unit = {
    val p1 = Point(1.0, 2.0)
    val p2 = Point(3.0, 4.0)
    println(s"Point 1: $p1")
    println(s"Point 2: $p2")
    println(s"Are they equal? ${p1 == p2}")
  }
}