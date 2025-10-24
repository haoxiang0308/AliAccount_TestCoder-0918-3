import kotlinx.coroutines.*
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import kotlin.random.Random

// 使用Kotlin协程发起网络请求的示例
class NetworkRequestHandler {
    
    // 使用协程发起网络请求的挂起函数
    suspend fun fetchDataFromApi(apiUrl: String): String = withContext(Dispatchers.IO) {
        val connection = URL(apiUrl).openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.setRequestProperty("User-Agent", "Kotlin Coroutines App")
        connection.setRequestProperty("Accept", "application/json")
        
        try {
            val response = StringBuilder()
            BufferedReader(InputStreamReader(connection.inputStream)).use { reader ->
                var line = reader.readLine()
                while (line != null) {
                    response.append(line)
                    line = reader.readLine()
                }
            }
            response.toString()
        } finally {
            connection.disconnect()
        }
    }
    
    // 使用协程执行多个网络请求
    suspend fun performMultipleRequests() {
        println("开始执行多个网络请求...")
        
        // 创建多个请求的异步任务
        val requests = listOf(
            async { fetchDataFromApi("https://httpbin.org/get") },
            async { fetchDataFromApi("https://httpbin.org/headers") },
            async { fetchDataFromApi("https://httpbin.org/user-agent") }
        )
        
        // 等待所有请求完成
        val results = awaitAll(*requests.toTypedArray())
        
        results.forEachIndexed { index, result ->
            println("请求 $index 响应长度: ${result.length} 字符")
        }
        
        return results
    }
}

// 主函数演示协程的使用
fun main() = runBlocking {
    val handler = NetworkRequestHandler()
    
    println("使用Kotlin协程发起网络请求示例")
    
    // 执行单个请求
    println("\n--- 单个请求示例 ---")
    val singleResult = withContext(Dispatchers.IO) {
        handler.fetchDataFromApi("https://httpbin.org/json")
    }
    println("单个请求响应长度: ${singleResult.length} 字符")
    
    // 执行多个并发请求
    println("\n--- 并发请求示例 ---")
    handler.performMultipleRequests()
    
    println("\n所有网络请求完成!")
    
    // 演示带延迟的请求（模拟真实场景）
    println("\n--- 延迟请求示例 ---")
    val delayedJob = launch {
        delay(1000) // 延迟1秒
        val delayedResult = handler.fetchDataFromApi("https://httpbin.org/delay/2")
        println("延迟请求完成，响应长度: ${delayedResult.length}")
    }
    
    delayedJob.join()
}