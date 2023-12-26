package com.example.screenmirroring

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.TextView

// FolderAdapter.kt

class FolderAdapter(context: Context, private val folderInfoList: List<Pair<String, Int>>) :
    ArrayAdapter<Pair<String, Int>>(context, R.layout.spinner_item_layout, folderInfoList) {

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        return createView(position, convertView, parent)
    }

    override fun getDropDownView(position: Int, convertView: View?, parent: ViewGroup): View {
        return createView(position, convertView, parent)
    }

    private fun createView(position: Int, convertView: View?, parent: ViewGroup): View {
        val inflater = LayoutInflater.from(context)
        val view = convertView ?: inflater.inflate(R.layout.spinner_item_layout, parent, false)

        val folderInfo = getItem(position)
        val textView = view.findViewById<TextView>(R.id.spinnerTextView)

        // Check for null before setting the text
        if (textView != null) {
            textView.text = "${folderInfo?.first} (${folderInfo?.second})"
        }

        return view
    }
}
