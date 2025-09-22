package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class ToastActivity : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_toast)
        
        // Display a toast message
        showToast()
    }
    
    private fun showToast() {
        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_SHORT).show()
    }
}