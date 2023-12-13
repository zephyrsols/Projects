package com.example.screenmirroring

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide

// ImageAdapter.kt
class ImageAdapter(private val context: Context, private val images: List<String>) :
    RecyclerView.Adapter<ImageAdapter.ImageViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ImageViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.recycler_items, parent, false)
        return ImageViewHolder(view)
    }

    override fun onBindViewHolder(holder: ImageViewHolder, position: Int) {
        val imagePath = images[position]
        // Load and display the image using your preferred image loading library
        // Example using Glide:
        Glide.with(context).load(imagePath).into(holder.imageView)
        holder.itemView.setOnClickListener {
            // Handle click event, e.g., open video in a player
            // You can use an Intent to open the video in the default player or a custom player
            // Example: Open in default player
            val intent = Intent(Intent.ACTION_VIEW)
            context.startActivity(intent)
        }
    }

    override fun getItemCount(): Int {
        return images.size
    }

    inner class ImageViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val imageView: ImageView = itemView.findViewById(R.id.recyclerImage1)
    }
}
