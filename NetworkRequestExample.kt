import kotlinx.coroutines.*
import java.io.File
import java.net.HttpURLConnection
import java.net.URL
import java.util.*

// 网络请求示例，使用协程
class NetworkRequestExample {
    suspend fun performNetworkRequest(requestUrl: String): String = withContext(Dispatchers.IO) {
        val url = URL(requestUrl)
        val connection = url.openConnection() as HttpURLConnection
        try {
            connection.requestMethod = "GET"
            connection.connectTimeout = 5000 // 5秒超时
            connection.readTimeout = 5000
            
            val responseCode = connection.responseCode
            val response = if (responseCode == HttpURLConnection.HTTP_OK) {
                connection.inputStream.bufferedReader().readText()
            } else {
                "Error: HTTP $responseCode"
            }
            response
        } finally {
            connection.disconnect()
        }
    }
}

fun main() = runBlocking {
    val example = NetworkRequestExample()
    val url = "https://httpbin.org/get"  // 使用一个可靠的测试API
    
    println("发起网络请求到: $url")
    val response = try {
        example.performNetworkRequest(url)
    } catch (e: Exception) {
        "Error: ${e.message}"
    }
    println("收到响应: $response")
    
    // 生成随机文件名并保存结果
    val randomFileName = generateRandomKotlinFileName()
    val currentTimeMillis = System.currentTimeMillis()
    val contentToSave = """
        // 网络请求结果保存
        val requestUrl = "$url"
        val response = "$response"
        val timestamp = "$currentTimeMillis"
        
        fun getRequestInfo(): String {
            return "URL: " + requestUrl + "\\nResponse: " + response + "\\nTimestamp: " + timestamp
        }
    """.trimIndent()
    
    saveToFile(randomFileName, contentToSave)
    println("结果已保存到文件: $randomFileName")
}

fun generateRandomKotlinFileName(): String {
    val random = Random()
    val fileName = StringBuilder("NetworkResult_")
    
    // 生成随机字母和数字组合
    repeat(8) {
        val c = if (random.nextBoolean()) {
            ('a' + random.nextInt(26)).toChar()
        } else {
            ('0' + random.nextInt(10)).toChar()
        }
        fileName.append(c)
    }
    
    fileName.append(".kt")
    return fileName.toString()
}

fun saveToFile(fileName: String, content: String) {
    val file = File(fileName)
    file.writeText(content)
    println("文件已创建: ${file.absolutePath}")
}