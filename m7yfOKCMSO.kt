fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("a", "hello", "hi", "world", "kotlin", "ok")
    val filtered = filterStrings(strings)
    println(filtered)
}