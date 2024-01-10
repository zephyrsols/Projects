package com.ai.image.generator.ah

import android.app.Dialog
import android.content.Context
import android.os.CountDownTimer
import android.view.Window
import android.widget.TextView

object CustomDialog {
    fun showDialog(context: Context, header: String) {
        val dialog = Dialog(context)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCancelable(false)
        dialog.setContentView(R.layout.custom_signin_dialog)
        val title = dialog.findViewById(R.id.heading) as TextView
        title.text = header
        dialog.show()
        val timer = object : CountDownTimer(2000, 100) {
            override fun onTick(millisUntilFinished: Long) {
            }

            override fun onFinish() {
                dialog.cancel()
            }
        }
        timer.start()
    }
}