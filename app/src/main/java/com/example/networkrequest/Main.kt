package com.example.networkrequest

import kotlinx.coroutines.*
import okhttp3.*
import java.io.IOException
import java.util.*

// 模拟一个网络请求函数，返回一个字符串
suspend fun fetchDataFromNetwork(): String {
    return withContext(Dispatchers.IO) {
        // 使用OkHttp发起一个真实的GET请求
        val client = OkHttpClient()
        val request = Request.Builder()
            .url("https://httpbin.org/get") // 一个可以返回请求信息的测试API
            .build()

        try {
            val response = client.newCall(request).execute()
            response.body?.string() ?: "No body"
        } catch (e: IOException) {
            "Error: ${e.message}"
        }
    }
}

// 将数据写入一个随机命名的 .kt 文件
fun writeDataToFile(data: String) {
    val randomFileName = "Output_${UUID.randomUUID()}.kt"
    val file = java.io.File("app/src/main/java/com/example/networkrequest/$randomFileName")
    file.writeText(data)
    println("Data written to $randomFileName")
}

fun main() = runBlocking {
    println("Starting network request...")
    val data = fetchDataFromNetwork()
    println("Received data: $data")
    writeDataToFile(data)
    println("Process completed.")
}