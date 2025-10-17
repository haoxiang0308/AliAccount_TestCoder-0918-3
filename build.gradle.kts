plugins {
    kotlin("jvm") version "2.2.20"
    application
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.1")
    implementation(kotlin("stdlib"))
}

application {
    mainClass.set("NetworkRequestWithCoroutinesKt")
}