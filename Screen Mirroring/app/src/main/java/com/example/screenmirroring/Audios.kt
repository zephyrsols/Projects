package com.example.screenmirroring


import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.screenmirroring.databinding.ActivityAudiosBinding

class Audios : AppCompatActivity() {
    private lateinit var binding: ActivityAudiosBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAudiosBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.backImage.setOnClickListener {
            finish()
        }

        binding.allAudioBtn.setOnClickListener {
            startActivity(
                Intent().setType("image/*").setAction(android.content.Intent.ACTION_VIEW)
                    .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }
    }
}