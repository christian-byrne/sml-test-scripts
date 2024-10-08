public class FooChild extends Foo {
    public FooChild(int x, int y) {
	super(x, y);
    }

    public static void main(String[] args) {
	FooChild one = new FooChild(3, 4);
	System.out.println(one.add());
	/* This statement works because FooChild
	 * inherits the "add" method from its parent
	 * class, Foo. */
    }
}
