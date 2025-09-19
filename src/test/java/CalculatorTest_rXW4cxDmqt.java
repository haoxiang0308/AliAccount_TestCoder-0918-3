import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest_rXW4cxDmqt {
    
    private Calculator calculator;
    
    @BeforeEach
    public void setUp() {
        calculator = new Calculator();
    }
    
    @Test
    public void testAddPositiveNumbers() {
        assertEquals(5, calculator.add(2, 3), "Adding 2 and 3 should equal 5");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        assertEquals(-5, calculator.add(-2, -3), "Adding -2 and -3 should equal -5");
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        assertEquals(1, calculator.add(3, -2), "Adding 3 and -2 should equal 1");
    }
    
    @Test
    public void testAddWithZero() {
        assertEquals(7, calculator.add(7, 0), "Adding 7 and 0 should equal 7");
        assertEquals(-3, calculator.add(-3, 0), "Adding -3 and 0 should equal -3");
    }
}