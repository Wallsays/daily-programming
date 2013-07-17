public class Main {

	static String[] digits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

	public static void Main(string[] args)        
	{
	    int N = 892347971; 
	    String str = string.Empty;

	    while(N > 0)
	    {
	        str = digits[N - ((N / 10) * 10)] + str;
	        N = N / 10;
	    }
	    Systen.out.println(str); 
	}
    
}
