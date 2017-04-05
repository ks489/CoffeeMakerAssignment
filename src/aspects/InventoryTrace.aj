package aspects;

public aspect InventoryTrace {
	pointcut inventoryCheck(int amtCoffee, int amtMilk, int amtSugar, int amtChocolate):
		args(amtCoffee, amtMilk, amtSugar, amtChocolate) &&
		execution(* coffeemaker.CoffeeMaker.addInventory(int, int, int, int));
	
	before(amtCoffee, amtMilk, amtSugar, amtChocolate): inventoryCheck(int amtCoffee, int amtMilk, int amtSugar, int amtChocolate){
		//System.out.println("Recipe before weave");		
		//System.out.println("The amount set is : " + amount);
		if(amount > 30){
			throw new IllegalArgumentException();
		}
	}	
	//after(): 
}
