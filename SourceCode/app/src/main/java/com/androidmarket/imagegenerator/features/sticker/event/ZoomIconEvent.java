package com.androidmarket.imagegenerator.features.sticker.event;

import android.view.MotionEvent;
import com.androidmarket.imagegenerator.features.sticker.StickerView;

public class ZoomIconEvent implements StickerIconEvent {
    public void onActionDown(StickerView stickerView, MotionEvent motionEvent) {
    }

    public void onActionMove(StickerView stickerView, MotionEvent motionEvent) {
        stickerView.zoomAndRotateCurrentSticker(motionEvent);
    }

    public void onActionUp(StickerView stickerView, MotionEvent motionEvent) {
        if (stickerView.getOnStickerOperationListener() != null) {
            stickerView.getOnStickerOperationListener().onStickerZoomFinished(stickerView.getCurrentSticker());
        }
    }
}
