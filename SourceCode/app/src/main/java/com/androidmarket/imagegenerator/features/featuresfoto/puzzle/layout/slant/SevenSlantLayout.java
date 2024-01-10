package com.androidmarket.imagegenerator.features.featuresfoto.puzzle.layout.slant;

import com.androidmarket.imagegenerator.features.featuresfoto.puzzle.Line;
import com.androidmarket.imagegenerator.features.featuresfoto.puzzle.PuzzleLayout;
import com.androidmarket.imagegenerator.features.featuresfoto.puzzle.slant.SlantPuzzleLayout;

public class SevenSlantLayout extends NumberSlantLayout {
    public int getThemeCount() {
        return 2;
    }

    public SevenSlantLayout() {
    }

    public SevenSlantLayout(SlantPuzzleLayout slantPuzzleLayout, boolean z) {
        super(slantPuzzleLayout, z);
    }

    public SevenSlantLayout(int i) {
        super(i);
    }

    public void layout() {
        if (this.theme == 0) {
            addLine(0, Line.Direction.VERTICAL, 0.33333334f);
            addLine(1, Line.Direction.VERTICAL, 0.5f);
            addLine(0, Line.Direction.HORIZONTAL, 0.5f, 0.5f);
            addLine(1, Line.Direction.HORIZONTAL, 0.33f, 0.33f);
            addLine(3, Line.Direction.HORIZONTAL, 0.5f, 0.5f);
            addLine(2, Line.Direction.HORIZONTAL, 0.5f, 0.5f);
        }
    }

    public PuzzleLayout clone(PuzzleLayout puzzleLayout) {
        return new SevenSlantLayout((SlantPuzzleLayout) puzzleLayout, true);
    }
}
