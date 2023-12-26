package com.example.screenmirroring

import android.R.id
import android.net.Uri
import android.os.Bundle
import android.widget.MediaController
import android.widget.TextView
import android.widget.Toast
import android.widget.VideoView
import androidx.appcompat.app.AppCompatActivity
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

        val uriPath = ("android.resource://"
                + packageName + "/" + 214)
        Toast.makeText(this,uriPath.toString(),Toast.LENGTH_SHORT).show()
        val path = intent.getStringExtra("path")
        Toast.makeText(this, path, Toast.LENGTH_SHORT).show()
        videoView = binding.videoView

        if (mediaController == null) {
            mediaController = MediaController(this)

        }

        videoView.setMediaController(mediaController)

        val uri = Uri.parse(uriPath)
        videoView.setVideoURI(uri)
        videoView.start()

        videoView.setOnCompletionListener {
            Toast.makeText(this, "Video End!", Toast.LENGTH_SHORT).show()
            finish()
        }

        videoView.setOnErrorListener { mp, what, extra ->
            Toast.makeText(this, "An Error Occured While Playing Video", Toast.LENGTH_SHORT).show()
            false
        }

    }
}