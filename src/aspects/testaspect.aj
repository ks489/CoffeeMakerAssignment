package aspects;

public aspect testaspect {
	pointcut funcName():
		call(* coffeemaker..*(..));
	
	before(): funcName(){
		System.out.println("before weave");
	}
	after(): funcName(){
		System.out.println("after weave");
	}
}
