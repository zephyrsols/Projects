package com.androidmarket.imagegenerator.util.view;

import android.graphics.Bitmap;

public interface OnSaveBitmap {
    void onBitmapReady(Bitmap bitmap);

    void onFailure(Exception exc);
}
