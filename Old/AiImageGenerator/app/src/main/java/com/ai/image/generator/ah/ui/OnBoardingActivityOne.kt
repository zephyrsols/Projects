package com.ai.image.generator.ah.ui

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityOnBoardingOneBinding

class OnBoardingActivityOne : AppCompatActivity() {
    private lateinit var binding: ActivityOnBoardingOneBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityOnBoardingOneBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.nextBtn.setOnClickListener {
            startActivity(Intent(this@OnBoardingActivityOne, OnBoardingActivityTwo::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }

        binding.skippBtn.setOnClickListener {
            startActivity(Intent(this@OnBoardingActivityOne, PermissionsActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}