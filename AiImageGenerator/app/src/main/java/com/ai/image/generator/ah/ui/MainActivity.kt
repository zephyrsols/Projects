package com.ai.image.generator.ah.ui

import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.ai.image.generator.ah.fragment.ExploreFragment
import com.ai.image.generator.ah.fragment.HomeFragment
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.fragment.SavedFragment
import com.ai.image.generator.ah.databinding.ActivityMainBinding
import com.ai.image.generator.ah.fragment.SettingFragment

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private lateinit var sharedPreferences: SharedPreferences
    private lateinit var editor: SharedPreferences.Editor


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        replaceFragment(HomeFragment())
        sharedPreferences = getSharedPreferences("onBoarding", MODE_PRIVATE)
        editor = sharedPreferences.edit()
        editor.putInt("onBoarding", 1)
        editor.apply()

        binding.bottomNavigationView.setOnItemSelectedListener {
            when (it.itemId) {
                R.id.home -> replaceFragment(HomeFragment())
                R.id.explore -> replaceFragment(ExploreFragment())
                R.id.saved -> replaceFragment(SavedFragment())
                R.id.profile -> replaceFragment(SettingFragment())
            }
            true

        }


    }

    private fun replaceFragment(fragment: Fragment) {
        val fragmentManager = supportFragmentManager
        val fragmentTrancation = fragmentManager.beginTransaction()
        fragmentTrancation.replace(R.id.frameLayout, fragment)
        fragmentTrancation.commit()
    }

    override fun onBackPressed() {
        super.onBackPressed()
        finish()
    }
}
