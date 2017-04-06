package aspects;

import coffeemaker.CoffeeMaker;
import coffeemaker.Inventory;

public aspect InventoryTrace {
	
	pointcut inventoryCheck(int amtCoffee, int amtMilk, int amtSugar, int amtChocolate, CoffeeMaker cm):
		args(amtCoffee, amtMilk, amtSugar, amtChocolate) &&
		target(cm) &&
		execution(* coffeemaker.CoffeeMaker.addInventory(int, int, int, int));
	
	before(int amtCoffee, int amtMilk, int amtSugar, int amtChocolate, CoffeeMaker cm): inventoryCheck(amtCoffee, amtMilk, amtSugar, amtChocolate, cm){

		System.out.println("Parameter Coffee " + amtCoffee);
		System.out.println("Parameter Milk " + amtMilk);
		System.out.println("Parameter Sugar " + amtSugar);
		System.out.println("Parameter Chocolate " + amtChocolate);
		
		Inventory inventory = cm.checkInventory();
		System.out.println("Original Inventory Coffee Value " + inventory.getCoffee());
		System.out.println("Original Inventory Milk Value " + inventory.getMilk());
		System.out.println("Original Inventory Sugar Value " + inventory.getSugar());
		System.out.println("Original Inventory Chocolate Value " + inventory.getChocolate());
			
	}
	
	after(int amtCoffee, int amtMilk, int amtSugar, int amtChocolate, CoffeeMaker cm): inventoryCheck(amtCoffee, amtMilk, amtSugar, amtChocolate, cm){
		Inventory inventory = cm.checkInventory();
		System.out.println("Modified Inventory Coffee Value " + inventory.getCoffee());
		System.out.println("Modified Inventory Milk Value " + inventory.getMilk());
		System.out.println("Modified Inventory Sugar Value " + inventory.getSugar());
		System.out.println("Modified Inventory Chocolate Value " + inventory.getChocolate());
		
		if(inventory.getCoffee() > 30){
			System.out.println("Coffee Inventory Item Overflow Value");
			inventory.setCoffee(30);
		}
		
		if(inventory.getMilk() > 30){
			System.out.println("Milk Inventory Item Overflow Value");
			inventory.setMilk(30);
		}
		
		if(inventory.getSugar() > 30){
			System.out.println("Sugar Inventory Item Overflow Value");
			inventory.setSugar(30);
		}
		
		if(inventory.getChocolate() > 30){
			System.out.println("Chocolate Inventory Item Overflow Value");
			inventory.setChocolate(30);
		}
		
		System.out.println("Final Inventory Coffee Value " + inventory.getCoffee());
		System.out.println("Final Inventory Milk Value " + inventory.getMilk());
		System.out.println("Final" + inventory.getSugar());
		System.out.println("Final Inventory Chocolate Value " + inventory.getChocolate());
	}	
	
}
