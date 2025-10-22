import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.http.*
import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 创建HTTP客户端
val client = HttpClient(CIO) {
    install(ContentNegotiation)
    install(HttpTimeout) {
        requestTimeoutMillis = 5000
        connectTimeoutMillis = 5000
        socketTimeoutMillis = 5000
    }
}

// 执行网络请求
suspend fun performNetworkRequest(): String {
    return try {
        val response: String = client.get("https://httpbin.org/json") {
            contentType(ContentType.Application.Json)
        }.bodyAsText()
        response
    } catch (e: Exception) {
        """{"error": "${e.message}", "status": "failed"}"""
    }
}

// 生成随机文件名
fun generateRandomFileName(): String {
    val random = Random()
    val chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    val name = StringBuilder()
    for (i in 0 until 8) {
        name.append(chars[random.nextInt(chars.length)])
    }
    return "/workspace/${name}_result.kt"
}

// 主函数
fun main() = runBlocking {
    println("开始执行网络请求...")
    
    try {
        // 执行网络请求
        val result = withTimeout(10000) { // 设置10秒超时
            performNetworkRequest()
        }
        
        // 生成随机文件名
        val randomFileName = generateRandomFileName()
        
        // 创建保存结果的代码内容
        val fileContent = """
            // 网络请求结果保存文件
            // 生成时间: ${Date()}
            
            val networkResult = ${result.replace("\n", "\n            ")}
            
            fun getNetworkResult(): String {
                return networkResult
            }
            
            // 示例用法
            fun main() {
                println("网络请求结果:")
                println(getNetworkResult())
            }
        """.trimIndent()
        
        // 将结果保存到随机命名的.kt文件中
        File(randomFileName).writeText(fileContent)
        
        println("网络请求完成！结果已保存到: $randomFileName")
        println("文件内容:")
        println(fileContent)
        
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
        e.printStackTrace()
    } finally {
        client.close()
    }
}