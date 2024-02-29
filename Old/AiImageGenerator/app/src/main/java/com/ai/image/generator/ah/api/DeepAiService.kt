package com.ai.image.generator.ah.api

import okhttp3.ResponseBody
import retrofit2.Response
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface deepAiService {
    @POST("text2img")
    @FormUrlEncoded
    suspend fun generateImage(
        @Field("text") text: String,
        @Field("api-key") apiKey: String
    ): Response<ResponseBody>
}
