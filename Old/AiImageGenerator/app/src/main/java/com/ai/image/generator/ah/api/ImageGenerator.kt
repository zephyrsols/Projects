package com.ai.image.generator.ah.api

import com.ai.image.generator.ah.utils.networkUtils
import okhttp3.ResponseBody
import retrofit2.Response

class ImageGenerator(private val apiKey: String) {
    private val deepAiService = networkUtils.createDeepAiService()

    suspend fun generateImage(text: String): Response<ResponseBody> {
        return deepAiService.generateImage(text, apiKey)
    }
}
