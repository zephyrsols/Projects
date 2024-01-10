package com.androidmarket.imagegenerator.activity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.QueryPurchasesParams;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.androidmarket.imagegenerator.R;
import com.androidmarket.imagegenerator.util.Utils;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public class SubscriptionActivity extends AppCompatActivity implements PurchasesUpdatedListener, BillingClientStateListener {


    private SkuDetails currentSub;
    private SkuDetails weeklySub;
    private SkuDetails lifetimeSub;
    private static String TAG = SubscriptionActivity.class.getSimpleName().concat(":SUBS");
    private BillingClient mBillingClient;
    LinearLayout rlWeekly, rlLifetime;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        overridePendingTransition(android.R.anim.slide_in_left, android.R.anim.slide_out_right);
        setContentView(R.layout.activity_subscription);
        getSupportActionBar().hide();
        mBillingClient = BillingClient.newBuilder(this)
                .setListener(this) // Set the BillingClient listener to the dialog
                .enablePendingPurchases()
                .build();

        rlWeekly = (LinearLayout) findViewById(R.id.rlWeekly);
        rlLifetime = (LinearLayout) findViewById(R.id.rlLifetime);

        findViewById(R.id.btnClose).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(SubscriptionActivity.this, ImageGeneratorActivity.class));
                finish();
            }
        });

        mBillingClient.startConnection(this);

        findViewById(R.id.rlWeekly).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                currentSub = weeklySub;

                rlWeekly.setBackgroundResource(R.drawable.bg_stroked_black);
                rlLifetime.setBackgroundResource(R.drawable.bg_stroked_gray);
            }
        });

        findViewById(R.id.rlLifetime).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                currentSub = lifetimeSub;

                rlWeekly.setBackgroundResource(R.drawable.bg_stroked_gray);
                rlLifetime.setBackgroundResource(R.drawable.bg_stroked_black);
            }
        });

        findViewById(R.id.btnSubscribe).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final BillingClient finalBillingClient = mBillingClient;

                if (currentSub != null) {
                    BillingFlowParams billingFlowParams = BillingFlowParams.newBuilder()
                            .setSkuDetails(currentSub)
                            .build();
                    BillingResult result = mBillingClient.launchBillingFlow(SubscriptionActivity.this, billingFlowParams);
                    // Handle the response code here if needed
                    if (result.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                        finalBillingClient.queryPurchasesAsync(
                                QueryPurchasesParams.newBuilder().setProductType(BillingClient.ProductType.SUBS).build(), (billingResult1, list) -> {
                                    if (billingResult1.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                                        Log.d("testOffer", list.size() + " size");
                                        if (list.size() > 0) {
                                            Utils.vip_subscription = true;
                                            Utils.all_subscription = true;
                                            Toast.makeText(SubscriptionActivity.this, "Subscribed!", Toast.LENGTH_SHORT).show();
                                        } else {
                                            Utils.vip_subscription = false;
                                            Utils.all_subscription = false;
                                            Toast.makeText(SubscriptionActivity.this, "Failed to subscribe.", Toast.LENGTH_SHORT).show();

                                        }
                                    }
                                });

                    }

                } else {
                    Toast.makeText(SubscriptionActivity.this, "Please Select A Subscription Plan.", Toast.LENGTH_SHORT).show();
                }
            }
        });


    }

    @Override
    public void onBillingSetupFinished(@NotNull BillingResult billingResult) {
        // once the client has been successfully initialized, we will retrieve the products
        if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
            getProducts();
            set_prices_item();
        }
    }

    @Override
    public void onBillingServiceDisconnected() {
        Log.d(TAG, "onBillingServiceDisconnected");
    }

    @SuppressLint("SetTextI18n")
    private void set_prices_item() {
        Log.d(TAG, "getProducts");
        final List<String> skuList_set_price = new ArrayList<>();
        skuList_set_price.add(Utils.weekly_id);
        skuList_set_price.add(Utils.lifetime_id);

        SkuDetailsParams params_prices = SkuDetailsParams.newBuilder()
                .setSkusList(skuList_set_price)
                .setType(BillingClient.SkuType.SUBS)
                .build();

        mBillingClient.querySkuDetailsAsync(params_prices, (billingResult, skuDetailsList) -> {
            if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK && skuDetailsList != null) {
                if (!skuDetailsList.isEmpty()) {
                    for (SkuDetails skuDetails : skuDetailsList) {
                        switch (skuDetails.getSku()) {
                            case Utils.weekly_id:
                                weeklySub = skuDetails;
                                currentSub = weeklySub;
                                break;
                            case Utils.lifetime_id:
                                lifetimeSub = skuDetails;
                                currentSub = lifetimeSub;
                                break;
                        }
                    }
                }
            } else {
                Toast.makeText(SubscriptionActivity.this, "Error in retrieving products from store", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void isUserHasSubscription_premium() {
        if (mBillingClient == null) {
            mBillingClient = BillingClient.newBuilder(SubscriptionActivity.this)
                    .enablePendingPurchases()
                    .build();
        }
        mBillingClient.startConnection(this);
    }

    private void getProducts() {
        Log.d(TAG, "getProducts");
        final List<String> skuList = new ArrayList<>();
        skuList.add("1week");
        skuList.add("one_week_subscription");
        skuList.add("1month");
        skuList.add("one_month_subscription");
        skuList.add("1year");
        skuList.add("one_year_subscription");

        SkuDetailsParams params = SkuDetailsParams.newBuilder()
                .setSkusList(skuList)
                .setType(BillingClient.SkuType.SUBS)
                .build();

        mBillingClient.querySkuDetailsAsync(params, (billingResult, skuDetailsList) -> {
            if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK && skuDetailsList != null) {

            }
        });
    }

    @Override
    public void onPurchasesUpdated(@NonNull BillingResult billingResult, @Nullable List<Purchase> list) {

    }

}