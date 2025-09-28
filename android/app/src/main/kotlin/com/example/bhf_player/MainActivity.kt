package com.example.bhf_player

import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.os.Bundle
import android.provider.OpenableColumns
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream


class MainActivity : FlutterActivity() {
    private val CHANNEL = "screenshot_listener"
    private val FILE_CHANNEL = "file_intent_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // القناة السابقة الخاصة بالسكرين شوت
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "disableScreenshot" -> {
                    window.setFlags(
                        WindowManager.LayoutParams.FLAG_SECURE,
                        WindowManager.LayoutParams.FLAG_SECURE
                    )
                    result.success(null)
                }
                "enableScreenshot" -> {
                    window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FILE_CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "getInitialFile") {
                    val intent = intent
                    val uri = intent.data ?: intent.getParcelableExtra(Intent.EXTRA_STREAM)
                    val path = uri?.let { getFilePathFromUri(it) }
                    result.success(path)
                } else {
                    result.notImplemented()
                }
            }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)

        val uri = intent.data ?: intent.getParcelableExtra(Intent.EXTRA_STREAM)
        uri?.let {
            MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger!!, FILE_CHANNEL)
                .invokeMethod("onNewFile", getFilePathFromUri(it))
        }
    }

    // تحويل URI من نوع content:// إلى مسار فعلي
    private fun getFilePathFromUri(uri: Uri): String? {
        return try {
            val fileName = getFileName(uri)
            val file = File(cacheDir, fileName)
            val inputStream: InputStream? = contentResolver.openInputStream(uri)
            val outputStream = FileOutputStream(file)
            inputStream?.copyTo(outputStream)
            inputStream?.close()
            outputStream.close()
            file.absolutePath
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    // استخراج اسم الملف من URI
    private fun getFileName(uri: Uri): String {
        var name = "temp_file"
        val cursor: Cursor? = contentResolver.query(uri, null, null, null, null)
        cursor?.use {
            val index = it.getColumnIndex(OpenableColumns.DISPLAY_NAME)
            if (it.moveToFirst() && index >= 0) {
                name = it.getString(index)
            }
        }
        return name
    }
}
