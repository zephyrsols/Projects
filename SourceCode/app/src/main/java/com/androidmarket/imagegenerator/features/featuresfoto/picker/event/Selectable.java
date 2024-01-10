package com.androidmarket.imagegenerator.features.featuresfoto.picker.event;

import com.androidmarket.imagegenerator.features.featuresfoto.picker.entity.Photo;

public interface Selectable {
    void clearSelection();

    int getSelectedItemCount();

    boolean isSelected(Photo photo);

    void toggleSelection(Photo photo);
}
