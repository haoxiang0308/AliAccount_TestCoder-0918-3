import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json

object NetworkRequest {
    private val client = HttpClient {
        install(ContentNegotiation) {
            json(Json {
                ignoreUnknownKeys = true
            })
        }
    }

    suspend fun fetchData(): String = withContext(Dispatchers.IO) {
        try {
            val response: HttpResponse = client.get("https://httpbin.org/get")
            response.bodyAsText()
        } catch (e: Exception) {
            e.printStackTrace()
            "Error: \${e.message}"
        }
    }

    @JvmStatic
    fun main(args: Array<String>) = runBlocking {
        val data = fetchData()
        println(data)
    }
}