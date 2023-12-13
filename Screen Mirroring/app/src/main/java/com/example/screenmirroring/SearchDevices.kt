package com.example.screenmirroring

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.Settings
import com.example.screenmirroring.databinding.ActivitySearchDevicesBinding

class SearchDevices : AppCompatActivity() {

    lateinit var binding: ActivitySearchDevicesBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySearchDevicesBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.backImage.setOnClickListener{
            finish()
        }

        binding.fireTvLayout.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        binding.tclLayout.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        binding.rokuLayout.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        binding.lgLayout.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        binding.vizioLayout.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        binding.samsumgLayout.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }
    }
}
