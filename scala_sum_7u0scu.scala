object SumList {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Альтернативная реализация с использованием foldLeft
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)((acc, num) => acc + num)
  }

  def main(args: Array[String]): Unit = {
    val myList = List(1, 2, 3, 4, 5)
    println(s"Сумма элементов списка $myList равна ${sumList(myList)}")
    println(s"Сумма элементов списка $myList (fold) равна ${sumListFold(myList)}")
  }
}