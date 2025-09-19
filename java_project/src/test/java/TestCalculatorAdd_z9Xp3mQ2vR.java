import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TestCalculatorAdd_z9Xp3mQ2vR {

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
    public void testAddPositiveAndNegative() {
        Calculator calc = new Calculator();
        assertEquals(1, calc.add(3, -2), "3 + -2 should equal 1");
    }

    @Test
    public void testAddWithZero() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(5, 0), "5 + 0 should equal 5");
        assertEquals(5, calc.add(0, 5), "0 + 5 should equal 5");
    }
}