package com.androidmarket.imagegenerator.util;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.androidmarket.imagegenerator.R;
import com.facebook.shimmer.ShimmerFrameLayout;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdLoader;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.FullScreenContentCallback;
import com.google.android.gms.ads.LoadAdError;
import com.google.android.gms.ads.MobileAds;
import com.google.android.gms.ads.OnUserEarnedRewardListener;
import com.google.android.gms.ads.VideoController;
import com.google.android.gms.ads.initialization.InitializationStatus;
import com.google.android.gms.ads.initialization.OnInitializationCompleteListener;
import com.google.android.gms.ads.interstitial.InterstitialAd;
import com.google.android.gms.ads.interstitial.InterstitialAdLoadCallback;
import com.google.android.gms.ads.nativead.MediaView;
import com.google.android.gms.ads.nativead.NativeAd;
import com.google.android.gms.ads.nativead.NativeAdView;
import com.google.android.gms.ads.rewarded.RewardItem;
import com.google.android.gms.ads.rewarded.RewardedAd;
import com.google.android.gms.ads.rewarded.RewardedAdLoadCallback;

public class AdsUtility {

    private static InterstitialAd interstitialAd;

    private static RewardedAd mRewardedAd;
    private static int adCount = 1;


    public static void showRewardAd(Activity activity, AdFinished onRewardComplete) {
        AdRequest adRequest = new AdRequest.Builder().build();

        ProgressDialog progressDialog = new ProgressDialog(activity);
        progressDialog.setMessage("Loading Video Ad...");
        progressDialog.show();
        progressDialog.setCancelable(false);

        RewardedAd.load(activity, activity.getResources().getString(R.string.reward_id_admob),
                adRequest, new RewardedAdLoadCallback() {
                    @Override
                    public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                        mRewardedAd = null;
                        AdsUtility.showInterAds(activity, new AdFinished() {
                            @Override
                            public void onAdFinished() {
                                progressDialog.dismiss();
                                onRewardComplete.onAdFinished();
                            }
                        });
                    }

                    @Override
                    public void onAdLoaded(@NonNull RewardedAd rewardedAd) {
                        progressDialog.dismiss();
                        mRewardedAd = rewardedAd;
                        mRewardedAd.show(activity, new OnUserEarnedRewardListener() {
                            @Override
                            public void onUserEarnedReward(@NonNull RewardItem rewardItem) {
                                onRewardComplete.onAdFinished();

                            }
                        });

                        mRewardedAd.setFullScreenContentCallback(new FullScreenContentCallback() {
                            @Override
                            public void onAdDismissedFullScreenContent() {
                                super.onAdDismissedFullScreenContent();
                                onRewardComplete.onAdFinished();
                            }
                        });

                    }
                });

    }

    public static void initAdmob(Activity activity) {
        MobileAds.initialize(activity, new OnInitializationCompleteListener() {
            @Override
            public void onInitializationComplete(InitializationStatus initializationStatus) {
                loadInterstitialAd(activity);
                Log.d("ADMOB", ": initialized!");
            }
        });

    }

    public static void loadAdmobBanner(Activity activity, LinearLayout linearLayout) {
        AdView adView = new AdView(activity);
        adView.setAdUnitId(activity.getResources().getString(R.string.banner_id_admob));
        adView.setAdSize(AdSize.BANNER);
        AdRequest.Builder builder = new AdRequest.Builder();
        adView.loadAd(builder.build());
        linearLayout.addView(adView);
    }

    public static void loadAdmobMediumBanner(Activity activity, LinearLayout linearLayout) {
        AdView adView = new AdView(activity);
        adView.setAdUnitId(activity.getResources().getString(R.string.banner_id_admob));
        adView.setAdSize(AdSize.MEDIUM_RECTANGLE);
        AdRequest.Builder builder = new AdRequest.Builder();
        adView.loadAd(builder.build());
        linearLayout.addView(adView);

    }

    public static void showInterAds(final Activity activity, AdFinished adFinished) {
        if (!Utils.vip_subscription){
            if (interstitialAd != null) {
                interstitialAd.show(activity);
                interstitialAd.setFullScreenContentCallback(new FullScreenContentCallback() {
                    @Override
                    public void onAdDismissedFullScreenContent() {
                        super.onAdDismissedFullScreenContent();
                        adFinished.onAdFinished();
                        loadInterstitialAd(activity);
                    }
                });
            } else {
                adFinished.onAdFinished();
                loadInterstitialAd(activity);
            }
        } else {
            adFinished.onAdFinished();
        }

    }

    public static void showDelayedInterstitial(final Activity activity, AdFinished adFinished) {
        if (adCount == 3) {
            adCount = 0;

            if (interstitialAd != null) {
                interstitialAd.show(activity);
                interstitialAd.setFullScreenContentCallback(new FullScreenContentCallback() {
                    @Override
                    public void onAdDismissedFullScreenContent() {
                        super.onAdDismissedFullScreenContent();
                        adFinished.onAdFinished();
                        loadInterstitialAd(activity);
                    }
                });
            } else {
                adFinished.onAdFinished();
                loadInterstitialAd(activity);
            }


        } else {
            adCount++;
            adFinished.onAdFinished();
            loadInterstitialAd(activity);
        }


        Log.d("ADMOB", ": " + adCount);
    }


    public static void loadInterstitialAd(final Context context) {
        if (!Utils.vip_subscription){
            AdRequest adRequestNormal = new AdRequest.Builder().build();
            InterstitialAd.load(context, context.getResources().getString(R.string.interstial_id_admob), adRequestNormal,
                    new InterstitialAdLoadCallback() {
                        @Override
                        public void onAdLoaded(@NonNull InterstitialAd interstitialAd) {
                            // The mInterstitialAd reference will be null until
                            AdsUtility.interstitialAd = interstitialAd;

                        }

                        @Override
                        public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                            // Handle the error
                            interstitialAd = null;
                            Log.d("ADMOB", "Failed to load because: " + loadAdError.getMessage());
                        }
                    });

        }

    }

    public static void loadNativeAd(final Activity activity, final ViewGroup nativeFrame, final int layout, AdFinished adFinished) {
        AdLoader.Builder builder = new AdLoader.Builder(activity, activity.getResources().getString(R.string.native_id_admob));

        builder.forNativeAd(
                new NativeAd.OnNativeAdLoadedListener() {
                    // OnLoadedListener implementation.
                    @Override
                    public void onNativeAdLoaded(NativeAd nativeAd) {
                        adFinished.onAdFinished();
                        // If this callback occurs after the activity is destroyed, you must call
                        // destroy and return or you may get a memory leak.
                        boolean isDestroyed = false;
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                            isDestroyed = activity.isDestroyed();
                        }
                        if (isDestroyed || activity.isFinishing() || activity.isChangingConfigurations()) {
                            nativeAd.destroy();
                            return;
                        }
                        // You must call destroy on old ads when you are done with them,
                        // otherwise you will have a memory leak.

                        NativeAdView adView = (NativeAdView) activity.getLayoutInflater().inflate(layout, null);
                        populateNativeAdView(nativeAd, adView);
                        nativeFrame.removeAllViews();
                        nativeFrame.addView(adView);
                    }
                });


        AdLoader adLoader = builder.withAdListener(new AdListener() {
            @Override
            public void onAdFailedToLoad(LoadAdError loadAdError) {
            }
        }).build();

        adLoader.loadAd(new AdRequest.Builder().build());
    }

    public static void loadNativeAd(final Activity activity, final ViewGroup nativeFrame, final int layout) {
        if (!Utils.vip_subscription){
            AdLoader.Builder builder = new AdLoader.Builder(activity, activity.getResources().getString(R.string.native_id_admob));

            builder.forNativeAd(
                    new NativeAd.OnNativeAdLoadedListener() {
                        // OnLoadedListener implementation.
                        @Override
                        public void onNativeAdLoaded(NativeAd nativeAd) {
                            // If this callback occurs after the activity is destroyed, you must call
                            // destroy and return or you may get a memory leak.


                            ShimmerFrameLayout shimmerFrameLayout = activity.findViewById(R.id.shimmer_view_container);
                            shimmerFrameLayout.stopShimmer();
                            shimmerFrameLayout.setVisibility(View.GONE);


                            boolean isDestroyed = false;
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                                isDestroyed = activity.isDestroyed();
                            }
                            if (isDestroyed || activity.isFinishing() || activity.isChangingConfigurations()) {
                                nativeAd.destroy();
                                return;
                            }
                            // You must call destroy on old ads when you are done with them,
                            // otherwise you will have a memory leak.

                            NativeAdView adView = (NativeAdView) activity.getLayoutInflater().inflate(layout, null);
                            populateNativeAdView(nativeAd, adView);
                            nativeFrame.removeAllViews();
                            nativeFrame.addView(adView);
                        }
                    });


            AdLoader adLoader = builder.withAdListener(new AdListener() {
                @Override
                public void onAdFailedToLoad(LoadAdError loadAdError) {
                    Log.d("TAGGGG", "onAdFailedToLoad: " + loadAdError.getMessage());
                    ShimmerFrameLayout shimmerFrameLayout = activity.findViewById(R.id.shimmer_view_container);
                    shimmerFrameLayout.stopShimmer();
                    nativeFrame.setVisibility(View.GONE);
                    shimmerFrameLayout.setVisibility(View.GONE);
                }
            }).build();

            adLoader.loadAd(new AdRequest.Builder().build());
        } else {
            nativeFrame.setVisibility(View.GONE);
        }

    }

    private static void populateNativeAdView(NativeAd nativeAd, NativeAdView adView) {
        // Set the media view.
        adView.setMediaView((MediaView) adView.findViewById(R.id.ad_media));

        // Set other ad assets.
        adView.setHeadlineView(adView.findViewById(R.id.ad_headline));
        adView.setBodyView(adView.findViewById(R.id.ad_body));
        adView.setCallToActionView(adView.findViewById(R.id.ad_call_to_action));
        adView.setIconView(adView.findViewById(R.id.ad_app_icon));
        adView.setPriceView(adView.findViewById(R.id.ad_price));
        adView.setStarRatingView(adView.findViewById(R.id.ad_stars));
        adView.setStoreView(adView.findViewById(R.id.ad_store));
        adView.setAdvertiserView(adView.findViewById(R.id.ad_advertiser));

        // The headline and mediaContent are guaranteed to be in every NativeAd.
        ((TextView) adView.getHeadlineView()).setText(nativeAd.getHeadline());
        adView.getMediaView().setMediaContent(nativeAd.getMediaContent());

        // These assets aren't guaranteed to be in every NativeAd, so it's important to
        // check before trying to display them.
        if (nativeAd.getBody() == null) {
            adView.getBodyView().setVisibility(View.INVISIBLE);
        } else {
            adView.getBodyView().setVisibility(View.VISIBLE);
            ((TextView) adView.getBodyView()).setText(nativeAd.getBody());
        }

        if (nativeAd.getCallToAction() == null) {
            adView.getCallToActionView().setVisibility(View.INVISIBLE);
        } else {
            adView.getCallToActionView().setVisibility(View.VISIBLE);
            ((Button) adView.getCallToActionView()).setText(nativeAd.getCallToAction());
        }

        if (nativeAd.getIcon() == null) {
            adView.getIconView().setVisibility(View.GONE);
        } else {
            ((ImageView) adView.getIconView()).setImageDrawable(
                    nativeAd.getIcon().getDrawable());
            adView.getIconView().setVisibility(View.VISIBLE);
        }

        if (nativeAd.getPrice() == null) {
            adView.getPriceView().setVisibility(View.INVISIBLE);
        } else {
            adView.getPriceView().setVisibility(View.VISIBLE);
            ((TextView) adView.getPriceView()).setText(nativeAd.getPrice());
        }

        if (nativeAd.getStore() == null) {
            adView.getStoreView().setVisibility(View.INVISIBLE);
        } else {
            adView.getStoreView().setVisibility(View.VISIBLE);
            ((TextView) adView.getStoreView()).setText(nativeAd.getStore());
        }

        if (nativeAd.getStarRating() == null) {
            adView.getStarRatingView().setVisibility(View.INVISIBLE);
        } else {
            ((RatingBar) adView.getStarRatingView())
                    .setRating(nativeAd.getStarRating().floatValue());
            adView.getStarRatingView().setVisibility(View.VISIBLE);
        }

        if (nativeAd.getAdvertiser() == null) {
            adView.getAdvertiserView().setVisibility(View.INVISIBLE);
        } else {
            ((TextView) adView.getAdvertiserView()).setText(nativeAd.getAdvertiser());
            adView.getAdvertiserView().setVisibility(View.VISIBLE);
        }

        adView.setNativeAd(nativeAd);

        VideoController vc = nativeAd.getMediaContent().getVideoController();

        // Updates the UI to say whether or not this ad has a video asset.
        if (vc.hasVideoContent()) {


            vc.setVideoLifecycleCallbacks(new VideoController.VideoLifecycleCallbacks() {
                @Override
                public void onVideoEnd() {
                    // Publishers should allow native ads to complete video playback before
                    // refreshing or replacing them with another ad in the same UI location.

                    super.onVideoEnd();
                }
            });
        }
    }


    public interface AdFinished {
        void onAdFinished();
    }


}
