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
    private var title:String?=""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // create a adapter
        val categories = arrayOf("ЗАКУСКА", "ОБЯД", "СНАК","ВЕЧЕРЯ")
        val stringArrayAdapter = ArrayAdapter(this, R.layout.spinner_text_color, categories)

        // create a spinner
        val spinner = findViewById(R.id.spinner) as Spinner
        // add adapter to spinner
        spinner.adapter = stringArrayAdapter

        //spinner type
        val types = arrayOf("ВСИЧКИ", "ВЕГАН", "ВЕГЕТАРИАНСКА", "БЕЗ ЛАКТОЗА")
        val stringArrayAdapterTypes = ArrayAdapter(this, R.layout.spinner_text_color, types)

        // create a spinner
        val spinnerType = findViewById(R.id.spinnerType) as Spinner
        // add adapter to spinner
        spinnerType.adapter = stringArrayAdapterTypes

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

            c.setCategory((findViewById(R.id.spinner) as Spinner).getSelectedItem().toString());
            c.setType((findViewById(R.id.spinnerType) as Spinner).getSelectedItem().toString());
            data=showData(c);
        }
        catch (e:Exception)
        {
            data= StringBuffer(e.message.toString());
        }


        val intent = Intent(this, ResultActivity::class.java)

        intent.putExtra("result", data.toString())
        intent.putExtra("title", title.toString());
        intent.putExtra("image", img.toString());
        // start your next activity
        startActivity(intent)
    }

    private fun showData(c:Controller) : StringBuffer {
        val list = dbHelper!!.getMeals(c);
        val data = StringBuffer();
        if (list.isNotEmpty()) {

            val index = Random.nextInt(list.size)

            val meal = list.get(index)
            data.append(meal.getIngredients()).append("\n\n")
                .append(meal.getSteps()).append("\n\n")
                .append("Калории: ").append(meal.getCalories()).append(" kcal\n\n")
                .append("Време за приготвяне: ").append(meal.getPrepTime()).append(" мин\n\n")

            img = meal.getMealImg();
            title= meal.getName();
            return data;
        }
        else{
            img="template";
            return data.append("Няма подобна рецепта");
        }
    }
}