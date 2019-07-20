package com.example.reciepereccomender;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
public class DatabaseHelper extends SQLiteOpenHelper {
    private final static String TAG = "DatabaseHelper";
    private final Context myContext;
    private static final String DATABASE_NAME = "Reciepe.db";
    private static final int DATABASE_VERSION = 1;
    private String pathToSaveDBFile;
    public DatabaseHelper(Context context, String filePath) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
        this.myContext = context;
        pathToSaveDBFile = new StringBuffer(filePath).append("/").append(DATABASE_NAME).toString();
    }
    public void prepareDatabase() throws IOException {
        boolean dbExist = checkDataBase();
        if(dbExist) {
            Log.d(TAG, "Database exists.");
            int currentDBVersion = 2;
            if (DATABASE_VERSION > currentDBVersion) {
                Log.d(TAG, "Database version is higher than old.");
                deleteDb();
                try {
                    copyDataBase();
                } catch (IOException e) {
                    Log.e(TAG, e.getMessage());
                }
            }
        } else {
            try {
                copyDataBase();
            } catch (IOException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }
    private boolean checkDataBase() {
        boolean checkDB = false;
        try {
            File file = new File(pathToSaveDBFile);
            checkDB = file.exists();
        } catch(SQLiteException e) {
            Log.d(TAG, e.getMessage());
        }
        return checkDB;
    }
    private void copyDataBase() throws IOException {
        OutputStream os = new FileOutputStream(pathToSaveDBFile);
        InputStream is = myContext.getAssets().open("sqlite/"+DATABASE_NAME);
        byte[] buffer = new byte[1024];
        int length;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
        is.close();
        os.flush();
        os.close();
    }
    public void deleteDb() {
        File file = new File(pathToSaveDBFile);
        if(file.exists()) {
            file.delete();
            Log.d(TAG, "Database deleted.");
        }
    }
    @Override
    public void onCreate(SQLiteDatabase db) {
        Log.d(TAG, "onCreate");
    }
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    }

    public List<Meal> getMeals(Controller c) {
        SQLiteDatabase db = SQLiteDatabase.openDatabase(pathToSaveDBFile, null, SQLiteDatabase.OPEN_READONLY);

        int categoryID=1;
        String queryCategory="SELECT id FROM Category WHERE value=\"" + c.type + "\"";
        Cursor categoryCursor=db.rawQuery(queryCategory,null);
        while(categoryCursor.moveToNext())
        {
            categoryID=categoryCursor.getInt(0);
        }


        String queryAll = "SELECT idMeal FROM Meal WHERE idCategory="+ categoryID + " AND ingredients " +
                "LIKE \"%" + c.ingredientOne + "%\" AND ingredients " +
                "LIKE \"%"+ c.ingredientTwo + "%\" AND ingredients " +
                "LIKE \"%" + c.ingredientTheree + "%\"";
        Cursor cursor = db.rawQuery(queryAll, null);
        if(!cursor.moveToNext()){
            String query = "SELECT idMeal FROM Meal WHERE idCategory="+ categoryID + " AND ingredients " +
                    "LIKE \"%" + c.ingredientOne + "%\" OR ingredients " +
                    "LIKE \"%"+ c.ingredientTwo + "%\" OR ingredients " +
                    "LIKE \"%" + c.ingredientTheree + "%\"";
            cursor = db.rawQuery(query, null);
        }

        List<Meal> list = new ArrayList<Meal>();
        while(cursor.moveToNext()) {
            Meal meal = new Meal();
            meal.setId(cursor.getInt(0));
            list.add(meal);
        }
        db.close();
        return list;
    }

}