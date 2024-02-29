package com.ai.image.generator.ah.fragment

import android.annotation.SuppressLint
import android.app.AlertDialog
import android.graphics.BitmapFactory
import android.os.Bundle
import android.os.Environment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.RelativeLayout
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.ai.image.generator.ah.api.ImageGenerator
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.FragmentHomeBinding
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

/**
 * A simple [Fragment] subclass.
 * Use the [HomeFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

class HomeFragment : Fragment() {
    // TODO: Rename and change types of parameters
    private var param1: String? = null
    private var param2: String? = null
    private lateinit var binding: FragmentHomeBinding
    private lateinit var generatorBtn: LinearLayout
    private lateinit var prompt: TextInputEditText
    private lateinit var square: RelativeLayout
    private lateinit var portrait: RelativeLayout
    private lateinit var landscape: RelativeLayout
    private lateinit var squareTxt: TextView
    private lateinit var portraitTxt: TextView
    private lateinit var landscapeTxt: TextView

    private lateinit var btnArt: LinearLayout
    private lateinit var btnCreatures: LinearLayout
    private lateinit var btnFantasy: LinearLayout
    private lateinit var btnArchitecture: LinearLayout
    private lateinit var btnLogo: LinearLayout
    private lateinit var btnCyber: LinearLayout
    private lateinit var btnAnime: LinearLayout
    private lateinit var btnOld: LinearLayout
    private lateinit var btnPainting: LinearLayout
    private lateinit var btnAbstract: LinearLayout
    private lateinit var btnImpressionism: LinearLayout
    private lateinit var btnSurreal: LinearLayout
    private lateinit var btn3D: LinearLayout
    private lateinit var btnOrigami: LinearLayout
    private lateinit var btnHologram: LinearLayout

    private lateinit var URL: String

    private lateinit var tvSelectedArt: TextView
    private lateinit var tvSelectedCreatures: TextView
    private lateinit var tvSelectedFantasy: TextView
    private lateinit var tvSelectedArchitecture: TextView
    private lateinit var tvSelectedLogo: TextView
    private lateinit var tvSelectedCyber: TextView
    private lateinit var tvSelectedAnime: TextView
    private lateinit var tvSelectedOld: TextView
    private lateinit var tvSelectedPainting: TextView
    private lateinit var tvSelectedAbstract: TextView
    private lateinit var tvSelectedImpressionism: TextView
    private lateinit var tvSelectedSurreal: TextView
    private lateinit var tvSelected3D: TextView
    private lateinit var tvSelectedOrigami: TextView
    private lateinit var tvSelectedHologram: TextView

    private val apiKey = "YOUR_DEEP_AI_API_KEY"
    private val imageGenerator = ImageGenerator(apiKey)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = FragmentHomeBinding.inflate(layoutInflater)
        arguments?.let {
            param1 = it.getString(ARG_PARAM1)
            param2 = it.getString(ARG_PARAM2)


        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // Inflate the layout for this fragment
        binding = FragmentHomeBinding.inflate(inflater, container, false)
        generatorBtn = binding.generatorBtn
        prompt = binding.prompt

        square = binding.square
        portrait = binding.portrait
        landscape = binding.landscape
        squareTxt = binding.squareTxt
        portraitTxt = binding.portraitTxt
        landscapeTxt = binding.landscapeTxt

        portraitTxt.visibility = View.INVISIBLE
        landscapeTxt.visibility = View.INVISIBLE

        square.setOnClickListener {
            squareTxt.visibility = View.VISIBLE
            portraitTxt.visibility = View.INVISIBLE
            landscapeTxt.visibility = View.INVISIBLE
        }

        portrait.setOnClickListener {
            squareTxt.visibility = View.INVISIBLE
            portraitTxt.visibility = View.VISIBLE
            landscapeTxt.visibility = View.INVISIBLE
        }

        landscape.setOnClickListener {
            squareTxt.visibility = View.INVISIBLE
            portraitTxt.visibility = View.INVISIBLE
            landscapeTxt.visibility = View.VISIBLE
        }

        initialize()
        selectStyle("art")
        onClicks()

        generatorBtn.setOnClickListener {
            val text = prompt.text.toString().trim()
            if (text.isNotEmpty()) {
                generateImageAndShowDialog(text)
            } else {
                Toast.makeText(
                    requireContext(),
                    "Enter text before generating image",
                    Toast.LENGTH_SHORT
                ).show()
            }
        }
        return binding.root
    }

    companion object {
        /**
         * Use this factory method to create a new instance of
         * this fragment using the provided parameters.
         *
         * @param param1 Parameter 1.
         * @param param2 Parameter 2.
         * @return A new instance of fragment HomeFragment.
         */
        // TODO: Rename and change types and number of parameters
        @JvmStatic
        fun newInstance(param1: String, param2: String) =
            HomeFragment().apply {
                arguments = Bundle().apply {
                    putString(ARG_PARAM1, param1)
                    putString(ARG_PARAM2, param2)
                }
            }
    }

    private fun generateImageAndShowDialog(text: String) {
        GlobalScope.launch {
            try {
                val response = imageGenerator.generateImage(text)
                withContext(Dispatchers.Main) {
                    if (response.isSuccessful) {
                        val imageBytes = response.body()?.bytes()
                        showImageDialog(imageBytes)
                    } else {
                        Toast.makeText(
                            requireContext(),
                            "Error generating image",
                            Toast.LENGTH_SHORT
                        ).show()
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
                withContext(Dispatchers.Main) {
                    Toast.makeText(requireContext(), "Error generating image", Toast.LENGTH_SHORT)
                        .show()
                }
            }
        }
    }

    @SuppressLint("MissingInflatedId")
    private fun showImageDialog(imageBytes: ByteArray?) {
        val builder = AlertDialog.Builder(requireContext())
        val inflater = layoutInflater
        val dialogLayout = inflater.inflate(R.layout.dialog_image, null)

        val imageView = dialogLayout.findViewById<ImageView>(R.id.imageView)
        imageView.setImageBitmap(BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes!!.size))

        builder.setView(dialogLayout)
            .setPositiveButton("Download") { _, _ ->
                downloadImage(imageBytes)
            }
            .setNegativeButton("Save to Firebase") { _, _ ->
                saveImageToFirebase(imageBytes)
            }
            .show()
    }

    private fun downloadImage(imageBytes: ByteArray?) {
        val state = Environment.getExternalStorageState()
        if (Environment.MEDIA_MOUNTED == state) {
            val folder = File(Environment.getExternalStorageDirectory(), "YourAppImages")
            if (!folder.exists()) {
                folder.mkdirs()
            }

            try {
                val file = File(folder, "image.png")
                val fos = FileOutputStream(file)
                fos.write(imageBytes)
                fos.close()

                Toast.makeText(
                    requireContext(),
                    "Image downloaded successfully",
                    Toast.LENGTH_SHORT
                ).show()
            } catch (e: IOException) {
                e.printStackTrace()
                Toast.makeText(requireContext(), "Error downloading image", Toast.LENGTH_SHORT)
                    .show()
            }
        } else {
            Toast.makeText(requireContext(), "External storage not available", Toast.LENGTH_SHORT)
                .show()
        }
    }

    private fun saveImageToFirebase(imageBytes: ByteArray?) {
        val storage = FirebaseStorage.getInstance()
        val storageRef: StorageReference = storage.reference
        val imagesRef: StorageReference = storageRef.child("images/image.png")

        GlobalScope.launch {
            withContext(Dispatchers.IO) {
                imagesRef.putBytes(imageBytes!!).await()
            }
            withContext(Dispatchers.Main) {
                Toast.makeText(requireContext(), "Image saved to Firebase", Toast.LENGTH_SHORT)
                    .show()
            }
        }
    }

    private fun onClicks() {
        btnArt.setOnClickListener(View.OnClickListener { selectStyle("art") })
        btnCreatures.setOnClickListener(View.OnClickListener { selectStyle("creatures") })
        btnArchitecture.setOnClickListener(View.OnClickListener { selectStyle("archi") })
        btnFantasy.setOnClickListener(View.OnClickListener { selectStyle("fantasy") })
        btnLogo.setOnClickListener(View.OnClickListener { selectStyle("logo") })
        btnCyber.setOnClickListener(View.OnClickListener { selectStyle("cyber") })
        btnAnime.setOnClickListener(View.OnClickListener { selectStyle("anime") })
        btnOld.setOnClickListener(View.OnClickListener { selectStyle("old") })
        btnPainting.setOnClickListener(View.OnClickListener { selectStyle("painting") })
        btnAbstract.setOnClickListener(View.OnClickListener { selectStyle("abstract") })
        btnImpressionism.setOnClickListener(View.OnClickListener { selectStyle("impression") })
        btnSurreal.setOnClickListener(View.OnClickListener { selectStyle("surr") })
        btn3D.setOnClickListener(View.OnClickListener { selectStyle("3d") })
        btnOrigami.setOnClickListener(View.OnClickListener { selectStyle("origami") })
        btnHologram.setOnClickListener(View.OnClickListener { selectStyle("hologram") })
    }

    private fun selectStyle(style: String) {
        if (style.contains("art")) {
            URL = resources.getString(R.string.art_url)
            tvSelectedArt.setVisibility(View.VISIBLE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("creatures")) {
            URL = resources.getString(R.string.creatures_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.VISIBLE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("fantasy")) {
            URL = resources.getString(R.string.fantasy_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.VISIBLE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("archi")) {
            URL = resources.getString(R.string.architecture_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.VISIBLE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("logo")) {
            URL = resources.getString(R.string.logo_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.VISIBLE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("cyber")) {
            URL = resources.getString(R.string.cyber_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.VISIBLE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("anime")) {
            URL = resources.getString(R.string.anime_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.VISIBLE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("old")) {
            URL = resources.getString(R.string.old_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.VISIBLE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("painting")) {
            URL = resources.getString(R.string.painting_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.VISIBLE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("abstract")) {
            URL = resources.getString(R.string.abstract_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.VISIBLE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("impression")) {
            URL = resources.getString(R.string.impression_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.VISIBLE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("surr")) {
            URL = resources.getString(R.string.surreal_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.VISIBLE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("3d")) {
            URL = resources.getString(R.string.threeD_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.VISIBLE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("origami")) {
            URL = resources.getString(R.string.origami_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.VISIBLE)
            tvSelectedHologram.setVisibility(View.GONE)
        } else if (style.contains("hologram")) {
            URL = resources.getString(R.string.hologram_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.VISIBLE)
        } else if (style.contains("water")) {
            URL = resources.getString(R.string.watercolor_url)
            tvSelectedArt.setVisibility(View.GONE)
            tvSelectedCreatures.setVisibility(View.GONE)
            tvSelectedFantasy.setVisibility(View.GONE)
            tvSelectedArchitecture.setVisibility(View.GONE)
            tvSelectedLogo.setVisibility(View.GONE)
            tvSelectedCyber.setVisibility(View.GONE)
            tvSelectedAnime.setVisibility(View.GONE)
            tvSelectedOld.setVisibility(View.GONE)
            tvSelectedPainting.setVisibility(View.GONE)
            tvSelectedAbstract.setVisibility(View.GONE)
            tvSelectedImpressionism.setVisibility(View.GONE)
            tvSelectedSurreal.setVisibility(View.GONE)
            tvSelected3D.setVisibility(View.GONE)
            tvSelectedOrigami.setVisibility(View.GONE)
            tvSelectedHologram.setVisibility(View.GONE)

        }
    }

    private fun initialize() {
        tvSelectedArt = binding.tvSelectedArt as TextView
        tvSelectedCreatures = binding.tvSelectedCreatures as TextView
        tvSelectedFantasy = binding.tvSelectedFantasyWorld as TextView
        tvSelectedArchitecture = binding.tvSelectedArchitecture as TextView
        tvSelectedLogo = binding.tvSelectedLogo as TextView
        tvSelectedCyber = binding.tvSelectedCyberpunk as TextView
        tvSelectedAnime = binding.tvSelectedAnime as TextView
        tvSelectedOld = binding.tvSelectedOldStyle as TextView
        tvSelectedPainting = binding.tvSelectedPainting as TextView
        tvSelectedAbstract = binding.tvSelectedAbstract as TextView
        tvSelectedImpressionism = binding.tvSelectedImpressionism as TextView
        tvSelectedSurreal = binding.tvSelectedSurreal as TextView
        tvSelected3D = binding.tvSelected3d as TextView
        tvSelectedOrigami = binding.tvSelectedOrigami as TextView
        tvSelectedHologram = binding.tvSelectedHologram as TextView

        btnArt = binding.btnArt as LinearLayout
        btnCreatures = binding.btnCreatures as LinearLayout
        btnFantasy = binding.btnFantasyWorld as LinearLayout
        btnArchitecture = binding.btnArchitecture as LinearLayout
        btnLogo = binding.btnLogo as LinearLayout
        btnCyber = binding.btnCyberpunk as LinearLayout
        btnAnime = binding.btnAnime as LinearLayout
        btnOld = binding.btnOldStyle as LinearLayout
        btnPainting = binding.btnPainting as LinearLayout
        btnAbstract = binding.btnAbstract as LinearLayout
        btnImpressionism = binding.btnImpressionism as LinearLayout
        btnSurreal = binding.btnSurreal as LinearLayout
        btn3D = binding.btn3d as LinearLayout
        btnOrigami = binding.btnOrigami as LinearLayout
        btnHologram = binding.btnHologram as LinearLayout
    }
}