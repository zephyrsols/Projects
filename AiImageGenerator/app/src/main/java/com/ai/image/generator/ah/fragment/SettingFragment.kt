package com.ai.image.generator.ah.fragment

import android.app.Dialog
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.widget.Button
import com.ai.image.generator.ah.R
import com.ai.image.generator.ah.databinding.FragmentSettingBinding
import com.ai.image.generator.ah.ui.FollowUsActivity
import com.ai.image.generator.ah.ui.LanguageActivity
import com.ai.image.generator.ah.ui.PersonalInfoActivity
import com.ai.image.generator.ah.ui.ProfileActivity
import com.ai.image.generator.ah.ui.SecurityActivity
import com.ai.image.generator.ah.ui.SigninActivity
import com.google.firebase.Firebase
import com.google.firebase.auth.auth

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [SettingFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class SettingFragment : Fragment() {
    // TODO: Rename and change types of parameters
    private var param1: String? = null
    private var param2: String? = null
    private lateinit var binding: FragmentSettingBinding
    private lateinit var dialog: Dialog

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            param1 = it.getString(ARG_PARAM1)
            param2 = it.getString(ARG_PARAM2)
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        binding = FragmentSettingBinding.inflate(inflater, container, false)
        binding.personalInfoBtn.setOnClickListener {
            startActivity(Intent(requireContext(), ProfileActivity::class.java))
        }
        binding.securityBtn.setOnClickListener {
            startActivity(Intent(requireContext(), SecurityActivity::class.java))
        }
        binding.languageBtn.setOnClickListener {
            startActivity(Intent(requireContext(), LanguageActivity::class.java))
        }
        binding.followUsBtn.setOnClickListener {
            startActivity(Intent(requireContext(), FollowUsActivity::class.java))
        }

        binding.logoutBtn.setOnClickListener {
            dialog = Dialog(requireContext())
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
            dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
            dialog.setCancelable(false)
            dialog.setContentView(R.layout.logout_dialog)
            val cancelButton = dialog.findViewById<Button>(R.id.cancelBtn)
            cancelButton.setOnClickListener {
                dialog.cancel()
            }
            val logoutButton = dialog.findViewById<Button>(R.id.logoutBtn)
            logoutButton.setOnClickListener {
                Firebase.auth.signOut()
                startActivity(Intent(requireContext(), SigninActivity::class.java))
            }
            dialog.show()
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
         * @return A new instance of fragment SettingFragment.
         */
        // TODO: Rename and change types and number of parameters
        @JvmStatic
        fun newInstance(param1: String, param2: String) =
            SettingFragment().apply {
                arguments = Bundle().apply {
                    putString(ARG_PARAM1, param1)
                    putString(ARG_PARAM2, param2)
                }
            }
    }
}