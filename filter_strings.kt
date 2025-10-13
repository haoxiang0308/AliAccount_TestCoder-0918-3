fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter { predicate(it) }
}

fun main() {
    val strings = listOf("hello", "world", "kotlin", "programming")
    val filtered = filterStrings(strings) { it.length > 5 }
    println(filtered) // [kotlin, programming]
}