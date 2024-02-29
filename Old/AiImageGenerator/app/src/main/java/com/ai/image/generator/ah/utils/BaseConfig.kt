package com.ai.image.generator.ah.utils

import android.content.Context
import android.content.SharedPreferences

fun Context.getSharedPrefs(): SharedPreferences =
    getSharedPreferences("Prefs", Context.MODE_PRIVATE)
open class BaseConfig(val context: Context) {
    protected val prefs = context.getSharedPrefs()

    companion object {
        fun newInstance(context: Context) = BaseConfig(context)
    }

    var appStarted: Boolean
        get() = prefs.getBoolean("show_splash_prefs", false)
        set(appStarted) = prefs.edit().putBoolean("show_splash_prefs", appStarted).apply()

    var isAppIntroComplete: Boolean
        get() = prefs.getBoolean("show_onboarding_screens_prefs", false)
        set(appStarted) = prefs.edit().putBoolean("show_onboarding_screens_prefs", appStarted)
            .apply()

    //for Localization
    var appLanguage: String?
        get() = prefs.getString("Language_Name", "English")
        set(appLanguage) = prefs.edit().putString("Language_Name", appLanguage).apply()

    var startButton: String?
        get() = prefs.getString("startButton", "NO")
        set(appLanguage) = prefs.edit().putString("startButton", appLanguage).apply()

    var isConnecting: Boolean
        get() = prefs.getBoolean("connect_switch", false)
        set(connection) = prefs.edit().putBoolean("connect_switch", connection).apply()

    var ring: String?
        get() = prefs.getString("ring", "")
        set(ringOn) = prefs.edit().putString("ring", ringOn).apply()


    var vibration: String?
        get() = prefs.getString("vibration", "")
        set(vibrationOn) = prefs.edit().putString("vibration", vibrationOn).apply()

    var vibrationValue: String?
        get() = prefs.getString("vibration_value", "")
        set(vibrationValue) = prefs.edit().putString("vibration_value", vibrationValue).apply()

    var flash: String?
        get() = prefs.getString("flash", "")
        set(flashOn) = prefs.edit().putString("flash", flashOn).apply()

    var flashValue: String?
        get() = prefs.getString("flash_value", "")
        set(flashValue) = prefs.edit().putString("flash_value", flashValue).apply()


    var time: Int
        get() = prefs.getInt("time", 0)
        set(time) = prefs.edit().putInt("time", time).apply()

}

