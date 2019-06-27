package com.example.reciepereccomender

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Spinner
import android.widget.ArrayAdapter
import android.widget.EditText
import android.view.View
import android.widget.Button
import android.widget.TextView





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

        var mButton = findViewById(R.id.button) as Button

        mButton.setOnClickListener{AwesomeButtonClick()};

    }

    private fun AwesomeButtonClick()
    {
        var mEdit   = (findViewById(R.id.editText) as EditText).getText().toString();
        var mEdit2   = (findViewById(R.id.editText2) as EditText).getText().toString();
        var mEdit3   = (findViewById(R.id.editText3) as EditText).getText().toString();

            var c =Controller();
            c.setIngredientOne(mEdit);
            c.setIngredientTwo(mEdit2);
            c.setIngredientTheree(mEdit3);

        readRecords();
    }

    fun readRecords() {

        val meals = TableControllerStudent(this).read();

        if (meals.size > 0) {

            for (obj in meals) {

                val id = obj.getId()

                val textViewContents = "id:" + id;

                val textViewStudentItem = TextView(this)
                textViewStudentItem.setPadding(0, 10, 0, 10)
                textViewStudentItem.setText(textViewContents)
                textViewStudentItem.tag = Integer.toString(id)

            }

        } else {

            val locationItem = TextView(this)
            locationItem.setPadding(8, 8, 8, 8)
            locationItem.text = "No records yet."

        }

    }
}