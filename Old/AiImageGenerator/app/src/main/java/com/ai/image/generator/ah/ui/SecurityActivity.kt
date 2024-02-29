package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.databinding.ActivitySecurityBinding

class SecurityActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySecurityBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySecurityBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.backBtn.setOnClickListener{
            finish()
        }
    }
}