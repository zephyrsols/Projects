package com.androidmarket.imagegenerator;

import android.content.Context;
import android.os.Build;
import android.os.StrictMode;

import com.onesignal.OneSignal;

public class Application extends android.app.Application {

    private static final String ONESIGNAL_APP_ID = "abcabcabcabcabcabacbacbacbacbacbacb";
    private static Application sApplication;

    public void onCreate() {
        super.onCreate();
        sApplication = this;
        OneSignal.setLogLevel(OneSignal.LOG_LEVEL.VERBOSE, OneSignal.LOG_LEVEL.NONE);
        OneSignal.initWithContext(this);
        OneSignal.setAppId(ONESIGNAL_APP_ID);
        if (Build.VERSION.SDK_INT >= 24) {
            try {
                StrictMode.class.getMethod("disableDeathOnFileUriExposure", new Class[0]).invoke((Object) null, new Object[0]);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static Application getPhotoApp() {
        return sApplication;
    }

    public Context getContext() {
        return sApplication.getContext();
    }
}
