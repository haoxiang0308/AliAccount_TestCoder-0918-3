import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 使用Ktor客户端发起网络请求
suspend fun makeRealNetworkRequest(): String {
    val client = HttpClient()
    try {
        println("发起网络请求到 httpbin.org...")
        val response: HttpResponse = client.get("https://httpbin.org/get") {
            headers.append("User-Agent", "Kotlin Coroutine Client")
        }
        val responseBody = response.bodyAsText()
        println("网络请求成功！")
        return responseBody
    } catch (e: Exception) {
        println("网络请求失败: ${e.message}")
        return "Error: ${e.message}"
    } finally {
        client.close()
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
        val response = withTimeout(10000) { // 设置10秒超时时间
            makeRealNetworkRequest()
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