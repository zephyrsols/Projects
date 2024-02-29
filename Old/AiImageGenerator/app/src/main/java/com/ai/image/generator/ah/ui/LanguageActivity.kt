package com.ai.image.generator.ah.ui

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.res.Configuration
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.RadioButton
import android.window.OnBackInvokedDispatcher
import androidx.activity.OnBackPressedCallback
import androidx.core.os.BuildCompat
import com.ai.image.generator.ah.utils.BaseConfig
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityLanguageBinding
import java.util.Locale

class LanguageActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLanguageBinding
    private var lang: String = "English"
    private var buttonsIds: ArrayList<RadioButton> = arrayListOf()
    private lateinit var sharedPreferences: SharedPreferences
    private lateinit var editor: SharedPreferences.Editor


    @SuppressLint("UnsafeOptInUsageError")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLanguageBinding.inflate(layoutInflater)
        loadLocale()
        setContentView(binding.root)
        binding.backBtn.setOnClickListener {
            finish()
        }
        initListeners()
        if (BuildCompat.isAtLeastT()) {
            onBackInvokedDispatcher.registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT
            ) {
                finish()
            }
        } else {
            onBackPressedDispatcher.addCallback(
                this,
                object : OnBackPressedCallback(true) {
                    override fun handleOnBackPressed() {
                        finish()

                    }
                })
        }
    }

    private val Context.baseConfig: BaseConfig get() = BaseConfig.newInstance(this)

    private fun initListeners() {
        binding.headerTitle.text = resources.getString(R.string.language)
        binding.tickBtn.setOnClickListener {
            when (lang) {
                "English" -> {
                    baseConfig.appLanguage = "en"
                    next()
                }

                "Hindi" -> {
                    baseConfig.appLanguage = "hi"
                    next()

                }

                "Spanish" -> {
                    baseConfig.appLanguage = "es"
                    next()

                }

                "French" -> {
                    baseConfig.appLanguage = "fr"
                    next()

                }

                "Arabic" -> {
                    baseConfig.appLanguage = "ar"
                    next()

                }

                "Urdu" -> {
                    baseConfig.appLanguage = "ur"
                    next()

                }

                "Indonesia" -> {
                    baseConfig.appLanguage = "in"
                    next()

                }

                "Russia" -> {
                    baseConfig.appLanguage = "ru"
                    next()

                }


                "Chinese" -> {
                    baseConfig.appLanguage = "zh"
                    next()

                }

                "German" -> {
                    baseConfig.appLanguage = "de"
                    next()

                }

                "Japanese" -> {
                    baseConfig.appLanguage = "ja"
                    next()

                }


            }
        }

        buttonsIds = arrayListOf(
            binding.english,
            binding.hindi,
            binding.spanish,
            binding.french,
            binding.arabic,
            binding.urdu,
            binding.indonesia,
            binding.russia,
            binding.china,
            binding.german,
            binding.japanese,
        )

        buttonsIds.forEachIndexed { index, mRadioButton ->
            mRadioButton.setOnClickListener {
                mRadioButton.isChecked = true
                lang = mRadioButton.text.toString()
                buttonsIds.forEachIndexed { index, radioButton ->
                    if (radioButton.id != mRadioButton.id) {
                        radioButton.isChecked = false
                    }
                }

            }

        }

        arrayListOf(
            binding.clEnglish,
            binding.clHindi,
            binding.clSpanish,
            binding.clFrench,
            binding.clArabic,
            binding.clUrdu,
            binding.clIndonesia,
            binding.clRussia,
            binding.clChina,
            binding.clGermany,
            binding.clJapanese,
        ).forEachIndexed { index, constraintLayout ->
            constraintLayout.setOnClickListener {
                handleRadioButton(buttonsIds[index])
            }
        }

    }

    private fun handleRadioButton(mButton: RadioButton) {
        buttonsIds.forEach { button ->
            if (button.id == mButton.id) {
                button.isChecked = true
                lang = button.text.toString()
            } else {
                button.isChecked = false
            }
        }
    }

    private fun Activity.changeLanguage(languageCode: String) {
        // Update the app's configuration with the new language code
        val newLocale = Locale(languageCode)
        val configuration = resources.configuration
        configuration.setLocale(newLocale)
        resources.updateConfiguration(configuration, resources.displayMetrics)
    }

    fun next() {
        changeLanguage(baseConfig.appLanguage.toString())
        //Toast.makeText(this, baseConfig.appLanguage.toString(), Toast.LENGTH_SHORT).show()
        if (!baseConfig.appStarted) {
            baseConfig.appStarted = true
            return
        }
        sharedPreferences = getSharedPreferences("onBoarding", MODE_PRIVATE)
        editor = sharedPreferences.edit()
        editor.putString("language", baseConfig.appLanguage.toString())
        editor.apply()
        if (sharedPreferences.getInt("onBoarding", 0) == 0
        ) {
            startActivity(Intent(this@LanguageActivity, OnBoardingActivityOne::class.java))
            finish()
        } else {
            startActivity(Intent(this@LanguageActivity, MainActivity::class.java))
            finish()
        }
    }

    fun radio_button_click(view: View) {
    }

    private fun setLocale(language: String) {

        val locale = Locale(language)
        Locale.setDefault(locale)

        val configuration = Configuration()
        configuration.locale = locale
        baseContext.resources.updateConfiguration(
            configuration,
            baseContext.resources.displayMetrics
        )

        val editor: SharedPreferences.Editor = getSharedPreferences("Settings", MODE_PRIVATE).edit()
        editor.putString("app_lang", language)
        editor.apply()
    }

    private fun loadLocale() {
        val language = baseConfig.appLanguage
        language?.let {
            setLocale(it)
            when (it) {
                "en" -> {
                    binding.english.isChecked = true
                }

                "hi" -> {
                    binding.hindi.isChecked = true

                }

                "es" -> {
                    binding.spanish.isChecked = true

                }

                "fr" -> {
                    binding.french.isChecked = true

                }

                "ar" -> {
                    binding.arabic.isChecked = true

                }

                "ur" -> {
                    binding.urdu.isChecked = true
                }

                "in" -> {
                    binding.indonesia.isChecked = true
                }

                "ru" -> {
                    binding.russia.isChecked = true
                }


                "zh" -> {
                    binding.china.isChecked = true
                }

                "de" -> {
                    binding.german.isChecked = true
                }

                "ja" -> {
                    binding.japanese.isChecked = true
                }

            }
        }
    }
}