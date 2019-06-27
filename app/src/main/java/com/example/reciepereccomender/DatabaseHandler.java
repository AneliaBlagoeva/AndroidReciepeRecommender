package com.example.reciepereccomender;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DatabaseHandler extends SQLiteOpenHelper {

    private static final int DATABASE_VERSION = 1;
    protected static final String DATABASE_NAME = "Reciepe";

    public DatabaseHandler(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        String sql = "CREATE TABLE Meals " +
                "( id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "idCategory INTEGER, " +
                "ingredients TEXT," +
                "steps TEXT," +
                "calories TEXT," +
                "prepTime TEXT," +
                "mealImg TEXT," +
                "name TEXT," +
                "image TEXT ) ";

        db.execSQL(sql);

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

        String sql = "DROP TABLE IF EXISTS Meal";
        db.execSQL(sql);

        onCreate(db);
    }
}

