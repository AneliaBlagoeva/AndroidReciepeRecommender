package com.example.searchservice;

public class Meal
{
    Integer id;
    Integer idCategory;
    String ingredients;
    String steps;
    String calories;
    String prepTime;
    String mealImg;
    String name;
    String image;

    Meal(Integer id, Integer idCategory, String ingredients, String steps, String calories,String prepTime,String mealImg,String name,String image) {
        this.id = id;
        this.idCategory = idCategory;
        this.ingredients = ingredients;
        this.steps = steps;
        this.calories = calories;
        this.prepTime = prepTime;
        this.mealImg = mealImg;
        this.name = name;
        this.image = image;
    }

}