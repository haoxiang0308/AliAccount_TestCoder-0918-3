// 定义一个表示二维坐标点的样例类
case class Point(x: Double, y: Double)

// 伴生对象，包含一些辅助方法
object Point {
  // 计算原点 (0, 0) 的工厂方法
  def origin: Point = Point(0, 0)

  // 从极坐标创建点的工厂方法
  def fromPolar(radius: Double, angle: Double): Point = 
    Point(radius * math.cos(angle), radius * math.sin(angle))
}