package com.example.screenmirroring


import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.MediaStore
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.screenmirroring.databinding.ActivityImagesBinding

class Images : AppCompatActivity() {

    //declaring  variables
    private lateinit var binding: ActivityImagesBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityImagesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window,resources,theme)


        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }

        val images = getImages(this)
        val recyclerView: RecyclerView = binding.recyclerView
        val layoutManager = GridLayoutManager(this, 4)
        recyclerView.layoutManager = layoutManager
        val adapter = ImageAdapter(this, images)
        recyclerView.adapter = adapter
        recyclerView.layoutManager = GridLayoutManager(this,4)

    }




    //function to get images from the device's gallery
    private fun getImages(context: Context): List<String> {
        val imagesList = mutableListOf<String>()
        val projection = arrayOf(MediaStore.Images.Media.DATA)
        val cursor = context.contentResolver.query(
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            null
        )
        cursor?.use {
            val columnIndex = it.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
            while (it.moveToNext()) {
                val imagePath = it.getString(columnIndex)
                imagesList.add(imagePath)
            }
        }
        return imagesList
    }



}