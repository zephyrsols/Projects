package com.ai.image.generator.ah.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityResetPasswordBinding
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.auth

class ResetPasswordActivity : AppCompatActivity() {
    private lateinit var binding: ActivityResetPasswordBinding
    private lateinit var email: TextInputEditText
    private var auth = Firebase.auth
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityResetPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)

        email = binding.email
        binding.continueBtn.setOnClickListener {
            FirebaseAuth.getInstance().sendPasswordResetEmail(email.text.toString().trim())
                .addOnCompleteListener { task ->
                    if (task.isSuccessful) {
                        Toast.makeText(this, "Password reset email sent", Toast.LENGTH_SHORT).show()
                        startActivity(
                            Intent(
                                this@ResetPasswordActivity,
                                SigninActivity::class.java
                            )
                        )
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                    } else {
                        Toast.makeText(this, "fail due to\n${task.exception}", Toast.LENGTH_SHORT)
                            .show()
                    }
                }
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}