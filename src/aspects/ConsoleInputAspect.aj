package aspects;

public aspect ConsoleInputAspect {
	pointcut checkRecipeMaxIngredientSize(int amount):
		args(amount) &&
		call(* coffeemaker.Recipe.setAmt*(int));
	
	before(int amount): checkRecipeMaxIngredientSize(amount){
		//System.out.println("Recipe before weave");		
		//System.out.println("The amount set is : " + amount);
		if(amount > 30){
			throw new IllegalArgumentException();
		}
	}
}


