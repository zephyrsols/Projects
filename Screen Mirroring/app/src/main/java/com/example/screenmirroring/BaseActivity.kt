package com.example.screenmirroring

import android.content.Context
import android.content.SharedPreferences
import android.content.res.Configuration
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import java.util.*
open class BaseActivity : AppCompatActivity(){

    private val LANG_PREF_KEY = "selected_language"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        updateLocale()
    }

    fun updateLocale() {
        val langCode = getSelectedLanguage()
        val locale = Locale(langCode)
        Locale.setDefault(locale)

        val config = Configuration()
        config.setLocale(locale)

        val context: Context = baseContext
        val resources = context.resources
        val displayMetrics = resources.displayMetrics
        resources.updateConfiguration(config, displayMetrics)
    }

    fun saveSelectedLanguage(langCode: String) {
        val prefs: SharedPreferences = getSharedPreferences("MyPrefs", Context.MODE_PRIVATE)
        val editor = prefs.edit()
        editor.putString(LANG_PREF_KEY, langCode)
        editor.apply()
    }

    fun getSelectedLanguage(): String {
        val prefs: SharedPreferences = getSharedPreferences("MyPrefs", Context.MODE_PRIVATE)
        return prefs.getString(LANG_PREF_KEY, "en") ?: "en"
    }
}