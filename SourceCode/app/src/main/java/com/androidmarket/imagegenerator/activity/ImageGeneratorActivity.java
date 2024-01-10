package com.androidmarket.imagegenerator.activity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.androidmarket.imagegenerator.R;
import com.androidmarket.imagegenerator.features.featuresfoto.picker.PhotoPicker;
import com.androidmarket.imagegenerator.features.featuresfoto.picker.utils.PermissionsUtils;
import com.androidmarket.imagegenerator.features.featuresfoto.puzzle.photopicker.activity.PickImageActivity;
import com.androidmarket.imagegenerator.util.AdsUtility;
import com.androidmarket.imagegenerator.util.TextToImageRequest;
import com.androidmarket.imagegenerator.util.Utils;

import java.util.ArrayList;

public class ImageGeneratorActivity extends AppCompatActivity {

    TextView tvSelectedArt, tvSelectedCreatures, tvSelectedFantasy, tvSelectedArchitecture, tvSelectedLogo, tvSelectedCyber, tvSelectedAnime, tvSelectedOld, tvSelectedPainting, tvSelectedAbstract, tvSelectedImpressionism, tvSelectedSurreal, tvSelected3D, tvSelectedOrigami, tvSelectedHologram, tvSelectedWatercolor;
    LinearLayout btnArt, btnCreatures, btnFantasy, btnArchitecture, btnLogo, btnCyber, btnAnime, btnOld, btnPainting, btnAbstract, btnImpressionism, btnSurreal, btn3D, btnOrigami, btnHologram, btnWatercolor;

    String URL;

    Activity activity;
    int usageCount;
    long lastUsageTimestamp;
    long currentTime;

    private static final String PREFS_NAME = "MyPrefs";
    private static final String KEY_USAGE_COUNT = "usageCount";
    private static final String KEY_LAST_USAGE_TIMESTAMP = "lastUsageTimestamp";
    private static final int MAX_USAGE_LIMIT = 500;
    private static final long TIME_LIMIT_MILLIS = 24 * 60 * 60 * 1000; // 24 hours in milliseconds


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        setContentView(R.layout.activity_image_generator);
        AdsUtility.loadNativeAd(this, findViewById(R.id.nativeAdSmall), R.layout.ad_unified_small);

        activity = ImageGeneratorActivity.this;

        getSupportActionBar().hide();
        initialize();
        selectStyle("art");
        onClicks();

        SharedPreferences preferences = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);



        findViewById(R.id.proLayout).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(ImageGeneratorActivity.this, SubscriptionActivity.class));
                finish();
            }
        });

        if (Utils.vip_subscription){
            findViewById(R.id.proLayout).setVisibility(View.GONE);
        }

        findViewById(R.id.btnEditor).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (PermissionsUtils.checkWriteStoragePermission((Activity) ImageGeneratorActivity.this)) {
                    AdsUtility.showInterAds(ImageGeneratorActivity.this, new AdsUtility.AdFinished() {
                        @Override
                        public void onAdFinished() {
                            PhotoPicker.builder().setPhotoCount(1).setPreviewEnabled(false).setShowCamera(false).start(ImageGeneratorActivity.this);
                        }
                    });
                }
            }
        });

        findViewById(R.id.btnCollage).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (PermissionsUtils.checkWriteStoragePermission((Activity) activity)) {
                    AdsUtility.showInterAds(activity, new AdsUtility.AdFinished() {
                        @Override
                        public void onAdFinished() {
                            Intent intent = new Intent(activity, PickImageActivity.class);
                            intent.putExtra(PickImageActivity.KEY_LIMIT_MAX_IMAGE, 900);
                            intent.putExtra(PickImageActivity.KEY_LIMIT_MIN_IMAGE, 100);
                            activity.startActivityForResult(intent, 1001);
                        }
                    });
                }
            }
        });


        EditText editPrompt = (EditText) findViewById(R.id.editPrompt);
        RelativeLayout btnGenerate = (RelativeLayout) findViewById(R.id.btnGenerate);

        btnGenerate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!editPrompt.getText().toString().isEmpty()) {


                        usageCount = preferences.getInt(KEY_USAGE_COUNT, 0);
                        lastUsageTimestamp = preferences.getLong(KEY_LAST_USAGE_TIMESTAMP, 0);

                        currentTime = System.currentTimeMillis();
                        long timeSinceLastUsage = currentTime - lastUsageTimestamp;
                        if (timeSinceLastUsage >= TIME_LIMIT_MILLIS) {
                            usageCount = 100;
                        }

                        if (usageCount >= MAX_USAGE_LIMIT) {
                            Toast.makeText(activity, "You have used free request for today. Go premium to use further.", Toast.LENGTH_SHORT).show();
                        } else {

                            TextToImageRequest request = new TextToImageRequest();
                            request.makeTextToImageRequest(ImageGeneratorActivity.this, editPrompt.getText().toString(), URL, 0);
                            editPrompt.setText("");


                            usageCount++;
                            lastUsageTimestamp = currentTime;

                            // Save the updated values to shared preferences
                            SharedPreferences.Editor editor = preferences.edit();
                            editor.putInt(KEY_USAGE_COUNT, usageCount);
                            editor.putLong(KEY_LAST_USAGE_TIMESTAMP, lastUsageTimestamp);
                            editor.apply();

                        }

                    } else {
                        TextToImageRequest request = new TextToImageRequest();
                        request.makeTextToImageRequest(ImageGeneratorActivity.this, editPrompt.getText().toString(), URL, 0);
                        editPrompt.setText("");
                    }



                }
//                else {
//                    Toast.makeText(ImageGeneratorActivity.this, "Type the prompt to generate image.", Toast.LENGTH_SHORT).show();
//                }

        });

    }

    private void onClicks() {
        btnArt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("art");
            }
        });

        btnCreatures.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("creatures");
            }
        });
        btnArchitecture.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("archi");
            }
        });
        btnFantasy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("fantasy");
            }
        });
        btnLogo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("logo");
            }
        });
        btnCyber.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("cyber");
            }
        });
        btnAnime.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("anime");
            }
        });
        btnOld.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("old");
            }
        });
        btnPainting.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("painting");
            }
        });
        btnAbstract.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("abstract");
            }
        });
        btnImpressionism.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("impression");
            }
        });
        btnSurreal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("surr");
            }
        });
        btn3D.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("3d");
            }
        });
        btnOrigami.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("origami");
            }
        });
        btnHologram.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("hologram");
            }
        });
        btnWatercolor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectStyle("water");
            }
        });

    }

    private void selectStyle(String style) {
        if (style.contains("art")) {

            URL = getResources().getString(R.string.art_url);

            tvSelectedArt.setVisibility(View.VISIBLE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("creatures")) {

            URL = getResources().getString(R.string.creatures_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.VISIBLE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("fantasy")) {

            URL = getResources().getString(R.string.fantasy_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.VISIBLE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("archi")) {

            URL = getResources().getString(R.string.architecture_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.VISIBLE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("logo")) {

            URL = getResources().getString(R.string.logo_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.VISIBLE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("cyber")) {

            URL = getResources().getString(R.string.cyber_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.VISIBLE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("anime")) {

            URL = getResources().getString(R.string.anime_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.VISIBLE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("old")) {

            URL = getResources().getString(R.string.old_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.VISIBLE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("painting")) {

            URL = getResources().getString(R.string.painting_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.VISIBLE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("abstract")) {

            URL = getResources().getString(R.string.abstract_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.VISIBLE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("impression")) {

            URL = getResources().getString(R.string.impression_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.VISIBLE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("surr")) {

            URL = getResources().getString(R.string.surreal_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.VISIBLE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("3d")) {

            URL = getResources().getString(R.string.threeD_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.VISIBLE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("origami")) {

            URL = getResources().getString(R.string.origami_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.VISIBLE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("hologram")) {

            URL = getResources().getString(R.string.hologram_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.VISIBLE);
            tvSelectedWatercolor.setVisibility(View.GONE);
        } else if (style.contains("water")) {

            URL = getResources().getString(R.string.watercolor_url);

            tvSelectedArt.setVisibility(View.GONE);
            tvSelectedCreatures.setVisibility(View.GONE);
            tvSelectedFantasy.setVisibility(View.GONE);
            tvSelectedArchitecture.setVisibility(View.GONE);
            tvSelectedLogo.setVisibility(View.GONE);
            tvSelectedCyber.setVisibility(View.GONE);
            tvSelectedAnime.setVisibility(View.GONE);
            tvSelectedOld.setVisibility(View.GONE);
            tvSelectedPainting.setVisibility(View.GONE);
            tvSelectedAbstract.setVisibility(View.GONE);
            tvSelectedImpressionism.setVisibility(View.GONE);
            tvSelectedSurreal.setVisibility(View.GONE);
            tvSelected3D.setVisibility(View.GONE);
            tvSelectedOrigami.setVisibility(View.GONE);
            tvSelectedHologram.setVisibility(View.GONE);
            tvSelectedWatercolor.setVisibility(View.VISIBLE);
        }
    }

    private void initialize() {
        tvSelectedArt = (TextView) findViewById(R.id.tvSelectedArt);
        tvSelectedCreatures = (TextView) findViewById(R.id.tvSelectedCreatures);
        tvSelectedFantasy = (TextView) findViewById(R.id.tvSelectedFantasyWorld);
        tvSelectedArchitecture = (TextView) findViewById(R.id.tvSelectedArchitecture);
        tvSelectedLogo = (TextView) findViewById(R.id.tvSelectedLogo);
        tvSelectedCyber = (TextView) findViewById(R.id.tvSelectedCyberpunk);
        tvSelectedAnime = (TextView) findViewById(R.id.tvSelectedAnime);
        tvSelectedOld = (TextView) findViewById(R.id.tvSelectedOldStyle);
        tvSelectedPainting = (TextView) findViewById(R.id.tvSelectedPainting);
        tvSelectedAbstract = (TextView) findViewById(R.id.tvSelectedAbstract);
        tvSelectedImpressionism = (TextView) findViewById(R.id.tvSelectedImpressionism);
        tvSelectedSurreal = (TextView) findViewById(R.id.tvSelectedSurreal);
        tvSelected3D = (TextView) findViewById(R.id.tvSelected3d);
        tvSelectedOrigami = (TextView) findViewById(R.id.tvSelectedOrigami);
        tvSelectedHologram = (TextView) findViewById(R.id.tvSelectedHologram);
        tvSelectedWatercolor = (TextView) findViewById(R.id.tvSelectedWatercolor);


        btnArt = (LinearLayout) findViewById(R.id.btnArt);
        btnCreatures = (LinearLayout) findViewById(R.id.btnCreatures);
        btnFantasy = (LinearLayout) findViewById(R.id.btnFantasyWorld);
        btnArchitecture = (LinearLayout) findViewById(R.id.btnArchitecture);
        btnLogo = (LinearLayout) findViewById(R.id.btnLogo);
        btnCyber = (LinearLayout) findViewById(R.id.btnCyberpunk);
        btnAnime = (LinearLayout) findViewById(R.id.btnAnime);
        btnOld = (LinearLayout) findViewById(R.id.btnOldStyle);
        btnPainting = (LinearLayout) findViewById(R.id.btnPainting);
        btnAbstract = (LinearLayout) findViewById(R.id.btnAbstract);
        btnImpressionism = (LinearLayout) findViewById(R.id.btnImpressionism);
        btnSurreal = (LinearLayout) findViewById(R.id.btnSurreal);
        btn3D = (LinearLayout) findViewById(R.id.btn3d);
        btnOrigami = (LinearLayout) findViewById(R.id.btnOrigami);
        btnHologram = (LinearLayout) findViewById(R.id.btnHologram);
        btnWatercolor = (LinearLayout) findViewById(R.id.btnWatercolor);


    }

}