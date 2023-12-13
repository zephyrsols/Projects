package com.example.screenmirroring

// AudioAdapter.kt
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import android.content.Context
import android.content.Intent
import android.net.Uri


class AudioAdapter(private val context: Context, private val audioList: List<AudioModel>) :
    RecyclerView.Adapter<AudioAdapter.AudioViewHolder>() {

    class AudioViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val titleTextView: TextView = itemView.findViewById(R.id.titleTextView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): AudioViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.audio_items, parent, false)
        return AudioViewHolder(view)
    }

    override fun onBindViewHolder(holder: AudioViewHolder, position: Int) {
        val audio = audioList[position]
        holder.titleTextView.text = audio.title

        // Set a click listener on the item view
        holder.itemView.setOnClickListener {
            val intent = Intent(Intent.ACTION_VIEW)
            context.startActivity(intent)
        }
    }

    override fun getItemCount(): Int {
        return audioList.size
    }

    private fun openExternalPlayer(filePath: String) {
        // Create an implicit intent to open the file with an external player
        val intent = Intent(Intent.ACTION_VIEW)
        val uri = Uri.parse(filePath)
        intent.setDataAndType(uri, "audio/*")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

        // Check if there's an activity to handle the intent
        if (intent.resolveActivity(context.packageManager) != null) {
            context.startActivity(intent)
        }
    }
}
