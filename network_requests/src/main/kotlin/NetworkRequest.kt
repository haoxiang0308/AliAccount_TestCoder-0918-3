import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import kotlin.io.path.createTempFile

/**
 * Executes a network request using Kotlin Coroutines and saves the response to a temporary .kt file.
 */
suspend fun executeNetworkRequestAndSaveToFile(url: String = "https://httpbin.org/json") {
    val client = HttpClient(CIO)

    try {
        println("Initiating network request to: $url")
        val response: HttpResponse = client.get(url)
        val responseText = response.bodyAsText()

        println("Request successful. Saving response to a temporary file...")

        // Create a temporary file with a random name and .kt extension
        val tempFile = createTempFile(suffix = ".kt")
        tempFile.toFile().writeText(responseText)

        println("Response saved to: ${tempFile.toAbsolutePath()}")
        println("\nFile content:\n$responseText")

    } catch (e: Exception) {
        println("An error occurred during the network request: ${e.message}")
        e.printStackTrace()
    } finally {
        client.close()
    }
}

fun main() = runBlocking {
    executeNetworkRequestAndSaveToFile()
}