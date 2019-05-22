package com.example.reciepereccomender;

public class Controller {
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

    public String getIngredientTheree() {
        return ingredientTheree;
    }

    public void setIngredientTheree(String ingredientTheree) {
        this.ingredientTheree = ingredientTheree;
    }

    public String ingredientTheree;

    public Controller() {
    }

    public Controller(String type, String ingredientOne, String ingredientTwo, String ingredientTheree) {
        this.type = type;
        this.ingredientOne = ingredientOne;
        this.ingredientTwo = ingredientTwo;
        this.ingredientTheree = ingredientTheree;
    }
}
