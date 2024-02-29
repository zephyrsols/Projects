package com.example.screenmirroring.UI


import android.content.Context
import android.database.Cursor
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.screenmirroring.R
import com.example.screenmirroring.adapter.ImageAdapter
import com.example.screenmirroring.databinding.ActivityImagesBinding
import com.example.screenmirroring.model.FolderModel
import com.example.screenmirroring.model.ImageModel
import java.io.File

class ImagesActivity : AppCompatActivity() {

    //declaring  variables
    private lateinit var binding: ActivityImagesBinding
    private lateinit var recyclerView: RecyclerView
    private lateinit var spinner: Spinner
    private lateinit var imageAdapter: ImageAdapter
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityImagesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)


        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }

        recyclerView = binding.recyclerView
        spinner = binding.imagesSpinner

        spinner = binding.imagesSpinner
        recyclerView = binding.recyclerView

        setupRecyclerView()
        loadImages()
        setupRecyclerView()

        // Load folder names and set up Spinner
        val folderNames = getFolderNames()
        setupSpinner(folderNames)

        // Load images from the first folder initially
        if (folderNames.isNotEmpty()) {
            val initialFolder = getImagesFromFolder(folderNames[0])
            imageAdapter.updateData(initialFolder)
        }

    }


    private fun setupRecyclerView() {
        imageAdapter = ImageAdapter(applicationContext,mutableListOf())
        recyclerView.layoutManager = GridLayoutManager(this,4)
        recyclerView.adapter = imageAdapter
    }

    private fun getFolderNames(): List<String> {
        val folderList = mutableListOf<String>()
        val root = Environment.getExternalStorageDirectory()
        val directory = File(root.path)

        val folders = directory.listFiles { file ->
            file.isDirectory && containsImageFiles(file)
        }

        folders?.forEach { folderList.add(it.name) }

        return folderList
    }

    private fun containsImageFiles(directory: File): Boolean {
        val files = directory.listFiles()
        return files?.any { it.isFile && isImageFile(it.name) } ?: false
    }

    private fun isImageFile(fileName: String): Boolean {
        // You can customize this function to check for image file extensions or other criteria
        return true
    }

    private fun setupSpinner(folderNames: List<String>) {
        val spinnerAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, folderNames)
        spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner.adapter = spinnerAdapter

        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(
                parent: AdapterView<*>?,
                view: View?,
                position: Int,
                id: Long
            ) {
                val selectedFolder = getImagesFromFolder(folderNames[position])
                imageAdapter.updateData(selectedFolder)
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                // Do nothing
            }
        }
    }

    private fun getImagesFromFolder(folderName: String): List<ImageModel> {
        val imageList = mutableListOf<ImageModel>()
        val root = Environment.getExternalStorageDirectory()
        val directory = File("$root/$folderName")

        directory.listFiles { _, name ->
            isImageFile(name)
        }?.forEach { imageList.add(ImageModel(it.absolutePath)) }

        return imageList
    }



    private fun loadImages() {
        val foldersWithImages = getFoldersWithImages(this)
        val allImages = foldersWithImages.flatMap { it.images }

        imageAdapter.updateData(allImages)
    }

    private fun getFoldersWithImages(context: Context): List<FolderModel> {
        val foldersList = mutableListOf<FolderModel>()
        val projection = arrayOf(MediaStore.Images.Media.DATA)
        val cursor: Cursor? = context.contentResolver.query(
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
                val folderPath = File(imagePath).parent // Assuming images are organized in folders

                // Check if the folder is already in the list
                val existingFolder = foldersList.find { folder -> folder.folderName == folderPath }
                if (existingFolder != null) {
                    existingFolder.images.addAll(listOf(ImageModel(imagePath)))
                } else {
                    // Create a new folder entry
                    val newFolder = FolderModel(folderPath, mutableListOf(ImageModel(imagePath)))
                    foldersList.add(newFolder)
                }
            }
        }
        return foldersList
    }

}