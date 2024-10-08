public class Polymorphism1 {
    public static int pow (int a, int b) {System.out.println("first");
	if (b <= 0)
	    return 1;
	return a*Polymorphism1.pow(a, b-1);
	}

    public static double pow (double a, int b) {System.out.println("second");
	if (b <= 0)
	    return 1.0;
	return a*Polymorphism1.pow(a, b-1);
    }
    
    /* public static int pow (double a, int b) {System.out.println("third");
	if (b <= 0)
	    return 1;
	return ((int) a)*Polymorphism1.pow(a, b-1);
	}*/
    
    public static double pow(int a, double b) {System.out.println("fourth");
       	if(b < 1)
	    return 1;
	return a*Polymorphism1.pow(a, b-1);
	}

    public static void main(String[] args) {
	System.out.println(Polymorphism1.pow(2, 3));
	System.out.println(Polymorphism1.pow(2.0, 3));
	System.out.println(Polymorphism1.pow(2, 3.0));
    }
}

/* In Java, method overloading is allowed. This means that a programmer can write two methods that have the same name but take different parameters. Notice that the first definition above takes two integers, the second takes a double and an int, and the fourth takes an int and a double. Java knows which definition to use based on the types of the arguments that get passed in when the method is called. For method overloading to work in Java, it is necessary that the parameters are different in number, type, and/or order. The third definition is commented out because this is not legal due to the fact that the parameters match those of the second definition in type, number, and order. The return types of the two methods are different, but that is not enough for Java to determine which method should be used. Some languages do allow overloading of methods that only differ in return type, but most do not. This is because it is much easier for a compiler to determine which method to use based on the types of the arguments than on the type that is returned. */
	
