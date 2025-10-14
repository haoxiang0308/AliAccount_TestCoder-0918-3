fun filterStrings(list: List<String>, minLength: Int): List<String> {
    return list.filter { it.length >= minLength }
}

fun main() {
    val strings = listOf("a", "bb", "ccc", "dddd", "eeeee")
    val filtered = filterStrings(strings, 3)
    println(filtered) // Выведет: [ccc, dddd, eeeee]
}