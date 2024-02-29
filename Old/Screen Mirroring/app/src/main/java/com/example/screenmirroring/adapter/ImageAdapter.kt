package com.example.screenmirroring.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.screenmirroring.model.ImageModel
import com.example.screenmirroring.R

class ImageAdapter(private val context: Context, private var images: MutableList<ImageModel>) : RecyclerView.Adapter<ImageAdapter.ImageViewHolder>() {

    class ImageViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val imageView: ImageView = itemView.findViewById(R.id.recyclerImage1)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ImageViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.recycler_items, parent, false)
        return ImageViewHolder(view)
    }

    override fun onBindViewHolder(holder: ImageViewHolder, position: Int) {
        val image = images[position]
        Glide.with(holder.itemView.context)
            .load(image.imagePath)
            .into(holder.imageView)
        holder.itemView.setOnClickListener{
            Toast.makeText(context,image.imagePath.toString(),Toast.LENGTH_SHORT).show()
        }
    }

    override fun getItemCount(): Int {
        return images.size
    }

    // Update data when a new folder is selected
    fun updateData(newImages: List<ImageModel>) {
        images = newImages.toMutableList()
        notifyDataSetChanged()
    }
}
