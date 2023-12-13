package com.example.screenmirroring

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.screenmirroring.databinding.ActivityConnectBinding

class Connect : AppCompatActivity() {
    //declaring  variables
    private lateinit var binding: ActivityConnectBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityConnectBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }

        binding.startButton.setOnClickListener {
            startActivity(Intent(this@Connect, SearchDevices::class.java))
        }

    }
}