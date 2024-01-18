package com.ai.image.generator.ah.ui

import android.app.Dialog
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import android.view.Window
import android.widget.TextView
import android.widget.Toast
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySignInWithPasswordBinding
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.auth

class SignInWithPasswordActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySignInWithPasswordBinding
    private lateinit var email: TextInputEditText
    private lateinit var password: TextInputEditText
    private var auth = Firebase.auth
    private lateinit var dialog:Dialog

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignInWithPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)

        dialog = Dialog(this)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        dialog.setContentView(R.layout.custom_signin_dialog)
        val title = dialog.findViewById(R.id.heading) as TextView
        title.text = "Signing In"


        email = binding.email
        password = binding.password
        binding.signInBtn.setOnClickListener {
            dialog.show()
            auth.signInWithEmailAndPassword(email.text.toString(), password.text.toString())
                .addOnCompleteListener { task ->
                    if (task.isSuccessful) {
                        Toast.makeText(this, "Sign in Success!", Toast.LENGTH_SHORT).show()
                        startActivity(
                            Intent(
                                this@SignInWithPasswordActivity,
                                MainActivity::class.java
                            )
                        )
                        dialog.cancel()
                        finish()
                    } else {
                        Toast.makeText(
                            this,
                            "Sign in failed!" + task.exception.toString(),
                            Toast.LENGTH_SHORT
                        ).show()
                        dialog.cancel()
                    }
                }

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

    private fun showDialog() {

        dialog.show()
//        val timer = object : CountDownTimer(2000, 100) {
//            override fun onTick(millisUntilFinished: Long) {
//            }
//
//            override fun onFinish() {
//                dialog.cancel()
//
//            }
//        }
//        timer.start()
    }

}