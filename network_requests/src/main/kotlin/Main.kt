import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import kotlin.io.path.createTempFile

val client = HttpClient()

suspend fun fetchAndSaveData(url: String) {
    try {
        val response: HttpResponse = client.get(url)
        val responseBody: String = response.bodyAsText()

        val tempFile = createTempFile(suffix = ".kt").toFile()
        println("Saving response to: ${"$"}{tempFile.absolutePath}")
        tempFile.writeText(responseBody)

        println("Status: ${"$"}{response.status}")
        println("Saved content length: ${"$"}{responseBody.length} characters")
    } catch (e: Exception) {
        println("An error occurred: ${"$"}{e.message}")
        e.printStackTrace()
    }
}

fun main() = runBlocking {
    println("Starting network request...")
    fetchAndSaveData("https://httpbin.org/json")
    println("Request completed.")
    client.close()
}