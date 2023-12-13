package com.example.screenmirroring


import android.content.ComponentName
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.screenmirroring.databinding.ActivityDashboardBinding

class Dashboard : AppCompatActivity() {
    //declaring  binding
    private lateinit var binding: ActivityDashboardBinding


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDashboardBinding.inflate(layoutInflater)
        setContentView(binding.root)



        //video card layout with onclick listener
        binding.videoLayout.setOnClickListener {
            startActivity(Intent(this@Dashboard, Videos::class.java))
        }

        //image card layout with onclick listener
        binding.imageLayout.setOnClickListener {
            startActivity(Intent(this@Dashboard, Images::class.java))
        }


        //audio card layout with onclick listener
        binding.audioLayout.setOnClickListener {
            startActivity(Intent(this@Dashboard, Audios::class.java))

        }

        //mirroring card layout with onclick listener
        binding.tvMirrorImg2.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        //connect card layout with onclick listener
        binding.connectLayout.setOnClickListener {
            startActivity(Intent(this@Dashboard, Connect::class.java))

        }

        //wifi image at top bar
        binding.screenWifiImg.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        //drawer
        binding.drawerImg.setOnClickListener {
            startActivity(Intent(this@Dashboard, Setting::class.java))
        }
    }

    private fun openWirelessDisplaySettings() {
        val intent = Intent()

        // For Samsung devices with SmartView settings
        if (Build.MANUFACTURER.equals("samsung", ignoreCase = true)) {
            // Use the package and class name for SmartView settings activity
            intent.action = android.provider.Settings.ACTION_CAST_SETTINGS
            Toast.makeText(this, "a", Toast.LENGTH_SHORT).show()
        } else {
            // For other devices, you may try using the standard action for wireless display
            intent.action = Settings.ACTION_WIRELESS_SETTINGS

        }

        try {
            startActivity(intent)
        } catch (e: Exception) {
            intent.action = Settings.ACTION_WIRELESS_SETTINGS
            startActivity(intent)
            Toast.makeText(this, e.message.toString(), Toast.LENGTH_SHORT).show()
            // Handle the exception if the SmartView settings activity is not found
            // or if there is an issue launching the activity
        }
    }
}
