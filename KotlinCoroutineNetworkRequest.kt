/**
 * 使用Kotlin协程发起网络请求，并保存到随机命名的.kt文件中
 * 
 * 该程序演示了:
 * 1. 使用Kotlin协程进行异步编程
 * 2. 使用Java 11+的HttpClient发起网络请求
 * 3. 将响应数据保存到随机命名的.kt文件中
 */

import kotlinx.coroutines.*
import java.io.File
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.net.URI
import kotlin.io.path.createTempFile

// 使用协程发起网络请求并保存响应到随机命名的.kt文件
suspend fun fetchAndSaveData() {
    try {
        // 创建HTTP客户端
        val httpClient = HttpClient.newHttpClient()
        
        // 创建HTTP请求
        val request = HttpRequest.newBuilder()
            .uri(URI("https://httpbin.org/get"))  // 示例API，返回请求信息
            .header("Content-Type", "application/json")
            .timeout(java.time.Duration.ofSeconds(30))  // 设置超时
            .GET()
            .build()

        // 使用Kotlin协程在IO调度器上执行网络请求
        val response = withContext(Dispatchers.IO) {
            httpClient.send(request, HttpResponse.BodyHandlers.ofString()).body()
        }

        // 创建一个临时文件，使用随机名称和.kt扩展名
        val tempFile = createTempFile(prefix = "network_response_", suffix = ".kt")
        val file = File(tempFile.toString())
        
        // 将网络响应保存到随机命名的.kt文件中
        file.writeText("""// Generated file containing network response
// Created at: ${java.time.LocalDateTime.now()}

val responseData = \"\"\"
$response
\"\"\"

// End of network response
""".trimIndent())

        println("数据已成功获取并保存到: ${file.absolutePath}")
        println("随机生成的文件名: ${file.name}")
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
        e.printStackTrace()
    }
}

// 程序入口点
fun main() = runBlocking {
    println("开始发起网络请求...")
    fetchAndSaveData()
    println("程序执行完成。")
}