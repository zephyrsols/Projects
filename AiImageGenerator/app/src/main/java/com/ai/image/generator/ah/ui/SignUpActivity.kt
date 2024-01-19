package com.ai.image.generator.ah.ui

import android.app.Dialog
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.widget.CheckBox
import android.widget.TextView
import android.widget.Toast
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivitySignUpBinding
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.auth

class SignUpActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySignUpBinding
    private lateinit var email: TextInputEditText
    private lateinit var password: TextInputEditText
    private lateinit var termsCheckBox: CheckBox
    private var auth = Firebase.auth
    private lateinit var dialog: Dialog

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignUpBinding.inflate(layoutInflater)
        setContentView(binding.root)

        dialog = Dialog(this)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        dialog.setContentView(R.layout.custom_signin_dialog)
        val title = dialog.findViewById(R.id.heading) as TextView
        title.text = "Signing Up"

        termsCheckBox = binding.termsCheckBox
        email = binding.email
        password = binding.password
        binding.signInBtn.setOnClickListener {
            startActivity(Intent(this@SignUpActivity, SignInWithPasswordActivity::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
        binding.signUpBtn.setOnClickListener {
            if (email.text.toString() != "" && password.text.toString() != "") {
                if (termsCheckBox.isChecked) {
                    dialog.show()
                    auth.createUserWithEmailAndPassword(
                        email.text.toString(),
                        password.text.toString()
                    )
                        .addOnCompleteListener(this) { task ->
                            if (task.isSuccessful) {
                                // Sign in success, update UI with the signed-in user's information
                                val user = auth.currentUser
                                Toast.makeText(
                                    this,
                                    auth.currentUser?.email.toString(),
                                    Toast.LENGTH_SHORT
                                )
                                    .show()
                                startActivity(
                                    Intent(
                                        this@SignUpActivity,
                                        PersonalInfoActivity::class.java
                                    )
                                )
                                overridePendingTransition(
                                    R.anim.slide_in_right,
                                    R.anim.slide_out_left
                                )
                                finish()
                            } else {
                                // If sign in fails, display a message to the user.
                                Toast.makeText(
                                    baseContext,
                                    "Authentication failed." + task.exception!!.message.toString(),
                                    Toast.LENGTH_SHORT,
                                ).show()
                                dialog.cancel()
                            }
                        }
                }else{
                    Toast.makeText(this, "Accept Term and Privacy Policy", Toast.LENGTH_SHORT).show()
                }

            } else {

                Toast.makeText(this, "fill all fields!", Toast.LENGTH_SHORT).show()
            }
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}