import kotlin.concurrent.thread
import java.io.File
import java.util.*

// 模拟网络请求，使用线程来模拟异步操作
fun performNetworkRequestAsync(callback: (String) -> Unit) {
    thread {
        // 模拟网络延迟
        Thread.sleep(1000)
        // 模拟网络请求结果
        val result = "网络请求结果: {\"status\": \"success\", \"data\": \"从API获取的数据\", \"timestamp\": \"${System.currentTimeMillis()}\"}"
        callback(result)
    }
}

// 生成随机文件名
fun generateRandomFileName(): String {
    val random = Random()
    val fileName = "output_${random.nextInt(1000000)}.kt"
    return fileName
}

// 保存内容到随机命名的文件
fun saveToFile(content: String, directory: String = "/workspace"): String {
    val randomFileName = generateRandomFileName()
    val filePath = "$directory/$randomFileName"
    
    File(filePath).writeText(content)
    println("文件已保存到: $filePath")
    return filePath
}

fun main() {
    println("开始网络请求...")
    
    // 发起异步网络请求
    performNetworkRequestAsync { response ->
        println("收到响应: $response")
        
        // 将结果保存到随机命名的.kt文件
        val filePath = saveToFile(response)
        
        println("任务完成！响应已保存到 $filePath")
    }
    
    // 等待一段时间以确保异步操作完成
    Thread.sleep(2000)
}