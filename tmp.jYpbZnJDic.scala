def sumList(numbers: List[Int]): Int = numbers match {
  case Nil => 0
  case head :: tail => head + sumList(tail)
}
