package com.ai.image.generator.ah.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityOnBoardingThreeBinding

class OnBoardingActivityThree : AppCompatActivity() {
    private lateinit var binding: ActivityOnBoardingThreeBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityOnBoardingThreeBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.startBtn.setOnClickListener {
            startActivity(Intent(this@OnBoardingActivityThree, SigninActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)

        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}