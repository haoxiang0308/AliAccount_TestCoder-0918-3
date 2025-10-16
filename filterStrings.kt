fun filterStrings(list: List<String>, minLength: Int = 3): List<String> {
    return list.filter { it.length > minLength }
}

fun main() {
    val strings = listOf("hello", "hi", "kotlin", "code", "fun")
    val filtered = filterStrings(strings)
    println(filtered) // Выведет: [hello, kotlin, code, fun]
}