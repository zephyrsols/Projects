package com.ai.image.generator.ah.ui

import android.app.Dialog
import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.CountDownTimer
import android.view.Window
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityPersonalInfoBinding

class PersonalInfoActivity : AppCompatActivity() {
    private lateinit var binding: ActivityPersonalInfoBinding
    private lateinit var genderSpinner: Spinner
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPersonalInfoBinding.inflate(layoutInflater)
        setContentView(binding.root)

        genderSpinner = binding.genderSpinner
        binding.finishBtn.setOnClickListener {
            showDialog(this@PersonalInfoActivity, "Signing Up")
        }
        ArrayAdapter(
            this,
            android.R.layout.simple_spinner_item,
            resources.getStringArray(R.array.gender_name)
        ).also { adapter ->
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
            genderSpinner.adapter = adapter
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
            }
        }
        timer.start()
    }
}