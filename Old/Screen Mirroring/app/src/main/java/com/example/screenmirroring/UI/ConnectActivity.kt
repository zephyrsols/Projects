package com.example.screenmirroring.UI

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityConnectBinding

class ConnectActivity : AppCompatActivity() {
    //declaring  variables
    private lateinit var binding: ActivityConnectBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityConnectBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }

        binding.startButton.setOnClickListener {
            startActivity(Intent(this@ConnectActivity, SearchDevicesActivity::class.java))
        }

    }
}