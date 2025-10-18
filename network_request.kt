import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 简单的网络请求模拟函数
suspend fun fetchData(): String {
    // 模拟网络请求延迟
    delay(1000)
    return "Data from network request: ${Random().nextInt(1000)}"
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
    val data = withContext(Dispatchers.IO) {
        fetchData()
    }
    
    println("收到数据: $data")
    
    // 保存到随机命名的.kt文件
    val filePath = saveDataToFile(data)
    println("数据已保存到: $filePath")
}