public class Polymorphism3 {
    public static void main(String[] args) {
	int a = 1;
	int b = 2;
	double x = 1.1;
	double y = 2.2;
	String s = "hi";
	String t = "bye";

	System.out.println(a + b + s);//3hi
	System.out.println(s + a + b);//hi12
	System.out.println(s + (a + b));//hi3
	System.out.println(a + x);//2.1
	System.out.println(x + y);//3.3
	System.out.println(a + s);//1hi
	System.out.println(s + y);//hi2.2 
	System.out.println(s + t);//hibye
    }
}

/***
 * First, let's note that println is overloaded to handle the various primitive data types as 
 * well as Strings.
 * Second, the "+" operator is overloaded. When the arguments are integers, it adds them 
 * together. When the arguments are doubles, it adds them together. When the arguments 
 * are Strings, it concatenates them.
 * Finally, there is a lot of implicit type coercion happening. 
 * In the first print
 * statement, the a and b are added together and then converted to a String that is 
 * concatenated with s. 
 * In the second print statement, a is converted to a String and
 * concatenated with s. Then b is converted to a String and concatenated with the "hi1". 
 * This is because + is left-associative and will be applied from left to right unless
 * parentheses are used to override the associativity, 
 * which is what happens in the
 * third print statement. There, the addition is done first because of the parenthesis, then
 * the type coercion and concatenation. 
 * In the fourth print statement, the integer is converted to a double before adding.
 * In the fifth print statement, no coercion is needed as they are both doubles.
 * In the sixth print statement, the double is converted to a String before concatenation.
 * In the seventh print statement, no coercion is needed as they are both Strings. */

