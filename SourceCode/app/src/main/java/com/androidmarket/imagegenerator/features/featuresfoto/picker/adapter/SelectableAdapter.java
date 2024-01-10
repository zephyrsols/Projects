package com.androidmarket.imagegenerator.features.featuresfoto.picker.adapter;

import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.RecyclerView.ViewHolder;
import com.androidmarket.imagegenerator.features.featuresfoto.picker.entity.Photo;
import com.androidmarket.imagegenerator.features.featuresfoto.picker.entity.PhotoDirectory;
import com.androidmarket.imagegenerator.features.featuresfoto.picker.event.Selectable;
import java.util.ArrayList;
import java.util.List;

public abstract class SelectableAdapter<VH extends ViewHolder> extends RecyclerView.Adapter<VH> implements Selectable {
    private static final String TAG = "SelectableAdapter";
    public int currentDirectoryIndex = 0;
    protected List<PhotoDirectory> photoDirectories = new ArrayList();
    protected List<String> selectedPhotos = new ArrayList();

    public boolean isSelected(Photo photo) {
        return getSelectedPhotos().contains(photo.getPath());
    }

    public void toggleSelection(Photo photo) {
        if (this.selectedPhotos.contains(photo.getPath())) {
            this.selectedPhotos.remove(photo.getPath());
        } else {
            this.selectedPhotos.add(photo.getPath());
        }
    }

    public void clearSelection() {
        this.selectedPhotos.clear();
    }

    public int getSelectedItemCount() {
        return this.selectedPhotos.size();
    }

    public void setCurrentDirectoryIndex(int i) {
        this.currentDirectoryIndex = i;
    }

    public List<Photo> getCurrentPhotos() {
        if (this.photoDirectories.size() <= this.currentDirectoryIndex) {
            this.currentDirectoryIndex = this.photoDirectories.size() - 1;
        }
        return this.photoDirectories.get(this.currentDirectoryIndex).getPhotos();
    }

    public List<String> getCurrentPhotoPaths() {
        ArrayList arrayList = new ArrayList(getCurrentPhotos().size());
        for (Photo path : getCurrentPhotos()) {
            arrayList.add(path.getPath());
        }
        return arrayList;
    }

    public List<String> getSelectedPhotos() {
        return this.selectedPhotos;
    }
}
