package com.ai.image.generator.ah.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.adapter.homeFragmentAdapter
import com.ai.image.generator.ah.databinding.FragmentSavedBinding

/**
 * A simple [Fragment] subclass.
 * Use the [SavedFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"
class SavedFragment : Fragment() {
    // TODO: Rename and change types of parameters
    private var param1: String? = null
    private var param2: String? = null
    private lateinit var binding: FragmentSavedBinding
    private lateinit var recyclerView: RecyclerView


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            param1 = it.getString(com.ai.image.generator.ah.fragment.ARG_PARAM1)
            param2 = it.getString(com.ai.image.generator.ah.fragment.ARG_PARAM2)
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        binding = FragmentSavedBinding.inflate(inflater,container,false)
        recyclerView = binding.recyclerView
        recyclerView.layoutManager = GridLayoutManager(requireContext(), 4)
        val styleNameList = listOf(
            "Euphoric",
            "Tattoo",
            "3D Game",
            "Glitch",
            "Minimalism",
            "Fantasy",
            "Crayon Art",
            "Anime V2",
            "Euphoric",
            "Tattoo",
            "3D Game",
            "Glitch",
            "Minimalism",
            "Fantasy",
            "Crayon Art",
            "Anime V2",
            "Euphoric",
            "Tattoo",
            "3D Game",
            "Glitch",
            "Minimalism",
            "Fantasy",
            "Crayon Art",
            "Anime V2",

            "Tattoo",
            "3D Game",
            "Glitch",
            "Minimalism",
            "Fantasy",
            "Crayon Art",
            "Anime V2",
            "Euphoric",
            "Tattoo",
            "3D Game",
            "Glitch",
            "Minimalism",
            "Fantasy",
            "Crayon Art",
            "Anime V2",
        )
        val adapter = homeFragmentAdapter(styleNameList)
        recyclerView.adapter = adapter
        return binding.root
    }

    companion object {
        /**
         * Use this factory method to create a new instance of
         * this fragment using the provided parameters.
         *
         * @param param1 Parameter 1.
         * @param param2 Parameter 2.
         * @return A new instance of fragment SavedFragment.
         */
        // TODO: Rename and change types and number of parameters
        @JvmStatic
        fun newInstance(param1: String, param2: String) =
            SavedFragment().apply {
                arguments = Bundle().apply {
                    putString(com.ai.image.generator.ah.fragment.ARG_PARAM1, param1)
                    putString(com.ai.image.generator.ah.fragment.ARG_PARAM2, param2)
                }
            }
    }
}