// Point.scala
// 定义一个表示二维坐标点的样例类

/**
 * 表示一个二维坐标点
 * @param x x坐标
 * @param y y坐标
 */
case class Point(x: Double, y: Double) {
  // 计算到原点的距离
  def distanceFromOrigin: Double = math.sqrt(x * x + y * y)

  // 重写toString方法，提供更可读的输出
  override def toString: String = s"Point($x, $y)"
}