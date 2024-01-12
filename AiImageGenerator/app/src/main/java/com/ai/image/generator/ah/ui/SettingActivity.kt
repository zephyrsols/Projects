package com.ai.image.generator.ah.ui

import android.app.Dialog
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import android.view.Window
import android.widget.TextView
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySettingBinding

class SettingActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySettingBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySettingBinding.inflate(layoutInflater)
        setContentView(binding.root)


        binding.personalInfoBtn.setOnClickListener {
            startActivity(Intent(this@SettingActivity, PersonalInfoActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
        binding.securityBtn.setOnClickListener {
            startActivity(Intent(this@SettingActivity, SecurityActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
        binding.languageBtn.setOnClickListener {
            startActivity(Intent(this@SettingActivity, LanguageActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
        binding.followUsBtn.setOnClickListener {
            startActivity(Intent(this@SettingActivity, FollowUsActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }

        binding.logoutBtn.setOnClickListener {
            showDialog()
        }

    }

    private fun showDialog() {
        val dialog = Dialog(this@SettingActivity)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        
        dialog.setContentView(R.layout.logout_dialog)
        dialog.show()
        val timer = object : CountDownTimer(2000, 100) {
            override fun onTick(millisUntilFinished: Long) {
            }

            override fun onFinish() {
                dialog.cancel()
            }
        }
        timer.start()
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}