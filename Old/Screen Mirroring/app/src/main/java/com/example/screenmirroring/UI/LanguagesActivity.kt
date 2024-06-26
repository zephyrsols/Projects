package com.example.screenmirroring.UI

import android.annotation.SuppressLint
import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import android.widget.Toast
import com.example.screenmirroring.Holder.BaseActivity
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityLanguagesBinding

class LanguagesActivity : BaseActivity() {
    //binding variable
    private lateinit var binding: ActivityLanguagesBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLanguagesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

        binding.backImage.setOnClickListener {
            finish()
        }

        //languages layout listeners
        binding.englishLayout.setOnClickListener {
            changeLanguage("en")
        }
        binding.hindiLayout.setOnClickListener {
            changeLanguage("hi")
            Toast.makeText(this, "hindi", Toast.LENGTH_SHORT).show()
        }
        binding.spanishLayout.setOnClickListener {
            changeLanguage("es")
        }
        binding.urduLayout.setOnClickListener {
            changeLanguage("ur")
        }
        binding.arabicLayout.setOnClickListener {
            changeLanguage("ar")
        }
        binding.russianLayout.setOnClickListener {
            changeLanguage("ru")
        }
        binding.japaneesLayout.setOnClickListener {
            changeLanguage("ja")
        }
        binding.chineseLayout.setOnClickListener {
            changeLanguage("ch")
        }

        binding.nextBtn.setOnClickListener {
            startActivity(Intent(this@LanguagesActivity, OnBoardingActivity::class.java))
            finish()
        }

    }

    @Deprecated("Deprecated in Java", ReplaceWith("finish()"))
    @SuppressLint("MissingSuperCall")
    override fun onBackPressed() {
        finish()
    }

    private fun changeLanguage(languageCode: String) {

        saveSelectedLanguage(languageCode)
        updateLocale()
        recreate()
    }

}
