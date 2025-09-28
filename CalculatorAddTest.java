import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class CalculatorAddTest {

    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    public void testAddWithNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-1, 1);
        assertEquals(0, result, "-1 + 1 should equal 0");
    }

    @Test
    public void testAddWithZeros() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 0);
        assertEquals(0, result, "0 + 0 should equal 0");
    }
}