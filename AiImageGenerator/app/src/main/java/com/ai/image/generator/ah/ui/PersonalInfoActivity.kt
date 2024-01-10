package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.CustomDialog
import com.ai.image.generator.ah.databinding.ActivityPersonalInfoBinding

class PersonalInfoActivity : AppCompatActivity() {
    private lateinit var binding: ActivityPersonalInfoBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPersonalInfoBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.finishBtn.setOnClickListener {
            CustomDialog.showDialog(this@PersonalInfoActivity, "Signing Up")

        }
    }
}