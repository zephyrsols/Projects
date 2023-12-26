package com.example.screenmirroring


import android.content.ContentResolver
import android.content.ContentUris
import android.content.Context
import android.content.Intent
import android.content.res.Resources
import android.content.res.Resources.Theme
import android.database.Cursor
import android.net.Uri
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import android.view.View
import android.view.Window
import android.view.WindowManager
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.screenmirroring.databinding.ActivityAudiosBinding
import java.io.File

class Audios : AppCompatActivity() {
    private lateinit var binding: ActivityAudiosBinding
    private lateinit var folderSpinner: Spinner
    private lateinit var recyclerView: RecyclerView
    private lateinit var audioAdapter: AudioAdapter
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAudiosBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

        binding.backImage.setOnClickListener {
            finish()
        }






        folderSpinner = binding.audioSpinner
        recyclerView = binding.recycleViewAudio
        recyclerView.layoutManager = LinearLayoutManager(this)
        loadFoldersAndFiles()
    }


    private fun getAudioFolders(): List<Pair<String, Int>> {
        val folderMap = mutableMapOf<String, Int>()
        val contentResolver: ContentResolver = contentResolver
        val uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        val projection = arrayOf(
            MediaStore.Audio.Media.DATA
        )

        val cursor: Cursor? = contentResolver.query(
            uri,
            projection,
            null,
            null,
            null
        )

        cursor?.use {
            val columnIndexFolder = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)
            while (it.moveToNext()) {
                val folderPath = it.getString(columnIndexFolder)
                val folderName = File(folderPath).parentFile?.name ?: continue

                val currentCount = folderMap[folderName] ?: 0
                folderMap[folderName] = currentCount + 1
            }
        }

        return folderMap.toList()
    }

    private fun loadFoldersAndFiles() {
        // Populate the spinner with folder names and audio counts
        val folderInfoList = getAudioFolders()
        val folderAdapter = FolderAdapter(this, folderInfoList)
        folderAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        folderSpinner.adapter = folderAdapter

        // Set a listener for folder selection
        folderSpinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(
                parentView: AdapterView<*>,
                selectedItemView: View?,
                position: Int,
                id: Long
            ) {
                // Load audio files for the selected folder
                val selectedFolderInfo = folderInfoList[position]
                val audioList = getAudioFilesForFolder(selectedFolderInfo.first)

                audioAdapter = AudioAdapter(this@Audios, audioList)
                audioAdapter?.onItemClickListener = object : AudioAdapter.OnItemClickListener {
                    override fun onItemClick(audio: AudioModel) {
                        // Handle click on the audio item (open externally)
                        openAudioExternally(audio.path)
                    }
                }

                recyclerView.adapter = audioAdapter
            }

            override fun onNothingSelected(parentView: AdapterView<*>) {
                // Do nothing here
            }
        }
    }

    private fun openAudioExternally(audioPath: String) {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.setDataAndType(Uri.parse(audioPath), "audio/*")
        startActivity(intent)
    }

    private fun getAudioFilesForFolder(folderName: String): List<AudioModel> {
        val audioList = mutableListOf<AudioModel>()
        val contentResolver: ContentResolver = contentResolver
        val uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        val projection = arrayOf(
            MediaStore.Audio.Media.DISPLAY_NAME,
            MediaStore.Audio.Media.DATA
        )
        val selection = "${MediaStore.Audio.Media.DATA} like ?"
        val selectionArgs = arrayOf("%/$folderName/%")

        val cursor: Cursor? = contentResolver.query(
            uri,
            projection,
            selection,
            selectionArgs,
            null
        )

        cursor?.use {
            val columnIndexName = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DISPLAY_NAME)
            val columnIndexData = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)

            while (it.moveToNext()) {
                val audioName = it.getString(columnIndexName)
                val audioPath = it.getString(columnIndexData)
                audioList.add(AudioModel(audioName, audioPath))
            }
        }

        return audioList
    }

}
