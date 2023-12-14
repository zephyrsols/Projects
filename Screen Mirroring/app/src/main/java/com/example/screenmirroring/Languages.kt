package com.example.screenmirroring

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.screenmirroring.databinding.ActivityLanguagesBinding

class Languages : AppCompatActivity() {
    //binding variable
    private lateinit var binding: ActivityLanguagesBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLanguagesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window,resources,theme)

        binding.backImage.setOnClickListener{
            finish()
        }

        //languages layout listeners
        binding.englishLayout.setOnClickListener { }
        binding.hindiLayout.setOnClickListener { }
        binding.spanishLayout.setOnClickListener {

        }
        binding.germanLayout.setOnClickListener { }
        binding.arabicLayout.setOnClickListener { }
        binding.russianLayout.setOnClickListener { }
        binding.japaneesLayout.setOnClickListener { }


    }
}