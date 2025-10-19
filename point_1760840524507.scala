// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

// 示例点实例
val point = Point(3.5, 4.2)
println(point)
