import kotlinx.coroutines.*
import java.io.File
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import java.time.Duration
import java.util.*

// 使用Java的HttpClient发起网络请求
suspend fun makeSimpleNetworkRequest(): String {
    return withContext(Dispatchers.IO) {
        try {
            println("发起网络请求到 httpbin.org...")
            val client = HttpClient.newHttpClient()
            val request = HttpRequest.newBuilder()
                .uri(URI("https://httpbin.org/get"))
                .timeout(Duration.ofSeconds(10))
                .header("User-Agent", "Kotlin Coroutine Client")
                .GET()
                .build()
            
            val response = client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString())
            println("网络请求成功！")
            response.body()
        } catch (e: Exception) {
            println("网络请求失败: ${e.message}")
            "Error: ${e.message}"
        }
    }
}

// 保存内容到随机命名的文件
fun saveToFile(content: String, extension: String = ".kt"): String {
    val randomName = "random_file_${System.currentTimeMillis()}_${(1000..9999).random()}$extension"
    val file = File(randomName)
    file.writeText(content)
    println("文件已保存为: $randomName")
    return randomName
}

fun main() = runBlocking {
    try {
        // 发起网络请求
        val response = withTimeout(15000) { // 设置15秒超时时间
            makeSimpleNetworkRequest()
        }
        
        // 生成包含响应数据的Kotlin代码
        val kotlinCode = """
            // 通过协程网络请求生成的Kotlin文件
            // 请求时间: ${java.time.LocalDateTime.now()}
            
            fun getNetworkResponse(): String {
                return \"\"\"$response\"\"\"
            }
            
            fun main() {
                println("网络响应数据:")
                println(getNetworkResponse())
            }
        """.trimIndent()
        
        // 保存到随机命名的.kt文件
        val fileName = saveToFile(kotlinCode, ".kt")
        println("随机命名的Kotlin文件已创建: $fileName")
    } catch (e: TimeoutCancellationException) {
        println("网络请求超时: ${e.message}")
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
    }
}