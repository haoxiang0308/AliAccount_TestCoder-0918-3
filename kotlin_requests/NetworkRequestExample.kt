import kotlinx.coroutines.*
import java.io.File
import java.util.*

fun main() = runBlocking {
    // Simulate a network request using delay
    println("发起网络请求...")
    delay(1000L) // 模拟1秒的网络延迟
    val responseData = "{'status': 'success', 'data': 'Hello from the network!'}"
    println("收到响应: $responseData")

    // 生成一个随机的.kt文件名
    val randomFileName = "Request_${UUID.randomUUID()}.kt"
    val filePath = "/workspace/kotlin_requests/$randomFileName"

    // 将响应数据（或其他代码）写入文件
    File(filePath).writeText(responseData)
    println("响应已保存到文件: $filePath")
}
