public class Main {
    String variable;
    public static void main(String[] args) {
        System.out.println("Hello World!");
        B b = new B(); // output ???
    }
 
    public Main(){
     printVariable();
    }
 
    protected void printVariable(){
        variable = "variable is initialized in Main Class";
    }
}
 
class B extends Main {
    String variable = null; // and when not initialized ?
 
    public B(){
        System.out.println("variable value = " + variable);
    }
 
    protected void printVariable(){
        variable = "variable is initialized in B Class";
    }
}
