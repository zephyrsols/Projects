package com.ai.image.generator.ah.ui

import android.app.Dialog
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import android.view.Window
import android.widget.Button
import android.widget.TextView
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySettingBinding
import com.google.firebase.Firebase
import com.google.firebase.app
import com.google.firebase.auth.auth

class SettingActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySettingBinding
    private lateinit var dialog: Dialog
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySettingBinding.inflate(layoutInflater)
        setContentView(binding.root)
        binding.backBtn.setOnClickListener{
            finish()
        }

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
            dialog = Dialog(this)
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
            dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
            dialog.setCancelable(false)
            dialog.setContentView(R.layout.logout_dialog)
            val cancelButton = dialog.findViewById<Button>(R.id.cancelBtn)
            cancelButton.setOnClickListener {
                dialog.cancel()
            }
            val logoutButton = dialog.findViewById<Button>(R.id.logoutBtn)
            logoutButton.setOnClickListener {
                Firebase.auth.signOut()
                startActivity(Intent(this, SigninActivity::class.java))
                finish()
            }
            dialog.show()
        }

    }


    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}