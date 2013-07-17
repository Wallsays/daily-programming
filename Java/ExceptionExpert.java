public class ExceptionExpert {

	public static void Main(string[] args)        
	{
		try {
	      System.out.println("begin");
	      Object a = null;
	      a.toString();
	      System.out.println("end");
	      return 1;
		} catch (Exception e) {
		    System.out.println("exception");
		    return 2;
		} finally {
		    System.out.println("finally");
		    return 3;
		}


	}
    
}
