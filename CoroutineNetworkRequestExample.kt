/*
 * Kotlin协程网络请求示例
 * 这个文件演示了如何使用Kotlin协程发起网络请求
 */

import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求函数
suspend fun fetchNetworkData(url: String): String {
    println("开始请求: $url")
    
    // 模拟网络延迟
    delay(1000L)
    
    // 返回模拟的响应数据
    return """{
    "status": "success",
    "data": {
        "url": "$url",
        "timestamp": "${Date()}",
        "coroutine_id": "${Thread.currentThread().id}"
    },
    "message": "Request completed using Kotlin Coroutines"
}"""
}

// 生成随机Kotlin文件名
fun generateRandomKotlinFileName(): String {
    val random = Random()
    val suffix = random.nextInt(100000)
    return "NetworkResult_${suffix}.kt"
}

// 保存网络请求结果到文件
fun saveResultToFile(result: String, filename: String) {
    val content = """// 网络请求结果
// 生成时间: ${Date()}

object NetworkResult {
    const val RESULT = "$result"
    
    @JvmStatic
    fun main(args: Array<String>) {
        println("网络请求结果:")
        println(RESULT)
    }
    
    fun getResult(): String = RESULT
}
"""
    File("/workspace/$filename").writeText(content)
    println("结果已保存到: $filename")
}

// 主函数
fun main() = runBlocking {
    println("开始使用Kotlin协程发起网络请求...")
    
    try {
        // 在IO调度器上执行网络请求
        val result = withContext(Dispatchers.IO) {
            fetchNetworkData("https://api.example.com/data")
        }
        
        // 生成随机文件名
        val randomFileName = generateRandomKotlinFileName()
        
        // 保存结果到文件
        saveResultToFile(result, randomFileName)
        
        println("网络请求完成！")
        
    } catch (e: Exception) {
        println("网络请求失败: ${e.message}")
        e.printStackTrace()
    }
}