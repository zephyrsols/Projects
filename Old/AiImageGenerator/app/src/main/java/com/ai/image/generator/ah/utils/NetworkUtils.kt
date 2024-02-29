package com.ai.image.generator.ah.utils

import com.ai.image.generator.ah.api.deepAiService
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object networkUtils {
    private const val BASE_URL = "https://api.deepai.org/deepdream/"

    fun createDeepAiService(): deepAiService {
        val httpClient = OkHttpClient.Builder().build()
        val retrofit = Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .client(httpClient)
            .build()

        return retrofit.create(deepAiService::class.java)
    }
}
