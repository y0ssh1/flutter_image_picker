package com.example.asset_list

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.database.Cursor
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.ImageDecoder
import android.graphics.Matrix
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.provider.MediaStore.Files.FileColumns
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.lang.ref.WeakReference
import java.nio.ByteBuffer
import java.nio.ByteBuffer.allocateDirect
import java.util.*

class ImageManagerPlugin(
        val activity: Activity,
        val messenger: BinaryMessenger
    ): FlutterPlugin, MethodChannel.MethodCallHandler, PluginRegistry.RequestPermissionsResultListener {

    private var tmpResult: MethodChannel.Result? = null
    private val scope = CoroutineScope(Dispatchers.Default)

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "image_manager")
        channel.setMethodCallHandler(ImageManagerPlugin(
                activity,
                messenger
        ))
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }

    companion object {
        const val request_permission_tag = 0

        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), "image_manager")
            channel.setMethodCallHandler(ImageManagerPlugin(registrar.activity(), registrar.messenger()))
        }


        private fun getAllMediaThumbnailsPath(context: Context): List<Map<String, Any?>> {
            val sort = FileColumns.DATE_ADDED + " DESC"
            val projection = arrayOf(
                    FileColumns._ID,
                    FileColumns.DATE_ADDED,
                    FileColumns.HEIGHT,
                    FileColumns.WIDTH,
                    FileColumns.MEDIA_TYPE,
                    MediaStore.Video.VideoColumns.DURATION,
                    FileColumns.DISPLAY_NAME,
                    MediaStore.Images.ImageColumns.ORIENTATION
            )
            val imageSelection = "${FileColumns.MEDIA_TYPE}=${FileColumns.MEDIA_TYPE_IMAGE}"
            val movieSelection = "${FileColumns.MEDIA_TYPE}=${FileColumns.MEDIA_TYPE_VIDEO}"
            val selection = "$imageSelection OR $movieSelection"

            val queryUri = MediaStore.Files.getContentUri("external")
            return context.contentResolver.query(queryUri, projection, selection, null, sort).run {
                val cursor: Cursor = this ?: return@run listOf()
                val mappedAssets = arrayOfNulls<Uri>(cursor.count)
                        .mapIndexed {index, _ ->
                            cursor.moveToPosition(index)
                            val lowerPath = cursor.getString(6).toLowerCase(Locale.JAPANESE)
                            if (lowerPath.matches(Regex(".+\\.(heic|gif)"))) { return@mapIndexed null }

                            val uri = Uri.withAppendedPath(queryUri, cursor.getInt(0).toString())
                            val isRotated = cursor.getString(7) == "90" || cursor.getString(7) == "270"
                            val height = cursor.getInt(2)
                            val width = cursor.getInt(3)

                            return@mapIndexed mapOf(
                                    Pair("identifier",  uri.toString()),
                                    Pair("timestamp", cursor.getDouble(1)),
                                    Pair("height", height),
                                    Pair("width", width),
                                    Pair("latitude", null),
                                    Pair("longitude", null),
                                    Pair("type", if (cursor.getInt(4) == FileColumns.MEDIA_TYPE_VIDEO) "movie" else "image"),
                                    Pair("duration", cursor.getInt(5).toDouble() / 1000),
                                    Pair("orientation", cursor.getInt(7))
                            )
                        }
                        .filterNotNull()

                cursor.close()
                return@run mappedAssets
            }
        }

        private suspend fun getThumbnailTask(
                context: Activity,
                messenger: BinaryMessenger,
                identifier: String,
                width: Int,
                height: Int,
                rawWidth: Int,
                rawHeight: Int,
                quality: Int,
                orientation: Int,
                type: String
        ) {
            val activityReference = WeakReference(context)
            val uri = Uri.parse(identifier)
            var byteArray: ByteArray? = null

            try {
                // get a reference to the activity if it is still there
                val activity = activityReference.get()
                if (activity == null || activity.isFinishing) return

                var bitmap = when {
                    (type == "movie") -> {
                        MediaStore.Video.Thumbnails.getThumbnail(
                                activity.contentResolver,
                                identifier.split("/").last().toLong(),
                                MediaStore.Video.Thumbnails.MINI_KIND,
                                null
                        )
                    }
                    else -> correctlyOrientedImage(activity, uri, width, height, rawWidth, rawHeight)
                }
                if (orientation > 0) {
                    val matrix = Matrix()
                    matrix.postRotate(orientation.toFloat())

                    bitmap = Bitmap.createBitmap(
                            bitmap!!,
                            0,
                            0,
                            bitmap.width,
                            bitmap.height,
                            matrix,
                            true
                    )
                }
                val bitmapStream = ByteArrayOutputStream()
                bitmap?.compress(Bitmap.CompressFormat.JPEG, quality, bitmapStream)
                byteArray = bitmapStream.toByteArray()
                bitmap?.recycle()
                bitmapStream.runCatching {
                    this.close()
                }
            } catch (e: IOException) {
                e.printStackTrace()
            }


            val buffer: ByteBuffer
            if (byteArray != null) {
                buffer = allocateDirect(byteArray.size)
                buffer.put(byteArray)
                withContext(Dispatchers.Main) {
                    messenger.send("image_manager/thumbnail/${identifier}_${width}_${height}", buffer)
                }
                buffer.clear()
            }
        }

        private fun correctlyOrientedImage(context: Context, photoUri: Uri, width: Int, height: Int, rawWidth: Int, rawHeight: Int): Bitmap? {
            // AndroidPからImageDecoderを使うとHEICとかも読めるようになったのでそっちを使う
            return when {
                Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                    ImageDecoder.createSource(context.contentResolver, photoUri).let {
                        return@let ImageDecoder.decodeBitmap(it) { imageDecoder, _, _ -> imageDecoder.setTargetSize(width, height) }
                    }
                }
                else -> {
                    val scale = calculateInSampleSize(rawHeight, rawWidth, width, height)
                    val option = BitmapFactory.Options().apply {
                        this.inSampleSize = scale
                    }

                    // オプションを使ってリサイズされているBitmapを生成する
                    // decodeStreamのoption以外で調整すると一度でかいBitmapを作ってからリサイズするとOOMになるので注意
                    context.contentResolver.openInputStream(photoUri).use {
                        return BitmapFactory.decodeStream(it, null, option)
                    }
                }
            }
        }

        // https://developer.android.com/topic/performance/graphics/load-bitmap
        private fun calculateInSampleSize(height: Int, width: Int, reqWidth: Int, reqHeight: Int): Int {
            // Raw height and width of image
            var inSampleSize = 1

            if (height > reqHeight || width > reqWidth) {

                val halfHeight: Int = height / 2
                val halfWidth: Int = width / 2

                // Calculate the largest inSampleSize value that is a power of 2 and keeps both
                // height and width larger than the requested height and width.
                while (halfHeight / inSampleSize >= reqHeight && halfWidth / inSampleSize >= reqWidth) {
                    inSampleSize *= 2
                }
            }

            return inSampleSize
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "fetchAssets" -> {
                scope.launch {
                    val media = getAllMediaThumbnailsPath(activity)
                    withContext(Dispatchers.Main) {
                        result.success(media)
                    }
                }
            }
            "requestThumbnail" -> {
                val identifier = call.argument<String>("identifier") ?: return result.success(true)
                val width = call.argument<Int>("width") ?: return result.success(true)
                val height = call.argument<Int>("height") ?: return result.success(true)
                val rawWidth = call.argument<Int>("rawWidth") ?: return result.success(true)
                val rawHeight = call.argument<Int>("rawHeight") ?: return result.success(true)
                val quality = call.argument<Int>("quality") ?: return result.success(true)
                val type = call.argument<String>("type") ?: return result.success(true)
                val orientation = call.argument<Int>("orientation") ?: return result.success(true)
                CoroutineScope(Dispatchers.IO).launch {
                    getThumbnailTask(activity, messenger, identifier, width, height, rawWidth, rawHeight, quality, orientation, type)
                    withContext(Dispatchers.Main) {
                        result.success(true)
                    }
                }
            }
            "requestPermission" -> {
                scope.launch {
                    tmpResult = result
                    if (ContextCompat.checkSelfPermission(activity, Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED) {
                        ActivityCompat.requestPermissions(activity, arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE), request_permission_tag)
                    } else {
                        withContext(Dispatchers.Main) {
                            result.success(true)
                        }
                    }
                }
            }
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>?, grantResults: IntArray?): Boolean {
        tmpResult?.success(true)
        tmpResult = null
        return true
    }
}