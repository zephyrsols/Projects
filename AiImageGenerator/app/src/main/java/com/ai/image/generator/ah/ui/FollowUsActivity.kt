package com.ai.image.generator.ah.ui

import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.ai.image.generator.ah.databinding.ActivityFollowUsBinding

class FollowUsActivity : AppCompatActivity() {
    private lateinit var binding: ActivityFollowUsBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityFollowUsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.backBtn.setOnClickListener{
            finish()
        }
        binding.discordBtn.setOnClickListener {
            openUrl("https://discord.gg/uE4RHk4E")
        }
        binding.telegramBtn.setOnClickListener {
            openUrl("https://telegram.org/")
        }
        binding.instagramBtn.setOnClickListener {
            openUrl("https://www.instagram.com/")
        }
        binding.twitterBtn.setOnClickListener {
            openUrl("https://twitter.com/?lang=en")
        }
        binding.fbBtn.setOnClickListener {
            openUrl("https://www.facebook.com/")
        }

    }

    private fun openUrl(url: String) {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.data = Uri.parse(url)
        startActivity(intent)
    }
}