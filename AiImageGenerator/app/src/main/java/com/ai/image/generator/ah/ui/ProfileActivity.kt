package com.ai.image.generator.ah.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityProfileBinding
import com.google.android.gms.tasks.Task
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.auth
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.database

class ProfileActivity : AppCompatActivity() {
    private lateinit var binding: ActivityProfileBinding
    private lateinit var databse: DatabaseReference
    private lateinit var name: TextInputEditText
    private lateinit var phoneNo: TextInputEditText
    private lateinit var dob: TextInputEditText
    private lateinit var gender: TextInputEditText
    private lateinit var data: Task<DataSnapshot>
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)



        databse = Firebase.database.reference
        data = databse.child("users").child(Firebase.auth.currentUser!!.uid).get()
        name = binding.name
        phoneNo = binding.phoneNo
        dob = binding.dob
        gender = binding.gender

        data.addOnSuccessListener {
            name.setText(it.child("name").value.toString())
            phoneNo.setText(it.child("phoneNo").value.toString())
            dob.setText(it.child("dob").value.toString())
            gender.setText(it.child("gender").value.toString())
        }
    }
}