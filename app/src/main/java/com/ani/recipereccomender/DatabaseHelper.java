package com.ani.recipereccomender;

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
        List<Meal> foundRecipes = new ArrayList<Meal>();

        Cursor cursor = null;
        List<String> ingredients = getIngredients(c);

        int categoryID = getCategoryID(c, db);
        int typeID = getTypeID(c, db);

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


        //0 ingredients are entered by user
        if (ingredients.isEmpty()) {
            return foundRecipes;
        }

        //all ingredients are entered by user
        if (ingredients.size() == 3) {
            cursor = getResultsForAllIngr(db, queryBase, ingredients.get(0), ingredients.get(1), ingredients.get(2));

            if (cursor.getCount() < 1) {
                cursor = getResultsForTwoIngr(db, queryBase, ingredients.get(0), ingredients.get(1));
            }

            if (cursor.getCount() < 1) {
                cursor = getResultsForTwoIngr(db, queryBase, ingredients.get(0), ingredients.get(2));
            }

            if (cursor.getCount() < 1) {
                cursor = getResultsForTwoIngr(db, queryBase, ingredients.get(1), ingredients.get(2));
            }

            if (cursor.getCount() < 1) {
                cursor = getResultsForOneIngr(db, queryBase, ingredients.get(0));
            }

            if (cursor.getCount() < 1) {
                cursor = getResultsForOneIngr(db, queryBase, ingredients.get(1));
            }

            if (cursor.getCount() < 1) {
                cursor = getResultsForOneIngr(db, queryBase, ingredients.get(2));
            }
        }

        //two ingredients are entered by user
        if (ingredients.size() == 2) {
            cursor = getResultsForTwoIngr(db, queryBase, ingredients.get(0), ingredients.get(1));
            if (cursor.getCount() < 1) {
                cursor = getResultsForOneIngr(db, queryBase, ingredients.get(0));
            }

            if (cursor.getCount() < 1) {
                cursor = getResultsForOneIngr(db, queryBase, ingredients.get(1));
            }
        }

        //only one ingredient is entered by user
        if (ingredients.size() == 1) {
            cursor = getResultsForOneIngr(db, queryBase, ingredients.get(0));
        }

        createRecipes(cursor, foundRecipes);
        db.close();
        return foundRecipes;
    }

    private int getTypeID(Controller c, SQLiteDatabase db) {
        int typeID = 1;
        String queryType = "SELECT id FROM Type WHERE value=" + '"' + c.type + '"';
        Cursor typeCursor = db.rawQuery(queryType, null);
        while (typeCursor.moveToNext()) {
            typeID = typeCursor.getInt(0);
        }
        return typeID;
    }

    private int getCategoryID(Controller c, SQLiteDatabase db) {
        int categoryID = 1;
        String queryCategory = "SELECT id FROM Category WHERE value=" + '"' + c.category + '"';
        Cursor categoryCursor = db.rawQuery(queryCategory, null);
        while (categoryCursor.moveToNext()) {
            categoryID = categoryCursor.getInt(0);
        }
        return categoryID;
    }

    private List<String> getIngredients(Controller c) {
        List<String> result = new ArrayList<>();
        if (!c.ingredientOne.isEmpty()) {
            result.add(c.ingredientOne);
        }

        if (!c.ingredientTwo.isEmpty()) {
            result.add(c.ingredientTwo);
        }

        if (!c.ingredientThree.isEmpty()) {
            result.add(c.ingredientThree);
        }

        return result;
    }

    private Cursor getResultsForAllIngr(SQLiteDatabase db, StringBuffer queryAll, String ingredientOne, String ingredientTwo, String ingredientThree) {
        queryAll.append(" AND M.ingredients LIKE ?"
                + " AND M.ingredients LIKE ?"
                + " AND M.ingredients LIKE ?");

        return db.rawQuery(queryAll.toString(), new String[]{"%" + ingredientOne + "%",
                "%" + ingredientTwo + "%",
                "%" + ingredientThree + "%"});
    }

    private Cursor getResultsForTwoIngr(SQLiteDatabase db, StringBuffer queryAll, String ingredientOne, String ingredientTwo) {
        queryAll.append(" AND M.ingredients LIKE ?"
                + " AND M.ingredients LIKE ?");

        return db.rawQuery(queryAll.toString(), new String[]{"%" + ingredientOne + "%",
                "%" + ingredientTwo + "%"});
    }

    private Cursor getResultsForOneIngr(SQLiteDatabase db, StringBuffer queryAll, String ingredientOne) {
        queryAll.append("AND M.ingredients LIKE ?");

        return db.rawQuery(queryAll.toString(), new String[]{"%" + ingredientOne + "%"});
    }

    private void createRecipes(Cursor cursor, List<Meal> result) {
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
                result.add(meal);
            }
        }
    }

}