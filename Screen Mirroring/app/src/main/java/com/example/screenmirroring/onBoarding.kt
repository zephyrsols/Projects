package com.example.screenmirroring

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.RequiresApi
import androidx.cardview.widget.CardView
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.screenmirroring.databinding.ActivityOnBoardingBinding

class onBoarding : AppCompatActivity() {

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

        card1.visibility = View.GONE
        card2.visibility = View.GONE
        card3.visibility = View.GONE

        binding.skipText.setOnClickListener {
            startActivity(Intent(this, Dashboard::class.java))
            finish()
        }


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
                    textContent.setText("Grant permission to view the device screen in real-time. you can record the screen or take screenshot for demonstration purposes.")
                    onBoardingImg.setImageResource(R.drawable.permissions)
                    card1.visibility = View.VISIBLE
                    card6.visibility = View.GONE
                    button.text = "Grant permission"
                    if (Build.VERSION.SDK_INT >= 32) {
                        if (ContextCompat.checkSelfPermission(
                                this,
                                android.Manifest.permission.READ_MEDIA_VIDEO
                            ) != android.content.pm.PackageManager.PERMISSION_GRANTED
                        ) {
                            ActivityCompat.requestPermissions(
                                this,
                                arrayOf(android.Manifest.permission.READ_MEDIA_VIDEO),
                                onBoarding.READ_MEDIA_VIDEO
                            )
                        }
                        if (ContextCompat.checkSelfPermission(
                                this,
                                android.Manifest.permission.READ_MEDIA_AUDIO
                            ) != android.content.pm.PackageManager.PERMISSION_GRANTED
                        ) {
                            ActivityCompat.requestPermissions(
                                this,
                                arrayOf(android.Manifest.permission.READ_MEDIA_AUDIO),
                                onBoarding.READ_MEDIA_AUDIO
                            )
                        }
                    } else {
                        if (ContextCompat.checkSelfPermission(
                                this,
                                android.Manifest.permission.READ_EXTERNAL_STORAGE
                            ) != android.content.pm.PackageManager.PERMISSION_GRANTED
                        ) {
                            ActivityCompat.requestPermissions(
                                this,
                                arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE),
                                onBoarding.REQUEST_READ_STORAGE_PERMISSION
                            )
                        }
                    }
                }

                else -> {
                    startActivity(Intent(this, Dashboard::class.java))
                    finish()
                }
            }
        }
    }
}