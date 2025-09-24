fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

fun main() {
    val originalList = listOf("a", "hello", "hi", "world", "Kotlin", "is", "fun")
    val filteredList = filterStrings(originalList)
    println("Original list: $originalList")
    println("Filtered list (length > 3): $filteredList")
}