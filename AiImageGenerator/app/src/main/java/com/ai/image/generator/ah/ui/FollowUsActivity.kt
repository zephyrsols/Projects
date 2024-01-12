package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.databinding.ActivityFollowUsBinding

class FollowUsActivity : AppCompatActivity() {
    private lateinit var binding: ActivityFollowUsBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityFollowUsBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}