package com.ai.image.generator.ah.ui

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import com.ai.image.generator.ah.BaseConfig
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySplashBinding
import java.util.Locale

class SplashActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySplashBinding
    private lateinit var sharedPreferences: SharedPreferences

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySplashBinding.inflate(layoutInflater)
        setContentView(binding.root)
        sharedPreferences = getSharedPreferences("onBoarding", MODE_PRIVATE)


        val timer = object : CountDownTimer(2000, 100) {
            override fun onTick(millisUntilFinished: Long) {

            }

            private fun Activity.changeLanguage(languageCode: String) {
                val newLocale = Locale(languageCode)
                val configuration = resources.configuration
                configuration.setLocale(newLocale)
                resources.updateConfiguration(configuration, resources.displayMetrics)
            }


            override fun onFinish() {
                if (sharedPreferences.getString("language", "") == "") {
                    startActivity(Intent(this@SplashActivity, LanguageActivity::class.java))
                    overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                    finish()
                } else {
                    startActivity(Intent(this@SplashActivity, MainActivity::class.java))
                    overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                    changeLanguage(sharedPreferences.getString("language", "").toString())
                    finish()
                }
            }
        }
        timer.start()
    }

}
