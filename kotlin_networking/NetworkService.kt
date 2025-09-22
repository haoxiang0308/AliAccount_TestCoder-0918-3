// NetworkService.kt
import kotlinx.coroutines.*
import java.net.http.*
import java.net.URI
import java.time.Duration

class NetworkService {
    private val httpClient = HttpClient.newBuilder()
        .connectTimeout(Duration.ofSeconds(10))
        .build()

    suspend fun fetchData(url: String): String {
        return withContext(Dispatchers.IO) {
            val request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .timeout(Duration.ofSeconds(30))
                .GET()
                .build()

            val response = httpClient.send(request, HttpResponse.BodyHandlers.ofString())
            if (response.statusCode() == 200) {
                response.body()
            } else {
                throw Exception("HTTP Error: ${response.statusCode()}")
            }
        }
    }
}