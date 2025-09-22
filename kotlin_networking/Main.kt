// Main.kt
import kotlinx.coroutines.*
import kotlin.random.Random

fun main() = runBlocking {
    val networkService = NetworkService()
    val testUrl = "https://httpbin.org/get" // A simple test endpoint

    try {
        println("发起网络请求到: $testUrl")
        val data = networkService.fetchData(testUrl)
        println("请求成功，收到数据:")
        println(data.take(200) + "...") // Print first 200 chars
    } catch (e: Exception) {
        println("请求失败: ${e.message}")
    }
}