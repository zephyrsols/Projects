package com.androidmarket.imagegenerator.util;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;

import androidx.lifecycle.LifecycleObserver;

import com.androidmarket.imagegenerator.R;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.FullScreenContentCallback;
import com.google.android.gms.ads.LoadAdError;
import com.google.android.gms.ads.appopen.AppOpenAd;

import java.util.Date;

public class AppOpenManagerTwo implements LifecycleObserver, Application.ActivityLifecycleCallbacks {

    private static final String LOG_TAG = "AppOpenManager";
    public static boolean isShowingAd = false;
    public static AppOpenAd appOpenAd = null;
    public static AppOpenAd.AppOpenAdLoadCallback loadCallback;
    public static long loadTime = 0;
    private final Application myApplication;
    private Activity currentActivity;

    public AppOpenManagerTwo(Application myApplication) {
        this.myApplication = myApplication;
        this.myApplication.registerActivityLifecycleCallbacks(this);
    }

    /**
     * LifecycleObserver methods
     */

    /**
     * Request an ad
     */
    public static void fetchAd(Activity activity, AdsUtility.AdFinished adFinished) {
        loadCallback =
                new AppOpenAd.AppOpenAdLoadCallback() {
                    /**
                     * Called when an app open ad has loaded.
                     *
                     * @param ad the loaded app open ad.
                     */
                    @Override
                    public void onAdLoaded(AppOpenAd ad) {
                        Log.d("OpenOpen", "onAdLoaded: ");
                        appOpenAd = ad;

                        loadTime = (new Date()).getTime();
                    }

                    /**
                     * Called when an app open ad has failed to load.
                     *
                     * @param loadAdError the error.
                     */
                    @Override
                    public void onAdFailedToLoad(LoadAdError loadAdError) {
                        // Handle the error.
                        appOpenAd = null;
                        Log.d("OpenOpen", "onAdLoaded: "+loadAdError.getMessage());

                    }

                };
        AdRequest request = getAdRequest();
        AppOpenAd.load(
                activity, activity.getResources().getString(R.string.open_ad_admob), request,
                AppOpenAd.APP_OPEN_AD_ORIENTATION_PORTRAIT, loadCallback);


        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                if (appOpenAd!=null){
                    appOpenAd.show(activity);
                    appOpenAd.setFullScreenContentCallback(new FullScreenContentCallback() {
                        @Override
                        public void onAdDismissedFullScreenContent() {
                            super.onAdDismissedFullScreenContent();
                            adFinished.onAdFinished();
                        }
                    });
                } else {
                    adFinished.onAdFinished();
                }

            }
        }, 7500);
    }

    /**
     * Creates and returns ad request.
     */
    public static AdRequest getAdRequest() {
        return new AdRequest.Builder().build();
    }

    /**
     * Utility method to check if ad was loaded more than n hours ago.
     */
    public static boolean wasLoadTimeLessThanNHoursAgo(long numHours) {
        long dateDifference = (new Date()).getTime() - loadTime;
        long numMilliSecondsPerHour = 3600000;
        return (dateDifference < (numMilliSecondsPerHour * numHours));
    }

    /**
     * Utility method that checks if ad exists and can be shown.
     */
    public static boolean isAdAvailable() {
        return appOpenAd != null && wasLoadTimeLessThanNHoursAgo(4);
    }

    /**
     * ActivityLifecycleCallback methods
     */
    @Override
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
    }

    @Override
    public void onActivityStarted(Activity activity) {
        currentActivity = activity;
    }

    @Override
    public void onActivityResumed(Activity activity) {
        currentActivity = activity;
    }

    @Override
    public void onActivityStopped(Activity activity) {
    }

    @Override
    public void onActivityPaused(Activity activity) {
    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        currentActivity = null;
    }

}

