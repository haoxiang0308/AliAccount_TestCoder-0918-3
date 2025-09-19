package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton

class MainActivity : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Create a button to trigger the toast message
        val button = AppCompatButton(this).apply {
            text = "Show Toast"
            setOnClickListener {
                // Display toast message when button is clicked
                Toast.makeText(this@MainActivity, "Hello from Kotlin Android Activity!", Toast.LENGTH_SHORT).show()
            }
        }
        
        // Set the button as the content view
        setContentView(button)
    }
}