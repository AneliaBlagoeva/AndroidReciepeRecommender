package com.example.reciepereccomender;

public class Controller {
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String category;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String type;

    public String getIngredientOne() {
        return ingredientOne;
    }

    public void setIngredientOne(String ingredientOne) {
        this.ingredientOne = ingredientOne;
    }

    public String ingredientOne;

    public String getIngredientTwo() {
        return ingredientTwo;
    }

    public void setIngredientTwo(String ingredientTwo) {
        this.ingredientTwo = ingredientTwo;
    }

    public String ingredientTwo;

    public String getIngredientThree() {
        return ingredientThree;
    }

    public void setIngredientThree(String ingredientThree) {
        this.ingredientThree = ingredientThree;
    }

    public String ingredientThree;

    public Controller() {
        this.type = "Без режим";
        this.category="Закуска";
        this.ingredientOne = new String();
        this.ingredientTwo = new String();
        this.ingredientThree = new String();
    }

    public Controller(String category, String type, String ingredientOne, String ingredientTwo, String ingredientThree) {
        this.category = category;
        this.type = type;
        this.ingredientOne = ingredientOne;
        this.ingredientTwo = ingredientTwo;
        this.ingredientThree = ingredientThree;
    }
}
