object NumberSummer {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  def sumListRecursive(numbers: List[Int]): Int = {
    numbers match {
      case Nil => 0
      case head :: tail => head + sumListRecursive(tail)
    }
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val exampleList = List(1, 2, 3, 4, 5)
    println(s"Sum of $exampleList is ${sumList(exampleList)}")
    println(s"Recursive sum of $exampleList is ${sumListRecursive(exampleList)}")
  }
}