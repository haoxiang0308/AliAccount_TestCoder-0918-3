object SumList {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Sum of $testList is: ${sumList(testList)}")
    println(s"Sum using fold: ${sumListFold(testList)}")
  }
}