package com.example.screenmirroring

import android.content.ContentUris
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.screenmirroring.databinding.ActivityVideosBinding
import java.io.File


class Videos : AppCompatActivity() {

    //declaring  variables
    private lateinit var binding: ActivityVideosBinding
    private lateinit var recyclerView: RecyclerView
    private lateinit var videoAdapter: VideoAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityVideosBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

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
        val videoList = getVideoList()
        videoAdapter = VideoAdapter(this, videoList)
        recyclerView.adapter = videoAdapter

        val folderSpinner = findViewById<Spinner>(R.id.videosSpinner)
        val folderCounts = videoList.groupBy { it.folderName }
            .map { "${it.key} (${it.value.size})" }

        val spinnerAdapter = CustomArrayAdapter(this, android.R.layout.simple_spinner_item, folderCounts)
        spinnerAdapter.setDropDownViewResource(R.layout.spinner_item_layout)

        folderSpinner.adapter = spinnerAdapter

        folderSpinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(
                parentView: AdapterView<*>,
                selectedItemView: View?,
                position: Int,
                id: Long
            ) {
                // Handle item selection
                val selectedFolder = folderSpinner.selectedItem.toString()
                val folderName = selectedFolder.substringBefore(" (").trim()
                val filteredVideoList = videoList.filter { it.folderName == folderName }
                videoAdapter.updateList(filteredVideoList)
            }

            override fun onNothingSelected(parentView: AdapterView<*>) {
                // Provide your implementation for onNothingSelected here
                // This method is called when no item is selected in the spinner
            }
        }

    }

    private fun getVideoList(): List<VideoModel> {
        val videoList = mutableListOf<VideoModel>()
        val projection = arrayOf(
            MediaStore.Video.Media._ID,
            MediaStore.Video.Media.DISPLAY_NAME,
            MediaStore.Video.Media.DATA
        )

        val cursor = contentResolver.query(
            MediaStore.Video.Media.EXTERNAL_CONTENT_URI, projection, null, null, null
        )

        cursor?.use {
            val idColumn = it.getColumnIndexOrThrow(MediaStore.Video.Media._ID)
            val displayNameColumn =
                it.getColumnIndexOrThrow(MediaStore.Video.Media.DISPLAY_NAME)
            val dataColumn = it.getColumnIndexOrThrow(MediaStore.Video.Media.DATA)

            while (it.moveToNext()) {
                val id = it.getLong(idColumn)
                val contentUri = ContentUris.withAppendedId(
                    MediaStore.Video.Media.EXTERNAL_CONTENT_URI, id
                )
                val folderPath = it.getString(dataColumn)
                val folderName = File(folderPath).parentFile?.name ?: "Unknown Folder"

                videoList.add(VideoModel(id, contentUri, folderName))
            }
        }

        return videoList
    }
}