package com.example.screenmirroring

import android.content.ContentUris
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.screenmirroring.databinding.ActivityVideosBinding


class Videos : AppCompatActivity() {

    //declaring  variables
    private lateinit var binding: ActivityVideosBinding
    private lateinit var recyclerView: RecyclerView
    private lateinit var videoAdapter: VideoAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityVideosBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }
        recyclerView = binding.recyclerView
        recyclerView.layoutManager = GridLayoutManager(this@Videos, 4)
        initializeRecyclerView()

    }


    //function to Initialize Recycler View
    private fun initializeRecyclerView() {
        // Get the list of videos from the device
        val videoList = getVideoList()
        // Initialize the adapter with the video list
        videoAdapter = VideoAdapter(this, videoList)
        // Set the adapter to the RecyclerView
        recyclerView.adapter = videoAdapter
    }

    private fun getVideoList(): List<VideoModel> {
        val videoList = mutableListOf<VideoModel>()
        val projection = arrayOf(
            MediaStore.Video.Media._ID, MediaStore.Video.Media.DISPLAY_NAME
        )

        val cursor = contentResolver.query(
            MediaStore.Video.Media.EXTERNAL_CONTENT_URI, projection, null, null, null
        )

        cursor?.use {
            val idColumn = it.getColumnIndexOrThrow(MediaStore.Video.Media._ID)
            val displayNameColumn = it.getColumnIndexOrThrow(MediaStore.Video.Media.DISPLAY_NAME)

            while (it.moveToNext()) {
                val id = it.getLong(idColumn)
                val contentUri = ContentUris.withAppendedId(
                    MediaStore.Video.Media.EXTERNAL_CONTENT_URI, id
                )
                videoList.add(VideoModel(id, contentUri))
            }
        }

        return videoList
    }


}