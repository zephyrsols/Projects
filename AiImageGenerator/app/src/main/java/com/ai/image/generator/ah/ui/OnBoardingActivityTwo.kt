package com.ai.image.generator.ah.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityOnBoardingTwoBinding

class OnBoardingActivityTwo : AppCompatActivity() {
    private lateinit var binding: ActivityOnBoardingTwoBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityOnBoardingTwoBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.nextBtn.setOnClickListener {
            startActivity(Intent(this@OnBoardingActivityTwo, OnBoardingActivityThree::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }

        binding.skippBtn.setOnClickListener {
            startActivity(Intent(this@OnBoardingActivityTwo, SigninActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}