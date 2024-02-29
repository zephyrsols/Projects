package com.example.screenmirroring.UI

import android.annotation.SuppressLint
import android.media.AudioManager
import android.media.MediaPlayer
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageButton
import android.widget.TextView
import android.widget.Toast
import com.example.screenmirroring.databinding.ActivityAudioPlayerBinding

class AudioPlayerActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAudioPlayerBinding
    private lateinit var playBtn: ImageButton
    private lateinit var pauseBtn: ImageButton
    private lateinit var mediaPlayer: MediaPlayer
    private lateinit var fileNameText: TextView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAudioPlayerBinding.inflate(layoutInflater)
        setContentView(binding.root)

        playBtn = binding.playBtn
        pauseBtn = binding.pauseBtn
        fileNameText = binding.fileNameText

        mediaPlayer = MediaPlayer()
        val path = intent.getStringExtra("path")
        val name = intent.getStringExtra("name")

        fileNameText.text = name
        playBtn.setOnClickListener {
            mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC)

            try {
                mediaPlayer.setDataSource(path)
                mediaPlayer.prepare()
                mediaPlayer.start()
            } catch (e: Exception) {
                Toast.makeText(this, e.message.toString(), Toast.LENGTH_SHORT).show()
            }
            Toast.makeText(this, "Audio start!", Toast.LENGTH_SHORT).show()
        }

        pauseBtn.setOnClickListener {
            if (mediaPlayer.isPlaying) {
                mediaPlayer.reset()

                Toast.makeText(this, "Audio stop!", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this, "No audio playing!", Toast.LENGTH_SHORT).show()
            }
        }
    }

    @Deprecated("Deprecated in Java", ReplaceWith("finish()"))
    @SuppressLint("MissingSuperCall")
    override fun onBackPressed() {
        mediaPlayer.reset()
        finish()
    }
}