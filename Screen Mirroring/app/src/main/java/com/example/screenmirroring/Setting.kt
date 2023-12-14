package com.example.screenmirroring

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.example.screenmirroring.databinding.ActivitySettingBinding

import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class Setting : AppCompatActivity() {
    //declaring  variables
    private lateinit var binding: ActivitySettingBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySettingBinding.inflate(layoutInflater)
        setContentView(binding.root)
        changeStatusBarColor(R.color.black, window,resources,theme)

        //Go back image at top bar
        binding.backImage.setOnClickListener {
            finish()
        }

        //Language Layout
        binding.languageLayout.setOnClickListener {
            startActivity(Intent(this@Setting, Languages::class.java))
        }

        //How to use Layout
        binding.howToUseLayout.setOnClickListener {
            Toast.makeText(this@Setting, "How to use", Toast.LENGTH_SHORT).show()
        }

        //Rate Us Layout
        binding.rateUsLayout.setOnClickListener {
            Toast.makeText(this@Setting, "Rate Us", Toast.LENGTH_SHORT).show()
        }

        //Feedback Layout
        binding.feedbackLayout.setOnClickListener {
            Toast.makeText(this@Setting, "Feedback", Toast.LENGTH_SHORT).show()
        }

        //More Apps Layout
        binding.moreAppsLayout.setOnClickListener {
            Toast.makeText(this@Setting, "More Apps", Toast.LENGTH_SHORT).show()
        }

        //Share App Layout
        binding.shareAppLayout.setOnClickListener {

            try {
                createAndShareAPK()
            } catch (e: IOException) {
                e.printStackTrace()
                Toast.makeText(this,e.message,Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun createAndShareAPK() {
        val packageManager = packageManager
        val appInfo = packageManager.getApplicationInfo(packageName, 0)

        val apkFileName = "MyApp_${System.currentTimeMillis()}.apk"
        val apkFile = File(externalCacheDir, apkFileName)

        try {
            val zipOutputStream = ZipOutputStream(FileOutputStream(apkFile))
            addFileToZip("", appInfo.sourceDir, zipOutputStream)
            zipOutputStream.close()

            // Create an intent to share the APK file
            val shareIntent = Intent(Intent.ACTION_SEND)
            shareIntent.type = "application/vnd.android.package-archive"
            shareIntent.putExtra(Intent.EXTRA_STREAM, Uri.fromFile(apkFile))
            startActivity(Intent.createChooser(shareIntent, "Share APK"))
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }



    private fun addFileToZip(path: String, srcFile: String, zipOutputStream: ZipOutputStream) {
        val file = File(srcFile)
        val filePath = if (path.isEmpty()) file.name else path + File.separator + file.name

        if (file.isDirectory) {
            for (fileName in file.list()!!) {
                addFileToZip(filePath, srcFile + File.separator + fileName, zipOutputStream)
            }
        } else {
            val buffer = ByteArray(1024)
            val fileInputStream = FileInputStream(file)
            zipOutputStream.putNextEntry(ZipEntry(filePath))

            var length: Int
            while (fileInputStream.read(buffer).also { length = it } > 0) {
                zipOutputStream.write(buffer, 0, length)
            }

            zipOutputStream.closeEntry()
            fileInputStream.close()
        }
    }


}
