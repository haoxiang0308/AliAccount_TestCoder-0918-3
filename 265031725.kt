fun filterStrings(inputList: List<String>, predicate: (String) -> Boolean): List<String> {
    return inputList.filter { predicate(it) }
}

// Пример использования:
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // Выведет: [banana, cherry]
}