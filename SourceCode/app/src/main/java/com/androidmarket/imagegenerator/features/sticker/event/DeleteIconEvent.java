package com.androidmarket.imagegenerator.features.sticker.event;

import android.view.MotionEvent;
import com.androidmarket.imagegenerator.features.sticker.StickerView;

public class DeleteIconEvent implements StickerIconEvent {
    public void onActionDown(StickerView stickerView, MotionEvent motionEvent) {
    }

    public void onActionMove(StickerView stickerView, MotionEvent motionEvent) {
    }

    public void onActionUp(StickerView stickerView, MotionEvent motionEvent) {
        stickerView.removeCurrentSticker();
    }
}
