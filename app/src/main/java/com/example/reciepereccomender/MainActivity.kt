package com.example.reciepereccomender

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Spinner
import android.widget.ArrayAdapter
import android.widget.EditText
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.database.sqlite.SQLiteDatabase










class MainActivity : AppCompatActivity() {

    private var dbHelper: DatabaseHelper? = null
    private var mDb: SQLiteDatabase? = null

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

        //datbase
        dbHelper = DatabaseHelper(this, getFilesDir().getAbsolutePath());

        dbHelper!!.prepareDatabase();



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
            c.setType((findViewById(R.id.spinner) as Spinner).getSelectedItem().toString());


        var data=showData(c);
        val intent = Intent(this, ResultActivity::class.java)


        intent.putExtra("result", data.toString());
        // start your next activity
        startActivity(intent)
    }

    private fun showData(c:Controller) : StringBuffer {
        val list = dbHelper!!.getMeals(c);
        val data = StringBuffer()
        for (i in list.indices) {
            val emp = list.get(i)
            data.append(emp.getId()).append(",")
        }

        return data;
    }
}