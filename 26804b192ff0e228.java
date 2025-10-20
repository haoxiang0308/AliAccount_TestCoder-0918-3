import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class _26804b192ff0e228Test {
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test with zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(-3, calculator.add(0, -3));
        
        // Test both zeros
        assertEquals(0, calculator.add(0, 0));
        
        // Test large numbers
        assertEquals(2000000000, calculator.add(1000000000, 1000000000));
    }
}