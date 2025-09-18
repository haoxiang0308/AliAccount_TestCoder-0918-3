import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {
    
    private Calculator calculator;
    
    @BeforeEach
    void setUp() {
        calculator = new Calculator();
    }
    
    @Test
    void testAddPositiveNumbers() {
        assertEquals(5, calculator.add(2, 3));
    }
    
    @Test
    void testAddNegativeNumbers() {
        assertEquals(-5, calculator.add(-2, -3));
    }
    
    @Test
    void testAddPositiveAndNegative() {
        assertEquals(1, calculator.add(3, -2));
    }
    
    @Test
    void testAddWithZero() {
        assertEquals(7, calculator.add(7, 0));
        assertEquals(7, calculator.add(0, 7));
    }
    
    @Test
    void testAddLargeNumbers() {
        assertEquals(2000000, calculator.add(1000000, 1000000));
    }
}