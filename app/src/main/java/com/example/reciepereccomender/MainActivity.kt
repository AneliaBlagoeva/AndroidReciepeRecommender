package com.example.reciepereccomender

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Spinner
import android.widget.ArrayAdapter
import android.widget.EditText
import android.widget.Button
import kotlin.random.Random
import android.text.method.TextKeyListener.clear
import android.view.View


class MainActivity : AppCompatActivity(){

    private var dbHelper: DatabaseHelper? = null
    private var img:String?=""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // create a adapter
        val country = arrayOf("BREAKFAST", "LUNCH", "LUNCH SNACK","DINNER", "BREAKFAST SNACK")
        val stringArrayAdapter = ArrayAdapter(this, R.layout.spinner_text_color, country)

        // create a spinner
        val spinner = findViewById(R.id.spinner) as Spinner
        // add adapter to spinner
        spinner.adapter = stringArrayAdapter

        //database
        dbHelper = DatabaseHelper(this, getFilesDir().getAbsolutePath());

        dbHelper!!.prepareDatabase();

        var mButton = findViewById(R.id.button) as Button

        mButton.setOnClickListener{ AwesomeButtonClick();}


    }

    private fun AwesomeButtonClick()
    {
        var data:StringBuffer;
        try {
            var c = Controller();

            var mEditField = (findViewById(R.id.editText) as EditText).getText();
            if(mEditField.length!=0)
            {
                var mEdit=mEditField.toString()
                c.setIngredientOne(mEdit);
            }

            var mEditField2 = (findViewById(R.id.editText2) as EditText).getText();
            if(mEditField2.length!=0)
            {
                var mEdit2=mEditField2.toString()
                c.setIngredientTwo(mEdit2);
            }


            var mEditField3 = (findViewById(R.id.editText3) as EditText).getText();
            if(mEditField3.length!=0)
            {
                var mEdit3=mEditField3.toString()
                c.setIngredientTheree(mEdit3);
            }

            c.setType((findViewById(R.id.spinner) as Spinner).getSelectedItem().toString());
            data=showData(c);
        }
        catch (e:Exception)
        {
            data= StringBuffer(e.message.toString());
        }


        val intent = Intent(this, ResultActivity::class.java)

        intent.putExtra("result", data.toString());
        intent.putExtra("image", img.toString());
        // start your next activity
        startActivity(intent)
    }



    private fun showData(c:Controller) : StringBuffer {
        val list = dbHelper!!.getMeals(c);
        val data = StringBuffer();
        val index= Random.nextInt(list.size)

        val meal = list.get(index)
        data.append("Name: ").append(meal.getName()).append("\n")
            .append("Ingredients: ").append(meal.getIngredients()).append("\n")
            .append("Steps: ").append(meal.getSteps()).append("\n")
            .append("Calories: ").append(meal.getCalories()).append("\n")
            .append("Preparation time: ").append(meal.getPrepTime()).append("\n")

        img = meal.getMealImg();


        return data;
    }
}