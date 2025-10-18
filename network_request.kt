import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun makeNetworkRequest(): String {
    println("发起网络请求...")
    delay(1000) // 模拟网络延迟
    return "网络请求成功！响应数据: ${UUID.randomUUID()}"
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
    // 发起网络请求
    val response = withTimeout(5000) { // 设置超时时间
        makeNetworkRequest()
    }
    
    // 生成包含响应数据的Kotlin代码
    val kotlinCode = """
        // 通过协程网络请求生成的Kotlin文件
        // 请求时间: ${java.time.LocalDateTime.now()}
        
        fun getNetworkResponse(): String {
            return "$response"
        }
        
        fun main() {
            println(getNetworkResponse())
        }
    """.trimIndent()
    
    // 保存到随机命名的.kt文件
    val fileName = saveToFile(kotlinCode, ".kt")
    println("随机命名的Kotlin文件已创建: $fileName")
}