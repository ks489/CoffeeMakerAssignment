package aspects;

import coffeemaker.Recipe;

/* Question 1
 * This aspect will that any recipe items do not exceed 30
 * We check this by the set method in Recipe
 */

public aspect RecipeCheck {
	pointcut checkRecipeMaxIngredientSize(int amount):
		args(amount) &&
		call(* coffeemaker.Recipe.setAmt*(int));
	//Throw an exception when a recipe item exceeds 30
	before(int amount): checkRecipeMaxIngredientSize(amount){
		if(amount > 30){
			throw new IllegalArgumentException();
		}
	}
	
}
