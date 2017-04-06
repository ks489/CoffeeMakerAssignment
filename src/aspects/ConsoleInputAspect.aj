package aspects;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import coffeemaker.CoffeeMaker;

public aspect ConsoleInputAspect {
	pointcut consoleReadLine():
		call(public java.lang.String java.io.BufferedReader.readLine());
	
	after() returning(String retString): consoleReadLine(){
		if (tryParseInt(retString)) {  
		   int number = Integer.parseInt(retString);
		   if(number < 0){
			   System.out.println("Input value from console is below 0");
		   }		   
		}
	}
	
	private static boolean tryParseInt(String value){
		try {  
	         Integer.parseInt(value);  
	         return true;  
	      } catch (NumberFormatException e) {  
	         return false;  
	      }  
	}
}



