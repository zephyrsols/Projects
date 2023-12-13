package com.example.myapplication

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide

// VideoThumbnailAdapter.kt
class VideoThumbnailAdapter(
    private val context: Context,
    private val videoThumbnails: List<String>
) : RecyclerView.Adapter<VideoThumbnailAdapter.VideoThumbnailViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VideoThumbnailViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.recycler_items, parent, false)
        return VideoThumbnailViewHolder(view)
    }

    override fun onBindViewHolder(holder: VideoThumbnailViewHolder, position: Int) {
        val thumbnailPath = videoThumbnails[position]
        // Load and display the video thumbnail using your preferred image loading library
        // Example using Glide:
        Glide.with(context).load(thumbnailPath).into(holder.thumbnailImageView)
    }

    override fun getItemCount(): Int {
        return videoThumbnails.size
    }

    inner class VideoThumbnailViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val thumbnailImageView: ImageView = itemView.findViewById(R.id.recyclerImage1)
    }
}
