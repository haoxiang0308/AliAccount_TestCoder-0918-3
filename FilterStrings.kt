fun filterStrings(stringList: List<String>): List<String> {
    return stringList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("hello", "hi", "kotlin", "is", "awesome")
    val filtered = filterStrings(strings)
    println("Original: $strings")
    println("Filtered: $filtered")
}