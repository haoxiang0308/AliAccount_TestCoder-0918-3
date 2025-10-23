import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

/**
 * JUnit test for Calculator add method
 */
public class CalculatorTest03121 {
    
    /**
     * Test case for the add method
     */
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3), "-4 + 3 should equal -1");
        
        // Test with zero
        assertEquals(7, calculator.add(7, 0), "7 + 0 should equal 7");
        assertEquals(-3, calculator.add(0, -3), "0 + (-3) should equal -3");
        
        // Test both zeros
        assertEquals(0, calculator.add(0, 0), "0 + 0 should equal 0");
    }
}

/**
 * Simple Calculator class for demonstration
 */
class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
}