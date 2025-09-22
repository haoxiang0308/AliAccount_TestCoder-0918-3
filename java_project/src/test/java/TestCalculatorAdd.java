import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TestCalculatorAdd {

    @Test
    public void testAddPositiveNumbers() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(2, 3), "2 + 3 should equal 5");
    }

    @Test
    public void testAddNegativeNumbers() {
        Calculator calc = new Calculator();
        assertEquals(-5, calc.add(-2, -3), "-2 + -3 should equal -5");
    }

    @Test
    public void testAddZero() {
        Calculator calc = new Calculator();
        assertEquals(7, calc.add(7, 0), "7 + 0 should equal 7");
    }
}