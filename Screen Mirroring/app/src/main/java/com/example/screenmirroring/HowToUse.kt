package com.example.screenmirroring

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.screenmirroring.databinding.ActivityHowToUseBinding

class HowToUse : AppCompatActivity() {
    lateinit var binding: ActivityHowToUseBinding
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