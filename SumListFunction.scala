object SumListFunction {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Альтернативная реализация с использованием рекурсии
  def sumListRecursive(numbers: List[Int]): Int = numbers match {
    case Nil => 0
    case head :: tail => head + sumListRecursive(tail)
  }

  def main(args: Array[String]): Unit = {
    val myList = List(1, 2, 3, 4, 5)
    println(s"Сумма элементов списка $myList: ${sumList(myList)}")
    println(s"Сумма элементов списка $myList (рекурсивно): ${sumListRecursive(myList)}")
  }
}