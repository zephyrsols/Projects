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
import com.ai.image.generator.ah.databinding.ActivitySignInWithPasswordBinding

class SignInWithPasswordActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySignInWithPasswordBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignInWithPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.signInBtn.setOnClickListener {
            showDialog(this@SignInWithPasswordActivity, "Signing In")
        }
        binding.forgetPassword.setOnClickListener {
            startActivity(
                Intent(
                    this@SignInWithPasswordActivity,
                    ResetPasswordActivity::class.java
                )
            )
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
        binding.signUpBtn.setOnClickListener {
            startActivity(Intent(this@SignInWithPasswordActivity, SignUpActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
    }


    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }

    private fun showDialog(context: Context, header: String) {
        val dialog = Dialog(context)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        dialog.setContentView(R.layout.custom_signin_dialog)
        val title = dialog.findViewById(R.id.heading) as TextView
        title.text = header
        dialog.show()
        val timer = object : CountDownTimer(2000, 100) {
            override fun onTick(millisUntilFinished: Long) {
            }

            override fun onFinish() {
                dialog.cancel()
                startActivity(Intent(this@SignInWithPasswordActivity, MainActivity::class.java))
                finish()
            }
        }
        timer.start()
    }

}