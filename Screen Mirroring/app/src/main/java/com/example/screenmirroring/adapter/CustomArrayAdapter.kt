package com.example.screenmirroring.adapter


import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.TextView
import com.example.screenmirroring.R

class CustomArrayAdapter(context: Context, resource: Int, objects: List<String>) :
    ArrayAdapter<String>(context, resource, objects) {

    private val inflater: LayoutInflater = LayoutInflater.from(context)

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        val view = super.getView(position, convertView, parent)
        (view as? TextView)?.setTextColor(context.resources.getColor(android.R.color.white))
        return view
    }

    override fun getDropDownView(position: Int, convertView: View?, parent: ViewGroup): View {
        val view = inflater.inflate(R.layout.spinner_item_layout, parent, false)
        val textView = view.findViewById<TextView>(R.id.spinnerTextView) // Adjust the ID here
        textView.text = getItem(position)
        return view
    }

}
