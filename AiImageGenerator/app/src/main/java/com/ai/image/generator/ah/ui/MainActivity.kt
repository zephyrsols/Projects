package com.ai.image.generator.ah.ui

import android.content.Intent
import android.content.res.Resources
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import androidx.fragment.app.Fragment
import com.ai.image.generator.ah.ExploreFragment
import com.ai.image.generator.ah.HomeFragment
import com.ai.image.generator.ah.ProfileFragment
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.SavedFragment
import com.ai.image.generator.ah.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        replaceFragment(HomeFragment())

        binding.bottomNavigationView.setOnItemSelectedListener {
            when (it.itemId) {
                R.id.home -> replaceFragment(HomeFragment())
                R.id.explore -> replaceFragment(ExploreFragment())
                R.id.saved -> replaceFragment(SavedFragment())
                R.id.profile -> replaceFragment(ProfileFragment())
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
}
