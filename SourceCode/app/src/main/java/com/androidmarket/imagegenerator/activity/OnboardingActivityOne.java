package com.androidmarket.imagegenerator.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.androidmarket.imagegenerator.R;
import com.androidmarket.imagegenerator.util.Utils;

public class OnboardingActivityOne extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        setContentView(R.layout.activity_onboarding_one);
        getSupportActionBar().hide();

        findViewById(R.id.btnContinue).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(OnboardingActivityOne.this, OnboardinActivityTwo.class));
                overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);

            }
        });


    }
}