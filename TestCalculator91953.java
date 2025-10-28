import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TestCalculator91953 {
    
    // Calculator class with add method to be tested
    public static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }
    
    @Test
    public void testAddMethod() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
        
        // Test with zero
        assertEquals(7, calculator.add(7, 0), "7 + 0 should equal 7");
        assertEquals(3, calculator.add(0, 3), "0 + 3 should equal 3");
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3), "-4 + 3 should equal -1");
        assertEquals(-7, calculator.add(-4, -3), "-4 + -3 should equal -7");
        
        // Test with large numbers
        assertEquals(2000000000, calculator.add(1000000000, 1000000000), 
                    "1000000000 + 1000000000 should equal 2000000000");
    }
}