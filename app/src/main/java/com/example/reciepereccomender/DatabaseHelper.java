package com.example.reciepereccomender;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class DatabaseHelper extends SQLiteOpenHelper {
    private final static String TAG = "DatabaseHelper";
    private final Context myContext;
    private static final String DATABASE_NAME = "Reciepe.sqlite";
    private static final int DATABASE_VERSION = 4;
    private String pathToSaveDBFile;


    public DatabaseHelper(Context context, String filePath) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
        this.myContext = context;
        pathToSaveDBFile = new StringBuffer(filePath).append("/").append(DATABASE_NAME).toString();
    }

    public void prepareDatabase() throws IOException {
        boolean dbExist = checkDataBase();
        if (dbExist) {
            Log.d(TAG, "Database exists.");
            int currentDBVersion = 3;
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
        } catch (SQLiteException e) {
            Log.d(TAG, e.getMessage());
        }
        return checkDB;
    }

    private void copyDataBase() throws IOException {
        OutputStream os = new FileOutputStream(pathToSaveDBFile);
        InputStream is = myContext.getAssets().open(DATABASE_NAME);
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
        if (file.exists()) {
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

        int categoryID = 1;
        String queryCategory = "SELECT id FROM Category WHERE value=" + '"' + c.category + '"';
        Cursor categoryCursor = db.rawQuery(queryCategory, null);
        while (categoryCursor.moveToNext()) {
            categoryID = categoryCursor.getInt(0);
        }

        int typeID = 1;
        String queryType = "SELECT id FROM Type WHERE value=" + '"' + c.type + '"';
        Cursor typeCursor = db.rawQuery(queryType, null);
        while (typeCursor.moveToNext()) {
            typeID = typeCursor.getInt(0);
        }


        //BASE===========================================================================
        StringBuffer queryBase = new StringBuffer();
        queryBase.append("SELECT idMeal,ingredients,steps, calories, prepTime,name, mealImage " +
                "FROM Meal M " +
                "INNER JOIN MEAL_CATEGORY C ON C.MEALID=M.IDMEAL ");
        if (typeID != 1) {
            queryBase.append("INNER JOIN MEAL_TYPE T ON T.MEALID=M.IDMEAL " +
                    "WHERE T.TYPEID=" + typeID + " " +
                    "AND C.CATEGORYID=" + categoryID + " ");
        } else {
            queryBase.append("WHERE C.CATEGORYID= " + categoryID + " ");
        }


        //ALL INGREDIENTS====================================================================
        StringBuffer queryAll = new StringBuffer();
        queryAll.append(queryBase);
        Cursor cursor = null;
        if ((!c.ingredientOne.isEmpty()) && (!c.ingredientTwo.isEmpty()) && (!c.ingredientTheree.isEmpty())) {
            queryAll.append("AND M.ingredients LIKE \"%" + c.ingredientOne + "%\""
                    + "AND M.ingredients LIKE \"%" + c.ingredientTwo + "%\""
                    + "AND M.ingredients LIKE \"%" + c.ingredientTheree + "%\"");

            cursor = db.rawQuery(queryAll.toString(), null);
        }

        //COMBINATIONS=====================================================================
        if (cursor == null) {
            StringBuffer queryCombinatiion = new StringBuffer();
            queryCombinatiion.append(queryBase);
            Boolean run = false;
            Boolean appendedAnd = false;
            if (c.ingredientOne.isEmpty() == false && c.ingredientTwo.isEmpty() == false) {
                run = true;
                if (appendedAnd == false) {
                    queryCombinatiion.append("AND ");
                    appendedAnd = true;
                } else {
                    queryCombinatiion.append(" OR ");
                }
                queryCombinatiion.append("(M.ingredients " +
                        "LIKE \"%" + c.ingredientOne + "%\" AND M.ingredients " +
                        "LIKE \"%" + c.ingredientTwo + "%\")");
            }
            if (c.ingredientOne.isEmpty() == false && c.ingredientTheree.isEmpty() == false) {
                run = true;
                if (appendedAnd == false) {
                    queryCombinatiion.append("AND ");
                    appendedAnd = true;
                } else {
                    queryCombinatiion.append(" OR ");
                }
                queryCombinatiion.append("(M.ingredients " +
                        "LIKE \"%" + c.ingredientOne + "%\" AND M.ingredients " +
                        "LIKE \"%" + c.ingredientTheree + "%\")");
            }
            if (c.ingredientTwo.isEmpty() == false && c.ingredientTheree.isEmpty() == false) {
                run = true;
                if (appendedAnd == false) {
                    queryCombinatiion.append("AND ");
                } else {
                    queryCombinatiion.append(" OR ");
                }
                queryCombinatiion.append("(M.ingredients " +
                        "LIKE \"%" + c.ingredientTwo + "%\" AND M.ingredients " +
                        "LIKE \"%" + c.ingredientTheree + "%\")");
            }
            if (queryCombinatiion.length() != 0) {
                StringBuffer query = new StringBuffer();
                query.append(queryBase);
                query.append((queryCombinatiion));

                if (run) {
                    cursor = db.rawQuery(queryCombinatiion.toString(), null);
                }
            }

        }

        //ONE INGREDIENT ONLY================================================================
        if (cursor == null || cursor.getCount() < 1) {
            StringBuffer query = new StringBuffer();
            query.append(queryBase);
            Boolean appendedAnd = false;
            if (c.ingredientOne.isEmpty() == false) {
                if (appendedAnd == false) {
                    appendedAnd = true;
                    query.append("AND ");
                } else {
                    query.append("OR ");
                }
                query.append("M.ingredients " +
                        "LIKE \"%" + c.ingredientOne + "%\"");
            }
            if (c.ingredientTwo.isEmpty() == false) {
                if (appendedAnd == false) {
                    appendedAnd = true;
                    query.append("AND ");
                } else {
                    query.append("OR ");
                }
                query.append("M.ingredients " +
                        "LIKE \"%" + c.ingredientTwo + "%\"");
            }
            if (c.ingredientTheree.isEmpty() == false) {
                if (appendedAnd == false) {

                    query.append("AND ");
                } else {
                    query.append("OR ");
                }
                query.append("M.ingredients " +
                        "LIKE \"%" + c.ingredientTheree + "%\"");
            }

            cursor = db.rawQuery(query.toString(), null);
        }

        List<Meal> list = new ArrayList<Meal>();
        if (cursor != null && cursor.getCount() >= 1) {
            while (cursor.moveToNext()) {
                Meal meal = new Meal();
                meal.setId(cursor.getInt(0));
                meal.setIngredients(cursor.getString(1));
                meal.setSteps(cursor.getString(2));
                meal.setCalories(cursor.getString(3));
                meal.setPrepTime(cursor.getString(4));
                meal.setName(cursor.getString(5));
                meal.setMealImg(cursor.getString(6));
                list.add(meal);
            }
        }
        db.close();
        return list;
    }

}