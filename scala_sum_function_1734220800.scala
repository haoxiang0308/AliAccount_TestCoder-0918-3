object SumList {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Альтернативная реализация с использованием foldLeft
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Сумма элементов списка $testList: ${sumList(testList)}")
    println(s"Сумма элементов списка $testList (fold): ${sumListFold(testList)}")
  }
}