package aspects;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import coffeemaker.CoffeeMaker;

/* Question 3
 * Check that the input is an integer and that it is positive
 */
public aspect ConsoleInputAspect {
	pointcut consoleReadLine():
		call(public java.lang.String java.io.BufferedReader.readLine());
	
	//parse value to int and check if the value is not less than 0 for negative values
	after() returning(String retString): consoleReadLine(){
		if (tryParseInt(retString)) {  
		   int number = Integer.parseInt(retString);
		   if(number < 0){
			   System.out.println("Input value from console is below 0");
		   }		   
		}
	}
	
	//internal function to see if the input is of type integer
	private static boolean tryParseInt(String value){
		try {  
	         Integer.parseInt(value);  
	         return true;  
	      } catch (NumberFormatException e) {  
	         return false;  
	      }  
	}
}



