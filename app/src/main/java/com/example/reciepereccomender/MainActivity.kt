package com.example.reciepereccomender

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Spinner
import android.widget.ArrayAdapter
import android.widget.EditText
import android.R.attr.button
import android.view.View
import android.widget.Button
import android.widget.Toast
import android.R.id.button3




class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // create a adapter
        val country = arrayOf("Breakfast", "Lunch", "Snack")
        val stringArrayAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_dropdown_item, country)

        // create a spinner
        val spinner = findViewById(R.id.spinner) as Spinner
        // add adapter to spinner
        spinner.adapter = stringArrayAdapter

        var mEdit   = findViewById(R.id.editText) as EditText
        var mEdit2   = findViewById(R.id.editText2) as EditText;
        var mEdit3   = findViewById(R.id.editText3) as EditText;


        var mButton = findViewById(R.id.button) as Button

        mButton.setOnClickListener(View.OnClickListener {
            Toast.makeText(
                applicationContext,
                mEdit.text, Toast.LENGTH_SHORT
            ).show()
        })


    }
}