package com.example.reciepereccomender

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.TextView



class ResultActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.result_view)

        val extras = intent.extras
        if (extras != null) {
            val value = extras.getString("result")
            val tv = findViewById<View>(R.id.result) as TextView
            tv.text = value;
            //The key argument here must match that used in the other activity
        }
    }
}