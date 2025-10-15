package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class ToastActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // No UI content is needed for this activity, just showing a toast
        
        // Display a toast message
        Toast.makeText(this, "Hello from Toast Activity!", Toast.LENGTH_LONG).show()
        
        // Finish the activity since we're just showing a toast
        finish()
    }
}