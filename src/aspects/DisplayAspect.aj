package aspects;

import coffeemaker.Inventory;
import coffeemaker.Main;

/* Question 4
 * Refactor question. We abstracted anything related to console display
 * and printing to the console. The original source code has commented out 
 * code that has been replaced inside this aspect to show that we weave
 * the original functionality back into the original source code
 */
public aspect DisplayAspect {
	
	//Original print menu for the coffee maker.
	//Abstracted internally to be called multiple times
	//From pointcuts
	public static void Main.mainMenu() {
	    System.out.println("1. Add a recipe");
	    System.out.println("2. Delete a recipe");
	    System.out.println("3. Edit a recipe");
	    System.out.println("4. Add inventory");
	    System.out.println("5. Check inventory");
	    System.out.println("6. Make coffee");
	    System.out.println("0. Exit\n");
	    
	    //Get user input
	    int userInput = stringToInt(inputOutput("Please press the number that corresponds to what you would like the coffee maker to do."));
	    
	    if(userInput == 1) addRecipe();
	    if(userInput == 2) deleteRecipe();
	    if(userInput == 3) editRecipe();
	    if(userInput == 4) addInventory();
	    if(userInput == 5) checkInventory();
	    if(userInput == 6) makeCoffee();
	    if(userInput == 0) System.exit(0);
	}
	
	//All methods caught to display the menu options and any additional
	//console display messages
	
	pointcut addInventoryMethod():
		call(* coffeemaker.Main.addInventory());// &&
	
	after(): addInventoryMethod(){
		System.out.println("Got the add inventory method");
		Main.mainMenu();
	}
	
	pointcut checkInventoryMethod():
		call(* coffeemaker.Main.checkInventory());// &&
	
	after(): checkInventoryMethod(){
		System.out.println("Got the check inventory method");
		Main.mainMenu();
	}
	
	pointcut makeCoffeeMethod():
		call(* coffeemaker.Main.makeCoffee());// &&
	
	after(): makeCoffeeMethod(){
		System.out.println("Got the make coffee method");
		Main.mainMenu();
	}
	
	pointcut mainMethod():
		execution(public static void coffeemaker.Main.main(String[]));// &&
	
	after(): mainMethod(){
		System.out.println("Got the main(string[]) method");
		Main.mainMenu();
	}	
	
	pointcut addRecipeMethod():
		call(* coffeemaker.Main.addRecipe());// &&
	
	after(): addRecipeMethod(){
		System.out.println("Got the add recipe method");
		Main.mainMenu();
	}
	
	pointcut deleteRecipeMethod():
		call(* coffeemaker.Main.deleteRecipe());// &&
	
	after(): deleteRecipeMethod(){
		System.out.println("Got the delete recipe method");
		Main.mainMenu();
	}
	
	pointcut editRecipeMethod():
		call(* coffeemaker.Main.editRecipe());// &&
	
	after(): editRecipeMethod(){
		System.out.println("Got the edit recipe method");
		Main.mainMenu();
	}
	
	pointcut stringToIntMethod():
		call(* coffeemaker.Main.stringToInt(String));// &&
	
	after() returning(int returnInt) : stringToIntMethod(){
		System.out.println("Got the string to int method");
		if(returnInt < 0){
			Main.mainMenu();
		}
	}
	
	pointcut handlerMethod():
		handler(java.io.IOException) &&
		cflow(call(* coffeemaker.Main.stringToInt(String)));// &&
	
	before(): handlerMethod(){
		System.out.println("Got the edit recipe method");
		Main.mainMenu();
	}
}
