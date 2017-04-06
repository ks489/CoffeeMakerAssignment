package aspects;

import coffeemaker.CoffeeMaker;
import coffeemaker.Recipe;

class Main {} 

public aspect CoffeeMakerRefactorAspect {
	public String amtVanillaSyrup;
	
	public int Recipe.getAmtVanillaSyrup() {
        return amtVanillaSyrup;
    }
    /*public void Recipe.setAmtVanillaSyrup(int amtChocolate) {
    	if(amtChocolate >= 0) {
    		this.amtChocolate = amtChocolate;
    	}
    	else {
    		this.amtChocolate = 0;
    	}
    }*/
	
	
	public String Main.hello;
	public void Main.Check(){
		System.out.println("Check method called");
		//this.name = "";
	}
	
	pointcut summerSpecialAddVanillaSyrup(CoffeeMaker cm):
		target(cm) &&
		execution(* coffeemaker.CoffeeMaker.makeCoffee(Recipe, int));
	
	before(CoffeeMaker cm) : summerSpecialAddVanillaSyrup(cm){
		
		System.out.println("SSSSSSSSSSSSSSSSS");
	}
}
