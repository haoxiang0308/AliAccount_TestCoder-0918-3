import kotlinx.coroutines.*
import java.io.File
import java.net.URI
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.util.*

// 真实的网络请求示例，使用协程
suspend fun performNetworkRequest(): String {
    return withContext(Dispatchers.IO) {
        try {
            val client = HttpClient.newHttpClient()
            val request = HttpRequest.newBuilder()
                .uri(URI.create("https://httpbin.org/get"))
                .GET()
                .build()

            val response = client.send(request, HttpResponse.BodyHandlers.ofString())
            "网络请求结果: ${response.body()}"
        } catch (e: Exception) {
            "网络请求失败: ${e.message}"
        }
    }
}

// 生成随机文件名
fun generateRandomFileName(): String {
    val random = Random()
    val fileName = "output_${random.nextInt(10000)}.kt"
    return fileName
}

// 保存内容到随机命名的文件
fun saveToFile(content: String, directory: String = "/workspace"): String {
    val randomFileName = generateRandomFileName()
    val filePath = "$directory/$randomFileName"
    
    File(filePath).writeText(content)
    println("文件已保存到: $filePath")
    return filePath
}

fun main() = runBlocking {
    println("开始网络请求...")
    
    // 使用协程发起网络请求
    val result = async { performNetworkRequest() }
    
    // 等待结果
    val response = result.await()
    println("收到响应: $response")
    
    // 将结果保存到随机命名的.kt文件
    val filePath = saveToFile(response)
    
    println("任务完成！响应已保存到 $filePath")
}