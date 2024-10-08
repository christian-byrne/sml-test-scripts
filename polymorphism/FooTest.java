public class FooTest {
    public static boolean equals(Foo x, Foo y) {
	return x.add() == y.add();
    }

    public static void main(String[] args) {
	Foo x = new Foo(2, 2);
	FooChild y = new FooChild(7, 7);
	System.out.println(FooTest.equals(x, x));
	System.out.println(FooTest.equals(x, new Foo(3, 3)));
	System.out.println(FooTest.equals(y, new Foo(11, 3)));
	System.out.println(FooTest.equals(x, y));
	System.out.println(FooTest.equals(y, x));
    }
}

/* This is where we see subtype polymorphism.
 * The equals method is defined to work for items of
 * type Foo. But the tests below show that it
 * works on items of type Foo and items of type FooChild.
 */

