import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class CalculatorTest {

    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    // A simple Calculator class for demonstration
    // In a real scenario, this would be in its own file
    static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }
}