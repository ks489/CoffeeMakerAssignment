package aspects;

public aspect InventoryTrace {
	pointcut checkRecipeMaxIngredientSize(int amount):
		args(amount) &&
		execution(* coffeemaker.CoffeeMaker.addInventory(int, int, int, int));
	
	before(int amount): checkRecipeMaxIngredientSize(amount){
		//System.out.println("Recipe before weave");		
		//System.out.println("The amount set is : " + amount);
		if(amount > 30){
			throw new IllegalArgumentException();
		}
	}
	
	//after(): 
}
