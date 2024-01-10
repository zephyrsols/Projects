package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.databinding.ActivityOtpCodeVerificationBinding

class OtpCodeVerificationActivity : AppCompatActivity() {
    private lateinit var binding: ActivityOtpCodeVerificationBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityOtpCodeVerificationBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}