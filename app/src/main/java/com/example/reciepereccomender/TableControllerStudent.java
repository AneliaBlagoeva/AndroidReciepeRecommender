package com.example.reciepereccomender;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import java.util.ArrayList;
import java.util.List;

public class TableControllerStudent extends DatabaseHandler {

    public TableControllerStudent(Context context) {
        super(context);
    }

    public List<Meal> read() {

        List<Meal> recordsList = new ArrayList<Meal>();

        String sql = "SELECT * FROM Meal ORDER BY id DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(sql, null);

        if (cursor.moveToFirst()) {
            do {
                int id = Integer.parseInt(cursor.getString(cursor.getColumnIndex("idMeal")));

                Meal obj = new Meal();
                obj.setId(id);

                recordsList.add(obj);

            } while (cursor.moveToNext());
        }

        cursor.close();
        db.close();

        return recordsList;
    }
}
