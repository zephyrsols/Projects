package com.example.screenmirroring

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.MediaController
import android.widget.TextView
import android.widget.Toast
import android.widget.VideoView
import com.example.screenmirroring.databinding.ActivityVideoPlayerBinding

class VideoPlayer : AppCompatActivity() {
    lateinit var binding: ActivityVideoPlayerBinding
    lateinit var videoView: VideoView
    var mediaController: MediaController? = null
    lateinit var fileNameText: TextView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityVideoPlayerBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window,resources,theme)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }

        val path = intent.getStringExtra("path")
        Toast.makeText(this, path, Toast.LENGTH_SHORT).show()
        videoView = binding.videoView

        if (mediaController == null) {
            mediaController = MediaController(this)

        }

        videoView.setMediaController(mediaController)

        videoView.setVideoPath(path)
        videoView.start()

        videoView.setOnCompletionListener {
            Toast.makeText(this, "Video End!", Toast.LENGTH_SHORT).show()
        }

        videoView.setOnErrorListener { mp, what, extra ->
            Toast.makeText(this, "An Error Occured While Playing Video", Toast.LENGTH_SHORT).show()
            false
        }

    }
}