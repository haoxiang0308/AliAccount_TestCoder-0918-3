import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {
    
    private Calculator calculator;
    
    @BeforeEach
    public void setUp() {
        calculator = new Calculator();
    }
    
    @Test
    public void testAddPositiveNumbers() {
        assertEquals(5, calculator.add(2, 3));
    }
    
    @Test
    public void testAddNegativeNumbers() {
        assertEquals(-5, calculator.add(-2, -3));
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        assertEquals(1, calculator.add(3, -2));
    }
    
    @Test
    public void testAddWithZero() {
        assertEquals(7, calculator.add(7, 0));
        assertEquals(7, calculator.add(0, 7));
    }
    
    @Test
    public void testAddLargeNumbers() {
        assertEquals(2000000, calculator.add(1000000, 1000000));
    }
}