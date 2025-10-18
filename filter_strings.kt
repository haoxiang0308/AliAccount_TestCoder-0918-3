fun filterStrings(list: List<String>, filterKeyword: String): List<String> {
    return list.filter { it.contains(filterKeyword, ignoreCase = true) }
}

fun main() {
    val strings = listOf("apple", "banana", "apricot", "cherry")
    val filtered = filterStrings(strings, "ap")
    println(filtered)
}