import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorTest {
    
    private Calculator calculator;
    
    @BeforeEach
    public void setUp() {
        calculator = new Calculator();
    }
    
    @Test
    public void testAddPositiveNumbers() {
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        assertEquals(-5, calculator.add(-2, -3), "-2 + -3 should equal -5");
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        assertEquals(1, calculator.add(3, -2), "3 + -2 should equal 1");
    }
    
    @Test
    public void testAddZero() {
        assertEquals(7, calculator.add(7, 0), "7 + 0 should equal 7");
    }
}