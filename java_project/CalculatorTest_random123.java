import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {

    @Test
    public void testAddPositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    public void testAddNegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals(-5, result, "-2 + -3 should equal -5");
    }

    @Test
    public void testAddPositiveAndNegative() {
        Calculator calc = new Calculator();
        int result = calc.add(5, -3);
        assertEquals(2, result, "5 + (-3) should equal 2");
    }

    @Test
    public void testAddZero() {
        Calculator calc = new Calculator();
        int result = calc.add(0, 5);
        assertEquals(5, result, "0 + 5 should equal 5");
    }
}