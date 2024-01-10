package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.CustomDialog
import com.ai.image.generator.ah.databinding.ActivityResetPasswordBinding

class NewPasswordActivity : AppCompatActivity() {
    private lateinit var binding: ActivityResetPasswordBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityResetPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.continueBtn.setOnClickListener {
            CustomDialog.showDialog(this@NewPasswordActivity, "Resetting Password")
        }
    }
}