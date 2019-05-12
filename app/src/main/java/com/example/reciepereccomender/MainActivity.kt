package com.example.reciepereccomender

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Spinner
import android.widget.ArrayAdapter



class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // create a adapter
        val country = arrayOf("Canada", "Mexico", "USA")
        val stringArrayAdapter = ArrayAdapter(this, android.R.layout.simple_spinner_dropdown_item, country)

        // create a spinner
        val spinner = findViewById(R.id.spinner) as Spinner
        // add adapter to spinner
        spinner.adapter = stringArrayAdapter
    }
}
