package com.example.reciepereccomender;

public class Meal
{

    Integer idCategory;
    String ingredients;
    String steps;
    String calories;
    String prepTime;
    String mealImg;
    String name;
    String image;

    public Meal(){}

    public Meal(Integer id, Integer idCategory, String ingredients, String steps, String calories,String prepTime,String mealImg,String name,String image) {
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    Integer id;

    public Integer getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(Integer idCategory) {
        this.idCategory = idCategory;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getSteps() {
        return steps;
    }

    public void setSteps(String steps) {
        this.steps = steps;
    }

    public String getCalories() {
        return calories;
    }

    public void setCalories(String calories) {
        this.calories = calories;
    }

    public String getPrepTime() {
        return prepTime;
    }

    public void setPrepTime(String prepTime) {
        this.prepTime = prepTime;
    }

    public String getMealImg() {
        return mealImg;
    }

    public void setMealImg(String mealImg) {
        this.mealImg = mealImg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}