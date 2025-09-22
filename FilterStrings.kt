fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Example usage
fun main() {
    val words = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filteredWords = filterStrings(words) { it.length > 5 }
    println(filteredWords) // [banana, cherry, elderberry]
}