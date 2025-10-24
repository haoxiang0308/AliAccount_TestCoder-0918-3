object SumList {
  def sumNumbers(numbers: List[Int]): Int = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val exampleList = List(1, 2, 3, 4, 5)
    println(s"Сумма чисел в списке $exampleList: ${sumNumbers(exampleList)}")
  }
}