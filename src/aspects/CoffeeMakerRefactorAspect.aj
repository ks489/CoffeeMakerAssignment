package aspects;

import coffeemaker.CoffeeMaker;
import coffeemaker.Recipe;
import coffeemaker.Inventory;

class Main {} 

public aspect CoffeeMakerRefactorAspect {
	
	//Extend Recipe Class for Vanilla Syrup
	public int Recipe.amtVanillaSyrup;
	
	public int Recipe.getAmtVanillaSyrup() {
        return amtVanillaSyrup;
    }
    public void Recipe.setAmtVanillaSyrup(int amtVanillaSyrup1) {
    	if(amtVanillaSyrup1 >= 0) {
    		this.amtVanillaSyrup = amtVanillaSyrup1;
    	}
    	else {
    		this.amtVanillaSyrup = 0;
    	}
    }
	
    //Extend Inventory Class for Vanilla Syrup
    private static int Inventory.vanilla;
    
    public int Inventory.getVanilla(){
    	return vanilla;
    }
    
    public void Inventory.setVanilla(int vanilla1) {
    	if(vanilla1 >= 0) {
    		Inventory.vanilla = vanilla1;
    	}
    	else {
    		Inventory.vanilla = 0;
    	}        
    }
	
	//pointcut for when creating an inventory
	pointcut addInventoryVanillaSyrup(Inventory inv):
		this(inv) &&
		initialization(Inventory.new());// &&
	
	after(Inventory inv) : addInventoryVanillaSyrup(inv){
		inv.setVanilla(15);
		System.out.println("WE HAVE MADE IT HERE");
	}
	
	//toString
	pointcut printToString(Inventory inv):
		this(inv) &&
		call(* coffeemaker.Inventory.toString(..));// &&
	
	before(Inventory inv): printToString(inv){
		System.out.println("PRINTING");	
	}
	
	pointcut printToString1():
		call(* coffeemaker.Inventory.toString(..));// &&
	
	before(): printToString1(){
		System.out.println("PRINTING");	
	}
	
	
	
	pointcut checkEnoughIngredients(Inventory inv, Recipe re):
		this(inv) &&
		args(re) &&
		call(* coffeemaker.Inventory.enoughIngredients(Recipe));// &&
	
		//execution(* coffeemaker.CoffeeMaker.makeCoffee(Recipe, int));
	before(Inventory inv, Recipe re): checkEnoughIngredients(inv, re){
		System.out.println("sdfsdfsdfdsf");
	
	}
	after(Inventory inv, Recipe re) returning(boolean isEnough) : checkEnoughIngredients(inv, re){
		System.out.println("Changing return value");
		if(inv.getVanilla() < re.getAmtVanillaSyrup()){			
			isEnough = false;
		}	
	}
	

	

}
