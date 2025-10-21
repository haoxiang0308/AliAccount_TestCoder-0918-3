import kotlinx.coroutines.*

// 模拟网络请求的函数
suspend fun performNetworkRequest(): String {
    return withContext(Dispatchers.IO) {
        // 模拟网络延迟
        delay(1000)
        // 模拟返回的网络数据
        "Network response received at ${System.currentTimeMillis()}"
    }
}

// 保存数据到随机命名的.kt文件
fun saveToRandomKtFile(content: String): String {
    val randomFileName = "GeneratedFile_${System.currentTimeMillis()}_${(1000..9999).random()}.kt"
    java.io.File(randomFileName).writeText(content)
    println("Saved content to: $randomFileName")
    return randomFileName
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    // 执行网络请求
    val response = performNetworkRequest()
    println("收到响应: $response")
    
    // 生成要保存的内容
    val contentToSave = """
        // Generated Kotlin file with network response
        package generated
        
        const val NETWORK_RESPONSE = "$response"
        
        fun getNetworkResponse(): String {
            return NETWORK_RESPONSE
        }
    """.trimIndent()
    
    // 保存到随机命名的.kt文件
    val fileName = saveToRandomKtFile(contentToSave)
    
    println("完成！文件已保存为: $fileName")
}