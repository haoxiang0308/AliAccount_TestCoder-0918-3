import kotlinx.coroutines.*
import java.io.File
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.net.URI
import kotlin.io.path.createTempFile

suspend fun fetchAndSaveData() {
    try {
        // Create HTTP client
        val httpClient = HttpClient.newHttpClient()
        
        // Create HTTP request
        val request = HttpRequest.newBuilder()
            .uri(URI("https://httpbin.org/get"))
            .header("Content-Type", "application/json")
            .GET()
            .build()

        // Execute request asynchronously using Kotlin coroutines
        val response = withContext(Dispatchers.IO) {
            httpClient.send(request, HttpResponse.BodyHandlers.ofString()).body()
        }

        // Create a temporary file with a random name and .kt extension
        val tempFile = createTempFile(prefix = "network_request_", suffix = ".kt")
        val file = File(tempFile.toString())
        file.writeText("// Generated file containing network response\n\nval responseData = \"\"\"\n$response\n\"\"\"")

        println("Data fetched and saved to: ${file.absolutePath}")
    } catch (e: Exception) {
        e.printStackTrace()
    }
}

fun main() = runBlocking {
    fetchAndSaveData()
}