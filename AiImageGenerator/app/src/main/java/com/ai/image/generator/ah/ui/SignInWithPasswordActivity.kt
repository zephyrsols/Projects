package com.ai.image.generator.ah.ui

import android.app.Dialog
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import android.view.Window
import android.widget.CheckBox
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
    private lateinit var rememberMeCheckBox: CheckBox
    private var auth = Firebase.auth
    private lateinit var dialog: Dialog

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


        rememberMeCheckBox = binding.rememberMeCheckBox
        email = binding.email
        password = binding.password
        binding.signInBtn.setOnClickListener {
            if (email.text.toString().trim() != "" && password.text.toString() != "") {
                dialog.show()
                auth.signInWithEmailAndPassword(
                    email.text.toString().trim(),
                    password.text.toString()
                )
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
                                "Sign in failed!" + task.exception!!.message.toString(),
                                Toast.LENGTH_SHORT
                            ).show()
                            dialog.cancel()
                        }
                    }
            } else {
                Toast.makeText(this, "fill all fields!", Toast.LENGTH_SHORT).show()

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


}