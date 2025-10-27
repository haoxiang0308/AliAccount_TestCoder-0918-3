package com.example.toastactivity

import android.app.Activity
import android.os.Bundle
import android.widget.Toast
import android.widget.Button
import android.view.View

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Create a simple layout with a button
        val layout = android.widget.LinearLayout(this).apply {
            orientation = android.widget.LinearLayout.VERTICAL
            setPadding(16, 16, 16, 16)
        }
        
        val button = Button(this).apply {
            text = "Show Toast"
            setOnClickListener {
                showToast("Hello from Kotlin Android Activity!")
            }
        }
        
        layout.addView(button)
        setContentView(layout)
        
        // Show a toast when the activity starts
        showToast("Activity created successfully!")
    }
    
    private fun showToast(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }
}