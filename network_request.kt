import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 简单的网络请求模拟（因为实际网络请求需要依赖库）
suspend fun makeNetworkRequest(): String {
    // 模拟网络延迟
    delay(1000)
    return """{
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
}"""
}

// 生成随机文件名
fun generateRandomFileName(): String {
    val random = Random()
    val sb = StringBuilder()
    for (i in 1..10) {
        sb.append(('a'..'z').random())
    }
    return "${'$'}sb.kt"
}

// 保存内容到随机命名的.kt文件
fun saveToRandomFile(content: String): String {
    val randomFileName = generateRandomFileName()
    val file = File("/workspace/${'$'}randomFileName")
    file.writeText(content)
    println("文件已保存到: ${'$'}randomFileName")
    return randomFileName
}

fun main() = runBlocking {
    println("开始发起网络请求...")
    
    // 发起网络请求
    val response = withTimeoutOrNull(5000) { // 设置5秒超时
        makeNetworkRequest()
    }
    
    if (response != null) {
        println("网络请求成功，响应内容：")
        println(response)
        
        // 保存到随机命名的.kt文件
        val fileName = saveToRandomFile(response)
        println("响应内容已保存到随机命名的文件: ${'$'}fileName")
    } else {
        println("网络请求失败或超时")
        // 即使请求失败，也保存错误信息到随机文件
        val errorContent = """{
    "error": "Network request failed or timed out",
    "timestamp": "${'$'}{System.currentTimeMillis()}"
}"""
        saveToRandomFile(errorContent)
    }
}