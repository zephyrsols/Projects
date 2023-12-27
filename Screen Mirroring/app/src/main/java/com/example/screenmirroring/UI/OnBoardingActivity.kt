package com.example.screenmirroring.UI

import android.Manifest
import android.annotation.SuppressLint
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.Switch
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.cardview.widget.CardView
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.screenmirroring.Holder.BaseActivity
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityOnBoardingBinding
import com.google.android.material.switchmaterial.SwitchMaterial

class OnBoardingActivity : BaseActivity() {

    lateinit var binding: ActivityOnBoardingBinding
    lateinit var textContent: TextView
    lateinit var onBoardingImg: ImageView
    lateinit var card1: CardView
    lateinit var card2: CardView
    lateinit var card3: CardView
    lateinit var card4: CardView
    lateinit var card5: CardView
    lateinit var card6: CardView
    lateinit var mainCard: CardView
    lateinit var button: Button
    lateinit var permissionSwitch: SwitchMaterial
    var textChange = 0

    companion object {
        private const val REQUEST_READ_STORAGE_PERMISSION = 100
        private const val READ_MEDIA_VIDEO = 100
        private const val READ_MEDIA_AUDIO = 100
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    @SuppressLint("SetTextI18n")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityOnBoardingBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

        textContent = binding.textContent
        onBoardingImg = binding.onBoardingImg
        card1 = binding.card1
        card2 = binding.card2
        card3 = binding.card3
        card4 = binding.card4
        card5 = binding.card5
        card6 = binding.card6
        mainCard = binding.mainCard
        button = binding.nextBtn
        permissionSwitch = binding.permissionSwitch


        card1.visibility = View.GONE
        card2.visibility = View.GONE
        card3.visibility = View.GONE
        permissionSwitch.visibility = View.GONE

        binding.skipText.setOnClickListener {
            startActivity(Intent(this, DashboardActivity::class.java))
            finish()
        }



        permissionSwitch.setOnCheckedChangeListener { _, isChecked ->
            if (isChecked) {
                Toast.makeText(this, "on", Toast.LENGTH_SHORT).show()
                runtimePer()
            } else {
                Toast.makeText(this, "Off", Toast.LENGTH_SHORT).show()
            }
        }


        // Handle any other actions you need to perform when permissions are granted
        permissionSwitch.isChecked = ContextCompat.checkSelfPermission(
            this, Manifest.permission.READ_EXTERNAL_STORAGE
        ) == PackageManager.PERMISSION_GRANTED

//        videoPermission.setOnClickListener {
//            if (videoPermission.isChecked) {
//                Toast.makeText(this, "on", Toast.LENGTH_SHORT).show()
//                if (ContextCompat.checkSelfPermission(
//                        this, android.Manifest.permission.READ_EXTERNAL_STORAGE
//                    ) != android.content.pm.PackageManager.PERMISSION_GRANTED
//                ) {
//
//                    textChange = 2
//                    ActivityCompat.requestPermissions(
//                        this,
//                        arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE),
//                        REQUEST_READ_STORAGE_PERMISSION
//                    )
//                }else{
//                    textChange = 3
//                    Toast.makeText(this, "Permission Already Granted!", Toast.LENGTH_SHORT).show()
//                }
//            } else {
//                Toast.makeText(this, "off", Toast.LENGTH_SHORT).show()
//            }
//        }

        button.setOnClickListener {
            textChange++
            when (textChange) {
                1 -> {
                    textContent.setText("Transform Your Screens with a Tap")
                    onBoardingImg.setImageResource(R.drawable.transform)
                    card3.visibility = View.VISIBLE
                    card4.visibility = View.GONE

                }

                2 -> {
                    textContent.setText("Connect, Mirror, and Share Effortlessly")
                    onBoardingImg.setImageResource(R.drawable.mirror_onbording)
                    card2.visibility = View.VISIBLE
                    card5.visibility = View.GONE
                    button.text = "Start"
                }

                3 -> {
                    textContent.setText("Grant permission!")
                    onBoardingImg.setImageResource(R.drawable.permissions)
                    card1.visibility = View.VISIBLE
                    card6.visibility = View.GONE
                    button.text = "Start"
                    permissionSwitch.visibility = View.VISIBLE
//                    if (Build.VERSION.SDK_INT >= 32) {
//                        videoPermission.visibility = View.VISIBLE
//                        micPermission.visibility = View.VISIBLE
//
//                        if (ContextCompat.checkSelfPermission(
//                                this, Manifest.permission.READ_MEDIA_VIDEO
//                            ) != PackageManager.PERMISSION_GRANTED
//                        ) {
//                            videoPermission.isChecked = false
//                            textChange = 2
//                            Toast.makeText(
//                                this,
//                                "First grant all permissions",
//                                Toast.LENGTH_SHORT
//                            )
//                                .show()
//
//                            videoPermission.isActivated
//                        } else {
//                            videoPermission.isActivated
//                        }
//
//
//
//                        if (ContextCompat.checkSelfPermission(
//                                this, Manifest.permission.READ_MEDIA_AUDIO
//                            ) != PackageManager.PERMISSION_GRANTED
//                        ) {
//                            videoPermission.isChecked = false
//                            textChange = 2
//                            Toast.makeText(this, "First grant all permissions", Toast.LENGTH_SHORT)
//                                .show()
//                        }
//                    } else {
//                        videoPermission.visibility = View.VISIBLE
//                        if (ContextCompat.checkSelfPermission(
//                                this, Manifest.permission.READ_EXTERNAL_STORAGE
//                            ) != PackageManager.PERMISSION_GRANTED
//                        ) {
//                            videoPermission.isChecked = false
//                            textChange = 2
//                            Toast.makeText(this, "First grant all permissions", Toast.LENGTH_SHORT)
//                                .show()
//                        }
//                    }
                }

                else -> {
                    if (Build.VERSION.SDK_INT >= 32) {
                        if (ContextCompat.checkSelfPermission(
                                this, Manifest.permission.READ_MEDIA_VIDEO
                            ) != PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(
                                this, Manifest.permission.READ_MEDIA_AUDIO
                            ) != PackageManager.PERMISSION_GRANTED
                        ) {
                            permissionSwitch.isChecked = false
                            textChange = 2
                            Toast.makeText(
                                this, "First grant all permissions", Toast.LENGTH_SHORT
                            ).show()
                        } else {
                            startActivity(Intent(this, DashboardActivity::class.java))
                            finish()
                        }
                    } else {
                        if (ContextCompat.checkSelfPermission(
                                this, Manifest.permission.READ_EXTERNAL_STORAGE
                            ) != PackageManager.PERMISSION_GRANTED
                        ) {
                            permissionSwitch.isChecked = false
                            textChange = 2
                            Toast.makeText(this, "First grant all permissions", Toast.LENGTH_SHORT)
                                .show()
                        } else {
                            startActivity(Intent(this, DashboardActivity::class.java))
                            finish()
                        }
                    }

                }
            }
        }
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
                textChange = 3
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