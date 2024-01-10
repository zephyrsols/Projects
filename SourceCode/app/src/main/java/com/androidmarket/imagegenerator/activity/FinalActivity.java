package com.androidmarket.imagegenerator.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.androidmarket.imagegenerator.R;
import com.androidmarket.imagegenerator.util.AdsUtility;
import com.androidmarket.imagegenerator.util.Utils;

public class FinalActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        setContentView(R.layout.activity_final);
        getSupportActionBar().hide();
        AdsUtility.loadNativeAd(this, findViewById(R.id.nativeAdLarge), R.layout.ad_unified_medium);


        findViewById(R.id.ivBack).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AdsUtility.showInterAds(FinalActivity.this, new AdsUtility.AdFinished() {
                    @Override
                    public void onAdFinished() {
                        startActivity(new Intent(FinalActivity.this, ImageGeneratorActivity.class));
                        finish();
                    }
                });
            }
        });

        findViewById(R.id.btnHome).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AdsUtility.showInterAds(FinalActivity.this, new AdsUtility.AdFinished() {
                    @Override
                    public void onAdFinished() {
                        startActivity(new Intent(FinalActivity.this, ImageGeneratorActivity.class));
                        finish();
                    }
                });
            }
        });


    }



}