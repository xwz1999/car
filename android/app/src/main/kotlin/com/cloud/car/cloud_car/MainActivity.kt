package com.cloud.car.cloud_car

import android.os.Bundle
import android.os.PersistableBundle
import android.view.KeyEvent
import android.view.View
import io.flutter.plugin.common.MethodCall
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.annotation.NonNull;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
