package com.example.sew_hun;

import io.flutter.embedding.android.FlutterActivity;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.os.Bundle;


public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
    }
}
