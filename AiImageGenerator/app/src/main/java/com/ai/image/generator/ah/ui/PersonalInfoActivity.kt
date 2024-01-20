package com.ai.image.generator.ah.ui

import android.app.DatePickerDialog
import android.app.Dialog
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.dataclass.User
import com.ai.image.generator.ah.databinding.ActivityPersonalInfoBinding
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.auth
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.database
import java.util.Calendar

class PersonalInfoActivity : AppCompatActivity() {
    private lateinit var binding: ActivityPersonalInfoBinding
    private lateinit var genderSpinner: Spinner
    private lateinit var name: TextInputEditText
    private lateinit var phoneNo: TextInputEditText
    private lateinit var dob: TextView
    private lateinit var dialog: Dialog
    private var auth = Firebase.auth
    private lateinit var database: DatabaseReference
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPersonalInfoBinding.inflate(layoutInflater)
        setContentView(binding.root)
        genderSpinner = binding.genderSpinner
        name = binding.fName
        phoneNo = binding.phoneNo
        dob = binding.dob
        database = Firebase.database.reference

        ArrayAdapter(
            this,
            android.R.layout.simple_spinner_item,
            resources.getStringArray(R.array.gender_name)
        ).also { adapter ->
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
            genderSpinner.adapter = adapter
        }

        dialog = Dialog(this)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        dialog.setContentView(R.layout.custom_signin_dialog)
        val title = dialog.findViewById(R.id.heading) as TextView
        title.text = getString(R.string.updating_info)

        dob.setOnClickListener {
            val calender = Calendar.getInstance()
            val year = calender.get(Calendar.YEAR)
            val month = calender.get(Calendar.MONTH)
            val day = calender.get(Calendar.DAY_OF_MONTH)
            val datePickerDialog = DatePickerDialog(
                this,
                { _, selectedYear, selectedMonth, selectedDay ->
                    val selectedData = "$selectedDay /${selectedMonth + 1}/$selectedYear"
                    dob.text = selectedData
                }, year, month, day
            )
            datePickerDialog.show()
        }
        binding.finishBtn.setOnClickListener {
            dialog.show()
            database.child("users").child(auth.currentUser!!.uid)
                .setValue(
                    User(
                        name.text.toString().trim(),
                        phoneNo.text.toString().trim(),
                        dob.text.toString().trim(),
                        genderSpinner.selectedItem.toString().trim()
                    )
                )
                .addOnSuccessListener {
                    startActivity(Intent(this, MainActivity::class.java))
                    overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                    finish()
                }.addOnCanceledListener {
                    Toast.makeText(this,
                        getString(R.string.fail_to_save_details), Toast.LENGTH_SHORT).show()
                    dialog.cancel()
                }

        }
    }

}