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
import com.ai.image.generator.ah.databinding.ActivityNewPasswordBinding
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.auth

class NewPasswordActivity : AppCompatActivity() {
    private lateinit var binding: ActivityNewPasswordBinding
    private lateinit var newPws: TextInputEditText
    private lateinit var confirmPwd: TextInputEditText
    private lateinit var otp: String
    private lateinit var dialog: Dialog
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityNewPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)

        dialog = Dialog(this)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        dialog.setContentView(R.layout.custom_signin_dialog)
        val title = dialog.findViewById(R.id.heading) as TextView
        title.text = "Resetting Password"

        otp = intent.getStringExtra("otp").toString()
        Toast.makeText(this, otp, Toast.LENGTH_SHORT).show()

        newPws = binding.newPassword
        confirmPwd = binding.confirmPassword
        binding.continueBtn.setOnClickListener {
            dialog.show()
            FirebaseAuth.getInstance()
                .confirmPasswordReset(otp, newPws.text.toString())
                .addOnCompleteListener {
                    Toast.makeText(this, "Password changed!", Toast.LENGTH_SHORT).show()
                    startActivity(Intent(this@NewPasswordActivity, SigninActivity::class.java))
                    finish()
                }
                .addOnFailureListener {
                    Toast.makeText(this, it.message.toString(), Toast.LENGTH_SHORT).show()
                }
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }

    private fun showDialog(context: Context, header: String) {
        val dialog = Dialog(context)

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
}