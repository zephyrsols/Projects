package com.example.screenmirroring

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.screenmirroring.databinding.ActivityFeedbackBinding

class Feedback : AppCompatActivity() {
    //declaring  variables
    private lateinit var binding: ActivityFeedbackBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityFeedbackBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window,resources,theme)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }


        //upload image layout
        binding.uploadImage.setOnClickListener {
            startActivity(Intent().setType("image/*").setAction(Intent.ACTION_GET_CONTENT))
        }

        //submission button
        binding.submitButton.setOnClickListener {
            Toast.makeText(this@Feedback, "Submitting...", Toast.LENGTH_SHORT).show()
        }

    }
}