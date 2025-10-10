import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class CalculatorAdditionTest {

    // A simple Calculator class for demonstration
    static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }

    @Test
    public void testAdd_PositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    public void testAdd_NegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals(-5, result, "-2 + (-3) should equal -5");
    }

    @Test
    public void testAdd_Zero() {
        Calculator calc = new Calculator();
        int result = calc.add(5, 0);
        assertEquals(5, result, "5 + 0 should equal 5");
    }
}