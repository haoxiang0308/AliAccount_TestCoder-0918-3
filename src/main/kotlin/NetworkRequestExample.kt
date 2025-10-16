import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import kotlin.random.Random

// 网络请求函数，使用Kotlin协程
suspend fun performNetworkRequestAndSaveToFile() {
    // 创建HTTP客户端
    val client = HttpClient {
        expectSuccess = true
    }
    
    try {
        // 使用协程发起网络请求
        val response = withContext(Dispatchers.IO) {
            client.get("https://httpbin.org/json") {
                headers.append("User-Agent", "Kotlin App")
            }
        }
        
        val responseBody = response.bodyAsText()
        println("Response received: ${responseBody.take(100)}...")
        
        // 生成随机文件名
        val randomFileName = "network_response_${Random.nextInt(1000, 9999)}.kt"
        val file = File(randomFileName)
        
        // 将响应内容保存到随机命名的.kt文件中
        file.writeText("// Network response saved at: ${java.util.Date()}\n")
        file.appendText("val networkResponse = \"\"\"\n")
        file.appendText(responseBody)
        file.appendText("\"\"\"")
        
        println("Response saved to: $randomFileName")
        
    } catch (e: Exception) {
        println("Error during network request: ${e.message}")
        e.printStackTrace()
    } finally {
        client.close()
    }
}

// 主函数
fun main() = runBlocking {
    performNetworkRequestAndSaveToFile()
}