package com.example.screenmirroring


import android.content.ContentUris
import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.screenmirroring.databinding.ActivityAudiosBinding

class Audios : AppCompatActivity() {
    private lateinit var binding: ActivityAudiosBinding
    private lateinit var recyclerView: RecyclerView
    private lateinit var audioAdapter: AudioAdapter
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAudiosBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.backImage.setOnClickListener {
            finish()
        }

        binding.allAudioBtn.setOnClickListener {
            startActivity(
                Intent().setType("image/*").setAction(android.content.Intent.ACTION_VIEW)
                    .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            )
        }
        val audioList = getAudioFiles(this)
        val recyclerView: RecyclerView = findViewById(R.id.recycleViewAudio)
        val layoutManager = LinearLayoutManager(this)
        val adapter = AudioAdapter(this, audioList)


        recyclerView.layoutManager = layoutManager
        recyclerView.adapter = adapter
    }

        fun getAudioFiles(context: Context): List<AudioModel> {
            val audioList = mutableListOf<AudioModel>()
            val uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
            val projection = arrayOf(
                MediaStore.Audio.Media.TITLE,
                MediaStore.Audio.Media.DATA
            )

            val cursor = context.contentResolver.query(uri, projection, null, null, null)

            cursor?.use {
                val titleColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
                val filePathColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)

                while (it.moveToNext()) {
                    val title = it.getString(titleColumn)
                    val filePath = it.getString(filePathColumn)
                    val audioModel = AudioModel(title, filePath)
                    audioList.add(audioModel)
                }
            }

            return audioList
        }

    }