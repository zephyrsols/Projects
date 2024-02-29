package com.ai.image.generator.ah.ui

import android.app.Activity
import android.content.Intent
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySplashBinding
import com.google.firebase.Firebase
import com.google.firebase.auth.auth
import java.util.Locale

class SplashActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySplashBinding
    private lateinit var sharedPreferences: SharedPreferences
    private val auth = Firebase.auth


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
                    if (auth.currentUser != null) {
                        startActivity(Intent(this@SplashActivity, MainActivity::class.java))
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                        finish()
                    }else{
                        startActivity(Intent(this@SplashActivity, SigninActivity::class.java))
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                        finish()
                    }
                    changeLanguage(sharedPreferences.getString("language", "").toString())
                }
            }
        }
        timer.start()
    }

}
