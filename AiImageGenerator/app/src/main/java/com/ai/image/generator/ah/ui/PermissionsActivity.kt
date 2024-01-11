package com.ai.image.generator.ah.ui

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.ActivityPermissionsBinding
import com.google.android.material.switchmaterial.SwitchMaterial

class PermissionsActivity : AppCompatActivity() {
    private lateinit var binding: ActivityPermissionsBinding
    private lateinit var permissionSwitch: SwitchMaterial
    private var permissonGranted = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPermissionsBinding.inflate(layoutInflater)
        setContentView(binding.root)


        permissionSwitch = binding.permissionSwitch
        permissionSwitch.setOnCheckedChangeListener { _, isChecked ->
            if (isChecked) {
                Toast.makeText(this, "on", Toast.LENGTH_SHORT).show()
                runtimePer()
            } else {
                Toast.makeText(this, "Off", Toast.LENGTH_SHORT).show()
            }
        }



        binding.startBtn.setOnClickListener {
            if (Build.VERSION.SDK_INT >= 32) {
                if (ContextCompat.checkSelfPermission(
                        this, Manifest.permission.READ_MEDIA_VIDEO
                    ) != PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(
                        this, Manifest.permission.READ_MEDIA_AUDIO
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    permissionSwitch.isChecked = false
                    Toast.makeText(
                        this, "First grant all permissions", Toast.LENGTH_SHORT
                    ).show()
                } else {
                    startActivity(Intent(this, SigninActivity::class.java))
                    overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                }
            } else {
                if (ContextCompat.checkSelfPermission(
                        this, Manifest.permission.READ_EXTERNAL_STORAGE
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    permissionSwitch.isChecked = false
                    Toast.makeText(this, "First grant all permissions", Toast.LENGTH_SHORT)
                        .show()
                } else {
                    startActivity(Intent(this, SigninActivity::class.java))
                    overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
                }
            }
        }
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }

    private fun runtimePer() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            // For versions below Android 6.0 (API level 23)
            if (ContextCompat.checkSelfPermission(
                    this, Manifest.permission.READ_EXTERNAL_STORAGE
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                ActivityCompat.requestPermissions(
                    this, arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE), 1
                )
            } else {
                permissionSwitch.isChecked = true
                // Handle any other actions you need to perform when permissions are granted
            }
        } else {
            // For Android 13 or above
            val requiredPermissions = arrayOf(
                Manifest.permission.READ_MEDIA_AUDIO,
                Manifest.permission.READ_MEDIA_VIDEO,
                Manifest.permission.READ_MEDIA_IMAGES
            )

            if (!areAllPermissionsGranted()) {
                ActivityCompat.requestPermissions(
                    this, requiredPermissions, 1
                )
            } else {
                // Permissions already granted
                // Handle permissions granted
                permissonGranted = true
                permissionSwitch.isChecked = true
                // Handle any other actions you need to perform when permissions are granted
            }
        }
    }

    private fun areAllPermissionsGranted(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            // For versions below Android 6.0 (API level 23)
            return ContextCompat.checkSelfPermission(
                this, Manifest.permission.READ_EXTERNAL_STORAGE
            ) == PackageManager.PERMISSION_GRANTED
        } else {
            // For Android 13 or above
            val requiredPermissions = arrayOf(
                Manifest.permission.READ_MEDIA_AUDIO,
                Manifest.permission.READ_MEDIA_VIDEO,
                Manifest.permission.READ_MEDIA_IMAGES
            )
            return requiredPermissions.all {
                ContextCompat.checkSelfPermission(this, it) == PackageManager.PERMISSION_GRANTED
            }
        }
    }
}