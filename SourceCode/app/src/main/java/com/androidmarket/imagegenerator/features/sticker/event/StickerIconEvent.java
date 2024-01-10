package com.androidmarket.imagegenerator.features.sticker.event;

import android.view.MotionEvent;
import com.androidmarket.imagegenerator.features.sticker.StickerView;

public interface StickerIconEvent {
    void onActionDown(StickerView stickerView, MotionEvent motionEvent);

    void onActionMove(StickerView stickerView, MotionEvent motionEvent);

    void onActionUp(StickerView stickerView, MotionEvent motionEvent);
}
