object SumFunction {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Пример использования
  def main(args: Array[String]): Unit = {
    val exampleList = List(1, 2, 3, 4, 5)
    val result = sumList(exampleList)
    println(s"Сумма списка $exampleList равна $result")
  }
}