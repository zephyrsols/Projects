package com.example.screenmirroring.UI

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityHowToUseBinding

class HowToUseActivity : AppCompatActivity() {
    private lateinit var binding: ActivityHowToUseBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityHowToUseBinding.inflate(layoutInflater)
        setContentView(binding.root)

        changeStatusBarColor(R.color.black, window,resources,theme)

        binding.backImage.setOnClickListener {
            finish()
        }
    }
}