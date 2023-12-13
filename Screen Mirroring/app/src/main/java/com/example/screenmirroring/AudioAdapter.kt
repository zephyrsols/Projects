package com.example.screenmirroring

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

// AudioAdapter.kt
// Inside your AudioAdapter
// Inside your AudioAdapter
class AudioAdapter(private val audioList: List<AudioModel>) : RecyclerView.Adapter<AudioAdapter.ViewHolder>() {

    interface OnItemClickListener {
        fun onItemClick(audio: AudioModel)
    }

    var onItemClickListener: OnItemClickListener? = null

    inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val audioNameTextView: TextView = itemView.findViewById(R.id.titleTxt)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.audio_items, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val audio = audioList[position]
        holder.audioNameTextView.text = audio.name

        holder.itemView.setOnClickListener {
            onItemClickListener?.onItemClick(audio)
        }
    }

    override fun getItemCount(): Int = audioList.size
}
