import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.http.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.*
import kotlinx.serialization.*
import kotlinx.serialization.json.Json
import java.io.File
import kotlin.random.Random

// 数据模型
@Serializable
data class Todo(
    val userId: Int,
    val id: Int,
    val title: String,
    val completed: Boolean
)

// 生成随机文件名
fun generateRandomFileName(): String {
    val sb = StringBuilder()
    repeat(10) {
        sb.append(('a'..'z').random())
    }
    return "${'$'}sb.kt"
}

// 保存内容到随机命名的.kt文件
fun saveToRandomFile(content: String): String {
    val randomFileName = generateRandomFileName()
    val file = File("/workspace/${'$'}randomFileName")
    file.writeText(content)
    println("Response saved to: ${'$'}randomFileName")
    return randomFileName
}

fun main() = runBlocking {
    val client = HttpClient(CIO) {
        install(ContentNegotiation) {
            json(Json {
                ignoreUnknownKeys = true
            })
        }
        install(HttpTimeout) {
            requestTimeoutMillis = 10_000
            connectTimeoutMillis = 10_000
            socketTimeoutMillis = 10_000
        }
    }

    try {
        println("Making network request...")
        
        // 发起实际的网络请求
        val todo: Todo = client.get("https://jsonplaceholder.typicode.com/todos/1").body()
        
        println("Network request successful!")
        println("Response: ${'$'}todo")
        
        // 将响应转换为字符串并保存到随机命名的.kt文件
        val responseString = "/* Network Response */\n${'$'}todo"
        val fileName = saveToRandomFile(responseString)
        
        println("Response saved to randomly named file: ${'$'}fileName")
        
    } catch (e: Exception) {
        println("Network request failed: ${'$'}{e.message}")
        
        // 保存错误信息到随机命名的.kt文件
        val errorContent = """/* Network Request Error */
/* Error: ${'$'}{e.message} */
/* Timestamp: ${'$'}{System.currentTimeMillis()} */"""
        
        val fileName = saveToRandomFile(errorContent)
        println("Error saved to randomly named file: ${'$'}fileName")
    } finally {
        client.close()
    }
}