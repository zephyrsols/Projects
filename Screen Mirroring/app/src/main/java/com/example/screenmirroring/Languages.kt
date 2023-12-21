package com.example.screenmirroring

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.screenmirroring.databinding.ActivityLanguagesBinding

class Languages : BaseActivity() {
    //binding variable
    private lateinit var binding: ActivityLanguagesBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLanguagesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window,resources,theme)

        binding.backImage.setOnClickListener{
            finish()
        }

        //languages layout listeners
        binding.englishLayout.setOnClickListener {
            changeLanguage("en")
        }
        binding.hindiLayout.setOnClickListener {
            changeLanguage("hi")
            Toast.makeText(this,"hindi",Toast.LENGTH_SHORT).show()
        }
        binding.spanishLayout.setOnClickListener {
            changeLanguage("es")
        }
        binding.urduLayout.setOnClickListener {
            changeLanguage("ur")
        }
        binding.arabicLayout.setOnClickListener {
            changeLanguage("ar")
        }
        binding.russianLayout.setOnClickListener {
            changeLanguage("ru")
        }
        binding.japaneesLayout.setOnClickListener {
            changeLanguage("ja")
        }
        binding.chineseLayout.setOnClickListener {
            changeLanguage("ch")
        }

    }
    private fun changeLanguage(languageCode: String) {

        saveSelectedLanguage(languageCode)
        updateLocale()
        recreate()
    }

}
