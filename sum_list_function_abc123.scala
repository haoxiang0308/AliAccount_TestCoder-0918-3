// Scala function to sum a list of numbers
def sumList(numbers: List[Int]): Int = {
  numbers.sum
}

// Alternative implementation using fold
def sumListFold(numbers: List[Int]): Int = {
  numbers.foldLeft(0)(_ + _)
}

// Example usage:
val exampleList = List(1, 2, 3, 4, 5)
println(s"Sum of $exampleList is: ${sumList(exampleList)}")