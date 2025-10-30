object PatternMatchingExample extends App {
  def matchExample(x: Any): String = x match {
    case i: Int if i > 0 => s"Positive integer: $i"
    case i: Int if i < 0 => s"Negative integer: $i"
    case 0 => "Zero"
    case s: String if s.nonEmpty => s"Non-empty string: $s"
    case "" => "Empty string"
    case _: Double => "A double value"
    case _ => "Unknown type or value"
  }

  // Ejemplos de uso
  println(matchExample(42))
  println(matchExample(-5))
  println(matchExample(0))
  println(matchExample("Hello"))
  println(matchExample(""))
  println(matchExample(3.14))
  println(matchExample(true))
}