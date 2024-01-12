package com.ai.image.generator.ah.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.TextView
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityLanguageBinding

class LanguageActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLanguageBinding
    private lateinit var langList: ListView
    private lateinit var selectedLang: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLanguageBinding.inflate(layoutInflater)
        setContentView(binding.root)
        var langListItems = mutableListOf(
            "Spanish",
            "French",
            "German",
            "Chinese",
            "Japanese",
            "Russian",
            "Arabic",
            "Italian",
            "Dutch",
            "Korean",
            "Hindi",
            "Turkish",
            "Swedish"
        )
        selectedLang = binding.selectedLang
        val arrayAdapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, langListItems)
        langList = binding.langList
        langList.adapter = arrayAdapter
        langList.setOnItemClickListener { parent, view, position, id ->
            langListItems.add(selectedLang.text.toString())
            selectedLang.text = arrayAdapter.getItem(position)
            langListItems.removeAt(position)
            langList.adapter = arrayAdapter
        }

        binding.selectBtn.setOnClickListener {
            startActivity(Intent(this@LanguageActivity, OnBoardingActivityOne::class.java))
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }
    }
}