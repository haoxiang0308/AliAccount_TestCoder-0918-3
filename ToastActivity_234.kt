package com.example.toastactivity

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MainActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_LONG).show()
    }
}