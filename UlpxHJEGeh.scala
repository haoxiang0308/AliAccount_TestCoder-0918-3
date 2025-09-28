object SumList {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Пример использования
  def main(args: Array[String]): Unit = {
    val myList = List(1, 2, 3, 4, 5)
    val result = sumList(myList)
    println(s"Сумма списка $myList равна $result")
  }
}