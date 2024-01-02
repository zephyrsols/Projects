package com.example.screenmirroring.UI

import android.os.Bundle
import android.widget.ImageButton
import android.widget.SeekBar
import android.widget.TextView
import android.widget.VideoView
import androidx.appcompat.app.AppCompatActivity
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityVideoPlayerBinding


class VideoPlayerActivity : AppCompatActivity() {
    private lateinit var binding: ActivityVideoPlayerBinding
    private lateinit var videoView: VideoView
    private lateinit var fileNameText: TextView
    private lateinit var playPauseBtn: ImageButton
    private lateinit var seekBar: SeekBar
    private lateinit var videoRunnable: Runnable

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityVideoPlayerBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            videoView.stopPlayback()
            seekBar.removeCallbacks(videoRunnable)
            finish()
        }

        //Play & Pause Butotn Start
        playPauseBtn = binding.playPauseBtn
        playPauseBtn.setOnClickListener {
            if (videoView.isPlaying) {
                playPauseBtn.setImageResource(R.drawable.play)
                videoView.pause()
            } else {
                playPauseBtn.setImageResource(R.drawable.pause)
                videoView.start()
            }
        }
        //Play & Pause Butotn End


        //Video Player Start
        val path = intent.getStringExtra("path")
        videoView = binding.videoView
        videoView.setVideoPath(path)
        videoView.setOnPreparedListener { mediaPlayer ->
            val duration = mediaPlayer.duration
            seekBar.max = 100
            // Update SeekBar every second
            val updateInterval = 1000
            videoRunnable = object : Runnable {
                override fun run() {
                    val currentPosition = mediaPlayer.currentPosition
                    val progress = currentPosition * 100 / duration
                    seekBar.progress = progress
                    // Schedule the next update
                    seekBar.postDelayed(this, updateInterval.toLong())
                }
            }
            seekBar.postDelayed(videoRunnable, updateInterval.toLong())
        }
        videoView.start()
        videoView.setOnCompletionListener {
            playPauseBtn.setImageResource(R.drawable.play)
        }


        //Video Player End

        // SeekBar Listener Start
        seekBar = binding.seekBar
        seekBar.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
                if (fromUser) {
                    // Seek the video to the selected position
                    val newPosition = progress * videoView.duration / 100
                    videoView.seekTo(newPosition)
                }
            }

            override fun onStartTrackingTouch(seekBar: SeekBar?) {
                // Not needed for this example
            }

            override fun onStopTrackingTouch(seekBar: SeekBar?) {
                // Not needed for this example
            }
        })
        // SeekBar Listener End
    }

    override fun onBackPressed() {
        // Stop the video playback and remove callbacks
        videoView.stopPlayback()
        seekBar.removeCallbacks(videoRunnable)
        super.onBackPressed()
    }
}