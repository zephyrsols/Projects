package com.androidmarket.imagegenerator.activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.android.billingclient.api.AcknowledgePurchaseParams;
import com.android.billingclient.api.AcknowledgePurchaseResponseListener;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.QueryPurchasesParams;
import com.androidmarket.imagegenerator.R;
import com.androidmarket.imagegenerator.util.AdsUtility;
import com.androidmarket.imagegenerator.util.Utils;

public class SplashActivity extends AppCompatActivity {

    private BillingClient mBillingClient;
    private BillingClient billingClient;

    String SHAREDPREFS = "sharedPrefs";
    String isFirstTime = "isFirstTime";
    boolean isFirst = false;
    SharedPreferences.Editor editor;

    public void onBackPressed() {
    }

    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        AdsUtility.initAdmob(this);
        setContentView((int) R.layout.activity_splash);

        editor = getSharedPreferences(SHAREDPREFS, 0).edit();
        isFirst = getSharedPreferences(SHAREDPREFS, 0).getBoolean(isFirstTime, true);
        editor.putBoolean(isFirstTime, false).commit();

        mBillingClient = BillingClient.newBuilder(this)
                .setListener((billingResult, purchases) -> {
                    // To be implemented in a later section.
                    if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK && purchases != null) {
                        for (Purchase purchase : purchases) {
                            handlePurchase(purchase);
                        }
                    } else if (billingResult.getResponseCode() ==
                            BillingClient.BillingResponseCode.USER_CANCELED) {
                        // Handle an error caused by a user cancelling the purchase flow.
                    } else {
                        // Handle any other error codes.
                    }

                })
                .enablePendingPurchases()
                .build();

        checkSubscription();
        proceedWithAppLogic();


    }


    private void handlePurchase(Purchase purchase) {

        if (purchase.getPurchaseState() == Purchase.PurchaseState.PURCHASED) {

            AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener = billingResult -> {

                // the user's purchase has been successful
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK)

                    //TODO set the user's premium status to true
                    Log.d("Acknowledged", "successfully acknowledged product");
            };

            if (!purchase.isAcknowledged()) {
                AcknowledgePurchaseParams acknowledgePurchaseParams =
                        AcknowledgePurchaseParams.newBuilder()
                                .setPurchaseToken(purchase.getPurchaseToken())
                                .build();

                Log.d("Not_Acknowledged", "no");
                mBillingClient.acknowledgePurchase(acknowledgePurchaseParams,
                        acknowledgePurchaseResponseListener);
            }
        }
    }

    void checkSubscription() {

        billingClient = BillingClient.newBuilder(this).enablePendingPurchases().setListener((billingResult, list) -> {
        }).build();
        final BillingClient finalBillingClient = billingClient;
        billingClient.startConnection(new BillingClientStateListener() {
            @Override
            public void onBillingServiceDisconnected() {

            }

            @Override
            public void onBillingSetupFinished(@NonNull BillingResult billingResult) {

                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    finalBillingClient.queryPurchasesAsync(
                            QueryPurchasesParams.newBuilder().setProductType(BillingClient.ProductType.SUBS).build(), (billingResult1, list) -> {
                                if (billingResult1.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                                    Log.d("testOffer", list.size() + " size");
                                    if (list.size() > 0) {
                                        Utils.vip_subscription = true;
                                        Utils.all_subscription = true;
                                    } else {
                                        Utils.vip_subscription = false;
                                        Utils.all_subscription = false;

                                    }

                                }
                            });

                }

            }
        });
    }

    private void proceedWithAppLogic() {
        Log.d("TAGGGGEEG", "onBillingSetupFinished: proceedWithAppLogic");

        new CountDownTimer(5000, 500){
            @Override
            public void onFinish() {
                if (Utils.vip_subscription) {
                    Log.d("TAGGGGEEG", "onBillingSetupFinished: vip_subscription");
                    // User has an active subscription, navigate to the main activity
                    startActivity(new Intent(SplashActivity.this, ImageGeneratorActivity.class));
                    finish();

                } else {

                    if (isFirst) {
                        startActivity(new Intent(SplashActivity.this, OnboardingActivityOne.class));
                    } else {
                        startActivity(new Intent(SplashActivity.this, SubscriptionActivity.class));
                    }
                    finish();

                }
            }

            @Override
            public void onTick(long l) {

            }
        }.start();




    }

    // Implement the PurchasesUpdatedListener to handle purchase flow
    private final PurchasesUpdatedListener purchasesUpdatedListener = (billingResult, purchases) -> {
        // Handle purchase updates if necessary
    };

    @Override
    protected void onDestroy() {
        super.onDestroy();
        // Disconnect the BillingClient when the activity is destroyed
        if (billingClient != null && billingClient.isReady()) {
            billingClient.endConnection();
        }
    }
}
