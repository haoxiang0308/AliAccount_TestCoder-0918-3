package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_LONG).show()
    }
}