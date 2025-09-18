import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {

    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals(-5, result, "-2 + -3 should equal -5");
    }

    @Test
    public void testAddPositiveAndNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, -3);
        assertEquals(2, result, "5 + (-3) should equal 2");
    }

    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 5);
        assertEquals(5, result, "0 + 5 should equal 5");
    }
}