package com.example.miqat

import android.content.Intent
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.LocationSettingsRequest
import com.google.android.gms.location.Priority
import com.google.android.gms.common.api.ResolvableApiException
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : AudioServiceActivity() {

    private val channelName = "miqat/location_settings"
    private val requestCheckSettings = 1001

    private var locationSettingsResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        ).setMethodCallHandler { call, result ->

            when (call.method) {
                "checkLocationSettings" -> {
                    checkLocationSettings(result)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun checkLocationSettings(result: MethodChannel.Result) {
        locationSettingsResult = result

        val locationRequest = LocationRequest.Builder(
            Priority.PRIORITY_HIGH_ACCURACY,
            10_000L
        )
            .setWaitForAccurateLocation(true)
            .build()

        val locationSettingsRequest =
            LocationSettingsRequest.Builder()
                .addLocationRequest(locationRequest)
                .build()

        val settingsClient =
            LocationServices.getSettingsClient(this)

        settingsClient
            .checkLocationSettings(locationSettingsRequest)
            .addOnSuccessListener {
                locationSettingsResult = null
                result.success(true)
            }
            .addOnFailureListener { exception ->

                if (exception is ResolvableApiException) {
                    try {
                        exception.startResolutionForResult(
                            this,
                            requestCheckSettings
                        )
                    } catch (e: Exception) {
                        locationSettingsResult = null
                        result.success(false)
                    }
                } else {
                    locationSettingsResult = null
                    result.success(false)
                }
            }
    }

    override fun onActivityResult(
        requestCode: Int,
        resultCode: Int,
        data: Intent?
    ) {
        super.onActivityResult(
            requestCode,
            resultCode,
            data
        )

        if (requestCode == requestCheckSettings) {
            locationSettingsResult?.success(
                resultCode == RESULT_OK
            )

            locationSettingsResult = null
        }
    }
}