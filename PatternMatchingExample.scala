object PatternMatchingExample extends App {
  def describeValue(x: Any): String = x match {
    case 0 => "Zero"
    case i: Int if i > 0 => s"Positive integer: $i"
    case i: Int => s"Negative integer: $i"
    case s: String if s.isEmpty => "Empty string"
    case s: String => s"String: $s"
    case _: List[_] => "A list"
    case _ => "Unknown value"
  }

  // Ejemplos de uso
  println(describeValue(0))           // "Zero"
  println(describeValue(42))          // "Positive integer: 42"
  println(describeValue(-5))          // "Negative integer: -5"
  println(describeValue(""))          // "Empty string"
  println(describeValue("Hello"))     // "String: Hello"
  println(describeValue(List(1,2,3))) // "A list"
  println(describeValue(3.14))        // "Unknown value"
}