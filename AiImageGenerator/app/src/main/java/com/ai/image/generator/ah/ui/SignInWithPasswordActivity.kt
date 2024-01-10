package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.CustomDialog
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySignInWithPasswordBinding

class SignInWithPasswordActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySignInWithPasswordBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignInWithPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.signInBtn.setOnClickListener {
            CustomDialog.showDialog(this@SignInWithPasswordActivity, "Signing In")
        }
    }


    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }

}