package com.example.screenmirroring

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide

class VideoAdapter(private val context: Context, private val originalVideoList: List<VideoModel>) :
    RecyclerView.Adapter<VideoAdapter.ViewHolder>() {

    private var videoList = originalVideoList.toList()

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val thumbnailImageView: ImageView = view.findViewById(R.id.recyclerImage1)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.recycler_items, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val video = videoList[position]

        Glide.with(context)
            .load(video.contentUri)
            .into(holder.thumbnailImageView)

        holder.itemView.setOnClickListener {
            // Handle click event, e.g., open video in a player
            // You can use an Intent to open the video in the default player or a custom player
            // Example: Open in default player

            val intent = Intent(context, VideoPlayer::class.java)
            intent.putExtra("path", video.contentUri.toString())
            context.startActivity(intent)
        }
    }

    override fun getItemCount(): Int {
        return videoList.size
    }

    fun updateList(newList: List<VideoModel>) {
        videoList = newList.toList()
        notifyDataSetChanged()
    }
}