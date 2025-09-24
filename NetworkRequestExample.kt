// 生成一个随机文件名
val randomFileName = "CoroutineRequest_${(10000..99999).random()}.kt"

// 将代码内容写入随机命名的文件
import kotlinx.coroutines.*
import java.io.File
import java.net.URL

fun main() = runBlocking {
    // 启动一个协程来执行网络请求
    val job = launch {
        try {
            // 使用示例URL获取一些文本数据
            val url = "https://httpbin.org/get"
            val response = URL(url).readText()

            // 将响应内容写入一个新文件
            val fileName = "network_response_${System.currentTimeMillis()}.json"
            File(fileName).writeText(response)

            println("网络请求成功，响应已保存到 $fileName")
        } catch (e: Exception) {
            println("网络请求失败: ${e.message}")
        }
    }

    // 等待协程完成
    job.join()
    println("主协程结束")
}
