package com.example.mytoastapp

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // setContentView(R.layout.activity_main) // No layout needed for just a toast

        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin!", Toast.LENGTH_SHORT).show()
    }
}