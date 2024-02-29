package com.example.screenmirroring.UI


import android.annotation.SuppressLint
import android.app.AlertDialog
import android.content.Intent
import android.content.SharedPreferences
import android.graphics.Color
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.view.LayoutInflater
import android.view.MenuItem
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.widget.Toolbar
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.FileProvider
import androidx.core.view.GravityCompat
import androidx.drawerlayout.widget.DrawerLayout
import com.example.screenmirroring.Holder.BaseActivity
import com.example.screenmirroring.R
import com.example.screenmirroring.databinding.ActivityDashboardBinding
import com.google.android.material.navigation.NavigationView
import java.io.File

class DashboardActivity : BaseActivity() {
    //declaring  binding
    private lateinit var binding: ActivityDashboardBinding
    private lateinit var drawerLayout: DrawerLayout
    private lateinit var toggle: ActionBarDrawerToggle
    private lateinit var toolbar: Toolbar
    private lateinit var navigationView: NavigationView
    private lateinit var sharedPreferences: SharedPreferences
    private lateinit var editor: SharedPreferences.Editor


    companion object {
        private const val REQUEST_READ_STORAGE_PERMISSION = 100
        private const val READ_MEDIA_VIDEO = 100
        private const val READ_MEDIA_AUDIO = 100
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDashboardBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window, resources, theme)

        sharedPreferences = getSharedPreferences("onBoarding", MODE_PRIVATE)
        editor = sharedPreferences.edit()
        editor.putInt("onBoarding", 1)
        editor.apply()



        //permission check
        if (Build.VERSION.SDK_INT >= 32) {
            if (ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.READ_MEDIA_VIDEO
                ) != android.content.pm.PackageManager.PERMISSION_GRANTED
            ) {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(android.Manifest.permission.READ_MEDIA_VIDEO),
                    READ_MEDIA_VIDEO
                )
            }
            if (ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.READ_MEDIA_AUDIO
                ) != android.content.pm.PackageManager.PERMISSION_GRANTED
            ) {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(android.Manifest.permission.READ_MEDIA_AUDIO),
                    READ_MEDIA_AUDIO
                )
            }
        } else {
            if (ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.READ_EXTERNAL_STORAGE
                ) != android.content.pm.PackageManager.PERMISSION_GRANTED
            ) {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE),
                    REQUEST_READ_STORAGE_PERMISSION
                )
            }
        }


        drawerLayout = findViewById(R.id.drawerLayout)
        toolbar = findViewById(R.id.toolbar)
        navigationView = binding.navView

        setSupportActionBar(toolbar)

        val toggle = ActionBarDrawerToggle(
            this,
            drawerLayout,
            toolbar,
            R.string.open,
            R.string.close
        )
        toggle.isDrawerIndicatorEnabled = false
        toolbar.setNavigationIcon(R.drawable.drawer)
        toolbar.setNavigationOnClickListener {
            if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
                drawerLayout.closeDrawer(GravityCompat.START)
            } else {
                drawerLayout.openDrawer(GravityCompat.START)
            }
        }

        drawerLayout.addDrawerListener(toggle)
        toggle.syncState()

        navigationView.setNavigationItemSelectedListener {
            // Handle item click events here
            when (it.itemId) {
                R.id.navLanguage -> {
                    startActivity(Intent(this, LanguagesActivity::class.java))
                    finish()
                    false
                }
                R.id.navHowToUse -> {
                    startActivity(Intent(this, HowToUseActivity::class.java))
                    false
                }
                R.id.navRatUs -> {
                    Toast.makeText(this,"Rate Us",Toast.LENGTH_SHORT).show()
                    false
                }
                R.id.navFeedback -> {
                    startActivity(Intent(this, FeedbackActivity::class.java))
                    false
                }
                R.id.navMoreApps -> {
                    Toast.makeText(this,"More Apps",Toast.LENGTH_SHORT).show()
                    false
                }
                R.id.navShareApp -> {
                    // Assuming the APK file is located in the external cache directory
                    val apkFilePath = File(getExternalCacheDir(), "your_app_name.apk")

                    // Create a content URI using FileProvider
                    val apkUri: Uri =
                        FileProvider.getUriForFile(
                            this,
                            "com.example.yourapp.fileprovider",  // Replace with your app's package name
                            apkFilePath
                        )

                    // Create an Intent to share the APK
                    val intent = Intent(Intent.ACTION_SEND)
                    intent.type = "application/vnd.android.package-archive"
                    intent.putExtra(Intent.EXTRA_STREAM, apkUri)
                    intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)

                    // Check if there's an activity that can handle this intent before starting it
                    if (intent.resolveActivity(packageManager) != null) {
                        startActivity(Intent.createChooser(intent, "Share APK using"))
                    }
                    Toast.makeText(this,"Share App",Toast.LENGTH_SHORT).show()
                    false
                }
                R.id.navPrivacyPolicy -> {
                    startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("https://google.com/")))
                    false
                }
                else -> false
            }
        }


        //video card layout with onclick listener
        binding.videoLayout.setOnClickListener {
            startActivity(Intent(this@DashboardActivity, VideosActivity::class.java))
        }

        //image card layout with onclick listener
        binding.imageLayout.setOnClickListener {
            startActivity(Intent(this@DashboardActivity, ImagesActivity::class.java))
        }


        //audio card layout with onclick listener
        binding.audioLayout.setOnClickListener {
            startActivity(Intent(this@DashboardActivity, AudiosActivity::class.java))

        }

        //mirroring card layout with onclick listener
        binding.tvMirrorImg2.setOnClickListener {
            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
        }

        //connect card layout with onclick listener
        binding.connectLayout.setOnClickListener {
            startActivity(Intent(this@DashboardActivity, ConnectActivity::class.java))

        }

//        //wifi image at top bar
//        binding.screenWifiImg.setOnClickListener {
//            startActivity(Intent(Settings.ACTION_CAST_SETTINGS))
//        }
//
//        //drawer
//        binding.drawerImg.setOnClickListener {
//            startActivity(Intent(this@Dashboard, Setting::class.java))
//        }
    }



    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        if (toggle.onOptionsItemSelected(item)) {
            return true
        }
        return super.onOptionsItemSelected(item)
    }


//    private fun openWirelessDisplaySettings() {
//        val intent = Intent()
//
//        // For Samsung devices with SmartView settings
//        if (Build.MANUFACTURER.equals("samsung", ignoreCase = true)) {
//            // Use the package and class name for SmartView settings activity
//            intent.action = android.provider.Settings.ACTION_CAST_SETTINGS
//            Toast.makeText(this, "a", Toast.LENGTH_SHORT).show()
//        } else {
//            // For other devices, you may try using the standard action for wireless display
//            intent.action = Settings.ACTION_WIRELESS_SETTINGS
//
//        }
//
//        try {
//            startActivity(intent)
//        } catch (e: Exception) {
//            intent.action = Settings.ACTION_WIRELESS_SETTINGS
//            startActivity(intent)
//            Toast.makeText(this, e.message.toString(), Toast.LENGTH_SHORT).show()
//            // Handle the exception if the SmartView settings activity is not found
//            // or if there is an issue launching the activity
//        }
//    }

    @Deprecated("Deprecated in Java")
    @SuppressLint("MissingSuperCall")
    override fun onBackPressed() {
        if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START)
        } else {
            showExitDialog()
        }
    }

    @SuppressLint("MissingInflatedId", "SetTextI18n")
    private fun showExitDialog() {
        val builder = AlertDialog.Builder(this, R.style.BlackDialog)
        val inflater = LayoutInflater.from(this)
        val view = inflater.inflate(R.layout.custom_exit_dialog, null)

        val messageTextView: TextView = view.findViewById(R.id.dialog_message)
        messageTextView.setTextColor(Color.WHITE)
        messageTextView.text = "Do you want to exit the app?"

        builder.setView(view)

        builder.setPositiveButton("Yes") { _, _ ->
            finish()
        }
        builder.setNegativeButton("No") { dialog, _ ->
            dialog.dismiss()
        }
        builder.setCancelable(false)
        builder.show()
    }
}
