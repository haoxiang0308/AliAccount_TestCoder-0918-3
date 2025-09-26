case class Point(x: Double, y: Double)

object Main extends App {
  val p1 = Point(3.5, 4.2)
  val p2 = Point(1.0, 2.0)

  println(s"Point 1: $p1")
  println(s"Point 2: $p2")
  println(s"Are they equal? ${p1 == p2}")
}