import kotlinx.coroutines.*
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL

// 使用Kotlin协程发起网络请求的示例
class NetworkRequestWithCoroutines {
    
    // 使用协程发起网络请求的挂起函数
    suspend fun fetchDataFromApi(url: String): String = withContext(Dispatchers.IO) {
        val connection = URL(url).openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.setRequestProperty("User-Agent", "Kotlin App")
        
        try {
            val response = StringBuffer()
            BufferedReader(InputStreamReader(connection.inputStream)).use { reader ->
                var line = reader.readLine()
                while (line != null) {
                    response.append(line)
                    line = reader.readLine()
                }
            }
            response.toString()
        } finally {
            connection.disconnect()
        }
    }
    
    // 使用协程执行网络请求
    suspend fun performNetworkCall() {
        println("开始网络请求...")
        
        // 使用示例API
        val result = fetchDataFromApi("https://httpbin.org/get")
        println("收到响应: ${result.take(200)}...") // 只打印前200个字符
        
        return result
    }
}

// 主函数演示协程的使用
fun main() = runBlocking {
    val networkClient = NetworkRequestWithCoroutines()
    
    // 启动一个协程来执行网络请求
    val job = launch {
        networkClient.performNetworkCall()
    }
    
    // 等待协程完成
    job.join()
    
    println("网络请求完成!")
    
    // 也可以使用async来获取返回值
    val deferredResult = async {
        networkClient.fetchDataFromApi("https://httpbin.org/json")
    }
    
    val result = deferredResult.await()
    println("异步请求结果: ${result.take(100)}...")
}