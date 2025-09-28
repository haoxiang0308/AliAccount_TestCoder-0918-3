// Файл: scala_sum_function_XYZ.scala
// Для запуска этой программы необходима установленная Scala.
// Компиляция и запуск: scalac scala_sum_function_XYZ.scala && scala scala_sum_function_XYZ

object scala_sum_function_XYZ extends App {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Пример использования
  val exampleList = List(1, 2, 3, 4, 5)
  val result = sumList(exampleList)
  println(s"Сумма элементов списка $exampleList равна $result")
}