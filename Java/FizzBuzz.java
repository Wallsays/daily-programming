public class FizzBuzz {
    
    public static void main(String[] args) {
       fizzBuzzClear();
       fizzBuzzDRY();
       fizzBuzzDRY_2();
    }

    public static void fizzBuzzClear(){
        for (int i = 1; i <= 100; i++) {
            if (i % 15 == 0) {
                System.out.println("FizzBuzz");
            } else if (i % 3 == 0) {
                System.out.println("Fizz");
            } else if (i % 5 == 0) {
                System.out.println("Buzz");
            } else {
                System.out.println(String.valueOf(i));
            }
        }
    }

    public static void fizzBuzzDRY(){
        final String EMPTY = "";
        for (int i = 1; i <= 100; i++) {
            String value = EMPTY;
            if (i % 3 == 0) value += "Fizz";
            if (i % 5 == 0) value += "Buzz";
            if (value == EMPTY) value += i;
            System.out.println(value);
        }
    }

    public static void fizzBuzzDRY_2(){
        StringBuilder builder = new StringBuilder(1000);
        for (int i = 1; i <= 100; i++) {
            final int length = builder.length();
            if (i % 3 == 0) builder.append("Fizz");
            if (i % 5 == 0) builder.append("Buzz");
            if (length == builder.length()) builder.append(i);
            builder.append('\n');
        }
        System.out.println(builder);
    }


}