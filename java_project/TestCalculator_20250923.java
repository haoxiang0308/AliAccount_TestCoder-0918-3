import org.junit.Test;
import static org.junit.Assert.*;

public class TestCalculator_20250923 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result);
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals(-5, result);
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        Calculator calc = new Calculator();
        int result = calc.add(5, -3);
        assertEquals(2, result);
    }
    
    @Test
    public void testAddZero() {
        Calculator calc = new Calculator();
        int result = calc.add(0, 5);
        assertEquals(5, result);
        
        result = calc.add(5, 0);
        assertEquals(5, result);
        
        result = calc.add(0, 0);
        assertEquals(0, result);
    }
}