package br.com.softyes.tabnews

import android.os.Bundle
import android.view.MotionEvent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    intent.putExtra("background_mode", "transparent")
    super.onCreate(savedInstanceState)
  }
}
