package com.example.asset_list

import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.plugin.platform.PlatformViewsController
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        ShimPluginRegistry(flutterEngine).let {
            ImageManagerPlugin.registerWith(it.registrarFor("image_manager"))
        }
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
