public class Polymorphism2 {
    public static void main(String[] args) {
	//promotion
	double x = 2*8.2;
	/* In the statement above, * works on the two numbers because of 
	 * a type of implicit type conversion called promotion. In this kind
 	 * of coercion, a value of a smaller type is automatically converted to a larger
	 * type (in this case int to double), which then allows the multiplication
	 * operator to be applied. The result will be a double as well. Note that
	 * not all languages will do this. SML, for example, will not.
	 */

	//function call--polymorphic
	System.out.println(Polymorphism2.f((byte) 2));
	System.out.println(Polymorphism2.f((short) 2));
	System.out.println(Polymorphism2.f('a'));
	System.out.println(Polymorphism2.f(3));
	System.out.println(Polymorphism2.f(4L));
	System.out.println(Polymorphism2.f(5.6F));

	/* All of the statements above are legal in Java because in each 
	 * case, the value that is passed in is of a type that is equal or
	 * smaller than a double, which is the type of f's parameter.
	 * This is more implicit type coercion, which is a form of polymorphism.
	 * Note that we are dealing with primitive data here, not objects.
	 * But what is happening is that the method is expecting a double, 
	 * and all of these values can be automatically converted to a double
	 * because it would not result in loss of data.
   	 */
	
	//what happens here?
	int y = (int)2.0;
	/* In this case, we are trying to put a double into a space reserved
	 * for an integer. This will not be done automatically in Java because 
	 * doubles are larger than integers, so there would be potential data loss.
	 * Here, the programmer must specify that they want the conversion to take
 	 * place with explicit casting.
	 */

	//function call--polymorphic
	System.out.println(Polymorphism2.g((byte) 1));
	System.out.println(Polymorphism2.g((short) 2));
	System.out.println(Polymorphism2.g('a'));
	//System.out.println(Polymorphism2.g(3.0));
	//System.out.println(Polymorphism2.g(4L));
	//System.out.println(Polymorphism2.g(5.6F));

	/* The parameter expected by method g above is an integer.
	 * So the first three statements work because bytes, shorts, 
	 * and chars are all small enough to fit into an integer spot.
	 * This is why the implicit type coercion can happen.
	 * But in the last three cases, the statements would produce errors
	 * because doubles, longs, and floats are too big to fit into 
	 * an integer spot. Therefore, the implicit type conversion cannot
	 * be done. Explicit casting would be necessary to make these work.
	 */
	

	Polymorphism2.h('a', 5);
	/* Here, there are two options for h that
	 * would work with these arguments because chars can be
	 * converted to integers. However, it will use the 
	 * method that is closest to the arguments passed in. In other
	 * words, Java will not do the implicit conversion unless it 
	 * is necessary. */

	//Polymorphism2.h('a','b');
	/* This line is commented out because it will not compile,
	 * which may seem odd since chars can be converted to integers
	 * so any one of the h definitions could work with these arguments.
	 * We know that Java will do as little conversion as necessary, so 
	 * it will not choose h1 over the other two. The problem is that
	 * h2 and h3 require the exact same amount of conversion, so
	 * Java does not know what to do--so it just doesn't allow it.
	 */
    }

    public static double f (double x) {System.out.println("f1");
	return x;
    }

    public static int g (int x) {
	return x;
    }

    //Where things get tricky...
      
    /*public static int f(int x) {System.out.println("f2");
	return x*x;
	}*/
    
    public static void h(int x, int y) {
	System.out.println("h1");
    }

    public static void h(char x, int y) {
	System.out.println("h2");
    }

    public static void h(int x, char y) {
	System.out.println("h3");
    }
}
