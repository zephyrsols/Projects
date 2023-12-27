package com.example.screenmirroring.UI

import android.content.Intent
import android.content.SharedPreferences
import android.content.res.Resources
import android.os.Build
import android.os.Bundle
import android.os.CountDownTimer
import android.view.Window
import android.view.WindowManager
import com.example.screenmirroring.Holder.BaseActivity
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityMainBinding

class MainActivity : BaseActivity() {
    lateinit var binding: ActivityMainBinding
    lateinit var sharedPreferences: SharedPreferences


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)
        sharedPreferences = getSharedPreferences("onBoarding", MODE_PRIVATE)


        val timer = object : CountDownTimer(2000, 1000) {
            override fun onTick(millisUntilFinished: Long) {

            }

            override fun onFinish() {
                if (sharedPreferences.getInt("oneTime", 0) == 0) {
                    startActivity(Intent(this@MainActivity, OnBoardingActivity::class.java))
                    finish()
                } else {
                    startActivity(Intent(this@MainActivity, DashboardActivity::class.java))
                    finish()
                }

            }
        }
        timer.start()
    }
}

// status bar color function
fun changeStatusBarColor(
    colorResId: Int,
    window: Window,
    resources: Resources,
    theme: Resources.Theme
) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        val window: Window = window
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
        window.statusBarColor = resources.getColor(colorResId, theme)
    }
}