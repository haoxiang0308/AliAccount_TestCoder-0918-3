import kotlinx.coroutines.*
import okhttp3.*
import java.io.File
import java.util.*

// 创建OkHttp客户端
val client = OkHttpClient()

// 模拟网络请求的函数
suspend fun makeNetworkRequest(): String = withContext(Dispatchers.IO) {
    val request = Request.Builder()
        .url("https://httpbin.org/get") // 使用一个公共API来测试
        .build()
    
    try {
        val response = client.newCall(request).execute()
        response.body?.string() ?: "No response body"
    } catch (e: Exception) {
        "Error: ${e.message}"
    }
}

// 生成随机文件名的函数
fun generateRandomFileName(): String {
    val random = Random()
    val fileName = "random_output_${random.nextInt(100000)}.kt"
    return fileName
}

// 保存内容到文件的函数
fun saveToFile(content: String, fileName: String) {
    val file = File(fileName)
    file.writeText(content)
    println("Content saved to ${file.absolutePath}")
}

// 主函数
fun main() = runBlocking {
    println("Starting network request...")
    
    // 发起网络请求
    val response = makeNetworkRequest()
    
    println("Received response (first 200 chars): ${response.take(200)}...")
    
    // 生成随机文件名
    val randomFileName = generateRandomFileName()
    
    // 创建要保存的内容
    val contentToSave = """// Generated file: $randomFileName
// Content from network request at ${java.util.Date()}:
val response = \"\"\"$response\"\"\"

fun main() {
    println("Response was: $response")
    println("File generated at: $randomFileName")
}
"""
    
    // 保存到随机命名的.kt文件
    saveToFile(contentToSave, randomFileName)
    
    println("Process completed! Created file: $randomFileName")
}