object SumNumbers {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    val result = sumList(numbers)
    println(s"Сумма чисел $numbers равна $result")
  }
}