import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun makeNetworkRequest(): String {
    delay(1000) // 模拟网络延迟
    return "Response from network request"
}

// 生成随机文件名的函数
fun generateRandomFileName(): String {
    val random = Random()
    val fileName = "random_file_${random.nextInt(10000)}.kt"
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
    val response = withContext(Dispatchers.IO) {
        makeNetworkRequest()
    }
    
    println("Received response: $response")
    
    // 生成随机文件名
    val randomFileName = generateRandomFileName()
    
    // 创建要保存的内容
    val contentToSave = """
        // Generated file: $randomFileName
        // Content from network request:
        val response = "$response"
        
        fun main() {
            println("Response was: $response")
        }
    """.trimIndent()
    
    // 保存到随机命名的.kt文件
    saveToFile(contentToSave, randomFileName)
    
    println("Process completed!")
}