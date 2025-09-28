// This file demonstrates a Kotlin coroutine making a network request.
// Note: This is example code and may require a specific Kotlin environment with Ktor or similar to run.

import kotlinx.coroutines.*

// Assuming a function `performNetworkRequest` exists which uses Ktor or a similar library
suspend fun performNetworkRequest(): String {
    // ... actual network logic using Ktor's HttpClient or similar ...
    return "Response from network call"
}

fun main() = runBlocking {
    val response = async { performNetworkRequest() }
    println(response.await())
}