fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter(predicate)
}

fun main() {
    val strings = listOf("apple", "banana", "kiwi", "strawberry", "grape")
    val filtered = filterStrings(strings) { it.length > 5 } // Filter strings with length greater than 5
    println("Original: $strings")
    println("Filtered (length > 5): $filtered")
    
    val filteredByA = filterStrings(strings) { it.contains("a", ignoreCase = true) } // Filter strings containing 'a'
    println("Filtered (contains 'a'): $filteredByA")
}