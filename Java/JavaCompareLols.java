public class JavaCompareLols {

	public static void Main(string[] args)        
	{
		String a = "ab";
		String b = "b";
		 
		System.out.println(a == "ab");
		System.out.println(a == "a" + "b");
		System.out.println("a" + b == "ab");
		System.out.println(("a" + b).intern() == "ab");
	    
		System.out.println("-------");

		Integer a = 120;
		Integer b = 120;
		 
		Integer c = 130;
		Integer d = 130;
		 
		System.out.println(a == b);
		System.out.println(c == d);

	}
    
}
