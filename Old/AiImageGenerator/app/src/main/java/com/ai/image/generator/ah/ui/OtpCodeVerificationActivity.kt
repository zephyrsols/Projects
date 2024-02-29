package com.ai.image.generator.ah.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityOtpCodeVerificationBinding
import com.google.firebase.auth.FirebaseAuth

class OtpCodeVerificationActivity : AppCompatActivity() {
    private lateinit var binding: ActivityOtpCodeVerificationBinding
    private lateinit var otp: String
    private lateinit var otp1: EditText
    private lateinit var otp2: EditText
    private lateinit var otp3: EditText
    private lateinit var otp4: EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityOtpCodeVerificationBinding.inflate(layoutInflater)
        setContentView(binding.root)

        otp1 = binding.otp1
        otp2 = binding.otp2
        otp3 = binding.otp3
        otp4 = binding.otp4
        otp = otp1.text.toString().trim() + otp2.text.toString().trim() + otp3.text.toString()
            .trim() + otp4.text.toString().trim()
        binding.continueBtn.setOnClickListener {
            startActivity(
                Intent(
                    this@OtpCodeVerificationActivity,
                    NewPasswordActivity::class.java
                ).putExtra("otp", "otp")
            )
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}