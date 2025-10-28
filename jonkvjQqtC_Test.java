import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class jonkvjQqtC_Test {
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test zero
        assertEquals(7, calculator.add(0, 7));
        assertEquals(9, calculator.add(9, 0));
        
        // Test both negative
        assertEquals(-8, calculator.add(-3, -5));
    }
}