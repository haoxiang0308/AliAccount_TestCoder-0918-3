fun filterStrings(list: List<String>): List<String> {
    // Example filter: strings with length greater than 3
    return list.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("hi", "hello", "cat", "kotlin", "programming")
    val filtered = filterStrings(strings)
    println(filtered)
}