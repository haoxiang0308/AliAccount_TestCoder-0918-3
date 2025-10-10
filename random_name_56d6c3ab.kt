fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter { predicate(it) }
}

fun main() {
    val strings = listOf("apple", "banana", "cherry", "apricot", "blueberry")
    val filtered = filterStrings(strings) { it.startsWith('a') }
    println(filtered) // Выведет [apple, apricot]
}