import kotlinx.coroutines.*
import org.jsoup.Jsoup
import java.io.File
import java.util.*

// 发起网络请求的函数
suspend fun fetchData(): String {
    return withContext(Dispatchers.IO) {
        try {
            // 使用jsoup发起网络请求
            val doc = Jsoup.connect("https://httpbin.org/get").get()
            "Network response: ${doc.body().text().take(100)}..." // 只取前100个字符作为示例
        } catch (e: Exception) {
            "Error occurred: ${e.message}"
        }
    }
}

// 生成随机文件名
fun generateRandomFileName(): String {
    val chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    val sb = StringBuilder()
    repeat(10) {
        sb.append(chars.random())
    }
    return sb.toString() + ".kt"
}

// 保存数据到随机命名的.kt文件
fun saveDataToFile(data: String): String {
    val randomFileName = generateRandomFileName()
    val file = File("/workspace/$randomFileName")
    file.writeText(data)
    return file.absolutePath
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    // 使用协程发起网络请求
    val data = fetchData()
    
    println("收到数据: $data")
    
    // 保存到随机命名的.kt文件
    val filePath = saveDataToFile(data)
    println("数据已保存到: $filePath")
}