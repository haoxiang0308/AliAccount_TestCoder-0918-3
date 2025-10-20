package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class RandomActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_toast)
        
        // Display a toast message
        Toast.makeText(this, "Hello from Toast Activity!", Toast.LENGTH_LONG).show()
    }
}