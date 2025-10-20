import kotlinx.coroutines.*
import java.io.File
import java.net.URL
import kotlin.io.path.Path
import kotlin.io.path.createTempFile

// 模拟网络请求的协程函数
suspend fun performNetworkRequest(): String {
    return withContext(Dispatchers.IO) {
        try {
            // 使用协程模拟网络请求
            println("发起网络请求...")
            delay(1000) // 模拟网络延迟
            
            // 这里可以替换为实际的网络请求
            val response = URL("https://httpbin.org/get").readText()
            println("网络请求完成")
            response
        } catch (e: Exception) {
            "网络请求失败: ${e.message}"
        }
    }
}

// 保存内容到随机命名的.kt文件
fun saveToRandomKtFile(content: String): String {
    val tempFile = createTempFile(prefix = "network_response_", suffix = ".kt")
    tempFile.toFile().writeText(content)
    return tempFile.toString()
}

fun main() = runBlocking {
    println("开始执行网络请求...")
    
    // 发起网络请求
    val result = performNetworkRequest()
    
    // 保存结果到随机命名的.kt文件
    val filePath = saveToRandomKtFile(result)
    
    println("结果已保存到文件: $filePath")
    
    // 验证文件内容
    val savedFile = File(filePath)
    println("文件大小: ${savedFile.length()} 字节")
    println("文件名: ${savedFile.name}")
}