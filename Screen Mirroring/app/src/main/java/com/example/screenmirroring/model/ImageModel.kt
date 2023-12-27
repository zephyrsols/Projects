package com.example.screenmirroring.model

data class ImageModel(val imagePath: String)

data class FolderModel(val folderName: String, val images: MutableList<ImageModel>)
