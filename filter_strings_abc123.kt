fun filterStrings(stringList: List<String>, predicate: (String) -> Boolean): List<String> {
    return stringList.filter(predicate)
}

fun main() {
    val strings = listOf("hello", "world", "kotlin", "is", "awesome")
    val filtered = filterStrings(strings) { it.length > 4 }
    println(filtered) // Выведет: [hello, world, kotlin, awesome]
}