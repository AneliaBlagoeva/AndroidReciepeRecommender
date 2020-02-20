package com.example.reciepereccomender

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import android.text.method.ScrollingMovementMethod





class ResultActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.result_view)

        val extras = intent.extras
        if (intent.hasExtra("result")) {
            val value = extras.getString("result")
            val imageUrl = extras.getString("image")
            val titleValue = extras.getString("title")

            val imageView = findViewById<View>(R.id.imageView) as ImageView
            imageView.setImageResource(getResources().getIdentifier(imageUrl,"drawable",packageName))


            val tv = findViewById<View>(R.id.result) as TextView
            tv.movementMethod = ScrollingMovementMethod.getInstance()
            tv.text = value;

            val title = findViewById<View>(R.id.title) as TextView
            title.text = titleValue;
        }
    }
}