import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class RandomCalculatorTest {
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(0, calculator.add(0, 0));
        
        // Test negative + negative
        assertEquals(-8, calculator.add(-3, -5));
    }
}