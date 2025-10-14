import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.http.*
import io.ktor.serialization.kotlinx.json.*
import java.io.File
import kotlin.io.path.Path
import kotlin.io.path.createTempFile

val client = HttpClient {
    install(ContentNegotiation) {
        json()
    }
}

suspend fun fetchAndSaveData() {
    try {
        val response: String = client.get("https://httpbin.org/get") {
            headers {
                append(HttpHeaders.ContentType, ContentType.Application.Json.toString())
            }
        }.body()

        val tempFile = createTempFile(prefix = "network_request_", suffix = ".kt")
        val file = File(tempFile.toString())
        file.writeText("// Generated file containing network response\n\nval responseData = \"\"\"\n$response\n\"\"\"")

        println("Data fetched and saved to: ${"$"}{file.absolutePath}")
    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        client.close()
    }
}

fun main() = runBlocking {
    fetchAndSaveData()
}